Return-Path: <linuxppc-dev+bounces-11115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A37B2B7AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Aug 2025 05:36:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c5ZxY0y6Xz3clp;
	Tue, 19 Aug 2025 13:36:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755574577;
	cv=none; b=R7WYV6wv5DR8wrL1/UvxXOzRPnuplmgmsuwVwOzXu7g8O3GoOImQ6pDfrn4cuYLdhjZVZgtv+EAoXlL83zmG+T+i5J18/8kBMOUq92pPJ3rzQUiAzhKGwsl6PFiQ484afq/XAg7oWmjbFuq3+yOf/C4nEiCvtobFWBjGpBC5mGrI4JJ5aaw6qRL7nC6F8y+zHNrJokNyN9DnrpLkwfn5csm0cj2FjGhd0iGqyAxlEnmehoLWxaIWK/ShGpeKEiJZRU0FREVKMhFtt5FD0Wjm8VzrpbpRF2uGM8HvuYHS4VwYckOiPXyVira+rdXht6sv1eNe8jjp/F9lkb1NvoXU8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755574577; c=relaxed/relaxed;
	bh=H1O5Fp1ayX5MCwcRDMcMUivVM3md77FsR7ps6Nq+QmE=;
	h=From:To:Cc:Subject:In-Reply-To:Date:Message-ID:References; b=UZmLlhcn9ATKMbeaOPUAnmNPzk/RHM+dDZg6VMmgHc+cIOyHFfboXDtG0DgSV1ArpSnobPsYjWgxctoEEfnY5gwaWoLdn6LpxoX3ToN61HXKGsjhGynMuxm//YevCadsX95eWK3EhA6uACrdofhy88sKtl8e9Wbxe/AmfwwYtHdPLqYl0AfoJJGgXyFksajLz/R962RxwcWsM/LD2tTspcJzJ+lgGghJejHnLjdnfgHyjIXWUOTwj8oeFdj4PFp9c2rRKfxVuazitOV9PZlO3jzBL+ZUN8ZOLZTC3IxK5xOTnBvX8UrcGHrNjS7nE7adCUfan6jbnmHF8Lcf2WV5vA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N9sAEFlW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=riteshh@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N9sAEFlW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=riteshh@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c5ZxT2bBTz3clV
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Aug 2025 13:36:12 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J12Qvv016582;
	Tue, 19 Aug 2025 03:36:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:date:from:in-reply-to:message-id:references:subject:to; s=pp1;
	 bh=H1O5Fp1ayX5MCwcRDMcMUivVM3md77FsR7ps6Nq+QmE=; b=N9sAEFlW6rt0
	64qc6Td07/wBpq6IgptBzqZnZbMI0Xm09icXXzzLRy+i7Zrep51vKxdwDPjcTHdl
	7asFE/bYXcK7toGb3mKrEmYr9b/WxVY1yxqutnHYGc33TeK8xe66qU+7shvEOih+
	ToWMQw9lOnbPzkiVxJpShxVM5ybdHQxOQ1FC1Vapbqxnd59O+zBetKezql9e7RON
	frEC9rAcR9P6rADzFEXXIna7qfdGH55lxwwdEoOI9YRJVQqIE2xV+id0X1x15weN
	gbyIAuJNUCQzKCMBf1yDvJyYKm2h8NIgjoae1hJ53p3N5xPk0LmqSgc4kLP/Iz96
	6aVPj0uYvg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48jfdrvjpy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:36:00 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 57J3ZxfX016454;
	Tue, 19 Aug 2025 03:36:00 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 48jfdrvjpu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:35:59 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 57J1XSCB002336;
	Tue, 19 Aug 2025 03:35:59 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 48k713092u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Aug 2025 03:35:59 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 57J3Zt1058392902
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 19 Aug 2025 03:35:55 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 45C6B20043;
	Tue, 19 Aug 2025 03:35:55 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 420FB20040;
	Tue, 19 Aug 2025 03:35:53 +0000 (GMT)
Received: from dw-tp (unknown [9.204.200.232])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 19 Aug 2025 03:35:53 +0000 (GMT)
From: Ritesh Harjani (IBM) <riteshh@linux.ibm.com>
To: Gautam Menghani <gautam@linux.ibm.com>, maddy@linux.ibm.com,
        mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] powerpc: Remove duplicate definition for ppc_msgsnd_sync()
In-Reply-To: <20250813122319.62278-1-gautam@linux.ibm.com>
Date: Tue, 19 Aug 2025 08:50:25 +0530
Message-ID: <87bjocatfq.fsf@gmail.com>
References: <20250813122319.62278-1-gautam@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: oLiwYisuEdzjke1bXIi87s-7-OvclDfl
X-Proofpoint-GUID: 2AjALPJol3RmTjF4HoyMN-z0cC3QbWCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAwMSBTYWx0ZWRfX1qMawPF5MugE
 uttEhX9/jrLcKNsRVxAdQefQKjCbRJjUbxQvCUL816YwpPaYlBcHzYdwy/VhNSHv6yakEwD+R2c
 GWjubOu7y1LGc3IJnxSzmEqORsJgcMVB9k37kdYTKNzMLl2WjcwaSQ54y1R1Q+lFC+4ZPfR5ijo
 8O8Fnw5PC6KMfDyPTIRGZRwTUrb09VX/JK6DkDkrunlZObf49VSc9xgF6QmXFBu/MKyYJT5Yf06
 aAmBdeX6ghAohqW7+gc7snaVgo8P9Z9WXs2RZgCnpxQZFfsKrn3dN+CbHuEaYmsjCG8QBNDX5Ft
 17Sj3qhAkfjLVsC4Vz+deKFtbT91OnZTT94fA/gCK6dTkjPezDGRzA62h0pyQlNOeuSVrxnU5QA
 TU5gGbPS
X-Authority-Analysis: v=2.4 cv=GotC+l1C c=1 sm=1 tr=0 ts=68a3f120 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=2OwXVqhp2XgA:10 a=VnNF1IyMAAAA:8 a=AjKfnhLaCVDwOzmiWWAA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0 clxscore=1011
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160001
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
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
Precedence: list

Gautam Menghani <gautam@linux.ibm.com> writes:

> Remove duplicate definition of ppc_msgsnd_sync() introduced in commit
> b87ac0218355 ('powerpc: Introduce msgsnd/doorbell barrier primitives').
>
> No functional change intended.
>

Earlier this function was duplicated at 2 places i.e. in
#ifdef CONFIG_PPC_BOOK3S and #else block. This patch takes those
duplicate definitions out and move it to a common place.

BTW, there is nothing sndmsg specific in this, so this could be open
coded as well. But as far as this patch is concerned, it looks good.

So please feel free to add:
Reviewed-by: Ritesh Harjani (IBM) <riteshh@linux.ibm.com>


> Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/dbell.h | 18 ++++++------------
>  1 file changed, 6 insertions(+), 12 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/dbell.h b/arch/powerpc/include/asm/dbell.h
> index 3e9da22a2779..0b9ef726f92c 100644
> --- a/arch/powerpc/include/asm/dbell.h
> +++ b/arch/powerpc/include/asm/dbell.h
> @@ -40,12 +40,6 @@ static inline void _ppc_msgsnd(u32 msg)
>  				: : "i" (CPU_FTR_HVMODE), "r" (msg));
>  }
>  
> -/* sync before sending message */
> -static inline void ppc_msgsnd_sync(void)
> -{
> -	__asm__ __volatile__ ("sync" : : : "memory");
> -}
> -
>  /* sync after taking message interrupt */
>  static inline void ppc_msgsync(void)
>  {
> @@ -76,12 +70,6 @@ static inline void _ppc_msgsnd(u32 msg)
>  	__asm__ __volatile__ (PPC_MSGSND(%0) : : "r" (msg));
>  }
>  
> -/* sync before sending message */
> -static inline void ppc_msgsnd_sync(void)
> -{
> -	__asm__ __volatile__ ("sync" : : : "memory");
> -}
> -
>  /* sync after taking message interrupt */
>  static inline void ppc_msgsync(void)
>  {
> @@ -91,6 +79,12 @@ static inline void ppc_msgsync(void)
>  
>  extern void doorbell_exception(struct pt_regs *regs);
>  
> +/* sync before sending message */
> +static inline void ppc_msgsnd_sync(void)
> +{
> +	__asm__ __volatile__ ("sync" : : : "memory");
> +}
> +
>  static inline void ppc_msgsnd(enum ppc_dbell type, u32 flags, u32 tag)
>  {
>  	u32 msg = PPC_DBELL_TYPE(type) | (flags & PPC_DBELL_MSG_BRDCAST) |
> -- 
> 2.50.1

