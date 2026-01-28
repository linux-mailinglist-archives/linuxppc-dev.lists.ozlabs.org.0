Return-Path: <linuxppc-dev+bounces-16374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KO3oLh5oemmB5gEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16374-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 20:48:46 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B43DEA8406
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Jan 2026 20:48:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f1Xrn6gnyz2xpg;
	Thu, 29 Jan 2026 06:48:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1769629721;
	cv=none; b=MvM6dGQttucu2AUmGX00eiBeMTdwGc9liZirKcP1cZsdT1vAsW1+Co2nky9cCigD0rbBKVA0Xh3qGUE47kpaLPnh1LUuReRrUzol52J3yoxrwSh7ZDgSgcgif8rBdduPHVg5exfvrnKu/imH3uIw5oCUy8nztSuEnblLL0FS3snAM+EWlPJGakU6krA4qE0BRLGN+7SpbZTR8Bk0kro9xlywH+5GKII/qnaJRUPWOHZcYPCwCQT+IQXivAdQg/kLCEoK1hdCG42DONFcGIzDFaXf0u7GoumvMJ8Pway8BJxv1yw5gczrOGW6g5saIlnjPXSMolPCLM8DcYm/OdFQsw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1769629721; c=relaxed/relaxed;
	bh=bO4OiE9s4X/1tVGOAo8cqovfXU3JC6SxQpIZcWkOg1k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=gkZDKKok3aN9hvMZI655PDNXHqwyforxq6R39vnTGCYvXGeH2f+CqxSVkuJWS1rr2dI+UZmPr8xM2DC8MHTQVujv+fyD/qKHxRL8N1IiN4b2w5G9J0OKQ7bj4KxB5ZkhJxrQPSh75VwuES0Q4rMfnmdx/5etA9alLqQ6d61Ozti4y9rfskx2LeeFBP1AIU7klOwtR7nxrOiOJ/iLDT1OOQ9t0s+dlVqHM+Yc8wQPrUhJxPxkQDwEmRf9ABhSH79P+gAhFOc7vuO64IT/k24id5wRiU2jEZQ9G/ze+J4ITvykyEPezQ/gEtW/GZPllBT8SGYC2caAsIysD6UMct/a2Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hx0jjySL; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Hx0jjySL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f1Xrm1Csnz2xbQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Jan 2026 06:48:40 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1E25542D95;
	Wed, 28 Jan 2026 19:48:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D67C4C4CEF1;
	Wed, 28 Jan 2026 19:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769629717;
	bh=8k2zqY2UBXcb3AiTXacsupFOjChTmeLUTb28Hj18CAU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=Hx0jjySLGN4z+8gLrEhJ4woQo+uDtf80aNCEIuBDjq+vQ4Ny5aELMVf5tKZkrBJ//
	 Rs1EN8Ufzoh+4B/rVDbaae4HaPYUikiBFJEgqeOVA5vBhCZWdPrugN4BBUAX8hKsQ/
	 x6WY6h1DsbW8zdB+BY9w2UhmfpjsI/+OnyfiEFii3Rh14Otl7a37UYGhq5+8iiErwz
	 DAK3t2flUIinGO2J8JQx53z9kMTUfwb/j6p4rLOj6b1wAO7+ZIMQdN2pZE+vxLwyNJ
	 jVFyArNi4gLSLYygsYPTkkezpPt6+xydKt8P9prY81iduqId4UUcZiTkIYJKDBqh/6
	 50thK54RmXKtQ==
Date: Wed, 28 Jan 2026 13:48:35 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: LeoLiu-oc <LeoLiu-oc@zhaoxin.com>
Cc: mahesh@linux.ibm.com, oohall@gmail.com, bhelgaas@google.com,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, CobeChen@zhaoxin.com,
	TonyWWang@zhaoxin.com, ErosZhang@zhaoxin.com,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH] PCI: dpc: Increase pciehp waiting time for DPC recovery
Message-ID: <20260128194835.GA429644@bhelgaas>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3af9f754-d282-485c-a3f2-49a230bfe143@zhaoxin.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.ibm.com,gmail.com,google.com,lists.ozlabs.org,vger.kernel.org,zhaoxin.com,wunner.de];
	TAGGED_FROM(0.00)[bounces-16374-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:LeoLiu-oc@zhaoxin.com,m:mahesh@linux.ibm.com,m:oohall@gmail.com,m:bhelgaas@google.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:CobeChen@zhaoxin.com,m:TonyWWang@zhaoxin.com,m:ErosZhang@zhaoxin.com,m:lukas@wunner.de,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: B43DEA8406
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 06:07:51PM +0800, LeoLiu-oc wrote:
> 在 2026/1/24 4:21, Bjorn Helgaas 写道:
> > [这封邮件来自外部发件人 谨防风险]
> > On Fri, Jan 23, 2026 at 06:40:34PM +0800, LeoLiu-oc wrote:
> >> Commit a97396c6eb13 ("PCI: pciehp: Ignore Link Down/Up caused by DPC")
> >> amended PCIe hotplug to not bring down the slot upon Data Link Layer State
> >> Changed events caused by Downstream Port Containment.
> >>
> >> However, PCIe hotplug (pciehp) waits up to 4 seconds before assuming that
> >> DPC recovery has failed and disabling the slot. This timeout period is
> >> insufficient for some PCIe devices.
> >> For example, the E810 dual-port network card driver needs to take over
> >> 10 seconds to execute its err_detected() callback.
> >> Since this exceeds the maximum wait time allowed for DPC recovery by the
> >> hotplug IRQ threads, a race condition occurs between the hotplug thread and
> >> the dpc_handler() thread.

> > Include the name of the E810 driver so we can easily find the
> > .err_detected() callback in question.  Actually, including the *name*
> > of that callback would be a very direct way of doing this :)

AFAICS there is no ".err_detected()" callback.  I assume you mean the
".error_detected()" callback in struct pci_error_handlers.  Sorry to
be pedantic, but it makes things a lot harder to review if we don't
refer to the actual names in the code.

And my guess is that E810 means the Intel E810 NIC, probably claimed
by the "ice" driver, which would mean ice_pci_err_detected() is the
callback in question?

> > I guess the problem this fixes is that there was a PCIe error that
> > triggered DPC, and the E810 .err_detected() works but takes longer
> > than expected, which results in pciehp disabling the slot when it
> > doesn't need to?  So the user basically sees a dead E810 device?
>
> Yes, this patch is to solve this problem.
> 
> > It seems unfortunate that we have this dependency on the time allowed
> > for .err_detected() to execute.  It's nice if adding arbitrary delay
> > doesn't break things, but maybe we can't always achieve that.
> > 
> I think this is a feasible solution. For some PCIE devices, executing
> the .err_detect() within 4 seconds will not have any impact, for a few
> PCIE devices, it might increase the execution time of pciehp_ist().
> Without this patch, PCIE devices may not be usable and could even cause
> more serious errors, such as a kernel panic. For example, the following
> log is encountered in hardware testing:
> 
> list_del corruption, ffff8881418b79e8->next is LIST_POISON1
> (dead000000000100)
> ------------[ cut here ]------------
> kernel BUG at lib/list_debug.c:56!
> invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> ...
> Kernel panic - not syncing: Fatal exception

This is an interesting panic and looks like it might have been hard to
debug.

Do you have any idea what exactly caused this and how it's related to
the timeout in pci_dpc_recovered()?  Is there a race where pciehp
disables the slot and removes the driver, but eventually
ice_pci_err_detected() completes and we're running some ice driver
code while it's being removed or something?

Simply increasing the timeout doesn't feel like a very robust way of
solving the problem.  What happens when some other device needs 17
seconds?

But if increasing the timeout is the best we can do, maybe a warning
message in pci_dpc_recovered() when we time out would at least be a
hint that we might be heading for trouble?

> > I see that pci_dpc_recovered() is called from pciehp_ist().  Are we
> > prepared for long delays there?
>
> This patch may affect the hotplug IRQ threads execution time triggered
> by DPC, but it has no effect for normal HotPlug operation, e.g.
> Attention Button Pressed or Power Fault Detected. If you have better
> modification suggestions, I will update to the next version.

> >> +++ b/drivers/pci/pcie/dpc.c
> >> @@ -121,7 +121,7 @@ bool pci_dpc_recovered(struct pci_dev *pdev)
> >>        * but reports indicate that DPC completes within 4 seconds.
> >>        */
> >>       wait_event_timeout(dpc_completed_waitqueue, dpc_completed(pdev),
> >> -                        msecs_to_jiffies(4000));
> >> +                        msecs_to_jiffies(16000));

