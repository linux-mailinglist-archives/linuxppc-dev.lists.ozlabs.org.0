Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 604603EAF34
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 06:25:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gm9Sw2C4fz3cQS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 14:25:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=l4uYoKlw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62c;
 helo=mail-pl1-x62c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=l4uYoKlw; dkim-atps=neutral
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com
 [IPv6:2607:f8b0:4864:20::62c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gm9SD6Vfkz301j
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 14:24:27 +1000 (AEST)
Received: by mail-pl1-x62c.google.com with SMTP id b7so10249633plh.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Aug 2021 21:24:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ZG8u5JqkaCnIFNbp9FOjbtT2z+Th7vXD/EU3z+QFY98=;
 b=l4uYoKlwfge+Ua9qjkcGwl6t940v791ZXgaj6649PPh/h+wW77+hnapqHapJitBZkY
 iHeUkamfAbooqiKTeae6BOCzGIC0dLEpjthCH7GJCL6v+MzjrAE0qLGmiV6Ne3nTaPC6
 LqSpUg0Absi3pP+EQPvnZvSTJ60kk/5hAT5bXn5Mf81wC0Nb2pYbgfEqN7cgFxDHoiU5
 pDHd1+KuZUxYoJqEAINiBMySj2BaTlKpox1UtscdFJDhQdSFBXm8FsFSRWkeopK2OS+I
 6o9m12DGboWm+vDoBTaZ72w0wcdCrZkQUybQiByGsqvbMR1dQx/T6Hl2mzBptlunjDDZ
 HQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ZG8u5JqkaCnIFNbp9FOjbtT2z+Th7vXD/EU3z+QFY98=;
 b=ayCX7SsiNiDmnRBWGFzp9VmKYESQ9Wrgs1kQKasRzQ127yeB+kXkdmf17UwOr0vavB
 D8H+4nOW2Z2OnHn3zT1c78SQSSH68V1v00vhZXrjccSGYtNNLetiejewbQ0S39yffHMR
 IlNLh+HdCNiES1MiwU9jX3RToyY57gE3OFcCb++1pwDNxTL+soTJRr8Tdrk04V8CQJVP
 RcNVOfwaV0R8rTxtTF5pIWltdGYoib4Ulvs+anoptiXMBA5Jo3Lkzli0upjN2QFmfwNM
 bUheaqHJ99D2hjDzo67JJ4hRimZF7I9OD9aMRCRl6Bd8g6lBZzEu/BnqIFfG8JUYB9u0
 xLAQ==
X-Gm-Message-State: AOAM531CindLHWT+El+7P9wORQUPgx0wdx5p+5Yhy6vKhipRgsCO4PQB
 W/W0frdgSHxA7wC5hl5QcFI=
X-Google-Smtp-Source: ABdhPJy9lc+QRcGeoR3JvdGwr2//OMVgkrnWgjE152qfYG4Cmk82H5ah8+NnPzV9Pfbqd7dALyDd3w==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr604052pjb.42.1628828664801; 
 Thu, 12 Aug 2021 21:24:24 -0700 (PDT)
Received: from localhost (60-242-208-220.static.tpgi.com.au. [60.242.208.220])
 by smtp.gmail.com with ESMTPSA id
 ca7sm337700pjb.11.2021.08.12.21.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 21:24:24 -0700 (PDT)
Date: Fri, 13 Aug 2021 14:24:19 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v1 17/55] KVM: PPC: Book3S HV P9: Implement PMU
 save/restore in C
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-18-npiggin@gmail.com>
 <1A47BBEF-FC8C-4C4D-8393-9DE66B7FF96C@linux.vnet.ibm.com>
In-Reply-To: <1A47BBEF-FC8C-4C4D-8393-9DE66B7FF96C@linux.vnet.ibm.com>
MIME-Version: 1.0
Message-Id: <1628827731.ai2zz7xxwa.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Athira Rajeev's message of August 9, 2021 1:03 pm:
>=20
>=20
>> On 26-Jul-2021, at 9:19 AM, Nicholas Piggin <npiggin@gmail.com> wrote:


>> +static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
>> +{
>> +	if (!(mmcr0 & MMCR0_FC))
>> +		goto do_freeze;
>> +	if (mmcra & MMCRA_SAMPLE_ENABLE)
>> +		goto do_freeze;
>> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +		if (!(mmcr0 & MMCR0_PMCCEXT))
>> +			goto do_freeze;
>> +		if (!(mmcra & MMCRA_BHRB_DISABLE))
>> +			goto do_freeze;
>> +	}
>> +	return;
>> +
>> +do_freeze:
>> +	mmcr0 =3D MMCR0_FC;
>> +	mmcra =3D 0;
>> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>> +		mmcr0 |=3D MMCR0_PMCCEXT;
>> +		mmcra =3D MMCRA_BHRB_DISABLE;
>> +	}
>> +
>> +	mtspr(SPRN_MMCR0, mmcr0);
>> +	mtspr(SPRN_MMCRA, mmcra);
>> +	isync();
>> +}
>> +
> Hi Nick,
>=20
> After feezing pmu, do we need to clear =E2=80=9Cpmcregs_in_use=E2=80=9D a=
s well?

Not until we save the values out of the registers. pmcregs_in_use =3D 0=20
means our hypervisor is free to clear our PMU register contents.

> Also can=E2=80=99t we unconditionally do the MMCR0/MMCRA/ freeze settings=
 in here ? do we need the if conditions for FC/PMCCEXT/BHRB ?

I think it's possible, but pretty minimal advantage. I would prefer to=20
set them the way perf does for now. If we can move this code into perf/
it should become easier for you to tweak things.

Thanks,
Nick
