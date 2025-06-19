Return-Path: <linuxppc-dev+bounces-9571-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C60ABAE0E05
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 21:29:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNVzk3kZpz2xck;
	Fri, 20 Jun 2025 05:29:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750361378;
	cv=none; b=Bw9VGCbOeRedS1Zr5uOy6R066q5nO+0GuBta+Puq1skOBChc41TUNlkbn3ocBoguOsEEUeDqnxllukfxyVzm4e4rHjmmtE8PET1JR8yOcxyyUhtzVLru12jwrgu+lK4bftXu7immH3+sPR2K8mjtgHaRWwuf8Afgk0KVzZXM9o1fiDDVBrx2IQgt3S9hydlHe/FP2pD6I6cVuUuIvykGEojG340wLP+H6F9IiefQusL5Ipc3wdaL5F7YtkNn0DAmPaVgm1x00cSh4X9bHXoEeReD7wPAeGM9bBDcT7XR/ISm1kw1iXdrFonw/cAv74OgsjFiJDQ/8Q1pL43/QjArDg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750361378; c=relaxed/relaxed;
	bh=fv7jthCvgTDyikGnfNvnPJOjHiDNeeJUYLlc2LyLdGU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=fPpUSL6/x7ciTZ/oktJHAVkRW25V2TjBJRryeAqab1ILojMxiu2cT0+3JrvQ6orbyxuc0TQMXwgxgDE5MmoCy+wAykvBL02JTw1Is3ZRaSH2teom5eARRbCJnZmd+vwC/SOjQEAJ7avXR98qzex6C3S0rpTwAfz1Rh4EQd2j0HQtrWJ0P1vLRN+ZUXh4BqxQJ5P6QliaoHvvsYDu4R6VSmVkX1FbmLUG/7gcbViJ5tYgnUzoZx+clEX25A7EkyFu2SqQUXWbaIr//HEqTjmMTZKsP7LKuNM7/UnTpi/JHfgQ1buWrv5nbPbWQbX9QyMyzjJDkyJXJSV3Eoi8WZu/6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=okERvjuA; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=okERvjuA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNVzj4KQ0z2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 05:29:37 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 697D78286F37;
	Thu, 19 Jun 2025 14:29:35 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id kDfBiWNVoCZQ; Thu, 19 Jun 2025 14:29:34 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 146358288ADA;
	Thu, 19 Jun 2025 14:29:34 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 146358288ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1750361374; bh=fv7jthCvgTDyikGnfNvnPJOjHiDNeeJUYLlc2LyLdGU=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=okERvjuAVQE1NnPz1/LUszGYbnc5gBPXxzMF/eE18zXf4SW1rBeNA4wyL1j0oKjDa
	 W6bZSSgPBwrq3qJ9bIJynpJMhpB4Z1Q5RKuGisW1Dl37Bb/cTDuruGZO1O1Gh7oTxz
	 L+3VGPCQNIt2BAp4ZlaDBcLhNjM891lKExnTfaqo=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id R2rVL0rBaTqR; Thu, 19 Jun 2025 14:29:33 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id A74768286F37;
	Thu, 19 Jun 2025 14:29:33 -0500 (CDT)
Date: Thu, 19 Jun 2025 14:29:33 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-pci <linux-pci@vger.kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, 
	christophe leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, 
	Shawn Anastasio <sanastasio@raptorengineering.com>, 
	Lukas Wunner <lukas@wunner.de>
Message-ID: <1155677312.1313623.1750361373491.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250618201722.GA1220739@bhelgaas>
References: <20250618201722.GA1220739@bhelgaas>
Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
 broken
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
X-Mailer: Zimbra 8.5.0_GA_3042 (ZimbraWebClient - GC137 (Linux)/8.5.0_GA_3042)
Thread-Topic: pci/hotplug/pnv_php: Work around switches with broken
Thread-Index: QJ8OUVEQgO1djYf5DjG5ikGLe2LBIQ==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Bjorn Helgaas" <helgaas@kernel.org>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel" <linux-kernel@vger.kernel.org>, "linux-pci"
> <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>,
> "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao" <naveen@kernel.org>, "Bjorn Helgaas"
> <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>, "Lukas Wunner" <lukas@wunner.de>
> Sent: Wednesday, June 18, 2025 3:17:22 PM
> Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with broken

> On Wed, Jun 18, 2025 at 02:50:04PM -0500, Timothy Pearson wrote:
>> ----- Original Message -----
>> > From: "Bjorn Helgaas" <helgaas@kernel.org>
>> > To: "Timothy Pearson" <tpearson@raptorengineering.com>
>> > Cc: "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel"
>> > <linux-kernel@vger.kernel.org>, "linux-pci"
>> > <linux-pci@vger.kernel.org>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
>> > "Michael Ellerman" <mpe@ellerman.id.au>,
>> > "christophe leroy" <christophe.leroy@csgroup.eu>, "Naveen N Rao"
>> > <naveen@kernel.org>, "Bjorn Helgaas"
>> > <bhelgaas@google.com>, "Shawn Anastasio" <sanastasio@raptorengineering.com>,
>> > "Lukas Wunner" <lukas@wunner.de>
>> > Sent: Wednesday, June 18, 2025 2:44:00 PM
>> > Subject: Re: [PATCH v2 2/6] pci/hotplug/pnv_php: Work around switches with
>> > broken
>> 
>> > [+cc Lukas, pciehp expert]
>> > 
>> > On Wed, Jun 18, 2025 at 11:56:54AM -0500, Timothy Pearson wrote:
>> >>  presence detection
>> > 
>> > (subject/commit wrapping seems to be on all of these patches)
>> > 
>> >> The Microsemi Switchtec PM8533 PFX 48xG3 [11f8:8533] PCIe switch system
>> >> was observed to incorrectly assert the Presence Detect Set bit in its
>> >> capabilities when tested on a Raptor Computing Systems Blackbird system,
>> >> resulting in the hot insert path never attempting a rescan of the bus
>> >> and any downstream devices not being re-detected.
>> > 
>> > Seems like this switch supports standard PCIe hotplug?  Quite a bit of
>> > this driver looks similar to things in pciehp.  Is there some reason
>> > we can't use pciehp directly?  Maybe pciehp could work if there were
>> > hooks for the PPC-specific bits?
>> 
>> While that is a good long term goal that Raptor is willing to work
>> toward, it is non-trivial and will require buy-in from other
>> stakeholders (e.g. IBM).  If practical, I'd like to get this series
>> merged first, to fix the broken hotplug on our hardware that is
>> deployed worldwide, then in parallel see what can be done to merge
>> PowerNV support into pciehp.  Would that work?
> 
> Yeah, it wouldn't make sense to switch horses at this stage.
> 
> I guess I was triggered by this patch, which seems to be a workaround
> for a defect in a device that is probably also used on non-PPC
> systems, and pciehp would need a similar workaround.  But I guess you
> go on to say that pciehp already does something similar, so it guess
> it's already covered.

No problem, I completely understand.  To be perfectly frank the existing code quality in this driver (and the associated EEH driver) is not the best, and it's been a frustrating experience trying to hack it into semi-stable operation.  I would vastly prefer to rewrite / integrate into the pciehp driver, and we have plans to do so, but that will take an unacceptable amount of time vs. trying to fix up the existing driver as a stopgap.

As you mentioned, pciehp already has this fix, so we just have to deal with the duplicated code until we (Raptor) figures out how to merge PowerNV support into pciehp.

