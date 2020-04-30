Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C01BEE69
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 04:53:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CKgs2dGDzDr86
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Apr 2020 12:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49CKf71HRyzDr72
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 12:51:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=gxFMfB5X; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49CKf50t2nz9sSg;
 Thu, 30 Apr 2020 12:51:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1588215102;
 bh=zYCedQsDI7/f6GhtRXQr5lxXl5m1nAJL1n3c6FIyzMc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=gxFMfB5XVsdKXJjjOHPJxhhaN0oy59FHzCuao5n5C4Fz0BRqcWBG4k/0Tp6FgkJp0
 Sh3MDsSLFM1hX1iLRLjQQActfnUfrlHJXGv4PdvG5lM0Y0wnhE1lPIF5ik6fa2i6ZY
 FJd8W3rX+terUiy1YVeIebfdlWUha5HuHNzSQpM76J4b47bkOo4N1DDTydOVPaXnCg
 5CYBkiyvfcl/Is/2zhpmLlM0t5kF2s5e76m5EivM7TlXYMVFd8qaN/dilXS9gbVbx/
 p4fWTwqVcl6Zek1XgTC3vY81fNEqX3K2nXgl8RKBnDbopA8c9vp215x5yhx7f2bi45
 j31IM6smW2qgA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rich Felker <dalias@libc.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [musl] Re: New powerpc vdso calling convention
In-Reply-To: <20200425162204.GJ11469@brightrain.aerifal.cx>
References: <1587790194.w180xsw5be.astroid@bobo.none>
 <9371cac5-20bb-0552-2609-0d537f41fecd@c-s.fr>
 <1587810370.tg8ym9yjpc.astroid@bobo.none>
 <20200425162204.GJ11469@brightrain.aerifal.cx>
Date: Thu, 30 Apr 2020 12:51:56 +1000
Message-ID: <87v9lheldf.fsf@mpe.ellerman.id.au>
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
Cc: libc-alpha@sourceware.org, Andy Lutomirski <luto@kernel.org>,
 musl@lists.openwall.com, binutils@sourceware.org,
 Adhemerval Zanella <adhemerval.zanella@linaro.org>, libc-dev@lists.llvm.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rich Felker <dalias@libc.org> writes:
> On Sat, Apr 25, 2020 at 08:56:54PM +1000, Nicholas Piggin wrote:
>> >> The ELF v2 ABI convention would suit it well, because the caller already
>> >> requires the function address for ctr, so having it in r12 will
>> >> eliminate the need for address calculation, which suits the vdso data
>> >> page access.
>> >> 
>> >> Is there a need for ELF v1 specific calls as well, or could those just be
>> >> deprecated and remain on existing functions or required to use the ELF
>> >> v2 calls using asm wrappers?
>> > 
>> > What's ELF v1 and ELF v2 ? Is ELF v1 what PPC32 uses ? If so, I'd say 
>> > yes, it would be good to have it to avoid going through ASM in the middle..
>> 
>> I'm not sure about PPC32. On PPC64, ELFv2 functions must be called with 
>> their address in r12 if called at their global entry point. ELFv1 have a 
>> function descriptor with call address and TOC in it, caller has to load 
>> the TOC if it's global.
>> 
>> The vdso doesn't have TOC, it has one global address (the vdso data 
>> page) which it loads by calculating its own address.
>
> A function descriptor could be put in the VDSO data page, or as it's
> done now by glibc the vdso linkage code could create it. My leaning is
> to at least have a version of the code that's callable (with the right
> descriptor around it) by v1 binaries, but since musl does not use
> ELFv1 at all we really have no stake in this and I'm fine with
> whatever outcome users of v1 decide on.
>
>> The kernel doesn't change the vdso based on whether it's called by a v1 
>> or v2 userspace (it doesn't really know itself and would have to export 
>> different functions). glibc has a hack to create something:
>
> I'm pretty sure it does know because signal invocation has to know
> whether the function pointer points to a descriptor or code. At least
> for FDPIC archs (similar to PPC64 ELFv1 function descriptors) it knows
> and has to know.

It does know, see TIF_ELF2ABI which is tested by is_elf2_task(), and as
you say is used by the signal delivery code.

Currently the VDSO entry points are not functions, so they don't need to
change based on the ABI.

cheers
