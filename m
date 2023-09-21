Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C4FA7AA5D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 01:51:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ai6593xB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsBxX1FBbz3cbq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 09:51:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=ai6593xB;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RsBwh4Khzz3bcS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 09:50:28 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1695340228;
	bh=UUmux8/Cg3ThyE8UwqG2/nXFVX8BSQmnhjAf5f0s7Qo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ai6593xBSTRx0fCOrgZMlKzEr0DfS3sIswGFwktvHA/5e4hVScmF4Mp7P6Wwxhf+U
	 P9jq+ZYJllCH+gXhwqRbLAygJxl1fOiDdW8qSiv76wbndCKpDyBYm+XGHplTRB+VnL
	 BYodGXuqfwe72zTxaRkVsPWOxOZLJZlAxj49EZDpVNAPK0/i1s1ttWb2mpvF+HQHQa
	 dpjc3Gl/UW9y63AQRBKMJRMWUYRp2xY245+oEI9KudGzxaQlKPNIft+9wuBZ+UKxmY
	 XjBZ09dllD8GZYneLEQka5iwlA6JxnVVqJHyHOqRDhzFBwrgdbUxeaPQktZ29+kmV5
	 wQ10mrDpgMqZg==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RsBwf14Pwz4x5G;
	Fri, 22 Sep 2023 09:50:25 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Yuan Tan <tanyuan@tinylab.org>, christophe.leroy@csgroup.eu
Subject: Re: [PATCH v3 1/3] powerpc/config: Cleanup pmac32_defconfig
In-Reply-To: <A81E00EBD697C30F+9c7a7721-e949-4ca6-a6b3-8eeb181718f2@tinylab.org>
References: <cover.1694685860.git.tanyuan@tinylab.org>
 <23b30e8e9e31e7a6af4aa7d317699e1538ad89c2.1694685860.git.tanyuan@tinylab.org>
 <87y1h87vf3.fsf@mail.lhotse>
 <A81E00EBD697C30F+9c7a7721-e949-4ca6-a6b3-8eeb181718f2@tinylab.org>
Date: Fri, 22 Sep 2023 09:50:25 +1000
Message-ID: <87o7hvm6gu.fsf@mail.lhotse>
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
Cc: Philippe =?utf-8?Q?Ma?= =?utf-8?Q?thieu-Daud=C3=A9?= <philmd@linaro.org>, linux@weissschuh.net, linux-kernel@vger.kernel.org, falcon@tinylab.org, linuxppc-dev@lists.ozlabs.org, w@1wt.eu
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Yuan Tan <tanyuan@tinylab.org> writes:
> On 9/14/2023 9:10 PM, Michael Ellerman wrote:
>> Yuan Tan <tanyuan@tinylab.org> writes:
>>> Use 'make savedefconfig' to cleanup pmac32_defconfig, based on Linux
>>> 7.6-rc1
>> Thanks but I don't like doing these updates in a single commit like
>> this, it's easy to accidentally lose a symbol.
> Yeah I have the same concerns too.
>>
>> I prefer an explanation for what's changing for each symbol. See
>> 1ce7fda142af ("powerpc/configs/64s: Drop IPV6 which is default y") and
>> the commits leading up to it, to see what I mean.
>>
>> But I suspect you probably don't want to go to all that effort, which is
>> fine :)
>
> I am not familiar with other options, so I'd better not do that. :)
>
> By the way, just to be cautious, since the defconfig can only be updated
> by 'savedefconfig'[1], how can we write an explanation for a single
> change in an option?

Well the defconfig can be updated manually, but the changes you make
manually should match what savedefconfig would do.

> I mean, when I change one option, the value of the other undetermined
> option will be set just like in patch 1.

At that point I just stage the change to the option I'm changing, and
leave the other lines modified by savedefconfig alone. That way you can
commit the changes made by savedefconfig in multiple steps, explaining
what happens along the way, and the end result is the same as what
savedefconfig generates.

So for example at the moment if you do savedefconfig on
pmac32_defconfig, the start of the diff looks like:

 1  diff --git a/arch/powerpc/configs/pmac32_defconfig b/arch/powerpc/configs/pmac32_defconfig
 2  index 57ded82c2840..17df965be099 100644
 3  --- a/arch/powerpc/configs/pmac32_defconfig
 4  +++ b/arch/powerpc/configs/pmac32_defconfig
 5  @@ -1,4 +1,3 @@
 6  -CONFIG_ALTIVEC=y
 7   # CONFIG_LOCALVERSION_AUTO is not set
 8   CONFIG_SYSVIPC=y
 9   CONFIG_POSIX_MQUEUE=y
10  @@ -8,12 +7,8 @@ CONFIG_IKCONFIG=y
11   CONFIG_IKCONFIG_PROC=y
12   CONFIG_LOG_BUF_SHIFT=14
13   CONFIG_BLK_DEV_INITRD=y
14  -# CONFIG_COMPAT_BRK is not set
15   CONFIG_PROFILING=y
16  -CONFIG_MODULES=y
17  -CONFIG_MODULE_UNLOAD=y
18  -CONFIG_MODULE_FORCE_UNLOAD=y
19 -CONFIG_PARTITION_ADVANCED=y
20 +CONFIG_ALTIVEC=y
21  # CONFIG_PPC_CHRP is not set
22  CONFIG_CPU_FREQ=y
23  CONFIG_CPU_FREQ_GOV_POWERSAVE=y

So you can stage lines 6 and 20, and commit that as "Update for symbol
movement", ie. nothing changed other than a symbol moved.

Then repeat that until eventually the config is up to date.

cheers
