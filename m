Return-Path: <linuxppc-dev+bounces-11442-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C93B3ABF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Aug 2025 22:51:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cCYTd6jjGz2xnx;
	Fri, 29 Aug 2025 06:51:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756411320;
	cv=none; b=LGFxMGBjEXxcLo6/ZGJ6iTEmdKkEJSxQgebCqOP9qq1w3MVmF8w/nhwiy1BRiknQyJQiG+Hgod9EFyvRd1dyEYLlTAE4jU3m9PffRROEPLpvjMJBVjeu+vDGnAv5pOyR18nB7sFX1R53l/Uj1+8dARlEeedGZKQTTLaxbh1nAX2jJquSaHXJO+r6wNxcZiWcw52WOfJur1Fy1uF8cU9Gf5Xv2vErJBO2Puii3HeANhHqZBPP0+OFY9k+DLlCIbyD3iVcaUYpySpNy3lOtom1ijis8l1DrJs97A4btDHdbUvCHJdkbqpGlW7mSGDTrhsfobQylQU0qoeVGCvG4ofvpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756411320; c=relaxed/relaxed;
	bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AXrZ4/KoweV+PqU8ughh0hCOVCq8QSTLEp5o6I1hBDNm558qGLjJWen9ITOSVgdrHTlNWpAQIJCirqSZNtGwmAJLN6gjSbrTA+52Ifd4gteGb1iZpiLH47M+B0Sj1GpgspDaUryAUnqMfZTQzjNXpxE5yWepIoPM//QOYUlSbww+ic52N3Zv2eQL9ewOeMh6aNTGnwOXyL34ftgGTc6jNtOzlh4IDZsRe1unEQme8ikrDHLAgkIE6Q6BoPx+uAFklKHvEnQvXOmHmoanDHGPTO7GQUf5Oo9qoP7Nr0HaeT/dIJZY+17ZqaGUCeP7FAOy3JroFttMnYUicTV+jrX/Yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mJqzQEpl; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mJqzQEpl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52b; helo=mail-pg1-x52b.google.com; envelope-from=briannorris@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cCXNl1rlfz2xQ2
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 06:01:57 +1000 (AEST)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-b47475cf8ecso941356a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Aug 2025 13:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1756411315; x=1757016115; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
        b=mJqzQEplOj1sUxZBHnv+SLgO1+lMDfa6QtvwgB+MPPx57gwmPdLY1Jh5zAl+zWEujJ
         uiv0LKi+VdHsNpowCBTsSd+PoqfO6Dnmfc4C37pC/3sc5WejwuhkyIPHcmsnpR7tAkiF
         n3oFBnq2JISUcJO21+CuUHCa/96830z3pLldE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756411315; x=1757016115;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=phR9doI5X4q1LR98gybIzZyU1kdJD+t4ijHV2CMLbUI=;
        b=acrqWNns88Gi/Xl/3SofWTe9zWyEjFRjSKWJjHD5xLXxmp8p8/PU2ozZADdQuVS7Az
         SFDBUTv5PHJ/xkliP4DPKnAr8Br27oScANiBx7u0H2Y3Y84Ux6dQHIXaNzTy2unovCPn
         lJXG8I86j/GMEDyFTs07QXjcpAeJjTmAyb668rBpjYNFOIn4l6NkTqAzt+i1dvRLH2gN
         UksjWuveuY50ph5UvqoZtHh5GoqaI0jrTPYK8x/Q4gEFMqjK22KuFF9kxG8HYxqayjDf
         Su1TZIRMPTatldi3jit5rTeLmaHq5GFQniRzMIwX6O+QhOvSSiNAcC3KBbQlfvtoG/Zi
         SpuQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0z4xU84R+1wzVR0ZdkUn2U3X/QCoKkq1/RMD+YpzI3y1hiE8WN0dCfjaJsi+sWOzAIfsfthUiPiL+Fh0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxBCgOd8A/ESZJwz5B21wJNWCNVr8hHTjSvOY8U38C+m3lZYXWG
	6SUsnSETS5h6Ben3TAk2FNsxv2diJ8AdSQjn+lXD+eEUbLcVkQdMaAShJIYnkjRMtw==
X-Gm-Gg: ASbGnctB2y6nra+cqmn2oKjQO0RJDnFpUZSLyyXrke/bB29mdI+7kAZwD+xoD9JwXKi
	zHJhPJCQYlk+/Zydu/P0XwGTfRzAD84Q5iNI/cuuTk0s2KwRhB/2IjQRNjcMBVPjolIuDRxx4n+
	dRhHsbXriX1CVaTjAPnM+tZN6l9g3mLHcMf1vwrWzKixUGt4G6wY3QJmlilm2Nhq4szb7m14MwS
	Mm4pDnzxGxVNBLi7e5fzSpdxiFwMZ9bH/pZvoz+JIE3dr7bmDJ1MSBTlAXQ9szw6HMVLATFCiDX
	4vUvizHx8Hd/B6gLY15kUI2rOYmCvGMh4ShXmSjLHc5xnxEXv5PII3m8nbkAhdj+DU4IPGOsg8/
	Jmz/Fu4Lx0pThxMBDgE9u8tBgOisXPsIQo6CK2YtVJHWNkVNFZ35ssDuH1WgSNfPkRw4WZ0A=
X-Google-Smtp-Source: AGHT+IGRMI2y6ukLzuxA0A2Y52962J0xzxUUU/p9/lxC5pAaBaeFe2iw+3odm0xYYkw4AIuMGBT6Hw==
X-Received: by 2002:a17:903:13c8:b0:248:6d1a:430f with SMTP id d9443c01a7336-2486d1a46b2mr149396845ad.25.1756411314801;
        Thu, 28 Aug 2025 13:01:54 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e14:7:2893:df0f:26ec:df00])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-24905da3be1sm3479885ad.69.2025.08.28.13.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Aug 2025 13:01:53 -0700 (PDT)
Date: Thu, 28 Aug 2025 13:01:51 -0700
From: Brian Norris <briannorris@chromium.org>
To: manivannan.sadhasivam@oss.qualcomm.com
Cc: Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>, Will Deacon <will@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Niklas Cassel <cassel@kernel.org>,
	Wilfred Mallawa <wilfred.mallawa@wdc.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH v6 0/4] PCI: Add support for resetting the Root Ports in
 a platform specific way
Message-ID: <aLC1rzdTVoN56Phc@google.com>
References: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
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
In-Reply-To: <20250715-pci-port-reset-v6-0-6f9cce94e7bb@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Jul 15, 2025 at 07:51:03PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> Hi,
> 
> Currently, in the event of AER/DPC, PCI core will try to reset the slot (Root
> Port) and its subordinate devices by invoking bridge control reset and FLR. But
> in some cases like AER Fatal error, it might be necessary to reset the Root
> Ports using the PCI host bridge drivers in a platform specific way (as indicated
> by the TODO in the pcie_do_recovery() function in drivers/pci/pcie/err.c).
> Otherwise, the PCI link won't be recovered successfully.
> 
> So this series adds a new callback 'pci_host_bridge::reset_root_port' for the
> host bridge drivers to reset the Root Port when a fatal error happens.
> 
> Also, this series allows the host bridge drivers to handle PCI link down event
> by resetting the Root Ports and recovering the bus. This is accomplished by the
> help of the new 'pci_host_handle_link_down()' API. Host bridge drivers are
> expected to call this API (preferrably from a threaded IRQ handler) with
> relevant Root Port 'pci_dev' when a link down event is detected for the port.
> The API will reuse the pcie_do_recovery() function to recover the link if AER
> support is enabled, otherwise it will directly call the reset_root_port()
> callback of the host bridge driver (if exists).
> 
> For reference, I've modified the pcie-qcom driver to call
> pci_host_handle_link_down() API with Root Port 'pci_dev' after receiving the
> LINK_DOWN global_irq event and populated 'pci_host_bridge::reset_root_port()'
> callback to reset the Root Port. Since the Qcom PCIe controllers support only
> a single Root Port (slot) per controller instance, the API is going to be
> invoked only once. For multi Root Port controllers, the controller driver is
> expected to detect the Root Port that received the link down event and call
> the pci_host_handle_link_down() API with 'pci_dev' of that Root Port.
> 
> Testing
> -------
> 
> I've lost access to my test setup now. So Krishna (Cced) will help with testing
> on the Qcom platform and Wilfred or Niklas should be able to test it on Rockchip
> platform. For the moment, this series is compile tested only.

For the series:

Tested-by: Brian Norris <briannorris@chromium.org>

I've tested the whole thing on Qualcomm SC7280 Herobrine systems with
NVMe. After adding a debugfs node to control toggling PERST, I can force
the link to reset, and see it recover and resume NVMe traffic.

I've tested the first two on Pixel phones, using a non-upstream
DWC-based driver that I'm working on getting in better shape. (We've
previously supported a custom link-error API setup instead.) I'd love to
see this available upstream.

Regards,
Brian

