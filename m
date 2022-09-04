Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC56E5AC58A
	for <lists+linuxppc-dev@lfdr.de>; Sun,  4 Sep 2022 18:58:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MLHt53LPkz3c6Z
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Sep 2022 02:58:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJgPEX4P;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TJgPEX4P;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MLHs31Q6Nz30NS
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Sep 2022 02:57:59 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 284GfU7C031300;
	Sun, 4 Sep 2022 16:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FPhoLd/vtiSuc4V3yKdQE7lgQEIzNpsXAV/5+Y7WDPE=;
 b=TJgPEX4Pc1xRlHVjjPTwiOlbdMUH7UnCcKtN8LDv8xwOB1/hO7Sh+JGCio6qBZAkHQE6
 HLf/JF741tQ+lGFnIqSEb/HgTDozjNRQcSRiPo6v/LS4nyOINRyIIYB708YxWoJNm5EE
 DzFEM1WI/UBo3A/Jy+7mpGibf06eh3+J9Lnq4rakByOjQBfOdAwwwlBk6zgNDGYhMXdw
 gUMezChas/u0QcUTc196/DdgDBTTInJeMRLwuaAwqr0Gd7YKY5jJ2wYx2atoOIjCeZpG
 J3T9EIs2A0zgkfaLQmLbSTpA3v4d6HVuIfgRbKgtnybBNHSSiOmSGEQ/YpZg91Mx6LJO qA== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jcyrv86c5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Sep 2022 16:57:52 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 284GpLkB020389;
	Sun, 4 Sep 2022 16:57:51 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma01wdc.us.ibm.com with ESMTP id 3jbxj90an2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 04 Sep 2022 16:57:51 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 284Gvpce1507982
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 4 Sep 2022 16:57:51 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7E996136051;
	Sun,  4 Sep 2022 16:57:50 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 898D613604F;
	Sun,  4 Sep 2022 16:57:48 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.81.44])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Sun,  4 Sep 2022 16:57:48 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/2] powerpc/mm/64s: Drop p4d_leaf()
In-Reply-To: <20220903123640.719846-2-mpe@ellerman.id.au>
References: <20220903123640.719846-1-mpe@ellerman.id.au>
 <20220903123640.719846-2-mpe@ellerman.id.au>
Date: Sun, 04 Sep 2022 22:27:46 +0530
Message-ID: <8735d7axh1.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rUU_2tTJE24Kzg4QQEtc3Zpr0fk13yNx
X-Proofpoint-GUID: rUU_2tTJE24Kzg4QQEtc3Zpr0fk13yNx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-09-04_02,2022-08-31_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 phishscore=0 clxscore=1015
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209040084
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
Cc: linux-mm@kvack.org, mike.kravetz@oracle.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael Ellerman <mpe@ellerman.id.au> writes:

>
> Because 64-bit Book3S uses pgtable-nop4d.h, the P4D is folded into the
> PGD. So P4D entries are actually PGD entries, or vice versa.
>
> The other way to think of it is that the P4D is a single entry page
> table below the PGD. Zero bits of the address are needed to index into
> the P4D, therefore a P4D entry maps the same size address space as a PGD
> entry.
>
> As explained in the previous commit, there are no huge page sizes
> supported directly at the PGD level on 64-bit Book3S, so there are also
> no huge page sizes supported at the P4D level.
>
> Therefore p4d_is_leaf() can never be true, so drop the definition and
> fallback to the default implementation that always returns false.
>

Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  arch/powerpc/include/asm/book3s/64/pgtable.h | 7 -------
>  1 file changed, 7 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 486902aff040..057254063e88 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1459,12 +1459,5 @@ static inline bool pud_is_leaf(pud_t pud)
>  	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
>  }
>  
> -#define p4d_is_leaf p4d_is_leaf
> -#define p4d_leaf p4d_is_leaf
> -static inline bool p4d_is_leaf(p4d_t p4d)
> -{
> -	return !!(p4d_raw(p4d) & cpu_to_be64(_PAGE_PTE));
> -}
> -
>  #endif /* __ASSEMBLY__ */
>  #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
> -- 
> 2.37.2
