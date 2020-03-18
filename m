Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5F50189BD0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 13:17:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j8FH3F7lzDqRS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 23:17:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j89z6xtCzDqRN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 23:15:03 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IC7QQr139044
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:15:01 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yua3uu330-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 08:15:01 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 18 Mar 2020 12:14:58 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 12:14:55 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02ICEr4e44695718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 12:14:54 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE02752050;
 Wed, 18 Mar 2020 12:14:53 +0000 (GMT)
Received: from [9.199.38.35] (unknown [9.199.38.35])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5E0A052052;
 Wed, 18 Mar 2020 12:14:22 +0000 (GMT)
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Subject: Re: [PATCH 12/15] powerpc/watchpoint: Prepare handler to handle more
 than one watcnhpoint
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-13-ravi.bangoria@linux.ibm.com>
 <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
Date: Wed, 18 Mar 2020 17:44:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3ba94856-0d87-5046-eca9-b5c3d99ec654@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031812-0028-0000-0000-000003E6E0E9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031812-0029-0000-0000-000024AC38BC
Message-Id: <c3168391-9c3d-5de3-8419-87067098cf01@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_05:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180059
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
Cc: apopple@linux.ibm.com, mikey@neuling.org,
 Ravi Bangoria <ravi.bangoria@linux.ibm.com>, peterz@infradead.org,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, fweisbec@gmail.com,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org,
 mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/17/20 4:29 PM, Christophe Leroy wrote:
> 
> 
> Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
>> Currently we assume that we have only one watchpoint supported by hw.
>> Get rid of that assumption and use dynamic loop instead. This should
>> make supporting more watchpoints very easy.
> 
> I think using 'we' is to be avoided in commit message.
> 
> Could be something like:
> 
> "Currently the handler assumes there is only one watchpoint supported by hw"
> 
>>
>> So far, with only one watchpoint, the handler was simple. But with
>> multiple watchpoints, we need a mechanism to detect which watchpoint
>> caused the exception. HW doesn't provide that information and thus
>> we need software logic for this. This makes exception handling bit
>> more complex.
> 
> Same here, the 'we' should be avoided.
> 
> 
> This patch is pretty big. I think you should explain a bit more what is done. Otherwise it is difficult to review.

I understand, and the diff is also messy. But splitting this into granular
patches looks difficult to me.

The patch enables core hw-breakpoint subsystem to install/uninstall more than one
watchpoint, basically converting direct accesses of data structures in a loop.
Similarly changes in thread_chage_pc(), single_step_dabr_instruction() etc.

Now, with more than one watchpoints, exception handler need to know which DAWR
caused the exception, and hw currently does not provide it. So we need sw logic
for the same. To figure out which DAWR caused the exception, we check all
different combinations of user specified range, dawr address range, actual
access range and dawrx constrains. For ex, if user specified range and actual
access range overlaps but dawrx is configured for readonly watchpoint and the
instruction is store, this DAWR must not have caused exception. This logic is
implemented by check_constraints() function.

...

>> -static bool dar_within_range(unsigned long dar, struct arch_hw_breakpoint *info)
>> +static bool dar_in_user_range(unsigned long dar, struct arch_hw_breakpoint *info)
> 
> Is this name change directly related to the patch ?

Yes. now we have two functions: dar_in_user_range() and dar_in_hw_range().
More detail below...

> 
>>   {
>>       return ((info->address <= dar) && (dar - info->address < info->len));
>>   }
>> -static bool
>> -dar_range_overlaps(unsigned long dar, int size, struct arch_hw_breakpoint *info)
>> +static bool dar_user_range_overlaps(unsigned long dar, int size,
>> +                    struct arch_hw_breakpoint *info)
> 
> Same question.

For single DAWR, hw_breakpoint_handler() logic is:

	if (user range overlaps with actual access range)
		valid event;
	else
		valid but extraneous;

With multiple breakpoints, this logic can't work when hw is not telling us which
DAWR caused exception. So the logic is like:

	for (i = 0; i < nr_wps; i++) {
		if (user range overlaps with actual access range)
			valid event;
		else if (hw range overlaps with actual access range)
			valid but extraneous;
		else
			exception cause by some other dawr;
	}

So we have two functions: dar_user_range_overlaps() and dar_hw_range_overlaps().
If reading instruction fails, we can't get actual access range an in that case
we use: dar_in_user_range() and dar_in_hw_range().

Thanks,
Ravi

