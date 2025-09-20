Return-Path: <linuxppc-dev+bounces-12486-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE390B8CF28
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 21:25:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cTfTh0Xmkz2yyx;
	Sun, 21 Sep 2025 05:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758396311;
	cv=none; b=aWDS5KIO3IBoRQefrEuklTCS9wC8LI8kPnCM7YhDdQZFjWOdFXEWakFPnAfwFiEA9SExG8SAOb7Yzr0rXsnxwMWAIQklvYFwnuPwNe+nTkutZVrFVaEo9ACbTuw9Ou0Gh4OgMI/TvGpHh/3h4RkimGKcZcMZCVvd/HTmJOEM5sqJjLfiIbd5VsMTdhCkWNqZ8Ur3jH9eDOCjfGphvJOBCofxs/2w5eNjvIcS36PdqWYoBuEdqmVFUMmHLW60FJxLO+vHM6TBFVIC4JOQj+LCAp5akEDZX0L7jHeN9GSPRuvhPeioWtJcmoOx38cd6pBPNEjKodOVvguiHW1xAGEgmg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758396311; c=relaxed/relaxed;
	bh=b3Bp4dgSxf+ggJrh+8ZMDr/Oak84SJTTedtmVi2EJcc=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=huyhmdnkiWMbRKFZt+h0OZXMuTwa19KkLEtITOYFnm26N+jvylP511w3Vm6NyooWVR3sciSMbOqbWNVZ2tDmvZ47YN2NwOXVZPgRaY5bd+nCedJ0nTk8TAFuU7YLo/VRbTNCddq5qX1dYZl37ev9ymBeaTDKfYDIBz6ktmrR3hGcspnDx04al/apfXO/ROHwVyM2ROk/oEGcWrYi5mYd3nbcBRgEXMcfjVC3ZFaVpAOAEUHVSF39y3JLaNQZq4dHKZePQ2K2EI2vmSt7CL+WzRIY/tXHPnTZU5oTrGZS5HpbELd8arNcv32sC7EfLQPf/HemB4yrUcB5CQp5OHQAXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=QdkjWUwW; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=QdkjWUwW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cTfTf3BvJz2yDr
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Sep 2025 05:25:10 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4AE348288EBC;
	Sat, 20 Sep 2025 14:25:08 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id wyspLYXRvEcA; Sat, 20 Sep 2025 14:25:06 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id CEE0B82890CD;
	Sat, 20 Sep 2025 14:25:06 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com CEE0B82890CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1758396306; bh=b3Bp4dgSxf+ggJrh+8ZMDr/Oak84SJTTedtmVi2EJcc=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=QdkjWUwWPLJc2VBKlYBEML/bsf/9s3qIYip6dp7+axTjoHW7LG/XzSok2izb6op0O
	 MKh4QM7JNN4QoLU5D4xpf1joju4/iLfq6yuQAcnjkx27WAcheQ/96yQwzabcMklTzP
	 gO47GWJWZ6LKRreJwKmyNsn2pdHnWKx63xqC1RKU=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 5TbUiFUoo-Rx; Sat, 20 Sep 2025 14:25:06 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 96C358288EBC;
	Sat, 20 Sep 2025 14:25:06 -0500 (CDT)
Date: Sat, 20 Sep 2025 14:25:03 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <537354829.1740670.1758396303861.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250919162721.7a38d3e2.alex.williamson@redhat.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com> <20250919125603.08f600ac.alex.williamson@redhat.com> <1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com> <20250919162721.7a38d3e2.alex.williamson@redhat.com>
Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI
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
Thread-Topic: vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices
Thread-Index: bFl5NHP7oMjKNztE0jpOEeSgapuGrw==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Alex Williamson" <alex.williamson@redhat.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Friday, September 19, 2025 5:27:21 PM
> Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices

> On Fri, 19 Sep 2025 15:51:14 -0500 (CDT)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
> 
>> ----- Original Message -----
>> > From: "Alex Williamson" <alex.williamson@redhat.com>
>> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> > Sent: Friday, September 19, 2025 1:56:03 PM
>> > Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices
>> 
>> > On Tue, 9 Sep 2025 15:48:46 -0500 (CDT)
>> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
>> >   
>> >> PCI devices prior to PCI 2.3 both use level interrupts and do not support
>> >> interrupt masking, leading to a failure when passed through to a KVM guest on
>> >> at least the ppc64 platform, which does not utilize the resample IRQFD. This
>> >> failure manifests as receiving and acknowledging a single interrupt in the guest
>> >> while leaving the host physical device VFIO IRQ pending.
>> >> 
>> >> Level interrupts in general require special handling due to their inherently
>> >> asynchronous nature; both the host and guest interrupt controller need to
>> >> remain in synchronization in order to coordinate mask and unmask operations.
>> >> When lazy IRQ masking is used on DisINTx- hardware, the following sequence
>> >> occurs:
>> >>
>> >>  * Level IRQ assertion on host
>> >>  * IRQ trigger within host interrupt controller, routed to VFIO driver
>> >>  * Host EOI with hardware level IRQ still asserted
>> >>  * Software mask of interrupt source by VFIO driver
>> >>  * Generation of event and IRQ trigger in KVM guest interrupt controller
>> >>  * Level IRQ deassertion on host
>> >>  * Guest EOI
>> >>  * Guest IRQ level deassertion
>> >>  * Removal of software mask by VFIO driver
>> >> 
>> >> Note that no actual state change occurs within the host interrupt controller,
>> >> unlike what would happen with either DisINTx+ hardware or message interrupts.
>> >> The host EOI is not fired with the hardware level IRQ deasserted, and the
>> >> level interrupt is not re-armed within the host interrupt controller, leading
>> >> to an unrecoverable stall of the device.
>> >> 
>> >> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.
>> > 
>> > I'm not really following here.  It's claimed above that no actual state
>> > change occurs within the host interrupt controller, but that's exactly
>> > what disable_irq_nosync() intends to do, mask the interrupt line at the
>> > controller.
>> 
>> While it seems that way on the surface (and this tripped me up
>> originally), the actual call chain is:
>> 
>> disable_irq_nosync()
>> __disable_irq_nosync()
>> __disable_irq()
>> irq_disable()
>> 
>> Inside void irq_disable(), __irq_disable() is gated on
>> irq_settings_disable_unlazy().  The lazy disable is intended to *not*
>> touch the interrupt controller itself, instead lazy mode masks the
>> interrupt at the device level (DisINT+ registers).  If the IRQ is set
>> up to run in lazy mode, the interrupt is not disabled at the actual
>> interrupt controller by disable_irq_nosync().
> 
> What chip handler are you using?  The comment above irq_disable
> reiterates the behavior, yes if the chip doesn't support irq_disable it
> marks the interrupt masked but leaves the hardware unmasked.  It does
> not describe using DisINTx to mask the device, which would be at a
> different level from the chip.  In this case __irq_disable() just calls
> irq_state_set_disabled().  Only with the change proposed here would we
> also call mask_irq().

This is all tested on a POWER XIVE controller, so arch/powerpc/sysdev/xive (CONFIG_PPC_XIVE_NATIVE=y)

>> > The lazy optimization that's being proposed here should
>> > only change the behavior such that the interrupt is masked at the
>> > call to disable_irq_nosync() rather than at a subsequent
>> > re-assertion of the interrupt.  In any case, enable_irq() should
>> > mark the line enabled and reenable the controller if necessary.
>> 
>> If the interrupt was not disabled at the controller, then reenabling
>> a level interrupt is not guaranteed to actually do anything (although
>> it *might*).  The hardware in the interrupt controller will still
>> "see" an active level assert for which it fired an interrupt without
>> a prior acknowledge (or disable/enable cycle) from software, and can
>> then decide to not re-raise the IRQ on a platform-specific basis.
>> 
>> The key here is that the interrupt controllers differ somewhat in
>> behavior across various architectures.  On POWER, the controller will
>> only raise the external processor interrupt once for each level
>> interrupt when that interrupt changes state to asserted, and will
>> only re-raise the external processor interrupt once an acknowledge
>> for that interrupt has been sent to the interrupt controller hardware
>> while the level interrupt is deasserted.  As a result, if the
>> interrupt handler executes (acknowledging the interrupt), but does
>> not first clear the interrupt on the device itself, the interrupt
>> controller will never re-raise that interrupt -- from its
>> perspective, it has issued another IRQ (because the device level
>> interrupt was left asserted) and the associated handler has never
>> completed.  Disabling the interrupt causes the controller to reassert
>> the interrupt if the level interrupt is still asserted when the
>> interrupt is reenabled at the controller level.
> 
> This sounds a lot more like the problem than the previous description.

Apologies for that.  There's a lot of moving parts here and I guess I muddled it all up in the first description.

> Is the actual scenario something like the irq is marked disabled, the
> eventfd is delivered to userspace, userspace handles the device, the
> interrupt is de-asserted at the device, but then the device re-asserts
> the interrupt before the unmask ioctl, causing the interrupt chip to
> mask the interrupt, then enable_irq() from the unmask ioctl doesn't
> reassert the interrupt?

That is exactly it, yes.  This particular scenario only occurs on old pre-PCI 2.3 devices that advertise DisINT- ; newer devices that advertise DisINT+ don't trip the fault since the host interrupt handler sets the device interrupt mask (thus deasserting the IRQ at the interrupt controller) before exiting.

>> On other platforms the external processor interrupt itself is
>> disabled until the interrupt handler has finished, and the controller
>> doesn't auto-mask the level interrupts at the hardware level;
>> instead, it will happily re-assert the processor interrupt if the
>> interrupt was not cleared at the device level after IRQ acknowledge.
>> I suspect on those platforms this bug may be masked at the expense of
>> a bunch of "spurious" / unwanted interrupts if the interrupt handler
>> hasn't acked the interrupt at the device level; as long as the guest
>> interrupt handler is able to somewhat rapidly clear the device
>> interrupt, performance won't be impacted too much by the extra
>> interrupt load, further hiding the bug on these platforms.
> 
> It seems this is the trade off the lazy handling makes intentionally,
> we risk some spurious interrupts while the line is disabled to avoid
> poking the hardware.  So long as we're not triggering the spurious
> interrupt handler to permanently disabling the interrupt line, this is a
> valid choice.

At least for some platforms, yes, though it's not exactly clear in the documentation that this is intentional or that the side effect exists at all.

> That's also a consideration for this patch, we're slowing down all
> non-PCI2.3 INTx handling for the behavior of this platform.  Is there
> some behavior of the interrupt controller we can query to know which
> path to use?  Can this issue be seen with the irqfd INTx handling
> disabled on other architectures?  Do we actually care whether we're
> making old INTx devices slower?  Thanks,

I honestly don't know.  In reality, we're talking about amd64 and ppc64el as the only two platforms that I know of that both support VFIO and such old PCIe INTX pre-2.3 devices, and their respective interrupt controller handling in a spurious INTX IRQ context is very different from one another.

Personally, I'd argue that such old devices were intended to work with much slower host systems, therefore the slowdown probably doesn't matter vs. being more correct in terms of interrupt handling.  In terms of general kernel design, my understanding has always been is that best practice is to always mask, disable, or clear a level interrupt before exiting the associated IRQ handler, and the current design seems to violate that rule.  In that context, I'd personally want to see an argument as to why echewing this traditional IRQ handler design is beneficial enough to justify making the VFIO driver dependent on platform-specific behavior.

