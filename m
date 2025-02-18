Return-Path: <linuxppc-dev+bounces-6318-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B07A6A39E55
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Feb 2025 15:11:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yy1f432xYz304s;
	Wed, 19 Feb 2025 01:11:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739887868;
	cv=none; b=B2yIMXv9Xudr6bD523GICFMRgGeY1ODRZO1pajx1rjTAMoKWp5GFwQlhmayJO5rK9Cv9qU+pTYWbEyIo/22stmYX/0CMErtDuiv4cFe7NKQdV75Jm70X2L30ZN7ebJkomp+9McYlTydySV6nzft+gBJUEQUn9B42Pm5qiFT7jW1NcQYpg0VvsAgDHkssBLTUYW8gbIDJVD6rpvS6qw9NsmRjhAb6Of5BM1LgmzuD7r5u8T3xkadk+V29TjCbLq2RmXxl+aKM/Nz1OOmeegICgPbdMMBX86WLbkM9mW/nKlMhSCgqRlQqPiqMaXY+cvwxJ5yEXwFu9BqgDg6VzmRAag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739887868; c=relaxed/relaxed;
	bh=x9KAvFKzoCjfbssZ2GysCMFj7HXNV5bEADEv9sZWwHY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K34wgC+bd0eJO4IO9zuYv3Q2HN+tQ9hWipM3RxKt6uEcfVOMsKmlrzNbdS4n3xrHJM84a0uR2ZbZPyUMOENt32RElrDVShLPBzYXjmL1wJk4Sy0ya01FlxdU/qLbLcvt4sccjiYoU7uOrSBVmdXGQpmxXqV2fNTMaBk0fR7Hrm05POfj1B0ky4VpDGibNQBTM289MoC9i1tB5A2AZTjxsyLXsZd5NI2+5z5AUwjZ8xY9Eo4VepbpLkWH8rt2F/ppGeuCPKtSdA7wXTRPjA2YCQJMqnUvFZfPDWxKxrw6EdwrpDVTp4NB+Y4AgAfID7p/mB7FOV+t5I82C39gmrdDJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNlZveZW; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XNlZveZW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yy1f14vp4z2ytT
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2025 01:11:05 +1100 (AEDT)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51I7XE6j009948;
	Tue, 18 Feb 2025 14:10:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=pp1; bh=x9KAvFKzoCjfbssZ2GysCMFj7HXNV5
	bEADEv9sZWwHY=; b=XNlZveZW32fHmU0ddBApqaOqtFZDf8IR5z1DqsQMtRfphg
	K0jhbKsEILXQlkcPwIpAf+unobXxVF3cj2sTKBs9s/B/HemVTZFF+putk7q6bqc5
	o5lsLhZGssUvXwE3a6UJi5vawuJvEPE32taooF1BG5F1QwYASgOmt8UT7MktwcIT
	wsYqI21auwNMpwsx2oLhQovtRSaDTOYaAyxPBNmFuvy3U6BtRKybPIfZw0yheq9/
	BkmX9VFCKPz6TE0IcJ2rjptMpaJFjvoDHePTYkinN8PKfSwmuVAzVfGt6f0RCk2p
	Ar2DReYsVvuBPU+vOwUTCYDvOn/16XkDsjW18ALw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44vnwphur2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:10:51 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51IE2GbP014750;
	Tue, 18 Feb 2025 14:10:50 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44vnwphuqt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:10:50 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51ID5E57008155;
	Tue, 18 Feb 2025 14:10:50 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44u58tkqbr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Feb 2025 14:10:49 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51IEAkZ719792266
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Feb 2025 14:10:46 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5A2A72004B;
	Tue, 18 Feb 2025 14:10:46 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 411CE20043;
	Tue, 18 Feb 2025 14:10:43 +0000 (GMT)
Received: from li-e7e2bd4c-2dae-11b2-a85c-bfd29497117c.ibm.com (unknown [9.124.223.231])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 18 Feb 2025 14:10:43 +0000 (GMT)
Date: Tue, 18 Feb 2025 19:40:38 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, Vaibhav Jain <vaibhav@linux.ibm.com>,
        Shivaprasad G Bhat <sbhat@linux.ibm.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] KVM: PPC: Enable CAP_SPAPR_TCE_VFIO on pSeries KVM
 guests
Message-ID: <20250218193759.261b658a-40-amachhiw@linux.ibm.com>
Mail-Followup-To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	Vaibhav Jain <vaibhav@linux.ibm.com>, Shivaprasad G Bhat <sbhat@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20250129094033.2265211-1-amachhiw@linux.ibm.com>
 <8734gdqky4.fsf@gmail.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734gdqky4.fsf@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 5FtYUAbJXnLQacYSRs_w_gQgikmOfhs4
X-Proofpoint-ORIG-GUID: RGFuLxK2PqGqaA5i6nsKd9j9s8CwlIjw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_06,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_spam_definite policy=outbound score=100 priorityscore=1501
 spamscore=100 mlxlogscore=-999 impostorscore=0 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxscore=100 adultscore=0 suspectscore=0
 bulkscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180106
X-Spam-Status: No, score=-0.7 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Hi Ritesh,

Thanks for reviewing the patch. My response is inline:

On 2025/02/17 09:30 AM, Ritesh Harjani (IBM) wrote:
> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> 
> > Currently on book3s-hv, the capability KVM_CAP_SPAPR_TCE_VFIO is only
> > available for KVM Guests running on PowerNV and not for the KVM guests
> > running on pSeries hypervisors. This prevents a pSeries L2 guest from
> > leveraging the in-kernel acceleration for H_PUT_TCE_INDIRECT and
> > H_STUFF_TCE hcalls that results in slow startup times for large memory
> > guests.
> >
> > Fix this by enabling the CAP_SPAPR_TCE_VFIO on the pSeries hosts as well
> > for the nested PAPR guests. With the patch, booting an L2 guest with
> > 128G memory results in an average improvement of 11% in the startup
> > times.
> >
> > Fixes: f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> > ---
> > Changes since v1:
> >     * Addressed review comments from Ritesh
> >     * v1: https://lore.kernel.org/all/20250109132053.158436-1-amachhiw@linux.ibm.com/
> 
> Thanks Amit for v2. However we still didn't answer one important
> question regarding the context / background of this patch asked here [2]
> 
> [2]: https://lore.kernel.org/linuxppc-dev/87r059vpmi.fsf@gmail.com/
> 
> <copy paste from v1>
>     IIUC it was said here [1] that this capability is not available on
>     pSeries, hence it got removed. Could you please give a background on
>     why this can be enabled now for pSeries? Was there any additional
>     support added for this? 
>     [1]:
>     https://lore.kernel.org/linuxppc-dev/20181214052910.23639-2-sjitindarsingh@gmail.com/
> 
>     ... Ohh thinking back a little, are you saying that after the patch...
>     f431a8cde7f1 ("powerpc/iommu: Reimplement the iommu_table_group_ops for pSeries")
>     ...we can bring back this capability for kvm guest running on pseries
>     as well. Because all underlying issues in using VFIO on pseries were
>     fixed. Is this understanding correct? 
> 

Yes, your understanding is correct.

> 
> Please also update the commit message with the required context of why we can
> enable this capability now while it was explicitely marked as disabled
> earlier in [1].
> 

Sure, I'll update the patch description and send a v3 soon.

> But looks good otherwise. With that addressed in the commit message,
> please feel free to add - 
> 
> Reviewed-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
> 

Thanks!

~ Amit

> -ritesh
> 
> >
> >  arch/powerpc/kvm/powerpc.c | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> > index ce1d91eed231..a7138eb18d59 100644
> > --- a/arch/powerpc/kvm/powerpc.c
> > +++ b/arch/powerpc/kvm/powerpc.c
> > @@ -543,26 +543,23 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  		r = !hv_enabled;
> >  		break;
> >  #ifdef CONFIG_KVM_MPIC
> >  	case KVM_CAP_IRQ_MPIC:
> >  		r = 1;
> >  		break;
> >  #endif
> >
> >  #ifdef CONFIG_PPC_BOOK3S_64
> >  	case KVM_CAP_SPAPR_TCE:
> > +		fallthrough;
> >  	case KVM_CAP_SPAPR_TCE_64:
> > -		r = 1;
> > -		break;
> >  	case KVM_CAP_SPAPR_TCE_VFIO:
> > -		r = !!cpu_has_feature(CPU_FTR_HVMODE);
> > -		break;
> >  	case KVM_CAP_PPC_RTAS:
> >  	case KVM_CAP_PPC_FIXUP_HCALL:
> >  	case KVM_CAP_PPC_ENABLE_HCALL:
> >  #ifdef CONFIG_KVM_XICS
> >  	case KVM_CAP_IRQ_XICS:
> >  #endif
> >  	case KVM_CAP_PPC_GET_CPU_CHAR:
> >  		r = 1;
> >  		break;
> >  #ifdef CONFIG_KVM_XIVE
> >
> > base-commit: 6d61a53dd6f55405ebcaea6ee38d1ab5a8856c2c
> > -- 
> > 2.48.1

