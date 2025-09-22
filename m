Return-Path: <linuxppc-dev+bounces-12525-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0349BB92975
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 20:25:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVs3r43wvz304l;
	Tue, 23 Sep 2025 04:25:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758565528;
	cv=none; b=DQqyfCNmZqRFigQ+lrFxIwi1U2epeXHxfy/VWeTeF04CySGGsqXlSdEwOj4CwuSRLVnqfI77NyaPWyKNMak83XuVpdD3KHxw0kMxo4Eb/BYyu+DnBPK2YfRp8cE5YiIs3MCbosG+8e7RQrotWKoH3Bijvw6ncJyCqckrID5KRlhgPG7npoBnxrbITMvKjjBwffN8XT2gfswJHBHMId0YWzrhDcqBJGg4+sQk/kPGpraDZ7Yl4LYXHkjwdCMMtJZU1qeaM9+XUsisyNs890W6HvxYUIWxF2sUCAnfyKZTReTTm9CwZHMt3owepSuHCXjfVIOWhRf9tLZdOj8fUFAUNA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758565528; c=relaxed/relaxed;
	bh=Q7vgWe5BTDEEAyuzPVJfdErl8MnSgGfYZINpvEI+SX4=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=oDCCRS0uWLhzEybhYIFA9Q/fBcfkJV2Ia/BQrTJ/Ey9get/Z8nIqRlU+BXB3GN2Qxd9janPjms4Nza+DKBnHVrx0XDJxVmqbpkCJ7k454RwZ+QHnjbqQUwr7ZSLswBe6zZH+7KMtluQiyuX0MQA98CqTO8ywr3J36XmoEzN9cOyjUdFz0ll/lDJ1mWXyJDqJg+PZ3pbAzYdNEU8qR2oAf6PMJZgPY21RtaT7/T6zUU9eT847HzGS9J1dhrR9Pkrc+vynH1dc6Mr9lyoiifOVPF/Jn6GeXTxc5yw/EK0jVbNo1XMnWamhtb54rKnQsP3zHpY3z7tIA02Z0nMjoKtgsg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=g7vKlOry; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=g7vKlOry;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVs3q4SLqz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 04:25:27 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id BB86F8286733;
	Mon, 22 Sep 2025 13:25:25 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id RW7qn8Qu-UfY; Mon, 22 Sep 2025 13:25:24 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4E704828523D;
	Mon, 22 Sep 2025 13:25:24 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 4E704828523D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1758565524; bh=Q7vgWe5BTDEEAyuzPVJfdErl8MnSgGfYZINpvEI+SX4=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=g7vKlOryczzx4kd3zxcGfsTXa4MNDoiKOhECli0xibDTxoS3Mc5DBt8xh2t9k4OHl
	 xuuah1Z2/V6fEUzMRP1i+pejSzMCE0duGzDpp3fxUm6OKzLeMENkDX9LACM6AyVSQD
	 4IM+JOzaZHpWTcWrwTMun2uYQdO+AjFAP9sLvjOU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id E--5ZLiGBrti; Mon, 22 Sep 2025 13:25:24 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 1BBAB828522F;
	Mon, 22 Sep 2025 13:25:24 -0500 (CDT)
Date: Mon, 22 Sep 2025 13:25:23 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <2033705829.1743233.1758565523937.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250922120122.4e9942e8.alex.williamson@redhat.com>
References: <912864077.1743059.1758561514856.JavaMail.zimbra@raptorengineeringinc.com> <20250922120122.4e9942e8.alex.williamson@redhat.com>
Subject: Re: [PATCH v2] vfio/pci: Fix INTx handling on legacy non-PCI 2.3
 devices
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC139 (Linux)/8.5.0_GA_3042)
Thread-Topic: vfio/pci: Fix INTx handling on legacy non-PCI 2.3 devices
Thread-Index: VbGU3DB6cMFkhoYO5wHCtZsM+k2MIg==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Alex Williamson" <alex.williamson@redhat.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, September 22, 2025 1:01:22 PM
> Subject: Re: [PATCH v2] vfio/pci: Fix INTx handling on legacy non-PCI 2.3 devices

> On Mon, 22 Sep 2025 12:18:34 -0500 (CDT)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
> 
>> PCI devices prior to PCI 2.3 both use level interrupts and do not support
>> interrupt masking, leading to a failure when passed through to a KVM guest on
>> at least the ppc64 platform. This failure manifests as receiving and
>> acknowledging a single interrupt in the guest, while the device continues to
>> assert the level interrupt indicating a need for further servicing.
>> 
>> When lazy IRQ masking is used on DisINTx- (non-PCI 2.3) hardware, the following
>> sequence occurs:
>> 
>>  * Level IRQ assertion on device
>>  * IRQ marked disabled in kernel
>>  * Host interrupt handler exits without clearing the interrupt on the device
>>  * Eventfd is delivered to userspace
>>  * Host interrupt controller sees still-active INTX, reasserts IRQ
>>  * Host kernel ignores disabled IRQ
>>  * Guest processes IRQ and clears device interrupt
>>  * Software mask removed by VFIO driver
> 
> This isn't the sequence that was previously identified as the issue.
> An interrupt controller that reasserts the IRQ when it remains active
> is not susceptible to the issue, and is what I think we generally
> expect on x86.  I understand that we believe this issue manifests
> exactly because the interrupt controller does not reassert an interrupt
> that remains active.  I think the sequence is:
> 
> * device asserts INTx
> * vfio_intx_handler() calls disable_irq_nosync() to mark IRQ disabled
> * interrupt delivered to userspace via eventfd
> * userspace driver/VM services interrupt
> * device de-asserts INTx
> * device re-asserts INTx
> * interrupt received while IRQ disabled is masked at controller
> * VMM performs EOI via unmask ioctl, enable_irq() clears disable and
>   unmasks IRQ
> * interrupt controller does not reassert interrupt to the host
> 
> The fix then, aiui, is that disabling the unlazy mode masks the
> interrupt at disable_irq_nosync(), the same sequence of de-asserting
> and re-asserting the interrupt occurs at the controller, but since the
> controller was masked at the new rising edge, it will send the
> interrupt when umasked.

That is correct.  Technically we're dealing with two different ways to hang the controller, but this one is the most likely; both fundamentally boil down to not receiving a new INTx falling edge (INTx is active low) after the interrupt is unmasked.  I've updated the description to match.

>> The behavior is now platform-dependent.  Some platforms (amd64) will continue
>> to spew IRQs for as long as the INTX line remains asserted, therefore the IRQ
>> will be handled by the host as soon as the mask is dropped.  Others (ppc64) will
>> only send the one request, and if it is not handled no further interrupts will
>> be sent.  The former behavior theoretically leaves the system vulnerable to
>> interrupt storm, and the latter will result in the device stalling after
>> receiving exactly one interrupt in the guest.
>> 
>> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.
>> ---
>>  drivers/vfio/pci/vfio_pci_intrs.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>> 
>> diff --git a/drivers/vfio/pci/vfio_pci_intrs.c
>> b/drivers/vfio/pci/vfio_pci_intrs.c
>> index 123298a4dc8f..d8637b53d051 100644
>> --- a/drivers/vfio/pci/vfio_pci_intrs.c
>> +++ b/drivers/vfio/pci/vfio_pci_intrs.c
>> @@ -304,6 +304,9 @@ static int vfio_intx_enable(struct vfio_pci_core_device
>> *vdev,
>>  
>>  	vdev->irq_type = VFIO_PCI_INTX_IRQ_INDEX;
>>  
>> +	if (!vdev->pci_2_3)
>> +		irq_set_status_flags(pdev->irq, IRQ_DISABLE_UNLAZY);
>> +
>>  	ret = request_irq(pdev->irq, vfio_intx_handler,
>>  			  irqflags, ctx->name, ctx);
>>  	if (ret) {
> 
> This branch is an example of where we're not clearing the flag on
> error.  Thanks,

Whoops!  That's what I get for not looking closely and grepping for free_irq()!

V3 sent.

