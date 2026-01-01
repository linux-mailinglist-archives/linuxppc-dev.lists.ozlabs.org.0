Return-Path: <linuxppc-dev+bounces-15110-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD20CECE94
	for <lists+linuxppc-dev@lfdr.de>; Thu, 01 Jan 2026 10:08:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dhgwr6wkMz2xqr;
	Thu, 01 Jan 2026 20:08:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767258524;
	cv=none; b=L2+Me94uFmxOrmC61ObXeik/eDkXnXNaqoicUaeaM8mFf5n5zlgL1zbbgawLEGHJedBT0DsQ1PdiEGdYSREIq46muxFD0WhSPHoQ72OBI8velW8qA+jLqE9DB8HLKhgPkpANl5wGpM1a3FIzdNd9wrUzgxqbeNP52yE61spxX01RQ9axQeseKB1N/98eXwr4TjoFskJmP125UXUfAQun6tA0GBHFsUIQ8UfNvPrshLnIFKgVHP8qvXJLzInn8MhOiKA3LuiIIBSwusZZ+CU9XrRCHXdHFXTfW2hUV6SWnVhQlIaWCNc77veEZkpwou2Cbwmggfl3/cIF7vIy6GJUVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767258524; c=relaxed/relaxed;
	bh=JBI3eWcDhRXqy/khaOaQrNVW2rEpsnvBm/qaAF1gHVA=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=UPINHa1JyjbLyWOF5a708dOkYEgwRuwDe23c7NQIco90y6oSE8hO/kLdnWknYnFxcxK816j+exrCaVvBZiVUa/3jbQUf4Mh/NkMXp96tPwLZuQMm8Pzcuy/SMAJ0YFRsHvfOLtLE5s6McT2HFIS1D0xFw40EvTnYzjTRbymPKB+tQIKRLMEiY5fdUddjTcZ1sFvK0we70Vs9NgWldr44mu5E5Ap/or/lXvEF+zO+uH4nuGN4czmfGerDFXCz+E/NMPF2HId1Zo4VjM6rs4hROgKDrb/Ou6S0WjIvCl4sBX2wlXElqhHGq69/g62D5ygFaFuXXkAB/RHs62RFUmxZJQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K6m+SegR; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=K6m+SegR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dhgwq227jz2xP9
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Jan 2026 20:08:42 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5BVHGwaD023642;
	Thu, 1 Jan 2026 09:07:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=JBI3eW
	cDhRXqy/khaOaQrNVW2rEpsnvBm/qaAF1gHVA=; b=K6m+SegRe5eQD8arI4tslc
	bTkpEAt2hEazbwS9jIs7l0OUYskHv95AmXebACD8ZR1igZeYYu0osFQiCBX80/9F
	/B4LeQPIizzynYr5cEYAlj4e/WggyUGb1eOmxcCCl58dh4EvuIRHgMGX3hi1E+hi
	MVhtO1fYTeVgDbNHr692SzKGVL/yY2NwZTrJPvoR19qDUyp/FFOTPoHf5cLTzr1/
	f3IkzeQRvy1BwnSahgHZuU6uoOqvfahA1rmSwgGa2FCKnCpApVn0EijUJvdMh8zB
	igkIMosxTfzjBVMlJO4ZfGSIzvJuRJ4YPlElelHnaJgcQ/c02DC6qTuqDzmtMrhw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w1176-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 09:07:53 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 60194hbW011567;
	Thu, 1 Jan 2026 09:07:52 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ba73w116y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 09:07:52 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 6016kPtK026066;
	Thu, 1 Jan 2026 09:07:52 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4batsnj3jg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jan 2026 09:07:51 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 60197lHe49938720
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jan 2026 09:07:47 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A84E20043;
	Thu,  1 Jan 2026 09:07:47 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7500420040;
	Thu,  1 Jan 2026 09:07:42 +0000 (GMT)
Received: from [9.124.213.107] (unknown [9.124.213.107])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jan 2026 09:07:42 +0000 (GMT)
Message-ID: <06f2a88f-3425-4b0e-b17a-b858d81ee6c9@linux.ibm.com>
Date: Thu, 1 Jan 2026 14:37:41 +0530
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
Subject: Re: [PATCH v3 0/8] Generic IRQ entry/exit support for powerpc
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        chleroy@kernel.org, oleg@redhat.com, kees@kernel.org,
        luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
        thuth@redhat.com, akpm@linux-foundation.org, macro@orcam.me.uk,
        deller@gmx.de, ldv@strace.io, charlie@rivosinc.com,
        segher@kernel.crashing.org, bigeasy@linutronix.de,
        peterz@infradead.org, namcao@linutronix.de, tglx@linutronix.de,
        kan.liang@linux.intel.com, mark.barnett@arm.com,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: iQM028ehJCgVZx9s5ftRGuQhNFeLrtTO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAxMDA3NiBTYWx0ZWRfX02m3lhG+MA92
 ekDuXpuLXM1isLPhBm2l89bPKxoi2Hvw6gMi5q9JtieaWgIhZzIRozXEwJu1zj9TGLop3Gr7cie
 VF4qY5qYi6i9BggfBvirzcoxE7NLx/dPozo2CPAj3mIWFbk0mEt9b2U4Yi5G3g2jUa438PAowKI
 7zRVrgs+YzNG8MdKOZ1xfOpI9baT68rWk7Ae9arPKwrBXq3051pXPlFeqGhjCXSfCaR0GWYCUXK
 wE5sCQR6SCG14+1QYSVKIoAq0sJ2kDm7NumurbQKASm9GPHURyFWj3RL/aHfgAPPbRT1m1j89V6
 m0n9aNeuFHr0aQThBkPitUn2woT7m1wl1zb8+iDg7+jitTqTc/VKEeb8tBXUTzQgxNJiUE0bbjJ
 HWs9H6cwpHP/XhsmpfzCYrrumoQxNttQaHbW+7/g0t+A7hNRCyi+DFpxOX9bTEBafkTczodr7Z3
 ux5j7dpqkfhMsX+sbAg==
X-Authority-Analysis: v=2.4 cv=fobRpV4f c=1 sm=1 tr=0 ts=69563969 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=YeFUuKBjOhAlLW-_KEAA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: JD648SEgIguMHAfODS7ypHVP2tovywNn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-01_03,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1011
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2512120000 definitions=main-2601010076
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 12/29/25 10:24 AM, Mukesh Kumar Chaurasiya wrote:
> Adding support for the generic irq entry/exit handling for PowerPC. The
> goal is to bring PowerPC in line with other architectures that already
> use the common irq entry infrastructure, reducing duplicated code and
> making it easier to share future changes in entry/exit paths.
> 
> This is slightly tested of ppc64le and ppc32.
> 
> The performance benchmarks are below:
> 
> perf bench syscall usec/op
> 
> | Syscall | Base       | New        | change % |
> | ------- | ---------- | ---------- | -------- |
> | basic   | 0.173212   | 0.133294   | -23.05   |
> | execve  | 363.176190 | 357.148150 | -1.66    |
> | fork    | 853.657880 | 840.268800 | -1.57    |
> | getpgid | 0.174832   | 0.135372   | -22.57   |
> 

Could you please add a description for whether its an improvement
or regression.

Looking at it, it seems time taken for operation to complete. So it is
an improvement. Seeing negative numbers one might think its a regression.

Also, are these average numbers?
Could you get the numbers with preempt=lazy and with context tracking on?

> perf bench syscall ops/sec
> 
> | Syscall | Base    | New     | change % |
> | ------- | ------- | ------- | -------- |
> | basic   | 6006021 | 7502236 | +24.91   |
> | execve  | 2753    | 2800    | +1.71    |
> | fork    | 1171    | 1190    | +1.62    |
> | getpgid | 5942117 | 7387040 | +24.32   |
> 
> IPI latency benchmark
> 
> | Metric         | Base (ns)     | Test (ns)     | change % |
> | -------------- | ------------- | ------------- | -------- |
> | Dry-run        | 206652.45     | 209317.37     | +1.29    |
> | Self-IPI       | 3567895.23    | 3590444.77    | +0.63    |
> | Normal IPI     | 148570416.17  | 148564173.40  | -0.00    |
> | Broadcast IPI  | 4033489673.38 | 4007319512.62 | -0.65    |
> | Broadcast lock | 4011023005.48 | 4010267885.93 | -0.02    |
> 
> 

