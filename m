Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C691F4C2653
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 09:32:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K45kg0tf5z3cZ8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Feb 2022 19:32:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=a/I6rm/G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=a/I6rm/G; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K45jv0GRSz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 19:32:02 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21O3hQk9005363
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=DC/CVsj2hHZV6bUw+zEU6xoaXgczzvF2LARNmYk35gs=;
 b=a/I6rm/GQb8UROmQY3t4SWn57iVsQXYOVf3jlaR4tMFMzapG+ekUNvzQb0ghkbUUQiGZ
 vojGKtmlzrTTxneZjQxYfbhxEWfUFT3QgxbBIdGXj3+cTU0JmYkSDl+FABwse2xsN6Lh
 K5yBZk0lzMTbnUMz4r81F/NxVoP/aF2rAmegCbnnXgZHT2xE1rCGv3zhZRnYqWSjtscF
 jj4H3WIXVYB7m3znQEuu8Hlh8JYs3oxOo0n9CyuNMfRQG4ZZYWQGIB/VIlLD03w5gA+D
 330GakuBkMB/TzzUFM7ch9zFXiP7IkWjfNA4lM9tFRaGSL8VzxVcpxEExKHF/bKcnA8I rQ== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edsjt58v5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:54 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21O6CvGx022554
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:53 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma02fra.de.ibm.com with ESMTP id 3ear69cys8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21O6GobP50200980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:50 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36512A4060
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:50 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5A6CA4054
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:49 +0000 (GMT)
Received: from [9.43.4.33] (unknown [9.43.4.33])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Feb 2022 06:16:49 +0000 (GMT)
Message-ID: <e491dda0-1d5f-eaf4-1601-b17614ced2f7@linux.ibm.com>
Date: Thu, 24 Feb 2022 11:46:48 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 0/4] Add perf interface to expose nvdimm
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org
References: <20220217163357.276036-1-kjain@linux.ibm.com>
 <CAPcyv4jwpMbz0woftSfm3EO05pr3ZG9rVMJCkYVsapKYSOn3xw@mail.gmail.com>
 <CAPcyv4hkLA_KJsKO_avTDZCVL2zGhcRNxVc+2P2uR6-5b2uwVA@mail.gmail.com>
 <CAPcyv4jCeweE3A90bP-xUkM9pNQw=XdsFxvFye4=bVRNKWwHKQ@mail.gmail.com>
From: kajoljain <kjain@linux.ibm.com>
In-Reply-To: <CAPcyv4jCeweE3A90bP-xUkM9pNQw=XdsFxvFye4=bVRNKWwHKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YAjPhrpMtl4e8nE4s_oB2vhjTnuGWiV9
X-Proofpoint-GUID: YAjPhrpMtl4e8nE4s_oB2vhjTnuGWiV9
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-23_09,2022-02-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202240035
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



On 2/24/22 02:47, Dan Williams wrote:
> On Wed, Feb 23, 2022 at 11:07 AM Dan Williams <dan.j.williams@intel.com> wrote:
>>
>> On Fri, Feb 18, 2022 at 10:06 AM Dan Williams <dan.j.williams@intel.com> wrote:
>>>
>>> On Thu, Feb 17, 2022 at 8:34 AM Kajol Jain <kjain@linux.ibm.com> wrote:
>>>>
>>>> Patchset adds performance stats reporting support for nvdimm.
>>>> Added interface includes support for pmu register/unregister
>>>> functions. A structure is added called nvdimm_pmu to be used for
>>>> adding arch/platform specific data such as cpumask, nvdimm device
>>>> pointer and pmu event functions like event_init/add/read/del.
>>>> User could use the standard perf tool to access perf events
>>>> exposed via pmu.
>>>>
>>>> Interface also defines supported event list, config fields for the
>>>> event attributes and their corresponding bit values which are exported
>>>> via sysfs. Patch 3 exposes IBM pseries platform nmem* device
>>>> performance stats using this interface.
>>>>
>>>> Result from power9 pseries lpar with 2 nvdimm device:
>>>>
>>>> Ex: List all event by perf list
>>>>
>>>> command:# perf list nmem
>>>>
>>>>   nmem0/cache_rh_cnt/                                [Kernel PMU event]
>>>>   nmem0/cache_wh_cnt/                                [Kernel PMU event]
>>>>   nmem0/cri_res_util/                                [Kernel PMU event]
>>>>   nmem0/ctl_res_cnt/                                 [Kernel PMU event]
>>>>   nmem0/ctl_res_tm/                                  [Kernel PMU event]
>>>>   nmem0/fast_w_cnt/                                  [Kernel PMU event]
>>>>   nmem0/host_l_cnt/                                  [Kernel PMU event]
>>>>   nmem0/host_l_dur/                                  [Kernel PMU event]
>>>>   nmem0/host_s_cnt/                                  [Kernel PMU event]
>>>>   nmem0/host_s_dur/                                  [Kernel PMU event]
>>>>   nmem0/med_r_cnt/                                   [Kernel PMU event]
>>>>   nmem0/med_r_dur/                                   [Kernel PMU event]
>>>>   nmem0/med_w_cnt/                                   [Kernel PMU event]
>>>>   nmem0/med_w_dur/                                   [Kernel PMU event]
>>>>   nmem0/mem_life/                                    [Kernel PMU event]
>>>>   nmem0/poweron_secs/                                [Kernel PMU event]
>>>>   ...
>>>>   nmem1/mem_life/                                    [Kernel PMU event]
>>>>   nmem1/poweron_secs/                                [Kernel PMU event]
>>>>
>>>> Patch1:
>>>>         Introduces the nvdimm_pmu structure
>>>> Patch2:
>>>>         Adds common interface to add arch/platform specific data
>>>>         includes nvdimm device pointer, pmu data along with
>>>>         pmu event functions. It also defines supported event list
>>>>         and adds attribute groups for format, events and cpumask.
>>>>         It also adds code for cpu hotplug support.
>>>> Patch3:
>>>>         Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
>>>>         nmem* pmu. It fills in the nvdimm_pmu structure with pmu name,
>>>>         capabilities, cpumask and event functions and then registers
>>>>         the pmu by adding callbacks to register_nvdimm_pmu.
>>>> Patch4:
>>>>         Sysfs documentation patch
>>>>
>>>> Changelog
>>>> ---
>>>> Resend v5 -> v6
>>>> - No logic change, just a rebase to latest upstream and
>>>>   tested the patchset.
>>>>
>>>> - Link to the patchset Resend v5: https://lkml.org/lkml/2021/11/15/3979
>>>>
>>>> v5 -> Resend v5
>>>> - Resend the patchset
>>>>
>>>> - Link to the patchset v5: https://lkml.org/lkml/2021/9/28/643
>>>>
>>>> v4 -> v5:
>>>> - Remove multiple variables defined in nvdimm_pmu structure include
>>>>   name and pmu functions(event_int/add/del/read) as they are just
>>>>   used to copy them again in pmu variable. Now we are directly doing
>>>>   this step in arch specific code as suggested by Dan Williams.
>>>>
>>>> - Remove attribute group field from nvdimm pmu structure and
>>>>   defined these attribute groups in common interface which
>>>>   includes format, event list along with cpumask as suggested by
>>>>   Dan Williams.
>>>>   Since we added static defination for attrbute groups needed in
>>>>   common interface, removes corresponding code from papr.
>>>>
>>>> - Add nvdimm pmu event list with event codes in the common interface.
>>>>
>>>> - Remove Acked-by/Reviewed-by/Tested-by tags as code is refactored
>>>>   to handle review comments from Dan.
>>>
>>> I don't think review comments should invalidate the Acked-by tags in
>>> this case. Nothing fundamentally changed in the approach, and I would
>>> like to have the perf ack before taking this through the nvdimm tree.
>>>
>>> Otherwise this looks good to me.
>>>
>>> Peter, might you have a chance to re-Ack this series, or any concerns
>>> about me retrieving those Acks from the previous postings?
>>
>> Reached Peter offline and he refreshed his Acked-by.
> 
> There's still time for the tags from:
> 
> "Madhavan Srinivasan"
> "Nageswara R Sastry"
> 
> ...to be reapplied, but I'll go ahead with pushing this to Linux-next
> in the meantime.

Hi Dan/Peter,
    Thanks for reviewing and taking the patchset.

Thanks,
Kajol Jain
