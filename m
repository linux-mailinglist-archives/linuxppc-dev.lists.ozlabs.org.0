Return-Path: <linuxppc-dev+bounces-12687-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9E9BC0336
	for <lists+linuxppc-dev@lfdr.de>; Tue, 07 Oct 2025 07:34:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cglDw2gy2z2ywC;
	Tue,  7 Oct 2025 16:34:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759815248;
	cv=none; b=XbmBxZJ1xC7AiOby9Zo0iWAknKXy04Lz3hfOS52rP6UdDMv3yHGwGDK81h/fBF/6QLb5jh2Kqve0wG/In19ZTFjttbFpnn9CQx6apBifpxBIAr/EYUhsAQKqPFxJO5IYhu5UNYb+s9u3a5YZvvb5NzfBtaadZJAASDfby8tuKACkty0D87c0J+VUyvGWv/dVdvm8BdmnADRu1ZTOiRmIEB/kx+rtB6/IICmSe1oFI/IqhQ0gIKOwXQTzRWdQBW22kE6i4NDF5eGsNAP5RJ+cpGJvsoQgrsCJ6TzD5CYGC6hP/zTyEOLxEhHNfrmXZ3T8900dBKxDnYe/cfgB8E83AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759815248; c=relaxed/relaxed;
	bh=FX5SjSWqDlT/Sf/R+hW0i1Lf3ZEpCbIHwofL2VqL1Es=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=DQZgriBcdctLPa4/ff9CDm5SNoqH3ytMEF4PYZsE0Ct96olZydOEMKwJE+5czp8kqnXRxIomKobvoEWf09QMwpTx70mSLMAau0v06R9OpKDKgnOfBadImuIAVUgOZ/lTmu1nfVSwCN9gP8t5GC1bqzTX/bOiCO/cdE7d7vwCSo93viKG1+aauF6FQNF4cgUBfK33Uy4jH7ouo4IamnOpLhSgqSJLjqG7+Z5WUNuKTEDjSkz2x7aqGwcqssiXV8veDACb/BkEQM2ecz7HJtcXZB+1uBX19VVVNXKRE8rRgwmc9RC7d+If/+IjNu277hTDRvX0NC3UlYCupIcIbmX2mQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/MUyyRu; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/MUyyRu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cglDv3Ljmz2xcC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Oct 2025 16:34:07 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 596HlgY5004499;
	Tue, 7 Oct 2025 05:34:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=FX5SjS
	WqDlT/Sf/R+hW0i1Lf3ZEpCbIHwofL2VqL1Es=; b=k/MUyyRu7OKdre3j5t1CuM
	KmyKay5Jwc97X4jToTn7arqBTY8c/tjEQvNSLYeSmqA2MwD7QQf5EzZy/nzCu3qc
	mvsUPdCrGEFEM/mxC0vc26R0PMOSlsx4tUo83/hf2ugukVxVWwOvco7ennBhHlFR
	O3ptqai3+z4A6ymrDT7XY5w4Fg7CnhBJKNYCnY54dgQuPIqFm0SQF8LJWXxWWaqY
	UGQA2ll3kFPRJRxwRRWifX06Q902Mu7DqZLq70Sfw7/DpHbucRAYIxmdbfnHSc1z
	NY/00jf0nteSL1NzYQSU64OWKaA+HlAetFW7zaz2gqJ6r1zPAkOi/rO1LT/itk0w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49js0sd07p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 05:34:01 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5975TZe0010155;
	Tue, 7 Oct 2025 05:34:00 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 49js0sd07n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 05:34:00 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5974tcCe000882;
	Tue, 7 Oct 2025 05:34:00 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49ke9y1u5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Oct 2025 05:34:00 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5975Xuex46268792
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Oct 2025 05:33:56 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1F6A620043;
	Tue,  7 Oct 2025 05:33:56 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F112C20040;
	Tue,  7 Oct 2025 05:33:46 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.253.188])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue,  7 Oct 2025 05:33:46 +0000 (GMT)
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
Precedence: list
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3776.700.51\))
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <aN02F61OLv6Tx_gB@x1>
Date: Tue, 7 Oct 2025 11:03:31 +0530
Cc: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <DDD36407-0973-435A-A087-BB7A071C8BA6@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
 <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
 <6BB167B7-6479-44E7-9175-E67E500DB9E2@linux.ibm.com>
 <7EE7DD5B-6550-436B-A799-2B1DF293121E@gmail.com>
 <AB498516-CA5D-428C-B6FC-CC46A43E39AA@linux.ibm.com> <aN02F61OLv6Tx_gB@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=EqnfbCcA c=1 sm=1 tr=0 ts=68e4a649 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=VnNF1IyMAAAA:8 a=hJTAkFaA5njBwcdrxdAA:9 a=QEXdDO2ut3YA:10
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: i2KbJFPO8--PEts655tAp3ig6CLkTLGJ
X-Proofpoint-ORIG-GUID: xtFiBNTvlDuqzMpw1__vUwt45Qv989Yc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDAzMDIwMSBTYWx0ZWRfXw6o9u5Yu1X5i
 eNE0ur4/KY8O94tEnQ25ArzXUkpnD8UJrzH+ryQZ5fVVqNy/51DMF68cmqXW+tobqmhpEGlss98
 PDmmxHWwh5pMaDV9l81elUQGkGiUqP9e4jOZ0D+Pb5ZEHpGbbIunbNAJxdQXmpo5OFxYgWsZxbX
 gRgyngDLNUWk6RhfoZgqHJvmc+118PVBiR1Eqd0a+aTxCsHunJNadQq99n0u/LgLX17j8rhdLHB
 A3r44ViOeAGE77jJQ5ISAZ7ZLL2fsyYEs580kz2r4KeFkJ+5E5F+yPWtgdyjsTz3DOVsdNbbVbD
 YsWbGbak73IrvARHFMHLLVl+ECeE6k6jg9gJYl9Q8+9QY3Xs27WlZQconMEoHj8MDv23eNSuOTj
 XbbZ+n1PuyIVOUXOq3wmpZ+MgV9VyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-06_07,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 impostorscore=0 adultscore=0 phishscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2510030201
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 1 Oct 2025, at 7:39=E2=80=AFPM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Fri, Sep 26, 2025 at 10:23:56AM +0530, Athira Rajeev wrote:
>>> On 25 Sep 2025, at 9:57=E2=80=AFPM, Arnaldo Carvalho de Melo =
<arnaldo.melo@gmail.com> wrote:
>>> On September 25, 2025 6:21:19 PM GMT+02:00, Athira Rajeev =
<atrajeev@linux.ibm.com> wrote:
>>>> Looking for further comments if any on this patchset.
>>>> The kernel side patches for this feature which was sent as separate =
series is pulled to powerpc tree by Maddy
>>>>=20
>>>> If the tools side changes looks good, can we have this merged to =
perf tools tree ?
>=20
>>> Sure, I'll look at it soon now that the kernel part is merged.
>=20
>> Sure, thanks Arnaldo
>=20
> Applied locally, build testing now.
>=20
> - Arnaldo
Sure, thanks Arnaldo

Athira


