Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 706812FCF19
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 12:23:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DLNSf0mzWzDqxl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jan 2021 22:23:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i74W1JXj; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DLNMf0MyrzDqLs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jan 2021 22:19:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10KB2uQp158536; Wed, 20 Jan 2021 06:18:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : subject : to : cc
 : references : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=CyW5Qbxq9N1t1UZrJNM8DsMRdqMrHyEtG3AdPXB4sss=;
 b=i74W1JXjl1dCDAs3j5BlMMStrybUk7J32cgTEaK6DlgYCYNjcsxO5F8jLLX4Zq5LKAV2
 YMegeVwjqDHZazPFBmq1ryqq9OPonveGJ/kH4EvGcEGgNVFexYcMQJNJ0D0Q9z6XS9sD
 ++BN/IfcyRwIk1LaoJ4v3NW4TAOSEoPWS0M0leVmqYEZMwXLp6HA8S9e1DPjLKY2rqQ4
 81fNRV+3wVCoy0XjVpHRQjFVDDMz6UJ0qwADgc3xYag8t36BF7vbnP6YSrZnuyIJUozZ
 fDthUMKC5WIR5eZYq5ucpkwyB3FXvYwRCEbjfJN4GdkX+ZMiCLOJFdyRo612Pbnhxkd/ pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366j4bthpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 06:18:30 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10KB3TOg163732;
 Wed, 20 Jan 2021 06:18:30 -0500
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 366j4bthnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 06:18:30 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10KBGhAN031500;
 Wed, 20 Jan 2021 11:18:28 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3668nwrgr2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Jan 2021 11:18:27 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10KBIOSj38732134
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Jan 2021 11:18:24 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 978E652054;
 Wed, 20 Jan 2021 11:18:24 +0000 (GMT)
Received: from [9.199.40.105] (unknown [9.199.40.105])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5DCD65204E;
 Wed, 20 Jan 2021 11:18:22 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH] powerpc/uprobes: Don't allow probe on suffix of prefixed
 instruction
To: Oleg Nesterov <oleg@redhat.com>
References: <20210119091234.76317-1-ravi.bangoria@linux.ibm.com>
 <20210119172603.GA16696@redhat.com>
Message-ID: <a760db1e-e953-75be-3ad5-2efc7642db6b@linux.ibm.com>
Date: Wed, 20 Jan 2021 16:48:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210119172603.GA16696@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-20_02:2021-01-18,
 2021-01-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101200060
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
Cc: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, linux-kernel@vger.kernel.org,
 rostedt@goodmis.org, paulus@samba.org, sandipan@linux.ibm.com,
 jniethe5@gmail.com, naveen.n.rao@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 1/19/21 10:56 PM, Oleg Nesterov wrote:
> On 01/19, Ravi Bangoria wrote:
>>
>> Probe on 2nd word of a prefixed instruction is invalid scenario and
>> should be restricted.
> 
> I don't understand this ppc-specific problem, but...

So far (upto Power9), instruction size was fixed - 4 bytes. But Power10
introduced a prefixed instruction which consist of 8 bytes, where first
4 bytes is prefix and remaining is suffix.

This patch checks whether the Uprobe is on the 2nd word (suffix) of a
prefixed instruction. If so, consider it as invalid Uprobe.

> 
>> +#ifdef CONFIG_PPC64
>> +int arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr,
>> +			      uprobe_opcode_t opcode)
>> +{
>> +	uprobe_opcode_t prefix;
>> +	void *kaddr;
>> +	struct ppc_inst inst;
>> +
>> +	/* Don't check if vaddr is pointing to the beginning of page */
>> +	if (!(vaddr & ~PAGE_MASK))
>> +		return 0;
> 
> So the fix is incomplete? Or insn at the start of page can't be prefixed?

Prefixed instruction can not cross 64 byte boundary. If it does, kernel
generates SIGBUS. Considering all powerpc supported page sizes to be
multiple of 64 bytes, there will never be a scenario where prefix and
suffix will be on different pages. i.e. a beginning of the page should
never be a suffix.

> 
>> +int __weak arch_uprobe_verify_opcode(struct page *page, unsigned long vaddr,
>> +				     uprobe_opcode_t opcode)
>> +{
>> +	return 0;
>> +}
>> +
>>   static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t *new_opcode)
>>   {
>>   	uprobe_opcode_t old_opcode;
>> @@ -275,6 +281,8 @@ static int verify_opcode(struct page *page, unsigned long vaddr, uprobe_opcode_t
>>   	if (is_swbp_insn(new_opcode)) {
>>   		if (is_swbp)		/* register: already installed? */
>>   			return 0;
>> +		if (arch_uprobe_verify_opcode(page, vaddr, old_opcode))
>> +			return -EINVAL;
> 
> Well, this doesn't look good...
> 
> To me it would be better to change the prepare_uprobe() path to copy
> the potential prefix into uprobe->arch and check ppc_inst_prefixed()
> in arch_uprobe_analyze_insn(). What do you think?

Agreed. The only reason I was checking via verify_opcode() is to make the
code more simpler. If I need to check via prepare_uprobe(), I'll need to
abuse uprobe->offset by setting it to uprobe->offset - 4 to read previous
4 bytes of current instruction. Which, IMHO, is not that straightforward
with current implementation of prepare_uprobe().

But while replying here, I'm thinking... I should be able to grab a page
using mm and vaddr, which are already available in arch_uprobe_analyze_insn().
With that, I should be able to do all this inside arch_uprobe_analyze_insn()
only. I'll try this and send v2 if that works.

Thanks for the review.
Ravi
