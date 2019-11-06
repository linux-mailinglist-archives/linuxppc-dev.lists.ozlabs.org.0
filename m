Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B650CF0E65
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 06:31:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477FWN26b8zF5X6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 16:31:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477FTK17W6zF5B1
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 16:29:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 477FTJ44BWz8t8J
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Nov 2019 16:29:24 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 477FTJ3HpCz9sPk; Wed,  6 Nov 2019 16:29:24 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 477FTH6F7Cz9sPF
 for <linuxppc-dev@ozlabs.org>; Wed,  6 Nov 2019 16:29:23 +1100 (AEDT)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA65Mdw4134800
 for <linuxppc-dev@ozlabs.org>; Wed, 6 Nov 2019 00:29:20 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w3p50uaea-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 06 Nov 2019 00:29:19 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <sourabhjain@linux.ibm.com>;
 Wed, 6 Nov 2019 05:29:18 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 6 Nov 2019 05:29:15 -0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA65TEZI53936150
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 05:29:14 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42BAFA4060;
 Wed,  6 Nov 2019 05:29:14 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1CF17A405C;
 Wed,  6 Nov 2019 05:29:13 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.70])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Nov 2019 05:29:12 +0000 (GMT)
Subject: Re: [PATCH v2 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs
 files deprecated
To: Hari Bathini <hbathini@linux.ibm.com>, mpe@ellerman.id.au
References: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
 <20191018130557.2217-4-sourabhjain@linux.ibm.com>
 <f69daa7b-ddb3-8190-c409-28a22c504fed@linux.ibm.com>
 <b1bc42cc-8d80-d104-b1b3-684c08531c78@linux.ibm.com>
 <d0a34f71-1b78-e387-c3a5-d771995a91f6@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
Date: Wed, 6 Nov 2019 10:59:12 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <d0a34f71-1b78-e387-c3a5-d771995a91f6@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19110605-4275-0000-0000-0000037B2DD2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19110605-4276-0000-0000-0000388E7A21
Message-Id: <c7973234-6847-a8f3-7dc9-04f4d3fc99c0@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-05_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1911060056
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
Cc: linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 11/5/19 10:31 PM, Hari Bathini wrote:
> 
> 
> On 05/11/19 2:24 PM, Sourabh Jain wrote:
>>
>>
>> On 10/21/19 1:11 PM, Hari Bathini wrote:
>>>
>>>
>>> On 18/10/19 6:35 PM, Sourabh Jain wrote:
>>>> The /sys/kernel/fadump_* sysfs files are replicated under
>>>
>>> [...]
>>>
>>>> +Note: The following FADump sysfs files are deprecated.
>>>> +
>>>> +    Deprecated                       Alternative
>>>> +    -------------------------------------------------------------------------------
>>>> +    /sys/kernel/fadump_enabled           /sys/kernel/fadump/fadump_enabled
>>>> +    /sys/kernel/fadump_registered        /sys/kernel/fadump/fadump_registered
>>>> +    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/fadump_release_mem
>>>
>>> /sys/kernel/fadump/* looks tidy instead of /sys/kernel/fadump/fadump_* 
>>> I mean, /sys/kernel/fadump/fadump_enabled => /sys/kernel/fadump/enabled and such..
>>
>>
>>
>> Could you please confirm whether you want to address the sysfs file path differently or
>> actually changing the sysfs file name from fadump_enabled to enabled.
> 
> I meant, given the path "/sys/kernel/fadump/", the prefix fadump_ is redundant.
> If there are no conventions that we should retain the same file name, I suggest
> to drop the fadump_ prefix and just call them enabled, registered, etc..

Oh Yes, I agree with you. It's better not to prefix the sysfs files with fadump_. As we already
have directory that convey the same information.

I did not find any rule regarding renaming an obsolete sysfs file in Documentation/ABI/README.
So lets remove the fadump_ prefix from fadump sysfs file. 

Thanks,
Sourabh Jain

