Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B16A84ED681
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 11:07:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KTcrC44Tnz2yh9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Mar 2022 20:07:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=SsWscgkI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KTcqR47PJz2xY0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 20:06:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SsWscgkI; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4KTcqR3llWz4xLS
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Mar 2022 20:06:27 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4KTcqR3byvz4xPv; Thu, 31 Mar 2022 20:06:27 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=SsWscgkI; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4KTcqR0YfPz4xLS
 for <linuxppc-dev@ozlabs.org>; Thu, 31 Mar 2022 20:06:26 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22V6req3005226; 
 Thu, 31 Mar 2022 09:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=yRtaU6GIPjBXmC6+Lu/l/ZQkpihb06L24ZuVvE6XIwg=;
 b=SsWscgkIKwKcPpYx1slw/Pkao6qrpYrMhZl8U4HYlgq5KHPySwBazB4/sfWqlN93fpS5
 Vx3IFzlDVekotypt7Gri+38YvmLd+aqCK7E5ECh9SfxZMyaPWT15z4NVVzRxy/Rlepxi
 /ZicxL/6fRtS3vlefqxikU4jnmrTkOdwqxB2f5a0I9TwpjmrumXALS+irCZizNjWq6R9
 ymMGBsRE+toTI7/8lkH8FBjg87g2h9VP7yiV1jn3I6Uc94hOfFoyhe/LZcir4dwqaHsK
 dpxbQhdJlcyTRLASLRUzlfI4nEBEXZ2yC5Lv2YTG3ggtudsMQC2X5NeeOOnanGsdY2Cb vA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f54c2p3c3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:05:51 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22V95pnY031471;
 Thu, 31 Mar 2022 09:05:51 GMT
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f54c2p3ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:05:51 +0000
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22V94USY016870;
 Thu, 31 Mar 2022 09:05:49 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 3f1tf90san-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 31 Mar 2022 09:05:48 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22V95jOw55181816
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 31 Mar 2022 09:05:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88CB8AE055;
 Thu, 31 Mar 2022 09:05:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F733AE053;
 Thu, 31 Mar 2022 09:05:43 +0000 (GMT)
Received: from [9.43.21.51] (unknown [9.43.21.51])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 31 Mar 2022 09:05:42 +0000 (GMT)
Message-ID: <3f72552f-7c69-510b-2e09-8149f9c584b9@linux.ibm.com>
Date: Thu, 31 Mar 2022 14:35:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC v3 PATCH 0/5] In kernel handling of CPU hotplug events for
 crash kernel
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org
References: <20220321080422.56255-1-sourabhjain@linux.ibm.com>
 <4f67f1ca-26e4-fbd6-bff7-692cd87da1b5@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <4f67f1ca-26e4-fbd6-bff7-692cd87da1b5@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4bfxcsLFX28jiMexyOMYTX9xw3FlUz-t
X-Proofpoint-GUID: _atUSdC6l0EXX-vPb23xEWZVPOeR64zr
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-31_03,2022-03-30_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203310050
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org,
 eric.devolder@oracle.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 25/03/22 22:34, Laurent Dufour wrote:
> On 21/03/2022, 09:04:17, Sourabh Jain wrote:
>> This patch series implements the crash hotplug handler on PowerPC introduced
>> by https://lkml.org/lkml/2022/3/3/674 patch series.
> Hi Sourabh,
>
> That's a great idea!
>
>> The Problem:
>> ============
>> Post hotplug/DLPAR events the capture kernel holds stale information about the
>> system. Dump collection with stale capture kernel might end up in dump capture
>> failure or an inaccurate dump collection.
>>
>>
>> Existing solution:
>> ==================
>> The existing solution to keep the capture kernel up-to-date is observe the
>> hotplug event via udev rule and trigger a full capture kernel reload post
>> hotplug event.
>>
>> Shortcomings:
>> ------------------------------------------------
>> - Leaves a window where kernel crash might not lead to successful dump
>>    collection.
>> - Reloading all kexec components for each hotplug is inefficient. Since only
>>    one or two kexec components need to be updated due to hotplug event reloading
>>    all kexec component is redundant.
>> - udev rules are prone to races if hotplug events are frequent.
>>
>> More about issues with an existing solution is posted here:
>>   - https://lkml.org/lkml/2020/12/14/532
>>   - https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-February/240254.html
>>
>> Proposed Solution:
>> ==================
>> Instead of reloading all kexec segments on hotplug event, this patch series
>> focuses on updating only the relevant kexec segment. Once the kexec
>> segments are loaded in the kernel reserved area then an arch-specific hotplug handler
>> will update the relevant kexec segment based on hotplug event type.
>>
>> As mentioned above this patch series implemented a PowerPC crash hotplug
>> handler for the CPU. The crash hotplug handler memory is in our TODO list.
> If I understand corrrectly, and based on the change in the patch 4/5,
> memory hotplug operations are ignored. Does this means that once this
> series is applied, the capture kenrel will not be able to work correctly on
> this hot plug/unplugged memory areas?
It will work because we will not remove the kdump udev rule to restart the
kdump service on memory hotplug until that feature is available in the 
kernel.


Thanks,
Sourabh Jain

