Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D5A81A7A6A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 14:13:09 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491ksG2z4gzDqbm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 22:13:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491kph0xpfzDqbm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:10:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 491kpg6G5dz8sX5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 22:10:51 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 491kpg5Zq4z9sT0; Tue, 14 Apr 2020 22:10:51 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=psampat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 491kpg1JZYz9sPF
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Apr 2020 22:10:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03EC6V8k008497
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Apr 2020 08:10:48 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30cwm08xfn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 14 Apr 2020 08:10:48 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <psampat@linux.ibm.com>;
 Tue, 14 Apr 2020 13:10:13 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 14 Apr 2020 13:10:10 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 03EC9aUc49021380
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 Apr 2020 12:09:36 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A6212AE045;
 Tue, 14 Apr 2020 12:10:42 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27BA8AE051;
 Tue, 14 Apr 2020 12:10:41 +0000 (GMT)
Received: from [9.199.55.119] (unknown [9.199.55.119])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 14 Apr 2020 12:10:40 +0000 (GMT)
Subject: Re: [PATCH v6 0/3] powerpc/powernv: Introduce interface for
 self-restore support
To: ego@linux.vnet.ibm.com
References: <20200326071034.12838-1-psampat@linux.ibm.com>
 <20200414071149.GD24277@in.ibm.com>
From: Pratik Sampat <psampat@linux.ibm.com>
Date: Tue, 14 Apr 2020 17:40:40 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200414071149.GD24277@in.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20041412-4275-0000-0000-000003BFB016
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20041412-4276-0000-0000-000038D52267
Message-Id: <f0e6d1c2-e888-2ff6-ea80-95f753e89051@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-14_05:2020-04-14,
 2020-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 suspectscore=0 adultscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004140101
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
Cc: pratik.r.sampat@gmail.com, linuxram@us.ibm.com,
 linux-kernel@vger.kernel.org, linuxppc-dev@ozlabs.org, oohall@gmail.com,
 skiboot@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello Gautham

On 14/04/20 12:41 pm, Gautham R Shenoy wrote:
> Hello Pratik,
>
> On Thu, Mar 26, 2020 at 12:40:31PM +0530, Pratik Rajesh Sampat wrote:
>> v5: https://lkml.org/lkml/2020/3/17/944
>> Changelog
>> v5-->v6
>> 1. Updated background, motivation and illuminated potential design
>> choices
>> 2. Re-organization of patch-set
>>    a. Split introducing preference for optimization from 1/1 to patch 3/3
>>    b. Merge introducing self-save API and parsing the device-tree
>>    c. Introduce a supported mode called KERNEL_SAVE_RESTORE which
>>       outlines and makes kernel supported SPRs for save-restore more
>>       explicit
>>
> [..snip..]
>
>> Presenting the design choices in front of us:
>>
>> Design-Choice 1:
>> ----------------
>> A simple implementation is to just replace self-restore calls with
>> self-save as it is direct super-set.
>>
>> Pros:
>> A simple design, quick to implement
>>
>>
>> Cons:
>> * Breaks backward compatibility. Self-restore has historically been
>>    supported in the firmware and an old firmware running on an new
>>    kernel will be incompatible and deep stop states will be cut.
>> * Furthermore, critical SPRs which need to be restored
>>    before 0x100 vector like HID0 are not supported by self-save.
>>
>> Design-Choice 2:
>> ----------------
>> Advertise both self-restore and self-save from OPAL including the set
>> of registers that each support. The kernel can then choose which API
>> to go with.
>> For the sake of simplicity, in case both modes are supported for an
>> SPR by default self-save would be called for it.
>>
>> Pros:
>> * Backwards compatible
>>
>> Cons:
>> Overhead in parsing device tree with the SPR list
>>
>> Possible optimization with Approach2:
>> -------------------------------------
>> There are SPRs whose values don't tend to change over time and invoking
>> self-save on them, where the values are gotten each time may turn out to
>> be inefficient. In that case calling a self-restore where passing the
>> value makes more sense as, if the value is same, the memory location
>> is not updated.
>> SPRs that dont change are as follows:
>> SPRN_HSPRG0,
>> SPRN_LPCR,
>> SPRN_PTCR,
>> SPRN_HMEER,
>> SPRN_HID0,
> We can just pick self-save wherever available and fallback to
> self-restore when self-save support is not avaiable for any SPR.
> The optimization that you mention here can be revisited if the
> additional latency due to self-save becomes observable (Note that both
> stop4 and stop5 have wakeup latency between 200-500us).

Yes, Patch2 introduces picking self-save when available and using
self-restore as fallback.
Sure. The optimization of preference does certainly add an additional
layer of complexity. As you mentioned, in the case the latency really
begins to hurt us we can revisit this discussion.

Thanks
Pratik

>> The values of PSSCR and MSR change at runtime and hence, the kernel
>> cannot determine during boot time what their values will be before
>> entering a particular deep-stop state.
>>
>> Therefore, a preference based interface is introduced for choosing
>> between self-save or self-restore between for each SPR.
>> The per-SPR preference is only a refinement of
>> approach 2 purely for performance reasons. It can be dropped if the
>> complexity is not deemed worth the returns.
>>
>> Patches Organization
>> ====================
>> Design Choice 2 has been chosen as an implementation to demonstrate in
>> the patch series.
>>
>> Patch1:
>> Devises an interface which lists all the interested SPRs, along with
>> highlighting the support of mode.
>> It is an isomorphic patch to replicate the functionality of the older
>> self-restore firmware for the new interface
>>
>> Patch2:
>> Introduces the self-save API and leverages upon the struct interface to
>> add another supported mode in the mix of saving and restoring. It also
>> enforces that in case both modes are supported self-save is chosen over
>> self-restore
>>
>> The commit also parses the device-tree and populate support for
>> self-save and self-restore in the supported mask
>>
>> Patch3:
>> Introduce an optimization to allow preference to choose between one more
>> over the one when both both modes are supported. This optimization can
>> allow for better performance for the SPRs that don't change in value and
>> hence self-restore is a better alternative, and in cases when it is
>> known for values to change self-save is more convenient.
>>
>> Pratik Rajesh Sampat (3):
>>    powerpc/powernv: Introduce interface for self-restore support
>>    powerpc/powernv: Introduce support and parsing for self-save API
>>    powerpc/powernv: Preference optimization for SPRs with constant values
>>
>>   .../bindings/powerpc/opal/power-mgt.txt       |  18 +
>>   arch/powerpc/include/asm/opal-api.h           |   3 +-
>>   arch/powerpc/include/asm/opal.h               |   1 +
>>   arch/powerpc/platforms/powernv/idle.c         | 385 +++++++++++++++---
>>   arch/powerpc/platforms/powernv/opal-call.c    |   1 +
>>   5 files changed, 351 insertions(+), 57 deletions(-)
>>
>> -- 
>> 2.17.1
>>

