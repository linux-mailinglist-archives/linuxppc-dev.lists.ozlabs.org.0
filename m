Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2FF34D8820
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Mar 2022 16:33:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KHLCv4Bw3z3bV1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Mar 2022 02:33:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mIAUNiou;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ldufour@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mIAUNiou; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KHLC91Hrpz2yb9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Mar 2022 02:32:52 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EEl5Pa001949
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:32:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=mLtxkJYEjJZefxqLusxI7kixU0Hri/pCqO4fb5BmIEY=;
 b=mIAUNiouI0JHFFDKbNNNKQNSSElKRKZtRY4/EeOccDDNyqJ9pxfJ0u8nuqFTm5w/y9SE
 ZTH03LsCFHGxgIJtheYyafAmWzG+KOxzrp79yLILnrp7HQjimzourjQ57ZpAoxpBbwSn
 k3RB8KYm+4uDvcRODj57UEb75ogevVffpQZQHIhyIxwFTolZZBpB3u4sglCblpywbC5F
 T+2kmtlnPFvDQVWSymll3KYNJ9iqbXUnz+sF/mKrNkj6ejLcmypG6MRWB3rMyuzV3DHD
 LD/6/bwKqK8nWg1RfT7jS95xYGBa8FrXfb45byeiyc9YEj49qCAQbW+1ZncKsTUXUzWN Uw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6crut4q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:32:49 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EFH0QD019768
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Mar 2022 15:32:49 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3et6crut49-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:32:49 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EFREbA007389;
 Mon, 14 Mar 2022 15:32:47 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 3erjshkvxp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 15:32:47 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EFWjwS38928808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 15:32:45 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEACF11C478;
 Mon, 14 Mar 2022 15:32:44 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9C28811C46E;
 Mon, 14 Mar 2022 15:32:44 +0000 (GMT)
Received: from [9.101.4.33] (unknown [9.101.4.33])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 15:32:44 +0000 (GMT)
Message-ID: <ac9d1902-70fb-4e2a-1d12-e950ad938c92@linux.ibm.com>
Date: Mon, 14 Mar 2022 16:32:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH 07/14] powerpc/rtas: PACA can be restored directly from
 SPRG
Content-Language: en-US
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20220308135047.478297-1-npiggin@gmail.com>
 <20220308135047.478297-8-npiggin@gmail.com>
From: Laurent Dufour <ldufour@linux.ibm.com>
In-Reply-To: <20220308135047.478297-8-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: r-eck97H1csirq5O1C6S_1sKALClltjw
X-Proofpoint-ORIG-GUID: -K298uP-277HZw_R7-H5tN5UBkG3wvWk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_11,2022-03-14_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 mlxscore=0 suspectscore=0 lowpriorityscore=0
 bulkscore=0 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 clxscore=1015 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203140098
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

On 08/03/2022, 14:50:40, Nicholas Piggin wrote:
> On 64-bit, PACA is saved in a SPRG so it does not need to be saved on
> stack. We also don't need to mask off the top bits for real mode
> addresses because the architecture does this for us.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Laurent Dufour <ldufour@linux.ibm.com>

> ---
>  arch/powerpc/kernel/rtas_entry.S | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/rtas_entry.S b/arch/powerpc/kernel/rtas_entry.S
> index 08eb731f08b8..5f65ea4436c6 100644
> --- a/arch/powerpc/kernel/rtas_entry.S
> +++ b/arch/powerpc/kernel/rtas_entry.S
> @@ -62,10 +62,9 @@ _GLOBAL(enter_rtas)
>  
>  	/* Because RTAS is running in 32b mode, it clobbers the high order half
>  	 * of all registers that it saves.  We therefore save those registers
> -	 * RTAS might touch to the stack.  (r0, r3-r13 are caller saved)
> +	 * RTAS might touch to the stack.  (r0, r3-r12 are caller saved)
>  	 */
>  	SAVE_GPR(2, r1)			/* Save the TOC */
> -	SAVE_GPR(13, r1)		/* Save paca */
>  	SAVE_NVGPRS(r1)			/* Save the non-volatiles */
>  
>  	mfcr	r4
> @@ -129,15 +128,14 @@ rtas_return_loc:
>  	mtmsrd	r6
>  
>  	/* relocation is off at this point */
> -	GET_PACA(r4)
> -	clrldi	r4,r4,2			/* convert to realmode address */
> +	GET_PACA(r13)
>  
>  	bcl	20,31,$+4
>  0:	mflr	r3
>  	ld	r3,(1f-0b)(r3)		/* get &rtas_restore_regs */
>  
> -	ld	r1,PACAR1(r4)		/* Restore our SP */
> -	ld	r4,PACASAVEDMSR(r4)	/* Restore our MSR */
> +	ld	r1,PACAR1(r13)		/* Restore our SP */
> +	ld	r4,PACASAVEDMSR(r13)	/* Restore our MSR */
>  
>  	mtspr	SPRN_SRR0,r3
>  	mtspr	SPRN_SRR1,r4
> @@ -153,11 +151,8 @@ _ASM_NOKPROBE_SYMBOL(rtas_return_loc)
>  rtas_restore_regs:
>  	/* relocation is on at this point */
>  	REST_GPR(2, r1)			/* Restore the TOC */
> -	REST_GPR(13, r1)		/* Restore paca */
>  	REST_NVGPRS(r1)			/* Restore the non-volatiles */
>  
> -	GET_PACA(r13)
> -
>  	ld	r4,_CCR(r1)
>  	mtcr	r4
>  	ld	r5,_CTR(r1)

