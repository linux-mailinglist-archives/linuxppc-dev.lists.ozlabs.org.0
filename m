Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC092563A16
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 21:48:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZQjW580Rz3dtn
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 05:48:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BGvGnBAM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=BGvGnBAM;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZQhm1tngz2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 05:47:35 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261Jhxxs022046;
	Fri, 1 Jul 2022 19:47:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rpJIgcxrXJyFVleOs0ys6j0/2RJM2l/wZIiKdeq1+ew=;
 b=BGvGnBAMvkcDP8Xu/dDhj9k8CBpML5WgPiABeMJnNyXEzRjtfuSRrslqlFWo/ujtqlWE
 ecr9HvY6GecwFYKxUQfmPrtG3SkosPz3ZMUT8xuRxAFsotsjX1Oa7oezgdzwD0Kzck6Z
 3R8OqG8RLCXYybipqr5HLfpV98N+PSk+Yw8L3TgCA/X++c52Ix5vMyMjWTtM9ArOHqPS
 AY9NPCcCWxXHdCZv+pLpn5cUkeKtEq2K36L0T+ASmJGrmsboSCSRvtiah8NZspC9A2tf
 e/AbiYo9GTEFeY43pUVa/ccI60UM2OAcjmBZ9hJ8PfpuM36TYf4tzrVwnVAi6475dZyM MA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h27bc02k6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 19:47:26 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261JlQJC003572;
	Fri, 1 Jul 2022 19:47:26 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3h27bc02jr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 19:47:26 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261Ja3MJ021413;
	Fri, 1 Jul 2022 19:47:25 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma03dal.us.ibm.com with ESMTP id 3gwt0bem0r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 19:47:25 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 261JlOWf28639698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Jul 2022 19:47:24 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4E1E5124052;
	Fri,  1 Jul 2022 19:47:24 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 810DD124055;
	Fri,  1 Jul 2022 19:47:23 +0000 (GMT)
Received: from [9.160.117.63] (unknown [9.160.117.63])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  1 Jul 2022 19:47:23 +0000 (GMT)
Message-ID: <09bcb7d7-5c27-04cc-6796-cbeb3d0abb14@linux.ibm.com>
Date: Fri, 1 Jul 2022 12:47:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] powerpc: kernel: pci_dn: Add missing of_node_put() for
 of_get_xx API
Content-Language: en-US
To: Liang He <windhl@126.com>, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linmq006@gmail.com
References: <20220701131750.240170-1-windhl@126.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
In-Reply-To: <20220701131750.240170-1-windhl@126.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Au8w_NzGliYl_YtPtVH5E6zVLI7__sDf
X-Proofpoint-ORIG-GUID: fPGV-xsRiv3wVhz-2Iwiks9IQJdKIxei
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_12,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0 mlxlogscore=990
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010078
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/1/22 06:17, Liang He wrote:
> In pci_add_device_node_info(), we should use of_node_put() for the
> reference 'parent' returned by of_get_parent() to keep refcount
> balance.
> 
> Fixes: cca87d303c85 ("powerpc/pci: Refactor pci_dn")
> Co-authored-by: Miaoqian Lin <linmq006@gmail.com>
> Signed-off-by: Liang He <windhl@126.com>
> ---
>  arch/powerpc/kernel/pci_dn.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
> index 938ab8838ab5..aa221958007e 100644
> --- a/arch/powerpc/kernel/pci_dn.c
> +++ b/arch/powerpc/kernel/pci_dn.c
> @@ -330,6 +330,7 @@ struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
>  	INIT_LIST_HEAD(&pdn->list);
>  	parent = of_get_parent(dn);
>  	pdn->parent = parent ? PCI_DN(parent) : NULL;
NACK

pdn->parent is now a long term reference so we should not do a put on parent
until we pdn->parent is no longer valid.

-Tyrel

> +	of_node_put(parent);
>  	if (pdn->parent)
>  		list_add_tail(&pdn->list, &pdn->parent->child_list);
> 

