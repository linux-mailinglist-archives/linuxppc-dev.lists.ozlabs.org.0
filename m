Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2CD3D9EE5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 09:41:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gb2Xv2FRkz3cTm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Jul 2021 17:41:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=bzYwGqsr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=bzYwGqsr; 
 dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gb2XR46pQz306q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jul 2021 17:41:26 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gb2XN0KHTz9sSs;
 Thu, 29 Jul 2021 17:41:21 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1627544486;
 bh=mENbTFftgvJx8DU6xsFY2if7tbPMBXp10sSUBs2kSsc=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=bzYwGqsrUAvKyxoMuKy+9akMZQylkXE3q00gvLvl/A8lt8IFc94iPnnE7WooJUclu
 VRMDSCwvzCqOzNGoSNV2kysJHP3fH2zN9HcrYLTSj/+KL7l0erD0obIXoTucBdVEvZ
 MgsH4DXmAEkePASbOGy81AlUpIudtJdSTWvAU/UyOE4yfnrzxyxgJrAU5maVGzcD6Q
 oRQSrzxs6PhR1lZiIY0D2wANdduuCEFag9olYSzkbH3yGpYBN3s/I1IGoKUrHFBi56
 FR14eROgD2ZPmK/Or5zhQBVedsnOfIamxUVCL7fLTSNNeBnb9IsxTsVAlGuGVEQ6Td
 U3+rWrMvngQ/A==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Paul Menzel <pmenzel@molgen.mpg.de>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Christophe
 Leroy <christophe.leroy@csgroup.eu>
Subject: Re: Possible regression by ab037dd87a2f (powerpc/vdso: Switch VDSO
 to generic C implementation.)
In-Reply-To: <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
References: <a273c619-9258-e29a-24c3-ea47a13c4817@molgen.mpg.de>
 <3661999754da1a5e5c810fa669654cc7db95b059.camel@kernel.crashing.org>
 <4f037af0-5066-ebb9-53a6-733b3bd8eeac@molgen.mpg.de>
 <878s1q1udj.fsf@mpe.ellerman.id.au>
 <b5f948b4-759d-bb9f-06aa-6c15d37cd2bb@molgen.mpg.de>
Date: Thu, 29 Jul 2021 17:41:20 +1000
Message-ID: <875ywt1s9r.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Derek Parker <parkerderek86@gmail.com>, Dmitrii Okunev <xaionaro@gmail.com>,
 murp@ibm.com, linuxppc-dev@lists.ozlabs.org, laboger@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Paul Menzel <pmenzel@molgen.mpg.de> writes:

> Dear Michael,
>
>
> Am 28.07.21 um 14:43 schrieb Michael Ellerman:
>> Paul Menzel <pmenzel@molgen.mpg.de> writes:
>>> Am 28.07.21 um 01:14 schrieb Benjamin Herrenschmidt:
>>>> On Tue, 2021-07-27 at 10:45 +0200, Paul Menzel wrote:
>>>
>>>>> On ppc64le Go 1.16.2 from Ubuntu 21.04 terminates with a segmentation
>>>>> fault [1], and it might be related to *[release-branch.go1.16] runtim=
e:
>>>>> fix crash during VDSO calls on PowerPC* [2], conjecturing that commit
>>>>> ab037dd87a2f (powerpc/vdso: Switch VDSO to generic C implementation.)
>>>>> added in Linux 5.11 causes this.
>>>>>
>>>>> If this is indeed the case, this would be a regression in userspace. =
Is
>>>>> there a generic fix or should the change be reverted?
>>>>
>>>>  From the look at the links you posted, this appears to be completely
>>>> broken assumptions by Go that some registers don't change while calling
>>>> what essentially are external library functions *while inside those
>>>> functions* (ie in this case from a signal handler).
>>>>
>>>> I suppose it would be possible to build the VDSO with gcc arguments to
>>>> make it not use r30, but that's just gross...
>>>
>>> Thank you for looking into this. No idea, if it falls under Linux=E2=80=
=99 no
>>> regression policy or not.
>>=20
>> Reluctantly yes, I think it does. Though it would have been good if it
>> had been reported to us sooner.
>>=20
>> It looks like that Go fix is only committed to master, and neither of
>> the latest Go 1.16 or 1.15 releases contain the fix? ie. there's no way
>> for a user to get a working version of Go other than building master?
>
> I heard it is going to be in Go 1.16.7, but I do not know much about Go.=
=20
> Maybe the folks in Cc can chime in.
>
>> I'll see if we can work around it in the kernel. Are you able to test a
>> kernel patch if I send you one?
>
> Yes, I could test a Linux kernel patch on ppc64le (POWER 8) running=20
> Ubuntu 21.04.

Thanks, would be great if you can test on your setup. Patch below.

I haven't been able to reproduce the crash by following the instructions
in your bug report, I have go1.13.8, I guess the crash is only in newer
versions?

cheers


diff --git a/arch/powerpc/kernel/vdso64/Makefile b/arch/powerpc/kernel/vdso=
64/Makefile
index 2813e3f98db6..3c5baaa6f1e7 100644
--- a/arch/powerpc/kernel/vdso64/Makefile
+++ b/arch/powerpc/kernel/vdso64/Makefile
@@ -27,6 +27,13 @@ KASAN_SANITIZE :=3D n
=20
 ccflags-y :=3D -shared -fno-common -fno-builtin -nostdlib \
 	-Wl,-soname=3Dlinux-vdso64.so.1 -Wl,--hash-style=3Dboth
+
+# Go prior to 1.16.x assumes r30 is not clobbered by any VDSO code. That u=
sed to be true
+# by accident when the VDSO was hand-written asm code, but may not be now =
that the VDSO is
+# compiler generated. To avoid breaking Go tell GCC not to use r30. Impact=
 on code
+# generation is minimal, it will just use r29 instead.
+ccflags-y +=3D $(call cc-option, -ffixed-r30)
+
 asflags-y :=3D -D__VDSO64__ -s
=20
 targets +=3D vdso64.lds

