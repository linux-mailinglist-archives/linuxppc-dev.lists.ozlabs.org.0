Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1BD6ABF66
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 13:25:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVd8658yKz3cjG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 23:25:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijwThBVX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=kconsul@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ijwThBVX;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVd776889z3bhL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 23:24:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326A4N0c032086;
	Mon, 6 Mar 2023 12:24:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=TKo4EniFyUQ9UcC9ptHSFwojy0uYD8MjopG2PyaQYZE=;
 b=ijwThBVXNjGbogoIGaFmGas03Rah9wXP0E+AjOAfNM7GkIqSEyJFC14l/h6R+HpsXJpc
 LVa+44eP0pQBISJRD8KeqU5Hpn75KpGJ73c5uuBSC88kPhG2uytmITaGZWi5YavaOFzJ
 2Srl9r4Q9YRS+gTLGyc/xAR6w8NfAT+k5syL3V0Py3nr05/u/8/U634Wx9l7OzDvJ0Fp
 tueVPTWTaS4nKYKFGjPUuFdLiEgC+apJ5fJXjTfzyGQ0qyuUmFdsNPIeQhMXN1EMhYbN
 /O/ryb9lo1YxjAWBgJQxZwnAIEM2vuH4FFIq/EVddtbS8NLjGRTbVQ0z6CTApbPoXAZJ 5g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4u1jfgyj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 12:24:27 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326BnQCW022896;
	Mon, 6 Mar 2023 12:24:26 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3p4u1jfgxx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 12:24:25 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 326BPUd6006237;
	Mon, 6 Mar 2023 12:24:23 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3p418ctpdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 12:24:23 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 326COKl859441514
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 6 Mar 2023 12:24:20 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F24232004D;
	Mon,  6 Mar 2023 12:24:19 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD02F20040;
	Mon,  6 Mar 2023 12:24:17 +0000 (GMT)
Received: from li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com (unknown [9.109.216.99])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon,  6 Mar 2023 12:24:17 +0000 (GMT)
Date: Mon, 6 Mar 2023 17:54:15 +0530
From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
        Fabiano Rosas <farosas@linux.ibm.com>,
        Alexey Kardashevskiy <aik@ozlabs.ru>,
        Sathvika Vasireddy <sv@linux.ibm.com>
Subject: Re: [PATCH 2/2] arch/powerpc/kvm: kvmppc_hv_entry: remove r4 argument
Message-ID: <ZAXbb9shzU+6l0wh@li-a450e7cc-27df-11b2-a85c-b5a9ac31e8ef.ibm.com>
References: <20230220052355.109033-1-kconsul@linux.vnet.ibm.com>
 <20230220052355.109033-3-kconsul@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220052355.109033-3-kconsul@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: FQXufYaLm8jNx6O2KAyuTTxb16rR77nS
X-Proofpoint-ORIG-GUID: 0QUjFn2q0seyNg8pxknah_alctjC9P_F
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_05,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060106
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2023-02-20 10:53:55, Kautuk Consul wrote:
> kvmppc_hv_entry is called from only 2 locations within
> book3s_hv_rmhandlers.S. Both of those locations set r4
> as HSTATE_KVM_VCPU(r13) before calling kvmppc_hv_entry.
> So, shift the r4 load instruction to kvmppc_hv_entry and
> thus modify the calling convention of this function.
> 

I am posting v2 of this patch-set now.
I have tested this on POWER8 and it works fine.
Can anyone review the v2 for this patch ? 
I didn't receive any review comments for this patch.

> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> index 7e063fde7adc..922667b09168 100644
> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
> @@ -85,7 +85,7 @@ _GLOBAL_TOC(kvmppc_hv_entry_trampoline)
>  	RFI_TO_KERNEL
> 
>  kvmppc_call_hv_entry:
> -	ld	r4, HSTATE_KVM_VCPU(r13)
> +	/* Enter guest. */
>  	bl	kvmppc_hv_entry
> 
>  	/* Back from guest - restore host state and return to caller */
> @@ -352,9 +352,7 @@ kvm_secondary_got_guest:
>  	mtspr	SPRN_LDBAR, r0
>  	isync
>  63:
> -	/* Order load of vcpu after load of vcore */
> -	lwsync
> -	ld	r4, HSTATE_KVM_VCPU(r13)
> +	/* Enter guest. */
>  	bl	kvmppc_hv_entry
> 
>  	/* Back from the guest, go back to nap */
> @@ -506,7 +504,6 @@ kvmppc_hv_entry:
> 
>  	/* Required state:
>  	 *
> -	 * R4 = vcpu pointer (or NULL)
>  	 * MSR = ~IR|DR
>  	 * R13 = PACA
>  	 * R1 = host R1
> @@ -524,6 +521,8 @@ kvmppc_hv_entry:
>  	li	r6, KVM_GUEST_MODE_HOST_HV
>  	stb	r6, HSTATE_IN_GUEST(r13)
> 
> +	ld	r4, HSTATE_KVM_VCPU(r13)
> +
>  #ifdef CONFIG_KVM_BOOK3S_HV_P8_TIMING
>  	/* Store initial timestamp */
>  	cmpdi	r4, 0
> -- 
> 2.31.1
> 
