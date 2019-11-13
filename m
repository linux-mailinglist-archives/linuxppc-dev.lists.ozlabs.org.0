Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 58840FB6D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Nov 2019 18:58:04 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47Csls46PQzDqSf
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2019 04:58:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.32.97.215; helo=14.mo1.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 3294 seconds by postgrey-1.36 at bilbo;
 Thu, 14 Nov 2019 04:55:56 AEDT
Received: from 14.mo1.mail-out.ovh.net (14.mo1.mail-out.ovh.net
 [178.32.97.215])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47CsjS47gSzF6XH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Nov 2019 04:55:52 +1100 (AEDT)
Received: from player792.ha.ovh.net (unknown [10.108.42.75])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4C48B1953EE
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Nov 2019 18:00:53 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: clg@kaod.org)
 by player792.ha.ovh.net (Postfix) with ESMTPSA id B5E55C0CFAD3;
 Wed, 13 Nov 2019 17:00:36 +0000 (UTC)
Subject: Re: [PATCH v2 2/2] KVM: PPC: Book3S HV: XIVE: Fix potential page leak
 on error path
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <157366357346.1026356.14522564753643067538.stgit@bahia.lan>
 <157366357929.1026356.18181561111939034621.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e49f522e-c265-4f00-f6f8-57f8583e7d8a@kaod.org>
Date: Wed, 13 Nov 2019 18:00:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157366357929.1026356.18181561111939034621.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 3946560650099067671
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudefuddgleelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpudelhedrvdduvddrvdelrdduieeinecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejledvrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org, Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 stable@vger.kernel.org, Lijun Pan <ljp@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/11/2019 17:46, Greg Kurz wrote:
> We need to check the host page size is big enough to accomodate the
> EQ. Let's do this before taking a reference on the EQ page to avoid
> a potential leak if the check fails.
> 
> Cc: stable@vger.kernel.org # v5.2
> Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the EQ configuration")
> Signed-off-by: Greg Kurz <groug@kaod.org>


Reviewed-by: Cédric Le Goater <clg@kaod.org>

> ---
>  arch/powerpc/kvm/book3s_xive_native.c |   13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 0e1fc5a16729..d83adb1e1490 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -630,12 +630,6 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
>  
>  	srcu_idx = srcu_read_lock(&kvm->srcu);
>  	gfn = gpa_to_gfn(kvm_eq.qaddr);
> -	page = gfn_to_page(kvm, gfn);
> -	if (is_error_page(page)) {
> -		srcu_read_unlock(&kvm->srcu, srcu_idx);
> -		pr_err("Couldn't get queue page %llx!\n", kvm_eq.qaddr);
> -		return -EINVAL;
> -	}
>  
>  	page_size = kvm_host_page_size(kvm, gfn);
>  	if (1ull << kvm_eq.qshift > page_size) {
> @@ -644,6 +638,13 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
>  		return -EINVAL;
>  	}
>  
> +	page = gfn_to_page(kvm, gfn);
> +	if (is_error_page(page)) {
> +		srcu_read_unlock(&kvm->srcu, srcu_idx);
> +		pr_err("Couldn't get queue page %llx!\n", kvm_eq.qaddr);
> +		return -EINVAL;
> +	}
> +
>  	qaddr = page_to_virt(page) + (kvm_eq.qaddr & ~PAGE_MASK);
>  	srcu_read_unlock(&kvm->srcu, srcu_idx);
>  
> 

