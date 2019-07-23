Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1777258B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 05:49:28 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thDP53bTzDqCZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 13:49:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=anju@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tGSq1f3RzDqQj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 21:28:42 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6NBSSx5106818
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 07:28:38 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2twypbvxd3-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 07:28:35 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <anju@linux.vnet.ibm.com>;
 Tue, 23 Jul 2019 12:27:34 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 23 Jul 2019 12:27:31 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6NBRGhF36110744
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Jul 2019 11:27:16 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D298452050;
 Tue, 23 Jul 2019 11:27:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.72])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 1CC5052052;
 Tue, 23 Jul 2019 11:27:29 +0000 (GMT)
Subject: Re: [PATCH v2] powerpc/imc: Dont create debugfs files for cpu-less
 nodes
To: Qian Cai <cai@lca.pw>, Michael Ellerman <mpe@ellerman.id.au>,
 Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
References: <20190702092112.4015-1-maddy@linux.vnet.ibm.com>
 <87d0ihgojp.fsf@concordia.ellerman.id.au> <1563216075.4610.3.camel@lca.pw>
From: Anju T Sudhakar <anju@linux.vnet.ibm.com>
Date: Tue, 23 Jul 2019 16:57:28 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1563216075.4610.3.camel@lca.pw>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19072311-0016-0000-0000-00000295652C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19072311-0017-0000-0000-000032F354C9
Message-Id: <b1d6a06f-5f3b-d887-27cf-ba8c0255c4b0@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-23_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=27 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907230113
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Qian,

On 7/16/19 12:11 AM, Qian Cai wrote:
> On Thu, 2019-07-11 at 14:53 +1000, Michael Ellerman wrote:
>> Hi Maddy,
>>
>> Madhavan Srinivasan <maddy@linux.vnet.ibm.com> writes:
>>> diff --git a/arch/powerpc/platforms/powernv/opal-imc.c
>>> b/arch/powerpc/platforms/powernv/opal-imc.c
>>> index 186109bdd41b..e04b20625cb9 100644
>>> --- a/arch/powerpc/platforms/powernv/opal-imc.c
>>> +++ b/arch/powerpc/platforms/powernv/opal-imc.c
>>> @@ -69,20 +69,20 @@ static void export_imc_mode_and_cmd(struct device_node
>>> *node,
>>>   	if (of_property_read_u32(node, "cb_offset", &cb_offset))
>>>   		cb_offset = IMC_CNTL_BLK_OFFSET;
>>>   
>>> -	for_each_node(nid) {
>>> -		loc = (u64)(pmu_ptr->mem_info[chip].vbase) + cb_offset;
>>> +	while (ptr->vbase != NULL) {
>> This means you'll bail out as soon as you find a node with no vbase, but
>> it's possible we could have a CPU-less node intermingled with other
>> nodes.
>>
>> So I think you want to keep the for loop, but continue if you see a NULL
>> vbase?
> Not sure if this will also takes care of some of those messages during the boot
> on today's linux-next even without this patch.
>
>
> [   18.077780][    T1] debugfs: Directory 'imc' with parent 'powerpc' already
> present!
>
>

This is introduced by a recent commit: c33d442328f55 (debugfs: make 
error message a bit more verbose).

So basically, the debugfs imc_* file is created per node, and is created 
by the first nest unit which is

being registered. For the subsequent nest units, debugfs_create_dir() 
will just return since the imc_* file already

exist.

The commit "c33d442328f55 (debugfs: make error message a bit more 
verbose)", prints

a message if the debugfs file already exists in debugfs_create_dir(). 
That is why we are encountering these

messages now.


This patch (i.e, powerpc/imc: Dont create debugfs files for cpu-less 
nodes) will address the initial issue, i.e

"numa crash while reading imc_* debugfs files for cpu less nodes", and 
will not address these debugfs messages.


But yeah this is a good catch. We can have some checks to avoid these 
debugfs messages.


Hi Michael,

Do we need to have a separate patch to address these debugfs messages, 
or can we address the same

in the next version of this patch itself?


Thanks,

Anju




