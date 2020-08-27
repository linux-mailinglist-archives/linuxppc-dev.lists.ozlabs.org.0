Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EEDCA254144
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:55:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bcc4R6LN9zDqnG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:55:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=to21mVfz; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcc2R25ljzDqkV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 18:53:18 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R8Xdc9123889; Thu, 27 Aug 2020 04:53:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=q7DL1WbKcNkZ4ZXocHHgi1hzHvU20nmCCCKlbWjL91k=;
 b=to21mVfzciBTO3+K7TlSkattRh7Cd4hSqPiVGqUE3Pk9/i9uYQTBD5q4TRX+gZkIM57w
 Pdg0owoKR4FCzLTeUEd8JIb0kHJZ0x8j6lIxTREWCNWIO6N3V7eMgdTEAdFINV7kfQp8
 7JkXu5qVbw1TnfpFNspEmATBOjw3li/VlppVwgPoxSw9eFyOLngAlraZS5RtEzP2qgMz
 KD5BgtdYUb7FMfJC7rlCmPqKLRXGaZIGWbSD5Rqv2WdOME+jc0ncwy0sXz1SKN2eJuhP
 dLMqDh6mCqRJrb7T0A0uF2A867+qsO3shMdm+iP7Y0XHIc2KliZxd8yXBCsykbEQM5r/ Nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3368qva22q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:53:09 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07R8Y2Ef125680;
 Thu, 27 Aug 2020 04:53:09 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3368qva21y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:53:09 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R8qWwL003704;
 Thu, 27 Aug 2020 08:53:07 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma03fra.de.ibm.com with ESMTP id 332utq3bfr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 08:53:07 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R8r4Fm25821546
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 08:53:04 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A333B52050;
 Thu, 27 Aug 2020 08:53:04 +0000 (GMT)
Received: from pomme.local (unknown [9.145.76.83])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 2957F52054;
 Thu, 27 Aug 2020 08:53:04 +0000 (GMT)
Subject: Re: [PATCHv5 1/2] powerpc/pseries: group lmb operation and memblock's
To: Pingfan Liu <kernelfans@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
Message-ID: <0b852131-ff09-9fe4-4336-42cda0c8b931@linux.ibm.com>
Date: Thu, 27 Aug 2020 10:53:03 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <1597049570-19536-1-git-send-email-kernelfans@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 mlxscore=0 mlxlogscore=999 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008270060
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, kexec@lists.infradead.org,
 Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Le 10/08/2020 à 10:52, Pingfan Liu a écrit :
> This patch prepares for the incoming patch which swaps the order of
> KOBJ_ADD/REMOVE uevent and dt's updating.
> 
> The dt updating should come after lmb operations, and before
> __remove_memory()/__add_memory().  Accordingly, grouping all lmb operations
> before the memblock's.

I can't find the link between this commit description and the code's changes below.

> 
> Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Hari Bathini <hbathini@linux.ibm.com>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Nathan Fontenot <nfont@linux.vnet.ibm.com>
> Cc: Laurent Dufour <ldufour@linux.ibm.com>
> To: linuxppc-dev@lists.ozlabs.org
> Cc: kexec@lists.infradead.org
> ---
> v4 -> v5: fix the miss of clearing DRCONF_MEM_ASSIGNED in a failure path
>   arch/powerpc/platforms/pseries/hotplug-memory.c | 28 +++++++++++++++++--------
>   1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 5d545b7..46cbcd1 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -355,7 +355,8 @@ static int dlpar_add_lmb(struct drmem_lmb *);
>   static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>   {
>   	unsigned long block_sz;
> -	int rc;
> +	phys_addr_t base_addr;
> +	int rc, nid;
>   
>   	if (!lmb_is_removable(lmb))
>   		return -EINVAL;
> @@ -364,17 +365,19 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>   	if (rc)
>   		return rc;
>   
> +	base_addr = lmb->base_addr;
> +	nid = lmb->nid;
>   	block_sz = pseries_memory_block_size();
>   
> -	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
> -
> -	/* Update memory regions for memory remove */
> -	memblock_remove(lmb->base_addr, block_sz);
> -
>   	invalidate_lmb_associativity_index(lmb);
>   	lmb_clear_nid(lmb);
>   	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
>   
> +	__remove_memory(nid, base_addr, block_sz);
> +
> +	/* Update memory regions for memory remove */
> +	memblock_remove(base_addr, block_sz);
> +
>   	return 0;
>   }
>   
> @@ -603,22 +606,29 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>   	}
>   
>   	lmb_set_nid(lmb);
> +	lmb->flags |= DRCONF_MEM_ASSIGNED;
> +
>   	block_sz = memory_block_size_bytes();
>   
>   	/* Add the memory */
>   	rc = __add_memory(lmb->nid, lmb->base_addr, block_sz);
>   	if (rc) {
>   		invalidate_lmb_associativity_index(lmb);
> +		lmb_clear_nid(lmb);
> +		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
>   		return rc;
>   	}
>   
>   	rc = dlpar_online_lmb(lmb);
>   	if (rc) {
> -		__remove_memory(lmb->nid, lmb->base_addr, block_sz);
> +		int nid = lmb->nid;
> +		phys_addr_t base_addr = lmb->base_addr;
> +
>   		invalidate_lmb_associativity_index(lmb);
>   		lmb_clear_nid(lmb);
> -	} else {
> -		lmb->flags |= DRCONF_MEM_ASSIGNED;
> +		lmb->flags &= ~DRCONF_MEM_ASSIGNED;
> +
> +		__remove_memory(nid, base_addr, block_sz);
>   	}
>   
>   	return rc;
> 

