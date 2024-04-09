Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4689D4ED
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 10:54:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lNpmlzQL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VDKX4542gz3vYh
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Apr 2024 18:54:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lNpmlzQL;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VDKWN4mVxz30fh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Apr 2024 18:53:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1712652832;
	bh=n2NkYD5ALou1bAVVYZN89InnCEaR3zlmB6pBb07YURQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lNpmlzQLgZX0M9iUrm9UJakKOmEtuKy8gfUWUs8AzJtJJGAnXOiST9+cKxwy2kKJi
	 SdtNzoXJ8j+UXFtNT47O7bOGOOBSUl0Ym6kID/lvNobgho8gDt9iPOzj3mzfmK0BbW
	 gh3JqiSuhPVI8lePECGkE+E4C/dkFFfIN5yfKoHJjlDsJWzBmUaTMh6SNlJhAAWNme
	 xHI+t8SowLsO/OUpZJ1xbnUOGeMdzTpYSkt4acsfqaQcPa+710QNEn2SjHb6NLE5Er
	 WJRxdrTotgKoe4kx2YDERXewVNHC0ktpTGSnB+bGmIsI/NtiurWlpQkXMn6RT/HUPa
	 MoBrTzlsjLTkw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VDKWN3F9pz4wxt;
	Tue,  9 Apr 2024 18:53:52 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, "Aneesh Kumar K.V"
 <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Enforce hcall result buffer validity
 and size
In-Reply-To: <20240408-pseries-hvcall-retbuf-v1-1-ebc73d7253cf@linux.ibm.com>
References: <20240408-pseries-hvcall-retbuf-v1-1-ebc73d7253cf@linux.ibm.com>
Date: Tue, 09 Apr 2024 18:53:52 +1000
Message-ID: <874jcac3xb.fsf@mail.lhotse>
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
writes:
> From: Nathan Lynch <nathanl@linux.ibm.com>
>
> plpar_hcall(), plpar_hcall9(), and related functions expect callers to
> provide valid result buffers of certain minimum size. Currently this
> is communicated only through comments in the code and the compiler has
> no idea.
>
> For example, if I write a bug like this:
>
>   long retbuf[PLPAR_HCALL_BUFSIZE]; // should be PLPAR_HCALL9_BUFSIZE
>   plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf, ...);
>
> This compiles with no diagnostics emitted, but likely results in stack
> corruption at runtime when plpar_hcall9() stores results past the end
> of the array. (To be clear this is a contrived example and I have not
> found a real instance yet.)

We did have some real stack corruption bugs in the past.

I referred to them in my previous (much uglier) attempt at a fix:

  https://patchwork.ozlabs.org/project/linuxppc-dev/patch/1476780032-21643-2-git-send-email-mpe@ellerman.id.au/

Annoyingly I didn't describe them in any detail, but at least one of them was:

  24c65bc7037e ("hwrng: pseries - port to new read API and fix stack corruption")

Will this catch a case like that? Where the too-small buffer is not
declared locally but rather comes into the function as a pointer?

> To make this class of error less likely, we can use explicitly-sized
> array parameters instead of pointers in the declarations for the hcall
> APIs. When compiled with -Warray-bounds[1], the code above now
> provokes a diagnostic like this:
>
> error: array argument is too small;
> is of size 32, callee requires at least 72 [-Werror,-Warray-bounds]
>    60 |                 plpar_hcall9(H_ALLOCATE_VAS_WINDOW, retbuf,
>       |                 ^                                   ~~~~~~
>
> [1] Enabled for LLVM builds but not GCC for now. See commit
>     0da6e5fd6c37 ("gcc: disable '-Warray-bounds' for gcc-13 too") and
>     related changes.

clang build coverage is pretty good these days, so I think it's still
worth doing.

cheers

> diff --git a/arch/powerpc/include/asm/hvcall.h b/arch/powerpc/include/asm/hvcall.h
> index a41e542ba94d..39cd1ca4ccb9 100644
> --- a/arch/powerpc/include/asm/hvcall.h
> +++ b/arch/powerpc/include/asm/hvcall.h
> @@ -524,7 +524,7 @@ long plpar_hcall_norets_notrace(unsigned long opcode, ...);
>   * Used for all but the craziest of phyp interfaces (see plpar_hcall9)
>   */
>  #define PLPAR_HCALL_BUFSIZE 4
> -long plpar_hcall(unsigned long opcode, unsigned long *retbuf, ...);
> +long plpar_hcall(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL_BUFSIZE], ...);
>  
>  /**
>   * plpar_hcall_raw: - Make a hypervisor call without calculating hcall stats
> @@ -538,7 +538,7 @@ long plpar_hcall(unsigned long opcode, unsigned long *retbuf, ...);
>   * plpar_hcall, but plpar_hcall_raw works in real mode and does not
>   * calculate hypervisor call statistics.
>   */
> -long plpar_hcall_raw(unsigned long opcode, unsigned long *retbuf, ...);
> +long plpar_hcall_raw(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL_BUFSIZE], ...);
>  
>  /**
>   * plpar_hcall9: - Make a pseries hypervisor call with up to 9 return arguments
> @@ -549,8 +549,8 @@ long plpar_hcall_raw(unsigned long opcode, unsigned long *retbuf, ...);
>   * PLPAR_HCALL9_BUFSIZE to size the return argument buffer.
>   */
>  #define PLPAR_HCALL9_BUFSIZE 9
> -long plpar_hcall9(unsigned long opcode, unsigned long *retbuf, ...);
> -long plpar_hcall9_raw(unsigned long opcode, unsigned long *retbuf, ...);
> +long plpar_hcall9(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL9_BUFSIZE], ...);
> +long plpar_hcall9_raw(unsigned long opcode, unsigned long retbuf[static PLPAR_HCALL9_BUFSIZE], ...);
>  
>  /* pseries hcall tracing */
>  extern struct static_key hcall_tracepoint_key;
>
> ---
> base-commit: bfe51886ca544956eb4ff924d1937ac01d0ca9c8
> change-id: 20240408-pseries-hvcall-retbuf-c47c4d70d847
>
> Best regards,
> -- 
> Nathan Lynch <nathanl@linux.ibm.com>
