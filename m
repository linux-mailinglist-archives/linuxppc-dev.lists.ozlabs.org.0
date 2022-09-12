Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D675B529C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 03:52:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQqNV73kkz301m
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:52:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fLMydeac;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fLMydeac;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQqMn48qqz2xGn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 11:51:49 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28BMcDGh028076
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : content-type :
 content-transfer-encoding : mime-version : subject : date : references :
 to : in-reply-to : message-id; s=pp1;
 bh=jebxyllDGG4BQekgLiZvS5bD/BKI1aVgWNGl2Xg+4gU=;
 b=fLMydeacCYxm5TQ3lzJm6EQjEcUMty0eI/KFVDf8+q9MYNdAjdds74sk5/b+5kun+Y24
 aG7QHxA/DMR9I30ax2JgtEdKPbX47gOP7WwcE4Rvq+ezSAAvBANXxCC4w9REMFZ1WVtl
 pIgQGKpqjwZAKNpw6HHrGDSvfnabX7HleGtaJ2hMwUu9XzqigRW3a1wsSqzqm0k19gN2
 A35EY/7vrOnz2M0snRAggh6Cah1aLgybKeLvFS6txo+ZaSbLJl40CeXXdUFMaRFBLFBl
 CPf5vCu32TlgQz9DHmeDf1CYbcblNdMdw3+sSt1Wy3r8dWysjTdfgFxLCmDmtqdWEctp 8w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3jh4n7fk5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:46 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C1oNCC022984
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
	by ppma04ams.nl.ibm.com with ESMTP id 3jgj79sp68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:44 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C1pgOO25100612
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:42 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A0B3611C052
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:42 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C41111C04A
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 01:51:42 +0000 (GMT)
Received: from smtpclient.apple (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 8C5DD600E5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 11:51:36 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: Re: [PATCH 1/3] powerpc: mm: move pud_pfn stub to common pgtable
 header
Date: Mon, 12 Sep 2022 11:51:36 +1000
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
In-Reply-To: <20220912014703.185471-1-rmclure@linux.ibm.com>
Message-Id: <66987FA4-15C6-437D-8A37-75F0ABB0B287@linux.ibm.com>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: xD7M36jtc5OICr47xLIXXkCKzyFTO3LH
X-Proofpoint-ORIG-GUID: xD7M36jtc5OICr47xLIXXkCKzyFTO3LH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-11_14,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 phishscore=0 suspectscore=0 adultscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2207270000 definitions=main-2209120004
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

This patch and its successor would be avoidable if architectures could =
specify
that they wish to use page_table_check_p{ud,md}_{clear,set}.

> On 12 Sep 2022, at 11:47 am, Rohan McLure <rmclure@linux.ibm.com> =
wrote:
>=20
> The pud_pfn inline call is only referenced on 64-bit Book3S systems,
> but its invocations are gated by pud_devmap() invocations, rendering =
the
> body of this function as dead code.
>=20
> As such, this function is readily exportable to all platforms in the
> instance where kernel features depend on it at least being defined.
>=20
> Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
> ---
> arch/powerpc/include/asm/book3s/64/pgtable.h | 10 ----------
> arch/powerpc/include/asm/pgtable.h           | 12 ++++++++++++
> 2 files changed, 12 insertions(+), 10 deletions(-)
>=20
> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h =
b/arch/powerpc/include/asm/book3s/64/pgtable.h
> index 392ff48f77df..8874f2a3661d 100644
> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
> @@ -1411,16 +1411,6 @@ static inline int pgd_devmap(pgd_t pgd)
> }
> #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>=20
> -static inline int pud_pfn(pud_t pud)
> -{
> -	/*
> -	 * Currently all calls to pud_pfn() are gated around a =
pud_devmap()
> -	 * check so this should never be used. If it grows another user =
we
> -	 * want to know about it.
> -	 */
> -	BUILD_BUG();
> -	return 0;
> -}
> #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
> pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, =
pte_t *);
> void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
> diff --git a/arch/powerpc/include/asm/pgtable.h =
b/arch/powerpc/include/asm/pgtable.h
> index 33f4bf8d22b0..522145b16a07 100644
> --- a/arch/powerpc/include/asm/pgtable.h
> +++ b/arch/powerpc/include/asm/pgtable.h
> @@ -158,6 +158,18 @@ struct seq_file;
> void arch_report_meminfo(struct seq_file *m);
> #endif /* CONFIG_PPC64 */
>=20
> +#define pud_pfn pud_pfn
> +static inline int pud_pfn(pud_t pud)
> +{
> +	/*
> +	 * Currently all calls to pud_pfn() are gated around a =
pud_devmap()
> +	 * check so this should never be used. If it grows another user =
we
> +	 * want to know about it.
> +	 */
> +	BUILD_BUG();
> +	return 0;
> +}
> +
> #endif /* __ASSEMBLY__ */
>=20
> #endif /* _ASM_POWERPC_PGTABLE_H */
> --=20
> 2.34.1
>=20

