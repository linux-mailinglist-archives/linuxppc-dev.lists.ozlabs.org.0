Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C20F9852834
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 06:24:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U8AnevQX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TYqWJ4lTpz3dVm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 16:24:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=U8AnevQX;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TYqVZ1lhBz3blb
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Feb 2024 16:23:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707801814;
	bh=+E1HErWM5xFmNg1BqO70tvM6TCMQeHvbFhSJJ5P6LZQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U8AnevQX52O+tdAKYXmbDnbXbdb6QNeA7oGOe6P/LhY/InUZUVRrMYnnr20Nel3AZ
	 /IucdFtczzftJ0BoXnMvUe08ym8psqtOGFLcIyS96vaHGpIKS0hgFIecgwRNSHVnaA
	 kCL/YcOhibmlf2djWX/wl2kHa2U86bQCa9mxWQkakmkhtGsnnsEmMyVIRxXTkUaV/g
	 6+rI0xu+3pEyohZfi3hNtM88Io7Rq1gPhH/hgV6Y1qUhsrEDITKkWleqftkGG1LhRj
	 GCU8ZvVL+pNCPA6Yto33oyb6U/chOUl5NstQSVxTj0FV0HIwCRHbsgjzy0ApcOxY8T
	 wWY/CoZlEPdEw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TYqVY4lHGz4wcQ;
	Tue, 13 Feb 2024 16:23:33 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Timothy Pearson <tpearson@raptorengineering.com>, Segher Boessenkool
 <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
In-Reply-To: <325865766.14859393.1707762675351.JavaMail.zimbra@raptorengineeringinc.com>
References: <995988479.14839534.1707756078600.JavaMail.zimbra@raptorengineeringinc.com>
 <20240212170207.GW19790@gate.crashing.org>
 <1251499652.14843228.1707757778984.JavaMail.zimbra@raptorengineeringinc.com>
 <20240212173043.GX19790@gate.crashing.org>
 <572013249.14851324.1707759979044.JavaMail.zimbra@raptorengineeringinc.com>
 <20240212175906.GY19790@gate.crashing.org>
 <1119220086.14855806.1707761223318.JavaMail.zimbra@raptorengineeringinc.com>
 <20240212182322.GZ19790@gate.crashing.org>
 <325865766.14859393.1707762675351.JavaMail.zimbra@raptorengineeringinc.com>
Date: Tue, 13 Feb 2024 16:23:30 +1100
Message-ID: <87r0hh6ip9.fsf@mail.lhotse>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Timothy Pearson <tpearson@raptorengineering.com> writes:
> ----- Original Message -----
>> From: "Segher Boessenkool" <segher@kernel.crashing.org>
>> To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> Sent: Monday, February 12, 2024 12:23:22 PM
>> Subject: Re: [PATCH] powerpc: Add gpr1 and fpu save/restore functions
>
>> On Mon, Feb 12, 2024 at 12:07:03PM -0600, Timothy Pearson wrote:
>>> > I have done it for *all* architectures some ten years ago.  Never found
>>> > any problem.
>>> 
>>> That makes sense, what I mean by invasive is that we'd need buy-in from the
>>> other
>>> maintainers across all of the affected architectures.  Is that likely to occur?
>> 
>> I don't know.  Here is my PowerPC-specific patch, it's a bit older, it
>> might not apply cleanly anymore, the changes needed should be obvious
>> though:
>> 
>> 
>> === 8< ===
>> commit f16dfa5257eb14549ce22243fb2b465615085134
>> Author: Segher Boessenkool <segher@kernel.crashing.org>
>> Date:   Sat May 3 03:48:06 2008 +0200
>> 
>>    powerpc: Link vmlinux against libgcc.a
>> 
>> diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
>> index b7212b619c52..0a2fac6ffc1c 100644
>> --- a/arch/powerpc/Makefile
>> +++ b/arch/powerpc/Makefile
>> @@ -158,6 +158,9 @@ core-y                              += arch/powerpc/kernel/
>> core-$(CONFIG_XMON)            += arch/powerpc/xmon/
>> core-$(CONFIG_KVM)             += arch/powerpc/kvm/
>> 
>> +LIBGCC := $(shell $(CC) $(KBUILD_CFLAGS) -print-libgcc-file-name)
>> +libs-y += $(LIBGCC)
>> +
>> drivers-$(CONFIG_OPROFILE)     += arch/powerpc/oprofile/
>> 
>> # Default to zImage, override when needed
>> === 8< ===
>
> OK.  PowerPC maintainers, how would you prefer to handle this?

I'll take the patch to add the functions for now. We can look into
linking against libgcc as a future cleanup.

>>> > There are better options than -Os, fwiw.  Some --param's give smaller
>>> > *and* faster kernels.  What exactly is best is heavily arch-dependent
>>> > though (as well as dependent on the application code, the kernel code in
>>> > this case) :-(
>>> 
>>> I've been through this a few times, and -Os is the only option that makes
>>> things (just barely) fit unfortunately.
>> 
>> -O2 with appropriate inlining tuning beats -Os every day of the week,
>> in my experience.
>
> On 6.6 it's 24MiB vs 40MiB, O2 vs. Os. :(

What compiler/config etc. are you using for that?

I see almost no difference, though the defconfig (which uses -O2) is
actually smaller:

$ ls -l vmlinux.Os vmlinux.defconfig
-rwxr-xr-x. 1 michael michael 49936640 Feb 13 16:11 vmlinux.defconfig*
-rwxr-xr-x. 1 michael michael 50108392 Feb 13 16:14 vmlinux.Os*

cheers
