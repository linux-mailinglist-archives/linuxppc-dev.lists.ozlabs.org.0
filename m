Return-Path: <linuxppc-dev+bounces-17403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4OcfDvPJoWmqwQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17403-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 17:44:35 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 404601BAF3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 17:44:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMvLR3SNvz30Sv;
	Sat, 28 Feb 2026 03:44:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772210671;
	cv=none; b=Xoh9/EfyMlZJXdFH9RexOmwwwLATXpsWIMLIC8F1bF8F8csqzBl/wcPcD98hbhWe3I3aAtT7x0D3qxWmnm33zEllHO6cPJRmYL6Sf3T5IDsO/sE+5TsMAPx5QDhUDmQB72MjRPSE5CTeILyAEwHE+R80Bvcn//TiLtb/fAe5f5TG4jEc8yHPQN2WTc0v0U5CGg1pg6xcGGasdDRmYTaIAdkjotwMY9vIgmUDOm63ljdQfhW8P5OJ2ciq/AcdPHYWaxKHBBW1D7FCnb3ImM7i6UdFgINcC9UWqnLwQGHAVmpExAgKXrt0EMKKOIVvtcS9vOgOY96IqKuOy5pqZES+uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772210671; c=relaxed/relaxed;
	bh=0y0Q564NDXssu98DTUs518DkrCpqc54lSIZsuCwuETs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=Di+XJHG6iUz9fTGSfeDWL0ZxQ0cm/UYH4rqctP21kycosd4qa7wbA5CoaIpJ/YOaonZGgaB/xQg05tnAzlEKOQ6V28i+yHrng8HBlZbCcF1jfGhptFK2KDgw2uPflWgEKHJOLIf+fPppSSd7Wb74SKIys1KnyImTt34aIvldsmje3yb+Lw/dNRXj/4Q3Bt40yOWqNtdQoxew0nMuyULPY1svdrZbvm7KEMm6b5Wj+pjHY8VXwRJzqstauI8PWc+ghXHVI3sNrS7nXDpb/UWFjtCsA0s3uT1oVod2/ttJjq3ktFzZbNO1rkmdRKxESHUp2RJmd3WO5SNQ5Ot/p1sTaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfcyS/nf; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=MfcyS/nf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMvLQ6K0Jz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 03:44:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B851E438FE;
	Fri, 27 Feb 2026 16:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DB08C19423;
	Fri, 27 Feb 2026 16:44:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210668;
	bh=xEv7MiSgAutCAQPuAB/UPxkGdAyG7iqnARAOD3aXtMs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=MfcyS/nfYFdd+s763JqDqyw62GRaDDVUV08SyoeW4+f5+86NgmRNeY6xlMPGdWiFq
	 bvsCQpZPtByl0kHoYl6T7DLHLWe0xt8FlS9u7Opa+88SesnH2oaG5ijH3okdeQA+uV
	 IK5qojL4FjuodmKaxkK1i868FP7fQxe9lt+GPe1T/U7CBT0gmgFoHX9rNU9WU+DEdd
	 +LcTflBkLQs1X6PRb7V4bWZlgWiTXASdfIdXxZ1hznJ00xY70wF9bkNQSmXlcwnjTj
	 TSkIGZga0zBn99S4AAusw9Uhmw2iLjZIl9wVaJ7iQwCkDREckw1vlj5wcD2kpOLMlm
	 AUhCNpVQ6RIaw==
Date: Fri, 27 Feb 2026 10:44:27 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nilay Shroff <nilay@linux.ibm.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	sparclinux@vger.kernel.org, wangruikang@iscas.ac.cn,
	tglx@kernel.org, npiggin@gmail.com, chleroy@kernel.org,
	gjoyce@ibm.com
Subject: Re: [PATCHv2 0/2] pci: fix msi_addr_mask on powerpc and sparc systems
Message-ID: <20260227164427.GA3897611@bhelgaas>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-17403-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:nilay@linux.ibm.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:davem@davemloft.net,m:andreas@gaisler.com,m:glaubitz@physik.fu-berlin.de,m:linuxppc-dev@lists.ozlabs.org,m:linux-pci@vger.kernel.org,m:sparclinux@vger.kernel.org,m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:npiggin@gmail.com,m:chleroy@kernel.org,m:gjoyce@ibm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[lists.ozlabs.org,vger.kernel.org,iscas.ac.cn,kernel.org,gmail.com,ibm.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 404601BAF3D
X-Rspamd-Action: no action

[cc->to powerpc, sparc maintainers for ack]

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

These fix regressions on powerpc and sparc caused by 386ced19e9a3
("PCI/MSI: Convert the boolean no_64bit_msi flag to a DMA address
mask").

These fixes have been tested by Han Gao (SPARC Enterprise T5220),
Nathaniel Roach (SPARC T5-2), and Venkat Rao Bagalkote (IBM Power
System LPAR (pseries)).

It'd be great to have acks from the powerpc and sparc folks so they
could be merged either by Thomas (who merged 386ced19e9a3) or me (via
PCI tree).

Bjorn

