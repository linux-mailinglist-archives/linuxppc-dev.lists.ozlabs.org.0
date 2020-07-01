Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46DCD210A25
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 13:13:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49xdrv5VFjzDqsZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jul 2020 21:13:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49xdpp6jM3zDqbY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jul 2020 21:12:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=J7WiKYNR; dkim-atps=neutral
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49xdpp2kh3z9sTT; Wed,  1 Jul 2020 21:12:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1593601922; bh=vShXmLzYExqsKZtJG4s0K665M8DGVb1V/C86ieyII9c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=J7WiKYNRqkjjFmaASBHybmdTmEhjXdpnMHSW3uc73XkcePT72cpz2zn5kggCZlgnq
 a/AZpJKUtA7Rwjb0fszvLOOAnffs0shLMia1tQdeFin/vK7gajZEO9cAwsgpTI44KT
 qRf3V0Nt6t0kUjlh0FPJLdlTzH04D/DMeNCFZTGsfP107EPkr8K4ZP4Vdc9xEu30vH
 u9N0D6Nl0p6zKJ3swFHGfJN4K+/Aozctry6ZykDsr4rNPkiTULyslewtuE7fhIpREI
 8QvX1FArZPw74VjCrMtJOj5O4lIg0migqQxZNAQQlrk5VJNrmbOs2Awx/xbc0MRViR
 sVuBgmd0X3iIg==
Date: Wed, 1 Jul 2020 21:11:58 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 02/10] KVM: PPC: Book3S HV: Save/restore new PMU
 registers
Message-ID: <20200701111158.GA694641@thinks.paulus.ozlabs.org>
References: <1593595262-1433-1-git-send-email-atrajeev@linux.vnet.ibm.com>
 <1593595262-1433-3-git-send-email-atrajeev@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593595262-1433-3-git-send-email-atrajeev@linux.vnet.ibm.com>
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
Cc: mikey@neuling.org, maddy@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 01, 2020 at 05:20:54AM -0400, Athira Rajeev wrote:
> PowerISA v3.1 has added new performance monitoring unit (PMU)
> special purpose registers (SPRs). They are
> 
> Monitor Mode Control Register 3 (MMCR3)
> Sampled Instruction Event Register A (SIER2)
> Sampled Instruction Event Register B (SIER3)
> 
> Patch addes support to save/restore these new
> SPRs while entering/exiting guest.

This mostly looks reasonable, at a quick glance at least, but I am
puzzled by two of the changes you are making.  See below.

> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6bf66649..c265800 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -1698,7 +1698,8 @@ static int kvmppc_get_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
>  		*val = get_reg_val(id, vcpu->arch.sdar);
>  		break;
>  	case KVM_REG_PPC_SIER:
> -		*val = get_reg_val(id, vcpu->arch.sier);
> +		i = id - KVM_REG_PPC_SIER;
> +		*val = get_reg_val(id, vcpu->arch.sier[i]);

This is inside a switch (id) statement, so here we know that id is
KVM_REG_PPC_SIER.  In other words i will always be zero, so what is
the point of doing the subtraction?

>  		break;
>  	case KVM_REG_PPC_IAMR:
>  		*val = get_reg_val(id, vcpu->arch.iamr);
> @@ -1919,7 +1920,8 @@ static int kvmppc_set_one_reg_hv(struct kvm_vcpu *vcpu, u64 id,
>  		vcpu->arch.sdar = set_reg_val(id, *val);
>  		break;
>  	case KVM_REG_PPC_SIER:
> -		vcpu->arch.sier = set_reg_val(id, *val);
> +		i = id - KVM_REG_PPC_SIER;
> +		vcpu->arch.sier[i] = set_reg_val(id, *val);

Same comment here.

I think that new defines for the new registers will need to be added
to arch/powerpc/include/uapi/asm/kvm.h and
Documentation/virt/kvm/api.rst, and then new cases will need to be
added to these switch statements.

By the way, please cc kvm-ppc@vger.kernel.org and kvm@vger.kernel.org
on KVM patches.

Paul.
