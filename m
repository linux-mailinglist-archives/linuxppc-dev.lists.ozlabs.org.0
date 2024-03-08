Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28DA5875D3A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 05:42:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=It3wnWt9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TrYRj4Z9Rz3dXQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Mar 2024 15:42:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=It3wnWt9;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TrYQz6sgyz3cDR
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 15:41:31 +1100 (AEDT)
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4TrYQx71drz4wcT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Mar 2024 15:41:29 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4TrYQx6mzBz4wcF; Fri,  8 Mar 2024 15:41:29 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=It3wnWt9;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4TrYQx0SVmz4wc9;
	Fri,  8 Mar 2024 15:41:28 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 4284S00Y031981;
	Fri, 8 Mar 2024 04:41:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=eRoucPmrGPePYExRxQZ5aaf8Unxq9GFMgnuKXJMAjko=;
 b=It3wnWt9qEGo1SmdHFxfGQexpmOlXSxSL4P0vEQgMExU7zK1AuQS0AYkS+I7jsMyxbc9
 cPWk6ARg4tPUZyJJ1fND9OXmZzukCjoq6th7y+lIc7GCA/4OVgo1TQLuX3IT5a1drkp8
 7RDqCfx9l+iqQKyL5ZhHKSgPWQTFyHqfnYp6yd859MiW4wNfu1N7SxlYnLd8et1911l7
 uNl2Ochto2pnVlX3jXCEE57hBBZ1a300YvHmk6Uaq6vLKvXsMnUudEj35s1dGoNgLyLu
 KaicMAwAPNXBJA7gjb2/I8cJAtKNdUovl2hzDhbMdZHHEpoerjdYRWRVazVPt/aUa+7M fg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqunp05kj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 04:41:24 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4284UUn0005184;
	Fri, 8 Mar 2024 04:41:23 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wqunp05jt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 04:41:23 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 4283IwO9024172;
	Fri, 8 Mar 2024 04:41:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3wpjwsnhhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Mar 2024 04:41:22 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 4284fGLQ41025888
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 8 Mar 2024 04:41:18 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AE3A62004D;
	Fri,  8 Mar 2024 04:41:16 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 53B2D20043;
	Fri,  8 Mar 2024 04:41:15 +0000 (GMT)
Received: from [9.43.12.26] (unknown [9.43.12.26])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  8 Mar 2024 04:41:15 +0000 (GMT)
Message-ID: <8d973907-8e86-4b9f-8995-cf3a8621f6b6@linux.ibm.com>
Date: Fri, 8 Mar 2024 10:11:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] powerpc: Avoid nmi_enter/nmi_exit in real mode
 interrupt.
Content-Language: en-US
To: Michael Ellerman <mpe@ellerman.id.au>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        linuxppc-dev <linuxppc-dev@ozlabs.org>
References: <20240214095146.1527369-1-mahesh@linux.ibm.com>
 <87edcmnu7o.fsf@mail.lhotse>
From: Aneesh Kumar K V <aneesh.kumar@linux.ibm.com>
In-Reply-To: <87edcmnu7o.fsf@mail.lhotse>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7V5rmXHxNdxeNGx3gI8C6JW4RW_U1B0n
X-Proofpoint-ORIG-GUID: p1Bz8Q60KWJGqHUd7jmTio-sOZY4h7hh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-08_02,2024-03-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=919
 bulkscore=0 impostorscore=0 suspectscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403080033
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/7/24 5:13 PM, Michael Ellerman wrote:
> Hi Mahesh,
> 
> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
>> nmi_enter()/nmi_exit() touches per cpu variables which can lead to kernel
>> crash when invoked during real mode interrupt handling (e.g. early HMI/MCE
>> interrupt handler) if percpu allocation comes from vmalloc area.
>>
>> Early HMI/MCE handlers are called through DEFINE_INTERRUPT_HANDLER_NMI()
>> wrapper which invokes nmi_enter/nmi_exit calls. We don't see any issue when
>> percpu allocation is from the embedded first chunk. However with
>> CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there are chances where percpu
>> allocation can come from the vmalloc area.
>>
>> With kernel command line "percpu_alloc=page" we can force percpu allocation
>> to come from vmalloc area and can see kernel crash in machine_check_early:
>>
>> [    1.215714] NIP [c000000000e49eb4] rcu_nmi_enter+0x24/0x110
>> [    1.215717] LR [c0000000000461a0] machine_check_early+0xf0/0x2c0
>> [    1.215719] --- interrupt: 200
>> [    1.215720] [c000000fffd73180] [0000000000000000] 0x0 (unreliable)
>> [    1.215722] [c000000fffd731b0] [0000000000000000] 0x0
>> [    1.215724] [c000000fffd73210] [c000000000008364] machine_check_early_common+0x134/0x1f8
>>
>> Fix this by avoiding use of nmi_enter()/nmi_exit() in real mode if percpu
>> first chunk is not embedded.
> 
> My system (powernv) doesn't even boot with percpu_alloc=page.
> 


Can you share the crash details? 


> AFAIK the only reason we added support for it was to handle 4K kernels
> with HPT. See commit eb553f16973a ("powerpc/64/mm: implement page
> mapping percpu first chunk allocator").
> 
> So I wonder if we should change the Kconfig to only offer it as an
> option in that case, and change the logic in setup_per_cpu_areas() to
> only use it as a last resort.
> 
> I guess we probably still need this commit though, even if just for 4K HPT.
> 
>
We have also observed some error when we have large gap between the start memory of
NUMA nodes. That made the percpu offset really large causing boot failures even on 64K.

-aneesh
