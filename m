Return-Path: <linuxppc-dev+bounces-12435-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1095B8B77E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Sep 2025 00:27:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cT6Zm6qB0z2xnk;
	Sat, 20 Sep 2025 08:27:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758320864;
	cv=none; b=mWiJxeKmKd+na2saXoSiiD5rM0UjorAp3x5w2j0VulFMGaFSMBPp9fXEu1ctz6mXYgm+a674SIa7vGbtkWa0/r7cFfQV/Z+SmGWdKLAow9uxiaVm+mjBo7Gm/GAmztdL/KljlHgS/vJi5OGc82yiZIC/HfaJnGLRgKFO49M16x4+0RI7d7Luui1zjaRpGdRPXbaP4EI889PmcCFjQOl0o9bVfuOmHwfVjhKO4pMCaTXVlVMN6tW3pCM160ciCbhvY3HJPzKmGutGYo4ty/1OBSsxvABmwujlRLNLO0xjxvX+lSYQ0rvckjF5i3hNocH5fuXhNTLomJznE8I0/nvKaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758320864; c=relaxed/relaxed;
	bh=S7zBUG1B6Yjuv09cr614NdKH1148t7ceSZe3oMRHpm0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c2KuzJYXbKBBCJyrEy5hgBuODxO069bStqc1PyufhbVnsr8joAXtdUOIWbL9JMgSmohInlEQi8l3yk+TGd3ZHpK1XDS/2LvRJeIVTR9/As4aUw8UypUE79bJHMAC/1xKATbZ4SenFr3fO6tXCoajEAsZTvYxv0SQsodD11qx3IGziwEkCTGsSY05uDM4YSCdEqX7k63yZ8jJ1IGcaG7CZfSvqOXFTMauXWvXBY3kSfFJldFh31XNIwqEmctK1Nd791cVKEE1WvyHRb8Whq7VWlB9EFa1yygob/jtNMbDYo2fs9Lrb997B0qrFA8UNfUhrpZh1UPN9DhZhln+TN2x3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jTV92roj; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PiGNAI2v; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=jTV92roj;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=PiGNAI2v;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=alex.williamson@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cT6Zl4dcMz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 08:27:41 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758320855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7zBUG1B6Yjuv09cr614NdKH1148t7ceSZe3oMRHpm0=;
	b=jTV92rojY1BIt5mZDNDUR8J5WJ6M5OgOac43JoA03B6RqC/WNgHGfx6+khfwIJ2fF/4n0k
	Zhaaj6auwe+xAyiK617QdUIZC4VXsJ2Iox/IsRUkhvF8wKR+VzJVBWapOBb0ai5O1Ex2aQ
	S40VRAvPUaH6BenG//E6FBhtVjRgVgc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758320856;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S7zBUG1B6Yjuv09cr614NdKH1148t7ceSZe3oMRHpm0=;
	b=PiGNAI2vsjjbuy4Okilcx8nHOVev29eFyUVCNZup3/XxchPNcjqfTTSna+Itian++E410m
	K8XQPGuOp0j9Ikr6iBoftFCI/kK9P2IjZp0Ez8/MjNPX+Qjr08bfs+xiBMfl/YbgGwrx4E
	5HEbij2ehefsR7jW+h+HOzZGrWu71fo=
Received: from mail-il1-f197.google.com (mail-il1-f197.google.com
 [209.85.166.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-562-NN98P0-NPuOSs-W6Pqzr3A-1; Fri, 19 Sep 2025 18:27:26 -0400
X-MC-Unique: NN98P0-NPuOSs-W6Pqzr3A-1
X-Mimecast-MFC-AGG-ID: NN98P0-NPuOSs-W6Pqzr3A_1758320846
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-4240abfbce2so4597515ab.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Sep 2025 15:27:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758320846; x=1758925646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S7zBUG1B6Yjuv09cr614NdKH1148t7ceSZe3oMRHpm0=;
        b=Hztdk7msaYL/PU9tYT4DZKR5Xo97O9xDZB3fzfb0iVXuWWthWpO7Bj0vN91mYpl1XA
         6v+pUtOr55Y9Dx887vm3X8i5fJMUt4D/nC2DFJ9haipZdJQhNr24MbLJbjWSuLcjrZXc
         QOHb2kZs7UfhRPN2zb3WB1soQJaEI5BOQDKKaGanvl6/VgB6/mBJ7TxYL247emnPDZB3
         Uic/WCyfrXXPejK6K0NmHo0UYi+J1bxWNikH4b+ZcGJdIm2hh6MbDI31Ao9gqmNitJru
         JWSTyxinX+J79e7HckzyM+FJHhjAPpB+S9kq/dBYLtCHPQnfOf7OkUeFM6JKx6A7JYiv
         ml9A==
X-Forwarded-Encrypted: i=1; AJvYcCU2eEfgquZ7TGt9ykQqLgD1mrCGvIfVRUxOpp938MZux5igVotzVu+vK2421PnhbxoqZFk7HBOrAIAI7AM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YweEBjgBK8FRqBkF8lt5WUhIY4PuQdZTS3BoDNwSPzyAzPx58Au
	q28nk8wBTxD6cuJB71hteSywzg1LZMBnTIGzf1G5EpKIjcGTTqywHCMNXBEa2k5ESaRgsAr2Kr2
	W+4l13PG91meWzce6jIU+f/vlMsS3te2ZJ+QNj0/C3CF4MhzZ3kO5DzQHSv2Km24/Xik=
X-Gm-Gg: ASbGnctOZb45J7wSh3TELRxFuFfHleJR/9MhbGGQHK5aosGqQHavFUrqblLF1BCEk3P
	h3pfuRmYgevuKEZTO4b0QuOeC3SllwtUOYHF8hUd3t5tF9XaGz10HjJD17cfLLyP0RXU3uy9qq3
	uOMAAAPIIYFH1NApyz7/ucHg4qKaFDgIzaEH7csN4qWSNEgx8AC/emiJs0UJukXMW0q/r8oLUp4
	ZspLSpxsmUeCKbi9A3/X+IXtR8Ug7tl+3bv+kj1RHKtuEBb6KM7snAsY6RjZicrOt1z/TccodFk
	jDWx1CyiVCXLineM5e0HRdae9cEzO67Uxw6Zb5w3d7w=
X-Received: by 2002:a05:6602:14cb:b0:894:6ff:6e9c with SMTP id ca18e2360f4ac-8add2201482mr326048939f.2.1758320846084;
        Fri, 19 Sep 2025 15:27:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtDrsXG22gNdOlTCT+B9j0NR/HkZuw2s4Yo+7xf+eh3MKB+/pJmRKobcMjuP7PoFW+Ahwupw==
X-Received: by 2002:a05:6602:14cb:b0:894:6ff:6e9c with SMTP id ca18e2360f4ac-8add2201482mr326047839f.2.1758320845689;
        Fri, 19 Sep 2025 15:27:25 -0700 (PDT)
Received: from redhat.com ([38.15.36.11])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d58fc4ef4sm2641196173.83.2025.09.19.15.27.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 15:27:25 -0700 (PDT)
Date: Fri, 19 Sep 2025 16:27:21 -0600
From: Alex Williamson <alex.williamson@redhat.com>
To: Timothy Pearson <tpearson@raptorengineering.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI
 devices
Message-ID: <20250919162721.7a38d3e2.alex.williamson@redhat.com>
In-Reply-To: <1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com>
	<20250919125603.08f600ac.alex.williamson@redhat.com>
	<1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com>
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
X-Mimecast-MFC-PROC-ID: 3ry1yAjuNcReKdT9zUSbhNn7YRuUj8d9Gf2Y_QxFSMw_1758320846
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, 19 Sep 2025 15:51:14 -0500 (CDT)
Timothy Pearson <tpearson@raptorengineering.com> wrote:

> ----- Original Message -----
> > From: "Alex Williamson" <alex.williamson@redhat.com>
> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> > Sent: Friday, September 19, 2025 1:56:03 PM
> > Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices  
> 
> > On Tue, 9 Sep 2025 15:48:46 -0500 (CDT)
> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
> >   
> >> PCI devices prior to PCI 2.3 both use level interrupts and do not support
> >> interrupt masking, leading to a failure when passed through to a KVM guest on
> >> at least the ppc64 platform, which does not utilize the resample IRQFD. This
> >> failure manifests as receiving and acknowledging a single interrupt in the guest
> >> while leaving the host physical device VFIO IRQ pending.
> >> 
> >> Level interrupts in general require special handling due to their inherently
> >> asynchronous nature; both the host and guest interrupt controller need to
> >> remain in synchronization in order to coordinate mask and unmask operations.
> >> When lazy IRQ masking is used on DisINTx- hardware, the following sequence
> >> occurs:
> >>
> >>  * Level IRQ assertion on host
> >>  * IRQ trigger within host interrupt controller, routed to VFIO driver
> >>  * Host EOI with hardware level IRQ still asserted
> >>  * Software mask of interrupt source by VFIO driver
> >>  * Generation of event and IRQ trigger in KVM guest interrupt controller
> >>  * Level IRQ deassertion on host
> >>  * Guest EOI
> >>  * Guest IRQ level deassertion
> >>  * Removal of software mask by VFIO driver
> >> 
> >> Note that no actual state change occurs within the host interrupt controller,
> >> unlike what would happen with either DisINTx+ hardware or message interrupts.
> >> The host EOI is not fired with the hardware level IRQ deasserted, and the
> >> level interrupt is not re-armed within the host interrupt controller, leading
> >> to an unrecoverable stall of the device.
> >> 
> >> Work around this by disabling lazy IRQ masking for DisINTx- INTx devices.  
> > 
> > I'm not really following here.  It's claimed above that no actual state
> > change occurs within the host interrupt controller, but that's exactly
> > what disable_irq_nosync() intends to do, mask the interrupt line at the
> > controller.  
> 
> While it seems that way on the surface (and this tripped me up
> originally), the actual call chain is:
> 
> disable_irq_nosync()
> __disable_irq_nosync()
> __disable_irq()
> irq_disable()
> 
> Inside void irq_disable(), __irq_disable() is gated on
> irq_settings_disable_unlazy().  The lazy disable is intended to *not*
> touch the interrupt controller itself, instead lazy mode masks the
> interrupt at the device level (DisINT+ registers).  If the IRQ is set
> up to run in lazy mode, the interrupt is not disabled at the actual
> interrupt controller by disable_irq_nosync().

What chip handler are you using?  The comment above irq_disable
reiterates the behavior, yes if the chip doesn't support irq_disable it
marks the interrupt masked but leaves the hardware unmasked.  It does
not describe using DisINTx to mask the device, which would be at a
different level from the chip.  In this case __irq_disable() just calls
irq_state_set_disabled().  Only with the change proposed here would we
also call mask_irq().
 
> > The lazy optimization that's being proposed here should
> > only change the behavior such that the interrupt is masked at the
> > call to disable_irq_nosync() rather than at a subsequent
> > re-assertion of the interrupt.  In any case, enable_irq() should
> > mark the line enabled and reenable the controller if necessary.  
> 
> If the interrupt was not disabled at the controller, then reenabling
> a level interrupt is not guaranteed to actually do anything (although
> it *might*).  The hardware in the interrupt controller will still
> "see" an active level assert for which it fired an interrupt without
> a prior acknowledge (or disable/enable cycle) from software, and can
> then decide to not re-raise the IRQ on a platform-specific basis.
> 
> The key here is that the interrupt controllers differ somewhat in
> behavior across various architectures.  On POWER, the controller will
> only raise the external processor interrupt once for each level
> interrupt when that interrupt changes state to asserted, and will
> only re-raise the external processor interrupt once an acknowledge
> for that interrupt has been sent to the interrupt controller hardware
> while the level interrupt is deasserted.  As a result, if the
> interrupt handler executes (acknowledging the interrupt), but does
> not first clear the interrupt on the device itself, the interrupt
> controller will never re-raise that interrupt -- from its
> perspective, it has issued another IRQ (because the device level
> interrupt was left asserted) and the associated handler has never
> completed.  Disabling the interrupt causes the controller to reassert
> the interrupt if the level interrupt is still asserted when the
> interrupt is reenabled at the controller level.

This sounds a lot more like the problem than the previous description.
Is the actual scenario something like the irq is marked disabled, the
eventfd is delivered to userspace, userspace handles the device, the
interrupt is de-asserted at the device, but then the device re-asserts
the interrupt before the unmask ioctl, causing the interrupt chip to
mask the interrupt, then enable_irq() from the unmask ioctl doesn't
reassert the interrupt?

> On other platforms the external processor interrupt itself is
> disabled until the interrupt handler has finished, and the controller
> doesn't auto-mask the level interrupts at the hardware level;
> instead, it will happily re-assert the processor interrupt if the
> interrupt was not cleared at the device level after IRQ acknowledge.
> I suspect on those platforms this bug may be masked at the expense of
> a bunch of "spurious" / unwanted interrupts if the interrupt handler
> hasn't acked the interrupt at the device level; as long as the guest
> interrupt handler is able to somewhat rapidly clear the device
> interrupt, performance won't be impacted too much by the extra
> interrupt load, further hiding the bug on these platforms.

It seems this is the trade off the lazy handling makes intentionally,
we risk some spurious interrupts while the line is disabled to avoid
poking the hardware.  So long as we're not triggering the spurious
interrupt handler to permanently disabling the interrupt line, this is a
valid choice.

That's also a consideration for this patch, we're slowing down all
non-PCI2.3 INTx handling for the behavior of this platform.  Is there
some behavior of the interrupt controller we can query to know which
path to use?  Can this issue be seen with the irqfd INTx handling
disabled on other architectures?  Do we actually care whether we're
making old INTx devices slower?  Thanks,

Alex


