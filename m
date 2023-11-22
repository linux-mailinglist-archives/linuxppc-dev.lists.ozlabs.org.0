Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59ECD7F4759
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 14:05:19 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oq4y0kD1;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sb1gd1n8jz3dRT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Nov 2023 00:05:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=oq4y0kD1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sb1fk52yBz3bTt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 00:04:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7A920CE1C99;
	Wed, 22 Nov 2023 13:04:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E1A1C433C7;
	Wed, 22 Nov 2023 13:04:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700658262;
	bh=3jkcxWimrEZabr5xOWfunfKQM+HkiFOaIiIDB9oGtf8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oq4y0kD1MP0WZ3I7hJVLlqsg+3tMaez8cDsAs1SxNnybAwLmMtb1JbhpCCvqQINen
	 PW8EnPOGF1AqVZItlLGbvIBVWwQbhxmTs0RJwSAHIP3PwkAWawi2Fj4ZPfL0KMXsjD
	 B7gUpGeuf4GB69tJH7U2c5ertejTZM+By9Eae0KwaPnQYUPTyh4PaItDxisCBWBQ/P
	 ddSmIPUPErGERIkTGod5g2KZXZNYgklnCctERrOq2rgHJ+Kj74BM8jduXIVXgeUN/F
	 d/4TdMMPkCKFA5jsADAahsqe/7NW2AKKaBKL9uFgrel0voPkLKPI08rV0CUXrJQMfq
	 TIoihZiGPpTng==
Date: Wed, 22 Nov 2023 18:26:00 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/lib: Avoid array bounds warnings in vec ops
Message-ID: <ab6uj2olygi3edqkjn73kfxvx6igtxotkp3m35j4ikn3ztm2eg@ixkpj2f47ri2>
References: <20231120235436.1569255-1-mpe@ellerman.id.au>
 <i4zq3tg6gwaptnuoq2ainowffvkols2k5x7rads473zn55r27y@cvdy5yvkmj2p>
 <87pm02jt2g.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87pm02jt2g.fsf@mail.lhotse>
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
Cc: linuxppc-dev@lists.ozlabs.org, gustavo@embeddedor.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 22, 2023 at 03:44:07PM +1100, Michael Ellerman wrote:
> Naveen N Rao <naveen@kernel.org> writes:
> > On Tue, Nov 21, 2023 at 10:54:36AM +1100, Michael Ellerman wrote:
> >> Building with GCC 13 (which has -array-bounds enabled) there are several
> >
> > Thanks, gcc13 indeed helps reproduce the warnings.
> 
> Actually that part is no longer true since 0da6e5fd6c37 ("gcc: disable
> '-Warray-bounds' for gcc-13 too").
> 
> >> warnings in sstep.c along the lines of:
> >> 
> >>   In function ‘do_byte_reverse’,
> >>       inlined from ‘do_vec_load’ at arch/powerpc/lib/sstep.c:691:3,
> >>       inlined from ‘emulate_loadstore’ at arch/powerpc/lib/sstep.c:3439:9:
> >>   arch/powerpc/lib/sstep.c:289:23: error: array subscript 2 is outside array bounds of ‘u8[16]’ {aka ‘unsigned char[16]’} [-Werror=array-bounds=]
> >>     289 |                 up[2] = byterev_8(up[1]);
> >>         |                 ~~~~~~^~~~~~~~~~~~~~~~~~
> >>   arch/powerpc/lib/sstep.c: In function ‘emulate_loadstore’:
> >>   arch/powerpc/lib/sstep.c:681:11: note: at offset 16 into object ‘u’ of size 16
> >>     681 |         } u = {};
> >>         |           ^
> >> 
> >> do_byte_reverse() supports a size up to 32 bytes, but in these cases the
> >> caller is only passing a 16 byte buffer. In practice there is no bug,
> >> do_vec_load() is only called from the LOAD_VMX case in emulate_loadstore().
> >> That in turn is only reached when analyse_instr() recognises VMX ops,
> >> and in all cases the size is no greater than 16:
> >> 
> >>   $ git grep -w LOAD_VMX arch/powerpc/lib/sstep.c
> >>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 1);
> >>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 2);
> >>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 4);
> >>   arch/powerpc/lib/sstep.c:                        op->type = MKOP(LOAD_VMX, 0, 16);
> >> 
> >> Similarly for do_vec_store().
> >> 
> >> Although the warning is incorrect, the code would be safer if it clamped
> >> the size from the caller to the known size of the buffer. Do that using
> >> min_t().
> >
> > But, do_vec_load() and do_vec_store() assume that the maximum size is 16 
> > (the address_ok() check as an example). So, should we be considering a 
> > bigger hammer to help detect future incorrect use?
> 
> Yeah true.
> 
> To be honest I don't know how paranoid we want to get, we could end up
> putting WARN's all over the kernel :)
> 
> In this case I guess if the size is too large we overflow the buffer on
> the kernel stack, so we should at least check the size.
> 
> But does it need a WARN? I'm not sure. If we had a case that was passing
> a out-of-bound size hopefully we would notice in testing? :)

You're right, a simpler check should suffice. I will send an updated 
patch.

Thanks,
Naveen

