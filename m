Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076AC1EE2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 12:26:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46hdpb6xXSzDqLX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Sep 2019 20:25:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kaod.org
 (client-ip=46.105.58.91; helo=7.mo178.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 599 seconds by postgrey-1.36 at bilbo;
 Mon, 30 Sep 2019 20:24:05 AEST
Received: from 7.mo178.mail-out.ovh.net (7.mo178.mail-out.ovh.net
 [46.105.58.91])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46hdmP6YlnzDqMG
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 20:24:04 +1000 (AEST)
Received: from player692.ha.ovh.net (unknown [10.109.143.201])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 128727AA6D
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Sep 2019 12:08:10 +0200 (CEST)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player692.ha.ovh.net (Postfix) with ESMTPSA id 3BA53A40CB9B;
 Mon, 30 Sep 2019 10:07:55 +0000 (UTC)
Subject: Re: [PATCH v2 3/6] KVM: PPC: Book3S HV: XIVE: Show VP id in debugfs
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <156958521220.1503771.2119482814236775333.stgit@bahia.lan>
 <156958522955.1503771.11724507735868652914.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <a164000d-284a-3ca7-a6b2-a5977a4b169f@kaod.org>
Date: Mon, 30 Sep 2019 12:07:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <156958522955.1503771.11724507735868652914.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 15278743213254937460
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrgedvgddvudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
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
Cc: kvm@vger.kernel.org, =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@redhat.com>,
 kvm-ppc@vger.kernel.org, stable@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 27/09/2019 13:53, Greg Kurz wrote:
> Print out the VP id of each connected vCPU, this allow to see:
> - the VP block base in which OPAL encodes information that may be
>   useful when debugging
> - the packed vCPU id which may differ from the raw vCPU id if the
>   latter is >= KVM_MAX_VCPUS (2048)
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/kvm/book3s_xive.c        |    4 ++--
>  arch/powerpc/kvm/book3s_xive_native.c |    4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
> index baa740815b3c..0b7859e40f66 100644
> --- a/arch/powerpc/kvm/book3s_xive.c
> +++ b/arch/powerpc/kvm/book3s_xive.c
> @@ -2107,9 +2107,9 @@ static int xive_debug_show(struct seq_file *m, void *private)
>  		if (!xc)
>  			continue;
>  
> -		seq_printf(m, "cpu server %#x CPPR:%#x HWCPPR:%#x"
> +		seq_printf(m, "cpu server %#x VP:%#x CPPR:%#x HWCPPR:%#x"
>  			   " MFRR:%#x PEND:%#x h_xirr: R=%lld V=%lld\n",
> -			   xc->server_num, xc->cppr, xc->hw_cppr,
> +			   xc->server_num, xc->vp_id, xc->cppr, xc->hw_cppr,
>  			   xc->mfrr, xc->pending,
>  			   xc->stat_rm_h_xirr, xc->stat_vm_h_xirr);
>  
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index ebb4215baf45..43a86858390a 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -1204,8 +1204,8 @@ static int xive_native_debug_show(struct seq_file *m, void *private)
>  		if (!xc)
>  			continue;
>  
> -		seq_printf(m, "cpu server %#x NSR=%02x CPPR=%02x IBP=%02x PIPR=%02x w01=%016llx w2=%08x\n",
> -			   xc->server_num,
> +		seq_printf(m, "cpu server %#x VP=%#x NSR=%02x CPPR=%02x IBP=%02x PIPR=%02x w01=%016llx w2=%08x\n",
> +			   xc->server_num, xc->vp_id,
>  			   vcpu->arch.xive_saved_state.nsr,
>  			   vcpu->arch.xive_saved_state.cppr,
>  			   vcpu->arch.xive_saved_state.ipb,
> 

