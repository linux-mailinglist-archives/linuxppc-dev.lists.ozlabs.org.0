Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D1684B214
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 11:10:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qJZ/R1KK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTfBv3dzlz3cMX
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 21:10:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qJZ/R1KK;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTfB82rBSz2yst
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 21:09:52 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1707214191;
	bh=RP5a0ngO4G8agxTcnKwbqd1t/bpdOgoBCm2CsXxO2i8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qJZ/R1KK16stykfOA9nmlGuWZ5InS09F4RhGl/V4xPS71GVG2TnIZj8uLywVGoXTe
	 HEi5DB7PK//MlMiG2lQiNkt+yMNnjLvuhjJYj4YH4WvPfgUEqeYeaORyn57goS0foX
	 PZCpoEBMuEorR6dGtrmt/uaItDpqbojjLjPbGU1HqCJuPUoaMbI1b5of3HVYDMtDtf
	 m101EkFRmPkSJod2ewWgdqCV55+bjo4d392eMIEzauV4cS+q5AXW069fYbfOv0jSbk
	 o9mz/jbyuERKNn43KY0/E44VGrnip45yQE5xsG+qhpfOr3onEBfbR4oBrrk1ZnTN7x
	 MTq5vgIDO9AxA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TTfB748xTz4wyj;
	Tue,  6 Feb 2024 21:09:51 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Amit Machhiwal <amachhiw@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 kvm@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: Re: [PATCH v3] KVM: PPC: Book3S HV: Fix L2 guest reboot failure due
 to empty 'arch_compat'
In-Reply-To: <20240205181833.212955-1-amachhiw@linux.ibm.com>
References: <20240205181833.212955-1-amachhiw@linux.ibm.com>
Date: Tue, 06 Feb 2024 21:09:48 +1100
Message-ID: <87r0hp9a4z.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Jordan Niethe <jniethe5@gmail.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>, Amit Machhiwal <amachhiw@linux.ibm.com>, "Naveen N . Rao" <naveen.n.rao@linux.ibm.com>, Vaibhav Jain <vaibhav@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Amit,

One comment below ...

Amit Machhiwal <amachhiw@linux.ibm.com> writes:
> Currently, rebooting a pseries nested qemu-kvm guest (L2) results in
> below error as L1 qemu sends PVR value 'arch_compat' == 0 via
> ppc_set_compat ioctl. This triggers a condition failure in
> kvmppc_set_arch_compat() resulting in an EINVAL.
...
>  	
> diff --git a/arch/powerpc/kvm/book3s_hv_nestedv2.c b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> index 5378eb40b162..6042bdc70230 100644
> --- a/arch/powerpc/kvm/book3s_hv_nestedv2.c
> +++ b/arch/powerpc/kvm/book3s_hv_nestedv2.c
> @@ -347,8 +348,26 @@ static int gs_msg_ops_vcpu_fill_info(struct kvmppc_gs_buff *gsb,
>  			break;
>  		}
>  		case KVMPPC_GSID_LOGICAL_PVR:
> -			rc = kvmppc_gse_put_u32(gsb, iden,
> -						vcpu->arch.vcore->arch_compat);
> +			/*
> +			 * Though 'arch_compat == 0' would mean the default
> +			 * compatibility, arch_compat, being a Guest Wide
> +			 * Element, cannot be filled with a value of 0 in GSB
> +			 * as this would result into a kernel trap.
> +			 * Hence, when `arch_compat == 0`, arch_compat should
> +			 * default to L1's PVR.
> +			 *
> +			 * Rework this when PowerVM supports a value of 0
> +			 * for arch_compat for KVM API v2.
> +			 */

Is there an actual plan that PowerVM will support this in future?

If so, how will a future kernel know that it's running on a version of
PowerVM that does support arch_compat == 0?

Similarly how will we know when it's OK to drop support for this
workaround?

cheers
