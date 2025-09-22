Return-Path: <linuxppc-dev+bounces-12522-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A63B92678
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 19:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVqgt1gnkz3cYN;
	Tue, 23 Sep 2025 03:23:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758561786;
	cv=none; b=bPb+Kp/U+G+6ct6RunGL3iq14aCfM7Y+tEjJsBBESOHbEfJA3oPsb2NjKDLX9G/NFS0Tok1WMPy5L+MGLe+hZ822/VpAgHerwBHOoxunKOmQu9sq9UL6Zkzck1/fknKqkorgDGzAMahoEOqEpnwBRpnFx21+/cv3LfGQh8J87LTv/ZH0A58QGqag6ucJKxTyQN3bhiKf0bDlcIdkWW3qrGuX1SABT7/jvkuqotGocS51uviOUkszP1hQGyXVTjxrUyUjujnA70PD72BGkRwbCjlR51mGa0sEjGE+m3WEXKmNbKafmmBJOJIKN1a+2Djttu1C3RNgQId1q4GpVnCsSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758561786; c=relaxed/relaxed;
	bh=fVJJjuPbrBMRrSHdoKJFZ/4aWh06VwrSX4hItNiq0Ck=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=bJIQ87ntNW7jrNQ1cWSaJF/DYDerc1bXVT0nFlr6YiFEgswA7oxR7DPRHeYGFzgtUWJP1kC93k8/90IH4uA9cAdIxwN0Y1Lbj79DqZYNJxw7LW+EyX4DeMGVC8Jnb9H5r0FN1x/mjEWTUjh19pWTiDvNGBqOyulcFtaxu9ULDLgBiW8IIrohkiZQT/Pt8iXfw/yUSJ8aXRwvrhIKzxmeM1hL6/VF953jPkByKeND90W++qIsmeFoz+dHyfDvs5SLgotPVJ8sXYpHsJbDV0Ipwhm/ZGk1HHViOoyE1XnlshP1wdItRr2y//Gq3pqvMiDChUVeh4E+jmwAmIP9ywOZYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=RWDghy5c; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=RWDghy5c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVqgs1zFPz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 03:23:05 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 54A9A82877C8;
	Mon, 22 Sep 2025 12:23:03 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id IV1HI0GL8OGm; Mon, 22 Sep 2025 12:23:02 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 778B58287DFB;
	Mon, 22 Sep 2025 12:23:02 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 778B58287DFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1758561782; bh=fVJJjuPbrBMRrSHdoKJFZ/4aWh06VwrSX4hItNiq0Ck=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=RWDghy5cE65Uhdn7+YmSRgKslosTQ3ZIwZ9iCEKrKMFedVn7IlwoxFA+XImVLzhrD
	 eyoemTcdfO3GQWZ56jdoXRb7kMTrbe7VeAUHmHB2C55n/ikdM4AgyLqku4X0uyqFQ+
	 cFG4iFJcPK0+rn2Wkg2r4y05fdjg4GwFM7YHeU6g=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 1KkgVY8Ny_bD; Mon, 22 Sep 2025 12:23:02 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 4C5A082877C8;
	Mon, 22 Sep 2025 12:23:02 -0500 (CDT)
Date: Mon, 22 Sep 2025 12:23:02 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: kvm <kvm@vger.kernel.org>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <421530453.1743072.1758561782183.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250922104658.7c2b775e.alex.williamson@redhat.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com> <20250919125603.08f600ac.alex.williamson@redhat.com> <1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com> <20250919162721.7a38d3e2.alex.williamson@redhat.com> <537354829.1740670.1758396303861.JavaMail.zimbra@raptorengineeringinc.com> <20250922100143.1397e28b.alex.williamson@redhat.com> <456215532.1742889.1758558863369.JavaMail.zimbra@raptorengineeringinc.com> <20250922104658.7c2b775e.alex.williamson@redhat.com>
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
Thread-Index: WZOglxowE54aEf3UCclxhetfggfXhg==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Alex Williamson" <alex.williamson@redhat.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, September 22, 2025 11:46:58 AM
> Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices

> On Mon, 22 Sep 2025 11:34:23 -0500 (CDT)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
> 
>> ----- Original Message -----
>> > From: "Alex Williamson" <alex.williamson@redhat.com>
>> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> > Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
>> > Sent: Monday, September 22, 2025 11:01:43 AM
>> > Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices
>> 
>> > On Sat, 20 Sep 2025 14:25:03 -0500 (CDT)
>> > Timothy Pearson <tpearson@raptorengineering.com> wrote:
>> >> Personally, I'd argue that such old devices were intended to work
>> >> with much slower host systems, therefore the slowdown probably
>> >> doesn't matter vs. being more correct in terms of interrupt handling.
>> >>  In terms of general kernel design, my understanding has always been
>> >> is that best practice is to always mask, disable, or clear a level
>> >> interrupt before exiting the associated IRQ handler, and the current
>> >> design seems to violate that rule.  In that context, I'd personally
>> >> want to see an argument as to why echewing this traditional IRQ
>> >> handler design is beneficial enough to justify making the VFIO driver
>> >> dependent on platform-specific behavior.
>> > 
>> > Yep, I kind of agree.  The unlazy flag seems to provide the more
>> > intended behavior.  It moves the irq chip masking into the fast path,
>> > whereas it would have been asynchronous on a subsequent interrupt
>> > previously, but the impact is only to ancient devices operating in INTx
>> > mode, so as long as we can verify those still work on both ppc and x86,
>> > I don't think it's worth complicating the code to make setting the
>> > unlazy flag conditional on anything other than the device support.
>> > 
>> > Care to send out a new version documenting the actual sequence fixed by
>> > this change and updating the code based on this thread?  Note that we
>> > can test non-pci2.3 mode for any device/driver that supports INTx using
>> > the nointxmask=1 option for vfio-pci and booting a linux guest with
>> > pci=nomsi.  Thanks,
>> > 
>> > Alex
>> 
>> Sure, I can update the commit message easily enough, but I must have
>> missed something in regard to a needed code update.  The existing
>> patch only sets unlazy for non-PCI 2.3 INTX devices, and as I
>> understand it that's the behavior we have both agreed on at this
>> point?
> 
> I had commented[1] that testing the interrupt type immediately after
> setting the interrupt type is redundant.  Also, looking again, if we
> set the flag before request_irq, it seems logical that we'd clear the
> flag after free_irq.  I think there are also some unaccounted error
> paths where we can set the flag without clearing it that need to be
> considered.

Gotcha, I missed that the first time around.  I also did a quick check for any other exit paths and only saw the MSI exit handlers, which wouln't be relevant here.

An interesting quirk I found while debugging is that the guest will receive quite a few spurious interrupts.  Changing to unlazy IRQ doesn't fix that, it's just how VFIO works with legacy non-PCI 2.3 INTX devices.  Since the host kernel doesn't know how to clear a pending interrupt on the device, it also doesn't know how to check if the asserted interrupt is actually valid or is the result of the deferred eventfd handling flow we've discussed in this thread.  Therefore, it will always send the IRQ to the guest, which has the somewhat annoying but harmelss effect of incrementing the spurious IRQ counters in the guest with certain drivers.

>> I've tested this on ppc64el and it works quite well, repairing the
>> broken behavior where the guest would receive exactly one interrupt
>> on the legacy PCI device per boot.  I don't have amd64 systems
>> available to test on, however.
> 
> Noted, I'll incorporate some targeted testing here.  Thanks,

Sounds good, thanks.  V2 sent.

