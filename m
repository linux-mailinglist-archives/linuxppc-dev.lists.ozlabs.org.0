Return-Path: <linuxppc-dev+bounces-6527-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2A4DA4760B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2025 07:42:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z3MGf0PxBz30TQ;
	Thu, 27 Feb 2025 17:42:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740638569;
	cv=none; b=k0VEYO3/DwcwWl+AtCp3xVR7O/LlPEPdOLdkxb6LjbodDl2PJX+driVWmaO3ks8+HGlu7w9LUoeK6Cm6GGL72Yl5+F37kqo/g2L2JfSUAzkMJt35Ru2m3XfMDQt3yhZNxX/E0d5li/XyTm4HENHHyRwCfnR7g19fN++AmFCJWNlDUKJG6oBKcwnPwOf+xI9blvSpasTe3nDMbpONuVup9Yue+SFwlyfRqa6VFLgC/0AVbGbSpOn4GGiDA9/flNfwtCxJmEd04t/yvwnCHmQrz+1uPzQpbu3PPuIZ2G0duihTj6jOe09kzpwF6qAXUAkZ2DE+o3FxDSR4Fw6qL78nqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740638569; c=relaxed/relaxed;
	bh=H9SI1+oJDfsMLTWjY6/U9vD0lCb8L5OiNWbgs890E8s=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=aeB3bkL8mQvM9Vz/HdS09YMgGhv4qxlBaG3n3PPzRBVZEjaPbcqiqODQlSMUUf0wtGhGhzEsjRGcDp+c9ITvmeaifTKwHG6m1iITxz3IZbXZ7aiEBXlscqsV6tx/WybMBIcsR/m9HoEWdxHYXDz/+6givBGvo04uoVw9hubH/iyR7PCsHRmgnX0Bxrenr1yPBOcWwZ62j01PEJxvIGoWU8POhAfHfFBC90GMmTLALMb3V+Ehn1k0HftdSpht3M7gEiaZDdzqbo8lRmR+kG9WNh8ErILi/qoaQp9huQ/zKY9Ufut7nhRWReUh0Fm5wmJI1fKZm+SHxCpHviOrApUlmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uenec+//; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Uenec+//;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z3MGd0gvsz2ykZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2025 17:42:48 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51QMoAdK015625;
	Thu, 27 Feb 2025 06:42:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=H9SI1+
	oJDfsMLTWjY6/U9vD0lCb8L5OiNWbgs890E8s=; b=Uenec+//xOhh+BekPA169c
	TfTKio8+cgV/N6Uw+FW54JBEFy/nEmwlRxiHGxRGG4qQcqlkepQO7gjBdQOAzsAK
	Vno4jcBnJttaqx3bAf5x0X+nc7dIzTVo1+KtYvXY/hO5GJ5oDdJQOyHr3wudeBZ0
	jVfYxe4pq2tc6bld2aJDsdNGNwL0ndgTtkFWB+M+UKbMUlfn/cHotF5LGzNnBL3U
	3cUM3swLk7lTNMZTP2QiTYsc0igiZk9nuqu76b0NI5aoAojM0+PuFFbu2/JQGfML
	/fTasuh4pIh/KAkHXU/yD6n21PbWPb05iEC+QOPt/2gt2XGsgwlLmimFTyzjb6kg
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 452c3a1mpa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:42:41 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51R6cr0h018209;
	Thu, 27 Feb 2025 06:42:41 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 452c3a1mp8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:42:41 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51R4CPVB012918;
	Thu, 27 Feb 2025 06:42:40 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44yrwsyckh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Feb 2025 06:42:40 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51R6gZxQ47645096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Feb 2025 06:42:35 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 272B020043;
	Thu, 27 Feb 2025 06:42:35 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B602B20040;
	Thu, 27 Feb 2025 06:42:29 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.240.191])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Thu, 27 Feb 2025 06:42:29 +0000 (GMT)
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
Subject: Re: [PATCH] tools/perf: Use perf_tool__init() to initialize default
 values in builtin trace
From: Athira Rajeev <atrajeev@linux.ibm.com>
In-Reply-To: <Z7-0DuisrMHyscDj@google.com>
Date: Thu, 27 Feb 2025 12:12:03 +0530
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ian Rogers <irogers@google.com>,
        "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Kajol Jain <kjain@linux.ibm.com>,
        Disha Goel <disgoel@linux.vnet.ibm.com>, hbathini@linux.vnet.ibm.com,
        Aditya.Bodkhe1@ibm.com, Tejas Manhas <Tejas.Manhas1@ibm.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <C898BD11-D2E7-4338-9549-53B4C71785FE@linux.ibm.com>
References: <20250225113157.28836-1-atrajeev@linux.ibm.com>
 <Z7-0DuisrMHyscDj@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3776.700.51)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NCHJplYS_bXwzLP8ThDerHmU9vQzQvL2
X-Proofpoint-ORIG-GUID: X2LXOH1ic3JfI6O-n28jlq9TrtRZpBFE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-27_03,2025-02-26_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502270048
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 27 Feb 2025, at 6:08=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> On Tue, Feb 25, 2025 at 05:01:57PM +0530, Athira Rajeev wrote:
>> Perf trace on perf.data fails as below:
>>=20
>> ./perf trace record -- sleep 1
>> ./perf trace -i perf.data
>> perf: Segmentation fault
>> Segmentation fault (core dumped)
>>=20
>> Backtrace pointed to :
>> ?? ()
>> perf_session.process_user_event ()
>> reader.read_event ()
>> perf_session.process_events ()
>> cmd_trace ()
>> run_builtin ()
>> handle_internal_command ()
>> main ()
>>=20
>> Further debug pointed that, segmentation fault happens when
>> trying to access id_index. Code snippet:
>>=20
>> case PERF_RECORD_ID_INDEX:
>> err =3D tool->id_index(session, event);
>>=20
>> Since 'commit 15d4a6f41d72 ("perf tool: Remove
>> perf_tool__fill_defaults()")', perf_tool__fill_defaults is
>> removed. All tools are initialized using perf_tool__init()
>> prior to use. But in builtin-trace, perf_tool__init is not
>> used and hence the defaults are not initialized. Use
>> perf_tool__init() in perf trace to handle the initialization.
>=20
> Thanks for fixing this.  I can reproduce the problem and confirmed =
this
> patch fixed it.
>=20
> Thanks,
> Namhyung
Thanks Namhyung for checking the patch

Athira
>=20
>>=20
>> Reported-by: Tejas Manhas <Tejas.Manhas1@ibm.com>
>> Signed-off-by: Athira Rajeev <atrajeev@linux.ibm.com>
>> ---
>> tools/perf/builtin-trace.c | 1 +
>> 1 file changed, 1 insertion(+)
>>=20
>> diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
>> index f55a8a6481f2..092c5f6404ba 100644
>> --- a/tools/perf/builtin-trace.c
>> +++ b/tools/perf/builtin-trace.c
>> @@ -4589,6 +4589,7 @@ static int trace__replay(struct trace *trace)
>> struct evsel *evsel;
>> int err =3D -1;
>>=20
>> + perf_tool__init(&trace->tool, /*ordered_events=3D*/true);
>> trace->tool.sample   =3D trace__process_sample;
>> trace->tool.mmap   =3D perf_event__process_mmap;
>> trace->tool.mmap2   =3D perf_event__process_mmap2;
>> --=20
>> 2.43.5



