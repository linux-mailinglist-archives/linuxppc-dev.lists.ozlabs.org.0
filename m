Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 964652DB947
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 03:42:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CwfYc2HSvzDqPM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Dec 2020 13:42:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CwfXG1DmyzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Dec 2020 13:41:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=KNE3sRs6; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4CwfXF6hFvz9sRf; Wed, 16 Dec 2020 13:41:33 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4CwfXF4hpWz9sRR;
 Wed, 16 Dec 2020 13:41:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1608086493;
 bh=jxRt70R2dqxRSiO5KrASIJCh6a0EmXtEBpIJgqXzLk8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=KNE3sRs6YAih7qL2KmHBliRs+lwK+MTsQbPEVg9vVjz7RU4hdr/w4qexdKyicRSGI
 dKBQp0m0IOKJHXndCBGBiOnXVw7U/EIUahDM13kAnlEvdVLsG2hvhAq/SqdcpgsVX1
 7IG6SgkoVt+2lBzEpMFfuAFial5Od0geRGHSj/N4dZ3t4JNOugdA21rf/m5etJul19
 mx3d9MIuYW3N1UUOsOiF1Hz+PeKaibgElJv41iFF3ZAPJJ0uQWtyFFamFGWNdFCET+
 KCaaISM5gP8RI3wvIa2ODUfA7xOM355QPp3VQOCNxhosjY8UEI8J8hUcCfrpSa1wa0
 KgRDxSdDtOwPg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Masahiro Yamada <masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc/boot: Fix build of dts/fsl
In-Reply-To: <CAK7LNASJcp=U9sKo9FVdkGNWXu7TGDL2zE-hFQymtfvUhY5+wA@mail.gmail.com>
References: <20201215032906.473460-1-mpe@ellerman.id.au>
 <CAK7LNASJcp=U9sKo9FVdkGNWXu7TGDL2zE-hFQymtfvUhY5+wA@mail.gmail.com>
Date: Wed, 16 Dec 2020 13:41:30 +1100
Message-ID: <87zh2exyjp.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Masahiro Yamada <masahiroy@kernel.org> writes:
> On Tue, Dec 15, 2020 at 12:29 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
>>
>> The lkp robot reported that some configs fail to build, for example
>> mpc85xx_smp_defconfig, with:
>>
>>   cc1: fatal error: opening output file arch/powerpc/boot/dts/fsl/.mpc8540ads.dtb.dts.tmp: No such file or directory
>>
>> This bisects to:
>>   cc8a51ca6f05 ("kbuild: always create directories of targets")
>>
>> Although that commit claims to be about in-tree builds, it somehow
>> breaks out-of-tree builds. But presumably it's just exposing a latent
>> bug in our Makefiles.
>>
>> We can fix it by adding to targets for dts/fsl in the same way that we
>> do for dts.
>>
>> Fixes: cc8a51ca6f05 ("kbuild: always create directories of targets")
>> Reported-by: kernel test robot <lkp@intel.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
>>  arch/powerpc/boot/Makefile | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/arch/powerpc/boot/Makefile b/arch/powerpc/boot/Makefile
>> index 68a7534454cd..c3e084cceaed 100644
>> --- a/arch/powerpc/boot/Makefile
>> +++ b/arch/powerpc/boot/Makefile
>> @@ -372,6 +372,8 @@ initrd-y := $(filter-out $(image-y), $(initrd-y))
>>  targets        += $(image-y) $(initrd-y)
>>  targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
>>                 $(patsubst $(x).%, dts/%.dtb, $(filter $(x).%, $(image-y))))
>> +targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
>> +               $(patsubst $(x).%, dts/fsl/%.dtb, $(filter $(x).%, $(image-y))))
>>
>>  $(addprefix $(obj)/, $(initrd-y)): $(obj)/ramdisk.image.gz
>>
>
>
> Some freescale dts files are right under arch/powerpc/boot/dts/,
> but some are in the fsl/ subdirectory.
> I do not understand the policy.

There isn't a policy. Best I can tell Kumar felt like it would be
cleaner to have a separate directory for (some of) the Freescale DTS
files, when he initially submitted them ~9 years ago.


> If "fsl/" is a very special case,
> I just thought we could add a new syntax, fslimage-y,
> but I do not mind either way.

OK. If you don't mind I'll merge my patch as a quick fix for now.

Then we can probably move all the fsl/ files up one level and avoid the
problem entirely in future.

> fslimage-$(CONFIG_MPC8540_ADS) += cuImage.mpc8540ads
>
> targets += $(foreach x, dtbImage uImage cuImage simpleImage treeImage, \
>                $(patsubst $(x).%, dts/fsl/%.dtb, $(filter $(x).%,
> $(fslimage-y))))
>
>
> This Makefile is wrong over-all anyway.

Excellent.

cheers
