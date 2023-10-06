Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE39E7BBC00
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 17:44:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oyK+XX0G;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2CR45fqCz3ccV
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 02:44:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oyK+XX0G;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=eajames@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2CQ91jMvz3cF1
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 02:43:44 +1100 (AEDT)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 396FgNk5011396;
	Fri, 6 Oct 2023 15:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=SxMXIbwwiZ3MdBx5v/6y66yqxLDhX2gyWmG4VrCXFgE=;
 b=oyK+XX0GnE4qXslxVbxsXT/3ktV6s8ETHEneFdsmb44/4i6BFF8a+ajHdMwoTGpE9Pb9
 p3T6fav4ALKH1VRYYW/rW9YibpPsxva6zVEZJMRjiVd6xOfA+d9RHxnnqpzlCss1amuP
 8gXIBF29arNOhS/YEyaAH/hg1QLgNfTmAEb/2hpULHRNH1Pc4Huz4aEGHFm4hqyMnnLW
 vWrjZp++NZaaD3YL2cclmNN8fMBPs8Mq69mHE0n1GXuiDoG0fQ3LeaIzBfeFQX4tTQgk
 qK6vDvJ2YU7gm3KgTF8z26POu5MXetKkZ40nUEgfQi34cR0VsOWgPkJ51uyhPeVco+fP 9A== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tjn43g30a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 15:43:34 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 396Faa0f005869;
	Fri, 6 Oct 2023 15:43:33 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tex0u8758-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Oct 2023 15:43:33 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 396Fh36f65077568
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 6 Oct 2023 15:43:03 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 60A7358069;
	Fri,  6 Oct 2023 15:43:03 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3B66D5805D;
	Fri,  6 Oct 2023 15:43:03 +0000 (GMT)
Received: from [9.61.60.170] (unknown [9.61.60.170])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  6 Oct 2023 15:43:03 +0000 (GMT)
Message-ID: <e2e0caaa-571c-f131-1697-00b218c6febe@linux.ibm.com>
Date: Fri, 6 Oct 2023 10:43:03 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: KUEP broken on FSP2?
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <fdaadc46-7476-9237-e104-1d2168526e72@linux.ibm.com>
 <11fda331-f3b8-57e2-1073-b6b2b40deea5@csgroup.eu>
From: Eddie James <eajames@linux.ibm.com>
In-Reply-To: <11fda331-f3b8-57e2-1073-b6b2b40deea5@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 2R6B62prLzHMMH7W8-BmaiidoQS6YLmz
X-Proofpoint-ORIG-GUID: 2R6B62prLzHMMH7W8-BmaiidoQS6YLmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-06_12,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 mlxscore=0
 suspectscore=0 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310060117
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


On 10/6/23 00:21, Christophe Leroy wrote:
> Hi,
>
> Le 05/10/2023 à 21:06, Eddie James a écrit :
>> Hi,
>>
>> I'm attempting to run linux 6.1 on my FSP2, but my kernel crashes
>> attempting to get into userspace. The init script works, but the first
>> binary (mount) I run results in oops. Can anyone help me to debug this
>> further or suggest anything?
> I can't see anything in your dump suggesting that KUEP is broken, can you ?
>
> What I see is that kernel tries to execute user memory, which is wrong.
> And KUEP perfectly works by blocking that access. There is no call
> trace, suggesting that the kernel has jumped in the weed.


Right, the function works as intended, but the fact remains that I can't 
call anything in userspace (except init) without the kernel trying to 
execute that memory. I saw KUEP in the commit history and it seemed 
relevant, but I could certainly be mistaken. Can anyone think of 
anything else that might cause this? Or how I can debug further?


I went ahead and removed the couple of lines of assembly that enabled 
KUEP on 44x and tried again. Now I get a crash in load_elf_binary. NIP 
is the kfree(elf_phdata) and LR is garbage, so not entirely sure where 
it actually crashed...


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
>> [    1.042743] kernel tried to execute user page (b7ee2000) - exploit
>> attempt? (
>> uid: 0)
>> [    1.042846] BUG: Unable to handle kernel instruction fetch
>> [    1.042919] Faulting instruction address: 0xb7ee2000
>> [    1.042986] Oops: Kernel access of bad area, sig: 11 [#1]
>> [    1.043059] BE PAGE_SIZE=4K FSP-2
>> [    1.043106] Modules linked in:
>> [    1.043149] CPU: 0 PID: 61 Comm: mount Not tainted
>> 6.1.55-d23900f.ppcnf-fsp2
>> #1
>> [    1.043249] Hardware name: ibm,fsp2 476fpe 0x7ff520c0 FSP-2
>> [    1.043323] NIP:  b7ee2000 LR: 8c008000 CTR: 00000000
>> [    1.043392] REGS: bffebd83 TRAP: 0400   Not tainted
>> (6.1.55-d23900f.ppcnf-fs
>> p2)
>> [    1.043491] MSR:  00000030 <IR,DR>  CR: 00001000  XER: 20000000
>> [    1.043579]
>> [    1.043579] GPR00: c00110ac bffebe63 bffebe7e bffebe88 8c008000
>> 00001000 0000
>> 0d12 b7ee2000
>> [    1.043579] GPR08: 00000033 00000000 00000000 c139df10 48224824
>> 1016c314 1016
>> 0000 00000000
>> [    1.043579] GPR16: 10160000 10160000 00000008 00000000 10160000
>> 00000000 1016
>> 0000 1017f5b0
>> [    1.043579] GPR24: 1017fa50 1017f4f0 1017fa50 1017f740 1017f630
>> 00000000 0000
>> 0000 1017f4f0
>> [    1.044101] NIP [b7ee2000] 0xb7ee2000
>> [    1.044153] LR [8c008000] 0x8c008000
>> [    1.044204] Call Trace:
>> [    1.044238] Instruction dump:
>> [    1.044279] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>> XXXXXXXX XX
>> XXXXXX
>> [    1.044392] XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX XXXXXXXX
>> XXXXXXXX XX
>> XXXXXX
>> [    1.044506] ---[ end trace 0000000000000000 ]---
>> [    1.044568]
>> [    1.044590] note: mount[61] exited with irqs disabled
>>
