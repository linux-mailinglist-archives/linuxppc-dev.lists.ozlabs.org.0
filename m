Return-Path: <linuxppc-dev+bounces-12360-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 652E5B83241
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 08:29:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cS5Mm1BZ8z30Pg;
	Thu, 18 Sep 2025 16:29:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758176980;
	cv=none; b=TTsQjolf2C2DIhV5nkxloaO7oA8p8urLRl5q7FG2bZnn9zrn6PIbtuPYsWA45iSWtAXgFVRD/nyXe0P4bWQvgqYlQ059iN7fwG1YLJspOQRuo9WVb9t73BfGs2Dj23AQmUTQJcnKYvtU2D10fNWoKjQTuWEdrEmua/EceMLzcgvPQGhBRKi32zbODd95suWeSPppMkRvigx5hXWShEuqkSFkU00G13eiErDntV5ZyztTNQjAaZlweowT8BWhOPBNvMnD1k0bClV0qyIfoeD+4Y3VR0M9WW/JM56MplMB1Wl3DJ5BhOiwk2159Jv7vN03AXF3cq1rwvXXx0MfSmSpcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758176980; c=relaxed/relaxed;
	bh=YjShUSKsxF7qw26ZMryvnOeOoxGT+daR3uQilwCeQqQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=F15B211fTNwCG3MiobCse4dzFTNe7toCSQI09Yab2pkvLNX28Y/oJiNX16LXcy0w8W2yDFKG/W20AV+Xi7tuk3F22yaABUJvgjdNmXCN0U4cXJLou9Zt3p5Y/b1LrUTwET715ZoaiessZmPSQIZ1Z2wIRoInNzLPy458VlYB0Ir4ad9n8jfqBg2B0oLskmALjJrv3Pmz/cgllh41AQ2YhBBQy675P8GXBr/25+S1iLajpdMy8mJXjN3tYwqXkz/QHgcnLkhNuPmFfrIgc5ltYrkznebyCQ3PjNlAN/lvT92GEiC+/S6dwYUc2Z1E4UVNZGn6TPiizB4bCVPmnSYXMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hIhmUIff; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hIhmUIff;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cS5Ml2qxCz2yGM
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 16:29:38 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58I4M9hR011476;
	Thu, 18 Sep 2025 06:29:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=YjShUS
	KsxF7qw26ZMryvnOeOoxGT+daR3uQilwCeQqQ=; b=hIhmUIff9wePLQJ8CfYjNg
	+j1dixdMc2LsUtIwvqG9G5UcsdyYGryLQFpHe0mPqTmgJgOq/j5nxKKrumiTuWkf
	dYR+fJjC3krj3j/pocfdVnnMVSiXLAdeldY6+GWmYk080YEy2hdRHnMANDzKdnU5
	bNMpPQG0UFzTpOHTguZ4jn4Z6R6tDcHOXWnc+4PgU8feHnk1NtgkKpWrVyQaT1IY
	SGZ8OXBq5T6NGPElEQq3WOvaoNr5Jm1Eja4ONASS/0aAEQPqDyIVN5QCr2/Xu0Py
	hwjue3kfHdxo5Zb1KoJwdUXfgqAc68a+QJcEv938EPR966neW9M4mF+sCQQ/Jr0A
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4j8ecd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:29:34 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 58I6O7fK020241;
	Thu, 18 Sep 2025 06:29:33 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 497g4j8ecc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:29:33 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 58I53hZv005923;
	Thu, 18 Sep 2025 06:29:32 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 495jxudf8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Sep 2025 06:29:32 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 58I6TS2917170702
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 18 Sep 2025 06:29:29 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DA2E520043;
	Thu, 18 Sep 2025 06:29:28 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2BE4D20040;
	Thu, 18 Sep 2025 06:29:23 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.250.196])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 18 Sep 2025 06:29:22 +0000 (GMT)
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
Date: Thu, 18 Sep 2025 11:59:09 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Ian Rogers <irogers@google.com>, Namhyung Kim <namhyung@kernel.org>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
        Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
        Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <4C841772-9590-468B-A5E5-B67495E4E2D6@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com>
 <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com>
To: Adrian Hunter <adrian.hunter@intel.com>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Qf5mvtbv c=1 sm=1 tr=0 ts=68cba6ce cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=QyXUC8HyAAAA:8 a=9a-m9Z7WuIiSYxGGx3EA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: a8xR3r_Z3WgahvjBivveNOadbQTtISoA
X-Proofpoint-GUID: HhY_rwAW0RbEwN4OPnHN74p6hz9OyP4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwNCBTYWx0ZWRfX2Dk9pNkGn0H6
 hXshTUuOAJxtLc6PfHxh3CetvBvTgIQpAbzRXLbEWkniZ61d8voUOt28FyThkt0bUEOUOO1Bbtd
 6YxUC8TMPE0V0SWLIQ4OcVpFQP/p9NqWxn2PtExXuph0lYvVcAdV1xf0X1r4QlTQQYujkuoOE0R
 iTnCA7BH2J7v/jH3oVfRJzoDQ4FLL2KmpDFGYsOB41nkjy4B9vQvJpFzMJ19qs+P5Ef7HBzgMp+
 r/kDwwLz5WmeV6z55IbumcmNcbo1XUjxZF3YzZd9TzZVBMr6XHcbCQ3hSGabUfuVj6s18XpSXxZ
 Znm6IxvDNbZJgNyTX/WpXvR6TorauFsFHDgzOz4uN4JpC6Q5NzTKIo3AHzvNOjOh2+BblvtysyM
 H6ujsv6g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-18_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160204
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

Thanks Adrian for sharing Reviewed-by=20

Athira
>=20



