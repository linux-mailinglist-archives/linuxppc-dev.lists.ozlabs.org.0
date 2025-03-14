Return-Path: <linuxppc-dev+bounces-7049-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9234AA60D51
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Mar 2025 10:30:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZDfHL02JFz3cYd;
	Fri, 14 Mar 2025 20:30:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741944637;
	cv=none; b=ClVdSIEUfTnC1N1UgAyMcMtz+zxuMnKK1oeHkw3ZCKNTmHGqOeHXiiPcZG1A1NMCifhkKYRWevaaefksfQEYu4xB0gSGjCxoKP//z0YBSnlHPv7vY19ZERSgN+a1GLGHYcY5gkTRuegwi2EtO2yzau1hAAkBs9T2g+oCtQrYG/D7F6ydC0FnRMDm6UnHFlcSlt3kNWBWQ83OvES0wEA5l1e4asmRX9hNEkHD7bqVNGgmRBm4aeAjUaH6ijbYtZPcfEANZfONEDZk1qDu1z2EuM/j1npD3Z93foDrVf3QY92X125Pbag+/XpgZDcNtWLYRJLd5PiarDvG+elULwLUJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741944637; c=relaxed/relaxed;
	bh=0z9Fz611KVkxjRCjoMRWDKqzm00u/P597760U7VRVFc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BCL660C05OzRER0OR7sx6fBeYGfoC5Pn6Pg/+ZcVz6ufflrmVe6S4aJID5ZhImzwk7W+iwo1Sgi5dFMM5vHLusCCTnh7XsB+Is9NDh6iFELVtzRFeVC4mlgW061G1egQjrRtRcA9joybQneDPHJ0q493mzBgRgKiUEvTgGwLmU5Y1nj5SuzO1/L6tpV5HYntsctgSw8UNZw69r8KdH9wcUZrVZTr6nqGTZfCqKBQp6B5SfbW5QDP0TlcovmBXBxKaUnKq1eHyCp5oaG1Sl3jzB9QpxrHwQFL038qGbiZ/UcEC+++bwyhnM3CVFfINUDxHz4+NU7RPE5dKWg49HAwug==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lczH0/RB; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=lczH0/RB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sshegde@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZDfHK1TSwz3cX4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Mar 2025 20:30:37 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52E3joJe019686;
	Fri, 14 Mar 2025 09:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=0z9Fz6
	11KVkxjRCjoMRWDKqzm00u/P597760U7VRVFc=; b=lczH0/RBAoP3ow5/eGx7Wh
	vFl6rjx/VeV2hLnBTUzXiksLl6Eqb7hsX1IgnYKxTzU3JWnKEl8Wvt7RM+YSbxhM
	D3E/9B4xFNwcMs/7SYhcGEvZE1k5DeW5sZc4TpOP/Qpnzv0VwgsoIvcAklzRGmZI
	PYV3DbgcdbNn81rbE6utg0twiX8/c1iIGkCyMQkYaLB6PQBw7VKVjA9maeDE5bAH
	H2M7ZgV1C+Bg/Bnj6LLY/2RM/8Y+uvxUJ39g9c/IKTxP3hN56b6+6cv6GmLQmU60
	lsa3d1LCoH8Ec6MKiV5ybEIbAQSlh2bmvQj2FVKXf2xmYmE7jNh4ECK0xl67fJkA
	==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ccu99d8e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:30:26 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 52E9R3KJ021389;
	Fri, 14 Mar 2025 09:30:25 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45ccu99d89-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:30:25 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52E8F9at026047;
	Fri, 14 Mar 2025 09:30:24 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45atspp9g5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Mar 2025 09:30:24 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52E9UKuu33882844
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Mar 2025 09:30:20 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADB372004E;
	Fri, 14 Mar 2025 09:30:20 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DB27C2004B;
	Fri, 14 Mar 2025 09:30:17 +0000 (GMT)
Received: from [9.39.22.126] (unknown [9.39.22.126])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Mar 2025 09:30:17 +0000 (GMT)
Message-ID: <d6999d74-45f6-413a-8881-90473b322dfa@linux.ibm.com>
Date: Fri, 14 Mar 2025 15:00:17 +0530
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
Subject: Re: [PATCH 5/6] powerpc: powenv: oxcl: use lock guard for mutex
To: ajd@linux.ibm.com
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, mpe@ellerman.id.au,
        peterz@infradead.org, fbarrat@linux.ibm.com, mahesh@linux.ibm.com,
        oohall@gmail.com, hbathini@linux.ibm.com, dhowells@redhat.com,
        haren@linux.ibm.com, linux-kernel@vger.kernel.org, maddy@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
References: <20250314054544.1998928-1-sshegde@linux.ibm.com>
 <20250314054544.1998928-6-sshegde@linux.ibm.com>
From: Shrikanth Hegde <sshegde@linux.ibm.com>
Content-Language: en-US
In-Reply-To: <20250314054544.1998928-6-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: h0Cja2C6vajM78wzlm82GdfRq8oqmFfd
X-Proofpoint-GUID: ZvhqgWL-NRe9f7ZJNClqRDnR7vkRLAgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-14_03,2025-03-13_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=852 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503140071
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



On 3/14/25 11:15, Shrikanth Hegde wrote:
> use guard(mutex) for scope based resource management of mutex.
> This would make the code simpler and easier to maintain.
> 
> More details on lock guards can be found at
> https://lore.kernel.org/all/20230612093537.614161713@infradead.org/T/#u
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   arch/powerpc/platforms/powernv/ocxl.c | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/powernv/ocxl.c b/arch/powerpc/platforms/powernv/ocxl.c
> index 64a9c7125c29..f8139948348e 100644
> --- a/arch/powerpc/platforms/powernv/ocxl.c
> +++ b/arch/powerpc/platforms/powernv/ocxl.c
> @@ -172,12 +172,11 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
>   	if (phb->type != PNV_PHB_NPU_OCAPI)
>   		return;
>   
> -	mutex_lock(&links_list_lock);
> +	guard(mutex)(&links_list_lock);
>   
>   	link = find_link(dev);
>   	if (!link) {
>   		dev_warn(&dev->dev, "couldn't update actag information\n");
> -		mutex_unlock(&links_list_lock);
>   		return;
>   	}
>   
> @@ -206,7 +205,6 @@ static void pnv_ocxl_fixup_actag(struct pci_dev *dev)
>   	dev_dbg(&dev->dev, "total actags for function: %d\n",
>   		link->fn_desired_actags[PCI_FUNC(dev->devfn)]);
>   
> -	mutex_unlock(&links_list_lock);
>   }
>   DECLARE_PCI_FIXUP_HEADER(PCI_ANY_ID, PCI_ANY_ID, pnv_ocxl_fixup_actag);
>   
> @@ -253,12 +251,11 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
>   {
>   	struct npu_link *link;
>   
> -	mutex_lock(&links_list_lock);
> +	guard(mutex)(&links_list_lock);
>   
>   	link = find_link(dev);
>   	if (!link) {
>   		dev_err(&dev->dev, "actag information not found\n");
> -		mutex_unlock(&links_list_lock);
>   		return -ENODEV;
>   	}
>   	/*
> @@ -274,7 +271,6 @@ int pnv_ocxl_get_actag(struct pci_dev *dev, u16 *base, u16 *enabled,
>   	*enabled   = link->fn_actags[PCI_FUNC(dev->devfn)].count;
>   	*supported = link->fn_desired_actags[PCI_FUNC(dev->devfn)];
>   
> -	mutex_unlock(&links_list_lock);
>   	return 0;
>   }
>   EXPORT_SYMBOL_GPL(pnv_ocxl_get_actag);
> @@ -293,12 +289,11 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
>   	 *
>   	 * We only support one AFU-carrying function for now.
>   	 */
> -	mutex_lock(&links_list_lock);
> +	guard(mutex)(&links_list_lock);
>   
>   	link = find_link(dev);
>   	if (!link) {
>   		dev_err(&dev->dev, "actag information not found\n");
> -		mutex_unlock(&links_list_lock);
>   		return -ENODEV;
>   	}
>   
> @@ -309,7 +304,6 @@ int pnv_ocxl_get_pasid_count(struct pci_dev *dev, int *count)
>   			break;
>   		}
>   
> -	mutex_unlock(&links_list_lock);

Hi. Andrew,

After this change below dev_dbg will be called with mutex held still. Is 
that a concern? I don't see the mutex being used in that path.

Since using scoped_guard cause more code churn here, I would prefer not 
use it.

>   	dev_dbg(&dev->dev, "%d PASIDs available for function\n",
>   		rc ? 0 : *count);
>   	return rc;


