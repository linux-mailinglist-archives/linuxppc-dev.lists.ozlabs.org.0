Return-Path: <linuxppc-dev+bounces-4966-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D884A08BD0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jan 2025 10:26:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YTx9X6Gftz3bxL;
	Fri, 10 Jan 2025 20:26:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736501184;
	cv=none; b=bsKmJSkFrWX4ZUGLpBmm59B5oQryA5m0Zm5q0avZq4UfTmeYKVJcA5c3+0orqzgTFjHw6JUxORnqbOG7ZGJrb2/Y3E31CbnaQGkKloWCdU6Uu4nmiixIqK2tGmn2SMJcbV8r9SFyhJ01USyDPh2bbYYtkxspaS6bbLOrFw2QmEXGev2AbIXZOhF9RKccytlwhwepWpsBSCZ8nOGM70ycVeQk5vpzWnunSiziKSnRE1Bk1nbHqxV+SXSuXcYN5ZqWF8zONDk+XcXpUzO9HcEmUgpnEw7HOu0kfXuwFoU5Jeqk0ZRML0PgtMrWhrmXh4QhEnYzblLpiQ0OcJqJ7M69KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736501184; c=relaxed/relaxed;
	bh=98yYFLUW18kU2QTeuZbwwBqZAxbBmbeUB5XHkz6el08=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=CSte7i2l1/WPMYZ9xybJsCgTS3xJklUMhFwg+kRwYR3YJYF27X/msN5Pybr/ir9cSnbJLgTGBgA/USTv+bwZnc9prtGtVfuwp1RTcPjMWpmblfyKg/ed4TLjc7qOu/FRpKEZjRIX3OTTqDB0GTSwGvR69MUV+1hRU5t1Z4QA88FXGfeL43leRaA0c3w3EwJshdTOsisRpJoaijM94NHCR/8t4PUoPS6b64ad5ZnyUQQCYYMl+Q4TJrqQ1vm6SzxQgkVnfaWURkUQR0BXqmx0eRgzxU+AIjZLNr4bMrg5tpog9jUHIaxP0oC9xJ7p5A0tMlnJgTzjPIemHhrNsZMl9g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jMTc53y5; dkim-atps=neutral; spf=none (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=jMTc53y5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=atrajeev@linux.vnet.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YTx9W459cz2yDl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jan 2025 20:26:22 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50A3rWtv028366;
	Fri, 10 Jan 2025 09:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=98yYFL
	UW18kU2QTeuZbwwBqZAxbBmbeUB5XHkz6el08=; b=jMTc53y5GGNjPL0acrioGf
	OxsZ+kMhB7YzA6RBgQuEgYt16j0SBen9IU8piSPA5G92BIlRX3g3NvkCC/kFnOa2
	ctCf7hJls1ArGC/vHqvq4KMWyEPPvGLAcSvBZ0wtm8EY207IPyU9Ka6S96M0J/f2
	y2pO71aGNeUFpwKqj69PIit85C/aU1tNk46iTUkrEYkjufUoRVB0QlLd+RfA77jU
	AXjzMhBirg1pM8hoZ5N6NyH11GK6UlcZzqHtA6RfOPewdlJKV6tBtQGKHWLpr+FO
	nWML6J1QQJdMSQnKLQP6lIkfZojcLL44W7P8ozkGiyRoCi3XjOkZnq9Ro97ABohQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442v1q1616-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:26:17 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 50A9I5mL008837;
	Fri, 10 Jan 2025 09:26:16 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 442v1q1613-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:26:16 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50A5F3hX015851;
	Fri, 10 Jan 2025 09:26:15 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 43ygtm9f2f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 Jan 2025 09:26:15 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50A9QB0A38928868
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 10 Jan 2025 09:26:11 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8175320040;
	Fri, 10 Jan 2025 09:26:11 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 85A1120043;
	Fri, 10 Jan 2025 09:26:06 +0000 (GMT)
Received: from smtpclient.apple (unknown [9.61.241.17])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Fri, 10 Jan 2025 09:26:06 +0000 (GMT)
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
Subject: Re: [PATCH] tools/perf: Fix return code for lock_contention_prepare
From: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
In-Reply-To: <Z3xH6kCK9zj5ttZM@google.com>
Date: Fri, 10 Jan 2025 14:55:52 +0530
Cc: acme@kernel.org, jolsa@kernel.org, adrian.hunter@intel.com,
        irogers@google.com, linux-kernel@vger.kernel.org,
        linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        maddy@linux.ibm.com, kjain@linux.ibm.com, disgoel@linux.vnet.ibm.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9460DA8B-0A2B-4567-851B-931EEEA0B4C1@linux.vnet.ibm.com>
References: <20241223135655.8042-1-atrajeev@linux.vnet.ibm.com>
 <Z3xH6kCK9zj5ttZM@google.com>
To: Namhyung Kim <namhyung@kernel.org>
X-Mailer: Apple Mail (2.3818.100.11.1.3)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: vTV0GUTHc05I8OA2ffpJyY5Xtb8AkoX-
X-Proofpoint-ORIG-GUID: aC7NC6M-bHhiXrEwmTUEjeOmgoi3A6kD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-15_01,2024-10-11_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501100074
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



> On 7 Jan 2025, at 2:45=E2=80=AFAM, Namhyung Kim <namhyung@kernel.org> =
wrote:
>=20
> Hello,
>=20
> On Mon, Dec 23, 2024 at 07:26:55PM +0530, Athira Rajeev wrote:
>> perf lock contention returns zero exit value even if the lock =
contention
>> BPF setup failed.
>>=20
>>   # ./perf lock con -b true
>>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>>   libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>>   libbpf: failed to find valid kernel BTF
>>   libbpf: kernel BTF is missing at '/sys/kernel/btf/vmlinux', was =
CONFIG_DEBUG_INFO_BTF enabled?
>>   libbpf: failed to find '.BTF' ELF section in =
/lib/modules/6.13.0-rc3+/build/vmlinux
>>   libbpf: failed to find valid kernel BTF
>>   libbpf: Error loading vmlinux BTF: -ESRCH
>>   libbpf: failed to load object 'lock_contention_bpf'
>>   libbpf: failed to load BPF skeleton 'lock_contention_bpf': -ESRCH
>>   Failed to load lock-contention BPF skeleton
>>   lock contention BPF setup failed
>>   # echo $?
>>    0
>>=20
>> Fix this by saving the return code for lock_contention_prepare
>> so that command exits with proper return code
>>=20
>> Signed-off-by: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
>=20
> Thanks for the fix, the change itself looks good but I think we need =
the
> same for setup_output_field() and select_key() as well.
>=20
> Thanks,
> Namhyung

Hi Namhyung

Thanks for reviewing and pointing out setup_output_field() and =
select_key()
I will send a V2 with handling return code for these two functions as =
well

Thanks
Athira=20
>=20
>=20
>> ---
>> tools/perf/builtin-lock.c | 3 ++-
>> 1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git a/tools/perf/builtin-lock.c b/tools/perf/builtin-lock.c
>> index 208c482daa56..2226c7dd4ae6 100644
>> --- a/tools/perf/builtin-lock.c
>> +++ b/tools/perf/builtin-lock.c
>> @@ -2049,7 +2049,8 @@ static int 	(int argc, const char **argv)
>> goto out_delete;
>> }
>>=20
>> - if (lock_contention_prepare(&con) < 0) {
>> + err =3D lock_contention_prepare(&con);
>> + if (err < 0) {
>> pr_err("lock contention BPF setup failed\n");
>> goto out_delete;
>> }
>> --=20
>> 2.43.5



