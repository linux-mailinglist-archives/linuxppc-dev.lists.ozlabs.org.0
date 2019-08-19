Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 112E4924A6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 15:20:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Bvg46vnhzDqXf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Aug 2019 23:20:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::442; helo=mail-pf1-x442.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="MXz33PTP"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46BvNW2FV9zDqhs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 23:07:39 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id v12so1142764pfn.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 06:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:user-agent
 :message-id:content-transfer-encoding;
 bh=nNg47diliTQ/RprrsuF35P+xKT0s1Y0LHY2HFaQuIh8=;
 b=MXz33PTPDvg1WPZHdm8E+NcuMEL5Ya0xYPX4IjOZTWQ5tn5JoPfPATo0kfIHt1SvTt
 NXVc3myHfVdRjPOUG92+YCq5DIFwOANSNr1DC4DmTBnWvqUHbdBFZUi/ww4X+wwcHvYI
 XF/K1+pwbdwVgtI8UrZLzYFxq5TMcxnAt0lgvhJMuIY8Benq++81ARB3yYjBKPWlvh16
 g4eOVL0Yx10seQ2vIGSOTjrFhkmxnBRDImqn8ruv4HZS+uiFLJZnb9evDapbEDqSqkpP
 Q6NIbOHjo33ydV9Eo2oA2eB1CfKrk/9gnX9UPMb65fp/UdZgPcpeOQqXC4Nt4j9FIoD/
 fSwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=nNg47diliTQ/RprrsuF35P+xKT0s1Y0LHY2HFaQuIh8=;
 b=DLaRHox1cWfSLz2dIIjJUQgHgwzux6zMlYPb/+6NIogZsGswx/zeEAeGZpD3c8qVxP
 k+BktLT9dUfe7PG1d359gi6vMy3DFPwOZBKldUplCIHkfno3t067itCyTzGe7wjxWSyY
 GwmGC0y9/ZEeGjb0GbVlNqin2Fyg7VuGSnnG6ijYmwBovyI4UPrDXrQC2MUjcrEyDbV8
 MxMdhi9uaVpuRhkiXGNHCguzY1Yh6/BgG70k8M2Oq2aGSiEKtBttMtuAavXzWJtmhbMe
 +HhfXUT7KAzPQu/L/qSlMp7sWIn8oF5H12mIl95o+VRQ/VrysOZQ0fGVz2b2tjSknnbj
 p03Q==
X-Gm-Message-State: APjAAAV/L64tpbCIxVv8qUnjR4vJ26E8GP9HIt2DyrGcgDbqOTV4qP/n
 jO0TpHtG/fRQdoGXyMbRxONWBrLt
X-Google-Smtp-Source: APXvYqywtsdh4hxWSpBhDgjqPzZRFq6BDSuh3cgvBuTpu40VrdhV+c4mXwSEWi1fvk1WyQ/npKrVAg==
X-Received: by 2002:a17:90a:c403:: with SMTP id
 i3mr19825999pjt.110.1566220057073; 
 Mon, 19 Aug 2019 06:07:37 -0700 (PDT)
Received: from localhost ([58.84.106.74])
 by smtp.gmail.com with ESMTPSA id h11sm15909911pfn.120.2019.08.19.06.07.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 06:07:36 -0700 (PDT)
Date: Mon, 19 Aug 2019 23:07:26 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] powerpc/64s: remplement power4_idle code in C
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
References: <20190711022404.18132-1-npiggin@gmail.com>
 <8736hz6sls.fsf@concordia.ellerman.id.au>
In-Reply-To: <8736hz6sls.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1566220031.yttqi0r7yw.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman's on August 18, 2019 1:49 pm:
> Nicholas Piggin <npiggin@gmail.com> writes:
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/=
exceptions-64s.S
>> index eee5bef736c8..64d5ffbb07d1 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -2286,15 +2286,6 @@ USE_FIXED_SECTION(virt_trampolines)
>>  __end_interrupts:
>>  DEFINE_FIXED_SYMBOL(__end_interrupts)
>> =20
>> -#ifdef CONFIG_PPC_970_NAP
>> -EXC_COMMON_BEGIN(power4_fixup_nap)
>> -	andc	r9,r9,r10
>> -	std	r9,TI_LOCAL_FLAGS(r11)
>> -	ld	r10,_LINK(r1)		/* make idle task do the */
>> -	std	r10,_NIP(r1)		/* equivalent of a blr */
>> -	blr
>> -#endif
>=20
> This breaks ppc64_defconfig build with:
>=20
> ERROR: start_text address is c000000000008100, should be c000000000008000
>=20
> Due to:
>=20
> c000000000008000 <0000001a.long_branch.power4_fixup_nap>:
> c000000000008000:       48 03 5a b4     b       c00000000003dab4 <power4_=
fixup_nap>
>=20
>=20
> Moving power4_fixup_nap back into exceptions-64s.S seems to fix it.

Okay that should be fine if you can update it.

Thanks,
Nick
=
