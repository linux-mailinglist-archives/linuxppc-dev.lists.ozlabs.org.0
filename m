Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A08C61BA4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 10:24:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45hz5Q5qbPzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jul 2019 18:24:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=mahesh@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45hz3y4YrZzDqHK
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jul 2019 18:23:26 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x688MS9w138062
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 8 Jul 2019 04:23:21 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tm1qn98qv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 Jul 2019 04:23:21 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <mahesh@linux.vnet.ibm.com>;
 Mon, 8 Jul 2019 09:23:19 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 8 Jul 2019 09:23:17 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x688NFn460358834
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jul 2019 08:23:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E1EB752052;
 Mon,  8 Jul 2019 08:23:15 +0000 (GMT)
Received: from [9.109.198.212] (unknown [9.109.198.212])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 4D0B252067;
 Mon,  8 Jul 2019 08:23:13 +0000 (GMT)
Subject: Re: [v3 4/7] powerpc/mce: Handle UE event for memcpy_mcsafe
To: Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Santosh Sivaraj <santosh@fossix.org>
References: <20190705212647.21750-1-santosh@fossix.org>
 <20190705212647.21750-5-santosh@fossix.org>
 <1562406379.9eh1e6edgk.astroid@bobo.none>
From: Mahesh Jagannath Salgaonkar <mahesh@linux.vnet.ibm.com>
Date: Mon, 8 Jul 2019 13:53:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1562406379.9eh1e6edgk.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070808-0008-0000-0000-000002FADA08
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070808-0009-0000-0000-000022683529
Message-Id: <b32144b5-c97b-0292-cab6-7290c906e9e2@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-08_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907080110
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 Chandan Rajendra <chandan@linux.vnet.ibm.com>,
 Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/6/19 3:23 PM, Nicholas Piggin wrote:
> Santosh Sivaraj's on July 6, 2019 7:26 am:
>> If we take a UE on one of the instructions with a fixup entry, set nip
>> to continue exucution at the fixup entry. Stop processing the event
>> further or print it.
> 
> Minor nit, but can you instead a field in the mce data structure that
> describes the property of the event, and then the code that intends to
> ignore such events can test for it (with an appropriate comment).
> 
> So it would be has_fixup_handler or similar. Then queue_event can have
> the logic
> 
> /*
>  * Don't report this machine check because the caller has a fixup 
>  * handler which will do the appropriate error handling and reporting.
>  */
> 
> 
>> @@ -565,9 +567,18 @@ static int mce_handle_derror(struct pt_regs *regs,
>>  	return 0;
>>  }
>>  
>> -static long mce_handle_ue_error(struct pt_regs *regs)
>> +static long mce_handle_ue_error(struct pt_regs *regs,
>> +				struct mce_error_info *mce_err)
>>  {
>>  	long handled = 0;
>> +	const struct exception_table_entry *entry;
>> +
>> +	entry = search_exception_tables(regs->nip);
> 
> Uh oh, this searches module exception tables too... we can't do that
> in real mode, can we?

Yeah, we can not do that in real mode.  Should we directly call
search_extable() for kernel exception table ?

> 
> Thanks,
> Nick
> 

