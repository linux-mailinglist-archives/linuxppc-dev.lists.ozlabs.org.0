Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B37D7F172A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Nov 2023 16:23:07 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AZ3Sie6o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SYrqY1vkxz3cV6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 02:23:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=AZ3Sie6o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SYrpj21cQz2xTN
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 02:22:21 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E1C21CE1409;
	Mon, 20 Nov 2023 15:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87387C433C8;
	Mon, 20 Nov 2023 15:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700493736;
	bh=Ksr4xRNP3wNfmBUEhIT75vlxv7AEIHfqR+9fwTVDadY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZ3Sie6oK/O9CWoCjqPDxCPCSYNHPR9jTaBGPxsRVOL2Be43OLyCVHX5kt4lRGqyU
	 n2ahT2va3rBZ0Ar4jzoFrLkADgWXb37nr0anvQ6LWCzfhrg4UONzLi2QCZt7zPvy3n
	 Sw8QnBmegRc0a4tKUT2lOA5ItXHHU3qyJEtnIpzWPKGUgn+5FLWLcJAK3wVWxuqE+3
	 39wC409s2OEGVUeQR9PSru8WnkuIjOz8xDlLwsQtN0O7Nbxl1/n9ZfWrSPH7p2KcCK
	 woUKxvRV3QW1XwPo3GmSxeIqI5oVXMy8gxZj+j4JSz9fEEgYmBQg8L+6hdSIsxE7UI
	 i3szTjdRC1AoA==
Date: Mon, 20 Nov 2023 20:51:28 +0530
From: Naveen N Rao <naveen@kernel.org>
To: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: Re: [RFC - is this a bug?] powerpc/lib/sstep: Asking for some light
 on this, please. :)
Message-ID: <duj4s25crkeo7etywq4unqcuhdxc3v3fbx6qkw7mbzq66zsu5d@uz7uslgrooiz>
References: <6a8bf78c-aedb-4d5a-b0aa-82a51a17b884@embeddedor.com>
 <kheudo7mk4dtjtkble2hdgsc4eod336oirsq3xj4so2upsbjzu@gx3wydlzshru>
 <5764b2f5-d0ae-4123-8a40-e4ecbf6908fd@embeddedor.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5764b2f5-d0ae-4123-8a40-e4ecbf6908fd@embeddedor.com>
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

On Mon, Nov 20, 2023 at 08:33:45AM -0600, Gustavo A. R. Silva wrote:
> 
> 
> On 11/20/23 08:25, Naveen N Rao wrote:
> > On Fri, Nov 17, 2023 at 12:36:01PM -0600, Gustavo A. R. Silva wrote:
> > > Hi all,
> > > 
> > > I'm trying to fix the following -Wstringop-overflow warnings, and I'd like
> > > to get your feedback on this, please:
> > > 
> > > In function 'do_byte_reverse',
> > >      inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
> > >      inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
> > > arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
> > >    287 |                 up[3] = tmp;
> > >        |                 ~~~~~~^~~~~
> > > arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
> > > arch/powerpc/lib/sstep.c:708:11: note: at offset [24, 39] into destination object 'u' of size 16
> > >    708 |         } u;
> > >        |           ^
> > > In function 'do_byte_reverse',
> > >      inlined from 'do_vec_store' at /home/gus/linux/arch/powerpc/lib/sstep.c:722:3,
> > >      inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3510:9:
> > > arch/powerpc/lib/sstep.c:289:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
> > >    289 |                 up[2] = byterev_8(up[1]);
> > >        |                 ~~~~~~^~~~~~~~~~~~~~~~~~
> > > arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
> > > arch/powerpc/lib/sstep.c:708:11: note: at offset 16 into destination object 'u' of size 16
> > >    708 |         } u;
> > >        |           ^
> > > In function 'do_byte_reverse',
> > >      inlined from 'do_vec_load' at /home/gus/linux/arch/powerpc/lib/sstep.c:691:3,
> > >      inlined from 'emulate_loadstore' at /home/gus/linux/arch/powerpc/lib/sstep.c:3439:9:
> > > arch/powerpc/lib/sstep.c:287:23: error: writing 8 bytes into a region of size 0 [-Werror=stringop-overflow=]
> > >    287 |                 up[3] = tmp;
> > >        |                 ~~~~~~^~~~~
> > > arch/powerpc/lib/sstep.c: In function 'emulate_loadstore':
> > > arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
> > >    681 |         } u = {};
> > >        |           ^
> > > arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
> > > arch/powerpc/lib/sstep.c:681:11: note: at offset [24, 39] into destination object 'u' of size 16
> > > 
> > > The origing of the issue seems to be the following calls to function `do_vec_store()`, when
> > > `size > 16`, or more precisely when `size == 32`
> > > 
> > > arch/powerpc/lib/sstep.c:
> > > 3436         case LOAD_VMX:
> > > 3437                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
> > > 3438                         return 0;
> > > 3439                 err = do_vec_load(op->reg, ea, size, regs, cross_endian);
> > > 3440                 break;
> > > ...
> > > 3507         case STORE_VMX:
> > > 3508                 if (!(regs->msr & MSR_PR) && !(regs->msr & MSR_VEC))
> > > 3509                         return 0;
> > > 3510                 err = do_vec_store(op->reg, ea, size, regs, cross_endian);
> > > 3511                 break;
> > 
> > LOAD_VMX and STORE_VMX are set in analyse_instr() and size does not
> > exceed 16. So, the warning looks incorrect to me.
> 
> Does that mean that this piece of code is never actually executed:
> 
>  281         case 32: {
>  282                 unsigned long *up = (unsigned long *)ptr;
>  283                 unsigned long tmp;
>  284
>  285                 tmp = byterev_8(up[0]);
>  286                 up[0] = byterev_8(up[3]);
>  287                 up[3] = tmp;
>  288                 tmp = byterev_8(up[2]);
>  289                 up[2] = byterev_8(up[1]);
>  290                 up[1] = tmp;
>  291                 break;
>  292         }
> 
> or rather, under which conditions the above code is executed, if any?

Please see git history to understand the commit that introduced that 
code. You can do that by starting with a 'git blame' on the file. You'll 
find that the commit that introduced the above hunk was af99da74333b 
("powerpc/sstep: Support VSX vector paired storage access 
instructions").

The above code path is hit via 
do_vsx_load()->emulate_vsx_load()->do_byte_reverse()


- Naveen

