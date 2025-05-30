Return-Path: <linuxppc-dev+bounces-9031-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B2C4AC8CFF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 13:34:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b81NL1Rtsz2xKN;
	Fri, 30 May 2025 21:34:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748604850;
	cv=none; b=K2JYBIw7V123WfW8VUC6LBxm/NXpy/OIxhC6RhacqBVpbtFavL3t3TEruSfFSEhw0aGqFoD1iMEG6OSI+hajBC61CZy004T4kZ4sjJBc24k/dqakhk0jA/nOFNOgSMe3HRUVi6lV4MpPEiYH5pqmRM+cs1D7t4ZI9x6SkeFwA5QMlMdL35Im6O7Yh2EgKRQHZvgfNtBn3z4TmRlssgWz2FLnkMFc5kSEAaFBEaHh7mEyQNtaS8Od+idqgyOXgJ8G3waiPP5X6WvwHUFvKtnQJbchouaPYrbXQ5EsnkkKTkbFeL9KGLnP3N62L1Gh8ry8OS2y9XuntETEWVRAv23LSg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748604850; c=relaxed/relaxed;
	bh=ateecOD9DENiqgs/aWq8uC5N5otsFqrc9qX+HH9ylUU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=DfpctXTvaL0ZZzbI4+qDUuYjVr88D1ob9CCsDuupxVbOOeA1aj/N+tyeBBZbNaz2Gk3xyR26i+nEl9AI3S1XxxlPToO0JWwfddfraA99cc7hoeBqHrZT9yXKai+PNaHkgf7iD3Cc01kjbvjrTl/Wt9aGkpZ2OWd9E4IR9uSXLtdgR8Y39DzuVaHfwQw3dLDQABcNj1AnEL63I0c3FxswkDijrnBE4ddDjnLP2mxwp6LSrMdSudu9ViVYyE3qIBoCNxssSje7PLBtlNRslEVGA8HaoCqNZforu4iRdcccb02clzzdd0iXh724a7nQJEYnlUXgrfw8JA1UhGkY6hp14Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OTDUWXrj; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OTDUWXrj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=helgaas@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b81NK0K9Lz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 21:34:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F8B8629E8;
	Fri, 30 May 2025 11:34:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FBFC4CEEA;
	Fri, 30 May 2025 11:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748604845;
	bh=zOCveCCe34VEq6t903fuoOoYk3Yyf1DbV6pHAyiwueA=;
	h=Date:From:To:Cc:Subject:In-Reply-To:From;
	b=OTDUWXrjxfeL26hXG9wadvD1pP1t5Am6DLw7haCwKURsI+4B5n6IycmwhLGLQe5Sv
	 9KmXAAyWbIly/941Sez2E434xCskAbE7ZYjV9umZFMwiMWfYKIG3sRvkmjdc0mARJt
	 mAMTBIojb+efjIKDwYcmiOzdsKC6Cir2QuK9ZxDO0tn1e4xN4pB6xzKXBK6w99IJQV
	 Rd6YiSPc9pbxBZEyIpIpKNq5Q3puB2waXHLRwKK75CdfQ8up39wiyyrlrPK1Vd2vgN
	 iupwJIHfDQ4nmJ5vrtnzz9tjpyRPpDPxhFKBcT05AKkcMGg/sT+liHrJ9aU0ac+Ot+
	 fhX43O5Jq4ySA==
Date: Fri, 30 May 2025 06:34:04 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>,
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marc Zyngier <maz@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>, dingwei@marvell.com,
	cassel@kernel.org, Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <20250530113404.GA138859@bhelgaas>
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
In-Reply-To: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > cannot be done in a generic way as link recovery procedure is specific to
> > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > called by the host bridge drivers when the link goes down.
> > > 
> > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > execution of the AER Fatal error handling code. Since the link down
> > > recovery is pretty much the same as AER Fatal error handling,
> > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > callback will be triggered for the bridge and the downstream devices. Then,
> > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > resume message will be broadcasted to the bridge and the downstream devices
> > > indicating successful link recovery.
> > 
> > Link down is an event for a single Root Port.  Why would we iterate
> > through all the Root Ports if the link went down for one of them?
> 
> Because on the reference platform (Qcom), link down notification is
> not per-port, but per controller. So that's why we are iterating
> through all ports.  The callback is supposed to identify the ports
> that triggered the link down event and recover them.

Maybe I'm missing something.  Which callback identifies the port(s)
that triggered the link down event?  I see that
pci_host_handle_link_down() is called by
rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
but I don't see the logic that identifies a particular Root Port.

Per-controller notification of per-port events is a controller
deficiency, not something inherent to PCIe.  I don't think we should
build common infrastructure that resets all the Root Ports just
because one of them had an issue.

I think pci_host_handle_link_down() should take a Root Port, not a
host bridge, and the controller driver should figure out which port
needs to be recovered, or the controller driver can have its own loop
to recover all of them if it can't figure out which one needs it.

Bjorn

