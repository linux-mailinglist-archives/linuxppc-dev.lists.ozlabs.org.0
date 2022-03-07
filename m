Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D2074CF185
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 06:59:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KBnpL0Cqtz3bPD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Mar 2022 16:59:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Fg/pz6RU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Fg/pz6RU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KBnnY3TF4z2ymt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Mar 2022 16:58:25 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2275XXWh023865; 
 Mon, 7 Mar 2022 05:58:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=87rEjW5NS8ZsqPTT3F/sNxN2F5rpx+lhsvOLlHNc32E=;
 b=Fg/pz6RUh4z9MhK4JaPnGjqjw73CLD+jNoUb0dOoRF2mvWkFeCR6dN71awuyiXio1Ag1
 pAH5/3xH06bz8k0fDIiQjVz8yUsohMYhUwJFXOePXTMdz7gCG2aQ2xsbKjzWvQ3RJyf1
 nAHzhZtrb2FGLpywQ+m6aI2frBJS1vHrdG/0acxlLWQ1U6D3eAefvve7GkrNFF/J600t
 b5h32J/LoLySxGaKaj6A8ZLyZX4S0smWH6GaPIAf4TtvVwqg1Qa3NG+H0bAOGkT2wEXe
 LI3Ep3xa7wUGv6f4V5btmwir+Nn7ark1BDG0A34A7eCM7l7LvR8zF0BpV56/rvD3Nylg wA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3emsnunkpa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 05:58:20 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2275uVcD022494;
 Mon, 7 Mar 2022 05:58:19 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3emsnunkp1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 05:58:19 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2275qg7v011861;
 Mon, 7 Mar 2022 05:58:18 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 3ekyg8ujhr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Mar 2022 05:58:18 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2275wHHo12911300
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Mar 2022 05:58:17 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 84A43C605A;
 Mon,  7 Mar 2022 05:58:17 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15EEAC6057;
 Mon,  7 Mar 2022 05:58:15 +0000 (GMT)
Received: from skywalker.linux.ibm.com (unknown [9.43.89.15])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  7 Mar 2022 05:58:14 +0000 (GMT)
X-Mailer: emacs 29.0.50 (via feedmail 11-beta-1 I)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: Fabiano Rosas <farosas@linux.ibm.com>, kvm-ppc@vger.kernel.org
Subject: Re: [RFC PATCH] KVM: PPC: Book3s HV: Allow setting GTSE for the
 nested guest
In-Reply-To: <20220304182657.2489303-1-farosas@linux.ibm.com>
References: <20220304182657.2489303-1-farosas@linux.ibm.com>
Date: Mon, 07 Mar 2022 11:28:10 +0530
Message-ID: <87bkyitibx.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: wfRUBvWbt1s6gp7LeRCi4lPKqfhzdax3
X-Proofpoint-GUID: _B2ViDADioo4kK7j7ZtCjshhDhl6-DnI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-07_01,2022-03-04_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 suspectscore=0 spamscore=0 lowpriorityscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 bulkscore=0 mlxlogscore=999 phishscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203070033
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Fabiano Rosas <farosas@linux.ibm.com> writes:

> We're currently getting a Program Interrupt inside the nested guest
> kernel when running with GTSE disabled in the nested hypervisor. We
> allow any guest a cmdline override of GTSE for migration purposes. The
> nested guest does not know it needs to use the option and tries to run
> 'tlbie' with LPCR_GTSE=0.
>
> The details are a bit more intricate:
>
> QEMU always sets GTSE=1 in OV5 even before calling KVM. At prom_init,
> guests use the OV5 value to set MMU_FTR_GTSE. This setting can be
> overridden by 'radix_hcall_invalidate=on' in the kernel cmdline. The
> option itself depends on the availability of
> FW_FEATURE_RPT_INVALIDATE, which it tied to QEMU's cap-rpt-invalidate
> capability.
>
> The MMU_FTR_GTSE flag leads guests to set PROC_TABLE_GTSE in their
> process tables and after H_REGISTER_PROC_TBL, both QEMU and KVM will
> set LPCR_GTSE=1 for that guest. Unless the guest uses the cmdline
> override, in which case:
>
>   MMU_FTR_GTSE=0 -> PROC_TABLE_GTSE=0 -> LPCR_GTSE=0
>
> We don't allow the nested hypervisor to set some LPCR bits for its
> nested guests, so if the nested HV has LPCR_GTSE=0, its nested guests
> will also have LPCR_GTSE=0. But since the only thing that can really
> flip GTSE is the cmdline override, if a nested guest runs without it,
> then the sequence goes:
>
>   MMU_FTR_GTSE=1 -> PROC_TABLE_GTSE=1 -> LPCR_GTSE=0.
>
> With LPCR_GTSE=0 the HW will treat 'tlbie' as HV privileged.
>
> This patch allows a nested HV to set LPCR_GTSE for its nested guests
> so the LPCR setting will match what the nested guest sees in OV5.

This needs a Fixes: tag?

I am not sure what is broken. If L1 doesn't support GTSE, then it should
publish the same to L2 and L2 should not use tlbie. That was working
before? Or is it that the kernel command to disable gtse when used with
L2 kernel is broken? 

>
> Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
> ---
>  arch/powerpc/kvm/book3s_hv_nested.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv_nested.c b/arch/powerpc/kvm/book3s_hv_nested.c
> index 9d373f8963ee..5b9008d89f90 100644
> --- a/arch/powerpc/kvm/book3s_hv_nested.c
> +++ b/arch/powerpc/kvm/book3s_hv_nested.c
> @@ -262,7 +262,7 @@ static void load_l2_hv_regs(struct kvm_vcpu *vcpu,
>  	 * Don't let L1 change LPCR bits for the L2 except these:
>  	 */
>  	mask = LPCR_DPFD | LPCR_ILE | LPCR_TC | LPCR_AIL | LPCR_LD |
> -		LPCR_LPES | LPCR_MER;
> +		LPCR_LPES | LPCR_MER | LPCR_GTSE;
>  
>  	/*
>  	 * Additional filtering is required depending on hardware
> -- 
> 2.34.1
