Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 287C36BE70
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jul 2019 16:40:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45pg0X5GQyzDqWW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 00:40:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=permerror (mailfrom)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=kernel.crashing.org
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45pfyT3QwZzDqN2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 00:38:25 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id x6HEcEwG003587;
 Wed, 17 Jul 2019 09:38:14 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id x6HEcCZK003586;
 Wed, 17 Jul 2019 09:38:12 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Wed, 17 Jul 2019 09:38:11 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc: remove meaningless KBUILD_ARFLAGS addition
Message-ID: <20190717143811.GL20882@gate.crashing.org>
References: <20190713032106.8509-1-yamada.masahiro@socionext.com>
 <20190713124744.GS14074@gate.crashing.org>
 <20190713131642.GU14074@gate.crashing.org>
 <CAK7LNASBmZxX+U=LS+dgvet96cA3T6Tf_tiAa2vduUV81DEnBw@mail.gmail.com>
 <20190713235430.GZ14074@gate.crashing.org>
 <87v9w393r5.fsf@concordia.ellerman.id.au>
 <20190715072959.GB20882@gate.crashing.org>
 <87pnma89ak.fsf@concordia.ellerman.id.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pnma89ak.fsf@concordia.ellerman.id.au>
User-Agent: Mutt/1.4.2.3i
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Paul Mackerras <paulus@samba.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 16, 2019 at 10:15:47PM +1000, Michael Ellerman wrote:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
> And it's definitely calling ar with no flags, eg:
> 
>   rm -f init/built-in.a; powerpc-linux-ar rcSTPD init/built-in.a init/main.o init/version.o init/do_mounts.o init/do_mounts_rd.o init/do_mounts_initrd.o init/do_mounts_md.o init/initramfs.o init/init_task.o

This uses thin archives.  Those will work fine.

The failing case was empty files IIRC, stuff created from no inputs.

> So presumably at some point ar learnt to cope with objects that don't
> match its default? (how do I ask it what its default is?)

The first supported target in the --help list is the default, I think?

$ powerpc-linux-ar --help
 [...]
powerpc-linux-ar: supported targets: elf32-powerpc aixcoff-rs6000 elf32-powerpcle ppcboot elf64-powerpc elf64-powerpcle elf64-little elf64-big elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex

$ powerpc64-linux-ar --help
 [...]
powerpc64-linux-ar: supported targets: elf64-powerpc elf64-powerpcle elf32-powerpc elf32-powerpcle aixcoff-rs6000 aixcoff64-rs6000 aix5coff64-rs6000 elf64-little elf64-big elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex

$ powerpc64le-linux-ar --help
 [...]
powerpc64le-linux-ar: supported targets: elf64-powerpcle elf64-powerpc elf32-powerpcle elf32-powerpc aixcoff-rs6000 aixcoff64-rs6000 aix5coff64-rs6000 elf64-little elf64-big elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex

$ powerpcle-linux-ar --help
 [...]
powerpcle-linux-ar: supported targets: elf32-powerpcle aixcoff-rs6000 elf32-powerpc ppcboot elf64-powerpc elf64-powerpcle elf64-little elf64-big elf32-little elf32-big plugin srec symbolsrec verilog tekhex binary ihex

> > Then again, does that work at *all* nowadays?  Do we even consider that
> > important, *should* it work?
> 
> Yes and yes. There were a lot of bugs in the kernel makefiles after we
> added LE support which prevented a biarch/biendian compiler from working.
> But now it does work and we want it to keep working because it means you
> can have a single compiler for building 32-bit, 64-bit BE & 64-bit LE.

Good to hear :-)


Segher
