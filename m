Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD0C14D87E7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 16:18:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHKtS56kKz30hh
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 02:18:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=i64DWa5l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i64DWa5l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHKsp3kHWz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 02:17:50 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EEe8kW005149
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:17:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=LED9CSpQeCPBTB8ZnPu+xkIZq0+ZYYpEsMR+/Plg3bg=;
 b=i64DWa5lisGzhoys28Viv3lszkMTx8FfGB0Dz+hXbjTv41BbbLgX/DF9CHO910+8qDsQ
 pAWnOCQNlIHNMVdSKQ+5bIqJ3D03jYfZkiw6v/Eh+wG/m2WwdY4Nuf0tJZCXui0kXbkX
 Ca7IuVeScFR9lSoqqGjvwZGbnt35Blp0Ym567B15oyYmjNrP7NWR3txGMGzbBai9geQ9
 9DZpucfu/Zeo2VasXcAozD3Lfyd8npcqfaWCzvwWqhoTd3oXRw7AfegRHD7/4tG+8Lw7
 +e/lf6gwHT6G8au/AfBroe5kS6O2rEm+jhrB5Pb/NMUl3F1FoZhQybRG4TrLWhhvQVi2 ag== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a6ut1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:17:47 +0000
Received: from m0098410.ppops.net (m0098410.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EEGl8X001082
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:17:47 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6a6ut12-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:17:47 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EF9Ztw017287;
 Mon, 14 Mar 2022 15:17:45 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 3erk58vfc3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:17:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EFHgGY38863158
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 15:17:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF73211CBE3;
 Mon, 14 Mar 2022 15:17:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A68D411CBEC;
 Mon, 14 Mar 2022 15:17:42 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 15:17:42 +0000 (GMT)
Message-ID: <731b4827-3a36-0bf7-f1b3-ad16ef011c6a@linux.ibm.com>
Date: Mon, 14 Mar 2022 16:17:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 06/14] powerpc/rtas: Load rtas entry MSR explicitly
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-7-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-7-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RzBLP8fyLKMsA3dPiAZFW9L7fZdeHvUa
X-Proofpoint-ORIG-GUID: uGLV3NHOVW6XmBpeC-WuXGaxoKZzp9KZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_11,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 malwarescore=0 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 mlxlogscore=847
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

On 08/03/2022, 14:50:39, Nicholas Piggin wrote:
> Rather than adjust the current MSR value to find the rtas entry
> MSR on 64-bit, load the explicit value we want as 32-bit does.
> 
> This prevents some facilities (e.g., VEC and VSX) from being left
> enabled which doesn't seem to cause a problem but it's more
> consistent to always use the same MSR and minimise facilities
> enabled.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/kernel/rtas_entry.S | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 7b93687b9a10..08eb731f08b8 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -99,14 +99,7 @@ _GLOBAL(enter_rtas)
>  	clrldi	r4,r4,2			/* convert to realmode address */
>  	mtlr	r4
>  
> -	li	r0,0
> -	ori	r0,r0,MSR_EE|MSR_SE|MSR_BE|MSR_RI
> -	andc	r0,r6,r0
> -
> -	li	r9,1
> -	rldicr	r9,r9,MSR_SF_LG,(63-MSR_SF_LG)
> -	ori	r9,r9,MSR_IR|MSR_DR|MSR_FE0|MSR_FE1|MSR_FP|MSR_RI|MSR_LE
> -	andc	r6,r0,r9
> +	LOAD_REG_IMMEDIATE(r6, MSR_ME)
>  
>  __enter_rtas:
>  	LOAD_REG_ADDR(r4, rtas)

