Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E627B17742F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 11:29:59 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48WtYc4WzSzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 21:29:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WtWw28GHzDqQS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 21:28:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=e2hwoNpc; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48WtWt5nQLz9sPg;
 Tue,  3 Mar 2020 21:28:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583231306;
 bh=rR0PX/PIXpmUWEvsjz0jV6bq6v4H0L8THPuMSsBWOU8=;
 h=From:To:Subject:In-Reply-To:References:Date:From;
 b=e2hwoNpcmZ8jxUWgWgFC8ksw5tR4ti8FJluJ33yhtXFlL103gKneQZTP+0Y8BQ61H
 N719f7pQJa0nAvjekPYniWU6o7PlJ2DN2PXEIrbeNb1dLA8F409L1QX+xVs58OnhxA
 z/2sMLice1M1cF1+EKH9YfGoNWbHcVw2raEcIsXYHBefoQacpH9zw9kcba5rjTEMpR
 iN+uJPL3hWW6sJWLfe++SwJG1aRnLXdS3I7SCM+uiSbdpETdDFI/RMKCD6qAn7qzPa
 YrJ1axUSSaXC7qDa9WtbIwNqoJPChWG+hwygJUgiSNOzuhqL96D8lJ4sAB3tShx4D/
 Rj/SlH5DAZzTA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 "linuxppc-dev\@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: Re: eh_frame confusion
In-Reply-To: <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
References: <3b00b45f-74b5-13e3-9a98-c3d6b3bb7286@rasmusvillemoes.dk>
 <1583168442.ovqnxu16tp.naveen@linux.ibm.com>
Date: Tue, 03 Mar 2020 21:28:25 +1100
Message-ID: <877e01spfa.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Naveen N. Rao" <naveen.n.rao@linux.ibm.com> writes:
> Rasmus Villemoes wrote:
>> I'm building a ppc32 kernel, and noticed that after upgrading from gcc-7
>> to gcc-8 all object files now end up having .eh_frame section. For
>> vmlinux, that's not a problem, because they all get discarded in
>> arch/powerpc/kernel/vmlinux.lds.S . However, they stick around in
>> modules, which doesn't seem to be useful - given that everything worked
>> just fine with gcc-7, and I don't see anything in the module loader that
>> handles .eh_frame.
>> 
>> The reason I care is that my target has a rather tight rootfs budget,
>> and the .eh_frame section seem to occupy 10-30% of the file size
>> (obviously very depending on the particular module).
>> 
>> Comparing the .foo.o.cmd files, I don't see change in options that might
>> explain this (there's a bunch of new -Wno-*, and the -mspe=no spelling
>> is apparently no longer supported in gcc-8). Both before and after, there's
>> 
>> -fno-dwarf2-cfi-asm
>> 
>> about which gcc's documentation says
>> 
>> '-fno-dwarf2-cfi-asm'
>>      Emit DWARF unwind info as compiler generated '.eh_frame' section
>>      instead of using GAS '.cfi_*' directives.
>> 
>> Looking into where that comes from got me even more confused, because
>> both arm and unicore32 say
>> 
>> # Never generate .eh_frame
>> KBUILD_CFLAGS           += $(call cc-option,-fno-dwarf2-cfi-asm)
>> 
>> while the ppc32 case at hand says
>> 
>> # FIXME: the module load should be taught about the additional relocs
>> # generated by this.
>> # revert to pre-gcc-4.4 behaviour of .eh_frame
>
> Michael opened a task to look into this recently and I had spent some 
> time last week on this. The original commit/discussion adding 
> -fno-dwarf2-cfi-asm refers to R_PPC64_REL32 relocations not being 
> handled by our module loader:
> http://lkml.kernel.org/r/20090224065112.GA6690@bombadil.infradead.org

I opened that issue purely based on noticing the wart in the Makefile,
not because I'd actually tested it.

> However, that is now handled thanks to commit 9f751b82b491d:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9f751b82b491d

Haha, written by me, what an idiot.

So the Makefile hack can presumably be dropped, because the module
loader can handle the relocations.

And then maybe we also want to turn off the unwind tables, but that
would be a separate patch.

> I did a test build and a simple module loaded fine, so I think 
> -fno-dwarf2-cfi-asm is not required anymore, unless Michael has seen 
> some breakages with it. Michael?

No, as I said above it was just reading the Makefile.

cheers
