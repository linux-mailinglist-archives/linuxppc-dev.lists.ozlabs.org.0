Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 276B47C9897
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 12:06:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OYCTgxa5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S7bVw6tjpz3vjp
	for <lists+linuxppc-dev@lfdr.de>; Sun, 15 Oct 2023 21:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=OYCTgxa5;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S7bRF3Lpnz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 15 Oct 2023 21:03:21 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1697364201;
	bh=AQsZcb6vXWJX7N3VYJ19FVfry2gPKKLAduoPrYvEJJo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=OYCTgxa5+0XpFuUu3y75vTXktmFDk+TZQR2FG3Q6faHn71YpF8QIfilEunOSFM0gY
	 +qVkx5G8cLmSSooT3JPoz/6L/MVnlIZiXHBzGK5DU33h3ukWczmOGbCEhlzD5ds+ni
	 gUWd1YhbKkUKJNaXJyjAKerrLsc6gneqVfVFNlGaCT1FfY/MvO81Z2Npa1/sfwKqlv
	 nQjlRxLpzMQJ2+D2BoJFtcGufdrFWYZo5q9asyrjHrmUMjp6gXuoPMk6gtOCFXNh0g
	 ASHD1NAfVyztfQfjj5zXOuo/V1nFAdDJniRlZBUuXVZEnQlfttIXFVfmO0YdNpKgjk
	 UFXg34kF5zpfw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4S7bRF235Zz4wny;
	Sun, 15 Oct 2023 21:03:21 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20231010114750.847794-1-mpe@ellerman.id.au>
References: <20231010114750.847794-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/47x: Fix 47x syscall return crash
Message-Id: <169736402375.957740.2565695828834016495.b4-ty@ellerman.id.au>
Date: Sun, 15 Oct 2023 21:00:23 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: eajames@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 10 Oct 2023 22:47:50 +1100, Michael Ellerman wrote:
> Eddie reported that newer kernels were crashing during boot on his 476
> FSP2 system:
> 
>   kernel tried to execute user page (b7ee2000) - exploit attempt? (uid: 0)
>   BUG: Unable to handle kernel instruction fetch
>   Faulting instruction address: 0xb7ee2000
>   Oops: Kernel access of bad area, sig: 11 [#1]
>   BE PAGE_SIZE=4K FSP-2
>   Modules linked in:
>   CPU: 0 PID: 61 Comm: mount Not tainted 6.1.55-d23900f.ppcnf-fsp2 #1
>   Hardware name: ibm,fsp2 476fpe 0x7ff520c0 FSP-2
>   NIP:  b7ee2000 LR: 8c008000 CTR: 00000000
>   REGS: bffebd83 TRAP: 0400   Not tainted (6.1.55-d23900f.ppcnf-fs p2)
>   MSR:  00000030 <IR,DR>  CR: 00001000  XER: 20000000
>   GPR00: c00110ac bffebe63 bffebe7e bffebe88 8c008000 00001000 00000d12 b7ee2000
>   GPR08: 00000033 00000000 00000000 c139df10 48224824 1016c314 10160000 00000000
>   GPR16: 10160000 10160000 00000008 00000000 10160000 00000000 10160000 1017f5b0
>   GPR24: 1017fa50 1017f4f0 1017fa50 1017f740 1017f630 00000000 00000000 1017f4f0
>   NIP [b7ee2000] 0xb7ee2000
>   LR [8c008000] 0x8c008000
>   Call Trace:
>   Instruction dump:
>   XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>   XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>   ---[ end trace 0000000000000000 ]---
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/47x: Fix 47x syscall return crash
      https://git.kernel.org/powerpc/c/f0eee815babed70a749d2496a7678be5b45b4c14

cheers
