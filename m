Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A43F88BF91D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 10:56:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=DURQmnno;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VZ8Bf1rvsz3cVF
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 18:56:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=DURQmnno;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.161; helo=mout-p-103.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VZ89s6phLz30Ts
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 18:55:29 +1000 (AEST)
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4VZ89X13K6z9sRx;
	Wed,  8 May 2024 10:55:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1715158512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LgTa174CN4twtJVuodBezk0b2vWnBKWssMs5UWGeMhE=;
	b=DURQmnnoX8sm4mSH2+Wiww+tChze7TvUiyZS+n2y2rVSOBoJXb5ppk/y7HqkmmEuUINXx7
	EyqnuylnRlAwf77RwpnGTSJILDfxnX1FUVI8ZrehNhEtcaTHHZTy6M+wNwOVOUPO2RbMaM
	UeHRH9PSgD31eUfIWwtRjUC/3qvwxu3Wd5ImjKpbczOWgcSw868cjExUJn6axBs7pLtUSf
	nI2PknUfuA92H5l8KI5gdBfriQCCrsWW+pFz+l1KMguYCBTTE+ZgV/G68jGwXcFJCrtmdz
	PGmwcn2syJUh1ivzuEfbD8bo8CB4EguP0f8b+x1MoMyYrt0ovmllRs6JmNQdLA==
Date: Wed, 8 May 2024 10:55:05 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370
 netpoll_send_skb+0x1fc/0x20c at boot when netconsole is enabled (kernel
 v6.9-rc5, v6.8.7, sungem, PowerMac G4 DP)
Message-ID: <20240508105505.098efd6c@yea>
In-Reply-To: <20240506181020.292b25f0@kernel.org>
References: <20240428125306.2c3080ef@legion>
	<20240429183630.399859e2@kernel.org>
	<20240505232713.46c03b30@yea>
	<20240506072645.448bc49f@kernel.org>
	<20240507024258.07980f55@yea>
	<20240506181020.292b25f0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: oi1ksroanrx3buqynk4yf9m64a7ii418
X-MBO-RS-ID: 34bc1399a180a3c52e3
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
Cc: netdev@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 May 2024 18:10:20 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> Excellent! Do you want to submit that as an official patch?
> The explanation is that we can't call disable_irq() from atomic
> context (which which netpoll runs). But the callback is no longer
> necessary as we can depend on NAPI to do the polling these days.

I could do that with the explanation you stated. But should any further questions arise in this process I would also lack the technical background to deal with them. ;)

I also noticed a similar #ifdef CONFIG_NET_POLL_CONTROLLER logic shows up in
many network drivers, e.g. net/ethernet/realtek/8139too.c:

#ifdef CONFIG_NET_POLL_CONTROLLER
static void rtl8139_poll_controller(struct net_device *dev);
#endif
[...]
#ifdef CONFIG_NET_POLL_CONTROLLER
/*
 * Polling receive - used by netconsole and other diagnostic tools
 * to allow network i/o with interrupts disabled.
 */
static void rtl8139_poll_controller(struct net_device *dev)
{
        struct rtl8139_private *tp = netdev_priv(dev);
       	const int irq = tp->pci_dev->irq;

       	disable_irq_nosync(irq);
       	rtl8139_interrupt(irq, dev);
       	enable_irq(irq);
}
#endif
[...]
#ifdef CONFIG_NET_POLL_CONTROLLER
       	.ndo_poll_controller    = rtl8139_poll_controller,
#endif


Should it be removed here too? This would be more cards I can test. So far I only see this on my G4 and I think something similar on an old Pentium4 box I no longer have. 
 
> > What I still get with 'modprobe -v dev_addr_lists_test', even with gem_poll_controller() removed is:
> > 
> > [...]
> > KTAP version 1
> > 1..1
> >     KTAP version 1
> >     # Subtest: dev-addr-list-test
> >     # module: dev_addr_lists_test
> >     1..6
> > 
> > ====================================
> > WARNING: kunit_try_catch/1770 still has locks held!
> > 6.9.0-rc6-PMacG4-dirty #5 Tainted: G        W        N
> > ------------------------------------
> > 1 lock held by kunit_try_catch/1770:
> >  #0: c0dbfce4 (rtnl_mutex){....}-{3:3}, at: dev_addr_test_init+0xbc/0xc8 [dev_addr_lists_test]  
> 
> I think that's fixed in net-next.

Ah, good to hear!

Regards,
Erhard F.
