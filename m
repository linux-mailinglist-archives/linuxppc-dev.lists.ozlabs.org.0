Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C4B5446F2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 11:10:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJdc44s1sz3bxr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 19:10:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gNIprqX3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gNIprqX3;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJdbK1WRMz30F8
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jun 2022 19:10:04 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2597pfj9031522;
	Thu, 9 Jun 2022 09:10:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=QcfiaI7b9FR5saunwYq2hQR9kmQi3rl0iCaR5EJTZIY=;
 b=gNIprqX3Udb7tqDIiZe5tVbsEECd6HwI++10iiQ34ecFtX1v/x9Nusc9NccXFUCesQUl
 rFfs0v0fpjmezcfE4Qdr2ibB92V1eOGyT0Ooe5mQHzprKkzmBzWI7t9d4AG49vh+TqUu
 DZHhAICIhnqoWhMGxYpSTMjcfNe+E+rTapsDm/IwdBhbPBc4+e9IM8vDhAHtYCVs1BIo
 Niu8e8GG+eJs5Zsxg2sqUjrVfqr/Lrb+SO5UNY/dnxIJfCCEXRTp6lRMny1I4GqfjoBR
 taUg6x7BDS2eG6CHRohXLIiMFWW1ZTagZmge8zi4x0P8chMjs0DilWEZvzSMHXZuBKUS 4A== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkcuj1gp7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 09:10:01 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2598AKIu010873;
	Thu, 9 Jun 2022 09:10:00 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gkcuj1gne-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 09:10:00 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25995Ijx027346;
	Thu, 9 Jun 2022 09:09:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma06fra.de.ibm.com with ESMTP id 3gfxnj59e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Jun 2022 09:09:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25999t4j44106022
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 9 Jun 2022 09:09:55 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F30B742045;
	Thu,  9 Jun 2022 09:09:54 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A4BFD4203F;
	Thu,  9 Jun 2022 09:09:54 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 Jun 2022 09:09:54 +0000 (GMT)
Message-ID: <acb1c167-1697-7b61-239e-02acc3de389f@linux.ibm.com>
Date: Thu, 9 Jun 2022 11:09:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 0/2] Disabling NMI watchdog during LPM's memory transfer
Content-Language: en-US
To: Michael Ellerman <michaele@au1.ibm.com>,
        Nathan Lynch <nathanl@linux.ibm.com>
References: <20220601155315.35109-1-ldufour@linux.ibm.com>
 <87a6av0wxk.fsf@linux.ibm.com>
 <666cedea-2dbc-254e-467b-c02a3a2d8795@linux.ibm.com>
 <874k0x1s1d.fsf@linux.ibm.com> <87zgimfff6.fsf@mpe.ellerman.id.au>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <87zgimfff6.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: DDWVDyTHRYJENG8M90jDd60V3BmgZfHa
X-Proofpoint-ORIG-GUID: 5ZSg0daUH6NDKuUxX6v82FtWndmTff45
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-09_08,2022-06-07_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 lowpriorityscore=0 phishscore=0 clxscore=1015 mlxscore=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 adultscore=0
 bulkscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206090036
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
Cc: linuxppc-dev@lists.ozlabs.org, haren@linux.vnet.ibm.com, paulus@samba.org, linux-kernel@vger.kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/06/2022, 09:45:49, Michael Ellerman wrote:
> Nathan Lynch <nathanl@linux.ibm.com> writes:
>> Laurent Dufour <ldufour@linux.ibm.com> writes:
> ...
>>
>>> There are  ongoing investigations to clarify where and how this latency is
>>> happening. I'm not excluding any other issue in the Linux kernel, but right
>>> now, this looks to be the best option to prevent system crash during
>>> LPM.
>>
>> It will prevent the likely crash mode for enterprise distros with
>> default watchdog tunables that our internal test environments happen to
>> use. But if someone were to run the same scenario with softlockup_panic
>> enabled, or with the RCU stall timeout lower than the watchdog
>> threshold, the failure mode would be different.
>>
>> Basically I'm saying:
>> * Some users may actually want the OS to panic when it's in this state,
>>   because their applications can't work correctly.
>> * But if we're going to inhibit one watchdog, we should inhibit them
>>   all.
> 
> I'm sympathetic to both of your arguments.
> 
> But I think there is a key difference between the NMI watchdog and other
> watchdogs, which is that the NMI watchdog will use the unsafe NMI to
> interrupt other CPUs, and that can cause the system to crash when other
> watchdogs would just print a backtrace.
> 
> We had the same problem with the rcu_sched stall detector until we
> changed it to use the "safe" NMI, see:
>   5cc05910f26e ("powerpc/64s: Wire up arch_trigger_cpumask_backtrace()")
> 
> 
> So even if the NMI watchdog is disabled there are still the other
> watchdogs enabled, which should print backtraces by default, and if
> desired can also be configured to cause a panic.
> 
> Instead of disabling the NMI watchdog, can we instead increase the
> timeout (by how much?) during LPM, so that it is less likely to fire in
> normal usage, but is still there as a backup if the system is completely
> clogged.

That's probably doable, tweaking wd_smp_panic_timeout_tb and
wd_panic_timeout_tb when the LPM is in progress.

I'll add a new sysctl value, so administrator will have the capability to
change that and also fully disable the NMI watchdog during LPM if he want.

I've no idea what should be the default factor, I guess this will be a bit
empiric.

I'll rework my patch in that way.

cheers,
Laurent.


