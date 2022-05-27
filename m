Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A480536714
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 May 2022 20:45:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L8tzZ0xhcz3by8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 May 2022 04:45:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XCV12Hx9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XCV12Hx9;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4L8tys0DSkz3blW
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 May 2022 04:45:08 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 24RHEGD1025088
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:45:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=D7DNj2I/4oziq78fUKNxi9Ya7sm9/wAaAsUr0jkgMUg=;
 b=XCV12Hx9QY0l5E9NGj+W6PfP04j6gEurulJNLe6BjipHVZh2Cm56HNCSw6pCp0BOQSFL
 P6nGiLhgVwI/1jerq+GrBkom3wGFfL0NvbFCCq3VJ0t0/kObjUkufbUWSGuwbiz+UoFF
 QxvOuRPS1XsSNPO0qyloNGGKhYkjdrkpU27/T9eRxm6PW474KHCaiWxiayH0TlnchjD4
 eIVuujFkIvqTM6A79CMfcdiSF+fq2hA3b3etVfytbjxI5a8tPPYkD+LSekbc84B07MKN
 4DiOft1WBWfXE/LOHgqw+23zYGTmzIr+S2dk9MErIl1+DINdAMiChhNvkztAcAibeJJF kg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb2v49fcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:45:04 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 24RITc1g018150
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 May 2022 18:45:04 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gb2v49fcm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 18:45:04 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 24RIYtCq028875;
	Fri, 27 May 2022 18:45:03 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com [9.57.198.23])
	by ppma02wdc.us.ibm.com with ESMTP id 3gagpkxksa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 May 2022 18:45:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 24RIj3gf24707374
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 May 2022 18:45:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75EACAC060;
	Fri, 27 May 2022 18:45:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E524BAC062;
	Fri, 27 May 2022 18:45:02 +0000 (GMT)
Received: from localhost (unknown [9.77.139.3])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTPS;
	Fri, 27 May 2022 18:45:02 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/4] KVM: PPC: Book3S HV P9: Restore stolen time logging
 in dtl
In-Reply-To: <20220518133935.3878954-1-npiggin@gmail.com>
References: <20220518133935.3878954-1-npiggin@gmail.com>
Date: Fri, 27 May 2022 15:45:01 -0300
Message-ID: <87leumlsr6.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: nxg82F4qZOVc-58g2CDOt6Cb5nxYT6CW
X-Proofpoint-GUID: xwXeGWK-nsMtqzeI1HnLkA8CXwDTkfAy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-05-27_05,2022-05-27_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 priorityscore=1501 mlxlogscore=649 clxscore=1015 spamscore=0 mlxscore=0
 phishscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2205270090
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:

> Stolen time logging in dtl was removed from the P9 path, so guests had
> no stolen time accounting. Add it back in a simpler way that still
> avoids locks and per-core accounting code.
>
> Fixes: ecb6a7207f92 ("KVM: PPC: Book3S HV P9: Remove most of the vcore logic")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/kvm/book3s_hv.c | 49 +++++++++++++++++++++++++++++++++---
>  1 file changed, 45 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6fa518f6501d..0a0835edb64a 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -248,6 +248,7 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
>
>  /*
>   * We use the vcpu_load/put functions to measure stolen time.
> + *
>   * Stolen time is counted as time when either the vcpu is able to
>   * run as part of a virtual core, but the task running the vcore
>   * is preempted or sleeping, or when the vcpu needs something done
> @@ -277,6 +278,12 @@ static void kvmppc_fast_vcpu_kick_hv(struct kvm_vcpu *vcpu)
>   * lock.  The stolen times are measured in units of timebase ticks.
>   * (Note that the != TB_NIL checks below are purely defensive;
>   * they should never fail.)
> + *
> + * The POWER9 path is simpler, one vcpu per virtual core so the
> + * former case does not exist. If a vcpu is preempted when it is
> + * BUSY_IN_HOST and not ceded or otherwise blocked, then accumulate
> + * the stolen cycles in busy_stolen. RUNNING is not a preemptible
> + * state in the P9 path.

Do you mean RUNNABLE? The only RUNNING state I see is in relation to the
vcore.

