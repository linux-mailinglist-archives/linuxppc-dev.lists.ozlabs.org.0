Return-Path: <linuxppc-dev+bounces-5539-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC5BA1AF39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jan 2025 04:59:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YfPFr399dz2yyT;
	Fri, 24 Jan 2025 14:59:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1737691168;
	cv=none; b=Z4AdN7trPs91hn0sJaSviT2Mxkyp0JjB5PDgIdH1ibkoO7SPPvRsBI6Pt9VeAA+huNHpM2DSy/x0UAmH53cjVc6qezo39Ihv6NhyWFpoEu3ltuZTKITRbGBPkot5ozZh92s4K5pkP5bPAVaxIWdZDhfdFMSDJ9AmD3kSAqChJLv0Eq6qCqucA6OQnO7NV9LY9VATpI/FtZLm5GjhrvJLVCynT8QbUwhO+/znFw0VPFFToXLPRNGg051Lp9E8r+UaUpfNW6gnu9qJTUyPBrqZgI/utEOGIsnLvcjvpj9xOHVWpccMvjwFGrakW0dYxPbKAleCOcoTEZmqt5yvDa9fDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1737691168; c=relaxed/relaxed;
	bh=PHKnjI+lrvS08Rll41N8w103k216JgLWn0RXLHMKRfE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Yg2R+hJfHLCfVJxPgQoDLIunvsJmgsZAhVt3MjZ892QmH/T+LSYuurfWqtWoJ93OVD2qA6+lTCbVMccqmqO1E7w43VJyZBiiZzHjdlUxtyFAPdNUVWVpGSh1wXZkkRPYhSRQ3NAJ+rIklJuAQegLWJKxfJ2JHC0Qv+J4zO3IaFChfceMYB3W9eA6sZuIR2LHQ44cdn/JfyVHsl/7rsPVb3UvBxpv9CzbCgAWQ9eLJVfi1LEbcRwHirJhyhLgxsrjPnrnCMDdeswIW71KmEumt936FfjcJmt86/7vY+keXuORYUmPSj7lrOq6RQYoS5ZgjLpPKXBUy0BrNNwyN/+MTw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQc4uYLd; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rQc4uYLd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YfPFq3Fj2z2yb9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jan 2025 14:59:26 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50O2bACA002129;
	Fri, 24 Jan 2025 03:59:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=PHKnjI
	+lrvS08Rll41N8w103k216JgLWn0RXLHMKRfE=; b=rQc4uYLd9pqH6HZDCN42K8
	5Fax9U2Vj5c+Dtn5VLoGQwCuk7TCgVVAewz16QKyWmDco3klhDa+tXDMBhYdJvqU
	0UF4CuyUfDAER0kEx+E4D/k7khgZ9svhevTZyc7hV26v50JNLf+MJ1e+kNlQMGVg
	UackRwioo0G3REcWn332o725NXc3TfKPOffqfoYdO5yy232b5vIygCth7IZFWiLX
	UDNxw1O1w7GPmvWPGyN+HYdI4TiyWXO/Rt2K0E3ChU8q5Q1BM4n0b2Gs/w4tEfbc
	R2Rr5wzSsCpFiRDpE8/ajRZmLDr2LmAD8gucGVyM5s7MOh4d60TIfZAzBAccPAVg
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44brku2whf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 03:59:16 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 50O1qa6s029595;
	Fri, 24 Jan 2025 03:58:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 448qmnry0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 03:58:52 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 50O3wj3m64553426
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 24 Jan 2025 03:58:45 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AEA1B2004B;
	Fri, 24 Jan 2025 03:58:45 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 463DE20043;
	Fri, 24 Jan 2025 03:58:44 +0000 (GMT)
Received: from [9.109.204.94] (unknown [9.109.204.94])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 24 Jan 2025 03:58:44 +0000 (GMT)
Message-ID: <7fdbd0b2-9738-4b36-b025-d35a84c29f5d@linux.ibm.com>
Date: Fri, 24 Jan 2025 09:28:43 +0530
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] powerpc: increase MIN RMA size for CAS negotiation
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        Avnish Chouhan <avnish@linux.ibm.com>
Cc: mpe@ellerman.id.au, brking@linux.ibm.com, meghanaprakash@in.ibm.com
References: <20241206065545.14815-1-avnish@linux.ibm.com>
 <173754932979.1094869.8339209003148586969.b4-ty@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <173754932979.1094869.8339209003148586969.b4-ty@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 8CdAiL1X51ma6M0hfMLesaxUv0FCQw_r
X-Proofpoint-GUID: 8CdAiL1X51ma6M0hfMLesaxUv0FCQw_r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=998 clxscore=1015 lowpriorityscore=0
 spamscore=0 malwarescore=0 phishscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240026
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hello Maddy,


On 22/01/25 18:13, Madhavan Srinivasan wrote:
> On Fri, 06 Dec 2024 12:25:45 +0530, Avnish Chouhan wrote:
>> Change RMA size from 512 MB to 768 MB which will result
>> in more RMA at boot time for PowerPC. When PowerPC LPAR use/uses vTPM,
>> Secure Boot or FADump, the 512 MB RMA memory is not sufficient for
>> booting. With this 512 MB RMA, GRUB2 run out of memory and unable to
>> load the necessary. Sometimes even usage of CDROM which requires more
>> memory for installation along with the options mentioned above troubles
>> the boot memory and result in boot failures. Increasing the RMA size
>> will resolves multiple out of memory issues observed in PowerPC.
>>
>> [...]
> Applied to powerpc/next.
>
> [1/1] powerpc: increase MIN RMA size for CAS negotiation
>        https://git.kernel.org/powerpc/c/ae908b87b6bb32c170e9baf5858f2a7553cacc06
I posted a patch series that includes this patch along with patches to 
avoid the impact on fadump due to the `MIN_RMA` change introduced in 
this patch. 
https://lore.kernel.org/all/20250123114254.200527-1-sourabhjain@linux.ibm.com/ 
The patches in the above patch series are arranged to ensure they do not 
break `git bisect`. Previously, we tested this patch and the fadump 
changes together but sent them separately, which I now realize was not 
the best approach. If possible, please consider accepting the entire 
patch series as a whole. 
https://lore.kernel.org/all/20250123114254.200527-1-sourabhjain@linux.ibm.com/ 
We have included test cases for the above patch series and a changelog 
explaining additional details in the cover letter. Please let me know if 
you have queries regarding this. Thanks, Sourabh Jain

