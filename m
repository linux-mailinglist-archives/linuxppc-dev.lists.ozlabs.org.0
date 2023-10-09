Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35B5A7BDE05
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Oct 2023 15:15:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VzXJXIi8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S3zzF07r3z3cV3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Oct 2023 00:15:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VzXJXIi8;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S3zyK2xnsz2yVv
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Oct 2023 00:14:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1696857251;
	bh=TSiatPgwJ5C77ethX9r6ZW+8VMKiX6LN1q7Pm+eFmIA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VzXJXIi8qoZtXIjJYd66plh5zpI4LaKwopsi7NJgV+IT2iNTNbBU+GiGGBjjN3QOW
	 FyDLc1YSlETmEukBTm9by084LWs1ii0sN/FYhR9RYWwPoRrBUn/EwWvHLoogX6uo95
	 VN4Hu+lpBD+Gb9HJXL2nAejNnKnC+etEUeVKpR2bEfnBJw3f4D0PJIN6uKCQZ2DXKV
	 ypfnQMGh5gVlm4xOQtWSH5xToPsU+3s5sJoGLEGoMFjWxIA3NSuQ4c+IERy4HhocPi
	 tJucrK4AeW9Q52xYly3wPz2w9EqYY7d11YcRmvlLh63tkWYz2j4rUqyv0m+qGmj4rX
	 xRhf47yjN6QfA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S3zyB2vWcz4xWr;
	Tue, 10 Oct 2023 00:14:10 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Eddie James <eajames@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: KUEP broken on FSP2?
In-Reply-To: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
Date: Tue, 10 Oct 2023 00:14:07 +1100
Message-ID: <87a5ssrl9c.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eddie James <eajames@linux.ibm.com> writes:
> Hi,
>
> I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes 
> attempting to get into userspace. The init script works, but the first 
> binary (mount) I run results in oops. Can anyone help me to debug this 
> further or suggest anything?

Hi Eddie,

It looks like breakage in syscall_exit_finish.

Can you test this? Patch is against v6.1.

cheers


diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 3fc7c9886bb7..decd2594fb9c 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -135,7 +135,8 @@ ret_from_syscall:
 	lis	r4,icache_44x_need_flush@ha
 	lwz	r5,icache_44x_need_flush@l(r4)
 	cmplwi	cr0,r5,0
-	bne-	2f
+	bne-	.L44x_icache_flush
+.L44x_icache_flush_return:
 #endif /* CONFIG_PPC_47x */
 	kuep_unlock
 	lwz	r4,_LINK(r1)
@@ -170,10 +171,11 @@ syscall_exit_finish:
 	b	1b
 
 #ifdef CONFIG_44x
-2:	li	r7,0
+.L44x_icache_flush:
+	li	r7,0
 	iccci	r0,r0
 	stw	r7,icache_44x_need_flush@l(r4)
-	b	1b
+	b	.L44x_icache_flush_return
 #endif  /* CONFIG_44x */
 
 	.globl	ret_from_fork
