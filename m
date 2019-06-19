Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A726F4B34D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 09:48:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45TH9p62JBzDqnD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Jun 2019 17:47:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=ravi.bangoria@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45TH7b5mwczDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 17:46:03 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5J7gVZ4111708
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 03:46:00 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2t7gne90fx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Jun 2019 03:46:00 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 19 Jun 2019 08:45:58 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 19 Jun 2019 08:45:56 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5J7jtFo48758878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Jun 2019 07:45:55 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 87263A4053;
 Wed, 19 Jun 2019 07:45:55 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E55DFA4040;
 Wed, 19 Jun 2019 07:45:53 +0000 (GMT)
Received: from [9.124.31.60] (unknown [9.124.31.60])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 19 Jun 2019 07:45:53 +0000 (GMT)
Subject: Re: [PATCH 5/5] Powerpc/Watchpoint: Fix length calculation for
 unaligned target
To: Michael Neuling <mikey@neuling.org>
References: <20190618042732.5582-1-ravi.bangoria@linux.ibm.com>
 <20190618042732.5582-6-ravi.bangoria@linux.ibm.com>
 <707bc0b664b8ebbb843a1541155fed219c216035.camel@neuling.org>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 19 Jun 2019 13:15:53 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <707bc0b664b8ebbb843a1541155fed219c216035.camel@neuling.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19061907-4275-0000-0000-000003439F99
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19061907-4276-0000-0000-00003853C9AB
Message-Id: <8a8a17b6-bdd6-4efb-7937-b1af105e08e0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-19_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=943 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906190064
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
 npiggin@gmail.com, paulus@samba.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 6/18/19 7:02 PM, Michael Neuling wrote:
> On Tue, 2019-06-18 at 09:57 +0530, Ravi Bangoria wrote:
>> Watchpoint match range is always doubleword(8 bytes) aligned on
>> powerpc. If the given range is crossing doubleword boundary, we
>> need to increase the length such that next doubleword also get
>> covered. Ex,
>>
>>           address   len = 6 bytes
>>                 |=========.
>>    |------------v--|------v--------|
>>    | | | | | | | | | | | | | | | | |
>>    |---------------|---------------|
>>     <---8 bytes--->
>>
>> In such case, current code configures hw as:
>>   start_addr = address & ~HW_BREAKPOINT_ALIGN
>>   len = 8 bytes
>>
>> And thus read/write in last 4 bytes of the given range is ignored.
>> Fix this by including next doubleword in the length. Watchpoint
>> exception handler already ignores extraneous exceptions, so no
>> changes required for that.
> 
> Nice catch. Thanks.
> 
> I assume this has been broken forever? Should we be CCing stable? If so, it
> would be nice to have this self contained (separate from the refactor) so we can
> more easily backport it.

Yes this has been broken forever. I'll add Fixes: tag and cc stable.

> 
> Also, can you update 
> tools/testing/selftests/powerpc/ptrace/ptrace-hwbreak.c to catch this issue?

Sure, will add the test case.

[...]

>> +u16 hw_breakpoint_get_final_len(struct arch_hw_breakpoint *brk,
>> +				unsigned long *start_addr,
>> +				unsigned long *end_addr)
> 
> I don't really like this.  "final" is not a good name. Something like hardware
> would be better.
> 
> Also, can you put the start_addr and end addr in the arch_hw_breakpoint rather
> than doing what you have above.  Call them hw_start_addr, hw_end_addr.
> 
> We could even set these two new addresses where we set the set of
> arch_hw_breakpoint rather than having this late call.

Sure, will use 'hw_' prefix for them.

