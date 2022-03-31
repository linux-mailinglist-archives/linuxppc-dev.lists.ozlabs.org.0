Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 20BED4EE4E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 01:48:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KV0Nb0Zqrz3c2L
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Apr 2022 10:47:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57;
 helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org;
 receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KV0NB51ymz2xsW
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Apr 2022 10:47:38 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 22VNiYVi027134;
 Thu, 31 Mar 2022 18:44:34 -0500
Received: (from segher@localhost)
 by gate.crashing.org (8.14.1/8.14.1/Submit) id 22VNiYiH027133;
 Thu, 31 Mar 2022 18:44:34 -0500
X-Authentication-Warning: gate.crashing.org: segher set sender to
 segher@kernel.crashing.org using -f
Date: Thu, 31 Mar 2022 18:44:33 -0500
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Murilo Opsfelder =?iso-8859-1?Q?Ara=FAjo?= <mopsfelder@gmail.com>
Subject: Re: [PATCH] powerpc/boot: Build wrapper for an appropriate CPU
Message-ID: <20220331234433.GB614@gate.crashing.org>
References: <20220330112437.540214-1-joel@jms.id.au>
 <815770fb-3247-baab-f8ca-eed7b99213d1@gmail.com>
 <CACPK8XdremqtJBKycbFZauky9C9yCb2S7+aZDxRtZ8fU41L=Ew@mail.gmail.com>
 <167db0bd-4f10-7751-36a2-fb9ec5b136a7@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <167db0bd-4f10-7751-36a2-fb9ec5b136a7@gmail.com>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Joel Stanley <joel@jms.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 31, 2022 at 12:19:52PM -0300, Murilo Opsfelder Araújo wrote:
> My understanding is that the default cpu type for -mcpu=powerpc64 can 
> change.

Different subtargets (Linux, AIX, Darwin, the various BSDs, bare ELF,
etc.) have different default CPUs.  It also can be set at configure time
for most subtargets.

Linux can be built with compilers not targetting *-linux*, so it would
be best to specify a specific CPU always.

> >I did a little test using my buildroot compiler which has
> >with-cpu=power10. I used the presence of PCREL relocations as evidence
> >that it was build for power10.
> >
> >$ powerpc64le-buildroot-linux-gnu-gcc -mcpu=power10 -c test.c
> >$ readelf -r test.o |grep -c PCREL
> >24
> 
> It respected the -mcpu=power10 you provided.

Of course.

> And that's my concern.  We're relying on the compiler default cpu type.

That is not the compiler default.  It is the default from who built the
compiler.  It can vary wildly and unpredictably.

The actual compiler default will not change so easily at all, basically
only when its subtarget drops support for an older CPU.

> If gcc defaults -mcpu=powerpc64le to power10, you're going to have
> the same problem again.

That will not happen before power10 is the minimum supported CPU.
Anything else is madness.

> It happens that the power8 default cpu type
> is compatible to your system by coincidence.

No, power8 is (and always was) the minimum supported CPU type for
powerpc64le-linux.

> In gcc/config/rs6000/rs6000-cpus.def, they are set to different processors:
> 
>     254 RS6000_CPU ("powerpc64", PROCESSOR_POWERPC64, MASK_PPC_GFXOPT | 
>     MASK_POWERPC64)
>     255 RS6000_CPU ("powerpc64le", PROCESSOR_POWER8, MASK_POWERPC64 | 
>     ISA_2_7_MASKS_SERVER

Those can and will change though, over time.  But -mcpu=powerpc64 (etc.)
always will mean what the current documentation says it does:
     '-mcpu=powerpc', '-mcpu=powerpc64', and '-mcpu=powerpc64le' specify
     pure 32-bit PowerPC (either endian), 64-bit big endian PowerPC and
     64-bit little endian PowerPC architecture machine types, with an
     appropriate, generic processor model assumed for scheduling
     purposes.

> My suggestion was to explicitly set -mcpu=power8 instead of 
> -mcpu=powerpc64le.

That is implied anyway, it is the minimum supported for
powerpc64le-linux.  Using -mcpu=powerpc64le might schedule better for
newer CPUs, in the future (but the code will always work on all still
supported CPUs).


Segher
