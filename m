Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 87BB1851CC6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Feb 2024 19:32:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Xjsrf0AD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYY2m3FN5z3dTx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 05:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=Xjsrf0AD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYY2227dSz3c9N
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 05:31:22 +1100 (AEDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1731482858BF;
	Mon, 12 Feb 2024 12:31:20 -0600 (CST)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id DnVsjHMD_Z4B; Mon, 12 Feb 2024 12:31:19 -0600 (CST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A59F082869FE;
	Mon, 12 Feb 2024 12:31:18 -0600 (CST)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com A59F082869FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1707762678; bh=A/mGaV56iTwK4lYhlcILOF3yQZ5/1LqF7+lo3iETghY=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=Xjsrf0ADGp4ww+XBzNaDgzh9RX25X+Vi9jQMi2sfTECOa37IQAPj1X3DDmuUaG3vN
	 3cP77sQE+WWZ8SWvZC+CaYAknawlqeSNfJFywdvZ/dwsBI+U1Z6m88CtKuc5G49MDx
	 8ZB/+Di78k3DimPlVftglfOrfl498ueeTOODcQdU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id gvwBtj3NM_bE; Mon, 12 Feb 2024 12:31:18 -0600 (CST)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id D24F882858BF;
	Mon, 12 Feb 2024 12:31:17 -0600 (CST)
Date: Mon, 12 Feb 2024 12:31:15 -0600 (CST)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Segher Boessenkool <segher@kernel.crashing.org>
Message-ID: <325865766.14859393.1707762675351.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20240212182322.GZ19790@gate.crashing.org>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com> <20240212170207.GW19790@gate.crashing.org> <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com> <20240212173043.GX19790@gate.crashing.org> <572013249.14851324.1707759979044.JavaMail.zimbra@raptorengineeringinc.com> <20240212175906.GY19790@gate.crashing.org> <1119220086.14855806.1707761223318.JavaMail.zimbra@raptorengineeringinc.com> <20240212182322.GZ19790@gate.crashing.org>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC121 (Linux)/8.5.0_GA_3042)
Thread-Topic: powerpc: Add gpr1 and fpu save/restore functions
Thread-Index: M8EfAG9TweDUBgb0UjkOkRt+r33M6g==
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



----- Original Message -----
> From: "Segher Boessenkool" <segher@kernel.crashing.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, February 12, 2024 12:23:22 PM
> Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions

> On Mon, Feb 12, 2024 at 12:07:03PM -0600, Timothy Pearson wrote:
>> > I have done it for *all* architectures some ten years ago.  Never found
>> > any problem.
>> 
>> That makes sense, what I mean by invasive is that we'd need buy-in from the
>> other
>> maintainers across all of the affected architectures.  Is that likely to occur?
> 
> I don't know.  Here is my PowerPC-specific patch, it's a bit older, it
> might not apply cleanly anymore, the changes needed should be obvious
> though:
> 
> 
> === 8< ===
> commit f16dfa5257eb14549ce22243fb2b465615085134
> Author: Segher Boessenkool <segher@kernel.crashing.org>
> Date:   Sat May 3 03:48:06 2008 +0200
> 
>    powerpc: Link vmlinux against libgcc.a
> 
> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> index b7212b619c52..0a2fac6ffc1c 100644
> --- a/arch/powerpc/Makefile
> +++ b/arch/powerpc/Makefile
> @@ -158,6 +158,9 @@ core-y                              += arch/powerpc/kernel/
> core-$(CONFIG_XMON)            += arch/powerpc/xmon/
> core-$(CONFIG_KVM)             += arch/powerpc/kvm/
> 
> +LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
> +libs-y += $(LIBGCC)
> +
> drivers-$(CONFIG_OPROFILE)     += arch/powerpc/oprofile/
> 
> # Default to zImage, override when needed
> === 8< ===

OK.  PowerPC maintainers, how would you prefer to handle this?

>> > There are better options than -Os, fwiw.  Some --param's give smaller
>> > *and* faster kernels.  What exactly is best is heavily arch-dependent
>> > though (as well as dependent on the application code, the kernel code in
>> > this case) :-(
>> 
>> I've been through this a few times, and -Os is the only option that makes
>> things (just barely) fit unfortunately.
> 
> -O2 with appropriate inlining tuning beats -Os every day of the week,
> in my experience.

On 6.6 it's 24MiB vs 40MiB, O2 vs. Os. :(
