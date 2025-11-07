Return-Path: <linuxppc-dev+bounces-13920-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A47C3EB8F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 07 Nov 2025 08:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2r2d1CHpz3bt1;
	Fri,  7 Nov 2025 18:16:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762499785;
	cv=none; b=NDXJ1zVraCn+UrKOuHx/ihKkPsxwwCQk/tygstwSjT61kT+JryNTez3B7jATh/VlWpzLpocznFVe/JhYuTE0Sw2MmwWLCQX2EEaeyD0ehWMWdVQYR8aMUbfbK/OmTPDm8Z1u+X79dA4BWcZcZHVogC8a3Rsmh6H+joKMUlKEj9XbQDK1m70IHRfUiy6hK5koyNrs5W0DV5pAzjg7twzKbiht7kqTgjb+aTT3gH3tYYKi3ECBrGIi5OuCYd0UNsMRP+ds9Kn6iebDaAmCW9xyWJPhqDh8iCxGrXOmipYplBqrHXRyy/oc8rNwi95/r2CQwqo3EJI/9P3zjm5SCtZ0lA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762499785; c=relaxed/relaxed;
	bh=X3HaBkZ0Y16/ZOvlCHIH11hsAoruhXZ8XfKm+QVi5aM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lWCpgDZmdWfnyGPQfFRcscnEMOwl3oimZUsHf911IpYPHf8bzsFgTAjvkjADPvLTOsUsDnxL+vU8nccri44j0DleGpcuh6TZEMI56gnsVq+Hqm+gz01L38gCPgXfsJBsAyTOcOiCEoVirAvETyrlLpKiQ9GWzLxr5RG/m+N5GjvpBCjXeurJwAT6SpgKausa5trw+2fDNEZNXj20J832xZvetgVIMRV9VAvE0zMoVwuK10J1S3av8b8C4EPBVQbGEOpO3qR/XGTAg6ADVrvVTP9o7hmloKK83If95fFxQ3kO3cXUF+ryhmvGRJLkNMKl0Gb8Iq1yoGmaGfxHaCwxGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1uXRAZv; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=g1uXRAZv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2r2c0c8kz2yjm
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 18:16:23 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5A72iEV9006421;
	Fri, 7 Nov 2025 07:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=X3HaBk
	Z0Y16/ZOvlCHIH11hsAoruhXZ8XfKm+QVi5aM=; b=g1uXRAZvhO00wkg9gfZaLB
	s2x+5PQOb2Uysd5rt5bAr46EJn6qtjf2cKf7hn7zWXyZa1V2QBYoiZJsxKFamLsv
	z0g2oLbKk/IG0xAAVH0V1vaLDKuBCfoJlv68VaxPRWWgaprKp9Y1nr3oMUTMELDP
	ZCtQuGKK7Z8HQtVDoyo5/7mCfpYkEVdJF6LXaXEEQ37YsT1ujEYpV5Fmj5iHVTCk
	Tu5ocYQt4O+K91q6sM4aCs1SLtdVrnAVl29ksm3Dqstspqnt8CAv+e8zPpLVv/4V
	W56iwJbD1RriLgo650k/xeJm2RqObnGwFVPal4mj2PuoB1CQdvg9PacHc5uidjiw
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xcbb9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 07:16:10 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5A77GA2s032292;
	Fri, 7 Nov 2025 07:16:10 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4a59xcbb9a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 07:16:10 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A7476K8021483;
	Fri, 7 Nov 2025 07:16:09 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4a5xrk1b2u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 07 Nov 2025 07:16:09 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5A77G5pw52953528
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 7 Nov 2025 07:16:05 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F3E6A20040;
	Fri,  7 Nov 2025 07:16:04 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CCD6E2004F;
	Fri,  7 Nov 2025 07:15:56 +0000 (GMT)
Received: from [9.124.216.224] (unknown [9.124.216.224])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri,  7 Nov 2025 07:15:56 +0000 (GMT)
Message-ID: <f2c83fff-a5cd-4894-8014-f6b289e89019@linux.ibm.com>
Date: Fri, 7 Nov 2025 12:45:55 +0530
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
Subject: Re: [PATCH v2 5/5] crash: export crashkernel CMA reservation to
 userspace
To: linux-kernel@vger.kernel.org
Cc: Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
References: <20251106045107.17813-1-sourabhjain@linux.ibm.com>
 <20251106045107.17813-6-sourabhjain@linux.ibm.com>
Content-Language: en-US
From: Sourabh Jain <sourabhjain@linux.ibm.com>
In-Reply-To: <20251106045107.17813-6-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTAxMDAyMSBTYWx0ZWRfX3oDTbhKli8Pr
 8f3nXufGk75pmFiqgvo+8HUCiOmHeuWSqOrKGikPbqeDyF1e9JbxyevdXxdCoy8VLF5g9dR3TgN
 VvAQR4x02lVDcl8Xwl54XUzu50sjEXV/TioDeRfocmo6XSRSWKQlz7U2Tjp6H+XCa7VJPZ4pQ1V
 f1tO7U5RRJF0pxWDQZVjX10KmQhgg93oSdnhW1zkwt+l/edylINS6gFLcHSULR5hOHIaZ1bND0H
 pzF1p57c968iSrEHS8hReLTAZh8rh6JVu24boNv7Tg85l1AMEW7oi/N8UhhypFBbA6wqusptBUQ
 tdfU2j7iJdMUSESAMCalttCmPdVcyuqe4alTlpHMl4oGZVAhBKxUeEJS6kMkGue1sBW1ULcZepk
 P9VU5kpN6DSKusZlFrzsZD2fCZaOZA==
X-Proofpoint-GUID: 14-cE65UTlpF7D9vFBtjFK4_BH7bS4Ih
X-Authority-Analysis: v=2.4 cv=OdCVzxTY c=1 sm=1 tr=0 ts=690d9cbb cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8
 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8 a=kZwJjtJCwpCGEqBlNKsA:9 a=QEXdDO2ut3YA:10
 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22 a=1CNFftbPRP8L7MoqJWF3:22
 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: beCPzcuNJC0uG_6u3WqdW1RYVTuinS_S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-07_01,2025-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510240000 definitions=main-2511010021
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 06/11/25 10:21, Sourabh Jain wrote:
> Add a sysfs entry /sys/kernel/kexec/crash_cma_ranges to expose all
> CMA crashkernel ranges.
>
> This allows userspace tools configuring kdump to determine how much
> memory is reserved for crashkernel. If CMA is used, tools can warn
> users when attempting to capture user pages with CMA reservation.
>
> The new sysfs hold the CMA ranges in below format:
>
> cat /sys/kernel/kexec/crash_cma_ranges
> 100000000-10c7fffff
>
> Cc: Aditya Gupta <adityag@linux.ibm.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Baoquan he <bhe@redhat.com>
> Cc: Dave Young <dyoung@redhat.com>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Jiri Bohac <jbohac@suse.cz>
> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
> Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
> Cc: Pingfan Liu <piliu@redhat.com>
> Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
> Cc: Vivek Goyal <vgoyal@redhat.com>
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
> ---
>   Documentation/ABI/testing/sysfs-kernel-kexec-kdump | 10 ++++++++++
>   1 file changed, 10 insertions(+)
>
> diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> index 00c00f380fea..f59051b5d96d 100644
> --- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> +++ b/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
> @@ -49,3 +49,13 @@ Description:	read only
>   		is used by the user space utility kexec to support updating the
>   		in-kernel kdump image during hotplug operations.
>   User:		Kexec tools
> +
> +What:		/sys/kernel/kexec/crash_cma_ranges
> +Date:		Nov 2025
> +Contact:	kexec@lists.infradead.org
> +Description:	read only
> +		Provides information about the memory ranges reserved from
> +		the Contiguous Memory Allocator (CMA) area that are allocated
> +		to the crash (kdump) kernel. It lists the start and end physical
> +		addresses of CMA regions assigned for crashkernel use.
> +User:		kdump service
While rebasing the v1 patches, the hunk that adds the show function 
didn't get picked up.
I will send v3 with a show function to export the crashkernel CMA 
reservation.

- Sourabh Jain

