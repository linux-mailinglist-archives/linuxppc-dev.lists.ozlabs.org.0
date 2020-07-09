Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC0AE219DA4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 12:22:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2XL071ZCzDr6x
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 20:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vAFl0E6H; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2XHn2lqYzDqgs
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 20:20:37 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id x72so828450pfc.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Jul 2020 03:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=K1VxGPW0xuJmXA1rhdwVLxJA7czyM/CyNjmy8WBsRv4=;
 b=vAFl0E6HBeNrm26G8P0UQdOfXgqNlJcA/tct4oKyTFUwEd43U7dI8PbkM8WGgVIowk
 JzOfLvU81ZaMeTJzi15ONkYEhz8ZdK1bWR7BWVaIJs/P8JDNNQZ4C6ygk426LLZ1i6Ur
 FSzzF+6FLikQrB7ZepCeoeEROzURE/Dh8X1u0DbLBpr2ry99jml6TiaDBUgmGT2TZjot
 Bs/VL2qJTGoqSBj1njDvTMQmdGXXJaLZAQkf7dMbet9Ig0o24iRlaaiRDvelEBe4Vlmq
 4o1KND3JDQfEv+NoULX20gLL2VRHXrUZDwdaew59oF71+DhmqI90PweEtb3EfegD5Mb6
 BlTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=K1VxGPW0xuJmXA1rhdwVLxJA7czyM/CyNjmy8WBsRv4=;
 b=D79ZoUFESufRGMgn3ScI/ZJ9slCVd3zY7vNKZrmJecsx04CVLcYaMyfQt5SYp1QVx2
 fqpZzFOX3UdefGa07XrXStd1qu2nPatE8Q66MuWj0Hgs+T4hfay8kXVok3ulr1auUHtZ
 qEGDnjNshznRSGAYh1bAdvJk+bqmW5NxOTH4nEaIgKtbYeYtrgpYy7RfHk5ZG7c0AX2i
 sXICmcth/Q/xX+qWGyax/6/NGIfyihFWHWXaPdzya+NGTD1wkmqgGzeNFQuqnfyK/JYu
 4P4tlD27fTM5ps5dJ+R+4A2Ac4e0vzI0r3sagMcxBdaHadieDbtwM1lWrzfDWrpv7lAs
 /1ww==
X-Gm-Message-State: AOAM531wuANjC93qmOY+Gd8wkF1e7++Q47nwu1VfDiakYFZHDeefKz9/
 9wkzIBpgmBTr2I5QW/k7+Ok=
X-Google-Smtp-Source: ABdhPJyK/kHRiKtUEQazqsog0g6PKjmX1zO9iglcz1L9RZo+7iGTY/FgnI/8ZzYcrflQm4qNDWLuzw==
X-Received: by 2002:a63:ab0d:: with SMTP id p13mr52941361pgf.327.1594290031443; 
 Thu, 09 Jul 2020 03:20:31 -0700 (PDT)
Received: from localhost (27-33-0-186.tpgi.com.au. [27.33.0.186])
 by smtp.gmail.com with ESMTPSA id z2sm2453364pfq.67.2020.07.09.03.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 03:20:30 -0700 (PDT)
Date: Thu, 09 Jul 2020 20:20:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 2/3] powerpc/64s: remove PROT_SAO support
To: David Gibson <david@gibson.dropbear.id.au>, Paul Mackerras
 <paulus@ozlabs.org>
References: <20200703011958.1166620-1-npiggin@gmail.com>
 <20200703011958.1166620-3-npiggin@gmail.com>
 <20200709043406.GB2822576@thinks.paulus.ozlabs.org>
In-Reply-To: <20200709043406.GB2822576@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1594288843.m3s9igh1hu.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
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
Cc: linux-api@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kvm-ppc@vger.kernel.org, linux-mm@kvack.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of July 9, 2020 2:34 pm:
> On Fri, Jul 03, 2020 at 11:19:57AM +1000, Nicholas Piggin wrote:
>> ISA v3.1 does not support the SAO storage control attribute required to
>> implement PROT_SAO. PROT_SAO was used by specialised system software
>> (Lx86) that has been discontinued for about 7 years, and is not thought
>> to be used elsewhere, so removal should not cause problems.
>>=20
>> We rather remove it than keep support for older processors, because
>> live migrating guest partitions to newer processors may not be possible
>> if SAO is in use (or worse allowed with silent races).
>=20
> This is actually a real problem for KVM, because now we have the
> capabilities of the host affecting the characteristics of the guest
> virtual machine in a manner which userspace (e.g. QEMU) is unable to
> control.
>=20
> It would probably be better to disallow SAO on all machines than have
> it available on some hosts and not others.  (Yes I know there is a
> check on CPU_FTR_ARCH_206 in there, but that has been a no-op since we
> removed the PPC970 KVM support.)

This change doesn't change the SAO difference on the host processors
though, just tries to slightly improve it from silently broken to
maybe complaining a bit.

I didn't want to stop some very old image that uses this and is running
okay on an existing host from working, but maybe the existence of such
a thing would contradict my reasoning. But then if we don't care about
it why care about this KVM behaviour difference at all?

> Solving this properly will probably require creating a new KVM host
> capability and associated machine parameter in QEMU, along with a new
> machine type.

Rather than answer any of these questions, I might take the KVM change
out and that can be dealt with separately from guest SAO removal.

Thanks,
Nick

>=20
> [snip]
>=20
>> diff --git a/arch/powerpc/include/asm/kvm_book3s_64.h b/arch/powerpc/inc=
lude/asm/kvm_book3s_64.h
>> index 9bb9bb370b53..fac39ff659d4 100644
>> --- a/arch/powerpc/include/asm/kvm_book3s_64.h
>> +++ b/arch/powerpc/include/asm/kvm_book3s_64.h
>> @@ -398,9 +398,10 @@ static inline bool hpte_cache_flags_ok(unsigned lon=
g hptel, bool is_ci)
>>  {
>>  	unsigned int wimg =3D hptel & HPTE_R_WIMG;
>> =20
>> -	/* Handle SAO */
>> +	/* Handle SAO for POWER7,8,9 */
>>  	if (wimg =3D=3D (HPTE_R_W | HPTE_R_I | HPTE_R_M) &&
>> -	    cpu_has_feature(CPU_FTR_ARCH_206))
>> +	    cpu_has_feature(CPU_FTR_ARCH_206) &&
>> +	    !cpu_has_feature(CPU_FTR_ARCH_31))
>>  		wimg =3D HPTE_R_M;
>=20
> Paul.
>=20
