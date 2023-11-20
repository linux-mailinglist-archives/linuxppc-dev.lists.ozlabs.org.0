Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A40A37F15B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 15:30:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uL1O+WR2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYqfG4LrYz3cVJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 01:29:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=uL1O+WR2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYqdP54S2z2xdR
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 01:29:13 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E7539B81822;
	Mon, 20 Nov 2023 14:29:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAAB6C433C9;
	Mon, 20 Nov 2023 14:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700490550;
	bh=l8k/mTX4UdykIMEpDHeXPx50Fon7AjRDutwZZnGtWJI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uL1O+WR2jqJIXNUzjfiP7m17LeZC/3J505mUkAQYfoGrz9Ocf1cM6iZ32M27h7INw
	 XVaCFtfb5BrplcqoPEWEYclWN8DenrjL4T0ypqGv8ps06etdeErktMiVJCovEf9Ltq
	 IfzCKBqZyyrkwpIobQu1yDYIIleFK2d8ec49FR2DAIOzxoap41jabOtSLF77OprysP
	 xGc2iDj5vl3NkgOfSpBW02aqWSJtbcfvbXOJAaUKUD0rRa8d6TcIv5hjXA+/yO8h8V
	 oI18Yo3GuH0UZTYs/W975kMGOwr1fNYVQN5RpNATYpImcvG+ZMLomoV7/r2MzUfbY+
	 Oiz3uzqTo22Aw==
Date: Mon, 20 Nov 2023 19:55:22 +0530
From: Naveen N Rao <naveen@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [RFC - is this a bug?] powerpc/lib/sstep: Asking for some light
 on this, please. :)
Message-ID: <kheudo7mk4dtjtkble2hdgsc4eod336oirsq3xj4so2upsbjzu@gx3wydlzshru>
References: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
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
Cc: PowerPC <linuxppc-dev@lists.ozlabs.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Nov 17, 2023 at 12:36:01PM -0600, Gustavo A. R. Silva wrote:
> Hi all,
> 
> I'm trying to fix the following -Wstringop-overflow warnings, and I'd like
> to get your feedback on this, please:
> 
> In function 'do_byte_reverse',
>     inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
>     inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>   287 |                 up[3] = tmp;
>       |                 ~~~~~~^~~~~
> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
> arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into destination object 'u' of size 16
>   708 |         } u;
>       |           ^
> In function 'do_byte_reverse',
>     inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
>     inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
> arch/powerpc/lib/sstep.c:289:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>   289 |                 up[2] = byterev_8(up[1]);
>       |                 ~~~~~~^~~~~~~~~~~~~~~~~~
> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
> arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into destination object 'u' of size 16
>   708 |         } u;
>       |           ^
> In function 'do_byte_reverse',
>     inlined from 'do_vec_load' at /home/gus/linux/arch/powerpc/lib/sstep.c:691:3,
>     inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3439:9:
> arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
>   287 |                 up[3] = tmp;
>       |                 ~~~~~~^~~~~
> arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
>   681 |         } u = {};
>       |           ^
> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
> arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
> 
> The origing of the issue seems to be the following calls to function `do_vec_store()`, when
> `size > 16`, or more precisely when `size == 32`
> 
> arch/powerpc/lib/sstep.c:
> 3436         case LOAD_VMX:
> 3437                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
> 3438                         return 0;
> 3439                 err = do_vec_load(op->reg, ea, size, regs, cross_endian);
> 3440                 break;
> ...
> 3507         case STORE_VMX:
> 3508                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
> 3509                         return 0;
> 3510                 err = do_vec_store(op->reg, ea, size, regs, cross_endian);
> 3511                 break;

LOAD_VMX and STORE_VMX are set in analyse_instr() and size does not 
exceed 16. So, the warning looks incorrect to me.

- Naveen
