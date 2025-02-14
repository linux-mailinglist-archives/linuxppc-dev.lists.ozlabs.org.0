Return-Path: <linuxppc-dev+bounces-6190-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F836A35DD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2025 13:43:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YvWtz6VBzz3054;
	Fri, 14 Feb 2025 23:43:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739537019;
	cv=none; b=Z4PMJXRBv9eHSoifnBOV5qbXp3S/kl9R+v5I43zPjtLyy/b3Nj1MnvujewoP0lgOim8gQNk5eFuAzHigj2JROFXgn6hb5gJKblXhVFqG7XN2p2r70M4JOSlQWGdk0GNpmUBcEWWC0v+phFMFr27+RLmvmbJZfEuTt13kNJqI8r8pGMaCGjhtt9f/XfqYs3sB7fbZIMDH0ivYGLkVAX7rGtWLQrwQ+Y9baXponw01TaExRbWtMjDAB09YMlGvs88stgHhx45q16JWVHPZwWb5s5XONkcxL+NIX9CdocltWSG/Z49C3HKFc6nd60F644KKRIsbXYXrTv9UKHq71y5e6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739537019; c=relaxed/relaxed;
	bh=sPVBKRFS5vtWIBQdOK/9a5fQ2YYyQ1vFUi4kZgw2mjM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gsJDqDNs2mhKbQMdZPpZPnBkpP/OeKKpegJT1BuQTg8etPj6GqEB2p69e4JVz8+HlXpM35x6UQFrDgL59y8n9xD/Epe0gDvHNuQvhXZVnhBZ4dwuPGlXvXmtwwoApDrH7gH/sSENZ+645PG9UJVg7wbuZRiEJ/ATAQ+024P5DDENBNnShqSEfct5i0A/gcnY2/IUtABVXNvmKvMD1iOxteLSzuCwbzFbferbolWaQkiWBCzqtKMKrs6guZmy4FznB6DP4y0x1Db8J/la68tVx/cdpaG90hWgsLw9FgHylbyzmhZM3HopsQd2EGqDmVJQfRnYPhCyX3g/X4vITzwFfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=epbhwH6e; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tmricht@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=epbhwH6e;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tmricht@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YvWty6mkWz2xmZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2025 23:43:38 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51EAJDIL032759;
	Fri, 14 Feb 2025 12:43:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=sPVBKR
	FS5vtWIBQdOK/9a5fQ2YYyQ1vFUi4kZgw2mjM=; b=epbhwH6eymYMmlGAw/eSHQ
	b67pAv7DoAXV4VGhqSUzaaW+6kSRUc2wWrUIcJiGZEPMIHYeeCXF30JtkE5A/r/B
	rNwQEPLvTzOv45yIE+WaZYxO/EowulsOnqDqu6MmRhIv+iro5W54Tb3LuDTlBQI1
	LHmjB30M46u3CifnDNgIsNhePWklMlkw0934jMFyaZWkdgv6GYu3B6siwl3+Ubkz
	/vBqsTE4JHFEmRA9w+irGLOASHt8Ql2IrYxfOoM3BLNQn6SsbeP7fcFO3kZKzWoo
	vUVjc/xtYF7wIxu9TgMBjC8P8k0MVW4qcI1+9oEhpIZyr7u8oBo40F6CTirtcUag
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ssvab7c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:43:28 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51ECIKHZ024375;
	Fri, 14 Feb 2025 12:43:27 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44ssvab7bx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:43:27 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51ECWUxF028687;
	Fri, 14 Feb 2025 12:43:26 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 44pma235p4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Feb 2025 12:43:26 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51EChNpb28574460
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Feb 2025 12:43:23 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 619682005A;
	Fri, 14 Feb 2025 12:43:23 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D49D820043;
	Fri, 14 Feb 2025 12:43:22 +0000 (GMT)
Received: from [9.171.39.145] (unknown [9.171.39.145])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Feb 2025 12:43:22 +0000 (GMT)
Message-ID: <325f8f95-3fa8-47f5-a763-c8b41de700bd@linux.ibm.com>
Date: Fri, 14 Feb 2025 13:43:22 +0100
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
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] tools/perf: Add check to tool pmu tests to ensure if the
 event is valid
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>, acme@kernel.org,
        jolsa@kernel.org, adrian.hunter@intel.com, irogers@google.com,
        namhyung@kernel.org
Cc: linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com,
        hbathini@linux.vnet.ibm.com, Aditya.Bodkhe1@ibm.com
References: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
Content-Language: en-US
From: Thomas Richter <tmricht@linux.ibm.com>
Organization: IBM
In-Reply-To: <20250212185438.15251-1-atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8IIT3megEuEuK52r39Odwls2WutMU33b
X-Proofpoint-ORIG-GUID: Mu3wVLarQMZdkWRtKekHc8skM2RGGba9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-14_05,2025-02-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 impostorscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502140092
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2/12/25 19:54, Athira Rajeev wrote:
> "Tool PMU" tests fails on powerpc as below:
> 
>    12.1: Parsing without PMU name:
>    --- start ---
>    test child forked, pid 48492
>    Using CPUID 0x00800200
>    Attempt to add: tool/duration_time/
>    ..after resolving event: tool/config=0x1/
>    duration_time -> tool/duration_time/
>    Attempt to add: tool/user_time/
>    ..after resolving event: tool/config=0x2/
>    user_time -> tool/user_time/
>    Attempt to add: tool/system_time/
>    ..after resolving event: tool/config=0x3/
>    system_time -> tool/system_time/
>    Attempt to add: tool/has_pmem/
>    ..after resolving event: tool/config=0x4/
>    has_pmem -> tool/has_pmem/
>    Attempt to add: tool/num_cores/
>    ..after resolving event: tool/config=0x5/
>    num_cores -> tool/num_cores/
>    Attempt to add: tool/num_cpus/
>    ..after resolving event: tool/config=0x6/
>    num_cpus -> tool/num_cpus/
>    Attempt to add: tool/num_cpus_online/
>    ..after resolving event: tool/config=0x7/
>    num_cpus_online -> tool/num_cpus_online/
>    Attempt to add: tool/num_dies/
>    ..after resolving event: tool/config=0x8/
>    num_dies -> tool/num_dies/
>    Attempt to add: tool/num_packages/
>    ..after resolving event: tool/config=0x9/
>    num_packages -> tool/num_packages/
> 
>    ---- unexpected signal (11) ----
>    12.1: Parsing without PMU name                                      : FAILED!
> 
> Same fail is observed for "Parsing with PMU name" as well.
> 
> The testcase loops through events in tool_pmu__for_each_event()
> and access event name using "tool_pmu__event_to_str()".
> Here tool_pmu__event_to_str returns null for "slots" event
> and "system_tsc_freq" event. These two events are only applicable
> for arm64 and x86 respectively. So the function tool_pmu__event_to_str()
> skips for unsupported events and returns null. This null value is
> causing testcase fail.
> 
> To address this in "Tool PMU" testcase, add a helper function
> tool_pmu__all_event_to_str() which returns the name for all
> events mapping to the tool_pmu_event index including the
> skipped ones. So that even if its a skipped event, the
> helper function helps to resolve the tool_pmu_event index to
> its mapping event name. Update the testcase to check for null event
> names before proceeding the test.
> 
> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>

for s390:
Tested-by: Thomas Richter <tmricht@linux.ibm.com>

-- 
Thomas Richter, Dept 3303, IBM s390 Linux Development, Boeblingen, Germany
--
IBM Deutschland Research & Development GmbH

Vorsitzender des Aufsichtsrats: Wolfgang Wendt

Geschäftsführung: David Faller

Sitz der Gesellschaft: Böblingen / Registergericht: Amtsgericht Stuttgart, HRB 243294

