Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E30772CC04
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Jun 2023 19:06:08 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WEIKac2z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qfykk1vXwz30XW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Jun 2023 03:06:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WEIKac2z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 6221 seconds by postgrey-1.37 at boromir; Tue, 13 Jun 2023 03:05:14 AEST
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qfyjk72Tjz304k
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Jun 2023 03:05:14 +1000 (AEST)
Received: from pps.filterd (m0353722.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35CF4cHR015057;
	Mon, 12 Jun 2023 15:21:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=+Vz0/00yi/aAA4sxflppHW+xZuDUOIaXptGoHipFi/M=;
 b=WEIKac2z3Mr9tKF3qmtb35CrtpCezGGlHYAbYzWShDvUQYpAonOA9QjKMVpNlgxnGP1V
 MP0e5zUr3B7Vr3Lzhz495IGyHpQnedwwm+4H+GaMG3FbMlnZlI/61UtLUBfY/3KY9Kuu
 7EaLN8XWyAF1LtBH/V6ZuYLf8zeKZsIMjouWCbRVw5NG6YGP8WYIdVyU17xoM8J0EhOc
 jxBomN9q78+jXKkSvgh5KBgPuwY7dGQcHT015Euum10UKMgnAudQv//bJt8ZZhFsfSFr
 LjtGBwWnpcoTqO48M8s7Yvlnq7e7aLHdoyWthoL6qwGn0vro1r1g8FM/JD9Ohc71ICMp vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r65pg8krh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 15:21:06 +0000
Received: from m0353722.ppops.net (m0353722.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35CF4oNq015921;
	Mon, 12 Jun 2023 15:21:06 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r65pg8kpx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 15:21:06 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35C4pEbH007408;
	Mon, 12 Jun 2023 15:20:06 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3r4gt4s4wv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Jun 2023 15:20:06 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35CFK25R15925896
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Jun 2023 15:20:02 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BD1E420040;
	Mon, 12 Jun 2023 15:20:02 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4A2A320043;
	Mon, 12 Jun 2023 15:20:02 +0000 (GMT)
Received: from [9.144.159.119] (unknown [9.144.159.119])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 Jun 2023 15:20:02 +0000 (GMT)
Message-ID: <c0fe7b2c-1ce7-3d2f-0175-e61920fc3dee@linux.ibm.com>
Date: Mon, 12 Jun 2023 17:20:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.11.2
Subject: Re: [PATCH 8/9] powerpc: Add HOTPLUG_SMT support
Content-Language: en-US
To: Thomas Gleixner <tglx@linutronix.de>,
        Michael Ellerman <mpe@ellerman.id.au>, linux-kernel@vger.kernel.org
References: <20230524155630.794584-1-mpe@ellerman.id.au>
 <20230524155630.794584-8-mpe@ellerman.id.au>
 <5752a488-be54-61a0-6d18-647456abc4ee@linux.ibm.com>
 <6e86aedb-9349-afd4-0bcb-1949e828f997@linux.ibm.com> <87h6rf81n9.ffs@tglx>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87h6rf81n9.ffs@tglx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: hNuPU4n_q1mIKvJz4Z9K75KsuJKmTl-u
X-Proofpoint-GUID: bEFsub-uM4oUopUHsNVENEqxZmw8Cda7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-12_06,2023-06-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 impostorscore=0 mlxscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306120129
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
Cc: linux-arch@vger.kernel.org, x86@kernel.org, dave.hansen@linux.intel.com, mingo@redhat.com, bp@alien8.de, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 10/06/2023 23:10:02, Thomas Gleixner wrote:
> On Thu, Jun 01 2023 at 18:19, Laurent Dufour wrote:
>> @@ -435,12 +435,17 @@ void __init cpu_smt_disable(bool force)
>>   * The decision whether SMT is supported can only be done after the full
>>   * CPU identification. Called from architecture code.
>>   */
>> -void __init cpu_smt_check_topology(unsigned int num_threads)
>> +void __init cpu_smt_check_topology(unsigned int num_threads,
>> +				   unsigned int max_threads)
>>  {
>>  	if (!topology_smt_supported())
>>  		cpu_smt_control = CPU_SMT_NOT_SUPPORTED;
>>  
>> -	cpu_smt_max_threads = num_threads;
>> +	cpu_smt_max_threads = max_threads;
>> +
>> +	WARN_ON(num_threads > max_threads);
>> +	if (num_threads > max_threads)
>> +		num_threads = max_threads;
> 
> This does not work. The call site does:
> 
>> +	cpu_smt_check_topology(smt_enabled_at_boot, threads_per_core);
> 
> smt_enabled_at_boot is 0 when 'smt-enabled=off', which is not what the
> hotplug core expects. If SMT is disabled it brings up the primary
> thread, which means cpu_smt_num_threads = 1.

Thanks, Thomas,
Definitively, a test against smt_enabled_at_boot==0 is required here.

> This needs more thoughts to avoid a completely inconsistent duct tape
> mess.

Despite the test against smt_enabled_at_boot, mentioned above, I can't see
anything else to rework. Am I missing something?

> 
> Btw, the command line parser and the variable smt_enabled_at_boot being
> type int allow negative number of threads too... Maybe not what you want.

I do agree, it should an unsigned type.

Thanks,
Laurent.

> Thanks,
> 
>         tglx
> 
> 
> 
> 

