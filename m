Return-Path: <linuxppc-dev+bounces-15530-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B2FD108FD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jan 2026 05:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dqK510vyQz2yr7;
	Mon, 12 Jan 2026 15:23:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768191828;
	cv=none; b=hAREcvhPYZ2fgsdaksPH239yYIiF+QnCuBvfN9SSxttuOu4BMn2VitlgZr/2+vmygu7OnLaHLqDakJaPyU3ixT+FVPCHdsjioy1CYIuZ6EIovCCFcgCoIn2RUOBhGBxFrX/fjBAicHZj7OlooyvYGsHShEPnTZDo3iAMjJKfd+7Kgff+ZJRPoTSIeUVA6xrp7GXyY4FkDpGHOnvTR5e4+BFqRJdc4aczuCdpsCjg1MzbU/cOmLVPnaWj/IGH3alUux9WPIt/MR6lXjpKtRyTpDgOcRHKFvlVXTOjdYhj/QVAp/FQHZERzcg2LUsL937zmrJhifTlFNbiYELVyLJYzw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768191828; c=relaxed/relaxed;
	bh=2cbMiNLAhtLMgQo+YQtY8DLWtP5FGL4Z5yttq7DzXYw=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ljWXdBay+Lu0FmQ16LwfevfyyK/SPqad8I9jEkxpNkYLOdBIuAfbCBZruBtCm9RkVB7VMH/TvDUARt+8yeUvMNtk815Le/re6VRg1cS5WScQYcn3jwtGC3u42kRMwe42U3IG786iUwAq5N/6xz0rUX01REYjjTrBdgPvriRnRX//EIs0wi3bd8APRPygdwLySS5YesrpcoSryzq1dl6d29u+4Fkvas7iiUeYXGItHOSkg9Os3Zbe91J0ddVyOYaEGMMCjF2AAr26CnsDqrMDha74Hd8k9M/kLiJ+WqVOxXt/nTnCm+REL0pNCT2kn+kydjfuqCFlLDIds/fGqqebPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mCeUk+hT; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mCeUk+hT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dqK4z5jx3z2yhX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Jan 2026 15:23:47 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 60BLG7NV003154;
	Mon, 12 Jan 2026 04:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=2cbMiN
	LAhtLMgQo+YQtY8DLWtP5FGL4Z5yttq7DzXYw=; b=mCeUk+hTe1sHypJ3pIL+NU
	awEbCK87HO9z7zpFMeIXJLRrvdBg55T7ftAsOLiMS4xAmI7hSQdQFZYEqBv77Z3c
	5bQL9Gs8M/C+fj21FECz+dIT/C9eFTxIRR5x+VfcSLc5Yf73JKTJfKE4VBgmNZVJ
	D2lm5NR5RghID1CZR2NpxFP6TdYiKtlCFutLE3ACqtBfQ4B19EgMXlNZpOf59syh
	sfAHebOastUGdNhvJTanRhwF3uXw44K2uJZtlXYYtuGUXPNxvTUEJuOpNH3KK8Oq
	1uwrhRXqSaX97yqaFY5ZHEkXFZrXjXUkdUIdw2co38KMcTPTVgJtFH+VurELI/fg
	==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4bke92nf8v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 04:23:43 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 60C0rvma025866;
	Mon, 12 Jan 2026 04:23:42 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4bm2kk41vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jan 2026 04:23:42 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60C4NfNt18612842
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jan 2026 04:23:41 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF6C45805D;
	Mon, 12 Jan 2026 04:23:41 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 553FD58043;
	Mon, 12 Jan 2026 04:23:40 +0000 (GMT)
Received: from jarvis.ozlabs.ibm.com (unknown [9.150.20.59])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Jan 2026 04:23:39 +0000 (GMT)
Message-ID: <15b33dda3ccf6889dbd46b0a0f4edfe633b968f5.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/mm: Use pte_advance_pfn() in set_huge_pte_at()
From: Andrew Donnellan <ajd@linux.ibm.com>
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        linuxppc-dev@lists.ozlabs.org
Date: Mon, 12 Jan 2026 15:23:38 +1100
In-Reply-To: <2462a770-7da3-4b42-99ed-6ffd4d44b4f4@kernel.org>
References: 
	<20251219-set_huge_pte_at_pte_advance_pfn-v1-1-e3378845af7d@linux.ibm.com>
	 <2462a770-7da3-4b42-99ed-6ffd4d44b4f4@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
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
Precedence: list
MIME-Version: 1.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: izQzFLEQ_63BzUKokWOh9GizttvkZ3zd
X-Authority-Analysis: v=2.4 cv=dYyNHHXe c=1 sm=1 tr=0 ts=6964774f cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=9x5MhsYv9Re5vLzA3DAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDAzMyBTYWx0ZWRfX7l/S9MHamHJd
 RjD0LF29mJfwf1x7tC+WHvsXaXMDjzzOKdXgkkTyeQsg3dww4PQL0yBvBajuPHES/GnBjdMsVT2
 0qAosGOjIwEASmgbEhL595KzqIgRO6lIa+KFply28v/ZDY+EU6QBZTLhi1IDIdBg8UALQ76oV8M
 /sbKMk8HtrFKkgXL6U2mkc+VcfSmEuwK5eEqcwP7g7/GwHGTc2ToJCVjq1mUGtQgNV4stfA/ZYP
 enow9u7x1WQWfxKnKSoq5/rBxYD7kOZvgXtIdBZtorTlKYcHlrstPwVcef8CQAIJjNm69EFRBve
 nnVUwlBZWNqedDhW974CobAd7/rBNs7NhkZ6D2MUzldIstntpRoX7jy0+HBJ2G27VKaquRKPibJ
 tFXSZ++HOlWRIqvfPP+b1m0YVAZL85gnGI1/57OFB1k0NZiV2xP8aws8Pbd0K/YxD4XC7ZrULi0
 z4I8QwKog3FL2wnpjxw==
X-Proofpoint-GUID: izQzFLEQ_63BzUKokWOh9GizttvkZ3zd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601120033
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, 2025-12-18 at 19:29 +0100, Christophe Leroy (CS GROUP) wrote:
> > =C2=A0=C2=A0	for (i =3D 0; i < sz / pdsize; i++, ptep++, addr +=3D pdsi=
ze) {
> > =C2=A0=C2=A0		__set_pte_at(mm, addr, ptep, pte, 0);
> > -		pte =3D __pte(pte_val(pte) + ((unsigned long long)pdsize /
> > PAGE_SIZE << PFN_PTE_SHIFT));
> > +		pte =3D pte_advance_pfn(pte, pdsize / PAGE_SIZE);
>=20
> How can this work ?
>=20
> pdsize is 4M, PAGE_SIZE is 4k so pdsize/PAGE_SIZE is 0x400.
>=20
> PFN_PTE_SHIFT is 24.
>=20
> 0x400 << 24 is more than what an unsigned long can contain in=20
> pte_advance_pfn()

Ah, in spite of the explicit unsigned long long cast that should've reminde=
d me
otherwise, I forgot that a long isn't 64 bits on 32 bit machines.
>=20



--=20
Andrew Donnellan    OzLabs, ADL Canberra
ajd@linux.ibm.com   IBM Australia Limited

