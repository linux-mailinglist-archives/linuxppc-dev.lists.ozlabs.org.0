Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28FFE82E7F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 03:37:30 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V5e87H5Z;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TDY7r0h45z3c9l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jan 2024 13:37:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=V5e87H5Z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TDY6z0KW4z2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jan 2024 13:36:42 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40G2WX1N024324;
	Tue, 16 Jan 2024 02:36:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=8IvyELGeV2sLBre+05KqOTYvHpwQ8T0u/lyKejMyHuU=;
 b=V5e87H5Zoa3HheabqQPOTcWm5X8qlx2ufFg3Yg7YkZgj2D8CtMVQvxUgst6pdHxtYWg0
 evpWYzXn7ARpABVpJF3khSkd0+lPoVWHQCvxmP8LUSQQspSYciwKQqbLUfYSeuepIK5H
 d9I6YA7DyMRHJ6gumIaGQru13ZRIAAft82Obgv7amEQrf2Jf8/mjuAUlKlQmIzE4pDAX
 9NNqPOm1lK1HBKA5X8maCdb84KYf1Ujx18k186FA9jSQn5H3Wu+fAJed+MnCtz6yufWc
 /BrXVC9vesctMC79CNJQFvzxTeg3/vad/fJZfKYbP1un9mJlDD5xo1yaAqGe2OZsXJLx Bg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnh3n02g7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 02:36:34 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40G2XCqO026797;
	Tue, 16 Jan 2024 02:36:33 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vnh3n02fu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 02:36:33 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40G0qGlU008632;
	Tue, 16 Jan 2024 02:36:32 GMT
Received: from smtprelay07.dal12v.mail.ibm.com ([172.16.1.9])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3vm6bkbv77-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jan 2024 02:36:32 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay07.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40G2aVgo52626156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 16 Jan 2024 02:36:31 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4B40F58058;
	Tue, 16 Jan 2024 02:36:31 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 10F4958059;
	Tue, 16 Jan 2024 02:36:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.67.30.46])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 16 Jan 2024 02:36:29 +0000 (GMT)
Subject: Re: [PATCH v5] powerpc/pseries/vas: Use usleep_range() to support
 HCALL delay
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20240111062510.1889752-1-haren@linux.ibm.com>
 <87v87zaihc.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
From: Haren Myneni <haren@linux.ibm.com>
Message-ID: <88b3cf3e-c207-cb46-f372-ff99fd172457@linux.ibm.com>
Date: Mon, 15 Jan 2024 18:36:29 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <87v87zaihc.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 05EKKaBIHh1Tm_XsOLFhkI7U9QEVk751
X-Proofpoint-GUID: Krd6cD6y-ENAN-p_ySC1SWRsfZPSS7BG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-15_17,2024-01-15_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401160019
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
Cc: aneesh.kumar@kernel.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/11/24 9:27 AM, Nathan Lynch wrote:
> Haren Myneni <haren@linux.ibm.com> writes:
>> VAS allocate, modify and deallocate HCALLs returns
>> H_LONG_BUSY_ORDER_1_MSEC or H_LONG_BUSY_ORDER_10_MSEC for busy
>> delay and expects OS to reissue HCALL after that delay. But using
>> msleep() will often sleep at least 20 msecs even though the
>> hypervisor suggests OS reissue these HCALLs after 1 or 10msecs.
>>
>> The open and close VAS window functions hold mutex and then issue
>> these HCALLs. So these operations can take longer than the
>> necessary when multiple threads issue open or close window APIs
>> simultaneously, especially might affect the performance in the
>> case of repeat open/close APIs for each compression request.
>> On the large machine configuration which allows more simultaneous
>> open/close windows (Ex: 240 cores provides 4800 VAS credits), the
>> user can observe hung task traces in dmesg due to mutex contention
>> around open/close HCAlls.
> 
> Is this because the workload queues enough tasks on the mutex to trigger
> the hung task watchdog? With a threshold of 120 seconds, something on
> the order of ~6000 tasks each taking 20ms or more to traverse this
> critical section would cause the problem I think you're describing.
> 
> Presumably this change improves the situation, but the commit message
> isn't explicit. Have you measured the "throughput" of window open/close
> activity before and after? Anything that quantifies the improvement
> would be welcome.

Yes, tested on the large system which allows open/close 4800 windows at 
the same time (means 4800 tasks). Noticed sleep more than 20msecs for 
some tasks and getting hung traces for some tasks since the combined 
waiting timing is more then 120seconds. With this patch, the maximum 
sleep is 10msecs and did not see these traces on this system. I will add 
more description to the commit log.

Thanks
Haren



