Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 95CEE6625CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 13:44:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrDDF3pj2z3c8g
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 23:44:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dZPZVcs6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dZPZVcs6;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrDCC4Z5Sz2yjR
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 23:43:50 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 309BjZHq015694;
	Mon, 9 Jan 2023 12:42:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=ZqK82XmkHGwgkWLn/lWnXGPxUei35Telb/gYqSLTrk4=;
 b=dZPZVcs6TEwYHpfTUzmVSi+AF1YBNHXDjlu0WNdu/lg3dKUfd6/s6gutu5vtfx4ZG34M
 99t2qjrCpezRmmQbMXIo3+wPH1jDVRwH9EQAqFbsu5ZEJlG6K0KHwjJxms+oB8mUgZDv
 3ssK/PUYYU+sE6nuVvGMDIB7Xup4lERsnDKxWqc8m7TQI0MtVsfhSpC/Y7iDyHu1N1K4
 LIivXmkh60ZgGIatcyDD9lelHaM4+24KmvDvuPcxBvxHDKBQ9p5cb02aj/Q97JGuF6Aw
 uJUmBb5h3zK+5LJeZYksQPLmgaDWzj0s46nhbgIsvpjwDJgXmCNTMAep6/bU65MTawVX tQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp1vtku-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 12:42:59 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 309CgwLa021817;
	Mon, 9 Jan 2023 12:42:58 GMT
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3myjp1vtkc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 12:42:58 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3096Mtbl005179;
	Mon, 9 Jan 2023 12:42:56 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma02fra.de.ibm.com (PPS) with ESMTPS id 3my0c6a3ww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jan 2023 12:42:56 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 309CgrDe43319572
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 9 Jan 2023 12:42:54 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CD65A20040;
	Mon,  9 Jan 2023 12:42:53 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D10A20043;
	Mon,  9 Jan 2023 12:42:49 +0000 (GMT)
Received: from [9.43.61.69] (unknown [9.43.61.69])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  9 Jan 2023 12:42:48 +0000 (GMT)
Message-ID: <623307fe-a29a-c691-b07b-4d2168d4bdcc@linux.ibm.com>
Date: Mon, 9 Jan 2023 18:12:47 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH] objtool: continue if find_insn() fails in
 decode_instructions()
Content-Language: en-US
To: Ingo Molnar <mingo@kernel.org>
References: <20221208072813.25799-1-sv@linux.ibm.com>
 <Y7lHsw4diDgVc9ip@gmail.com>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <Y7lHsw4diDgVc9ip@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wmQoU2eWFv1dBIbh8zl15zE1TAQ2xJe2
X-Proofpoint-GUID: bQLdn5V0gIxNbzgLkcszT5YFmPO3bY7L
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-09_04,2023-01-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=881 impostorscore=0 bulkscore=0 clxscore=1011 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301090087
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
Cc: sfr@canb.auug.org.au, peterz@infradead.org, chenzhongjin@huawei.com, linux-kernel@vger.kernel.org, aik@ozlabs.ru, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, npiggin@gmail.com, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Ingo, Happy New Year!

On 07/01/23 15:51, Ingo Molnar wrote:
> * Sathvika Vasireddy <sv@linux.ibm.com> wrote:
>
>> Currently, decode_instructions() is failing if it is not able to find
>> instruction, and this is happening since commit dbcdbdfdf137b4
>> ("objtool: Rework instruction -> symbol mapping") because it is
>> expecting instruction for STT_NOTYPE symbols.
>>
>> Due to this, the following objtool warnings are seen:
>>   [1] arch/powerpc/kernel/optprobes_head.o: warning: objtool: optprobe_template_end(): can't find starting instruction
>>   [2] arch/powerpc/kernel/kvm_emul.o: warning: objtool: kvm_template_end(): can't find starting instruction
>>   [3] arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B(): can't find starting instruction
>>
>> The warnings are thrown because find_insn() is failing for symbols that
>> are at the end of the file, or at the end of the section. Given how
>> STT_NOTYPE symbols are currently handled in decode_instructions(),
>> continue if the instruction is not found, instead of throwing warning
>> and returning.
>>
>> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
> The SOB chain doesn't look valid: is Naveen N. Rao, the first SOB line, the
> author of the patch? If yes then a matching From: line is needed.
>
> Or if two people developed the patch, then Co-developed-by should be used:
>
>          Co-developed-by: First Co-Author <first@coauthor.example.org>
>          Signed-off-by: First Co-Author <first@coauthor.example.org>
>          Co-developed-by: Second Co-Author <second@coauthor.example.org>
>          Signed-off-by: Second Co-Author <second@coauthor.example.org>
>
> [ In this SOB sequence "Second Co-Author" is the one who submits the patch. ]
>
> [ Please only use Co-developed-by if actual lines of code were written by
>    the co-author that created copyrightable material - it's not a courtesy
>    tag. Reviewed-by/Acked-by/Tested-by can be used to credit non-code
>    contributions. ]
Thank you for the clarification, and for bringing these points to my 
attention. I'll keep these things in mind. In this case, since both 
Naveen N. Rao and I developed the patch, the below tags
are applicable.

         Co-developed-by: First Co-Author <first@coauthor.example.org>
         Signed-off-by: First Co-Author <first@coauthor.example.org>
         Co-developed-by: Second Co-Author <second@coauthor.example.org>
         Signed-off-by: Second Co-Author <second@coauthor.example.org>

However, I would be dropping this particular patch, since I think Nick's 
patch [1] is better to fix the objtool issue.

[1] - 
https://lore.kernel.org/linuxppc-dev/20221220101323.3119939-1-npiggin@gmail.com/ 



Thanks for reviewing!

- Sathvika

