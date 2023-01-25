Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1113E67A953
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 04:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1qNF70ctz3fBK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 14:39:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FWTczkGq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jpoimboe@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FWTczkGq;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1qLH6CHyz3bhx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 14:38:15 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2448B6143A;
	Wed, 25 Jan 2023 03:38:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 392C0C433D2;
	Wed, 25 Jan 2023 03:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674617891;
	bh=4uS3feTw0NdsdG5j9CW0iXk86qPLpoPkIfhS+7MuwBk=;
	h=From:To:Cc:Subject:Date:From;
	b=FWTczkGqad6vrR5MnA61pukJK9ZQgmfUzqn5fhAfJ51yNdytxxJIXelAc7/0gt+Qz
	 P99aPLtECpEUIzZx5fKUhbF7sGzfIHEOeuW/dQWtgCZhMIheuOnq1BssJcaT6Abexo
	 cGeLvrBQIWls+CMQWfJ9XeRrgjIAZvr1vpYsXZ3lK2iXvrRgKJ/NptPayW0ORTKQVr
	 y9+F6n5AVq/ZPwD5m/fc/Q+cRhQ4kzw8aku3ESEB2uypkwdAMJz7x/B01ELedgrRV/
	 bBnipkAZn9ewYYG9tsZqJ0esbtKApmZlFEGfE0Hgx1qo8AGN+yqr2Ajf+SJMsn5XDd
	 rKmnRNNWwIcMg==
From: Josh Poimboeuf <jpoimboe@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH 0/2] powerpc: Fix livepatch module re-patching issue
Date: Tue, 24 Jan 2023 19:38:03 -0800
Message-Id: <cover.1674617130.git.jpoimboe@kernel.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-kernel@vger.kernel.org, Song Liu <song@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, live-patching@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fix a livepatch bug seen when reloading a patched module.

This is the powerpc counterpart to Song Liu's fix for a similar issue on
x86:

  https://lkml.kernel.org/lkml/20230121004945.697003-2-song@kernel.org

Josh Poimboeuf (2):
  powerpc/module_64: Improve restore_r2() return semantics
  powerpc/module_64: Fix "expected nop" error on module re-patching

 arch/powerpc/kernel/module_64.c | 29 ++++++++++++++++++-----------
 1 file changed, 18 insertions(+), 11 deletions(-)

-- 
2.39.0

