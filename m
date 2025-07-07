Return-Path: <linuxppc-dev+bounces-10146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AE55AFB242
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jul 2025 13:29:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bbMTS2MVWz30W5;
	Mon,  7 Jul 2025 21:29:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751887772;
	cv=none; b=dnNIHzcJ5gYhausohAGZCi09wS+aoYfhq85O7q8pSB7KY76oXincwZ62taZMueMsEMqPF4Vm3lfMgsWthYzLGUPOpPYUAhiA3dTsrwOhD8VEj9rLzF8uqfrpnIGGE/qTLi8hQpD9ARB7bOYrNOnfVjXa0gUfs6MqExZyfh/VnIV6OshxmyjbYuRgDndJFIyO5ZqwktOoUgLeHDuiqyAkx9LspVmUlAKDWFoWcJwzJ7nBX8H5rBCwbMM3Faz9n2KxxkIIyW7PRX2kyGEyX31bJwIHT73B83IrYVkivdzcYyI9BFndlWm283jkyDpYKBaQ4DGNO1Dvxpf9cqEtcIXetg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751887772; c=relaxed/relaxed;
	bh=EsfHI0Bbse/F6dgnNQP7Uv/3935LWj8bh0rxNiYRUk8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4Uf0pIMfWZzptjWlJvVqG301MyoK7Mtz51nHV+JXNm/KSFsvkAYhe05BnJ5v3p85Gw4kX7loz2ej0XHVSZceJ7l/hsU4hku7WK2hvgLACQfdXcKHugPV7xgsFU+PnX/JAg9aLsFoepYpritSk/eeQMAsT0LNjtM7MP7VG3x9v/5anCGKIGu69xoqvtDg7xANeLjgcBXEqCHG72gJGE0YyrYzdmSdI1RtvkIj0noeNrKZbqDw+WnC2JymX2EZmNLPu0uj4PrGNmSOFdtI7Mmq8JRdZIMrH/40PETLqWkQjX1lj9zm3yTJCmf9sk/coIWIq7+6ucTFrlwpw8AAudJBQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nzQ9mSTl; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nzQ9mSTl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=cassel@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bbMTR4PzTz30TG
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jul 2025 21:29:31 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98AAA46259;
	Mon,  7 Jul 2025 11:29:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4ADBC4CEE3;
	Mon,  7 Jul 2025 11:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751887769;
	bh=pvrgPbujdZyNCnqS0MoPZy4z92NtoD/434IVrBGaRNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzQ9mSTlqbjPryIzU8C3XJ2bHMoEKQ4PGiXh5kPvsK61snx3Ko7sg4bDQvAmsjNyn
	 VjBlyc7OVsGY2nwbPevisTcnOZK72lB3PDlNakMUad5FcfmPBbVvdvDypLIGh5uRc9
	 Q0bIaDP6yBFVAoBnE5RPw0SrJ4O16orY4aRAURr38XAqFX3GWO0SokyG/y9LHLARxi
	 hG7GbGWrC4zCJmvhUjqO8RheFBQ9GYnPogZwKq6XTG1kRXJ0oXeWcwj/OUXhvcw5+i
	 eI4LdHoFj/fSjCgPFR2upUo2YoxS57r/w2/C75umpqC6zf9X7F5LaM4bg7gRmYrh9F
	 /minS3KOUu35Q==
Date: Mon, 7 Jul 2025 13:29:22 +0200
From: Niklas Cassel <cassel@kernel.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Bjorn Helgaas <helgaas@kernel.org>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
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
	Lukas Wunner <lukas@wunner.de>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <aGuvkkeVkezGJWXn@ryzen>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
 <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
 <aGuqA92VDLK8eRY1@ryzen>
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
In-Reply-To: <aGuqA92VDLK8eRY1@ryzen>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

+ Mani's kernel.org email.

On Mon, Jul 07, 2025 at 01:05:39PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Fri, May 30, 2025 at 09:39:28PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> > 
> > > I think pci_host_handle_link_down() should take a Root Port, not a
> > > host bridge, and the controller driver should figure out which port
> > > needs to be recovered, or the controller driver can have its own loop
> > > to recover all of them if it can't figure out which one needs it.
> > > 
> > 
> > This should also work. Feel free to drop the relevant commits for v6.16, I can
> > resubmit them (including dw-rockchip after -rc1).
> 
> What is the current status of this?
> 
> I assume that there is not much time left before 6.17 cut-off.
> 
> 
> Kind regards,
> Niklas

