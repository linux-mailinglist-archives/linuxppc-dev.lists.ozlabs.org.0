Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB377EC9B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Nov 2023 18:32:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AThfPGmt;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SVqxP4X77z3cVD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Nov 2023 04:32:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AThfPGmt;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nnac123@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SVqwR3q7jz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Nov 2023 04:31:50 +1100 (AEDT)
Received: from pps.filterd (m0353726.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFHBQWm024563;
	Wed, 15 Nov 2023 17:31:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=lRpE02stQk88GIpSYMRp44y3Mt9CUYzOjPjDxCGAyJg=;
 b=AThfPGmtQ+sM6D8P1KHE040PPLIrrHLiFfKxDHG0WjezyH3AUjDeQ3l+ay7kwzMDaB+1
 TKmKV1RwpbW2I/OSMEvP6RT8w4RkPkdVW7S1t1Xd374qZu+DrzO1nT+PNnyLgfzCNMcR
 SVvuAk8muhtO9ksd7eH6IfRxNsfV/rV22z3OI7lbRVV5c86FmUTMXb6kRdM4/3WchtRB
 M+krv6kwTcoTL5NRUScXJF5GhayYstLR/Vvt/P2DfMlJlerBfqu7Jl8KM/WnrNro02i6
 mcLjsZUgxw2HG6OxGba4SHkkqze6V32+HjqqDn7vYMugG9yV1C41hfQGKINF/TFKWyCo EA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud1tf96s4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 17:31:41 +0000
Received: from m0353726.ppops.net (m0353726.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3AFHUH6O002814;
	Wed, 15 Nov 2023 17:31:40 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ud1tf96qp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 17:31:40 +0000
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AFG5fts018785;
	Wed, 15 Nov 2023 17:31:38 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3uanekrsmu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Nov 2023 17:31:38 +0000
Received: from smtpav06.dal12v.mail.ibm.com (smtpav06.dal12v.mail.ibm.com [10.241.53.105])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AFHVb8h24314270
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Nov 2023 17:31:38 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD4C658061;
	Wed, 15 Nov 2023 17:31:37 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73C0658043;
	Wed, 15 Nov 2023 17:31:37 +0000 (GMT)
Received: from [9.61.134.110] (unknown [9.61.134.110])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Nov 2023 17:31:37 +0000 (GMT)
Message-ID: <18be4145-732a-4e28-b7f1-94d367a54bd7@linux.ibm.com>
Date: Wed, 15 Nov 2023 11:31:32 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powerpc/pseries/memhp: Remove unbalanced
 dlpar_release_drc() call
To: nathanl@linux.ibm.com, Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>
References: <20231114-pseries-memhp-fixes-v1-0-fb8f2bb7c557@linux.ibm.com>
 <20231114-pseries-memhp-fixes-v1-2-fb8f2bb7c557@linux.ibm.com>
Content-Language: en-US
From: Nick Child <nnac123@linux.ibm.com>
In-Reply-To: <20231114-pseries-memhp-fixes-v1-2-fb8f2bb7c557@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: cSJ9NVEalbetuBm92Ty6SMsdqFLuMDog
X-Proofpoint-GUID: j39R70_86-fnNf-zBwBIL2ZaefnV9Y-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-15_17,2023-11-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 clxscore=1011 priorityscore=1501 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=757 spamscore=0 impostorscore=0 suspectscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311150136
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,
Patches 1 and 3 LGTM

Regarding this patch, dlpar_memory_remove_by_count() calls 
dlpar_add_lmb() and does not free drc on add error.
dlpar_add_lmb() is called here in error recovery so probably
not a big deal.

This is all new code to me but it looks like if the requested
number of lmbs cannot be removed then it attempts to add back
the ones that were successfully removed. So if you cannot add
an lmb that WAS successfully removed, it seems sane to also
release the drc.


On 11/14/23 11:01, Nathan Lynch via B4 Relay wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
> 
> Callers of dlpar_add_lmb() are responsible for first acquiring the DRC
> and releasing it if dlpar_add_lmb() fails.
> 
> However, dlpar_add_lmb() performs a dlpar_release_drc() in one error
> branch.  There is no corresponding dlpar_acquire_drc() in the
> function, nor is there any stated justification. None of the other
> error paths in dlpar_add_lmb() release the DRC.
> 
> This is a potential source of redundant attempts to release DRCs,
> which is likely benign, but is confusing and inconsistent. Remove it.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 6f2eebae7bee..ba883c1b9f6d 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -575,7 +575,6 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   
>   	rc = update_lmb_associativity_index(lmb);
>   	if (rc) {
> -		dlpar_release_drc(lmb->drc_index);
>   		return rc;
>   	}
>   
> 
