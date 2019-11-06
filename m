Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E94AAF1F94
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Nov 2019 21:14:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 477d6n6Dk2zF3p0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2019 07:14:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 477d4y5BNvzDqss
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2019 07:13:05 +1100 (AEDT)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xA6K9vwf009959
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 Nov 2019 15:13:00 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2w44shgmpb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 15:13:00 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xA6KAEC1015640
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 6 Nov 2019 20:12:59 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 2w41uj9wg1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 06 Nov 2019 20:12:59 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xA6KCvqp42074468
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Nov 2019 20:12:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9D632BE058;
 Wed,  6 Nov 2019 20:12:57 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1BB08BE053;
 Wed,  6 Nov 2019 20:12:56 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.81.178])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  6 Nov 2019 20:12:56 +0000 (GMT)
Subject: Re: [PATCH 0/9] Fixes and Enablement of ibm,drc-info property
To: Thomas Falcon <tlfalcon@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <1572967453-9586-1-git-send-email-tyreld@linux.ibm.com>
 <6958da5b-c518-64c2-50e3-db3f169d2337@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <02380316-a751-6545-2991-13cce71f20f5@linux.ibm.com>
Date: Wed, 6 Nov 2019 12:12:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <6958da5b-c518-64c2-50e3-db3f169d2337@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-06_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911060198
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/5/19 9:03 AM, Thomas Falcon wrote:
> 
> On 11/5/19 9:24 AM, Tyrel Datwyler wrote:
> 
> Hi, just pointing out a few typos...

Damn, I thought I squashed them all the second time around.

>> There was a previous effort to add support for the PAPR
>> architected ibm,drc-info property. This property provides a more
>> memory compact representation of a paritions Dynamic Reconfig
> s/paritions/partition's
>> Connectors (DRC). These can otherwise be thought of as currently
>> partitioned, or available but yet to be partitioned system resources
>> such as cpus, memory, and physical/logical IOA devices.
>>
>> The initial implementation proved buggy and was fully turned of by
> 
> s/turned of/turned off
> 
>> disabling the bit in the appropriate CAS support vector. We now have
>> PowerVM firmware in the field that supports this new property, and
>> further to suppport partitions with 24TB+ of possible memory this
> s/suppport/support
>> property is required to perform platform migration.
>>
>> This serious fixs the short comings of the previous submission
> 
> Either "seriously fixes the shortcomings", or "fixes the serious shortcomings?"
Should be "series" as in this "patch series".

-Tyrel

> 
> Thanks,
> 
> Tom
> 
>> in the areas of general implementation, cpu hotplug, and IOA hotplug.
>>
>> Tyrel Datwyler (9):
>>    powerpc/pseries: Fix bad drc_index_start value parsing of drc-info
>>      entry
>>    powerpc/pseries: Fix drc-info mappings of logical cpus to drc-index
>>    powerpc/pseries: Add cpu DLPAR support for drc-info property
>>    PCI: rpaphp: Fix up pointer to first drc-info entry
>>    PCI: rpaphp: Don't rely on firmware feature to imply drc-info support
>>    PCI: rpaphp: Add drc-info support for hotplug slot registration
>>    PCI: rpaphp: annotate and correctly byte swap DRC properties
>>    PCI: rpaphp: Correctly match ibm,my-drc-index to drc-name when using
>>      drc-info
>>    powerpc/pseries: Enable support for ibm,drc-info property
>>
>>   arch/powerpc/kernel/prom_init.c                 |   2 +-
>>   arch/powerpc/platforms/pseries/hotplug-cpu.c    | 101 ++++++++++++++++---
>>   arch/powerpc/platforms/pseries/of_helpers.c     |   8 +-
>>   arch/powerpc/platforms/pseries/pseries_energy.c |  23 ++---
>>   drivers/pci/hotplug/rpaphp_core.c               | 124 +++++++++++++++++-------
>>   5 files changed, 187 insertions(+), 71 deletions(-)
>>

