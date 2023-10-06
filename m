Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 742EE7BBDE3
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 19:39:09 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzyQijSs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2FzH2Vcxz3fQR
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 04:39:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EzyQijSs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2FyN6Dw9z2yVZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 04:38:20 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396Hbjgi009815;
	Fri, 6 Oct 2023 17:38:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=uxxHa3gtcS8tX++vMQQNXrvraUKYgQw08AzzGzo6DoU=;
 b=EzyQijSsWwM2RwrO1Cjg+R1WbP327n1P8/hE4eBvKeKQX/ShFJm2zjdKiTbZABD3NPOQ
 1bORqzfrANZymKCZClixanv2fItohNiLPWK+1BEGfwAm7BKNfKOKQHjMrKV68kcn3AaN
 AStlbBij1MnFtxbldJxZrlEFyYD3dQKK3G7h5SvVsGi3amO4pxD+OHH9D0Kk/uP8+Hdi
 OHhVBKnUV0DCI3qhfPTRQUx+qDx2qZifm4OdrZ9JboNy8AvgqKbsoZDKtLpyu92+DmqZ
 C2o+SMiJ0zxWevMMAtRCxoRLaDyZHXYGEYDAxCgPCiIKq0SyZYqfWIG28CqpE4z1UMhZ bA== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjpt0g0p0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:38:11 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396HXux4006692;
	Fri, 6 Oct 2023 17:38:10 GMT
Received: from smtprelay02.dal12v.mail.ibm.com ([172.16.1.4])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tf07mj7xt-31
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 17:38:10 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396GGJAL18154212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 16:16:19 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C4D558057;
	Fri,  6 Oct 2023 16:16:19 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3267058062;
	Fri,  6 Oct 2023 16:16:19 +0000 (GMT)
Received: from [9.61.60.170] (unknown [9.61.60.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 16:16:19 +0000 (GMT)
Message-ID: <e801c312-1a07-01f8-66ec-1aedd8052f26@linux.ibm.com>
Date: Fri, 6 Oct 2023 11:16:19 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: KUEP broken on FSP2?
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <11fda331-f3b8-57e2-1073-b6b2b40deea5@csgroup.eu>
 <e2e0caaa-571c-f131-1697-00b218c6febe@linux.ibm.com>
 <ea34f1f6-7b40-06e7-5b76-1ae08440375a@csgroup.eu>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <ea34f1f6-7b40-06e7-5b76-1ae08440375a@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _Hs0Iw0Xm5eZrSXK_4UVkuJ6dOACZLE4
X-Proofpoint-ORIG-GUID: _Hs0Iw0Xm5eZrSXK_4UVkuJ6dOACZLE4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_13,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2309180000
 definitions=main-2310060132
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
Cc: "paulus@samba.org" <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 10/6/23 10:55, Christophe Leroy wrote:
> Hi,
>
> Le 06/10/2023 à 17:43, Eddie James a écrit :
>> On 10/6/23 00:21, Christophe Leroy wrote:
>>> Hi,
>>>
>>> Le 05/10/2023 à 21:06, Eddie James a écrit :
>>>> Hi,
>>>>
>>>> I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes
>>>> attempting to get into userspace. The init script works, but the first
>>>> binary (mount) I run results in oops. Can anyone help me to debug this
>>>> further or suggest anything?
>>> I can't see anything in your dump suggesting that KUEP is broken, can
>>> you ?
>>>
>>> What I see is that kernel tries to execute user memory, which is wrong.
>>> And KUEP perfectly works by blocking that access. There is no call
>>> trace, suggesting that the kernel has jumped in the weed.
>>
>> Right, the function works as intended, but the fact remains that I can't
>> call anything in userspace (except init) without the kernel trying to
>> execute that memory. I saw KUEP in the commit history and it seemed
>> relevant, but I could certainly be mistaken. Can anyone think of
>> anything else that might cause this? Or how I can debug further?
>>
>>
>> I went ahead and removed the couple of lines of assembly that enabled
>> KUEP on 44x and tried again. Now I get a crash in load_elf_binary. NIP
>> is the kfree(elf_phdata) and LR is garbage, so not entirely sure where
>> it actually crashed...
> Which confirms that KUEP is not the culprit.


Right.


>
> By the way when booting a bamboo defconfig on QEMU I have to problem.


Yes FSP2 is a bit "special"...


>
> Apparently KUEP for 4xx appears in Kernel 5.14.
>
> Do you know of a kernel version that works ?
>
> Can you check 5.14 (you have to explicitely select KUEP in that version,
> it is not forced yet) ?
>
> Once you have a good version, then what about a bisect ?


Yea 5.10 works. I'll try 5.14. I was hoping to avoid a bisect as my 
build and test process for this platform is quite time consuming.


Thanks,

Eddie


>
> Christophe
>
>>
>> Thanks,
>>
>> Eddie
>>
>>
>>> Christophe
>>>
>>>> Thanks,
>>>>
>>>> Eddie
>>>>
>>>>
>>>> [    1.042743] kernel tried to execute user page (b7ee2000) - exploit
>>>> attempt? (
>>>> uid: 0)
>>>> [    1.042846] BUG: Unable to handle kernel instruction fetch
>>>> [    1.042919] Faulting instruction address: 0xb7ee2000
>>>> [    1.042986] Oops: Kernel access of bad area, sig: 11 [#1]
>>>> [    1.043059] BE PAGE_SIZE=4K FSP-2
>>>> [    1.043106] Modules linked in:
>>>> [    1.043149] CPU: 0 PID: 61 Comm: mount Not tainted
>>>> 6.1.55-d23900f.ppcnf-fsp2
>>>> #1
>>>> [    1.043249] Hardware name: ibm,fsp2 476fpe 0x7ff520c0 FSP-2
>>>> [    1.043323] NIP:  b7ee2000 LR: 8c008000 CTR: 00000000
>>>> [    1.043392] REGS: bffebd83 TRAP: 0400   Not tainted
>>>> (6.1.55-d23900f.ppcnf-fs
>>>> p2)
>>>> [    1.043491] MSR:  00000030 <IR,DR>  CR: 00001000  XER: 20000000
>>>> [    1.043579]
>>>> [    1.043579] GPR00: c00110ac bffebe63 bffebe7e bffebe88 8c008000
>>>> 00001000 0000
>>>> 0d12 b7ee2000
>>>> [    1.043579] GPR08: 00000033 00000000 00000000 c139df10 48224824
>>>> 1016c314 1016
>>>> 0000 00000000
>>>> [    1.043579] GPR16: 10160000 10160000 00000008 00000000 10160000
>>>> 00000000 1016
>>>> 0000 1017f5b0
>>>> [    1.043579] GPR24: 1017fa50 1017f4f0 1017fa50 1017f740 1017f630
>>>> 00000000 0000
>>>> 0000 1017f4f0
>>>> [    1.044101] NIP [b7ee2000] 0xb7ee2000
>>>> [    1.044153] LR [8c008000] 0x8c008000
>>>> [    1.044204] Call Trace:
>>>> [    1.044238] Instruction dump:
>>>> [    1.044279] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>>>> XXXXXXXX XX
>>>> XXXXXX
>>>> [    1.044392] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>>>> XXXXXXXX XX
>>>> XXXXXX
>>>> [    1.044506] ---[ end trace 0000000000000000 ]---
>>>> [    1.044568]
>>>> [    1.044590] note: mount[61] exited with irqs disabled
>>>>
