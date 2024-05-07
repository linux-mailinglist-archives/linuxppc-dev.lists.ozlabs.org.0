Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A39148BD8B1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 02:43:53 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=TsCKbXRh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYKK31f6Kz3cSK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 10:43:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=mailbox.org header.i=@mailbox.org header.a=rsa-sha256 header.s=mail20150812 header.b=TsCKbXRh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=mailbox.org (client-ip=80.241.56.152; helo=mout-p-102.mailbox.org; envelope-from=erhard_f@mailbox.org; receiver=lists.ozlabs.org)
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VYKJJ0z55z30TC
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2024 10:43:08 +1000 (AEST)
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4VYKJ504dyz9t2N;
	Tue,  7 May 2024 02:43:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1715042581;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Qugc3EWbGYtRKUN09xjJUP5f1pQJWr0Xe7FT/WIQwVc=;
	b=TsCKbXRhTkqZ6jVcObkvZgn5FOIA36H6pgH+Dz2pSbpDQyi9EmrEW/V4GhbuvyKrvMEzqs
	sc5hX2Rgfc/yNu3nZ4jnlUOK1kSF/Rsw8/u7aLtfez0YvWMrk8ubMIzlYwMXyOyesqR67V
	ckw2qClIyUQxPk6iHVYYobTCHmQnsOzKBwmFPj8hvT3Wy5Id79rJXJnqeDvov07kb/7Esp
	l06Lj0xtOqcKqqpdvx9ZTOUB33pMRZnXnQ6CxuKdFFPVTmTNJ+FLqkwNWTMCrJcLGttfDt
	iX8zqECoWkaX3n52nSfcQllAziQwKabwbCktiFG0Ov7HpLIKGDWbEc9ORB0MJg==
Date: Tue, 7 May 2024 02:42:58 +0200
From: Erhard Furtner <erhard_f@mailbox.org>
To: Jakub Kicinski <kuba@kernel.org>
Subject: Re: WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370
 netpoll_send_skb+0x1fc/0x20c at boot when netconsole is enabled (kernel
 v6.9-rc5, v6.8.7, sungem, PowerMac G4 DP)
Message-ID: <20240507024258.07980f55@yea>
In-Reply-To: <20240506072645.448bc49f@kernel.org>
References: <20240428125306.2c3080ef@legion>
	<20240429183630.399859e2@kernel.org>
	<20240505232713.46c03b30@yea>
	<20240506072645.448bc49f@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-MBO-RS-ID: 266ab782df82e24cac3
X-MBO-RS-META: 69mbq1omn43emzc4fsk6puq9qwqq7rqe
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

On Mon, 6 May 2024 07:26:45 -0700
Jakub Kicinski <kuba@kernel.org> wrote:

> On Sun, 5 May 2024 23:27:13 +0200 Erhard Furtner wrote:
> > > On Sun, 28 Apr 2024 12:53:06 +0200 Erhard Furtner wrote:    
> > > > With netconsole enabled I get this "WARNING: CPU: 1 PID: 1 at
> > > > net/core/netpoll.c:370 netpoll_send_skb+0x1fc/0x20c" and "WARNING:
> > > > CPU: 1 PID: 1 at kernel/locking/irqflag-debug.c:10
> > > > warn_bogus_irq_restore+0x30/0x44" at boot on my PowerMac G4 DP.
> > > > Happens more often than not (6-7 out of 10 times booting):      
> > > 
> > > Could you try with LOCKDEP enabled?
> > > I wonder if irqs_disabled() behaves differently than we expect.    
> > 
> > Ok, after a few tries I got a "BUG: spinlock wrong CPU on CPU#0, swapper/0/1" LOCKDEP hit. But this does not happen every time when I get the netpoll_send WARNING:  
> 
> Oh, can you try deleting the gem_poll_controller() function?
> Unhook it from ndo_poll_controller and remove it completely.

Ok, this is the resulting diff:

diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index 9bd1df8308d2..d3a2fbb14140 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -949,17 +949,6 @@ static irqreturn_t gem_interrupt(int irq, void *dev_id)
        return IRQ_HANDLED;
 }
 
-#ifdef CONFIG_NET_POLL_CONTROLLER
-static void gem_poll_controller(struct net_device *dev)
-{
-       struct gem *gp = netdev_priv(dev);
-
-       disable_irq(gp->pdev->irq);
-       gem_interrupt(gp->pdev->irq, dev);
-       enable_irq(gp->pdev->irq);
-}
-#endif
-
 static void gem_tx_timeout(struct net_device *dev, unsigned int txqueue)
 {
        struct gem *gp = netdev_priv(dev);
@@ -2839,9 +2828,6 @@ static const struct net_device_ops gem_netdev_ops = {
        .ndo_change_mtu         = gem_change_mtu,
        .ndo_validate_addr      = eth_validate_addr,
        .ndo_set_mac_address    = gem_set_mac_address,
-#ifdef CONFIG_NET_POLL_CONTROLLER
-       .ndo_poll_controller    = gem_poll_controller,
-#endif
 };
 
 static int gem_init_one(struct pci_dev *pdev, const struct pci_device_id *ent)


And indeed without gem_poll_controller() I don't hit the "WARNING: CPU: 1 PID: 1 at net/core/netpoll.c:370 netpoll_send_skb+0x1fc/0x20c" and "WARNING: CPU: 1 PID: 1 at kernel/locking/irqflag-debug.c:10 warn_bogus_irq_restore+0x30/0x44" or the according lockdep bug at boot!

Re-booted the machine about 20 times without anything suspicious showing up in the dmesg. With the unpatched kernel I got the WARNING at the 2nd reboot.

What I still get with 'modprobe -v dev_addr_lists_test', even with gem_poll_controller() removed is:

[...]
KTAP version 1
1..1
    KTAP version 1
    # Subtest: dev-addr-list-test
    # module: dev_addr_lists_test
    1..6

====================================
WARNING: kunit_try_catch/1770 still has locks held!
6.9.0-rc6-PMacG4-dirty #5 Tainted: G        W        N
------------------------------------
1 lock held by kunit_try_catch/1770:
 #0: c0dbfce4 (rtnl_mutex){....}-{3:3}, at: dev_addr_test_init+0xbc/0xc8 [dev_addr_lists_test]

stack backtrace:
CPU: 0 PID: 1770 Comm: kunit_try_catch Tainted: G        W        N 6.9.0-rc6-PMacG4-dirty #5
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[f3749ef0] [c07c2bec] dump_stack_lvl+0x80/0xac (unreliable)
[f3749f10] [c004fe64] do_exit+0x5b4/0x834
[f3749f60] [c006d848] kthread_complete_and_exit+0x0/0x28
[f3749f80] [c006d870] kthread+0x0/0xe8
[f3749fa0] [bebf0cf4] kunit_try_catch_run+0x0/0x15c [kunit]
[f3749fc0] [c006d954] kthread+0xe4/0xe8
[f3749ff0] [c0015304] start_kernel_thread+0x10/0x14
    ok 1 dev_addr_test_basic
    ok 2 dev_addr_test_sync_one
    ok 3 dev_addr_test_add_del
    ok 4 dev_addr_test_del_main
    ok 5 dev_addr_test_add_set
    ok 6 dev_addr_test_add_excl
# dev-addr-list-test: pass:6 fail:0 skip:0 total:6
# Totals: pass:6 fail:0 skip:0 total:6
ok 1 dev-addr-list-test
[...]

Regards,
Erhard
