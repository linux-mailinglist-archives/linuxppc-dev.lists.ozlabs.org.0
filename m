Return-Path: <linuxppc-dev+bounces-4245-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CF5879F43AE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 07:27:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC6LW722Hz30g1;
	Tue, 17 Dec 2024 17:27:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734416867;
	cv=none; b=ULkBIsds810qx906duOXI6MAyVe0X99OH9NYtWw/dtMc0+H4pcD+KwIgrOotPTCOwpBCbNxKxXgndWTZXI0WdOFKSuk+INzXKlf/v0Mcq0WD3TobQ1sSzg4pmTuEiZD5WqvNiPLCroWs12fTSvROladdVNYjYzWOKCMpdJs/WqJ+AUyaEo3CdvOnF1dOl4PPDbowtx5CgaIwCWPjqArRAU/oxR02cJeRN7uvGWghUxQ4WOv3HWxEDCsRJbMjrfKnfoTu6s2YqgHuwKGPOKVkEERcPL4IdJmtJR3x4EbTDv8ApaS+Rq3sp3Tpy6LFhpb1mVWs1wE9mIA61xBlbumDdA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734416867; c=relaxed/relaxed;
	bh=WWPNWcU0FNkKkn4vV60HW9D/U2Y9k6Epcfo1JvpcVZo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=NWgL1qmRWXGOjlWTEa1Ikv/VrfR2pHZ499kjk94h+paSibZDG+sIhLn+IBxf7kiBeKeruX5R9LjIBt6ezDTo20zMjlqwFHBwBOBk5uUMdxFxQTS0EC13moxaegwI3jkRPAJX93sF6TxwtPrBdRZgL6Whwej0PDpLwenmVgchy3fTCYpZX1J4ke573iHEoYJEDzUh+hf0WR6sBfIxOuguA/B6p/lgbAqBqGaya5jE6jvS6hrANx/Or24JFiWsLgTFfWiLihRInUaJhBlpBA0yH5crOMwongNVtV9RLBjZMHB+aIIX0SFPU1aU1iq+X0g9dg6X/jKaVXFMApn+dPsPfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hYuWR4+7; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hYuWR4+7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC6LV3n1Cz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 17:27:45 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BGHXxBv027390;
	Tue, 17 Dec 2024 06:27:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=WWPNWc
	U0FNkKkn4vV60HW9D/U2Y9k6Epcfo1JvpcVZo=; b=hYuWR4+7TdfZ2oqMQ+kQQy
	N+y+l8F6KJPlOCHBWtz8b2HuWPaGdpPxjfEU1Ygh/1oD2C0rdoAL1LKJY1QFmLNA
	M3qeCLMd3M5Qn3j2TkIn3iFqafXj5vAmbDOat+9u9yuKbdzNKJAkSSsvFjsQEC1y
	4un8sY9fSUKu4/Dec/3e6S1isd3xFRXBbLQveH4Q1ZS2DPAejGs/lqLHDQbOB7KE
	tnhY6WYhbn5cQNxqg1YtqwiSmrb8cWlwpCIYaUUP8dZIrrs08LXHWBB3oX6xtgBF
	3HuHDjg9YWRLz1fzNsOgF4wpRyOGxGU4Btfh3ypd3Wvqqi6eot88fohw2LsWUWdg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2damb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:27:38 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH6Lq81012878;
	Tue, 17 Dec 2024 06:27:38 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jgd2dam9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:27:38 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH1qbaN014435;
	Tue, 17 Dec 2024 06:27:37 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqy1ny3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:27:37 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH6RXxT57803182
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 06:27:33 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9280620049;
	Tue, 17 Dec 2024 06:27:33 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3030820040;
	Tue, 17 Dec 2024 06:27:26 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.252.224])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 17 Dec 2024 06:27:25 +0000 (GMT)
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
In-Reply-To: <Z2BZMhDFO-aJ_Gjw@x1>
Date: Tue, 17 Dec 2024 11:57:11 +0530
Cc: kajoljain <kjain@linux.ibm.com>, Namhyung Kim <namhyung@kernel.org>,
        Ian Rogers <irogers@google.com>, jolsa@kernel.org,
        adrian.hunter@intel.com, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <67F96642-1A52-486C-BC55-E9B23E2F190D@linux.vnet.ibm.com>
References: <20241206135637.36166-1-atrajeev@linux.vnet.ibm.com>
 <2907ca2f-b973-42fd-ae03-99732dfda7a1@linux.ibm.com>
 <0402AAF0-5498-48C7-BEBA-2C0B7508D9E2@linux.vnet.ibm.com>
 <Z2BZMhDFO-aJ_Gjw@x1>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: e7k5AqGA83bJXz4gWo1VKGa0FclRrmwL
X-Proofpoint-GUID: k-SuPy_SPFhvBIUXZMLSyWOttBQlSQ5E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 mlxlogscore=853 priorityscore=1501 malwarescore=0 impostorscore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 16 Dec 2024, at 10:15=E2=80=AFPM, Arnaldo Carvalho de Melo =
<acme@kernel.org> wrote:
>=20
> On Mon, Dec 16, 2024 at 03:32:12PM +0530, Athira Rajeev wrote:
>>> On 11 Dec 2024, at 5:32=E2=80=AFPM, kajoljain <kjain@linux.ibm.com> =
wrote:
>>> On 12/6/24 19:26, Athira Rajeev wrote:
>>>> Perf tools side uses extended mask to display the platform
>>>> supported register names (with -I? option) to the user
>>>> and also send this mask to the kernel to capture the extended =
registers
>>>> as part of each sample. This mask value is decided based on
>>>> the processor version ( from PVR ).
>=20
>>>> Add PVR value for power11 to enable capturing the extended regs
>>>> as part of sample in power11.
>=20
>>> Patch looks fine to me.
>=20
>>> Reviewed-by: Kajol Jain <kjain@linux.ibm.com>
>=20
>> Can we please pull in this patch if it looks fine.
>=20
> Sure,
>=20
> Thanks, applied to perf-tools-next,
>=20
> - Arnaldo
Thanks Arnaldo for pulling this in=20

Athira



