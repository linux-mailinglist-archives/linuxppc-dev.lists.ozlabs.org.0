Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B767D4E6F80
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 09:33:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KPwNW4j3bz30Dv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Mar 2022 19:33:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Bdqr+Xtm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KPwMl6rs3z2yxL
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 19:33:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bdqr+Xtm; dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KPwMj3zKvz4xYy
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Mar 2022 19:33:05 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KPwMj3r3Sz4xc3; Fri, 25 Mar 2022 19:33:05 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Bdqr+Xtm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KPwMj1Z9Fz4xYy
 for <linuxppc-dev@ozlabs.org>; Fri, 25 Mar 2022 19:33:05 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22P7twBR024070; 
 Fri, 25 Mar 2022 08:32:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=v21XVFfEf2pC9hxUL6m4n+CTZc7D5azmFQ0lHInMfFU=;
 b=Bdqr+XtmzGkY8Rx3SB1g/8ofX5yJSVaxDe93k35y9v9UkOVDjsqxIevL/bx1d5ISkkEP
 RyetAniCqgEmlFKWF0Y4fX/2Fv6h5ZPV7/3QrhncVGpmeOvXM84lqB++Cg2NS09l6pm/
 7xZxX0uQ8FywL7G5VKprGSOwHcJpl8JtoxdMtKJG4Bt7SqO2rnYcXAlrOM8kv/MKicMr
 RSehZ6Iy6qd89VqASMea0TLxsoKHc99evpLME1mgQUrPkwMJHhQSnXesi7ABOTisFK5K
 LYQPsHLfq24r9cSv6TR+C39Ar6hJpahCeZjKsKbssUEiuRfh/Y24MVDJEFwWuHeoWiUo DQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0c6yuxbj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 08:32:53 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22P89v69010650;
 Fri, 25 Mar 2022 08:32:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f0c6yuxay-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 08:32:52 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22P8RI5P012801;
 Fri, 25 Mar 2022 08:32:50 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t94qsv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 25 Mar 2022 08:32:49 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22P8Wlh055968124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 25 Mar 2022 08:32:47 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BE02EAE045;
 Fri, 25 Mar 2022 08:32:47 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D127AE051;
 Fri, 25 Mar 2022 08:32:45 +0000 (GMT)
Received: from [9.43.55.110] (unknown [9.43.55.110])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 25 Mar 2022 08:32:45 +0000 (GMT)
Message-ID: <cebcb5d0-0468-57e9-c9b0-46de8766c724@linux.ibm.com>
Date: Fri, 25 Mar 2022 14:02:44 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC v3 PATCH 0/5] In kernel handling of CPU hotplug events for
 crash kernel
Content-Language: en-US
To: Eric DeVolder <eric.devolder@oracle.com>, linuxppc-dev@ozlabs.org,
 mpe@ellerman.id.au
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <fbea3816-1a7b-3f9b-1ebf-1f388537af5b@oracle.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <fbea3816-1a7b-3f9b-1ebf-1f388537af5b@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QkS16xZ8AjD_m2CtxvuF4IjKB0ExrXvG
X-Proofpoint-ORIG-GUID: DgdOJbVX5p7Y_dsloPkju13uwTR4GAYj
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-25_02,2022-03-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 clxscore=1015 malwarescore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203250046
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
Cc: mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, bhe@redhat.com,
 hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 24/03/22 00:02, Eric DeVolder wrote:
>
>
> On 3/21/22 03:04, Sourabh Jain wrote:
>> This patch series implements the crash hotplug handler on PowerPC 
>> introduced
>> by https://lkml.org/lkml/2022/3/3/674 patch series.
>>
>>
>> The Problem:
>> ============
>> Post hotplug/DLPAR events the capture kernel holds stale information 
>> about the
>> system. Dump collection with stale capture kernel might end up in 
>> dump capture
>> failure or an inaccurate dump collection.
>>
>>
>> Existing solution:
>> ==================
>> The existing solution to keep the capture kernel up-to-date is 
>> observe the
>> hotplug event via udev rule and trigger a full capture kernel reload 
>> post
>> hotplug event.
>>
>> Shortcomings:
>> ------------------------------------------------
>> - Leaves a window where kernel crash might not lead to successful dump
>>    collection.
>> - Reloading all kexec components for each hotplug is inefficient. 
>> Since only
>>    one or two kexec components need to be updated due to hotplug 
>> event reloading
>>    all kexec component is redundant.
>> - udev rules are prone to races if hotplug events are frequent.
>>
>> More about issues with an existing solution is posted here:
>>   - https://lkml.org/lkml/2020/12/14/532
>>   - 
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html
>>
>> Proposed Solution:
>> ==================
>> Instead of reloading all kexec segments on hotplug event, this patch 
>> series
>> focuses on updating only the relevant kexec segment. Once the kexec
>> segments are loaded in the kernel reserved area then an arch-specific 
>> hotplug handler
>> will update the relevant kexec segment based on hotplug event type.
>>
>> As mentioned above this patch series implemented a PowerPC crash hotplug
>> handler for the CPU. The crash hotplug handler memory is in our TODO 
>> list.
>>
>>
>> A couple of minor changes are required to realize the benefit of the 
>> patch
>> series:
>>
>> - disalble the udev rule:
>>
>>    comment out the below line in kdump udev rule file:
> fwiw, this will need to be conditionalized on arch, ie to skip for 
> ppc64. I'm doing the same for x86_64.


I think kexec-tools maintains a separate udev rule file for PowerPC. I 
will ensure CPU rules gets removed from kdump udev rules once this 
feature is upstream.

Thanks,
- Sourabh Jain

