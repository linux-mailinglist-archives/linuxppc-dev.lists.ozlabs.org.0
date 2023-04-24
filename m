Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689A6ED0EB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 17:06:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4pNw1MJgz3fSH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Apr 2023 01:06:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTK4oTcl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4pN11zwtz3bg3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 01:05:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTK4oTcl;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4Q4pN04gdfz4x5c
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Apr 2023 01:05:20 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4Q4pN04TLMz4xFf; Tue, 25 Apr 2023 01:05:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UTK4oTcl;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4Q4pN01Kl0z4x5c
	for <linuxppc-dev@ozlabs.org>; Tue, 25 Apr 2023 01:05:19 +1000 (AEST)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 33OEeULd024589;
	Mon, 24 Apr 2023 15:02:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=qWjmJITQVbVjpvpbeY5cXPitIqrlOKrTeWepgG54gaU=;
 b=UTK4oTclpjNGjXT1xrxCG+ae3+tOwvN83eIOtC1bYg5OqfsNvVIJY9WCduNhfDVXrUx3
 iI7lK2mqP5Jpeqvb3dqO3cgAV5aeoAOftGfTrcvpmOQKjkyr8mX0OpX5hHpAjVuHSjf3
 g0iHPegtpQMCLUH+ohqRe1HffkI5UAWVwkQItKYhlTDYu0im5nlJHIZHv5U6uiTFDb4Z
 pSJKCq+oEK8/B+wSplRyTfjls+X4kHucyN2KC9WTmnrCzDEu+FThYrVgJyeuCLJsQsvz
 jVLvmpBZidEL0+efn9APCj6x8buXQe13tV7B1Jy9uPHRemYj7zbuxmsF9Eh+EbwmhCOf OA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q4510ryq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 15:02:36 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 33OEiknb023947;
	Mon, 24 Apr 2023 15:01:38 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3q4510rwg2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 15:01:38 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 33O5M67O022510;
	Mon, 24 Apr 2023 15:01:00 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3q46ug102f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Apr 2023 15:01:00 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 33OF0ugM13894330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 24 Apr 2023 15:00:57 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DBF3E20040;
	Mon, 24 Apr 2023 15:00:56 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 34C812004E;
	Mon, 24 Apr 2023 15:00:54 +0000 (GMT)
Received: from [9.43.100.55] (unknown [9.43.100.55])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 24 Apr 2023 15:00:53 +0000 (GMT)
Message-ID: <8a14c915-c121-c1c3-1d03-250ad571c840@linux.ibm.com>
Date: Mon, 24 Apr 2023 20:30:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v10 2/5] powerpc/crash: introduce a new config option
 CRASH_HOTPLUG
Content-Language: en-US
To: Laurent Dufour <ldufour@linux.ibm.com>, linuxppc-dev@ozlabs.org,
        mpe@ellerman.id.au
References: <20230423105213.70795-1-sourabhjain@linux.ibm.com>
 <20230423105213.70795-3-sourabhjain@linux.ibm.com>
 <c87ace32-b11d-8b60-50f5-584acc2bd824@linux.ibm.com>
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <c87ace32-b11d-8b60-50f5-584acc2bd824@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: NzirQfUcTCjkb1fLdSBKAXjtuyXHDeru
X-Proofpoint-ORIG-GUID: AiJCfFXlfSzpmmCC-n13nW8T9TV7qzPa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-24_09,2023-04-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 malwarescore=0 adultscore=0 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304240131
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
Cc: bhe@redhat.com, mahesh@linux.vnet.ibm.com, kexec@lists.infradead.org, Laurent Dufour <laurent.dufour@fr.ibm.com>, eric.devolder@oracle.com, hbathini@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 24/04/23 15:27, Laurent Dufour wrote:
> On 23/04/2023 12:52:10, Sourabh Jain wrote:
>> Due to CPU/Memory hot plug/unplug or online/offline events the system
>> resources changes. A similar change should reflect in the loaded kdump
>> kernel kexec segments that describes the state of the CPU and memory of
>> the running kernel.
>>
>> If the kdump kernel kexec segments are not updated after the CPU/Memory
>> hot plug/unplug or online/offline events and kdump kernel tries to
>> collect the dump with the stale system resource data then this might
>> lead to dump collection failure or an inaccurate dump collection.
>>
>> The current method to keep the kdump kernel kexec segments up to date is
>> by reloading the complete kdump kernel whenever a CPU/Memory hot
>> plug/unplug or online/offline event is observed in userspace. Reloading
>> the kdump kernel for every CPU/Memory hot plug/unplug or online/offline
>> event is inefficient and creates a large window where the kdump service
>> is not available. It can be improved by doing in-kernel updates to only
>> necessary kdump kernel kexec segments which describe CPU and Memory
>> resources of the running kernel to the kdump kernel.
>>
>> The kernel changes related to in-kernel updates to the kdump kernel
>> kexec segments are kept under the CRASH_HOTPLUG config option.
>>
>> Later in the series, a powerpc crash hotplug handler is introduced to
>> update the kdump kernel kexec segments on CPU/Memory hotplug events.
>> This arch-specific handler is triggered from a generic crash handler
>> that registers with the CPU/Memory add/remove notifiers.
>>
>> The CRASH_HOTPLUG config option is enabled by default.
>>
>> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
>> Reviewed-by: Laurent Dufour <laurent.dufour@fr.ibm.com>
> I can't remember having sent a review-by on that patch earlier.
>
> Anyway, I can't find any issue with that one, so replace with:
> Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

I apologies for mistakenly applying the "Reviewed-by" tag to the entire
patch series, when it was intended for only one patch. I will remove the
tag in next version.

- Sourabh Jain

