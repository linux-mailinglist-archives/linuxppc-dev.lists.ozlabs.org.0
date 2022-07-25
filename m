Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6617E5806FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 23:55:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsDPc2Clfz3c61
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 07:55:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LsDPC1XHqz2xjm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 07:55:26 +1000 (AEST)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 26PLsH2x002031;
	Mon, 25 Jul 2022 16:54:17 -0500
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 26PLsGqG002027;
	Mon, 25 Jul 2022 16:54:16 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Mon, 25 Jul 2022 16:54:16 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: Regression: Linux v5.15+ does not boot on Freescale P2020
Message-ID: <20220725215416.GV25951@gate.crashing.org>
References: <20220722090929.mwhmxxdd7yioxqpz@pali> <6b227478-73b8-2a97-1c78-89570d928739@csgroup.eu> <20220723150702.jecerkhxhy65dgww@pali> <875yjld2oe.fsf@mpe.ellerman.id.au> <20220725125256.cg6su4d2ageylvp6@pali> <e2487668-b6d9-9ddb-1bb4-9f4d37fae1a7@csgroup.eu> <20220725201009.gwuchzswcqaxntrk@pali>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220725201009.gwuchzswcqaxntrk@pali>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 10:10:09PM +0200, Pali Rohár wrote:
> On Monday 25 July 2022 16:20:49 Christophe Leroy wrote:
> Now I did again clean test with same Debian 10 cross compiler.
> 
> $ git clone https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git && cd linux
> $ git checkout v5.15
> $ make mpc85xx_smp_defconfig ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnuspe-
> $ make vmlinux ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnuspe-
> $ cp -a vmlinux vmlinux.v5.15
> $ git revert 9401f4e46cf6965e23738f70e149172344a01eef
> $ make vmlinux ARCH=powerpc CROSS_COMPILE=powerpc-linux-gnuspe-
> $ cp -a vmlinux vmlinux.revert
> $ powerpc-linux-gnuspe-objdump -d vmlinux.revert > vmlinux.revert.dump
> $ powerpc-linux-gnuspe-objdump -d vmlinux.v5.15 > vmlinux.v5.15.dump
> $ diff -Naurp vmlinux.v5.15.dump vmlinux.revert.dump
> 
> And there are:
> 
> -c000c304:      7d 20 f8 29     lwarx   r9,0,r31,1
> +c000c304:      7d 20 f8 28     lwarx   r9,0,r31
> 
> I guess it must be reproducible this issue as I'm using regular
> toolchain from distribution.

The kernel had

#define PPC_RAW_LWARX(t, a, b, eh)       (0x7c000028 | ___PPC_RT(t) | ___PPC_RA(a) | ___PPC_RB(b) | __PPC_EH(eh))

and

#define PPC_LWARX(t, a, b, eh) stringify_in_c(.long PPC_RAW_LWARX(t, a, b, eh))

and

#ifdef CONFIG_PPC64
#define __PPC_EH(eh)    (((eh) & 0x1) << 0)
#else
#define __PPC_EH(eh)    0
#endif

but Christophe's 9401f4e46cf6 changed

-"1:    " PPC_LWARX(%0,0,%2,1) "\n\
+"1:    lwarx           %0,0,%2,1\n\

no longer checking CONFIG_PPC64.  That appears to be the bug.

The EH field in larx insns is new since ISA 2.05, and some ISA 1.x cpu
implementations actually raise an illegal insn exception on EH=1.  It
appears P2020 is one of those.


Segher
