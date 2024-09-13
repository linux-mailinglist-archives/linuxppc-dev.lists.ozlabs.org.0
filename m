Return-Path: <linuxppc-dev+bounces-1317-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 11473977B28
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 10:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4nh16pkMz2ygX;
	Fri, 13 Sep 2024 18:35:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726216545;
	cv=none; b=Fmpm5yTjQuxXLEDbSzGHaV6UKXYbTwTQ/NkSIGd2MlJKlT2SAiucATd/Ic3F+xBwVm+94E1W+edHI/kYp40jckFaHx3M6JO0pav6x6mITDnJVUPcTkaNCh+mJvva+pmhqTmW+4DgWDPH/r0YqD+xuLozzLtTPAf/Mgpk1uPgB5mqDLwjNSgeo+xKNAjS/coUCoI7OFjm1vtRufS9x+g9//sTa+fEU3++70CEhH15ZuoNQM8MdssokUOG3ftpUqVmQLa3IiHY6kdB09xB1A4hIhDeQv5aJKm4dGsELF7bWOkrBd8JkF1ekF+3S+U5e5JYLGosryqLED4rCqU119tjRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726216545; c=relaxed/relaxed;
	bh=StZG6R15DIf2nBirSiFNGX9i4sLjTFFP8nh2d5l3Q54=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Aqc7UBOq7Vz7SPnAnExPq5UqhlsKrq1hzVM+h85UkFN0UHL7L1cXzNkxEJd5/Rm73d8oagDOGK+YEPHRUPUqNIyc/kVILA9ISnCwdY48aQKAlMj1+J0pBC203JFP/50Bpr5PbARG9xyZ8bYexsXwvs6cVEHpcIqSKQHlsGAy8/oPED4fkOnwl+9IhPcHpTJsnSxKNB4CAWOldgzFk+9HYICarn1DELTKMW9nzve0vSVEVJxfIUlsXgf9RBocgZoXkuzodjpI+xhtOM9RSOLt5X5UUHeWpRsnxMOhE5XL1x7kMTwNIcpzepsA5BKBpTR2/EI1Y67yfwb4LGSm8Zs1wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlbE/jtu; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tlbE/jtu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4nh12VNwz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Sep 2024 18:35:45 +1000 (AEST)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48D2t2J5027446;
	Fri, 13 Sep 2024 08:35:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	message-id:date:subject:to:cc:references:from:in-reply-to
	:content-type:content-transfer-encoding:mime-version; s=pp1; bh=
	StZG6R15DIf2nBirSiFNGX9i4sLjTFFP8nh2d5l3Q54=; b=tlbE/jtuJy3jDSu9
	OdANTgMZeezdFERzqX+gLijW3+Rl9ztDybUMyXI7e8bbGwcs0Wk6IQS5ZY1mvK05
	P4rSdnkHF/+5PdyK64fTHis7ZrjuyTTz8TgufRe2W9NcCTpS/nMHcNbJkmdi36i6
	DBXJckS7K5SuRFoLh3B8cY3pVi61zycnY7DAglbogUymVxys2D4w1eU4XG4GiaJx
	f70D3P/1vaC1S/Lhm9gblc9UEiCI+EXqdE62sElNqp5N3JQ8p9b3o7P24C82yraK
	9b3Xf01TSDcKGEaci01GyXoKicLrwFLd6QblFj1yWnJ1V7UCagPe+RNi/qkrRbJD
	SVR37w==
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 41gejb0sav-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:35:35 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 48D6Adux010729;
	Fri, 13 Sep 2024 08:35:34 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 41kmb70m9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 13 Sep 2024 08:35:33 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 48D8ZU4L14680342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 13 Sep 2024 08:35:30 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1A1E20040;
	Fri, 13 Sep 2024 08:35:29 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 887B820043;
	Fri, 13 Sep 2024 08:35:27 +0000 (GMT)
Received: from [9.43.112.138] (unknown [9.43.112.138])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 13 Sep 2024 08:35:27 +0000 (GMT)
Message-ID: <9c18c4d4-ee60-4543-8bbb-ddc729c0a0f5@linux.ibm.com>
Date: Fri, 13 Sep 2024 14:05:26 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] powerpc/vpa_pmu: Add interface to expose vpa counters
 via perf
To: Christophe Leroy <christophe.leroy@csgroup.eu>, mpe@ellerman.id.au
Cc: atrajeev@linux.vnet.ibm.com, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, maddy@linux.ibm.com,
        disgoel@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        hbathini@linux.ibm.com, adubey@linux.ibm.com
References: <20240828102141.1052332-1-kjain@linux.ibm.com>
 <56b53876-0838-416f-adce-b1ffbd0916fc@csgroup.eu>
Content-Language: en-US
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <56b53876-0838-416f-adce-b1ffbd0916fc@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pdNkXY-ly2RFLAqx9Xjvw2FlUpe2Y68A
X-Proofpoint-GUID: pdNkXY-ly2RFLAqx9Xjvw2FlUpe2Y68A
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-13_04,2024-09-13_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 phishscore=0 mlxlogscore=999 spamscore=0 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409130058



On 9/13/24 12:00, Christophe Leroy wrote:
> 
> 
> Le 28/08/2024 à 12:21, Kajol Jain a écrit :
>> The pseries Shared Processor Logical Partition(SPLPAR) machines
>> can retrieve a log of dispatch and preempt events from the
>> hypervisor using data from Disptach Trace Log(DTL) buffer.
>> With this information, user can retrieve when and why each dispatch &
>> preempt has occurred. Added an interface to expose the Virtual Processor
>> Area(VPA) DTL counters via perf.
>>
>> The following events are available and exposed in sysfs:
>>
>>   vpa_dtl/dtl_cede/ - Trace voluntary (OS initiated) virtual processor
>> waits
>>   vpa_dtl/dtl_preempt/ - Trace time slice preempts
>>   vpa_dtl/dtl_fault/ - Trace virtual partition memory page faults.
>>   vpa_dtl/dtl_all/ - Trace all (dtl_cede/dtl_preempt/dtl_fault)
>>
>> Added interface defines supported event list, config fields for the
>> event attributes and their corresponding bit values which are exported
>> via sysfs. User could use the standard perf tool to access perf events
>> exposed via vpa-dtl pmu.
>>
>> The VPA DTL PMU counters do not interrupt on overflow or generate any
>> PMI interrupts. Therefore, the kernel needs to poll the counters, added
>> hrtimer code to do that. The timer interval can be provided by user via
>> sample_period field in nano seconds.
>>
>> Result on power10 SPLPAR system with 656 cpu threads.
>> In the below perf record command with vpa_dtl pmu, -c option is used
>> to provide sample_period whch corresponding to 1000000000ns i.e; 1sec
>> and the workload time is also 1 second, hence we are getting 656 samples:
>>
>> [command] perf record -a -R -e vpa_dtl/dtl_all/ -c 1000000000 sleep 1
>> [ perf record: Woken up 1 times to write data ]
>> [ perf record: Captured and wrote 0.828 MB perf.data (656 samples) ]
>>
>> There is one hrtimer added per vpa-dtl pmu thread. Code added to handle
>> addition of dtl buffer data in the raw sample. Since DTL does not provide
>> IP address for a sample and it just have traces on reason of
>> dispatch/preempt, we directly saving DTL buffer data to perf.data file as
>> raw sample. For each hrtimer restart call, interface will dump all the
>> new dtl entries added to dtl buffer as a raw sample.
>>
>> To ensure there are no other conflicting dtl users (example: debugfs dtl
>> or /proc/powerpc/vcpudispatch_stats), interface added code to use
>> "down_write_trylock" call to take the dtl_access_lock. The
>> dtl_access_lock
>> is defined in dtl.h file. Also added global reference count variable
>> called
>> "dtl_global_refc", to ensure dtl data can be captured per-cpu. Code also
>> added global lock called "dtl_global_lock" to avoid race condition.
>>
>> Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
>> ---
>> Notes:
>>
>> - Made code changes on top of recent fix sent by Michael Ellerman.
>>    Link to the patch:
>> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240819122401.513203-1-mpe@ellerman.id.au/
>>
>>   arch/powerpc/perf/Makefile  |   2 +-
>>   arch/powerpc/perf/vpa-pmu.c | 469 ++++++++++++++++++++++++++++++++++++
>>   include/linux/cpuhotplug.h  |   1 +
>>   3 files changed, 471 insertions(+), 1 deletion(-)
>>   create mode 100644 arch/powerpc/perf/vpa-pmu.c
> 
> 
> Seems like it doesn't build on PPC64:
> 
> arch/powerpc/perf/vpa-pmu.c#L212
> passing argument 1 of 'up_write' from incompatible pointer type
> [-Wincompatible-pointer-types]
> 
> arch/powerpc/perf/vpa-pmu.c#L261
> passing argument 1 of 'down_write_trylock' from incompatible pointer
> type [-Wincompatible-pointer-types]
> 
> arch/powerpc/perf/vpa-pmu.c#L402
> passing argument 1 of 'up_write' from incompatible pointer type
> [-Wincompatible-pointer-types]

Hi Christophe,
   Thanks for checking the patch. These changes are on top of fix patch
sent by Michael Ellerman
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20240819122401.513203-1-mpe@ellerman.id.au/

Since he changed the dtl_access_lock to be a rw_semaphore.

Are you trying with Michael patch changes?

Thanks,
Kajol Jain


