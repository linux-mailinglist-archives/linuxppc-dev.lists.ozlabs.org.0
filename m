Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F261897DD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 10:24:12 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48j4Nn6GBtzDqwF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 20:24:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ravi.bangoria@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48j4M41yrgzDqrW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 20:22:39 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02I9451X033153
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 05:22:36 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu7d9a351-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Mar 2020 05:22:36 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <ravi.bangoria@linux.ibm.com>;
 Wed, 18 Mar 2020 09:22:34 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 09:22:30 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02I9MTSx63111330
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 09:22:29 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 093E252052;
 Wed, 18 Mar 2020 09:22:29 +0000 (GMT)
Received: from [9.203.170.80] (unknown [9.203.170.80])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 9A0BA5204F;
 Wed, 18 Mar 2020 09:22:07 +0000 (GMT)
Subject: Re: [PATCH 09/15] powerpc/watchpoint: Convert thread_struct->hw_brk
 to an array
To: Christophe Leroy <christophe.leroy@c-s.fr>
References: <20200309085806.155823-1-ravi.bangoria@linux.ibm.com>
 <20200309085806.155823-10-ravi.bangoria@linux.ibm.com>
 <0fc9489d-9955-f649-9007-ce6f5da345be@c-s.fr>
 <5efe2f41-2bf3-6927-aa6a-dcedb672c69d@linux.ibm.com>
 <a1794506-ada3-7b1e-2fa7-bcebf6ec9d68@c-s.fr>
From: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
Date: Wed, 18 Mar 2020 14:52:01 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <a1794506-ada3-7b1e-2fa7-bcebf6ec9d68@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031809-0016-0000-0000-000002F31650
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031809-0017-0000-0000-000033569A90
Message-Id: <a41a244b-8eef-037e-42a1-8bf2e4275ca1@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_03:2020-03-17,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0
 mlxscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 adultscore=0 spamscore=0 phishscore=0 mlxlogscore=987 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2003180043
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



On 3/18/20 2:26 PM, Christophe Leroy wrote:
> 
> 
> Le 18/03/2020 à 09:36, Ravi Bangoria a écrit :
>>
>>
>> On 3/17/20 4:07 PM, Christophe Leroy wrote:
>>>
>>>
>>> Le 09/03/2020 à 09:58, Ravi Bangoria a écrit :
>>>> So far powerpc hw supported only one watchpoint. But Future Power
>>>> architecture is introducing 2nd DAWR. Convert thread_struct->hw_brk
>>>> into an array.
>>>
>>> Looks like you are doing a lot more than that in this patch.
>>>
>>> Should this patch be splitted in two parts ?
>>
>> So far thread_struct->hw_brk was a normal variable so accessing it was simple.
>> Once it gets converted into an array, loop needs to be used to access it. So
>> all misc changes are basically converting simple access into loops.
>>
>> I don't see how this can be splitted.
>>
> 
> You could first change all thread_struct->hw_brk to thread_struct->hw_brk[0] or thread_struct->hw_brk[i] when you know that i can only be 0 for now. Then add the loops and new functions in a second patch.

Ok. I've already tried that :) But it looked unnecessary split to
me because _all_ hw_brk => hw_brk[0] changes will again need to be
changed to use loop in 2nd patch. So I thought it's better to do
both changes in one patch.

Thanks,
Ravi

