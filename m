Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E9E563C43
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 00:19:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZV4L3JBdz3dtW
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Jul 2022 08:19:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NrxLtmx4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=NrxLtmx4;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZV3Z6NlCz3bll
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Jul 2022 08:19:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 261IkgDS001983;
	Fri, 1 Jul 2022 22:18:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : from : to : references : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=rTXd/Nfx35q1CVJpaEMB7ynWyiCtAwlTQmj3Li7FGgM=;
 b=NrxLtmx4uVPseTS0vBhF+SMIuCtEg1fVN12oKkwsH+EdzSJoIQnIVZW5LQWeBMwrs5uE
 MtVMMrnotfDHJfOd3ZKxGPzf+Vt4n9PaDo/LqhqY7r1T0vyTTCEwLuEXA/DQn5ZVm+oq
 XO22cR9Vk02aWnX02vVKjkc1fgztkIgBQDEqSeFocnBzAa5AITtiXh3W0o5KfthS0Zwm
 6rE4g/BKRcEiZ9L/jzRQ2wkFnkFTmaB2/OyTt2qHXIMmYKbFvhoytHzPbhKMqET6QdPz
 jUXctc5tWgJbxfEACRkZC7NbUESRLTIlv2glQLT4GPvEjqtyuptx979w77bN2WRAA9Dz zQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h26gk55an-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 22:18:55 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 261MItXO037731;
	Fri, 1 Jul 2022 22:18:55 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3h26gk55a5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 22:18:55 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 261M54LD027157;
	Fri, 1 Jul 2022 22:18:54 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com [9.57.198.24])
	by ppma02wdc.us.ibm.com with ESMTP id 3gwt0ameeu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Jul 2022 22:18:54 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com [9.57.199.107])
	by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 261MIr2h65012018
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 1 Jul 2022 22:18:53 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8B3CF12405C;
	Fri,  1 Jul 2022 22:18:53 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BF77D124058;
	Fri,  1 Jul 2022 22:18:52 +0000 (GMT)
Received: from [9.160.117.63] (unknown [9.160.117.63])
	by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
	Fri,  1 Jul 2022 22:18:52 +0000 (GMT)
Message-ID: <81fa33cc-32ea-4132-6b26-013d19f899c2@linux.ibm.com>
Date: Fri, 1 Jul 2022 15:18:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] powerpc: kernel: pci_dn: Add missing of_node_put() for
 of_get_xx API
Content-Language: en-US
From: Tyrel Datwyler <tyreld@linux.ibm.com>
To: Liang He <windhl@126.com>, mpe@ellerman.id.au, benh@kernel.crashing.org,
        paulus@samba.org, linuxppc-dev@lists.ozlabs.org, linmq006@gmail.com
References: <20220701131750.240170-1-windhl@126.com>
 <09bcb7d7-5c27-04cc-6796-cbeb3d0abb14@linux.ibm.com>
In-Reply-To: <09bcb7d7-5c27-04cc-6796-cbeb3d0abb14@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: IKdlsnwSUKdFh3dZYH_1jTHeaDILN1ib
X-Proofpoint-GUID: OQq20TtbJkMqQ18PdbBFbmGKURRuHyOu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-01_14,2022-06-28_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2207010088
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

On 7/1/22 12:47, Tyrel Datwyler wrote:
> On 7/1/22 06:17, Liang He wrote:
>> In pci_add_device_node_info(), we should use of_node_put() for the
>> reference 'parent' returned by of_get_parent() to keep refcount
>> balance.
>>
>> Fixes: cca87d303c85 ("powerpc/pci: Refactor pci_dn")
>> Co-authored-by: Miaoqian Lin <linmq006@gmail.com>
>> Signed-off-by: Liang He <windhl@126.com>
>> ---
>>  arch/powerpc/kernel/pci_dn.c | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/arch/powerpc/kernel/pci_dn.c b/arch/powerpc/kernel/pci_dn.c
>> index 938ab8838ab5..aa221958007e 100644
>> --- a/arch/powerpc/kernel/pci_dn.c
>> +++ b/arch/powerpc/kernel/pci_dn.c
>> @@ -330,6 +330,7 @@ struct pci_dn *pci_add_device_node_info(struct pci_controller *hose,
>>  	INIT_LIST_HEAD(&pdn->list);
>>  	parent = of_get_parent(dn);
>>  	pdn->parent = parent ? PCI_DN(parent) : NULL;
> NACK
> 
> pdn->parent is now a long term reference so we should not do a put on parent
> until we pdn->parent is no longer valid.

I withdraw my NACK. On closer inspection pdn->parent is a reference to the
parent struct pci_dn and not a reference to a parent struct device_node.

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>

> 
> -Tyrel
> 
>> +	of_node_put(parent);
>>  	if (pdn->parent)
>>  		list_add_tail(&pdn->list, &pdn->parent->child_list);
>>
> 

