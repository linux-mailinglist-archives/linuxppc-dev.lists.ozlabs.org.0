Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 450411C6B4A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 10:18:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49H8cQ6kh5zDqrZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 18:18:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kaod.org (client-ip=46.105.61.149; helo=7.mo177.mail-out.ovh.net;
 envelope-from=clg@kaod.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=kaod.org
X-Greylist: delayed 4684 seconds by postgrey-1.36 at bilbo;
 Wed, 06 May 2020 18:16:30 AEST
Received: from 7.mo177.mail-out.ovh.net (7.mo177.mail-out.ovh.net
 [46.105.61.149])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49H8Z61ccYzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 18:16:29 +1000 (AEST)
Received: from player758.ha.ovh.net (unknown [10.110.103.180])
 by mo177.mail-out.ovh.net (Postfix) with ESMTP id 6FB2512F485
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 May 2020 08:58:19 +0200 (CEST)
Received: from kaod.org (82-64-250-170.subs.proxad.net [82.64.250.170])
 (Authenticated sender: clg@kaod.org)
 by player758.ha.ovh.net (Postfix) with ESMTPSA id 02C3012186F9B;
 Wed,  6 May 2020 06:58:05 +0000 (UTC)
Subject: Re: [PATCH] powerpc/xive: Enforce load-after-store ordering when
 StoreEOI is active
To: Alistair Popple <alistair@popple.id.au>
References: <20200220081506.31209-1-clg@kaod.org> <2990884.uye9WAk7yu@townsend>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <5d388ebb-1c0e-a14d-c097-62ce07d0c301@kaod.org>
Date: Wed, 6 May 2020 08:58:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <2990884.uye9WAk7yu@townsend>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 6920343779287010237
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrjeejgddufeelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomhepveorughrihgtpgfnvggpifhorghtvghruceotghlgheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpedtleefveefhfehtdevkeehledvuedvgfdthfdvffefhffgkefhtddvgeetkedthfenucffohhmrghinheprhhmhhgrnhgulhgvrhhsrdhssgenucfkpheptddrtddrtddrtddpkedvrdeigedrvdehtddrudejtdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejheekrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtoheplhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrgh
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/6/20 1:34 AM, Alistair Popple wrote:
> I am still slowly wrapping my head around XIVE and it's interaction with KVM 
> but from what I can see this looks good and is needed so we can enable 
> StoreEOI support in future so:
> 
> Reviewed-by: Alistair Popple <alistair@popple.id.au>
> 
> On Thursday, 20 February 2020 7:15:06 PM AEST Cédric Le Goater wrote:
>> When an interrupt has been handled, the OS notifies the interrupt
>> controller with a EOI sequence. On a POWER9 system using the XIVE
>> interrupt controller, this can be done with a load or a store
>> operation on the ESB interrupt management page of the interrupt. The
>> StoreEOI operation has less latency and improves interrupt handling
>> performance but it was deactivated during the POWER9 DD2.0 timeframe
>> because of ordering issues. We use the LoadEOI today but we plan to
>> reactivate StoreEOI in future architectures.

StoreEOI was considered broken on P9, and never used, but we have to 
prepare ground for the IBM hypervisor which will activate StoreEOI 
without negotiation on the new architecture.

Thanks,

C. 


>>
>> There is usually no need to enforce ordering between ESB load and
>> store operations as they should lead to the same result. E.g. a store
>> trigger and a load EOI can be executed in any order. Assuming the
>> interrupt state is PQ=10, a store trigger followed by a load EOI will
>> return a Q bit. In the reverse order, it will create a new interrupt
>> trigger from HW. In both cases, the handler processing interrupts is
>> notified.
>>
>> In some cases, the XIVE_ESB_SET_PQ_10 load operation is used to
>> disable temporarily the interrupt source (mask/unmask). When the
>> source is reenabled, the OS can detect if interrupts were received
>> while the source was disabled and reinject them. This process needs
>> special care when StoreEOI is activated. The ESB load and store
>> operations should be correctly ordered because a XIVE_ESB_STORE_EOI
>> operation could leave the source enabled if it has not completed
>> before the loads.
>>
>> For those cases, we enforce Load-after-Store ordering with a special
>> load operation offset. To avoid performance impact, this ordering is
>> only enforced when really needed, that is when interrupt sources are
>> temporarily disabled with the XIVE_ESB_SET_PQ_10 load. It should not
>> be needed for other loads.
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
>>  arch/powerpc/include/asm/xive-regs.h    | 8 ++++++++
>>  arch/powerpc/kvm/book3s_xive_native.c   | 6 ++++++
>>  arch/powerpc/kvm/book3s_xive_template.c | 3 +++
>>  arch/powerpc/sysdev/xive/common.c       | 3 +++
>>  arch/powerpc/kvm/book3s_hv_rmhandlers.S | 5 +++++
>>  5 files changed, 25 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/xive-regs.h
>> b/arch/powerpc/include/asm/xive-regs.h index f2dfcd50a2d3..b1996fbae59a
>> 100644
>> --- a/arch/powerpc/include/asm/xive-regs.h
>> +++ b/arch/powerpc/include/asm/xive-regs.h
>> @@ -37,6 +37,14 @@
>>  #define XIVE_ESB_SET_PQ_10	0xe00 /* Load */
>>  #define XIVE_ESB_SET_PQ_11	0xf00 /* Load */
>>
>> +/*
>> + * Load-after-store ordering
>> + *
>> + * Adding this offset to the load address will enforce
>> + * load-after-store ordering. This is required to use StoreEOI.
>> + */
>> +#define XIVE_ESB_LD_ST_MO	0x40 /* Load-after-store ordering */
>> +
>>  #define XIVE_ESB_VAL_P		0x2
>>  #define XIVE_ESB_VAL_Q		0x1
>>
>> diff --git a/arch/powerpc/kvm/book3s_xive_native.c
>> b/arch/powerpc/kvm/book3s_xive_native.c index d83adb1e1490..c80b6a447efd
>> 100644
>> --- a/arch/powerpc/kvm/book3s_xive_native.c
>> +++ b/arch/powerpc/kvm/book3s_xive_native.c
>> @@ -31,6 +31,12 @@ static u8 xive_vm_esb_load(struct xive_irq_data *xd, u32
>> offset) {
>>  	u64 val;
>>
>> +	/*
>> +	 * The KVM XIVE native device does not use the XIVE_ESB_SET_PQ_10
>> +	 * load operation, so there is no need to enforce load-after-store
>> +	 * ordering.
>> +	 */
>> +
>>  	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>>  		offset |= offset << 4;
>>
>> diff --git a/arch/powerpc/kvm/book3s_xive_template.c
>> b/arch/powerpc/kvm/book3s_xive_template.c index a8a900ace1e6..4ad3c0279458
>> 100644
>> --- a/arch/powerpc/kvm/book3s_xive_template.c
>> +++ b/arch/powerpc/kvm/book3s_xive_template.c
>> @@ -58,6 +58,9 @@ static u8 GLUE(X_PFX,esb_load)(struct xive_irq_data *xd,
>> u32 offset) {
>>  	u64 val;
>>
>> +	if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>> +		offset |= XIVE_ESB_LD_ST_MO;
>> +
>>  	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>>  		offset |= offset << 4;
>>
>> diff --git a/arch/powerpc/sysdev/xive/common.c
>> b/arch/powerpc/sysdev/xive/common.c index f5fadbd2533a..0dc421bb494f 100644
>> --- a/arch/powerpc/sysdev/xive/common.c
>> +++ b/arch/powerpc/sysdev/xive/common.c
>> @@ -202,6 +202,9 @@ static notrace u8 xive_esb_read(struct xive_irq_data
>> *xd, u32 offset) {
>>  	u64 val;
>>
>> +	if (offset == XIVE_ESB_SET_PQ_10 && xd->flags & XIVE_IRQ_FLAG_STORE_EOI)
>> +		offset |= XIVE_ESB_LD_ST_MO;
>> +
>>  	/* Handle HW errata */
>>  	if (xd->flags & XIVE_IRQ_FLAG_SHIFT_BUG)
>>  		offset |= offset << 4;
>> diff --git a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> b/arch/powerpc/kvm/book3s_hv_rmhandlers.S index e11017897eb0..abe132ff2346
>> 100644
>> --- a/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> +++ b/arch/powerpc/kvm/book3s_hv_rmhandlers.S
>> @@ -2911,6 +2911,11 @@ kvm_cede_exit:
>>  	beq	4f
>>  	li	r0, 0
>>  	stb	r0, VCPU_CEDED(r9)
>> +	/*
>> +	 * The escalation interrupts are special as we don't EOI them.
>> +	 * There is no need to use the load-after-store ordering offset
>> +	 * to set PQ to 10 as we won't use StoreEOI.
>> +	 */
>>  	li	r6, XIVE_ESB_SET_PQ_10
>>  	b	5f
>>  4:	li	r0, 1
> 
> 
> 
> 

