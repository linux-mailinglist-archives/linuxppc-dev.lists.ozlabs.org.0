Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E47AD5133FE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 14:43:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KpwK65ydhz3bx3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Apr 2022 22:43:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=phxVTDZ1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KpwHD14Y8z2xsP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Apr 2022 22:42:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=phxVTDZ1; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KpwH71V9Bz4x7Y;
 Thu, 28 Apr 2022 22:41:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1651149715;
 bh=angbs4k+nefnWKYYA4PyhQF8HIwJeqJDKwFomJisFV8=;
 h=From:To:Cc:Subject:Date:From;
 b=phxVTDZ11wzTf6qMuKjvp9ReQ3nrmVkIgNz4g6KTDOvzKsl1Ng4XdxT0WLwUpUw8L
 MZwHIjhtFzkb1QIUyvhMIxJqx4r+ywfxh8NAAbhd7zbu3jsJqaZRVNhQ4eQ+fnl7aK
 7+LDrI0M+lxmdG7+7R2AIA365RPc3EXayKsyIZhqub8AuzBzdfB7XZM3oAoliZhkY9
 hqylqptCg+8O5tBRXrUQ4PisGzUbeMzQqnJSUnFcPyj95ig1mnHJA570Pc1InTvug/
 RYGxr3ExpStbkH5v55NtMOmxPaaTWYypmnb9tYyuZQJCedzp7shzQD7FpyN+eCvwRf
 TZGU8SkZF8OKg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: <stable@vger.kernel.org>,
	<gregkh@linuxfoundation.org>
Subject: [PATCH v4.19 0/2] Custom backports for powerpc SLB issues
Date: Thu, 28 Apr 2022 22:41:48 +1000
Message-Id: <20220428124150.375623-1-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.35.1
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,

Here are two custom backports to v4.19 for some powerpc issues we've discovered.
Both were fixed upstream as part of a large non-backportable rewrite. Other stable
kernel versions are not affected.

cheers

Michael Ellerman (1):
  powerpc/64s: Unmerge EX_LR and EX_DAR

Nicholas Piggin (1):
  powerpc/64/interrupt: Temporarily save PPR on stack to fix register
    corruption due to SLB miss

 arch/powerpc/include/asm/exception-64s.h | 37 ++++++++++++++----------
 1 file changed, 22 insertions(+), 15 deletions(-)

-- 
2.35.1

