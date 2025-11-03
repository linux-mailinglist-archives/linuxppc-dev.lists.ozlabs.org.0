Return-Path: <linuxppc-dev+bounces-13685-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8AC2A033
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 05:06:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0J1N2S4Mz30T8;
	Mon,  3 Nov 2025 15:06:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762142792;
	cv=none; b=laEAcPUvNKk2NqpW8zFSv7IUhkrILs1Zj0dLMZg27R4bZnu5eoJbRc64rSe584gGECqUMfXpuuabr99ErNJnGK9IvOo/4yZLXZdYMAUtpBR/v9uJRBn47toJ2vCjvUcwYPMInAI+5zTjwb4EAvsiatFa2/zccq7ntHD45iGkHmq7Q38yheIQOuWk0b+vCcf6BIDbYOX7K3q8IFOy3kcJS2EkOWNJU4KqSBU3wlY3sYLVQ5YMZx9aP+8S4hZW+Jg3ODqdHgvjteG16gl4swWjMiTUX1bfO744+fBxWCU/nP6RSKigVwU/arrIxebQ0cvafyLe8Tg96RPGMP8C3AHAew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762142792; c=relaxed/relaxed;
	bh=Gp3LO3JSAAJ3CiS2p3c1TTULppsm8XBrS//nRiW1OTo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kfPDH4YDm5pHcKkHLxnjm4NypaBFIuRRujefL5H2dFU54qO1MBwS713K08z0eSgabxT3T5r0rZIIE6SRF+HxNxY66XEIuFoLGnIH1sy9Gy5Z/hQYguAS3Djz6kSZAJHUqND/TUydb/ibIbBq05vVG9XbizL3F6hM6PuyJsoEL1qKwU3epNqSD2n7n6xnfOAIztSLHSU4FQVEhQDUF7nBdtI1+mt8aostGx2aEbn6CNjoJ+eY3mbLX674jDQGRjtgQefPqMiR4Hs2XxznWHhFMoJgMRNTX/5MJewH6HWbiyFKb1VScyT1GVNfPg+Ku9dqaB2TSnMCZhrNQ7MFcE3+lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EO+0uQzE; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EO+0uQzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0J1M37Fhz30RN
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 15:06:30 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2CiFWA004157;
	Mon, 3 Nov 2025 04:06:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=Gp3LO3
	JSAAJ3CiS2p3c1TTULppsm8XBrS//nRiW1OTo=; b=EO+0uQzEsu+a2b1fOaLwGT
	LhGkS+Qy/ovhmstC0eI1ihXOrlBQadSK60J9YPRWBeRVGGytZRo7RlVbpwkVU1yT
	Mj01kYaVwHSMVdxd+n+B0g2iov5Js9pr2BKW+k/WiPuerrwJvzQHwtXELK8mDQoF
	x9a3Kgw03M13tAtJtEzNAi7tja85ULIgBx3XJvpXo97+IsP5CY+iTTRmOBTemJzK
	jl0ZLV9Nju7wmKuSgZCJkiWzyNYnYKou44MZZCUwc2IulZaWYKIDG9221DaA+jXp
	aTs73hHgKlv73VJ/3VX+Ck5Xisdnu2se2ENNf9kEaBxR/XVR+W13xYSFyE6AmyVA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mqw0pj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 04:06:21 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A343Bgc010553;
	Mon, 3 Nov 2025 04:06:20 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a57mqw0pg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 04:06:20 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A2MUTPB021515;
	Mon, 3 Nov 2025 04:06:19 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrjbhkh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Nov 2025 04:06:19 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A346GsR14352856
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 3 Nov 2025 04:06:16 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 03C8D2004D;
	Mon,  3 Nov 2025 04:06:16 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1CC8520040;
	Mon,  3 Nov 2025 04:06:14 +0000 (GMT)
Received: from [9.109.204.116] (unknown [9.109.204.116])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  3 Nov 2025 04:06:13 +0000 (GMT)
Message-ID: <dfc0f589-5449-4546-9df9-0997cb389631@linux.ibm.com>
Date: Mon, 3 Nov 2025 09:36:13 +0530
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
Subject: Re: [PATCH v4] powerpc/kdump: Add support for crashkernel CMA
 reservation
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        linuxppc-dev@lists.ozlabs.org
Cc: Baoquan he <bhe@redhat.com>, Jiri Bohac <jbohac@suse.cz>,
        Hari Bathini <hbathini@linux.ibm.com>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Shivang Upadhyay <shivangu@linux.ibm.com>
References: <20251030100955.1453314-1-sourabhjain@linux.ibm.com>
 <87o6pn7mfp.ritesh.list@gmail.com>
 <c6ce9b94-1126-49fd-869b-76a7e386a7d1@linux.ibm.com>
 <87ldkr72sq.ritesh.list@gmail.com> <87jz0b7213.ritesh.list@gmail.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <87jz0b7213.ritesh.list@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 832j3NOl902a1vHvRqjA0gMpOxgqICDc
X-Authority-Analysis: v=2.4 cv=MKhtWcZl c=1 sm=1 tr=0 ts=69082a3d cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=pGLkceISAAAA:8 a=JGF0Zl2KdhUpRc-_v9AA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: 4HAXenNyfmYq_17slp3XtW9IvYa3poN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAwMSBTYWx0ZWRfX4o3JBqzrCtf6
 C+4dteWIimLE/uEMGcacjYZBCclKIaSC1AEjOChvLEUE+W3Hz3ebZtm+EYLiZ45vfgRvqbNWghX
 WryGMc/Vf/XY3DBfI5RlT8CB2iMJPN5uAo2ND00wI+YUXU47gQrB4pcaFmHCM3P+8J80E64Dif0
 ewJBPh58ri+/g7racaO7eLLezUhk5JfsWxw76DTGqQ+CXau03Wls3Mf6i5LFWbHDdcdMlZGWAv9
 rjVOlT+uarhEKWlMB1ijpZYuJ2uL/w8glxhF4XMQCtz+ngOrFQG7N35i8tBXn5XwkQey0DzoMfu
 rHUQHKvYWAJldSBvlhm+4YWlrsdJdE5HVRtzGkKDD6oRKXNZ4bnkOylf6t7Xv7Z7IDMn9NXztjr
 SKV1JBLYVkAuOVkjrOPr2BNZpjsKnA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-02_02,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 31/10/25 16:48, Ritesh Harjani (IBM) wrote:
> Ritesh Harjani (IBM) <ritesh.list@gmail.com> writes:
>
>>>> I am not much familiar with the crash kernel workings but was curious
>>>> about the following query related to this patch:
>>>>
>>>> As I understand this patch allows for the remaining crash kernel
>>>> memory to come from CMA region. But do we limit the CMA region to be lower
>>>> than 4G?
>>> No we are not and we don't need to.
>>>
>>>> Is this patch dependent over your other patch series [1] which
>>>> supports high crashkernel reservation?
>>>>
>>>> [1]: https://lore.kernel.org/linuxppc-dev/20251027151338.819957-1-sourabhjain@linux.ibm.com/
>>> No, this is an independent patch.
>>>
>> Say, if we are in Hash mode and if the CMA reservations have come from
>> higher addresses. Will that work with kdump kernel when it boots with Hash
>> mmu? Because memory region beyond RMA is not accessible in Hash correct?
>>
> Oh sorry my bad! I think I got the answer to above question now.
> So this feature allows us to reserve the "extra memory" using CMA which
> is mainly used to serve the kdump kernel's memory allocation requests.
> So we will have two memory reservations i.e.
>
> crashkernel=64M,crashkernel=1G,cma.
>
> So the second 1G cma reservation is mainly to serve the kdump kernel's
> memory allocation requests to avoid the ooms. And this will only be
> required once the MMU is initialized, so we don't have those RMA
> restrictions which are only during early init time (before Hash is
> initialized).
Yes, exactly. The regular reservation will be done as usual, and the kdump
image (vmlinux, initrd, dtb, etc.) will be loaded in the regular crashkernel
reserved region. So, no impact is expected due to the MMU type in use.

- Sourabh Jain


