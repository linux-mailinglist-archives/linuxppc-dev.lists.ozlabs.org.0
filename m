Return-Path: <linuxppc-dev+bounces-7287-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9301FA6C831
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Mar 2025 09:06:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZKX2T6j46z2yfV;
	Sat, 22 Mar 2025 19:06:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742630785;
	cv=none; b=MEuyuicogaAtVg8k5feWp+Kqvf5PPSx38StOqtwceRxO/8i6zVzFAYMtxI7aMRZJCEWna7P1Odzkq3W8u3/nGDE9vRD/wnfGce7+wnpd/YUFIWKHKnAFFi4xmSMeoFPYKYw3XfefOP5By/pmnUcFbz7FE4c9nxxPbyoW1fqcHcMiheUHGl756x5QLoqF/FKtJ8S9gg/hVsYXMLfaJrc0BnCL4P/XluHMPY84CJ99NbaSGdXAFkvrsSEvkrFE9YodSLqGFLxpGLOASSZalVoqcAyna0DxzFaYAlmu/KuFmAx13geg3X4AqPbzXHSNdIX3N8cG7THV1nuSBG+HgDij9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742630785; c=relaxed/relaxed;
	bh=HDF6RBkHi6jkmsGpsNlDQxqjfPEGr06K1bqndAdkZrE=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JdQrkfEcv/Gfeh47nt/5hL8FO/jOPWjUo9X+Ff9yuLs2MlQMiZQ8pa9EDt9NG+OOgmWuughvcrN08IbiSvNQM999GQy9Lbi/vvngrS29f0sWwRjvm0L/OEENfhJfMjT2DXrZAgCm8wt85DKOoHPXK/u4vs9JL9xLlOurtHeDPWWwAu+zey7PVW5xJPLMw1nTA+eVTRLRLweSufh2v921b4X9QWJ85yyb2/eC4LaoPbAvj1zuioM/jh4xoGDEVqGaPH3tjOAotA6VY6IKNNoaleobTHEwR2Usytqk9/GkRcay4WW4izH+ctDHkGJ/Sf01yjDVlur951Sz9jQOkK3Ldg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hRjU5uzW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hRjU5uzW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZKX2S6t7hz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 19:06:24 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52M3grr1030610;
	Sat, 22 Mar 2025 08:06:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=HDF6RB
	kHi6jkmsGpsNlDQxqjfPEGr06K1bqndAdkZrE=; b=hRjU5uzWlzcuzH8MODT3qe
	fKxnjokaZhPxJs7KJlwaSj6OejNWtTv4ZumW730bPpuxCwO80gLamlooJicO+yn5
	VnDfupzgMxKWLXCbk4oJRHQWAYITC1Sxt4vT5zw2nQjzaRXe8x2XIZeayDwxeMdQ
	otVZxJN0MM2zOkqrG4mFBSjvuCEHBHZdhoOdPHH33frOidtJS8Pp5z95NpDgLK+u
	hLS18CSkGJUH25Yg6XxD0IXCIKUSm++kVrEzfOMbEDbmO4W+USwJHuTSnmaTFQo2
	yB/X84lQkzY2cuCv4/ENMWfCMNfqBMb/z4V6+cbNSBWypTLCVsdPmWU8oOr/TBPA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45hngm8nk4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 08:06:15 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52M86Frf020527;
	Sat, 22 Mar 2025 08:06:15 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45hngm8nk1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 08:06:15 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52M3JT4n009157;
	Sat, 22 Mar 2025 08:06:14 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45hn6grrn7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Mar 2025 08:06:14 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52M86B3C40042902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 22 Mar 2025 08:06:11 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 15D6520043;
	Sat, 22 Mar 2025 08:06:11 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD63A20040;
	Sat, 22 Mar 2025 08:06:06 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.245.171])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Sat, 22 Mar 2025 08:06:06 +0000 (GMT)
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
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH] tools/perf/arch/powerpc/util: Fix is_compat_mode build
 break  in ppc64
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <20250321100726.699956-1-likhitha@linux.ibm.com>
Date: Sat, 22 Mar 2025 13:35:52 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Transfer-Encoding: quoted-printable
Message-Id: <22675B19-F5B4-4CAE-A320-58F42107FE44@linux.ibm.com>
References: <20250321100726.699956-1-likhitha@linux.ibm.com>
To: Likhitha Korrapati <likhitha@linux.ibm.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 2JNeXZHijJWmfC985k7YiPTooY6kTnLa
X-Proofpoint-GUID: kzU3Inqd7PhIS0v3e2c2d-QdoJ4TDbCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-22_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxscore=0 impostorscore=0 clxscore=1011 priorityscore=1501
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503220056
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 21 Mar 2025, at 3:37=E2=80=AFPM, Likhitha Korrapati =
<likhitha@linux.ibm.com> wrote:
>=20
> Commit 54f9aa1092457 ("tools/perf/powerpc/util: Add support to
> handle compatible mode PVR for perf json events") introduced
> to select proper JSON events in case of compat mode using
> auxiliary vector. But this caused a compilation error in ppc64
> Big Endian.
>=20
> arch/powerpc/util/header.c: In function 'is_compat_mode':
> arch/powerpc/util/header.c:20:21: error: cast to pointer from
> integer of different size [-Werror=3Dint-to-pointer-cast]
>   20 |         if (!strcmp((char *)platform, (char *)base_platform))
>      |                     ^
> arch/powerpc/util/header.c:20:39: error: cast to pointer from
> integer of different size [-Werror=3Dint-to-pointer-cast]
>   20 |         if (!strcmp((char *)platform, (char *)base_platform))
>      |
>=20
> Commit saved the getauxval(AT_BASE_PLATFORM) and =
getauxval(AT_PLATFORM)
> return values in u64 which causes the compilation error.
>=20
> Patch fixes this issue by changing u64 to "unsigned long".
>=20
> Fixes: 54f9aa1092457 ("tools/perf/powerpc/util: Add support to handle =
compatible mode PVR for perf json events")
> Signed-off-by: Likhitha Korrapati <likhitha@linux.ibm.com>

Hi Likhitha,
Thanks for the fix.=20

Reviewed-by: Athira Rajeev <atrajeev@linux.ibm.com>

Thanks
Athira
> ---
> tools/perf/arch/powerpc/util/header.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/tools/perf/arch/powerpc/util/header.c =
b/tools/perf/arch/powerpc/util/header.c
> index c7df534dbf8f..0be74f048f96 100644
> --- a/tools/perf/arch/powerpc/util/header.c
> +++ b/tools/perf/arch/powerpc/util/header.c
> @@ -14,8 +14,8 @@
>=20
> static bool is_compat_mode(void)
> {
> - u64 base_platform =3D getauxval(AT_BASE_PLATFORM);
> - u64 platform =3D getauxval(AT_PLATFORM);
> + unsigned long base_platform =3D getauxval(AT_BASE_PLATFORM);
> + unsigned long platform =3D getauxval(AT_PLATFORM);
>=20
> if (!strcmp((char *)platform, (char *)base_platform))
> return false;
> --=20
> 2.43.5
>=20


