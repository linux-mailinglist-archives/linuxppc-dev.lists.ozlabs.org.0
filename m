Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 584F089A306
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:03:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HOMgEaPY;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VB4Yx1CW7z3vZt
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Apr 2024 04:03:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HOMgEaPY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VB4YC1328z3cNN
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Apr 2024 04:02:38 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 435H2MvH018613;
	Fri, 5 Apr 2024 17:02:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=3ZqFUrfN94HSlWuco/km+XcZadW/AbPrpYV1Y6Gl/bE=;
 b=HOMgEaPYsp/IJI+PsT59S7jed2ACkXUgaUrzHJNH1rFTTPYLtwG7q4t9kKWASAExZiBw
 5RxlXUpP1Yc5yS8az0L6PybVVzgE9U4jjZQsinq8ztN0f6vyiy1MB4dIPkG3p6zaboU/
 MHbAJWZpM10pHQCsekSPN5m2V8B0pk5g6BcYQOYsMHdElAWD6lg1UrXkeqcz+/2+ZCsW
 tvBw+Rqd6d/7psglE1ciZ909bF/NCDIyWhBvIAP1E7inGMI8OQ1peXUmgalz5sTRmldC
 v3epqOMNoFe45EVv8EyQone6viitZUZZWsJ92DJzygnP75qt/d50kGKHBtAf/O+ofyDK WQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xanbf0010-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 17:02:32 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 435H2WDG018803;
	Fri, 5 Apr 2024 17:02:32 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3xanbf000w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 17:02:32 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 435GK8w4007708;
	Fri, 5 Apr 2024 17:02:31 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x9epwupqb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Apr 2024 17:02:31 +0000
Received: from smtpav04.dal12v.mail.ibm.com (smtpav04.dal12v.mail.ibm.com [10.241.53.103])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 435H2RxY24052236
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 5 Apr 2024 17:02:29 GMT
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75C5658072;
	Fri,  5 Apr 2024 17:02:27 +0000 (GMT)
Received: from smtpav04.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 760F35805A;
	Fri,  5 Apr 2024 17:02:25 +0000 (GMT)
Received: from [9.195.45.188] (unknown [9.195.45.188])
	by smtpav04.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  5 Apr 2024 17:02:25 +0000 (GMT)
Message-ID: <4b1d3241-2caa-4bd1-b9cc-871d176c409e@linux.ibm.com>
Date: Fri, 5 Apr 2024 22:32:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/pseries: Add pool idle time at LPAR boot
To: Nathan Lynch <nathanl@linux.ibm.com>, mpe@ellerman.id.au
References: <20240405101340.149171-1-sshegde@linux.ibm.com>
 <87msq86kju.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <87msq86kju.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 33eVzq0BB5vboez8dQ1HKOmjfFblA4oR
X-Proofpoint-GUID: wckMnn7gwnoDC2QGnh8RrZ-q6McpgdI4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-05_19,2024-04-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 mlxscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2404010000 definitions=main-2404050119
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
Cc: naveen.n.rao@linux.ibm.com, tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, mahesh@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/5/24 6:19 PM, Nathan Lynch wrote:
> Shrikanth Hegde <sshegde@linux.ibm.com> writes:

Hi Nathan, Thanks for reviewing this.

>> When there are no options specified for lparstat, it is expected to
>> give reports since LPAR(Logical Partition) boot. App is an indicator
>> for available processor pool in an Shared Processor LPAR(SPLPAR). App is
>> derived using pool_idle_time which is obtained using H_PIC call.
> 
> If "App" is short for "Available Procesoor Pool" then it should be
> written "APP" and the it should be introduced and defined more clearly
> than this.
> 

Ok.I reworded it for v2. 

yes APP is Available Processor Pool. 

> 
>> The interval based reports show correct App value while since boot
>> report shows very high App values. This happens because in that case app
>> is obtained by dividing pool idle time by LPAR uptime. Since pool idle
>> time is reported by the PowerVM hypervisor since its boot, it need not
>> align with LPAR boot. This leads to large App values.
>>
>> To fix that export boot pool idle time in lparcfg and powerpc-utils will
>> use this info to derive App as below for since boot reports.
>>
>> App = (pool idle time - boot pool idle time) / (uptime * timebase)
>>
>> Results:: Observe app values.
>> ====================== Shared LPAR ================================
>> lparstat
>> System Configuration
>> type=Shared mode=Uncapped smt=8 lcpu=12 mem=15573440 kB cpus=37 ent=12.00
>>
>> reboot
>> stress-ng --cpu=$(nproc) -t 600
>> sleep 600
>> So in this case app is expected to close to 37-6=31.
>>
>> ====== 6.9-rc1 and lparstat 1.3.10  =============
>> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
>> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
>> 47.48  0.01  0.00    52.51     0.00  0.00 47.49 69099.72 541547    21
>>
>> === With this patch and powerpc-utils patch to do the above equation ===
>> %user  %sys %wait    %idle    physc %entc lbusy   app  vcsw phint
>> ----- ----- -----    -----    ----- ----- ----- ----- ----- -----
>> 47.48  0.01  0.00    52.51     5.73 47.75 47.49 31.21 541753    21
>> =====================================================================
>>
>> Note: physc, purr/idle purr being inaccurate is being handled in a
>> separate patch in powerpc-utils tree.
>>
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> Note:
>>
>> This patch needs to merged first in the kernel for the powerpc-utils
>> patches to work. powerpc-utils patches will be posted to its mailing
>> list and link would be found in the reply to this patch if available.
>>
>> arch/powerpc/platforms/pseries/lparcfg.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/arch/powerpc/platforms/pseries/lparcfg.c b/arch/powerpc/platforms/pseries/lparcfg.c
>> index f73c4d1c26af..8df4e7c529d7 100644
>> --- a/arch/powerpc/platforms/pseries/lparcfg.c
>> +++ b/arch/powerpc/platforms/pseries/lparcfg.c
>> @@ -184,6 +184,8 @@ static unsigned h_pic(unsigned long *pool_idle_time,
>>  	return rc;
>>  }
>>
>> +unsigned long boot_pool_idle_time;
> 
> Should be static, and u64. Better to use explicitly sized types for data
> at the kernel-hypervisor boundary.

Current usage of h_pic doesn't follow this either. Are you suggesting we change that 
as well? Or is this applicable to only boot_pool_idle_time?

For example in parse_ppp_data: 

        if (lppaca_shared_proc()) {
                unsigned long pool_idle_time, pool_procs;

		h_pic(&pool_idle_time, &pool_procs);
                seq_printf(m, "pool_idle_time=%ld\n", pool_idle_time);
                seq_printf(m, "pool_num_procs=%ld\n", pool_procs);

> 
>> +
>>  /*
>>   * parse_ppp_data
>>   * Parse out the data returned from h_get_ppp and h_pic
>> @@ -218,6 +220,7 @@ static void parse_ppp_data(struct seq_file *m)
>>  		h_pic(&pool_idle_time, &pool_procs);
>>  		seq_printf(m, "pool_idle_time=%ld\n", pool_idle_time);
>>  		seq_printf(m, "pool_num_procs=%ld\n", pool_procs);
>> +		seq_printf(m, "boot_pool_idle_time=%ld\n", boot_pool_idle_time);
> 
> If boot_pool_idle_time is unsigned then the format string should be %ul
> or similar, not %ld.
> 
>>  	}
>>
>>  	seq_printf(m, "unallocated_capacity_weight=%d\n",
>> @@ -792,6 +795,7 @@ static const struct proc_ops lparcfg_proc_ops = {
>>  static int __init lparcfg_init(void)
>>  {
>>  	umode_t mode = 0444;
>> +	unsigned long num_procs;
>>
>>  	/* Allow writing if we have FW_FEATURE_SPLPAR */
>>  	if (firmware_has_feature(FW_FEATURE_SPLPAR))
>> @@ -801,6 +805,9 @@ static int __init lparcfg_init(void)
>>  		printk(KERN_ERR "Failed to create powerpc/lparcfg\n");
>>  		return -EIO;
>>  	}
>> +
>> +	h_pic(&boot_pool_idle_time, &num_procs);
> 
> h_pic() can fail, leaving the out parameters uninitialized.

Naveen pointed to me this a while ago, but I forgot. 

Currently h_pic return value is not checked at all, either at boor or at runtime. 
When it fails, should we re-try or just print a kernel debug? What would be expected 
behavior? because if it fails, it would anyway result in wrong values of app even 
if the variables are initialized to 0.

> 
>> +
>>  	return 0;
>>  }
>>  machine_device_initcall(pseries, lparcfg_init);
>> --
>> 2.39.3
