Return-Path: <linuxppc-dev+bounces-17404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ukS+CBrLoWnYwQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17404-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 17:49:30 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 070691BAFE2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 17:49:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMvS41MwDz30Sv;
	Sat, 28 Feb 2026 03:49:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772210964;
	cv=none; b=FSaAb7j29eBbPaC3iFuLS2/eq5URY/gLAYeB51n6dPcUXut9zM2vaUtMJYU48QJo7916Na0MlGDmHC8RSOxbN/HnyxPFqOsOx6T4hG/EFSta9Z3f9BtdiIqSJuPTKXOkJuvsVQU6Az5OuPQvKwDxf7DZ7g7qWrFxHd8s0Xi/iyFJG5atdDBwJt1iWsr7RqUYTIABn+DL2H1Ozo+ZQRavYlYmH+Y646vIqwrjym62MclUYY30Mjly7UAwIa1gEYqdt2rY7mAgFVZ7tMuWzLmQWm8jrrZrXWykNLHGVpHxulImC3TKjQiPYbJAc4dv1ptxYQk1xlKqf9JnXuapENLZ4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772210964; c=relaxed/relaxed;
	bh=2cN4bzTtx9EFFY7kBEaMOSYHOz0z1pLi1iFqWIjUpZA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=HF8DU7FYt3EOlCkW3OPBAJLXT29N7+sfUjbbd6bfYqpMPxtVcnpK9I3jj1Mh4dtIXhVV5jXVcf5jGPTQ5KJR4TzH8FL7Bnun/8a58PdRqdM0D2MHcUn9bWyZygB8rV/9j7GAugSv64QGDiIfSTld0ub+o7HMjU55O/4i2N+L+yWz9cDqdzmZnFmaZnO+pYOJGMHC6n/hWDa0rNvMoPSaNzwA7luNicGvdj72VT9Pd+LotdG6bNtyJcbHcUCJ9H1lLjLkTFcJvevNJGmKX4f3o506jlrOYQB+Lw+fhjIKzs/CfFh2MP481SGHMumDXMlmKk23zdceRTjekBQZRu71/Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BMGK66Il; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BMGK66Il;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMvS32fT1z2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 03:49:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 269B9444D5;
	Fri, 27 Feb 2026 16:49:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3011C116C6;
	Fri, 27 Feb 2026 16:49:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772210961;
	bh=jznU9LDSkQYILvcSIV46IxA3CrI9OTrcodpcP2KE/Rk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=BMGK66IlpUYHanCwORkjV1r5gD4tZdmf3FdgQyvpYqd87OnPE/XYM3XTkW4Ksw/Y2
	 Y3jxv1rvP5tPMlEvJt5tjaSTDHFbZ6E0cmQiJ4sJ1nQ4Fa0ouKncl5VoVtiCuVxIzZ
	 wWKIJt52O1sSUx08jbmlf8//snPIjiC+zltv0lkdOUs2BhGHuFA3bE4uAUcyVVBSxy
	 qaQx337ysm56rZiMRyNkrrziyLzOmk1FheLkVIlnP9JOrOh9Vg2yq723loCPFce4ld
	 PQ+fWhfMBe0FBUqcD3yCDZF4bHUCb4tFZLXFqqmmZy1DAO7HVlmZIQO39PRRlHaFGU
	 +2b9qvGprKjDg==
Date: Fri, 27 Feb 2026 10:49:19 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vivian Wang <wangruikang@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Mark Bloch <mbloch@nvidia.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alex Deucher <alexander.deucher@amd.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Brett Creeley <brett.creeley@amd.com>, Han Gao <gaohan@iscas.ac.cn>,
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	netdev@vger.kernel.org, linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev, Takashi Iwai <tiwai@suse.de>,
	Maor Gottlieb <maorg@nvidia.com>
Subject: Re: [PATCH v4 1/4] PCI/MSI: Conservatively generalize no_64bit_msi
 into msi_addr_mask
Message-ID: <20260227164919.GA3897300@bhelgaas>
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
In-Reply-To: <c9329ae2-721d-4127-9380-b1ea454bd8f2@iscas.ac.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.21 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17404-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:wangruikang@iscas.ac.cn,m:tglx@kernel.org,m:mbloch@nvidia.com,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:alexander.deucher@amd.com,m:christian.koenig@amd.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:andrew+netdev@lunn.ch,m:davem@davemloft.net,m:edumazet@google.com,m:kuba@kernel.org,m:pabeni@redhat.com,m:bhelgaas@google.com,m:perex@perex.cz,m:tiwai@suse.com,m:brett.creeley@amd.com,m:gaohan@iscas.ac.cn,m:linuxppc-dev@lists.ozlabs.org,m:linux-kernel@vger.kernel.org,m:amd-gfx@lists.freedesktop.org,m:dri-devel@lists.freedesktop.org,m:netdev@vger.kernel.org,m:linux-pci@vger.kernel.org,m:linux-sound@vger.kernel.org,m:linux-riscv@lists.infradead.org,m:sophgo@lists.linux.dev,m:tiwai@suse.de,m:maorg@nvidia.com,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[32];
	FORGED_SENDER(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[nvidia.com,linux.ibm.com,ellerman.id.au,gmail.com,kernel.org,amd.com,ffwll.ch,lunn.ch,davemloft.net,google.com,redhat.com,perex.cz,suse.com,iscas.ac.cn,lists.ozlabs.org,vger.kernel.org,lists.freedesktop.org,lists.infradead.org,lists.linux.dev,suse.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev,netdev];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 070691BAFE2
X-Rspamd-Action: no action

On Fri, Feb 27, 2026 at 01:25:03PM +0800, Vivian Wang wrote:
> On 2/27/26 02:25, Mark Bloch wrote:
> > On 29/01/2026 3:56, Vivian Wang wrote:
> >> Some PCI devices have PCI_MSI_FLAGS_64BIT in the MSI capability, but
> >> implement less than 64 address bits. This breaks on platforms where such
> >> a device is assigned an MSI address higher than what's reachable.
> >>
> >> Currently, the no_64bit_msi bit is set for these devices, meaning that
> >> only 32-bit MSI addresses are allowed for them. However, on some
> >> platforms the MSI doorbell address is above the 32-bit limit but within
> >> the addressable range of the device.
> >>
> >> As a first step to enabling MSI on those combinations of devices and
> >> platforms, conservatively generalize the single-bit flag no_64bit_msi
> >> into msi_addr_mask. (The name msi_addr_mask is chosen to avoid confusion
> >> with msi_mask.)
> >>
> >> The translation is essentially:
> >>
> >> - no_64bit_msi = 1    ->    msi_addr_mask = DMA_BIT_MASK(32)
> >> - no_64bit_msi = 0    ->    msi_addr_mask = DMA_BIT_MASK(64)
> >> - if (no_64bit_msi)   ->    if (msi_addr_mask < DMA_BIT_MASK(64))
> >>
> > Hey Vivian,
> >
> > We are seeing issues while reloading mlx5 on a PPC64 platform.
> 
> Mea culpa. There's a fix on the list [1] since last Friday. I'm not sure
> why it hasn't moved yet, but please take a look.
> 
> [1]: https://lore.kernel.org/all/20260220070239.1693303-1-nilay@linux.ibm.com/

We needed testing on powerpc and sparc, which has now been done,
thanks to Han Gao (SPARC Enterprise T5220), Nathaniel Roach (SPARC
T5-2), and Venkat Rao Bagalkote (IBM Power System LPAR (pseries)).

It would be ideal to have acks from the powerpc and sparc maintainers,
so I just solicited those.

Thomas merged 386ced19e9a3 ("PCI/MSI: Convert the boolean no_64bit_msi
flag to a DMA address mask"), and could merge the fixes.  Otherwise I
can merge via PCI.

Bjorn

