Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3624684032A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 11:48:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VX9e2rP6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNlQc0qlNz3cPt
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 21:48:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=VX9e2rP6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=amachhiw@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TNlPs6N31z2ygX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 21:48:01 +1100 (AEDT)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40T8sO0g012993;
	Mon, 29 Jan 2024 10:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=Ij2Rapdm3IU0nLKbuSjeynA+xLwbQej0VShoWHYQmTI=;
 b=VX9e2rP6cgm1T+3AfvrEovdzvPl+1o9WM1j4gbyF8sPupu5P0r8sbQuT0Oa6/vLHnJ+X
 4EFj6aeg+zAe5O6DZX7ZyQuwDwv7hku/yCSUP/EWd43Seaiq0/5FkHnIhdAn6h08fHFf
 rs/yupBXAQH7Puc1fs0/qZqBpK9zRoK6yLjyo0Vg3Q/Z73EBEEOr0CeZCTNmlG29l70n
 MWTOW3qKZrM1Fp5QWMnt/yHUzUWHNTK25ewPAoCgJGtUErIb1fnutQFQJosGWZVyI2ZM
 MMRT/8H3qWzi3yyxtFZ4zXTsHXaS9C/klKxIYshMzzOD1Esj0AtWwqHIHBvl99Qkec6v YQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx75bmtxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:47:51 +0000
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 40T9CiDI011814;
	Mon, 29 Jan 2024 10:47:51 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3vx75bmtwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:47:50 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 40TAIF75002319;
	Mon, 29 Jan 2024 10:47:49 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3vwc5syy1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jan 2024 10:47:49 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 40TAlkHY64750026
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 29 Jan 2024 10:47:46 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C06F520040;
	Mon, 29 Jan 2024 10:47:46 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4C68B20049;
	Mon, 29 Jan 2024 10:47:44 +0000 (GMT)
Received: from li-a83676cc-350e-11b2-a85c-e11f86bb8d73.ibm.com (unknown [9.204.204.156])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Mon, 29 Jan 2024 10:47:44 +0000 (GMT)
Date: Mon, 29 Jan 2024 16:17:41 +0530
From: Amit Machhiwal <amachhiw@linux.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
        linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
        kvm-ppc@vger.kernel.org
Subject: Re: Re: [PATCH] KVM: PPC: Book3S HV: Fix L2 guest reboot failure due
 to empty 'arch_compat'
Message-ID: <2p36gb2dfk2s4tro6uekxbngyqwxmiddbh73zs6wz47d5wtnue@ioogh7wwzjdf>
Mail-Followup-To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, 
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, kvm-ppc@vger.kernel.org, 
	Vaibhav Jain <vaibhav@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Jordan Niethe <jniethe5@gmail.com>, 
	Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org
References: <20240118095653.2588129-1-amachhiw@linux.ibm.com>
 <87v87jp4i4.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87v87jp4i4.fsf@kernel.org>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: KHp5UWja3MsK7G_MPsaa240H1_-6d7PL
X-Proofpoint-ORIG-GUID: YqhCIo7KA7Cex_JHgQ2eF__LhzplDpDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-29_06,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 mlxlogscore=851 spamscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401290078
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Aneesh,

Thanks for looking into the patch. My comments are inline below.

On 2024/01/24 01:06 PM, Aneesh Kumar K.V wrote:
> Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> 
> > Currently, rebooting a pseries nested qemu-kvm guest (L2) results in
> > below error as L1 qemu sends PVR value 'arch_compat' == 0 via
> > ppc_set_compat ioctl. This triggers a condition failure in
> > kvmppc_set_arch_compat() resulting in an EINVAL.
> >
> > qemu-system-ppc64: Unable to set CPU compatibility mode in KVM: Invalid
> >
> > This patch updates kvmppc_set_arch_compat() to use the host PVR value if
> > 'compat_pvr' == 0 indicating that qemu doesn't want to enforce any
> > specific PVR compat mode.
> >
> > Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> > ---
> >  arch/powerpc/kvm/book3s_hv.c          |  2 +-
> >  arch/powerpc/kvm/book3s_hv_nestedv2.c | 12 ++++++++++--
> >  2 files changed, 11 insertions(+), 3 deletions(-)
> >
> > diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> > index 1ed6ec140701..9573d7f4764a 100644
> > --- a/arch/powerpc/kvm/book3s_hv.c
> > +++ b/arch/powerpc/kvm/book3s_hv.c
> > @@ -439,7 +439,7 @@ static int kvmppc_set_arch_compat(struct kvm_vcpu *vcpu, u32 arch_compat)
> >  	if (guest_pcr_bit > host_pcr_bit)
> >  		return -EINVAL;
> >  
> > -	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
> > +	if (kvmhv_on_pseries() && kvmhv_is_nestedv2() && arch_compat) {
> >  		if (!(cap & nested_capabilities))
> >  			return -EINVAL;
> >  	}
> >
> 
> Instead of that arch_compat check, would it better to do
> 
> 	if (kvmhv_on_pseries() && kvmhv_is_nestedv2()) {
> 		if (cap && !(cap & nested_capabilities))
> 			return -EINVAL;
> 	}
> 
> ie, if a capability is requested, then check against nested_capbilites
> to see if the capability exist.

The above condition check will cause problems when we would try to boot
a machine below Power 9.

For example, if we passed the arch_compat == PVR_ARCH_207, cap will
remain 0 resulting the above check into a false condition. Consequently,
we would never return an -EINVAL in that case resulting the arch
compatilbility request succeed when it doesn't support nested papr
guest.

> 
> 
> > diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> > index fd3c4f2d9480..069a1fcfd782 100644
> > --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> > +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> > @@ -138,6 +138,7 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
> >  	vector128 v;
> >  	int rc, i;
> >  	u16 iden;
> > +	u32 arch_compat = 0;
> >  
> >  	vcpu = gsm->data;
> >  
> > @@ -347,8 +348,15 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
> >  			break;
> >  		}
> >  		case KVMPPC_GSID_LOGICAL_PVR:
> > -			rc = kvmppc_gse_put_u32(gsb, iden,
> > -						vcpu->arch.vcore->arch_compat);
> > +			if (!vcpu->arch.vcore->arch_compat) {
> > +				if (cpu_has_feature(CPU_FTR_ARCH_31))
> > +					arch_compat = PVR_ARCH_31;
> > +				else if (cpu_has_feature(CPU_FTR_ARCH_300))
> > +					arch_compat = PVR_ARCH_300;
> > +			} else {
> > +				arch_compat = vcpu->arch.vcore->arch_compat;
> > +			}
> > +			rc = kvmppc_gse_put_u32(gsb, iden, arch_compat);
> >
> 
> Won't a arch_compat = 0 work here?. ie, where you observing the -EINVAL from
> the first hunk or does this hunk have an impact? 
>

No, an arch_compat == 0 won't work in nested API v2. That's because the
guest wide PVR cannot be 0, and if arch_compat == 0, then suppported
host PVR value should be mentioned.

If we were to skip this hunk (keeping the arch_compat == 0), a system
reboot of L2 guest would fail and result into a kernel trap as below:

[   22.106360] reboot: Restarting system
KVM: unknown exit, hardware reason ffffffffffffffea
NIP 0000000000000100   LR 000000000000fe44 CTR 0000000000000000 XER 0000000020040092 CPU#0
MSR 0000000000001000 HID0 0000000000000000  HF 6c000000 iidx 3 didx 3
TB 00000000 00000000 DECR 0
GPR00 0000000000000000 0000000000000000 c000000002a8c300 000000007fe00000
GPR04 0000000000000000 0000000000000000 0000000000001002 8000000002803033
GPR08 000000000a000000 0000000000000000 0000000000000004 000000002fff0000
GPR12 0000000000000000 c000000002e10000 0000000105639200 0000000000000004
GPR16 0000000000000000 000000010563a090 0000000000000000 0000000000000000
GPR20 0000000105639e20 00000001056399c8 00007fffe54abab0 0000000105639288
GPR24 0000000000000000 0000000000000001 0000000000000001 0000000000000000
GPR28 0000000000000000 0000000000000000 c000000002b30840 0000000000000000
CR 00000000  [ -  -  -  -  -  -  -  -  ]     RES 000@ffffffffffffffff
 SRR0 0000000000000000  SRR1 0000000000000000    PVR 0000000000800200 VRSAVE 0000000000000000
SPRG0 0000000000000000 SPRG1 0000000000000000  SPRG2 0000000000000000  SPRG3 0000000000000000
SPRG4 0000000000000000 SPRG5 0000000000000000  SPRG6 0000000000000000  SPRG7 0000000000000000
HSRR0 0000000000000000 HSRR1 0000000000000000
 CFAR 0000000000000000
 LPCR 0000000000020400
 PTCR 0000000000000000   DAR 0000000000000000  DSISR 0000000000000000

Message from syslogd@ltcd48-lp1 at Jan 24 08:02:16 ...
 kernel:trap=0xffffffea | pc=0x100 | msr=0x1000

> 
> >  			break;
> >  		}
> >  
> > -- 
> > 2.43.0
> 
> -aneesh

~Amit
