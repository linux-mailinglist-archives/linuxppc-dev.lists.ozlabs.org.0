Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB3120F411
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 14:00:42 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49x2xL2nlmzDqX3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 22:00:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::342;
 helo=mail-wm1-x342.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Sc0sBA2Y; dkim-atps=neutral
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49x2sW1ZVKzDqcw
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 21:57:19 +1000 (AEST)
Received: by mail-wm1-x342.google.com with SMTP id l17so18555267wmj.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 04:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=97tTPxeIJ1A0X7anydjSG6FFQp1gQOx/xNszALEY9jY=;
 b=Sc0sBA2Y2XJ97+//1rj0qU7M3+vt0zDkUwHHXOGzsdBwXMVhQyqgdgmGPBcPmGb2Ad
 kDmTosxXmHp+k73MidE3puQ8oSZEI9zswHnCZWGPuV0MwSbpkW0g0AiWCjzrOWRq1rFu
 7gwpSzKYQJRrikuHYod+NCxQkf4vezhCfkeQ3H14grXQcp5kRo9tzGbUHC1M0ezufj/e
 m6SUPqvJHzhJmnwKBUDmiMLaso/1HU117qUqcjIRjqHQqKTJ4yN4MUNHEBnPGE36+ia7
 5f0foj88sWIkjhME19Elqy42yc14AVCY/3avwmsk77VdYQArHqyRT2CfLBkUipj2Z847
 eKmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=97tTPxeIJ1A0X7anydjSG6FFQp1gQOx/xNszALEY9jY=;
 b=As714xi5kG4z2dY2u7aT85tar36fZX1Mf/YmjvsB4115yN4rxEvvnm13hIPxfy4jwP
 wSspAvk3ayH3V5hqMFzMlSka6hU/ssvo8NTKLEP2BmQ/8/tRdamtBX5BJozsnJebfzMd
 CsXVr6u40Z/N89IDbJbo7WHdIejZtxNcFDmQxjwssEfJVfbkmZSq8nTFoqlkpXncBC2B
 kiKYajuVayC5lSOENLo9r8Emg6vSKSngCrQQEuGFzIi+4c9xVFRGeXw1LcZ53EWtdFIR
 JgHPsxttvX4dDgiIYQEg8vv28BI5qYkoWO2MHVjdOcukzibUx/uupPpuiEo+zLExNjni
 bErA==
X-Gm-Message-State: AOAM530+p82rpaM7DqNWzYMGQS1p/p7WaSWOQ9BocdpuYI/MebKeSdXq
 ZsxLbbuqAA4r4K+z9Bxd0W4=
X-Google-Smtp-Source: ABdhPJyK5JhGYvcj99uHYMU4dkCK1vr72vskj+rGv0xZe0QUP+vOZlILFx5HwTQCtZN9oC/KvD0vzw==
X-Received: by 2002:a05:600c:2118:: with SMTP id
 u24mr7767485wml.133.1593518234262; 
 Tue, 30 Jun 2020 04:57:14 -0700 (PDT)
Received: from localhost (61-68-186-125.tpgi.com.au. [61.68.186.125])
 by smtp.gmail.com with ESMTPSA id v11sm40299584wmb.3.2020.06.30.04.57.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jun 2020 04:57:13 -0700 (PDT)
Date: Tue, 30 Jun 2020 21:57:06 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 3/3] powerpc/pseries: Add KVM guest doorbell restrictions
To: Paul Mackerras <paulus@ozlabs.org>
References: <20200627150428.2525192-1-npiggin@gmail.com>
 <20200627150428.2525192-4-npiggin@gmail.com>
 <20200630022713.GA618342@thinks.paulus.ozlabs.org>
 <1593495049.cacw882re0.astroid@bobo.none>
 <20200630082607.GB618342@thinks.paulus.ozlabs.org>
In-Reply-To: <20200630082607.GB618342@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Message-Id: <1593518201.ez0344yx91.astroid@bobo.none>
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
Cc: kvm-ppc@vger.kernel.org, Anton Blanchard <anton@linux.ibm.com>,
 =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Paul Mackerras's message of June 30, 2020 6:26 pm:
> On Tue, Jun 30, 2020 at 03:35:08PM +1000, Nicholas Piggin wrote:
>> Excerpts from Paul Mackerras's message of June 30, 2020 12:27 pm:
>> > On Sun, Jun 28, 2020 at 01:04:28AM +1000, Nicholas Piggin wrote:
>> >> KVM guests have certain restrictions and performance quirks when
>> >> using doorbells. This patch tests for KVM environment in doorbell
>> >> setup, and optimises IPI performance:
>> >>=20
>> >>  - PowerVM guests may now use doorbells even if they are secure.
>> >>=20
>> >>  - KVM guests no longer use doorbells if XIVE is available.
>> >=20
>> > It seems, from the fact that you completely remove
>> > kvm_para_available(), that you perhaps haven't tried building with
>> > CONFIG_KVM_GUEST=3Dy.
>>=20
>> It's still there and builds:
>=20
> OK, good, I missed that.
>=20
>> static inline int kvm_para_available(void)
>> {
>>         return IS_ENABLED(CONFIG_KVM_GUEST) && is_kvm_guest();
>> }
>>=20
>> but...
>>=20
>> > Somewhat confusingly, that option is not used or
>> > needed when building for a PAPR guest (i.e. the "pseries" platform)
>> > but is used on non-IBM platforms using the "epapr" hypervisor
>> > interface.
>>=20
>> ... is_kvm_guest() returns false on !PSERIES now.
>=20
> And therefore kvm_para_available() returns false on all the platforms
> where the code that depends on it could actually be used.
>=20
> It's not correct to assume that !PSERIES means not a KVM guest.

Yep, thanks for catching it.

>> Not intended
>> to break EPAPR. I'm not sure of a good way to share this between
>> EPAPR and PSERIES, I might just make a copy of it but I'll see.
>=20
> OK, so you're doing a new version?

Just sent.

Thanks,
Nick
