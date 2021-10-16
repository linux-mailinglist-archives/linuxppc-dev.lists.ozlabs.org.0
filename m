Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B352E4302A5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 14:39:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWjQJ2M79z3cFY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 23:39:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FzpWvkhI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FzpWvkhI; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWjPT62QRz2yNY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 23:39:08 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19G9gJhw018658; 
 Sat, 16 Oct 2021 08:39:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=5e0KWe1rA3kFRmQYg7J1y3+orqqjCcPAvDiQ50gego8=;
 b=FzpWvkhIo54juScBlbLJRaXnzUCw4b0BZ/2nS1/VX1r6Qf+asVMkSWbBWTFUci5Ibkur
 adKKOqE0JNUZVBP/FgWbad+/NVGGXbkSsK0ETAwbmaTAGi8UyGmTt2H4dizkskXO4X9E
 MapFIPdaa94fBsxY+5dNNJl+ESn2lkT/LYyoDjLswjof+UX/u7413CuMC4nVqRwF06Aa
 3qo6+nb7VpmXlkT5cGeH8P8eLAoYESZvn5fRWrgmJebBbiYUA7R0pSA/tPHMI54KQhdR
 Fh+IA2Pu3o+kDSZ3RO9B3+51eDDwDy0PyEVoqPWtpE2LHvUvlnZu6XZLYwvoN1R3qHnl mA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqvb4t8k0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 08:39:04 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19GCd4JZ012634;
 Sat, 16 Oct 2021 08:39:04 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqvb4t8jv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 08:39:04 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19GCc1FD027543;
 Sat, 16 Oct 2021 12:39:04 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 3bqpc95kqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 12:39:03 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19GCd2QM46334264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 12:39:02 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8865DBE04F;
 Sat, 16 Oct 2021 12:39:02 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C7C3CBE059;
 Sat, 16 Oct 2021 12:39:01 +0000 (GMT)
Received: from localhost (unknown [9.211.42.218])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat, 16 Oct 2021 12:39:01 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 10/52] KVM: PPC: Book3S HV: Don't always save PMU for
 guest capable of nesting
In-Reply-To: <20211004160049.1338837-11-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-11-npiggin@gmail.com>
Date: Sat, 16 Oct 2021 09:38:58 -0300
Message-ID: <87zgr9w3dp.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: YtcV_kvPA5gZfOUnZU_qCyP0zuoE7Hxe
X-Proofpoint-GUID: -seYunrUkVj7_orXZvxbqh8KO-md_dRZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-16_04,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 mlxscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 clxscore=1015 phishscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110160081
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

> Provide a config option that controls the workaround added by commit
> 63279eeb7f93 ("KVM: PPC: Book3S HV: Always save guest pmu for guest
> capable of nesting"). The option defaults to y for now, but is expected
> to go away within a few releases.
>
> Nested capable guests running with the earlier commit ("KVM: PPC: Book3S
> HV Nested: Indicate guest PMU in-use in VPA") will now indicate the PMU

I think the commit reference is now: 178266389794 (KVM: PPC: Book3S HV
Nested: Reflect guest PMU in-use to L0 when guest SPRs are live)

> in-use status of their guests, which means the parent does not need to
> unconditionally save the PMU for nested capable guests.
>
> After this latest round of performance optimisations, this option costs
> about 540 cycles or 10% entry/exit performance on a POWER9 nested-capable
> guest.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/Kconfig     | 15 +++++++++++++++
>  arch/powerpc/kvm/book3s_hv.c | 10 ++++++++--
>  2 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
> index ff581d70f20c..1e7aae522be8 100644
> --- a/arch/powerpc/kvm/Kconfig
> +++ b/arch/powerpc/kvm/Kconfig
> @@ -130,6 +130,21 @@ config KVM_BOOK3S_HV_EXIT_TIMING
>
>  	  If unsure, say N.
>
> +config KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND
> +	bool "Nested L0 host workaround for L1 KVM host PMU handling bug" if EXPERT
> +	depends on KVM_BOOK3S_HV_POSSIBLE
> +	default !EXPERT
> +	help
> +	  Old nested HV capable Linux guests have a bug where the don't

s/the/they/

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
