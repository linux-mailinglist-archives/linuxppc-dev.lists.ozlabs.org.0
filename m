Return-Path: <linuxppc-dev+bounces-9026-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B499BAC8710
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 May 2025 05:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b7qBw1Rjgz2y82;
	Fri, 30 May 2025 13:55:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::c2e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748577320;
	cv=none; b=gaxg344b1VKAUSt+tBGbGksv30DnttHcHIHtT9NX9pwDcC0w5ZCLOu94IdUE448vTQ2zSCvq4mwGqFDySESa4fxgU8eWUr6sGRCGQIXys6Ew7rD4WGuyyGbO/e4FWuqJmym2N2qftW1pVxqPw5T7GrDaMKZaeClIHNyjWQ+pl8P1PvdKY8SH60W2y2m4FiDEfFHh2FSXMOoFIxm+MT1wz495POyXNbxF5gRw7WqHe4wpEGTVPcoUDIcPjQtGZNmF6+tlq/vm3Wa0BwBJu8PqHwd177sin/brcCguC/c6h6lmhWN8LPb5G8OzsevopMstbnl3mtHnNNyw6PU3pWXDZw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748577320; c=relaxed/relaxed;
	bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oUHCInqzUqJWYUcv4pt2KZw4XCuZZ+bGirfCzmB1Qt4JxvbCtSnez0bfGW9acBoGJVszYGGER/+jz6n6FXP6AHJ1aTlB7Fnhs+DIwkfEfLB1bHCJdGMf+Jc7TTBcWuuvYS228f3lV9zTelhZ5xYq+MZDJlHy9B3P93Un4/jdRk0ixXevMEMLS6Osc8RBXG0xKR2zr8BiSd26dO1UOIVlyB2BuRwJw7NP32zwWhGQBBHg8Er0OMCN/MBoNUnjjiooSpq76OtO+dVbHZDV1EGmKPiTLnAyQ2H6o5IGY65uRJOK61n2Oh3T3fqW/sDVelOSdiLSCUb1px3Xp900sU3Deg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSt6q/jm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cSt6q/jm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::c2e; helo=mail-oo1-xc2e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b7qBs5Zvwz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 May 2025 13:55:16 +1000 (AEST)
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-60be2256b4dso472010eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 May 2025 20:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748577313; x=1749182113; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=cSt6q/jmcL8QhfWDMDspW0iXs1c7RZzX7yog1QMcqP9VmIgTVIt/l5RJ+VBcOuUZD/
         GHT1EofdEuijUsNIH7bNe97Qit5rLyYSanGfrvRX3RlQLzGXprFNrge3NePO/xAgjgsC
         JsSvNpiCUHMJIeW1Zycq+zqLnS/gcrJ9hjc7a4ZvTmfpFBIKvaBInwKMhXFLiiyGJ//M
         T89iB5rzNt8P2OshwjE149L67Ic7fLXWKSCpQ0qYWlvvLWtfbUdQDLLo6K1PYEfcjOu0
         y7TZZUUykdKUvDkPVkHQaKyk7SzkkUPuuCOVDhFgC8zxj571FG67ANYisAyMwRX8/t/i
         WCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748577313; x=1749182113;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zYT+yS9DtEtNjftxWM62aj+gh1F4QDHmOM8kYqFz3TY=;
        b=sZDG1AcGrsViXDMeQKVgEJzw2EPrJOi0+ookG1J77XHDS8IM8SOOw6n/e3xGdNcfyh
         3bQRumd/kYJph03IyWRdT5SRi4uh4RGrPfNmthG2c8lqtdaHy1Zqnr/QDRbjyW4wMbdR
         8xKqYZxfPzVUk6z4GgCxEwYk6bbed2WLEIgT44GcH6aRINkYHWLNUVrffb+1nRuvz03U
         v5sDqGy5lJ1Gf4VZclFjy8/PKrfZYvO4MUB/UzU1YQ6u90hqMHnPzobGdobYU7uIZEQy
         oL4o/i0tx8Ull/8dhlbn/Uev9KlNPgfLe0wxlaHVILuYRriBIUfkzqC4HO2BlnKAM+Nd
         8/Pw==
X-Forwarded-Encrypted: i=1; AJvYcCXh9Mp3JFjOtoCtJpWYsmTr4B/OQD2ZqeXn54Mwsk8UIqRHvJKNhxnhOFxaOfTEY2qYF55Tfy54Oo9zDhk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YynBp4/f9re09IkIBD3LIy5CB8oPiLjvo2z1NBUBRM0ALzexhGb
	N2HF/KbCD93n9zY5gaFMPuDWvQeGXzwp4Re3aQMFCdSQyuEF5Mb0XBxnp8Ig4PuwNnbuEg3QPLE
	kUAI=
X-Gm-Gg: ASbGncuhvBcPDkzJiEIcCpXX1sjHURMBp/4GNPkGnISYW3Jq7UH4mXcUJCdF+AbzMfK
	SS2Pq0YfqkAVcgwlQdjHxJ8XVujCpJWMM+Hvg9/HLMBfkoaeONxRFH/TxguUvUbnsrd27k28Lpj
	JEPy6I/0dsLyCa0MSc5JK/xt/r691A2hglxrcAN6OYdGdGlss34Gg5qH2tctzpVAIzpKnCLC14y
	5z+MqHA7Wn32FnjW89KqVXE34K0ag+ZhCq8M/x9LwETf805UhKDe7Mm6oOkQA6gNaR06B+OjEFU
	UzvOGixmVEksOtdnUcEnYn6lMeHICBPjMlSGI9RuOum/IJBLbVOCgrkSIzR6Bg==
X-Google-Smtp-Source: AGHT+IHUystiPvDn8wtXmAxatZwAwM/wyWA7RAF5uIDmvCTdpWPCHf/AgW9Un8RMnzAXGJkMNGGi/A==
X-Received: by 2002:a17:902:f711:b0:235:1962:1c13 with SMTP id d9443c01a7336-23539563146mr10695205ad.14.1748576828510;
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Received: from thinkpad ([120.60.139.33])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e3c236asm327042a91.42.2025.05.29.20.47.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 20:47:08 -0700 (PDT)
Date: Fri, 30 May 2025 09:16:59 +0530
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
Message-ID: <fr6orvqq62hozn5g3svpyyazdshv4kh4xszchxbmpdcpgp5pg6@mlehmlasbvrm>
References: <20250508-pcie-reset-slot-v4-4-7050093e2b50@linaro.org>
 <20250528223500.GA58129@bhelgaas>
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
In-Reply-To: <20250528223500.GA58129@bhelgaas>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, May 28, 2025 at 05:35:00PM -0500, Bjorn Helgaas wrote:
> On Thu, May 08, 2025 at 12:40:33PM +0530, Manivannan Sadhasivam wrote:
> > The PCI link, when down, needs to be recovered to bring it back. But that
> > cannot be done in a generic way as link recovery procedure is specific to
> > host bridges. So add a new API pci_host_handle_link_down() that could be
> > called by the host bridge drivers when the link goes down.
> > 
> > The API will iterate through all the slots and calls the pcie_do_recovery()
> > function with 'pci_channel_io_frozen' as the state. This will result in the
> > execution of the AER Fatal error handling code. Since the link down
> > recovery is pretty much the same as AER Fatal error handling,
> > pcie_do_recovery() helper is reused here. First the AER error_detected
> > callback will be triggered for the bridge and the downstream devices. Then,
> > pci_host_reset_slot() will be called for the slot, which will reset the
> > slot using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> 
> Link down is an event for a single Root Port.  Why would we iterate
> through all the Root Ports if the link went down for one of them?

Because on the reference platform (Qcom), link down notification is not
per-port, but per controller. So that's why we are iterating through all ports.
The callback is supposed to identify the ports that triggered the link down
event and recover them.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

