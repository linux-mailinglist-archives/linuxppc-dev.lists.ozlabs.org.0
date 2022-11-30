Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AF363D501
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 12:52:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NMcyV49DKz3bdl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Nov 2022 22:52:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RSIcjdm2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RSIcjdm2;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NMcxW1zrrz30Bp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Nov 2022 22:51:42 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AUA0gS0019088;
	Wed, 30 Nov 2022 11:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=oIHKq/myA7HLr2985sZUEcGP0oT5nkkNhnQnMwS55Ac=;
 b=RSIcjdm2zOSFHW+pCV0v/W0DFmpQynIcT/52Y1kGidbdEGCKhhZtWcl8WLyoNNdkVafC
 D3TU9F7SL1EO5wIMypbKwFSTU+V0D5C0PYDf0lfaYD41W3K16NFa3mJxr8WYZsAqrUWZ
 NewyGqpjkVnMCb5RZbbz7IdBZvRQ4m2CtfaYvD9EV41BnFQxxTsGE6yK2H+8TSh/tYXz
 ZYogZMdp8iLy5tsrr6dwugauaOoG687WFJB3pZsvje8FpQ27YkKD9D+xQOPL8Ykoxh3k
 bPFNAIwPpLFh1VK/nhGEq3xnIB1c9Hjcu3Gyva7t22kUj8M1kRm5xwbR+6mx+9lCUhOk Zw== 
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com [149.81.74.106])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3m60wdggp9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 11:51:14 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
	by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AUBbWXn025176;
	Wed, 30 Nov 2022 11:51:13 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma04fra.de.ibm.com with ESMTP id 3m3ae944h9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 30 Nov 2022 11:51:12 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AUBpr034522564
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 30 Nov 2022 11:51:53 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B7FA34203F;
	Wed, 30 Nov 2022 11:51:10 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4ECD42041;
	Wed, 30 Nov 2022 11:51:08 +0000 (GMT)
Received: from [9.109.198.140] (unknown [9.109.198.140])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Wed, 30 Nov 2022 11:51:08 +0000 (GMT)
Message-ID: <74552090-c654-5356-773d-47ead2d63ab2@linux.ibm.com>
Date: Wed, 30 Nov 2022 17:21:06 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: linux-next: build warnings after merge of the powerpc-objtool
 tree
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Michael Ellerman <mpe@ellerman.id.au>,
        PowerPC <linuxppc-dev@lists.ozlabs.org>,
        "peterz@infradead.org" <peterz@infradead.org>
References: <20221125143012.6426c2b9@canb.auug.org.au>
 <6cdad32e-782d-5bb5-f7e9-a44fb0b6444d@linux.ibm.com>
 <c0ed0d60-6014-4c5f-e610-b4d3bd9e9e33@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.ibm.com>
In-Reply-To: <c0ed0d60-6014-4c5f-e610-b4d3bd9e9e33@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sq6LEsvmOJe7ooOxwtgqhSbDP5-tpx_V
X-Proofpoint-ORIG-GUID: sq6LEsvmOJe7ooOxwtgqhSbDP5-tpx_V
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-30_04,2022-11-30_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211300083
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
Cc: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>, Linux Next Mailing List <linux-next@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 29/11/22 20:58, Christophe Leroy wrote:
>
> Le 29/11/2022 à 16:13, Sathvika Vasireddy a écrit :
>> Hi all,
>>
>> On 25/11/22 09:00, Stephen Rothwell wrote:
>>> Hi all,
>>>
>>> After merging the powerpc-objtool tree, today's linux-next build (powerpc
>>> pseries_le_defconfig) produced these warnings:
>>>
>>> arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B():
>>> can't find starting instruction
>>> arch/powerpc/kernel/optprobes_head.o: warning: objtool:
>>> optprobe_template_end(): can't find starting instruction
>>>
>>> I have no idea what started this (they may have been there yesterday).
>> I was able to recreate the above mentioned warnings with
>> pseries_le_defconfig and powernv_defconfig. The regression report also
>> mentions a warning
>> (https://lore.kernel.org/oe-kbuild-all/202211282102.QUr7HHrW-lkp@intel.com/) seen with arch/powerpc/kernel/kvm_emul.S assembly file.
>>
>>    [1] arch/powerpc/kernel/optprobes_head.o: warning: objtool:
>> optprobe_template_end(): can't find starting instruction
>>    [2] arch/powerpc/kernel/kvm_emul.o: warning: objtool:
>> kvm_template_end(): can't find starting instruction
>>    [3] arch/powerpc/kernel/head_64.o: warning: objtool: end_first_256B():
>> can't find starting instruction
>>
>> The warnings [1] and [2] go away after adding 'nop' instruction. Below
>> diff fixes it for me:
> You have to add NOPs just because those labels are at the end of the
> files. That's a bit odd.
> I think either we are missing some kind of flagging for the symbols, or
> objtool has a bug. In both cases, I'm not sure adding an artificial
> 'nop' is the solution. At least there should be a big hammer warning
> explaining why.

I don't see these warnings with powerpc/topic/objtool branch. However, 
they are seen with linux-next master branch.
Commit dbcdbdfdf137b49144204571f1a5e5dc01b8aaad objtool: Rework 
instruction -> symbol mapping in linux-next is resulting in objtool 
can't find starting instruction warnings on powerpc.

Reverting this particular hunk (pasted below), resolves it and we don't 
see the problem anymore.

@@ -427,7 +427,10 @@ static int decode_instructions(struct objtool_file 
*file)
                 }

                 list_for_each_entry(func, &sec->symbol_list, list) {
-                       if (func->type != STT_FUNC || func->alias != func)
+                       if (func->type != STT_NOTYPE && func->type != 
STT_FUNC)
+                               continue;
+
+                       if (func->return_thunk || func->alias != func)
                                 continue;

                         if (!find_insn(file, sec, func->offset)) {

Peterz, can we ignore STT_NOTYPE symbols?

>> diff --git a/arch/powerpc/kernel/optprobes_head.S
>> b/arch/powerpc/kernel/optprobes_head.S
>> index cd4e7bc32609..ea4e3bd82f4f 100644
>> --- a/arch/powerpc/kernel/optprobes_head.S
>> +++ b/arch/powerpc/kernel/optprobes_head.S
>> @@ -134,3 +134,4 @@ optprobe_template_ret:
>>
>>           .global optprobe_template_end
>>    optprobe_template_end:
>> +       nop
>>
>> diff --git a/arch/powerpc/kernel/kvm_emul.S
>> b/arch/powerpc/kernel/kvm_emul.S
>> index 7af6f8b50c5d..41fd664e3ba0 100644
>> --- a/arch/powerpc/kernel/kvm_emul.S
>> +++ b/arch/powerpc/kernel/kvm_emul.S
>> @@ -352,3 +352,4 @@ kvm_tmp_end:
>>
>>    .global kvm_template_end
>>    kvm_template_end:
>> +       nop
>>
>> For warning [3], objtool is throwing can't find starting instruction
>> warning because it finds that the symbol (end_first_256B) is zero sized,
>> and such symbols are not added to the rbtree. I tried to fix it by
>> adding a 'nop' instruction (pasted diff below), but that resulted in a
>> kernel build failure.
> What's the failure ?
>
>
>> diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
>> index 874efd25cc45..d48850fe159f 100644
>> --- a/arch/powerpc/kernel/head_64.S
>> +++ b/arch/powerpc/kernel/head_64.S
>> @@ -192,6 +192,7 @@ __secondary_hold:
>>           EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
>>    #endif
>>    CLOSE_FIXED_SECTION(first_256B)
>> +nop
>>
>>    /*
>>     * On server, we include the exception vectors code here as it
>>
>> diff --git a/arch/powerpc/kernel/exceptions-64s.S
>> b/arch/powerpc/kernel/exceptions-64s.S
>> index 26f8fef53c72..f7517d443e9b 100644
>> --- a/arch/powerpc/kernel/exceptions-64s.S
>> +++ b/arch/powerpc/kernel/exceptions-64s.S
>> @@ -3104,9 +3104,13 @@ __end_interrupts:
>>    DEFINE_FIXED_SYMBOL(__end_interrupts, virt_trampolines)
>>
>>    CLOSE_FIXED_SECTION(real_vectors);
>> +nop
>>    CLOSE_FIXED_SECTION(real_trampolines);
>> +nop
>>    CLOSE_FIXED_SECTION(virt_vectors);
>> +nop
>>    CLOSE_FIXED_SECTION(virt_trampolines);
>> +nop
> What are the NOPs after the CLOSE_FIXED_SECTION() ? You don't explain
> them, and I can't see any related warning in the warnings you show.
>
>
After fixing arch/powerpc/kernel/head_64.o: warning: objtool: 
end_first_256B(): can't find starting instruction warning, objtool 
started showing more warnings in the same file.
Below is the list of warnings:
  arch/powerpc/kernel/head_64.o: warning: objtool: end_real_vectors(): 
can't find starting instruction
  arch/powerpc/kernel/head_64.o: warning: objtool: 
end_real_trampolines(): can't find starting instruction
  arch/powerpc/kernel/head_64.o: warning: objtool: end_virt_vectors(): 
can't find starting instruction
  arch/powerpc/kernel/head_64.o: warning: objtool: 
end_virt_trampolines(): can't find starting instruction


Thanks,
Sathvika
