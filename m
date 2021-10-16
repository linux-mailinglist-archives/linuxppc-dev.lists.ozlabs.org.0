Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 843FB4302B0
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Oct 2021 15:00:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HWjtB0GXWz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 00:00:34 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=N/gCmMeF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=N/gCmMeF; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HWjsW0LXJz2yn4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Oct 2021 23:59:58 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19GCVYYj024739; 
 Sat, 16 Oct 2021 08:59:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=e2CHQuMWqsrKzqngiVwCf3OPzC+LpYoGI7hr7F2OOYA=;
 b=N/gCmMeFtOtu4WsxRvIdgpb5zyYWk3xDcyubYt299tNpQGbjmJnOBm4La8XGxYs0a9ON
 OgOjTaMuqDf2OiDqRApLu62tB8ww1KLqxsaAmzDujoVHTBz4nLHBST12n0MH0sLGUVbe
 zCvbhy0SC1+frlnad7Bb8ZwjmjVfq00lNlohEuh2RziWJlPR+Qubqr3foXyC4EpcFKjp
 NUnTwxvpDa79TpVClvRQ2PXKZATEek8W+DvRtvY4L9kyZ31/pINMpMLN64vR+Y0XShVf
 aVvTF8k9000GzuxSC3PlQkve+esnXzSOkvF8/qyGKulikhWioK+9bv92LMGDqVKj9iVg YA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqxtpga25-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 08:59:55 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 19GCroVQ031718;
 Sat, 16 Oct 2021 08:59:55 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bqxtpga1x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 08:59:55 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19GCrlb4008487;
 Sat, 16 Oct 2021 12:59:54 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3bqpc9ckf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 16 Oct 2021 12:59:54 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19GCxriH18678074
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 16 Oct 2021 12:59:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 179FA7805E;
 Sat, 16 Oct 2021 12:59:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 428767805F;
 Sat, 16 Oct 2021 12:59:52 +0000 (GMT)
Received: from localhost (unknown [9.211.42.218])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Sat, 16 Oct 2021 12:59:51 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v3 18/52] KVM: PPC: Book3S HV P9: Move SPRG restore to
 restore_p9_host_os_sprs
In-Reply-To: <20211004160049.1338837-19-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
 <20211004160049.1338837-19-npiggin@gmail.com>
Date: Sat, 16 Oct 2021 09:59:49 -0300
Message-ID: <87tuhhw2ey.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zh5C-HZDb5OpoJ6pUIA3ox3ZyR875h06
X-Proofpoint-GUID: 13zKKefGHdjFu6wzkUR-GrJHaq9yY5tk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-16_04,2021-10-14_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 mlxscore=0 suspectscore=0 adultscore=0 mlxlogscore=999 priorityscore=1501
 malwarescore=0 impostorscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110160081
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

> Move the SPR update into its relevant helper function. This will
> help with SPR scheduling improvements in later changes.
>
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>

> ---
>  arch/powerpc/kvm/book3s_hv.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 1c5b81bd02c1..fca89ed2244f 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4093,6 +4093,8 @@ static void save_p9_host_os_sprs(struct p9_host_os_sprs *host_os_sprs)
>  static void restore_p9_host_os_sprs(struct kvm_vcpu *vcpu,
>  				    struct p9_host_os_sprs *host_os_sprs)
>  {
> +	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
> +
>  	mtspr(SPRN_PSPB, 0);
>  	mtspr(SPRN_UAMOR, 0);
>
> @@ -4293,8 +4295,6 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>
>  	timer_rearm_host_dec(tb);
>
> -	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
> -
>  	kvmppc_subcore_exit_guest();
>
>  	return trap;
