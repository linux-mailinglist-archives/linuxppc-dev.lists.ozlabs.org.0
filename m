Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7A87D09B9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 09:51:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6d45GUQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SBcHC4DYSz3dFL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Oct 2023 18:51:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=m6d45GUQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SBcGG0Krnz30MQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Oct 2023 18:51:01 +1100 (AEDT)
Received: from pps.filterd (m0353724.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39K7mRQ2004535;
	Fri, 20 Oct 2023 07:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=e8tVBaP4rUo7ARgSkxRhpBP3qGXpMtmE+c9ua0BGE5k=;
 b=m6d45GUQSj3wwcq5RTE5y542M8ElGzsLD3yfECmKbyyRaM2Lm8TJmzZnwfMlFoiim08t
 6pEc1JCbalz/7lwIbEW8//pxVSPTAIYpYbxX9wWPTOct4G15izznfADi9CHwnj+Muj16
 UF6Bkf/TzQrbtLwvJz5qPDuo3sUULtygY+jejsT2FPIGuEXNPTuneudyknDOioDvejsi
 RIMWbrUjWqzbw9nLE2hY42xEVtuIgvam5yXj614VXThkBqGRFss5enLunsMBLwPUnrrU
 xnuDas77Ju7t/A7I1x5Nqs5dJZMTu8W9NP0J3GWAl2krd/vo4EwFJ0x96cuZF3o4huyb uw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tunc60af6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 07:50:53 +0000
Received: from m0353724.ppops.net (m0353724.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39K7maXG005424;
	Fri, 20 Oct 2023 07:50:53 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tunc60aet-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 07:50:53 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 39K66CVv002735;
	Fri, 20 Oct 2023 07:50:52 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tuc44b52h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Oct 2023 07:50:52 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 39K7olbp24445582
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 20 Oct 2023 07:50:47 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2C31C2004B;
	Fri, 20 Oct 2023 07:50:47 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 204E32004E;
	Fri, 20 Oct 2023 07:50:45 +0000 (GMT)
Received: from [9.203.106.137] (unknown [9.203.106.137])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 20 Oct 2023 07:50:44 +0000 (GMT)
Message-ID: <71e968e2-4d9e-bf65-d00c-bb9feac7e4ed@linux.ibm.com>
Date: Fri, 20 Oct 2023 13:20:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
Content-Language: en-US
To: Pingfan Liu <piliu@redhat.com>
References: <20231017022806.4523-1-piliu@redhat.com>
 <20231017022806.4523-3-piliu@redhat.com>
 <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com>
 <CAF+s44S33-x=bjZsLc=Ke+J6UFPq6DMxPA1Vaohc6_qLoEw9iw@mail.gmail.com>
From: Hari Bathini <hbathini@linux.ibm.com>
In-Reply-To: <CAF+s44S33-x=bjZsLc=Ke+J6UFPq6DMxPA1Vaohc6_qLoEw9iw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MKp8snkWj-7H8mMgUeZZVuUcfW4VHAKw
X-Proofpoint-GUID: cQHzV8DwMACxKlFUf1E5Vj1PWnWuFnjQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-20_06,2023-10-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310170001 definitions=main-2310200065
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/10/23 1:51 pm, Pingfan Liu wrote:
> On Tue, Oct 17, 2023 at 6:39 PM Hari Bathini <hbathini@linux.ibm.com> wrote:
>>
>>
>>
>> On 17/10/23 7:58 am, Pingfan Liu wrote:
>>> *** Idea ***
>>> For kexec -p, the boot cpu can be not the cpu0, this causes the problem
>>> of allocating memory for paca_ptrs[]. However, in theory, there is no
>>> requirement to assign cpu's logical id as its present sequence in the
>>> device tree. But there is something like cpu_first_thread_sibling(),
>>> which makes assumption on the mapping inside a core. Hence partially
>>> loosening the mapping, i.e. unbind the mapping of core while keep the
>>> mapping inside a core.
>>>
>>> *** Implement ***
>>> At this early stage, there are plenty of memory to utilize. Hence, this
>>> patch allocates interim memory to link the cpu info on a list, then
>>> reorder cpus by changing the list head. As a result, there is a rotate
>>> shift between the sequence number in dt and the cpu logical number.
>>>
>>> *** Result ***
>>> After this patch, a boot-cpu's logical id will always be mapped into the
>>> range [0,threads_per_core).
>>>
>>> Besides this, at this phase, all threads in the boot core are forced to
>>> be onlined. This restriction will be lifted in a later patch with
>>> extra effort.
>>>
>>> Signed-off-by: Pingfan Liu <piliu@redhat.com>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Nicholas Piggin <npiggin@gmail.com>
>>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>>> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
>>> Cc: Wen Xiong <wenxiong@us.ibm.com>
>>> Cc: Baoquan He <bhe@redhat.com>
>>> Cc: Ming Lei <ming.lei@redhat.com>
>>> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
>>> Cc: Hari Bathini <hbathini@linux.ibm.com>
>>> Cc: kexec@lists.infradead.org
>>> To: linuxppc-dev@lists.ozlabs.org
>>
>> Thanks for working on this, Pingfan.
>> Looks good to me.
>>
>> Acked-by: Hari Bathini <hbathini@linux.ibm.com>
>>
> 
> Thank you for kindly reviewing. I hope that after all these years, we
> have accomplished the objective.
> 

I hope so too.
Thanks!
