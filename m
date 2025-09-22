Return-Path: <linuxppc-dev+bounces-12515-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F306DB923E1
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 18:34:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVpbr49r4z2yrQ;
	Tue, 23 Sep 2025 02:34:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=23.155.224.40
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758558872;
	cv=none; b=RoiIZMr3HqAA+EWXVOwS3TXcRPr6J8npYxVLWzRvpr+g7ybIQIy7iHHL9o8SQ8dac1YkJbbdXw50OT6gXskRBY+OUEL/qOJRQ5hN6towcLcMelshbYLN+0iZd7M0bBJFuP/OhDjG4KApkGg/CvczdWikzmW5x4z4wLslxg3NsRyJn9B5E5P1VpHTVNSAOZjg0ans6j83UzJnXbOQZSyWLG43LcP+pvIEqGR+TPSNs2QFKa7re7L5arSBw8U3DNgtAxRnGD6+j/d0DBWTybYtBQmaKl6QRlRKUX+9zNRACq3pbmAADPVm2JJIx5isUTUxJW6eGJCIBYoWgI/XNTxifQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758558872; c=relaxed/relaxed;
	bh=oh6ToL73ZIttgcBjSxTRevOJAHtVa1GDM5kUqX1ToS8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=ZlLTQK48T9tyZXB8YBI8t5HLQFLLeuJXHiDQTmAuPh1Knn8XKyMSfVmV14ez/gsFp3SD5IbTv81kYBsbO2helvkSDYGD8ecMWzuEYdnwxrlYqmnuVwSu3X1NAR10gQjO4zvw9z7vWUSxHbPrFpwGrErKBt7UDXIxL/9FTQ3UGCQLAkFPg8U6BGOAjejodjowBHdltwvxX6bcBCOWHMjH9+8pJAEgQFlVSPJm6bfeQvvk6EusE47BNFwkTGJrud8K8h9sUc6bBcNS6a96X5N/FJJF542Et8yOZagEpTmk2WAtYOJBHXQAhTT4xgtOpmCCraOuowWCcmr0O02SELPGfg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com; dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=tQDwZCWH; dkim-atps=neutral; spf=pass (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org) smtp.mailfrom=raptorengineering.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=raptorengineering.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; secure) header.d=raptorengineering.com header.i=@raptorengineering.com header.a=rsa-sha256 header.s=B8E824E6-0BE2-11E6-931D-288C65937AAD header.b=tQDwZCWH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=raptorengineering.com (client-ip=23.155.224.40; helo=raptorengineering.com; envelope-from=tpearson@raptorengineering.com; receiver=lists.ozlabs.org)
Received: from raptorengineering.com (mail.raptorengineering.com [23.155.224.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVpbn69hKz2xck
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 02:34:29 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 098098288B69;
	Mon, 22 Sep 2025 11:34:27 -0500 (CDT)
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id oD4Q81DzPA_R; Mon, 22 Sep 2025 11:34:26 -0500 (CDT)
Received: from localhost (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id 26F418288E8C;
	Mon, 22 Sep 2025 11:34:26 -0500 (CDT)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.rptsys.com 26F418288E8C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=raptorengineering.com; s=B8E824E6-0BE2-11E6-931D-288C65937AAD;
	t=1758558866; bh=oh6ToL73ZIttgcBjSxTRevOJAHtVa1GDM5kUqX1ToS8=;
	h=Date:From:To:Message-ID:MIME-Version;
	b=tQDwZCWHuxMYtZdafLa6Cu+lqnsEMdqWJImPr32Nj5WgSz8uaQAofsbVosLn4REnv
	 D9gJqy8+mJ7LwRMeQbnNUYw9OfBom9dPdd2PM2/N/mBABRvUu2t2sUjBDcZJNF9INA
	 sIlTTyIXaYgrXQoj9wWPf33dyaL+IiZhvZR8Ce78=
X-Virus-Scanned: amavisd-new at rptsys.com
Received: from mail.rptsys.com ([127.0.0.1])
	by localhost (vali.starlink.edu [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id lju9L-zpfO1L; Mon, 22 Sep 2025 11:34:26 -0500 (CDT)
Received: from vali.starlink.edu (localhost [127.0.0.1])
	by mail.rptsys.com (Postfix) with ESMTP id EFE838288B69;
	Mon, 22 Sep 2025 11:34:25 -0500 (CDT)
Date: Mon, 22 Sep 2025 11:34:23 -0500 (CDT)
From: Timothy Pearson <tpearson@raptorengineering.com>
To: Alex Williamson <alex.williamson@redhat.com>
Cc: Timothy Pearson <tpearson@raptorengineering.com>, kvm <kvm@vger.kernel.org>, 
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Message-ID: <456215532.1742889.1758558863369.JavaMail.zimbra@raptorengineeringinc.com>
In-Reply-To: <20250922100143.1397e28b.alex.williamson@redhat.com>
References: <663798478.1707537.1757450926706.JavaMail.zimbra@raptorengineeringinc.com> <20250919125603.08f600ac.alex.williamson@redhat.com> <1916735949.1739694.1758315074669.JavaMail.zimbra@raptorengineeringinc.com> <20250919162721.7a38d3e2.alex.williamson@redhat.com> <537354829.1740670.1758396303861.JavaMail.zimbra@raptorengineeringinc.com> <20250922100143.1397e28b.alex.williamson@redhat.com>
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
Thread-Index: vhXA6uJOAuHvEGJHjXX23Z2oDpkEew==
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



----- Original Message -----
> From: "Alex Williamson" <alex.williamson@redhat.com>
> To: "Timothy Pearson" <tpearson@raptorengineering.com>
> Cc: "kvm" <kvm@vger.kernel.org>, "linuxppc-dev" <linuxppc-dev@lists.ozlabs.org>
> Sent: Monday, September 22, 2025 11:01:43 AM
> Subject: Re: [PATCH] vfio/pci: Fix INTx handling on legacy DisINTx- PCI devices

> On Sat, 20 Sep 2025 14:25:03 -0500 (CDT)
> Timothy Pearson <tpearson@raptorengineering.com> wrote:
>> Personally, I'd argue that such old devices were intended to work
>> with much slower host systems, therefore the slowdown probably
>> doesn't matter vs. being more correct in terms of interrupt handling.
>>  In terms of general kernel design, my understanding has always been
>> is that best practice is to always mask, disable, or clear a level
>> interrupt before exiting the associated IRQ handler, and the current
>> design seems to violate that rule.  In that context, I'd personally
>> want to see an argument as to why echewing this traditional IRQ
>> handler design is beneficial enough to justify making the VFIO driver
>> dependent on platform-specific behavior.
> 
> Yep, I kind of agree.  The unlazy flag seems to provide the more
> intended behavior.  It moves the irq chip masking into the fast path,
> whereas it would have been asynchronous on a subsequent interrupt
> previously, but the impact is only to ancient devices operating in INTx
> mode, so as long as we can verify those still work on both ppc and x86,
> I don't think it's worth complicating the code to make setting the
> unlazy flag conditional on anything other than the device support.
> 
> Care to send out a new version documenting the actual sequence fixed by
> this change and updating the code based on this thread?  Note that we
> can test non-pci2.3 mode for any device/driver that supports INTx using
> the nointxmask=1 option for vfio-pci and booting a linux guest with
> pci=nomsi.  Thanks,
> 
> Alex

Sure, I can update the commit message easily enough, but I must have missed something in regard to a needed code update.  The existing patch only sets unlazy for non-PCI 2.3 INTX devices, and as I understand it that's the behavior we have both agreed on at this point?

I've tested this on ppc64el and it works quite well, repairing the broken behavior where the guest would receive exactly one interrupt on the legacy PCI device per boot.  I don't have amd64 systems available to test on, however.

Thanks!

