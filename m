Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B626822B1B3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Jul 2020 16:44:24 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCFTd1BYHzDr82
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 00:44:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCFQF2Qb7zDrRH
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 00:41:24 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06NEXvep002156; Thu, 23 Jul 2020 10:41:09 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23gak0p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 10:41:08 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06NEXok4001868;
 Thu, 23 Jul 2020 10:41:08 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32f23gak0a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 10:41:08 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06NEeJIg007129;
 Thu, 23 Jul 2020 14:41:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 32brqa0a4d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 23 Jul 2020 14:41:07 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06NEf6Ui38863356
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 23 Jul 2020 14:41:06 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BDE33124058;
 Thu, 23 Jul 2020 14:41:06 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80F29124052;
 Thu, 23 Jul 2020 14:41:06 +0000 (GMT)
Received: from localhost (unknown [9.160.116.141])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 23 Jul 2020 14:41:06 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Pingfan Liu <kernelfans@gmail.com>
Subject: Re: [PATCHv3 1/2] powerpc/pseries: group lmb operation and memblock's
In-Reply-To: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
References: <1595382730-10565-1-git-send-email-kernelfans@gmail.com>
Date: Thu, 23 Jul 2020 09:41:06 -0500
Message-ID: <87ft9i1egt.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-23_06:2020-07-23,
 2020-07-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=965
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230109
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
Cc: kexec@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Pingfan Liu <kernelfans@gmail.com> writes:
> This patch prepares for the incoming patch which swaps the order of KOBJ_
> uevent and dt's updating.
>
> It has no functional effect, just groups lmb operation and memblock's in
> order to insert dt updating operation easily, and makes it easier to
> review.

...

> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 5d545b7..1a3ac3b 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -355,7 +355,8 @@ static int dlpar_add_lmb(struct drmem_lmb *);
>  static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>  {
>  	unsigned long block_sz;
> -	int rc;
> +	phys_addr_t base_addr;
> +	int rc, nid;
>  
>  	if (!lmb_is_removable(lmb))
>  		return -EINVAL;
> @@ -364,17 +365,19 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>  	if (rc)
>  		return rc;
>  
> +	base_addr = lmb->base_addr;
> +	nid = lmb->nid;
>  	block_sz = pseries_memory_block_size();
>  
> -	__remove_memory(lmb->nid, lmb->base_addr, block_sz);
> -
> -	/* Update memory regions for memory remove */
> -	memblock_remove(lmb->base_addr, block_sz);
> -
>  	invalidate_lmb_associativity_index(lmb);
>  	lmb_clear_nid(lmb);
>  	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
>  
> +	__remove_memory(nid, base_addr, block_sz);
> +
> +	/* Update memory regions for memory remove */
> +	memblock_remove(base_addr, block_sz);
> +
>  	return 0;
>  }

I don't understand; the commit message should not claim this has no
functional effect when it changes the order of operations like
this. Maybe this is an improvement over the current behavior, but it's
not explained why it would be.
