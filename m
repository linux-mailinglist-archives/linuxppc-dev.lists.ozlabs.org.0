Return-Path: <linuxppc-dev+bounces-14473-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74D14C8322E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Nov 2025 03:50:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dFnH91X3Dz2ynC;
	Tue, 25 Nov 2025 13:50:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764039013;
	cv=none; b=H8pCiIydSujgpt1L5tBYUFbGNroJ8OWjjoGb+Ms9fqLSpUQPEs0YgaBJMHrUzFYHMpnIwnPsvLmBqhvlifrj5oQUbF91ul0W7r90RaOO27dhk0gHn5eMZchYdYBMaujEtr7nKMGS4DZRqgiv5wE0IxSRkHsXwlN5EvjTcCecSi9UZZ/yTdewAFkJCxp0PvToPR/oIfUkOiWX0sfcqD/6ArD+l6shLfxNf0hN4+6+FUzUpfV9pwmihXo5DLY4YeL33g55v6lPyekwbczBbwPpS//A8HS1Lavmlg+Gp8krOJyQtNMk3CYTd7tpwHLT8U7rj7iJ/OPR5/3omPIoQApyLg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764039013; c=relaxed/relaxed;
	bh=xKjyz4RneUrDnrQ7mTRU3GVeR9LGMfWDjW6Tb5jMEb0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WLkZ0kuHtODbp2nwJ7PN3hZb6cFDAzx+e9Vr7BZPhgcnFs6/bDweEj+c2DtEDoS0tDM0vdvZbf/aP8UVMj5kMXcJzAGp6SaWjbyE1Mu15HRMJ+c+EUpYx4agFXAe8pI1WQNZgCuu98TYwKH55z37M1agGtJq+egni58qY7FYDCxr+uL6IYUXEfgWBiL0+QoW/8CwCY3uNEV4kTJv7XCbffij4claueHFgyLLmMN4pNTgtwPoaO8WrEAJf5+Q06T9wURIDmbvH7+yS5VJhHEBBP4AMwWlZM1A7NSYn3wq8b56wDwIlb3Kgd46CW8HLt+kSdeiEa47ZGw6LSlyaydbAQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IjCSEq6E; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IjCSEq6E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dFnH82Bgvz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Nov 2025 13:50:11 +1100 (AEDT)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5AOEAib9008068;
	Tue, 25 Nov 2025 02:49:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=xKjyz4
	RneUrDnrQ7mTRU3GVeR9LGMfWDjW6Tb5jMEb0=; b=IjCSEq6EpRpDumCjBfF166
	+8WHQhzmxCb77kydzPUoU992cofBiCT06Nj20YzYwqqrX1rxCsQozCVVPdJtU9ym
	WmLSvTFVP+70GKnEP9HUXo3XAG+T+ZaXIv5vp4WWaH1jJKZSq/Sxq/H4U628U+CH
	ITHUpvbzKym2BNIv2z4xQlw6HBRwODdYgj54//Gg0FZhJSGLDM57QQrrZ7b7ZJmB
	EsEFePcJucfG0eqbf4nLvJRPBjfCb+tz0BUIkgFVM4+EaG8L2yr7FKgrv2KgkNJs
	9gRWQWjpwchwJfx9SFgDlvvDxEHooQj+n/QZ1/LnySb1q2pvCFJ2sSRDZtDMEzrQ
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjtkx8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 02:49:56 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AP2nt9n026403;
	Tue, 25 Nov 2025 02:49:55 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ak3kjtkx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 02:49:55 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AP2ix7T016441;
	Tue, 25 Nov 2025 02:49:54 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aks0k12e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Nov 2025 02:49:54 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AP2nofd41812260
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 25 Nov 2025 02:49:50 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AFF92004B;
	Tue, 25 Nov 2025 02:49:50 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4292220043;
	Tue, 25 Nov 2025 02:49:46 +0000 (GMT)
Received: from [9.124.217.104] (unknown [9.124.217.104])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 25 Nov 2025 02:49:46 +0000 (GMT)
Message-ID: <e20dee2b-4876-4181-8b45-dc73b61e3202@linux.ibm.com>
Date: Tue, 25 Nov 2025 08:19:45 +0530
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] sysfs: Provide write method for paravirt
To: Steven Rostedt <rostedt@goodmis.org>, Greg KH <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
        mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com, srikar@linux.ibm.com, pbonzini@redhat.com,
        seanjc@google.com, kprateek.nayak@amd.com, vschneid@redhat.com,
        iii@linux.ibm.com, huschle@linux.ibm.com, dietmar.eggemann@arm.com,
        christophe.leroy@csgroup.eu
References: <20251119124449.1149616-1-sshegde@linux.ibm.com>
 <20251119124449.1149616-17-sshegde@linux.ibm.com>
 <2025112409-rockstar-shortcake-1892@gregkh>
 <20251124122459.00e86457@gandalf.local.home>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <20251124122459.00e86457@gandalf.local.home>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -79iRj2-JrP6jr9B556RsEIoX5MVEDQR
X-Authority-Analysis: v=2.4 cv=frbRpV4f c=1 sm=1 tr=0 ts=69251954 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=ag1SF4gXAAAA:8 a=AxvpoHRglf7U3UKQ--cA:9 a=QEXdDO2ut3YA:10
 a=Yupwre4RP9_Eg_Bd0iYG:22
X-Proofpoint-ORIG-GUID: BZmsMrQhdZqG3_AmKDqbgZ36SMMCIOXN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDAwOCBTYWx0ZWRfX3BFGulfSO0Q9
 FvxQqP4dyu86zGjCdBljjbROOfVSCsLt2qojrFCNzWvWuO+BaY7jCOH6/tsqieNDVCW9sTkiZJf
 9wt2kWd1m3/bB3TWozHOWaXU6tAcFSoGDvLJhVbgffR4EU9b3lHNG/C+/9ZbKqRAoSsuBGCFs2p
 fhF5eiObe/+0LuXrceTrlvq2btYfhJDx9smGvN4qmYxtIIxjBESWlYxhtLr64BcONNuApD7zT6a
 OYTLeGVhslI/FsZjBOlJjGePo3FaNt21tHTGlVE71aJv3fUivQVKFBTUAZmmy/F4S3jI/M3H7uA
 IecB6eU+cLRdvoSHIVL7p7mOdSri1388Wa9Ffaees12+otnGlsEFaF9tmsMP/kyKhMctaXdd51N
 +qA2tv9v/kT3EPvQxdJqNKxT2i5wxQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511220008
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 11/24/25 10:54 PM, Steven Rostedt wrote:
> On Mon, 24 Nov 2025 18:04:48 +0100
> Greg KH <gregkh@linuxfoundation.org> wrote:
> 
>> As you added this to this series, if it is picked up, it WILL be merged
>> :(
>>
>> Please try a "Nacked-by:" or something else to keep patches from being
>> applied.  Or better yet, send them as a totally separate series.
> 
> Agreed. But when I do this to a patch in a series, I usually add in subject:
> 
>    [PATCH 16/17][DO NOT APPLY!!!] sysfs: Provide write method for paravirt
> 
> in order to make it stand out, and not a footnote after the tags.
> 
> -- Steve
> 

I can follow this.

PS: I was skeptical after last series mistake.


