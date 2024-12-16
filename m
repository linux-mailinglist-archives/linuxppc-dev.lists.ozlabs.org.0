Return-Path: <linuxppc-dev+bounces-4147-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7B99F2DAB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Dec 2024 11:02:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YBb926BzWz2xFm;
	Mon, 16 Dec 2024 21:02:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734343366;
	cv=none; b=Wb0bPSNaaQCFNjCARjYOqBLbU75k9RmkSznnji5836JRMLlsDFRDtrel+aw5iCFH/ciV9a3KSgz/JD+M+ay3pT7KyTtJ1T92iGHu9ra3F6QcpWTdMmMyhHuLIcN6Mozn2vDl1ruKsR91GfbnAzFF5Z0NR8nQYBpTOI1n22t5yehiC03axU0sBdvg+nVTitZvI2++6uRSwiGFIF0PIow9YhymKCf119F8u4bQwnMLIAE25/55J0lxsuFPXTssYUPKoM7QU/QxIoBsHgx6kTeq6EryVYwy80f8TQ7beJ0y4po33t/C6kdw6JWlcv6CUzSALJJWMz+RpbhyzTj+7HrQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734343366; c=relaxed/relaxed;
	bh=GMfSVZrUKd+3JsU6/oSzmVKPJb1iTEVgft5NcsULspk=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=H+fCOO1z0g2uPaybd4oCfoBXKxCJZyEgA3CPYYntUrqnXKTGTVTZws8OTgftAgnS4Xxu3qNdCR8+RyB4xY7EQp+nrr4B83JZJrkjtNooNs3azyvbdyXXg/9bkiN3P4yz+iMX+6pECUMK/MtOldcFib901KzREnZAJByFuDxbFIa31BxCYWVWpiwYuLd6wQU7VcJkHFMgdhI6Of6RKydcm0EwBdcxkG91fehWmvRQ5CagQ40+1plmC4MrYhSol1ghd7Sd6/XsZPBfNfAzwoptLN0ESzVVWCX8MOp4KKpWEe11D4ArWxhUMg+5I8ShkbA3HBiDbhxTJWx+zU/VObVsJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T9pqEC0p; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=T9pqEC0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YBb913Yq1z2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Dec 2024 21:02:44 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG3qPq8011656;
	Mon, 16 Dec 2024 10:02:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=GMfSVZ
	rUKd+3JsU6/oSzmVKPJb1iTEVgft5NcsULspk=; b=T9pqEC0p1qUk7+oYu3PIQq
	CSz5mDb6lSXiu2sX0KHl5RKrS7i6NGrXe4fhWxF/c4KlTTxeaZ22eMoC9fTpxNRc
	BoWbVYzCXD54smos6ME2OZx8228kApWFBt3vfO0BLgj96e3CZha7ecM8K1UPk+Q7
	mtoo1g1yaNSpQoaGtwfRwIwN+GIQAUyzo8gRkisJNnyhoPpFLRkwrBCkrpW4r/t2
	eW/2sl8bM+6sZmnX3hF86fKZBevqeQGgrUMqor/3HAfZzwwsR6RAv0P1gcmIAyNU
	3pezeX86vscGEMXEIS+RUF/in5XqFYoSS1coWy1ecUfcRnkmMHrkAx5NpnjtpsiA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb1h8g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 10:02:39 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BG9vNn3003775;
	Mon, 16 Dec 2024 10:02:39 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jcpb1h8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 10:02:39 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG8JUWY029329;
	Mon, 16 Dec 2024 10:02:37 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 43hmbsdk8n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 16 Dec 2024 10:02:37 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BGA2Ykw48759252
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Dec 2024 10:02:34 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5D76020063;
	Mon, 16 Dec 2024 10:02:34 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 58F192005A;
	Mon, 16 Dec 2024 10:02:27 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.124])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 16 Dec 2024 10:02:26 +0000 (GMT)
Content-Type: text/plain;
	charset=utf-8
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3818.100.11.1.3\))
Subject: Re: [PATCH] tools/perf/arch/powerpc: Add register mask for power11
 PVR in extended regs
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <2907ca2f-b973-42fd-ae03-99732dfda7a1@linux.ibm.com>
Date: Mon, 16 Dec 2024 15:32:12 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, namhyung@kernel.org, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <0402AAF0-5498-48C7-BEBA-2C0B7508D9E2@linux.vnet.ibm.com>
References: <20241206135637.36166-1-atrajeev@linux.vnet.ibm.com>
 <2907ca2f-b973-42fd-ae03-99732dfda7a1@linux.ibm.com>
To: kajoljain <kjain@linux.ibm.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Namhyung Kim <namhyung@kernel.org>, Ian Rogers <irogers@google.com>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: r-IvdmR-sjJKaBbc_LpFv8jeup8W4K4o
X-Proofpoint-GUID: pkGSb33H05pQcJrbwsQWXg2E2tI0LIeF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 impostorscore=0 spamscore=0 mlxscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412160083
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 11 Dec 2024, at 5:32=E2=80=AFPM, kajoljain <kjain@linux.ibm.com> =
wrote:
>=20
>=20
>=20
> On 12/6/24 19:26, Athira Rajeev wrote:
>> Perf tools side uses extended mask to display the platform
>> supported register names (with -I? option) to the user
>> and also send this mask to the kernel to capture the extended =
registers
>> as part of each sample. This mask value is decided based on
>> the processor version ( from PVR ).
>>=20
>> Add PVR value for power11 to enable capturing the extended regs
>> as part of sample in power11.
>=20
> Patch looks fine to me.
>=20
> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>

Hi

Can we please pull in this patch if it looks fine.

Thanks
Athira
>=20
>=20
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>> ---
>>=20
>> tools/perf/arch/powerpc/util/perf_regs.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/arch/powerpc/util/perf_regs.c =
b/tools/perf/arch/powerpc/util/perf_regs.c
>> index e8e6e6fc6f17..bd36cfd420a2 100644
>> --- a/tools/perf/arch/powerpc/util/perf_regs.c
>> +++ b/tools/perf/arch/powerpc/util/perf_regs.c
>> @@ -16,6 +16,7 @@
>>=20
>> #define PVR_POWER9 0x004E
>> #define PVR_POWER10 0x0080
>> +#define PVR_POWER11 0x0082
>>=20
>> static const struct sample_reg sample_reg_masks[] =3D {
>> SMPL_REG(r0, PERF_REG_POWERPC_R0),
>> @@ -207,7 +208,7 @@ uint64_t arch__intr_reg_mask(void)
>> version =3D (((mfspr(SPRN_PVR)) >>  16) & 0xFFFF);
>> if (version =3D=3D PVR_POWER9)
>> extended_mask =3D PERF_REG_PMU_MASK_300;
>> - else if (version =3D=3D PVR_POWER10)
>> + else if ((version =3D=3D PVR_POWER10) || (version =3D=3D =
PVR_POWER11))
>> extended_mask =3D PERF_REG_PMU_MASK_31;
>> else
>> return mask;
>=20


