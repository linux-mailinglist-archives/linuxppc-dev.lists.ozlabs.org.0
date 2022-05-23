Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6812F5311CD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 May 2022 18:10:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L6MkQ23nsz3bly
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 May 2022 02:10:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZD0yAXI3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZD0yAXI3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L6Mjg55T5z2xnG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 May 2022 02:09:58 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24NFUGXH022928;
 Mon, 23 May 2022 16:09:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=GWi2svyv4xiTKuEkdoZOSj7G+LZzUVwd+iYBidPDUGU=;
 b=ZD0yAXI3NDFafBxw9P2NRSMwV30PmEiX2qNRVPao1IPEKL5HM+tjLqJmnGFvvMR9EaPd
 CXDdak0pB010MbHT/VSBoXefgESh2dhsBhtm4QTrWk2dltXOccnJYafppEHKEzyvU/Ps
 AYyifKRXC+6tERA5yq8uMaSaVAvDs/oWhY18ZT9+MCXy/jlOONMm+6cMcHG2ZaBK/mq+
 QDkE0CsL3ymm6H6SALO+YctA1TzlwK9X65/Vjtu1W6Wg2FSZBfBeqn3SIS8isnrppuX6
 BanEtEAfv/7gR1oq6kjA1ZC/T3KAieFmiIC6hZbolKUj+fWqbaSTga2PCcKzQiFw/1MK Lg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8axj3x24-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 16:09:46 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24NG9jvN005804;
 Mon, 23 May 2022 16:09:46 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3g8axj3x16-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 16:09:46 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24NFwRmS028633;
 Mon, 23 May 2022 16:09:43 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma03ams.nl.ibm.com with ESMTP id 3g6qq933jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 May 2022 16:09:43 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 24NG9fO246531026
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 May 2022 16:09:41 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 74A30A4051;
 Mon, 23 May 2022 16:09:41 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32C01A404D;
 Mon, 23 May 2022 16:09:41 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 23 May 2022 16:09:41 +0000 (GMT)
Message-ID: <913bcf4d-dc78-dacb-4891-43a882f50017@linux.ibm.com>
Date: Mon, 23 May 2022 18:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.0
Subject: Re: [PATCH] powerpc/64s: Don't read H_BLOCK_REMOVE characteristics in
 radix mode
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>
References: <20220520155721.10211-1-ldufour@linux.ibm.com>
 <d87cca6d-8cc9-3347-f74a-28f12889cfe1@csgroup.eu>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <d87cca6d-8cc9-3347-f74a-28f12889cfe1@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bWbvRjAI3Z_YOw8z6DsLYMrMT_ea3MZk
X-Proofpoint-GUID: xMHkeSi2CqnMpaGYbyj0Zg262cyz_h7v
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-23_06,2022-05-23_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0
 mlxscore=0 impostorscore=0 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205230087
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
Cc: "aneesh.kumar@linux.ibm.com" <aneesh.kumar@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 20/05/2022, 18:15:39, Christophe Leroy wrote:
> 
> 
> Le 20/05/2022 à 17:57, Laurent Dufour a écrit :
>> There is no need to read the H_BLOCK_REMOVE characteristics when running in
>> Radix mode because this hcall is never called.
>>
>> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
>> ---
>>   arch/powerpc/platforms/pseries/setup.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
>> index c9fcc30a0365..654d2b999c25 100644
>> --- a/arch/powerpc/platforms/pseries/setup.c
>> +++ b/arch/powerpc/platforms/pseries/setup.c
>> @@ -803,7 +803,8 @@ static void __init pSeries_setup_arch(void)
>>   
>>   	pseries_setup_security_mitigations();
>>   #ifdef CONFIG_PPC_64S_HASH_MMU
>> -	pseries_lpar_read_hblkrm_characteristics();
>> +	if (!radix_enabled())
>> +		pseries_lpar_read_hblkrm_characteristics();
>>   #endif
> 
> As far as I can see the function always exists so the #ifdef can be removed.

You're right, I'll do that in the v2

>>   
>>   	/* By default, only probe PCI (can be overridden by rtas_pci) */

