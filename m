Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B35D84A95AD
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 10:01:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqqJx3gxHz3bck
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 20:01:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=qU36Bvak;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=qU36Bvak; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JqqJF2fwJz2xtp
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 20:00:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2147VXt2006597
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 09:00:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=JjuRAVIfxvOSyyeVsgJStVLzhMJZT7Q9ePFiLoTGTeg=;
 b=qU36BvakRxrqSDwsSbau6AkYQvJXIkGT/NzK36CF/ovSUeGJLOPhAwHwE8GAi21yns05
 SaUaie7+N1KJUxKEKq79vGPBsfgLp9WMzokF2tfWRTs4SLq1Om3hEGnTzFcimOIILYe7
 OS8Xw9rl6i72F6FKFizlj3OLbqM2kMVgaanwDxe5I7/uQSRYCB9V809kltPBCG4II5iI
 ZrsKIw5zMszyryNvBfonKOUWBQU8Gzxui2BVqBLTIn2hSqsABzZ1SfO0U4jjvPFZ80gg
 HMDh0vpPmHEtsz0WDuDlKhV3g4rps0Eke2p9tjTn/fOoPnbmfuSgptn9JZwCiNEey5vW nw== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e0qx31ch8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Feb 2022 09:00:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2148r3ni016052
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 09:00:36 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3e0r0sjyds-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 04 Feb 2022 09:00:36 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21490Yed37683638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 4 Feb 2022 09:00:34 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3A1A34204C
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 09:00:34 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B592242056
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 09:00:33 +0000 (GMT)
Received: from [9.43.124.60] (unknown [9.43.124.60])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 09:00:33 +0000 (GMT)
Message-ID: <76edae60-4704-5abf-0824-b0d3eeafa3ee@linux.ibm.com>
Date: Fri, 4 Feb 2022 14:30:27 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: powerpc: Set crashkernel offset to mid of RMA region
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20220128100445.251233-1-sourabhjain@linux.ibm.com>
 <d523c2d6-2a12-77aa-75a9-942cff5574bd@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <d523c2d6-2a12-77aa-75a9-942cff5574bd@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0RuL8e0x_DHX819tKr2Z12uBgFiANmvn
X-Proofpoint-GUID: 0RuL8e0x_DHX819tKr2Z12uBgFiANmvn
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-04_03,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 mlxlogscore=999 priorityscore=1501 malwarescore=0
 bulkscore=0 impostorscore=0 spamscore=0 phishscore=0 adultscore=0
 clxscore=1011 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202040044
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 01/02/22 16:40, Hari Bathini wrote:
>
>
> On 28/01/22 3:34 pm, Sourabh Jain wrote:
>> On large config LPARs (having 192 and more cores), Linux fails to boot
>> due to insufficient memory in the first memblock. It is due to the
>> memory reservation for the crash kernel which starts at 128MB offset of
>> the first memblock. This memory reservation for the crash kernel doesn't
>> leave enough space in the first memblock to accommodate other essential
>> system resources.
>>
>> The crash kernel start address was set to 128MB offset by default to
>> ensure that the crash kernel get some memory below the RMA region which
>> is used to be of size 256MB. But given that the RMA region size can be
>> 512MB or more, setting the crash kernel offset to mid of RMA size will
>> leave enough space for kernel to allocate memory for other system
>> resources.
>>
>> Since the above crash kernel offset change is only applicable to the 
>> LPAR
>> platform, the LPAR feature detection is pushed before the crash kernel
>> reservation. The rest of LPAR specific initialization will still
>> be done during pseries_probe_fw_features as usual.
>>
>> Signed-off-by: Sourabh Jain<sourabhjain@linux.ibm.com>
>> Reported-and-tested-by: Abdul haleem<abdhalee@linux.vnet.ibm.com>
>>
>> ---
>>   arch/powerpc/kernel/rtas.c |  4 ++++
>>   arch/powerpc/kexec/core.c  | 15 +++++++++++----
>>   2 files changed, 15 insertions(+), 4 deletions(-)
>>
>>   ---
>>   Change in v3:
>>     Dropped 1st and 2nd patch from v2. 1st and 2nd patch from v2 patch
>>     series [1] try to discover 1T segment MMU feature support
>>     BEFORE boot CPU paca allocation ([1] describes why it is needed).
>>     MPE has posted a patch [2] that archives a similar objective by 
>> moving
>>     boot CPU paca allocation after mmu_early_init_devtree().
>>
>
>> NOTE: This patch is dependent on the patch [2].
>>
>> [1]https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20211018084434.217772-3-sourabhjain@linux.ibm.com/ 
>>
>> [2]https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239175.html 
>>
>
> This dependency info must be captured somewhere within the changelog to
> be useful.

Added about the dependent patch in v4 patch commit message.
v4 patch link: 
https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/239642.html

Thanks for the review Hari.

- Sourabh Jain
