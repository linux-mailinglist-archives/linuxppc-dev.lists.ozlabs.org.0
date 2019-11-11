Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80388F7364
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 12:48:42 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BTfZ5yr5zF3ft
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 22:48:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=178.33.111.220;
 helo=1.mo179.mail-out.ovh.net; envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 561 seconds by postgrey-1.36 at bilbo;
 Mon, 11 Nov 2019 22:36:10 AEDT
Received: from 1.mo179.mail-out.ovh.net (1.mo179.mail-out.ovh.net
 [178.33.111.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BTNB0pyQzF49g
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 22:36:08 +1100 (AEDT)
Received: from player788.ha.ovh.net (unknown [10.108.42.145])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 05AC4145ACF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 12:26:39 +0100 (CET)
Received: from kaod.org (lfbn-1-2229-223.w90-76.abo.wanadoo.fr [90.76.50.223])
 (Authenticated sender: clg@kaod.org)
 by player788.ha.ovh.net (Postfix) with ESMTPSA id 9FB97BEE6275;
 Mon, 11 Nov 2019 11:26:26 +0000 (UTC)
Subject: Re: [PATCH] KVM: PPC: Book3S HV: XIVE: Free previous EQ page when
 setting up a new one
To: Greg Kurz <groug@kaod.org>, Paul Mackerras <paulus@ozlabs.org>
References: <157346576671.818016.10401178701091199969.stgit@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3373a85a-09bb-3345-ef27-68177c360786@kaod.org>
Date: Mon, 11 Nov 2019 12:26:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <157346576671.818016.10401178701091199969.stgit@bahia.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5003217712743287575
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucfkpheptddrtddrtddrtddpledtrdejiedrhedtrddvvdefnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejkeekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghenucevlhhushhtvghrufhiiigvpedt
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
Cc: linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>, stable@vger.kernel.org,
 Lijun Pan <ljp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 11/11/2019 10:49, Greg Kurz wrote:
> The EQ page is allocated by the guest and then passed to the hypervisor
> with the H_INT_SET_QUEUE_CONFIG hcall. A reference is taken on the page
> before handing it over to the HW. This reference is dropped either when
> the guest issues the H_INT_RESET hcall or when the KVM device is released.
> But, the guest can legitimately call H_INT_SET_QUEUE_CONFIG several times
> to reset the EQ (vCPU hot unplug) or set a new EQ (guest reboot). In both
> cases the EQ page reference is leaked. This is especially visible when
> the guest memory is backed with huge pages: start a VM up to the guest
> userspace, either reboot it or unplug a vCPU, quit QEMU. The leak is
> observed by comparing the value of HugePages_Free in /proc/meminfo before
> and after the VM is run.
> 
> Note that the EQ reset path seems to be calling put_page() but this is
> done after xive_native_configure_queue() which clears the qpage field
> in the XIVE queue structure, ie. the put_page() block is a nop and the
> previous page pointer was just overwritten anyway. In the other case of
> configuring a new EQ page, nothing seems to be done to release the old
> one.

Yes. Nice catch. I think we should try to fix the problem differently. 

The routine xive_native_configure_queue() is only suited for XIVE 
drivers doing their own EQ page allocation: Linux PowerNV and the 
KVM XICS-over-XIVE device. The KVM XIVE device acts as a proxy for 
the guest OS doing the allocation and it has different needs.

Having a specific xive_native_configure_queue() for the KVM XIVE 
device seems overkill. May be, we could introduce a helper routine 
in KVM XIVE device calling xive_native_configure_queue() and handling 
the page reference how it should be ? That is to drop the previous
page reference in case of a change on q->qpage.


Also, we should try to preserve the previous setting until the whole 
configuration is in place. That seems possible up to the call to 
xive_native_configure_queue(). If kvmppc_xive_attach_escalation()
fails I think it is too late, as the HW has been configured by 
xive_native_configure_queue(), and we should just cleanup everything. 

Thanks,

C. 


> Fix both cases by always calling put_page() on the existing EQ page in
> kvmppc_xive_native_set_queue_config(). This is a seemless change for the
> EQ reset case. However this causes xive_native_configure_queue() to be
> called twice for the new EQ page case: one time to reset the EQ and another
> time to configure the new page. This is needed because we cannot release
> the EQ page before calling xive_native_configure_queue() since it may still
> be used by the HW. We cannot modify xive_native_configure_queue() to drop
> the reference either because this function is also used by the XICS-on-XIVE
> device which requires free_pages() instead of put_page(). This isn't a big
> deal anyway since H_INT_SET_QUEUE_CONFIG isn't a hot path.
> 
> Reported-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
> Cc: stable@vger.kernel.org # v5.2
> Fixes: 13ce3297c576 ("KVM: PPC: Book3S HV: XIVE: Add controls for the EQ configuration")
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  arch/powerpc/kvm/book3s_xive_native.c |   21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
> index 34bd123fa024..8ab908d23dc2 100644
> --- a/arch/powerpc/kvm/book3s_xive_native.c
> +++ b/arch/powerpc/kvm/book3s_xive_native.c
> @@ -570,10 +570,12 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
>  		 __func__, server, priority, kvm_eq.flags,
>  		 kvm_eq.qshift, kvm_eq.qaddr, kvm_eq.qtoggle, kvm_eq.qindex);
>  
> -	/* reset queue and disable queueing */
> -	if (!kvm_eq.qshift) {
> -		q->guest_qaddr  = 0;
> -		q->guest_qshift = 0;
> +	/*
> +	 * Reset queue and disable queueing. It will be re-enabled
> +	 * later on if the guest is configuring a new EQ page.
> +	 */
> +	if (q->guest_qshift) {
> +		page = virt_to_page(q->qpage);
>  
>  		rc = xive_native_configure_queue(xc->vp_id, q, priority,
>  						 NULL, 0, true);
> @@ -583,12 +585,13 @@ static int kvmppc_xive_native_set_queue_config(struct kvmppc_xive *xive,
>  			return rc;
>  		}
>  
> -		if (q->qpage) {
> -			put_page(virt_to_page(q->qpage));
> -			q->qpage = NULL;
> -		}
> +		put_page(page);
>  
> -		return 0;
> +		if (!kvm_eq.qshift) {
> +			q->guest_qaddr  = 0;
> +			q->guest_qshift = 0;
> +			return 0;
> +		}
>  	}
>  
>  	/*
> 

