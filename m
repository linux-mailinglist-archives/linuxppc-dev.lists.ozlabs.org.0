Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85D49867C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jan 2022 18:22:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JjGxr3qHNz3cBN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jan 2022 04:22:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=AoV9cysk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=AoV9cysk; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JjGx60KhYz2x9V
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Jan 2022 04:21:29 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20OGBXsg039299
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 17:21:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=FZ3+Ko/ZHGdwEh4xxV16opXaw/gl0p22tqQPwWr7Fs4=;
 b=AoV9cyskjfnEcGdkcNPGFeZKh1DdzMJRHAxrv7Bkn91hYuHsi9AemCiIvpw1NjpQD9x1
 B7VRG5SEAjJtF+v23TBfLyapkdGDANEMaV8Lz42sBC3snnXS7GnQ658/oeIicHTRrEwt
 3vk2BloP9EoHS0XjN4lPnCBPZopstnepVk+jNvobngFDxK9Vzha0TdRMgUkrgYBxEfxQ
 R8sd2Qo1r/HH3flW1rRpjeuYA3unhIvqE7dRJUl+V8dduZgFIfA72FjHirWMLUdOaYHu
 2fe1MHkHdv64tSfLU0e8BRGY9xaH1IPLlIWr4q5Nb7LlLGV9+3whNKPJz/88zRW6++x0 Hw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsydthqt9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 17:21:27 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20OGUBP7027359
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jan 2022 17:21:27 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dsydthqsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 17:21:27 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20OHDQch014599;
 Mon, 24 Jan 2022 17:21:26 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 3dr9ja3q46-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Jan 2022 17:21:26 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20OHLOQU35913990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Jan 2022 17:21:24 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AECAC605A;
 Mon, 24 Jan 2022 17:21:24 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8DEFEC6061;
 Mon, 24 Jan 2022 17:21:23 +0000 (GMT)
Received: from localhost (unknown [9.163.24.67])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Mon, 24 Jan 2022 17:21:23 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] KVM: PPC: Book3S HV: HFSCR[PREFIX] does not exist
In-Reply-To: <20220122105639.3477407-1-npiggin@gmail.com>
References: <20220122105639.3477407-1-npiggin@gmail.com>
Date: Mon, 24 Jan 2022 14:21:21 -0300
Message-ID: <87v8y9dp7y.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FXI7684O8ER766dIWJrDntdySrmSDzJo
X-Proofpoint-ORIG-GUID: 6Ttfrz_k7hH_G4c0AIG-a_NApHPlfa12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-24_08,2022-01-24_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 clxscore=1015 mlxlogscore=999 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2201240114
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> This facility is controlled by FSCR only. Reserved bits should not be
> set in the HFSCR register (although it's likely harmless as this
> position would not be re-used, and the L0 is forgiving here too).
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/include/asm/reg.h | 1 -
>  arch/powerpc/kvm/book3s_hv.c   | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 2835f6363228..1e14324c5190 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -417,7 +417,6 @@
>  #define   FSCR_DSCR	__MASK(FSCR_DSCR_LG)
>  #define   FSCR_INTR_CAUSE (ASM_CONST(0xFF) << 56)	/* interrupt cause */
>  #define SPRN_HFSCR	0xbe	/* HV=1 Facility Status & Control Register */
> -#define   HFSCR_PREFIX	__MASK(FSCR_PREFIX_LG)
>  #define   HFSCR_MSGP	__MASK(FSCR_MSGP_LG)
>  #define   HFSCR_TAR	__MASK(FSCR_TAR_LG)
>  #define   HFSCR_EBB	__MASK(FSCR_EBB_LG)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 84c89f08ae9a..be8914c3dde9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -2830,7 +2830,7 @@ static int kvmppc_core_vcpu_create_hv(struct kvm_vcpu *vcpu)
>  	 * to trap and then we emulate them.
>  	 */
>  	vcpu->arch.hfscr = HFSCR_TAR | HFSCR_EBB | HFSCR_PM | HFSCR_BHRB |
> -		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP | HFSCR_PREFIX;
> +		HFSCR_DSCR | HFSCR_VECVSX | HFSCR_FP;
>  	if (cpu_has_feature(CPU_FTR_HVMODE)) {
>  		vcpu->arch.hfscr &= mfspr(SPRN_HFSCR);
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
