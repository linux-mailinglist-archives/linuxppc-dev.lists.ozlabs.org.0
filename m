Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0296E8998
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 07:22:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q25dP1msqz3fSj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 15:22:33 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m8kGCt/h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q25cb2wjWz3c8F
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Apr 2023 15:21:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=m8kGCt/h;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q25cb0QTXz4x1R;
	Thu, 20 Apr 2023 15:21:51 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681968111;
	bh=ZXen/WzawsH+0GeVVEogPOBIXUUySX1kSH3tWOgY4+8=;
	h=From:To:Subject:Date:From;
	b=m8kGCt/hO/gkLzBB6YPPTu4AYgcOMq2O8cVs330n89aiSKjGzois9i9nW39CQvpyR
	 1E52w6xIhgR/Cc49YCmwIwTJEZ4mIbVmz+WY696pC5RbJ5xdJDBYnksT2rxJLBRLND
	 UAywODhxJxIIf8GR5CRGnZq627fPbNNEsZJZ9wv4qJ7wV10lotqoQe1ER5T2ACUOtS
	 U4PbSmg2AtFkloRQBUvP65KwTUWLFTr3gVThdEAhaQQyywzhI7+cSMtcEM7VwyFinx
	 1HUTX3PhQj5I6mb9nQH6UhWIePu69LFYRHKRVa3+7zO5CIb089c/IvyB54ZYVewWjA
	 TxtnEn1ZwxhPg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH] powerpc/configs/powernv: Add IGB=y
Date: Thu, 20 Apr 2023 15:21:49 +1000
Message-Id: <20230420052149.1328094-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some powernv machines use IGB for networking, so build the driver in to
enable net booting such machines.

Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/configs/powernv_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/configs/powernv_defconfig b/arch/powerpc/configs/powernv_defconfig
index c92652575064..92e3a8fea04a 100644
--- a/arch/powerpc/configs/powernv_defconfig
+++ b/arch/powerpc/configs/powernv_defconfig
@@ -170,6 +170,7 @@ CONFIG_S2IO=m
 CONFIG_E100=y
 CONFIG_E1000=y
 CONFIG_E1000E=y
+CONFIG_IGB=y
 CONFIG_IXGB=m
 CONFIG_IXGBE=m
 CONFIG_I40E=m
-- 
2.39.2

