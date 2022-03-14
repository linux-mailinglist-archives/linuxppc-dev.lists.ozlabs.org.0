Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D14D87E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 16:16:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHKrT28q6z3bVM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 02:16:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U5Hlaf1I;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U5Hlaf1I; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHKqp0QVWz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 02:16:05 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EEovu1007294
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=dvhhOeFmrMqqixD6Z8IadmEpChIAYzsr5uG3ebH9GIU=;
 b=U5Hlaf1I3/r47de51Lj6otjE8Kfz+EKIXiim6yISS0RAaMOE0TjrkN3ZHmrXR7cIa/QE
 zKKyufYYBTSIAoYPi69IOb3OLQhzBnzzjsQz+9H6qVNgJbZ7MGbr7UtzMbDKjWD2bS4u
 A2t8t2RUVGZm6hU+/P3kof+ANuhj7E5zmxOIwdFsda8vHDu1bQt3psCPCId1xigPO3d0
 R6sOkjOHb79o8FSGFcJbH3VHA3tUYo4FbMTuutRcd0eJ7R3441CmzunCvPFIvA66Xomb
 ZN1Nl1rdMaP+vd+WPq3qc4UfOSJxYTU8KIOsOotLbMlwc0w99XsCNsDRTp7ZF/V1pV5R eQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6dcka0c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:16:01 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EEEGUF012939
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:16:00 GMT
Received: from ppma04fra.de.ibm.com (6a.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.106])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6dck9yr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:16:00 +0000
Received: from pps.filterd (ppma04fra.de.ibm.com [127.0.0.1])
 by ppma04fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EF9Dpi031954;
 Mon, 14 Mar 2022 15:15:58 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma04fra.de.ibm.com with ESMTP id 3erk58kuwx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:15:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EFFuA254788440
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 15:15:56 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DA78011C6FC;
 Mon, 14 Mar 2022 15:15:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C198C11C6EC;
 Mon, 14 Mar 2022 15:15:55 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 15:15:55 +0000 (GMT)
Message-ID: <da7326d1-2e08-63ff-bb8c-541b843f5984@linux.ibm.com>
Date: Mon, 14 Mar 2022 16:15:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 05/14] powerpc/rtas: Modernise RI clearing on 64-bit
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-6-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-6-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: JN0BI-kDguPVHp14I6DS51c6vIrRv59c
X-Proofpoint-ORIG-GUID: hoSdD295DruoXrSTURRdnD4la7hHfbCv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_11,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=895 impostorscore=0 adultscore=0 clxscore=1015 suspectscore=0
 mlxscore=0 priorityscore=1501 bulkscore=0 spamscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203140095
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 08/03/2022, 14:50:38, Nicholas Piggin wrote:
> mtmsrd L=1 can clear MSR[RI] without the previous MSR value; it does
> not require sync; it can be moved later to before SRRs are live.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/kernel/rtas_entry.S | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 45fa661c2ff6..7b93687b9a10 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -109,13 +109,13 @@ _GLOBAL(enter_rtas)
>  	andc	r6,r0,r9
>  
>  __enter_rtas:
> -	sync				/* disable RI so SRR0/1 */
> -	mtmsrd	r0			/* don't get trashed */
> -
>  	LOAD_REG_ADDR(r4, rtas)
>  	ld	r5,RTASENTRY(r4)	/* get the rtas->entry value */
>  	ld	r4,RTASBASE(r4)		/* get the rtas->base value */
>  
> +	li	r0,0
> +	mtmsrd	r0,1			/* disable RI before using SRR0/1 */
> +
>  	mtspr	SPRN_SRR0,r5
>  	mtspr	SPRN_SRR1,r6
>  	RFI_TO_KERNEL

