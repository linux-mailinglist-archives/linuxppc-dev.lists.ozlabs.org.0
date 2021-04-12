Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9035B9B1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 07:03:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FJc8N48qjz3bwh
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Apr 2021 15:03:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GyC6DEnY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=GyC6DEnY; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FJc7w5LdSz2xy1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Apr 2021 15:03:23 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13C4pgBs023338; Mon, 12 Apr 2021 01:03:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=vx5BS3wtTbZYmH7beCO7WkiqYZ0VUXjw7J+GPtJTCQM=;
 b=GyC6DEnYI5xVPp57ET+LPuJt3YLvyMA9Cj3nxrb+TbTsbQyZFrmcHRPsSU36HNCZZMfR
 CkKLoHpZJY278Z90tpVttZ9vsPWg/ggXtz4z1sorAXhqm+xKFzjqV6xggYiPINI6DXq0
 vKGCJGgcZiOr0d+ibh+Q81xLbSmlRi27JdM7XD0ATL43JfP9GhPtAYg8hPlyRpZl9D06
 SMezH63Rk2Nod0DxqcjguLQpQEIGHppGmrjqrbdeEGOyLaiBOu0ZuyTBZtZo7SBa8qkW
 Z2PyBSqok+nwZC8IeucZqKxSk9+3FYknj2BRffs6wa9I1auARJ1BE+cotFWjmz58Qm5p Yw== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37usfybkyv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 01:03:15 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13C4wPGJ001402;
 Mon, 12 Apr 2021 05:03:12 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma06ams.nl.ibm.com with ESMTP id 37u39hhg2b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 12 Apr 2021 05:03:12 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13C53A1g22348134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Apr 2021 05:03:10 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CD0511C050;
 Mon, 12 Apr 2021 05:03:10 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E3B011C04C;
 Mon, 12 Apr 2021 05:03:08 +0000 (GMT)
Received: from [9.199.37.145] (unknown [9.199.37.145])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 12 Apr 2021 05:03:08 +0000 (GMT)
Subject: Re: [PATCH v2 2/4] powerpc/selftests/perf-hwbreak: Coalesce event
 creation code
To: Daniel Axtens <dja@axtens.net>, mpe@ellerman.id.au
References: <20210407054938.312857-1-ravi.bangoria@linux.ibm.com>
 <20210407054938.312857-3-ravi.bangoria@linux.ibm.com>
 <87k0pbgc18.fsf@linkitivity.dja.id.au>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <398fe798-086f-cae9-9778-04e78ed58024@linux.ibm.com>
Date: Mon, 12 Apr 2021 10:33:07 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <87k0pbgc18.fsf@linkitivity.dja.id.au>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: InGgCRI4D7CRYuph49ECTnqxmyAc3rnP
X-Proofpoint-ORIG-GUID: InGgCRI4D7CRYuph49ECTnqxmyAc3rnP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-12_03:2021-04-09,
 2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104120028
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
Cc: linuxppc-dev@lists.ozlabs.org, mikey@neuling.org, shuah@kernel.org,
 linux-kselftest@vger.kernel.org, Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/9/21 12:49 PM, Daniel Axtens wrote:
> Hi Ravi,
> 
>> perf-hwbreak selftest opens hw-breakpoint event at multiple places for
>> which it has same code repeated. Coalesce that code into a function.
>>
>> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
>> ---
>>   .../selftests/powerpc/ptrace/perf-hwbreak.c   | 78 +++++++++----------
> 
> This doesn't simplify things very much for the code as it stands now,
> but I think your next patch adds a bunch of calls to these functions, so
> I agree that it makes sense to consolidate them now.

Right. This helps in next patch.

>>   1 file changed, 38 insertions(+), 40 deletions(-)
>>
>> diff --git a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
>> index c1f324afdbf3..bde475341c8a 100644
>> --- a/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
>> +++ b/tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c
>> @@ -34,28 +34,46 @@
>>   
>>   #define DAWR_LENGTH_MAX ((0x3f + 1) * 8)
>>   
>> -static inline int sys_perf_event_open(struct perf_event_attr *attr, pid_t pid,
>> -				      int cpu, int group_fd,
>> -				      unsigned long flags)
>> +static void perf_event_attr_set(struct perf_event_attr *attr,
>> +				__u32 type, __u64 addr, __u64 len,
>> +				bool exclude_user)
>>   {
>> -	attr->size = sizeof(*attr);
>> -	return syscall(__NR_perf_event_open, attr, pid, cpu, group_fd, flags);
>> +	memset(attr, 0, sizeof(struct perf_event_attr));
>> +	attr->type           = PERF_TYPE_BREAKPOINT;
>> +	attr->size           = sizeof(struct perf_event_attr);
>> +	attr->bp_type        = type;
>> +	attr->bp_addr        = addr;
>> +	attr->bp_len         = len;
>> +	attr->exclude_kernel = 1;
>> +	attr->exclude_hv     = 1;
>> +	attr->exclude_guest  = 1;
> 
> Only 1 of the calls to perf sets exclude_{kernel,hv,guest} - I assume
> there's no issue with setting them always but I wanted to check.

True. there is no issue in setting them as this test does all
load/stores in userspace. So all events will be recorded
irrespective of settings of exclude_{kernel,hv,guest}.

> 
>> +	attr->exclude_user   = exclude_user;
>> +	attr->disabled       = 1;
>>   }
>>   
>> -	/* setup counters */
>> -	memset(&attr, 0, sizeof(attr));
>> -	attr.disabled = 1;
>> -	attr.type = PERF_TYPE_BREAKPOINT;
>> -	attr.bp_type = readwriteflag;
>> -	attr.bp_addr = (__u64)ptr;
>> -	attr.bp_len = sizeof(int);
>> -	if (arraytest)
>> -		attr.bp_len = DAWR_LENGTH_MAX;
>> -	attr.exclude_user = exclude_user;
>> -	break_fd = sys_perf_event_open(&attr, 0, -1, -1, 0);
>> +	break_fd = perf_process_event_open_exclude_user(readwriteflag, (__u64)ptr,
>> +				arraytest ? DAWR_LENGTH_MAX : sizeof(int),
>> +				exclude_user);
> 
> checkpatch doesn't like this very much:
> 
> CHECK: Alignment should match open parenthesis
> #103: FILE: tools/testing/selftests/powerpc/ptrace/perf-hwbreak.c:115:
> +	break_fd = perf_process_event_open_exclude_user(readwriteflag, (__u64)ptr,
> +				arraytest ? DAWR_LENGTH_MAX : sizeof(int),

Sure will fix it.

> 
> Apart from that, this seems good but I haven't checked in super fine
> detail just yet :)

Thanks for the review.
-Ravi
