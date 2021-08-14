Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D01A83EC10E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 09:12:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gms885QDrz3cK4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 17:12:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LKTTU+Tz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LKTTU+Tz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gms7L4LHLz308Q
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 17:12:13 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17E75QhP108066; Sat, 14 Aug 2021 03:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 mime-version : subject : from : in-reply-to : date : cc :
 content-transfer-encoding : message-id : references : to; s=pp1;
 bh=WMjQ/rc9cB56lT2lW/xyJhRkEFSCK+/IVTiYhMDsRgw=;
 b=LKTTU+TzzyKWuTHJuQT2xsUazxsHRC9L0hiVZ9MfMNiThJ0takIfi+FK3cDnDFcebUPJ
 TIktvff40G8rw4pdyyGmYndS7XSrkkMqDQHZMabm0PnU6ewCCN4IAzX4mg4HKESNCWE/
 t8IFYygsNKAppFcucjJb5njTrFTADGLiLr2OtdWGvkwrGrvQdnBINzf1/FAmqSdweVXy
 0WzaBfEIdYGthYTm+ECBFgwQqYRoctmbZy4JXzrReqNqL0/mlCzBLpLi5Yc4rYKTv15c
 heKWPdDlvL0d/aaf0KjoK+f0dxyHMLal7Dn5IlYOA2Bys9NaCqCcq80McnWnO+nbLUvM 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3adrp55m26-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Aug 2021 03:12:09 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 17E7C91j125346;
 Sat, 14 Aug 2021 03:12:09 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3adrp55m1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Aug 2021 03:12:09 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17E6xfC6003894;
 Sat, 14 Aug 2021 07:12:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03ams.nl.ibm.com with ESMTP id 3ae5f886y3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 14 Aug 2021 07:12:07 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17E7C5b454198566
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 14 Aug 2021 07:12:05 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 26F67AE057;
 Sat, 14 Aug 2021 07:12:05 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3E6AFAE055;
 Sat, 14 Aug 2021 07:12:04 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.195.35.224])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Sat, 14 Aug 2021 07:12:04 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [PATCH v1 17/55] KVM: PPC: Book3S HV P9: Implement PMU
 save/restore in C
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <1628827731.ai2zz7xxwa.astroid@bobo.none>
Date: Sat, 14 Aug 2021 12:42:01 +0530
Content-Transfer-Encoding: quoted-printable
Message-Id: <D683A065-D7DB-45E2-8625-E74B682015C4@linux.vnet.ibm.com>
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-18-npiggin@gmail.com>
 <1A47BBEF-FC8C-4C4D-8393-9DE66B7FF96C@linux.vnet.ibm.com>
 <1628827731.ai2zz7xxwa.astroid@bobo.none>
To: Nicholas Piggin <npiggin@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M3RjjLXOy9ce4iclpcjtXKG439Fer_9d
X-Proofpoint-GUID: 4lr-HUtG9oFOCdUXeDgAGrWBx8L4YOkc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-14_02:2021-08-13,
 2021-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=993 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 adultscore=0 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108140043
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



> On 13-Aug-2021, at 9:54 AM, Nicholas Piggin <npiggin@gmail.com> wrote:
>=20
> Excerpts from Athira Rajeev's message of August 9, 2021 1:03 pm:
>>=20
>>=20
>>> On 26-Jul-2021, at 9:19 AM, Nicholas Piggin <npiggin@gmail.com> =
wrote:
>=20
>=20
>>> +static void freeze_pmu(unsigned long mmcr0, unsigned long mmcra)
>>> +{
>>> +	if (!(mmcr0 & MMCR0_FC))
>>> +		goto do_freeze;
>>> +	if (mmcra & MMCRA_SAMPLE_ENABLE)
>>> +		goto do_freeze;
>>> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>>> +		if (!(mmcr0 & MMCR0_PMCCEXT))
>>> +			goto do_freeze;
>>> +		if (!(mmcra & MMCRA_BHRB_DISABLE))
>>> +			goto do_freeze;
>>> +	}
>>> +	return;
>>> +
>>> +do_freeze:
>>> +	mmcr0 =3D MMCR0_FC;
>>> +	mmcra =3D 0;
>>> +	if (cpu_has_feature(CPU_FTR_ARCH_31)) {
>>> +		mmcr0 |=3D MMCR0_PMCCEXT;
>>> +		mmcra =3D MMCRA_BHRB_DISABLE;
>>> +	}
>>> +
>>> +	mtspr(SPRN_MMCR0, mmcr0);
>>> +	mtspr(SPRN_MMCRA, mmcra);
>>> +	isync();
>>> +}
>>> +
>> Hi Nick,
>>=20
>> After feezing pmu, do we need to clear =E2=80=9Cpmcregs_in_use=E2=80=9D=
 as well?
>=20
> Not until we save the values out of the registers. pmcregs_in_use =3D =
0=20
> means our hypervisor is free to clear our PMU register contents.
>=20
>> Also can=E2=80=99t we unconditionally do the MMCR0/MMCRA/ freeze =
settings in here ? do we need the if conditions for FC/PMCCEXT/BHRB ?
>=20
> I think it's possible, but pretty minimal advantage. I would prefer to=20=

> set them the way perf does for now.

Sure Nick,=20

Other changes looks good to me.

Reviewed-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

Thanks
Athira
> If we can move this code into perf/
> it should become easier for you to tweak things.
>=20
> Thanks,
> Nick

