Return-Path: <linuxppc-dev+bounces-9043-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F2E2AC930D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 18:09:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b87VG6CNfz2xPc;
	Sat, 31 May 2025 02:09:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::629"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748621382;
	cv=none; b=RCjTLb4BdTsVTHQhgsaQhL8zmB7NBBfiE16AoJnUujKgeYPIyDQrrnW12uxC5Ojg+MfttdF79/vRyb9vEPtwECKV104fxM+DCHwt7snqqbMR7+FckfqSR8qwq/27FRXL5V5b9KI5ymiPCZZBpwukXf036kDbytfLrqYh3iuKWZseMniDGNUul4kK+fISzsPDb8ECW1vF61EZ1tB/zVhvm0xHi10UyO0/0s/LYrKM9OMof1OfSEW7u+/7np6HNyo6V3B+IChK1XIhOTwVWaC1TJ61/WPVtuEFLge8sm2c2tVnfBgQdWE3ljpLK8/qLwRv8kqbWxEFuBTzQS3/9lrfyw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748621382; c=relaxed/relaxed;
	bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PbvYKOWyar0r6LHmx/rPjaYWbFimKGnSoLAP+Xt+fvBmymRStlYK7VMIvfbW0Ps1VoynGG5ex2GEREY6XMPfWzc2H20f+bDuaf+WimLcel8VXx8rR1dvnz4pnZv4F8Q672NeCmbDEdDkjeqGXMN8ycgZK5q81JBWm9+1ANP7SSDrtct2BufUUZzr8LN0EC2885+psXTcdGBd2OQTYCtLjQoBZEgVPatRUpH4Ds2S8jpfA8QjohMIm+QoHPrCfAgZtEfnbZxhYLkh7+FU09Xsi0s0TPRwrQEEbivKZBL/jvR1OBjZmaUHBj/r3KyNn6B3mxVPn94rB+LxP194Lr5m6Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MnLyMCCr; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=MnLyMCCr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::629; helo=mail-pl1-x629.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b87VF511lz2xC3
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 31 May 2025 02:09:40 +1000 (AEST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-23526264386so12225315ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 09:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748621378; x=1749226178; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=MnLyMCCrHnYpcFY1/jj1t3cg4G+xZ8ejxj9bpm9k78QbSDgN75EHRlKG8jSqIfM0Pf
         VZUQ7GtkfrDTfoK7Fwf+LvzegCf3ABXgehAtDpjdoo+ut4Ig9u8c8EJUh56z+Gc0xxF/
         Sm3M8tOd9B5gd4pm1urWPDdMSbWv1YPUTa5P8ykb43PM/SeU0hZnKmaPsaPZCQ5WpTVm
         Yu9//aZiUu18f4ry3JzqR0thrl3Ij/VkDowMYHKpfhnoUaQdZmTz0XLEKyQuPCBBl4Ri
         nbg/NBLYoC+ACfzz9hipH2rpYSOHEjmj0NVDs+xb2GmOnCJ13QkIGm4LpgJnZFnTGQQB
         2+IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748621378; x=1749226178;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxxufLK3KekEdbbP35QTahMDHa855MkqcMEQ8g1zMTk=;
        b=mUxIRCE7iGVa0E9gJkX6wdaEMLof+z+GhEwLwoTJRUPJNWliEINV6NdljHlYWfRYNS
         1GXiXkz7KQamBjEPKHTsu3XZPvNCGSri+vrr96i45MoL/w30VNvt30NuC9guLSKNmsbH
         xM5QnUtlTxLbpb28x+zzhadIzwDYRKEZfdX0j/8XUyilZpn/Jfztj9zXTbYjuuZ05sKH
         2e5iHqTe6O5rdgK9yL3fpNZfGmbciCocSo4k9OBZNNHQwbcvuDamomaKgAHwc1Bf78Xo
         9ZbtFm2v0399FKd6bE5cBIbTwGt++gLGidXwX/vfqAGfN5BxNFoO3jEApopG7tTfxy+r
         ywyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXTOM40pytShJO3izbRVTlcOXeJcIUasTjmCEq0qZl4iVppttpEZdr2a7PixROdIxrXOPf0h0/T7ZDtVnM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy7TlGAQki6VrgaGhbiyQ6elxwHUjKSoG1tDiKU0G5K/9X3iDlc
	aWPa27n2IF85LncDdxwfBZ/njgUdRbDVvt9VtN3Mm22M3jaRPg2LQkZTHb7+XjZ39A==
X-Gm-Gg: ASbGncuY53RiDdfWjWsYWQJmpeQnPUMQ5qp1ZCppQ9pDlpXvdxJPGwhWV9MWEG+Np5i
	dB+TKDn4VmycOFCC/x/1WvFgN0WXN+6ig7i22igNjp49LC9jckX8WxTwYJ2/LHP0+T3bR6n1Vtv
	WunJsJQ0eVl17OnQdEksbCpmtvpU/851zXmU3GglCKT+4a0if5pUQV6XsfSk9G6BIAwp66i462S
	0uHxyhdlnXatqrxNZ6J0iT5JC6dVFvF+WtectcFDT2PS2sBarQ2T4gnaujjZFTqAndCcJBiQZkK
	cDexzKDG0Z57J5ChfpuF6j4Ng/Ao5B968Ojkk46RhoYvo5VBsAOy9aKNKltINg==
X-Google-Smtp-Source: AGHT+IEaQI64EZVaM9JygVJu/CqqQgOOBJm+b8JHY4a69IBYYuuTYL7zefQI+S32XWNK9lzdgNMIBQ==
X-Received: by 2002:a17:903:291:b0:234:b44c:d3c8 with SMTP id d9443c01a7336-23529a28ab7mr65505535ad.37.1748621377852;
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd9478sm30412095ad.77.2025.05.30.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 09:09:37 -0700 (PDT)
Date: Fri, 30 May 2025 21:39:28 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, cassel@kernel.org, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 4/5] PCI: host-common: Add link down handling for host
 bridges
Message-ID: <bixtbu7hzs5rwrgj22ff53souxvpd7vqysktpcnxvd66jrsizf@pelid4rjhips>
References: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
 <20250530113404.GA138859@bhelgaas>
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
In-Reply-To: <20250530113404.GA138859@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 30, 2025 at 06:34:04AM -0500, Bjorn Helgaas wrote:
> On Fri, May 30, 2025 at 09:16:59AM +0530, Manivannan Sadhasivam wrote:
> > On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> > > On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > > > The PCI link, when down, needs to be recovered to bring it back. But that
> > > > cannot be done in a generic way as link recovery procedure is specific to
> > > > host bridges. So add a new API pci_host_handle_link_down() that could be
> > > > called by the host bridge drivers when the link goes down.
> > > > 
> > > > The API will iterate through all the slots and calls the pcie_do_recovery()
> > > > function with 'pci_channel_io_frozen' as the state. This will result in the
> > > > execution of the AER Fatal error handling code. Since the link down
> > > > recovery is pretty much the same as AER Fatal error handling,
> > > > pcie_do_recovery() helper is reused here. First the AER error_detected
> > > > callback will be triggered for the bridge and the downstream devices. Then,
> > > > pci_host_reset_slot() will be called for the slot, which will reset the
> > > > slot using 'reset_slot' callback to recover the link. Once that's done,
> > > > resume message will be broadcasted to the bridge and the downstream devices
> > > > indicating successful link recovery.
> > > 
> > > Link down is an event for a single Root Port.  Why would we iterate
> > > through all the Root Ports if the link went down for one of them?
> > 
> > Because on the reference platform (Qcom), link down notification is
> > not per-port, but per controller. So that's why we are iterating
> > through all ports.  The callback is supposed to identify the ports
> > that triggered the link down event and recover them.
> 
> Maybe I'm missing something.  Which callback identifies the port(s)
> that triggered the link down event?

I was referring to the host_bridge::reset_root_port() callback that resets the
root ports.

>  I see that
> pci_host_handle_link_down() is called by
> rockchip_pcie_rc_sys_irq_thread() and qcom_pcie_global_irq_thread(),
> but I don't see the logic that identifies a particular Root Port.
> 
> Per-controller notification of per-port events is a controller
> deficiency, not something inherent to PCIe.  I don't think we should
> build common infrastructure that resets all the Root Ports just
> because one of them had an issue.
> 

Hmm, fair enough.

> I think pci_host_handle_link_down() should take a Root Port, not a
> host bridge, and the controller driver should figure out which port
> needs to be recovered, or the controller driver can have its own loop
> to recover all of them if it can't figure out which one needs it.
> 

This should also work. Feel free to drop the relevant commits for v6.16, I can
resubmit them (including dw-rockchip after -rc1).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

