Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B48743DD4AA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 13:27:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GdbMw51Qlz3cJg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 Aug 2021 21:27:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=NQ36tbtc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NQ36tbtc; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GdbMX6sSkz2yxW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  2 Aug 2021 21:27:36 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GdbMV0kGGz9sT6;
 Mon,  2 Aug 2021 21:27:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627903655;
 bh=JF37L60a0EIuj5QrG/LTCIPl8ek1nHsSTOpmy5gdjng=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NQ36tbtclmEE1SWxAuOW5eWv0NBmY8k7fo2HJ2oNA0GNz4m+nsnoFP163v4N6+rnL
 IUHaNvtrGlwa3NRmY6pu7XGCU0ZZCp1G3rBMfPUB7TAgKPkzbrL4OOwXt1KHFsOWok
 GD0IQBqA37Jc0wmuMHFIWDseEYzsUQIxal/akAPh6+UTezoPVMVJ1zNU4NVSAXXWUO
 g9iqSaziozngt2JAA+C0CGjczINB6m8w8ExwhexIf9qbuiFkBvrSgiv8PAdRA2yfSE
 H6clbs+IOXnNb69YnPXrHK7L0LlCUaKpmn9gHKgPhoq6ZUSwvmfh69o5ykWbOXdoYU
 RP1rl6aEhkIgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/vdso: Don't use r30 to avoid breaking Go lang
In-Reply-To: <20210729131244.2595519-1-mpe@ellerman.id.au>
References: <20210729131244.2595519-1-mpe@ellerman.id.au>
Date: Mon, 02 Aug 2021 21:27:33 +1000
Message-ID: <87wnp4jdcq.fsf@mpe.ellerman.id.au>
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
Cc: pmenzel@molgen.mpg.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:
> The Go runtime uses r30 for some special value called 'g'. It assumes
> that value will remain unchanged even when calling VDSO functions.
> Although r30 is non-volatile across function calls, the callee is free
> to use it, as long as the callee saves the value and restores it before
> returning.
>
> It used to be true by accident that the VDSO didn't use r30, because the
> VDSO was hand-written asm. When we switched to building the VDSO from C
> the compiler started using r30, at least in some builds, leading to
> crashes in Go. eg:
>
>   ~/go/src$ ./all.bash
>   Building Go cmd/dist using /usr/lib/go-1.16. (go1.16.2 linux/ppc64le)
>   Building Go toolchain1 using /usr/lib/go-1.16.
>   go build os/exec: /usr/lib/go-1.16/pkg/tool/linux_ppc64le/compile: signal: segmentation fault
>   go build reflect: /usr/lib/go-1.16/pkg/tool/linux_ppc64le/compile: signal: segmentation fault
>   go tool dist: FAILED: /usr/lib/go-1.16/bin/go install -gcflags=-l -tags=math_big_pure_go compiler_bootstrap bootstrap/cmd/...: exit status 1
>
> There are patches in flight to fix Go[1], but until they are released
> and widely deployed we can workaround it in the VDSO by avoiding use of
> r30.
>
> Note this only works with GCC, clang does not support -ffixed-rN.
>
> 1: https://go-review.googlesource.com/c/go/+/328110
>
> Fixes: ab037dd87a2f ("powerpc/vdso: Switch VDSO to generic C implementation.")
> Cc: stable@vger.kernel.org # v5.11+

In practice, with GCC 10.3.0, that commit doesn't result in r30 being
used by the compiler.

It's commit 74205b3fc2ef ("powerpc/vdso: Add support for time
namespaces"), which went into v5.13-rc1, which causes r30 to be used in
__c_kernel_clock_gettime():

00000000000006e0 <__c_kernel_clock_gettime>:
 6e0:   0f 00 03 28     cmplwi  r3,15
 6e4:   ec 00 81 41     bgt     7d0 <__c_kernel_clock_gettime+0xf0>
 6e8:   01 00 20 39     li      r9,1
 6ec:   30 18 29 7d     slw     r9,r9,r3
 6f0:   83 08 2a 71     andi.   r10,r9,2179
 6f4:   fc 00 82 41     beq     7f0 <__c_kernel_clock_gettime+0x110>
 6f8:   e4 26 63 78     rldicr  r3,r3,4,59
 6fc:   ff 7f 20 3d     lis     r9,32767
 700:   f0 ff c1 fb     std     r30,-16(r1)
 704:   f8 ff e1 fb     std     r31,-8(r1)
 708:   14 1a c5 7c     add     r6,r5,r3
 70c:   ff ff 2b 61     ori     r11,r9,65535
 710:   00 00 05 81     lwz     r8,0(r5)
 714:   01 00 09 71     andi.   r9,r8,1
 718:   98 00 82 40     bne     7b0 <__c_kernel_clock_gettime+0xd0>
 71c:   ac 04 20 7c     lwsync
 720:   a6 42 cc 7f     mftb    r30


cheers
