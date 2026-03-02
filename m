Return-Path: <linuxppc-dev+bounces-17552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHV0BFQYpmkCKQAAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17552-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 00:08:04 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 443961E6529
	for <lists+linuxppc-dev@lfdr.de>; Tue, 03 Mar 2026 00:08:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fPvjV4CT6z3blr;
	Tue, 03 Mar 2026 10:07:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772492878;
	cv=none; b=LuKlzc/U/YXwl7N5BlkHUScDButh1RsJBCci04N3y/AuCDW8aK61Oqa0bFX4oE+Bsb4pDMm9wU/zAkB/CXfBd5HxCZateFRQxFkG/cyXFwLfx0LWkFb2vEFUB/YG1Po/g1FsHxEH/rMLeSf8JKA94mS9yHA+WdBJCOOi8XaPGuV88irUqIEMTf1uIvDBYrYJZv3ma3g++oAkzMdfRvk9vLFL3IvEZgr35a6mQFUE4osd5N4lgrt4Yk8zWkj/6kvbbeNFnGNr2UsKUf1gVd14GHRyx478L3OhtXjsMZ3vf/ZWj39NoqGoYFlsLz2P6E6elEngWUraOdO1w3gnD+nP3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772492878; c=relaxed/relaxed;
	bh=Zhd5/OulCnZqvzBJu9TVGp3ZIWgH85DzOCh6vSf611o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=hzr1LKK0esXJs2yuf0ApsKpZZKOCxdv/UwUFfbc1FqTyrmiZRBm4xp71HLafbHeI05APHrdmdIqrpnjG4W22rhFnUUBdI1OzIqJPoFXdxYwySY25aQUPsX+6OGjEWT05yD2ay+T0Y0+pqk4tmefvaA58JSp7nBjZczkODSeT7at1XIVzKioYH9rKvCbVYfsOdKeo7h/B/LMzDwCTddMA5eCSf0a/HcuCIfPfvvf3H9VXECtbxNGRmRjT+eF1sul9TTn8CQMISXyA2M0xQIs+3L/1xCNth3q0E06gXM4UKgU6ZLz478k/+wqiy5H5k3bVNxufAHuJIm24nqaduIEhmA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ojWXYkOY; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ojWXYkOY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fPvjT2dGkz30Lw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Mar 2026 10:07:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B9DE760126;
	Mon,  2 Mar 2026 23:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D773C19423;
	Mon,  2 Mar 2026 23:07:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772492874;
	bh=nzWc5hLi+XmBuDD+BGsrmDcYrcD7xRFj1OgmUPYza+Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=ojWXYkOYIKhn66nudcCk8Y/GU6W3TuYnBtpvFJsKP2MnMtUbhRvAyX1WWGXRHTlkg
	 dj0a58+jJyhag958yoJSG5aBih25/HAQPYB/SWsBk7+1gBf4tNcMwW2IF/f0WKZVrH
	 FmsmboQmUEc+jI5i3NKgdLX84p5QHExSeRJMGYU+7j/vjoATBqnJUAqekrzVElXPL5
	 TfKX6Kc2DTA72Qs3MkYquLMNDmXvsndf0lmdAuV9mI36OQi8nOGT/zhzwskVfQPCCV
	 xMRliO/w+Ea1EfUpIflOIigUDCXaBQRapBeDWEv7f2hCpVmP5cp9vQzuiBQsi3HHWE
	 N3scqRm5dCqDg==
Date: Mon, 2 Mar 2026 17:07:53 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nilay Shroff <nilay@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org, wangruikang@iscas.ac.cn,
	tglx@kernel.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
	npiggin@gmail.com, chleroy@kernel.org, gjoyce@ibm.com,
	davem@davemloft.net, andreas@gaisler.com,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Han Gao <gaohan@iscas.ac.cn>,
	Nathaniel Roach <nroach44@nroach44.id.au>,
	Venkat <venkat88@linux.ibm.com>, Nam Cao <namcao@linutronix.de>
Subject: Re: [PATCHv2 0/2] pci: fix msi_addr_mask on powerpc and sparc systems
Message-ID: <20260302230753.GA4034944@bhelgaas>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220070239.1693303-1-nilay@linux.ibm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Queue-Id: 443961E6529
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
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17552-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nilay@linux.ibm.com,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:sparclinux@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:glaubitz@physik.fu-berlin.de,m:gaohan@iscas.ac.cn,m:nroach44@nroach44.id.au,m:venkat88@linux.ibm.com,m:namcao@linutronix.de,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,iscas.ac.cn,kernel.org,linux.ibm.com,ellerman.id.au,gmail.com,ibm.com,davemloft.net,gaisler.com,physik.fu-berlin.de,nroach44.id.au,linutronix.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.991];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

On Fri, Feb 20, 2026 at 12:32:26PM +0530, Nilay Shroff wrote:
> Hi,
> 
> Recent changes [1] which replaced pci_dev::no_64bit_msi with pci_dev::
> msi_addr_mask inadvertently missed to initialize the pci_dev::msi_addr_mask
> to the DMA_BIT_MASK(64) on powerpc platform. Due to this, later the 
> validation the programmed MSI address against the msi_addr_mask fails.
> This causes pci device probe method failures on powerpc platform. We also
> realized that similar issue could potentially happen on sparc system as
> well. So this series initializes pci_dev::msi_addr_mask to DMA_BIT_MASK(64)
> when pci_dev is instantiated for both powerpc and sparc platforms.
> 
> The first patch in the series fixes this on powerpc platform. The second
> patch fixes this issue on sparc platform. Please note that as I don't have
> access to the sparc platform, this patch was only compile tested on the
> sparc system. Anyone from the community is welcome to test it who has
> access to the sparc machine.
> 
> [1] https://lore.kernel.org/all/20260129-pci-msi-addr-mask-v4-0-70da998f2750@iscas.ac.cn/
> 
> Changes since v1:
>   - Initialize the pci_dev:msi_addr_mask on sparc platform (Vivian Wang)
>   - Some minor cosmetic fixes (Bjorn Helgaas)
> 
> Nilay Shroff (2):
>   powerpc/pci: Initialize msi_addr_mask for OF-created PCI devices
>   sparc/pci: Initialize msi_addr_mask for OF-created PCI devices
> 
>  arch/powerpc/kernel/pci_of_scan.c | 7 +++++++
>  arch/sparc/kernel/pci.c           | 7 +++++++
>  2 files changed, 14 insertions(+)

I applied both of these to pci/for-linus for v7.0 since they fix
regressions.

Thanks to Han and Nathaniel for testing on sparc and Venkat and Nam
for testing on powerpc.

Let me know if you have issues with these or prefer to merge via
another tree; I'll be happy to drop.

Bjorn

