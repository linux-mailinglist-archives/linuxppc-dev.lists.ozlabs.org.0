Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 113075BFA4B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 11:11:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXXjL4qwQz3cB8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 19:11:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WHA3eQ7e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WHA3eQ7e;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXXhd0j91z2yJV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 19:11:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28L93DWO024358;
	Wed, 21 Sep 2022 09:10:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=37A0x5inEl9Rw9dZSKllyUWg7VbfWPMt2RxrL/mkaUg=;
 b=WHA3eQ7eTWURuOEW7UcIh8gue9h5u3W4oC7Qy6KJ2bsbS+rYjdvXlJVuH2enLdvtEOOV
 UQBt77BXtOPmquyPNUyrf0j+zJ21ktyS6Ou0bV5Dy092rsxHcYybmMcaYktLj/vSe/TO
 GpgD9LVVnAl8dgawPW1IJJufM5ralFXx6y+eVZR8tlaRGyWZkrMt6LRbcIoWOiGcXrU1
 rCa13BzO9Bm9kxQSWAH/H/vT/6LcbHEgMyJcYgSf1MsYFkpYJdaQrDj1/IZI/CObXKHA
 p0TGHpWV7VoQdOQWiqUcLqDzO7yOFW489lOIRgQ6ppeQAkGGT0UPeCRUSTbMalS2tjAt pQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqymwg649-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 09:10:53 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 28L95EtO031086;
	Wed, 21 Sep 2022 09:10:52 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jqymwg63p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 09:10:52 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28L976uL009170;
	Wed, 21 Sep 2022 09:10:50 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma06ams.nl.ibm.com with ESMTP id 3jn5gj507w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Sep 2022 09:10:50 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com [9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28L9Am6p50004284
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 21 Sep 2022 09:10:48 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 40F905204F;
	Wed, 21 Sep 2022 09:10:48 +0000 (GMT)
Received: from [9.109.198.186] (unknown [9.109.198.186])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id D23335204E;
	Wed, 21 Sep 2022 09:10:45 +0000 (GMT)
Message-ID: <d2a198a0-1962-093c-da7b-312cf7db1ee0@linux.vnet.ibm.com>
Date: Wed, 21 Sep 2022 14:40:44 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 00/16] objtool: Enable and implement --mcount option on
 powerpc
Content-Language: en-US
To: Josh Poimboeuf <jpoimboe@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>
References: <20220912082020.226755-1-sv@linux.ibm.com>
 <YyCQIMHXP9DdvCzo@hirez.programming.kicks-ass.net>
 <20220914001552.6nerqcbrqy7burda@treble>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <20220914001552.6nerqcbrqy7burda@treble>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ovNe1RC2yZlsjawaBLx26CPMMw9K4yYm
X-Proofpoint-ORIG-GUID: ZENcveH6O_41B_50-uUB79Fbw7Za7HaN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-21_04,2022-09-20_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1011 mlxlogscore=845
 suspectscore=0 adultscore=0 spamscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2209130000 definitions=main-2209210061
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
Cc: aik@ozlabs.ru, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, npiggin@gmail.com, mingo@redhat.com, Sathvika Vasireddy <sv@linux.ibm.com>, rostedt@goodmis.org, jpoimboe@redhat.com, naveen.n.rao@linux.vnet.ibm.com, mbenes@suse.cz, chenzhongjin@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Josh,

On 14/09/22 05:45, Josh Poimboeuf wrote:

> On Tue, Sep 13, 2022 at 04:13:52PM +0200, Peter Zijlstra wrote:
>> On Mon, Sep 12, 2022 at 01:50:04PM +0530, Sathvika Vasireddy wrote:
>>> Christophe Leroy (4):
>>>    objtool: Fix SEGFAULT
>>>    objtool: Use target file endianness instead of a compiled constant
>>>    objtool: Use target file class size instead of a compiled constant
>>> Sathvika Vasireddy (12):
>>>    objtool: Add --mnop as an option to --mcount
>>>    objtool: Read special sections with alts only when specific options are selected
>>>    objtool: Use macros to define arch specific reloc types
>>>    objtool: Add arch specific function arch_ftrace_match()
>>>    objtool/powerpc: Enable objtool to be built on ppc
>>>    objtool/powerpc: Add --mcount specific implementation
>>>   tools/objtool/arch/powerpc/Build              |   2 +
>>>   tools/objtool/arch/powerpc/decode.c           | 101 ++++++++++++++++++
>>>   .../arch/powerpc/include/arch/cfi_regs.h      |  11 ++
>>>   tools/objtool/arch/powerpc/include/arch/elf.h |  10 ++
>>>   .../arch/powerpc/include/arch/special.h       |  21 ++++
>>>   tools/objtool/arch/powerpc/special.c          |  19 ++++
>>>   tools/objtool/arch/x86/decode.c               |   5 +
>>>   tools/objtool/arch/x86/include/arch/elf.h     |   2 +
>>>   .../arch/x86/include/arch/endianness.h        |   9 --
>>>   tools/objtool/builtin-check.c                 |  14 +++
>>>   tools/objtool/check.c                         |  53 ++++-----
>>>   tools/objtool/elf.c                           |   8 +-
>>>   tools/objtool/include/objtool/arch.h          |   2 +
>>>   tools/objtool/include/objtool/builtin.h       |   1 +
>>>   tools/objtool/include/objtool/elf.h           |   8 ++
>>>   tools/objtool/include/objtool/endianness.h    |  32 +++---
>>>   tools/objtool/orc_dump.c                      |  11 +-
>>>   tools/objtool/orc_gen.c                       |   4 +-
>>>   tools/objtool/special.c                       |   3 +-
>> This seems to painlessly merge with the objtool changes I have in
>> queue.git/call-depth-tracking. After that all I need is the below little
>> patch to make it to build ppc44x_defconfig + CONFIG_DYNAMIC_FTRACE=y.
>>
>> So I think these patches can go through the powerpc tree if Michael
>> wants. Josh you okay with that, or should we do something complicated?
> I'm all for avoiding complicated, but let me try to give it a proper
> review first.

Did you get a chance to review this patch set?

- Sathvika

