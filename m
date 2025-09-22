Return-Path: <linuxppc-dev+bounces-12510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE2B921B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:02:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVntJ0cbTz30Qk;
	Tue, 23 Sep 2025 02:02:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758556919;
	cv=none; b=leLvzDKVfbE5p+Hcd7XJPvLmj4PcksvLdJrLBhyRgSsVJ69kr78Hd5/12Rppr8d+Rx3YWcIRqNR3h5NXtK7i6V5d+Zy5MUysmSOhi6b7s8kKNat6ek1ljk729iAKUhSzkxYwrncUfx5oiP6dI3H/7a7WIOxkcLd/wXbJGAw2k2E3RvniQiGyMpmXNxyCj3cws6d/8vNiHQwxs5CO8XYOP2P+jJmueg+mj+Ghot0NNQXAa349/5N8gImvjFfGeLz6f7WMw/AdlJKAfIuvKYirO09LYq/ZjLjOJMxELWMqHdAA0U9y5b2sNkz1oGnXppUqDFdYtjUKtfImY5OBzu9IWA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758556919; c=relaxed/relaxed;
	bh=tXNIluJ/Y0q23mzmIzZIg9/Tv+rjRchaEvz0cHtgPjw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HCEUiaVtXFI6LbQNja/OP6NSMC1B2jEajSb19pW/FIudINmYdAs0OinLC6EToFC1hL3524I8X5NoYLMUXbfRJgNidlQxk948CD3kIGooErhIXHeD+crVwgzWQp9Em6QmxUV2eaWG6R0dBcUpsurAnDIyj3M/IoL8jx2V7TsZVWsfYLGerjHX6HTDis//eWQgLhBxGbJPnL+ik5trwdRpxJhqUUQT0RSPME7LXCZqTwBVYje7oPQS/lKsS5MC7Qrg2f4UxmsZCcUwGkdjIRVrnLMjUe5NwaQCnWIv70bhHiJUrPxVVI3CRQWnwNWHoWZDeA/aQeIeKFLyYHoSlKCWTQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6EMTbdx; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6EMTbdx; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6EMTbdx;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=S6EMTbdx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVntG49jjz30HB
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:01:56 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758556912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXNIluJ/Y0q23mzmIzZIg9/Tv+rjRchaEvz0cHtgPjw=;
	b=S6EMTbdxm75GhKEHW5qxmK2xBaAEHoO/wwKAOy3Ec/8gj6CJ/uG7Oc+bifift4VIJhUEyo
	malS32megac6D+UxnZubcjctNBwE7E2E/YNHTN4NbYJkOtXoKe2UpgX/SwKeK16nkR9KqK
	97bYLndXujDT/+Oh9aZAdxPADyeuKAg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758556912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tXNIluJ/Y0q23mzmIzZIg9/Tv+rjRchaEvz0cHtgPjw=;
	b=S6EMTbdxm75GhKEHW5qxmK2xBaAEHoO/wwKAOy3Ec/8gj6CJ/uG7Oc+bifift4VIJhUEyo
	malS32megac6D+UxnZubcjctNBwE7E2E/YNHTN4NbYJkOtXoKe2UpgX/SwKeK16nkR9KqK
	97bYLndXujDT/+Oh9aZAdxPADyeuKAg=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-352-vpqURtFOOba6SfVUKMDDVg-1; Mon, 22 Sep 2025 12:01:50 -0400
X-MC-Unique: vpqURtFOOba6SfVUKMDDVg-1
X-Mimecast-MFC-AGG-ID: vpqURtFOOba6SfVUKMDDVg_1758556910
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-3197f534082so2005693fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Sep 2025 09:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758556909; x=1759161709;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tXNIluJ/Y0q23mzmIzZIg9/Tv+rjRchaEvz0cHtgPjw=;
        b=Y9EfNKCjRJUVyCNkupE9ka2w0wDZHokmWAzrV3VOXAb+ECjzjrFtTX5jwtMh/e2eGO
         BP8TARwZGDK5gKCEUCXJ0CEKah7h8gHtEtZSQvnmqbKwxuhMIrgGyHjTkZQEaWgg7wsT
         mdUp5SS5ELrqAc/B8svzdVaZQ4mdVm+2b37HGNVdJMizd4ZscaidE08Qi8TAhMIjA8NN
         tLsWK+h2jUAtu9MGtsVokS1w32afE8Bvc2QWFfpSoSimot+GB3C2PE4/tcobLfmjLqNz
         b6BKJKHGbICkRKfcVcgJZ3d/oKO9GVsCb1aOZz0UjGQkqApqmpfseGH9Km15ZG8/6QSg
         I4GA==
X-Forwarded-Encrypted: i=1; AJvYcCUaIMi06L2ZyjTI1cJ2U4yPZo6qXYHXLjSzTUQUjAUB5gv8XMWFkG0WjlAsQcCZ+wsYQ4K6lV1ClcuNEoQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvydKZwrrsHgknPK1Yge4VkFmpd+orlCp7OMvYOueikiRH/UF3
	BtDFZWVn8i+IXmslfElOFbTY7f4tptFgKhAk50EDU3XfOh+vBDVMnGPT8IgPo/6FUfXycJ/Bouo
	pFmUMUetHJzoDq0BXZZVt5FS0WMJkMPSxYe2adoq5kI0SOMwW2bzvY0X2I10NrjkKdTkjp5/iZB
	A=
X-Gm-Gg: ASbGncup8WM3FkTpWdLcegyqV+7qjOBR7e+xWmnb8VaZQiYVsiv9Xj7Xn4y/0kjyQx3
	hvfEjf8dTMtgAHaIj981Je5jTb33uaSLDj4CQxJir4sCxu+GDrxk0iuiMrcccdFF61TLAm/KmyD
	c+Qs3ALLTxuraxn/2Rnv0DJsFvSgEOBA90jOPv+W+mUU9N+n4G9uLHGROGH9i5CxGVqtBswEX9w
	Wn7U47G4xeBaUCaMUseo3amoJPD4bxGeCNa9CDuB3gYd46xTtDa8ui5OaLMUHtPGEWvvxfS/MtJ
	lB4v8VmwZrh8svSyY0ozOs7jyLKD+RazzfGo/4Hfe/U=
X-Received: by 2002:a05:6871:2987:b0:331:ebe7:f673 with SMTP id 586e51a60fabf-33bb49655aamr3564718fac.9.1758556908232;
        Mon, 22 Sep 2025 09:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGz5/rWt2sNidlRW6kyh8a7NA1uRncwrteUD3AJv60SOcvoVzWhVpJzASNVa+IT+VYZbfD6A==
X-Received: by 2002:a05:6871:2987:b0:331:ebe7:f673 with SMTP id 586e51a60fabf-33bb49655aamr3564695fac.9.1758556907521;
        Mon, 22 Sep 2025 09:01:47 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-336e411fcb8sm7901202fac.8.2025.09.22.09.01.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:01:46 -0700 (PDT)
Date: Mon, 22 Sep 2025 10:01:43 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI
 devices
Message-ID: <20250922100143.1397e28b.alex.williamson@redhat.com>
In-Reply-To: <537354829.1740670.1758396303861.JavaMail.zimbra@raptorengineeringinc.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com>
	<20250919125603.08f600ac.alex.williamson@redhat.com>
	<1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com>
	<20250919162721.7a38d3e2.alex.williamson@redhat.com>
	<537354829.1740670.1758396303861.JavaMail.zimbra@raptorengineeringinc.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
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
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 24HzJ17S21fe7lwg_UjkbYKoyFXNzPqaocghDRU70Is_1758556910
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sat, 20 Sep 2025 14:25:03 -0500 (CDT)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> ----- Original Message -----
> > From: "Alex Williamson" <alex.williamson@redhat.com>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> > Sent: Friday, September 19, 2025 5:27:21 PM
> > Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices  
> 
> > On Fri, 19 Sep 2025 15:51:14 -0500 (CDT)
> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
> >   
> >> ----- Original Message -----  
> >> > From: "Alex Williamson" <alex.williamson@redhat.com>
> >> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> >> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> >> > Sent: Friday, September 19, 2025 1:56:03 PM
> >> > Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices  
> >>   
> >> > On Tue, 9 Sep 2025 15:48:46 -0500 (CDT)
> >> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
> >> >     
> >> >> PCI devices prior to PCI 2.3 both use level interrupts and do not support
> >> >> interrupt masking, leading to a failure when passed through to a KVM guest on
> >> >> at least the ppc64 platform, which does not utilize the resample IRQFD. This
> >> >> failure manifests as receiving and acknowledging a single interrupt in the guest
> >> >> while leaving the host physical device VFIO IRQ pending.
> >> >> 
> >> >> Level interrupts in general require special handling due to their inherently
> >> >> asynchronous nature; both the host and guest interrupt controller need to
> >> >> remain in synchronization in order to coordinate mask and unmask operations.
> >> >> When lazy IRQ masking is used on DisINTx- hardware, the following sequence
> >> >> occurs:
> >> >>
> >> >>  * Level IRQ assertion on host
> >> >>  * IRQ trigger within host interrupt controller, routed to VFIO driver
> >> >>  * Host EOI with hardware level IRQ still asserted
> >> >>  * Software mask of interrupt source by VFIO driver
> >> >>  * Generation of event and IRQ trigger in KVM guest interrupt controller
> >> >>  * Level IRQ deassertion on host
> >> >>  * Guest EOI
> >> >>  * Guest IRQ level deassertion
> >> >>  * Removal of software mask by VFIO driver
> >> >> 
> >> >> Note that no actual state change occurs within the host interrupt controller,
> >> >> unlike what would happen with either DisINTx+ hardware or message interrupts.
> >> >> The host EOI is not fired with the hardware level IRQ deasserted, and the
> >> >> level interrupt is not re-armed within the host interrupt controller, leading
> >> >> to an unrecoverable stall of the device.
> >> >> 
> >> >> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.  
> >> > 
> >> > I'm not really following here.  It's claimed above that no actual state
> >> > change occurs within the host interrupt controller, but that's exactly
> >> > what disable_irq_nosync() intends to do, mask the interrupt line at the
> >> > controller.  
> >> 
> >> While it seems that way on the surface (and this tripped me up
> >> originally), the actual call chain is:
> >> 
> >> disable_irq_nosync()
> >> __disable_irq_nosync()
> >> __disable_irq()
> >> irq_disable()
> >> 
> >> Inside void irq_disable(), __irq_disable() is gated on
> >> irq_settings_disable_unlazy().  The lazy disable is intended to *not*
> >> touch the interrupt controller itself, instead lazy mode masks the
> >> interrupt at the device level (DisINT+ registers).  If the IRQ is set
> >> up to run in lazy mode, the interrupt is not disabled at the actual
> >> interrupt controller by disable_irq_nosync().  
> > 
> > What chip handler are you using?  The comment above irq_disable
> > reiterates the behavior, yes if the chip doesn't support irq_disable it
> > marks the interrupt masked but leaves the hardware unmasked.  It does
> > not describe using DisINTx to mask the device, which would be at a
> > different level from the chip.  In this case __irq_disable() just calls
> > irq_state_set_disabled().  Only with the change proposed here would we
> > also call mask_irq().  
> 
> This is all tested on a POWER XIVE controller, so arch/powerpc/sysdev/xive (CONFIG_PPC_XIVE_NATIVE=y)
> 
> >> > The lazy optimization that's being proposed here should
> >> > only change the behavior such that the interrupt is masked at the
> >> > call to disable_irq_nosync() rather than at a subsequent
> >> > re-assertion of the interrupt.  In any case, enable_irq() should
> >> > mark the line enabled and reenable the controller if necessary.  
> >> 
> >> If the interrupt was not disabled at the controller, then reenabling
> >> a level interrupt is not guaranteed to actually do anything (although
> >> it *might*).  The hardware in the interrupt controller will still
> >> "see" an active level assert for which it fired an interrupt without
> >> a prior acknowledge (or disable/enable cycle) from software, and can
> >> then decide to not re-raise the IRQ on a platform-specific basis.
> >> 
> >> The key here is that the interrupt controllers differ somewhat in
> >> behavior across various architectures.  On POWER, the controller will
> >> only raise the external processor interrupt once for each level
> >> interrupt when that interrupt changes state to asserted, and will
> >> only re-raise the external processor interrupt once an acknowledge
> >> for that interrupt has been sent to the interrupt controller hardware
> >> while the level interrupt is deasserted.  As a result, if the
> >> interrupt handler executes (acknowledging the interrupt), but does
> >> not first clear the interrupt on the device itself, the interrupt
> >> controller will never re-raise that interrupt -- from its
> >> perspective, it has issued another IRQ (because the device level
> >> interrupt was left asserted) and the associated handler has never
> >> completed.  Disabling the interrupt causes the controller to reassert
> >> the interrupt if the level interrupt is still asserted when the
> >> interrupt is reenabled at the controller level.  
> > 
> > This sounds a lot more like the problem than the previous description.  
> 
> Apologies for that.  There's a lot of moving parts here and I guess I muddled it all up in the first description.
> 
> > Is the actual scenario something like the irq is marked disabled, the
> > eventfd is delivered to userspace, userspace handles the device, the
> > interrupt is de-asserted at the device, but then the device re-asserts
> > the interrupt before the unmask ioctl, causing the interrupt chip to
> > mask the interrupt, then enable_irq() from the unmask ioctl doesn't
> > reassert the interrupt?  
> 
> That is exactly it, yes.  This particular scenario only occurs on old
> pre-PCI 2.3 devices that advertise DisINT- ; newer devices that
> advertise DisINT+ don't trip the fault since the host interrupt
> handler sets the device interrupt mask (thus deasserting the IRQ at
> the interrupt controller) before exiting.
> 
> >> On other platforms the external processor interrupt itself is
> >> disabled until the interrupt handler has finished, and the
> >> controller doesn't auto-mask the level interrupts at the hardware
> >> level; instead, it will happily re-assert the processor interrupt
> >> if the interrupt was not cleared at the device level after IRQ
> >> acknowledge. I suspect on those platforms this bug may be masked
> >> at the expense of a bunch of "spurious" / unwanted interrupts if
> >> the interrupt handler hasn't acked the interrupt at the device
> >> level; as long as the guest interrupt handler is able to somewhat
> >> rapidly clear the device interrupt, performance won't be impacted
> >> too much by the extra interrupt load, further hiding the bug on
> >> these platforms.  
> > 
> > It seems this is the trade off the lazy handling makes
> > intentionally, we risk some spurious interrupts while the line is
> > disabled to avoid poking the hardware.  So long as we're not
> > triggering the spurious interrupt handler to permanently disabling
> > the interrupt line, this is a valid choice.  
> 
> At least for some platforms, yes, though it's not exactly clear in
> the documentation that this is intentional or that the side effect
> exists at all.
> 
> > That's also a consideration for this patch, we're slowing down all
> > non-PCI2.3 INTx handling for the behavior of this platform.  Is
> > there some behavior of the interrupt controller we can query to
> > know which path to use?  Can this issue be seen with the irqfd INTx
> > handling disabled on other architectures?  Do we actually care
> > whether we're making old INTx devices slower?  Thanks,  
> 
> I honestly don't know.  In reality, we're talking about amd64 and
> ppc64el as the only two platforms that I know of that both support
> VFIO and such old PCIe INTX pre-2.3 devices, and their respective
> interrupt controller handling in a spurious INTX IRQ context is very
> different from one another.
> 
> Personally, I'd argue that such old devices were intended to work
> with much slower host systems, therefore the slowdown probably
> doesn't matter vs. being more correct in terms of interrupt handling.
>  In terms of general kernel design, my understanding has always been
> is that best practice is to always mask, disable, or clear a level
> interrupt before exiting the associated IRQ handler, and the current
> design seems to violate that rule.  In that context, I'd personally
> want to see an argument as to why echewing this traditional IRQ
> handler design is beneficial enough to justify making the VFIO driver
> dependent on platform-specific behavior.

Yep, I kind of agree.  The unlazy flag seems to provide the more
intended behavior.  It moves the irq chip masking into the fast path,
whereas it would have been asynchronous on a subsequent interrupt
previously, but the impact is only to ancient devices operating in INTx
mode, so as long as we can verify those still work on both ppc and x86,
I don't think it's worth complicating the code to make setting the
unlazy flag conditional on anything other than the device support.

Care to send out a new version documenting the actual sequence fixed by
this change and updating the code based on this thread?  Note that we
can test non-pci2.3 mode for any device/driver that supports INTx using
the nointxmask=1 option for vfio-pci and booting a linux guest with
pci=nomsi.  Thanks,

Alex


