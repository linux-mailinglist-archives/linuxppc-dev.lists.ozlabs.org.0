Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C35CC31308F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 12:19:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZ3T84c8ZzDr3b
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Feb 2021 22:19:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mCsdX0ke; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZ3Dd3zwwzDqyZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Feb 2021 22:08:49 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 118B3LNi020182; Mon, 8 Feb 2021 06:08:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Pf4Nncc5cy+V9GvCC/7u1rgSrdvHFOJqwbI+wh3lMCY=;
 b=mCsdX0keBOlm5lleP3PP2akoZobH6TxQmza2ucGEzmzYMKUEQExiH8PBIwblBF3od1GZ
 2jOnenLx4MYsYvaGm8Rvm1ko5ikdGOjoGVFunbo0TrTH087zEZniscSwWzA2rDKtDWWc
 ucrySLQU+O0nI+CFaB0beGT5McNRydUwx3NvmVJC4btkGJ1ODPs7GM7slps/wTzAmMvG
 N3OWdwT5EpeH6JlTV1OZWUFn1llFJt/29EPPZvXv4qAMEItxF6VwXawfDB3IA45F3ab6
 hE3mhmKkd2EMljTQhLVhTu9inxGXyCXBFKuv4XwH9uBozhgo1IjLjpjd60WLR2aQTBvg Iw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36k43a089u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 06:08:17 -0500
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 118B3gto021035;
 Mon, 8 Feb 2021 06:08:16 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36k43a087m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 06:08:16 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 118B378M030537;
 Mon, 8 Feb 2021 11:08:14 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 36j94wh6g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Feb 2021 11:08:14 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 118B82vp31654164
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Feb 2021 11:08:02 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B70C442041;
 Mon,  8 Feb 2021 11:08:11 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5340042047;
 Mon,  8 Feb 2021 11:08:09 +0000 (GMT)
Received: from [9.199.47.177] (unknown [9.199.47.177])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  8 Feb 2021 11:08:09 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/uprobes: Validation for prefixed instruction
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
References: <20210204104703.273429-1-ravi.bangoria@linux.ibm.com>
 <79b0bed7-8b98-d58d-dc47-644195bbc095@linux.ibm.com>
 <20210204131534.GL210@DESKTOP-TDPLP67.localdomain>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Message-ID: <abf9c2d3-e26a-e7ac-3e73-19c46c4e81c8@linux.ibm.com>
Date: Mon, 8 Feb 2021 16:38:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210204131534.GL210@DESKTOP-TDPLP67.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-08_03:2021-02-08,
 2021-02-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 priorityscore=1501
 adultscore=0 clxscore=1011 suspectscore=0 spamscore=0 mlxscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102080074
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, oleg@redhat.com,
 rostedt@goodmis.org, linux-kernel@vger.kernel.org, paulus@samba.org,
 sandipan@linux.ibm.com, jniethe5@gmail.com, naveen.n.rao@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/4/21 6:45 PM, Naveen N. Rao wrote:
> On 2021/02/04 04:19PM, Ravi Bangoria wrote:
>>
>>
>> On 2/4/21 4:17 PM, Ravi Bangoria wrote:
>>> Don't allow Uprobe on 2nd word of a prefixed instruction. As per
>>> ISA 3.1, prefixed instruction should not cross 64-byte boundary.
>>> So don't allow Uprobe on such prefixed instruction as well.
>>>
>>> There are two ways probed instruction is changed in mapped pages.
>>> First, when Uprobe is activated, it searches for all the relevant
>>> pages and replace instruction in them. In this case, if we notice
>>> that probe is on the 2nd word of prefixed instruction, error out
>>> directly. Second, when Uprobe is already active and user maps a
>>> relevant page via mmap(), instruction is replaced via mmap() code
>>> path. But because Uprobe is invalid, entire mmap() operation can
>>> not be stopped. In this case just print an error and continue.
>>
>> @mpe,
>>
>> arch_uprobe_analyze_insn() can return early if
>> cpu_has_feature(CPU_FTR_ARCH_31) is not set. But that will
>> miss out a rare scenario of user running binary with prefixed
>> instruction on p10 predecessors. Please let me know if I
>> should add cpu_has_feature(CPU_FTR_ARCH_31) or not.
> 
> The check you are adding is very specific to prefixed instructions, so
> it makes sense to add a cpu feature check for v3.1.
> 
> On older processors, those are invalid instructions like any other. The
> instruction emulation infrastructure will refuse to emulate it and the
> instruction will be single stepped.

Sure will add it.

Ravi
