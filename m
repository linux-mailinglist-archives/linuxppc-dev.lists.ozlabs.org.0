Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AF357532871
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 13:01:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6rps4JHxz3dvT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 21:01:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=WVSD8S7R;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sv@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=WVSD8S7R; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6rpB2nD1z2xKm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 21:00:33 +1000 (AEST)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24OAMfUe011417;
 Tue, 24 May 2022 11:00:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=l1ypN9taGE14tYRN2P3CTjdOnlwFHQ8jvCb3saYBbPs=;
 b=WVSD8S7RmEZshz/nsv0J3ZQVrszo6I2bJsnTLhBO78bIAjR+kix0mfSRBOt3BGlMX+L5
 /TH0rs6HuH2C3nH6qSXOxhIhS1qghtiU3pv6J8qd/uEdHpfwwkPEtE2oBvqNL8RzqXID
 GL4bKoiNsGKsEkTykD//yIpKcRq92Of5IngAw/brFpluhP9OblKKktb0EaPf4PzECmDX
 K2FivHEPDhascGx3FugISEvnaFX7WT1cM0tk1hLAh9b7zp1Hj8OdfM1v1FLzXmlCcIqp
 pvmXqj2tcSfO3dFZpQ7z2/FstmStqrm9TyoS7ja0ojVzRvdt+kVZ+rd9rNBbdHUQil+6 mQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8wjbrnku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:00:22 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24OArLlr003404;
 Tue, 24 May 2022 11:00:21 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8wjbrnjr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:00:21 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24OAwDDX014510;
 Tue, 24 May 2022 11:00:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3g6qbjcahv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 24 May 2022 11:00:19 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24OB0Haw48759118
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 24 May 2022 11:00:17 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1979C4204B;
 Tue, 24 May 2022 11:00:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC10042042;
 Tue, 24 May 2022 11:00:14 +0000 (GMT)
Received: from [9.109.198.201] (unknown [9.109.198.201])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 24 May 2022 11:00:14 +0000 (GMT)
Message-ID: <59170f18-1356-1140-70e3-30cb627f00bc@linux.vnet.ibm.com>
Date: Tue, 24 May 2022 16:30:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 4/4] objtool/powerpc: Add --mcount specific
 implementation
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>
References: <20220523175548.922671-1-sv@linux.ibm.com>
 <20220523175548.922671-5-sv@linux.ibm.com>
 <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
From: Sathvika Vasireddy <sv@linux.vnet.ibm.com>
In-Reply-To: <6be5c941-07b0-64d5-7f36-fe5770fb5244@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: pYfqGtsuBBWosW0OwsrrNaUoak1WyouL
X-Proofpoint-GUID: VNLL2SE_JACZnBwHMb2QGiKHjV3pcto3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-24_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 impostorscore=0 phishscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205240053
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
Cc: "peterz@infradead.org" <peterz@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>, "aik@ozlabs.ru" <aik@ozlabs.ru>,
 Sathvika Vasireddy <sv@linux.ibm.com>,
 "jpoimboe@redhat.com" <jpoimboe@redhat.com>,
 "naveen.n.rao@linux.vnet.ibm.com" <naveen.n.rao@linux.vnet.ibm.com>,
 "mbenes@suse.cz" <mbenes@suse.cz>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 24/05/22 15:05, Christophe Leroy wrote:
>
> Le 23/05/2022 à 19:55, Sathvika Vasireddy a écrit :
>> This patch enables objtool --mcount on powerpc, and
>> adds implementation specific to powerpc.
>>
>> Signed-off-by: Sathvika Vasireddy <sv@linux.ibm.com>
>> ---
>>    arch/powerpc/Kconfig                |  1 +
>>    tools/objtool/arch/powerpc/decode.c | 14 ++++++++++++++
>>    tools/objtool/check.c               | 12 +++++++-----
>>    tools/objtool/elf.c                 | 13 +++++++++++++
>>    tools/objtool/include/objtool/elf.h |  1 +
>>    5 files changed, 36 insertions(+), 5 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 732a3f91ee5e..3373d44a1298 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -233,6 +233,7 @@ config PPC
>>    	select HAVE_NMI				if PERF_EVENTS || (PPC64 && PPC_BOOK3S)
>>    	select HAVE_OPTPROBES
>>    	select HAVE_OBJTOOL			if PPC64
>> +	select HAVE_OBJTOOL_MCOUNT		if HAVE_OBJTOOL
>>    	select HAVE_PERF_EVENTS
>>    	select HAVE_PERF_EVENTS_NMI		if PPC64
>>    	select HAVE_PERF_REGS
>> diff --git a/tools/objtool/arch/powerpc/decode.c b/tools/objtool/arch/powerpc/decode.c
>> index e3b77a6ce357..ad3d79fffac2 100644
>> --- a/tools/objtool/arch/powerpc/decode.c
>> +++ b/tools/objtool/arch/powerpc/decode.c
>> @@ -40,12 +40,26 @@ int arch_decode_instruction(struct objtool_file *file, const struct section *sec
>>    			    struct list_head *ops_list)
>>    {
>>    	u32 insn;
>> +	unsigned int opcode;
>>    
>>    	*immediate = 0;
>>    	memcpy(&insn, sec->data->d_buf+offset, 4);
>>    	*len = 4;
>>    	*type = INSN_OTHER;
>>    
>> +	opcode = (insn >> 26);
> You dont need the brackets here.
>
>> +
>> +	switch (opcode) {
>> +	case 18: /* bl */
>> +		if ((insn & 3) == 1) {
>> +			*type = INSN_CALL;
>> +			*immediate = insn & 0x3fffffc;
>> +			if (*immediate & 0x2000000)
>> +				*immediate -= 0x4000000;
>> +		}
>> +		break;
>> +	}
>> +
>>    	return 0;
>>    }
>>    
>> diff --git a/tools/objtool/check.c b/tools/objtool/check.c
>> index 056302d58e23..fd8bad092f89 100644
>> --- a/tools/objtool/check.c
>> +++ b/tools/objtool/check.c
>> @@ -832,7 +832,7 @@ static int create_mcount_loc_sections(struct objtool_file *file)
>>    
>>    		if (elf_add_reloc_to_insn(file->elf, sec,
>>    					  idx * sizeof(unsigned long),
>> -					  R_X86_64_64,
>> +					  elf_reloc_type_long(file->elf),
>>    					  insn->sec, insn->offset))
>>    			return -1;
>>    
>> @@ -2183,7 +2183,7 @@ static int classify_symbols(struct objtool_file *file)
>>    			if (arch_is_retpoline(func))
>>    				func->retpoline_thunk = true;
>>    
>> -			if (!strcmp(func->name, "__fentry__"))
>> +			if ((!strcmp(func->name, "__fentry__")) || (!strcmp(func->name, "_mcount")))
>>    				func->fentry = true;
>>    
>>    			if (is_profiling_func(func->name))
>> @@ -2259,9 +2259,11 @@ static int decode_sections(struct objtool_file *file)
>>    	 * Must be before add_jump_destinations(), which depends on 'func'
>>    	 * being set for alternatives, to enable proper sibling call detection.
>>    	 */
>> -	ret = add_special_section_alts(file);
>> -	if (ret)
>> -		return ret;
>> +	if (opts.stackval || opts.orc || opts.uaccess || opts.noinstr) {
>> +		ret = add_special_section_alts(file);
>> +		if (ret)
>> +			return ret;
>> +	}
> I think this change should be a patch by itself, it's not related to
> powerpc.
Makes sense. I'll make this a separate patch in the next revision.
>
>>    
>>    	ret = add_jump_destinations(file);
>>    	if (ret)
>> diff --git a/tools/objtool/elf.c b/tools/objtool/elf.c
>> index c25e957c1e52..95763060d551 100644
>> --- a/tools/objtool/elf.c
>> +++ b/tools/objtool/elf.c
>> @@ -793,6 +793,19 @@ elf_create_section_symbol(struct elf *elf, struct section *sec)
>>    	return sym;
>>    }
>>    
>> +int elf_reloc_type_long(struct elf *elf)
> Not sure it's a good name, because for 32 bits we have to use 'int'.
Sure, I'll rename it to elf_reloc_type() or some such.
>
>> +{
>> +	switch (elf->ehdr.e_machine) {
>> +	case EM_X86_64:
>> +		return R_X86_64_64;
>> +	case EM_PPC64:
>> +		return R_PPC64_ADDR64;
>> +	default:
>> +		WARN("unknown machine...");
>> +		exit(-1);
>> +	}
>> +}
> Wouldn't it be better to make that function arch specific ?

This is so that we can support cross architecture builds.


Thanks for reviewing!

- Sathvika


