Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E43517629
	for <lists+linuxppc-dev@lfdr.de>; Mon,  2 May 2022 19:54:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KsW1K61Tbz3bq8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 May 2022 03:53:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=f+0bhlGr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=f+0bhlGr; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KsW0b1Fmdz2ync
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 May 2022 03:53:18 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 242HqJ4L015456;
 Mon, 2 May 2022 17:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=DfqY3uYtvCT+SMB1j8Gms2gErcLfkR1KObRdm1vwpKU=;
 b=f+0bhlGrQpvZvgjOnrgNFWEyNhBfxWWCPYYnMlDg1swvLgggcoRH3y+GFDn3tkfVf1X8
 7ICvUxKO7l/I556zOdM/qK6S9OeoictuLnGTckHHVOeJODgV81GdxNgIkqMgMT2MNm0n
 uIkDH2wqikqQtgRz9Rbb06f5TgTepaJB2idhGqGdL4URL2F0OrdcxtLtMEwyltYebzeZ
 BcLnfwPgE9tlv7ZVDb/MzI3f96kxcO3ZEo56NXYDVoZbra5p9IIeVZuceBsvAx1ZJC86
 AU7bf8PgfIVaV0IZRQthc++W7A00Czc/wjD2xGLmEteZoYPWMqjjW+SWESavki5fvnMP wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftm1tg21q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 17:53:11 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 242Hr2Qg017294;
 Mon, 2 May 2022 17:53:10 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ftm1tg21e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 17:53:10 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 242Hq6Te031290;
 Mon, 2 May 2022 17:53:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 3frvr9etv2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 02 May 2022 17:53:10 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 242Hr9te38011184
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 2 May 2022 17:53:09 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64710BE04F;
 Mon,  2 May 2022 17:53:09 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C0D6BBE054;
 Mon,  2 May 2022 17:53:08 +0000 (GMT)
Received: from localhost (unknown [9.160.92.116])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon,  2 May 2022 17:53:08 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH kernel] KVM: PPC: Book3s: Retire H_PUT_TCE/etc real mode
 handlers
In-Reply-To: <20220428071627.1767104-1-aik@ozlabs.ru>
References: <20220428071627.1767104-1-aik@ozlabs.ru>
Date: Mon, 02 May 2022 14:53:06 -0300
Message-ID: <87v8unx1ml.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: t6bDUsEyiQXCCY03LXnh1ef3QOBFeAKB
X-Proofpoint-GUID: yjt-kbAgr-MpdW4cQCaBZMbJzx_7mRGN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-02_05,2022-05-02_03,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 mlxlogscore=819 bulkscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2205020132
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, kvm-ppc@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Frederic Barrat <fbarrat@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexey Kardashevskiy <aik@ozlabs.ru> writes:

> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index d185dee26026..44d74bfe05df 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -1784,13 +1784,8 @@ hcall_real_table:
>  	.long	DOTSYM(kvmppc_h_clear_mod) - hcall_real_table
>  	.long	DOTSYM(kvmppc_h_clear_ref) - hcall_real_table
>  	.long	DOTSYM(kvmppc_h_protect) - hcall_real_table
> -#ifdef CONFIG_SPAPR_TCE_IOMMU
> -	.long	DOTSYM(kvmppc_h_get_tce) - hcall_real_table
> -	.long	DOTSYM(kvmppc_rm_h_put_tce) - hcall_real_table
> -#else
>  	.long	0		/* 0x1c */
>  	.long	0		/* 0x20 */
> -#endif
>  	.long	0		/* 0x24 - H_SET_SPRG0 */
>  	.long	DOTSYM(kvmppc_h_set_dabr) - hcall_real_table
>  	.long	DOTSYM(kvmppc_rm_h_page_init) - hcall_real_table
> @@ -1868,13 +1863,8 @@ hcall_real_table:
>  	.long	0		/* 0x12c */
>  	.long	0		/* 0x130 */
>  	.long	DOTSYM(kvmppc_h_set_xdabr) - hcall_real_table
> -#ifdef CONFIG_SPAPR_TCE_IOMMU
> -	.long	DOTSYM(kvmppc_rm_h_stuff_tce) - hcall_real_table
> -	.long	DOTSYM(kvmppc_rm_h_put_tce_indirect) - hcall_real_table
> -#else
>  	.long	0		/* 0x138 */
>  	.long	0		/* 0x13c */
> -#endif
>  	.long	0		/* 0x140 */
>  	.long	0		/* 0x144 */
>  	.long	0		/* 0x148 */

The ones you remove from here need to be added to kvmppc_hcall_impl_hv,
otherwise we get the WARN at init_default_hcalls because
kvmppc_hcall_impl_hv_realmode can't find them.
