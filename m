Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9E58A3D5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 18:57:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466hpc71MkzDqZF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2019 02:57:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466hmY0NCPzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2019 02:55:24 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7CGq7OE093230
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 12:55:21 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ub9afqxvm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 12:55:20 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x7CGt8qX023929
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 16:55:19 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 2u9nj61y5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 16:55:19 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7CGtHp543057606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Aug 2019 16:55:17 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F66613604F;
 Mon, 12 Aug 2019 16:55:17 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 659AD136053;
 Mon, 12 Aug 2019 16:55:17 +0000 (GMT)
Received: from localhost (unknown [9.41.179.196])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 12 Aug 2019 16:55:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/rtas: use device model APIs and
 serialization during LPM
In-Reply-To: <5e98c3c9-eab0-b08a-50ee-b8bb9b9ad2dd@linux.ibm.com>
References: <20190802192926.19277-1-nathanl@linux.ibm.com>
 <20190802192926.19277-2-nathanl@linux.ibm.com>
 <5e98c3c9-eab0-b08a-50ee-b8bb9b9ad2dd@linux.ibm.com>
Date: Mon, 12 Aug 2019 11:55:17 -0500
Message-ID: <87a7cetjbe.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-12_06:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908120188
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: ego@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 8/2/19 12:29 PM, Nathan Lynch wrote:
>> diff --git a/arch/powerpc/kernel/rtas.c b/arch/powerpc/kernel/rtas.c
>> index 5faf0a64c92b..05824eb4323b 100644
>> --- a/arch/powerpc/kernel/rtas.c
>> +++ b/arch/powerpc/kernel/rtas.c
>> @@ -871,15 +871,17 @@ static int rtas_cpu_state_change_mask(enum rtas_cpu_state state,
>>  		return 0;
>> 
>>  	for_each_cpu(cpu, cpus) {
>> +		struct device *dev = get_cpu_device(cpu);
>> +
>>  		switch (state) {
>>  		case DOWN:
>> -			cpuret = cpu_down(cpu);
>> +			cpuret = device_offline(dev);
>>  			break;
>>  		case UP:
>> -			cpuret = cpu_up(cpu);
>> +			cpuret = device_online(dev);
>
> Not that I have a problem with using the core device api, but as an FYI we had
> discussed in the past introducing one shot functions in kernel/cpu.c for doing
> our take down, bring up where cpu_update_maps() can be held for the whole
> process. The thought was maybe it would be useful generically being able to
> online/offline a bulk subset.

Thanks, I've discussed something along those lines with Gautham and it
may be more desirable in the longer term than having the arch code
perform the locking.

However, I think it would be even better to avoid bringing up all the
offline CPUs only to shut them down again on the destination. Ideally we
could nudge offline threads into H_JOIN without doing all the work
associated with cpuhp callbacks and generating hotplug event noise. I'm
concerned about the overhead incurred by the current design on large
LPAR configurations.

Regardless, I'd expect that this fix shouldn't have to wait for the
implementation of either of those ideas.


>>  			break;
>>  		}
>> -		if (cpuret) {
>> +		if (cpuret < 0) {
>>  			pr_debug("%s: cpu_%s for cpu#%d returned %d.\n",
>>  					__func__,
>>  					((state == UP) ? "up" : "down"),
>> @@ -968,6 +970,8 @@ int rtas_ibm_suspend_me(u64 handle)
>>  	data.token = rtas_token("ibm,suspend-me");
>>  	data.complete = &done;
>> 
>> +	lock_device_hotplug();
>> +
>
> Does taking the device hotplug lock suffice to prevent races with sysfs attempts
> to hotplug (on/off) cpus?

Yes.

> And if so we can strip out the code that checks the mask to see if we
> raced, correct?

I hope so, but I'm not sure, and it's harmless to leave in for
now. There could be other code which (like LPM) initiates cpu
online/offline outside of sysfs.
