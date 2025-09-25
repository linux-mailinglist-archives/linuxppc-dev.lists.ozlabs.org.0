Return-Path: <linuxppc-dev+bounces-12580-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71268BA0924
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 18:21:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXf9s43lvz2yql;
	Fri, 26 Sep 2025 02:21:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758817313;
	cv=none; b=OmHZWdjhEQwiT5RLUKOH+OxN6fS4BpagFcwwk3FyDRfqHEgPr6eWgRPLZDaCbDp/b4CKVqHeyiPTq6x0nBiVs726YO5ML4kUA9NQoxxs4oQSFQE3URGpsDYIAEM8hQNkQy4pns4Xtoes8uBVEoNs39lXoCeqEph/XVTCdgnCbo0KyNBHPRpbeI55pEDiR878ZcLDa54Uz+NBKhn6m/z3KFFJc7mdYGys0ym/2FXaOK2PatveKOpl6O0dlqu+5OF6BtvfRcSove1hxjaTfRmkFcOYYjAJPAxQHn02E7ifYmw537GFAjhK7J77yS/JcDQi/Ztb4tY8cRxN2CLwU9pGGA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758817313; c=relaxed/relaxed;
	bh=uD/8nLKVWM+Lp2qYVbaC6377nn0bz6Ew4o5O6RI0L8g=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=jbBBtd0j5aTZoqpxwPv748jMGJyW7PWt9SH82I7MW/nuzN/uDqx5qyeYin18Pi+kIphOLG6zXxuTbrQi/Wd+HHuix6RqLRCHdx2TBdzD0zAm2IZ7lGLur9Pl4vYr//s3T8/WW03ZG74VtLt9NU4+bXUFg534tnDGLAsrgz4U/2ryjXxCJ8NIN5cYExm+p7KnV+Spw0xhvELfytxc86QvKX+ZIW75DlOvtowkzqivaAAGKZArlLKKb/dxQxJ0zFgpvUT1owwVb5/5hdss6PvtmMjftU0Pr8IbFbpZUNyjbSmlRMztEax2fDwV+QZSPhZTc1JgzlYswd0lz+ADGh3Klg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0dl3LGI; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=M0dl3LGI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXf9r2X4vz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 02:21:52 +1000 (AEST)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PG9t0p027646;
	Thu, 25 Sep 2025 16:21:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=uD/8nL
	KVWM+Lp2qYVbaC6377nn0bz6Ew4o5O6RI0L8g=; b=M0dl3LGIuM8UqpgSELTF2k
	toetGXmAAq5JtDPA+3cTUyGJ2UOwXhWUiALAJqslb8Vx/jNbrRPXp4RjVmp29oAV
	HPw0T11QpA3MS+6oBcPRzC8OHhpO7mHaeMaM/Tt/OrgwVplKR+RzqFABko/Eb1Jk
	Tg51xGHYcDY0vQnkDAmStmCrF/GJA2PmoJdalBtqfSNdTySgdGSggdelT5pgL9rh
	8v8+XAA4sZEw3oTvdbV+tS0mF1Qo5MT1Ml2bnwBl9o8dS7xw712ay+eJBhxuIPO4
	e1XDQH8Jef3WKU8qeV3MVMP05j0LCvuTO5lzzb/GZExDDYWSA2o4NfdGWDZfFSpg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ky6f0nh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 16:21:45 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58PGLiOE015140;
	Thu, 25 Sep 2025 16:21:44 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 499ky6f0nb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 16:21:44 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58PDCFAk019743;
	Thu, 25 Sep 2025 16:21:43 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 49a83kes9m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Sep 2025 16:21:43 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58PGLdLF26542388
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Sep 2025 16:21:39 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 789332004B;
	Thu, 25 Sep 2025 16:21:39 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9F7A920040;
	Thu, 25 Sep 2025 16:21:33 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.244])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 25 Sep 2025 16:21:33 +0000 (GMT)
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
In-Reply-To: <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
Date: Thu, 25 Sep 2025 21:51:19 +0530
Cc: Jiri Olsa <jolsa@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <6BB167B7-6479-44E7-9175-E67E500DB9E2@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
 <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
        Namhyung Kim <namhyung@kernel.org>,
        Arnaldo Carvalho de Melo <acme@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: biCr0rqG765JJcxil91zs-AIYvTzUvDY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIwMDAyMCBTYWx0ZWRfX9eJepzwrR6vn
 nCSAd0dschZgUjv5BZtO4Yg6MR5Gl/7cPNH53ivLxOnHXGy2Bh9CBNPhPkGpQ1jYxa+vLBKyU0M
 P4uHNzX0k5vZ4fowaS7lJinXwkRUb8ilVdeCabmKMb4Em+J6FgFpJUBfo6HahXrZW/YiYV/PSz0
 8+DLhZF02ArxoPlA1pvFP22+9UCvEeeMTTitEwlQzCWqnFZ2ktNFguQX3E2qT2SGwkD+pqs8c7W
 SBpXR0MSEzEN3k/R6qoWVx1LEkuphOvrAHxTXI9ONfK01bk0HyPPXmGzHSDbnG/BlY4l0Mhxybe
 5X4bILZZ3fJc9InUzPKq7QR7VKUNcnoN7K/1/3r4DWDckmCg62OWO9J7N49BMnlU1w74sTQnh1M
 zU1ljrQk
X-Authority-Analysis: v=2.4 cv=XYGJzJ55 c=1 sm=1 tr=0 ts=68d56c19 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=9a-m9Z7WuIiSYxGGx3EA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: ZEZYSBFwn1R1TnxEf7Us3v0PioL1MvtV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-25_01,2025-09-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509200020
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



> On 17 Sep 2025, at 11:28=E2=80=AFAM, Adrian Hunter =
<adrian.hunter@intel.com> wrote:
>=20
> On 16/09/2025 08:25, Athira Rajeev wrote:
>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>> retrieve a log of dispatch and preempt events from the hypervisor
>> using data from Disptach Trace Log(DTL) buffer. With this =
information,
>> user can retrieve when and why each dispatch & preempt has occurred.
>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>> via perf.
>>=20
>> - Patch 1 to 6 is perf tools side code changes to enable perf
>>  report/script on perf.data file
>=20
> For all patches 1 to 6:
>=20
> Reviewed-by: Adrian Hunter <adrian.hunter@intel.com>

Hi All,

Looking for further comments if any on this patchset.
The kernel side patches for this feature which was sent as separate =
series is pulled to powerpc tree by Maddy

If the tools side changes looks good, can we have this merged to perf =
tools tree ?

Thanks
Athira

>=20


