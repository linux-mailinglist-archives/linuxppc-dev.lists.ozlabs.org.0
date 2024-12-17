Return-Path: <linuxppc-dev+bounces-4246-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CA09F43B0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Dec 2024 07:28:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YC6MQ0fdkz3bT8;
	Tue, 17 Dec 2024 17:28:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734416914;
	cv=none; b=XapaOqM1oUIctynUouGjcp9QOb9zH9JozkvSfNZlHl8KnSfNWh375toN3y8HyHowNkMEN8FAsvnq2pies+6Svo4LVvR9Vos7VSFP0/X0f8t5tJxo7ol8KteVdNh+iYPSYese/FlV+S0IgKH/xwLHpv/dx0EzlQPPuc0L/Z2oRTwAiYAJhSB9AtfJkPh6w0FtZg+Qs01lXhoUl1SozSQdAH/YV2WECDZp7hZ+resoR91gdefKni0ewuVP3M6wYzbyFneI3E8dl1tbhgxTnP2puC2v89av1gECMAC8iqNFMcRoVv0s4vohVOSQYYI1Ze7+NtHP83w7vKp2WirGAkTaPA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734416914; c=relaxed/relaxed;
	bh=lJujcmki2E1QCLy9lJFM3wiLcOpdWB51VnE5Do17Jzg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=HBDiDfiyC5qrkA50L3iywmR7/gmgnbU7iz/vp2SK6uaQH3gSh08Rurbs4U9d+Ki0+r+7nNMikLKAmx+674sZ5x5HnJMmcx/I1mxRD8QuDAWP7FEMmBkiipR2tEehJaUWA8YoPKcYx6+/RBf4qubhyn0kvKRCiFDeTGg3wLZCjcOuRxOI8Y/e7Hh0Wr/rKVf0wHh9S9Uk3OoKgwICLJkLCQe+7B6Bk1ftbqnQPgNXGFTwnnGhfMswaJbgq957F+YCq1exC7qR/PvbFcp6PfGgloXRUQBooIbB4PZkZKAXYnXEhTRT2J8v1nFp2ZNJ3Rp+I5OAHE7Bpi3uZv5EreDPzQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FE2HofH7; dkim-atps=neutral; spf=none (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FE2HofH7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YC6MP0L9yz30ft
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Dec 2024 17:28:32 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH2I22V011211;
	Tue, 17 Dec 2024 06:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=lJujcm
	ki2E1QCLy9lJFM3wiLcOpdWB51VnE5Do17Jzg=; b=FE2HofH7D4gnSIXORnexnR
	5tN2/QjPRExu4I7PfICzgUfRc2+iqF4xLMCFcp0IQbCqWNairzjVf2AihMNU4syo
	/2QI5lVxM2WYcnDvY3nArVKn8siYWI30uKLb1igknJQJVYwi1sLNql13gTkwx8Nt
	6zXM4hzZrV/Fq+hJSZ+pBKNNGg75gBqdtGd7CQcd72SX6BBNN8GYWbHhjVo96SeF
	wD3LUDnv8I+yWktRkQI3jdE8CtoEh/pNSjrf9lroPYvP0KplxCe/dDE5+cRKr0Av
	UsqSClEzbmUKHCc04ThOW3S0Mhg3S8sob0qsfFXzlCYxv0i/jrmH035Q1jKssr9w
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4kpyp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:28:18 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4BH6Meoc005960;
	Tue, 17 Dec 2024 06:28:17 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 43jnp4kpym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:28:17 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6Odqa014340;
	Tue, 17 Dec 2024 06:28:16 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43hmqy1p1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:28:16 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4BH6SDFS33096348
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Dec 2024 06:28:13 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0005520040;
	Tue, 17 Dec 2024 06:28:12 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F0CFF2004B;
	Tue, 17 Dec 2024 06:28:02 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.252.224])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 17 Dec 2024 06:28:02 +0000 (GMT)
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
Subject: Re: [PATCH v1] perf test expr: Fix system_tsc_freq for only x86
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <173398725978.3728083.17030127353710822170.b4-ty@kernel.org>
Date: Tue, 17 Dec 2024 11:57:51 +0530
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>,
        Kan Liang <kan.liang@linux.intel.com>,
        James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        akanksha@linux.ibm.com, maddy@linux.ibm.com, kjain@linux.ibm.com,
        disgoel@linux.vnet.ibm.com, hbathini@linux.ibm.com,
        Ian Rogers <irogers@google.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E5B2B419-C68C-45FA-9B79-7F6D5B138EDE@linux.vnet.ibm.com>
References: <20241205022305.158202-1-irogers@google.com>
 <173398725978.3728083.17030127353710822170.b4-ty@kernel.org>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Ux5MpVD-iVGKDygw1UrsRiXYDjXVn9UE
X-Proofpoint-ORIG-GUID: WghpnKfIFFSxB4-Dn2KxtR2UNZslH1of
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 malwarescore=0 adultscore=0 bulkscore=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412170047
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 12 Dec 2024, at 12:37=E2=80=AFPM, Namhyung Kim =
<namhyung@kernel.org> wrote:
>=20
> On Wed, 04 Dec 2024 18:23:05 -0800, Ian Rogers wrote:
>=20
>> The refactoring of tool PMU events to have a PMU then adding the expr
>> literals to the tool PMU made it so that the literal system_tsc_freq
>> was only supported on x86. Update the test expectations to match -
>> namely the parsing is x86 specific and only yields a non-zero value =
on
>> Intel.
>>=20
>>=20
>> [...]
>=20
> Applied to perf-tools, thanks!
>=20
> Best regards,
> Namhyung
>=20
Thanks Namhyung for pulling this in=20

Athira=

