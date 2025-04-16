Return-Path: <linuxppc-dev+bounces-7690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF8FA90749
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Apr 2025 17:04:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zd47S22lYz3bfR;
	Thu, 17 Apr 2025 01:04:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::532"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744815876;
	cv=none; b=WAa5C/PYseIedRztHNAoCbIGqJOuyF7ycQC2I6NhMMahrS0KnTuhk584/2yPLlbI2iSSB3nTRLs8LtfEvnQeUj8Mg33zZbl5o1Kug6OIXRFWUXS00sydOBFCGIQTBoNJfGtMsH51RJR+XgzvRIgZkshqZvirIAg37G0i6q/tGMVw7epVxR9YkSXYczztq3NAksl+JzOy0JTPjfJQvsspaQCAFA5IW9AsVk/x/w7rDzQLitcEEkKrhWISxpG4HVwRaO/6YmYuVw0QPA9JuAUyvvGLAhfFv/jGQTwrKhbfbYSjhP1fpCQSGuVZgzXQroS/c229CytzymSjtVf52WxNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744815876; c=relaxed/relaxed;
	bh=nfVG8rZrRwVZOKz6TlWppVwoQCGAxCeOOP1j7MIZGRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L4ufFwInGxFeXUkm2fbvFO9Z/4CU9QB2S0QGedz7+0Kue5ef3I6jy0PE6hh8PlXn9iZNuCsdRXVhUjNjv02Ar64DUSDdI3AYJJQ52k6mpkRsCgnGDx39dGvqqLvWHgT3dUt9+ESfdm4GcHoaj/w2i4M8Md/e0o2GR7TzPM4FVBi/kkixK9HXXJc0OUUouLMCespydJB2dieGEgvRPcQU3uPmzkJQXuzTQ5TaXoltsDVnTP8nclhRgv7kTZ4PEy2wypouLBfuxi/isEvgn4f2eIeI7tS0W1993VBbRBDgY7LagBFFbxi0tSEewjlDAuc7GdsF7kVjs+hkv3c7vwYjhg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ClEXPV1J; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ClEXPV1J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::532; helo=mail-pg1-x532.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zd47Q4SKMz30NF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 01:04:33 +1000 (AEST)
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-b061a775ac3so4524565a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Apr 2025 08:04:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744815868; x=1745420668; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=nfVG8rZrRwVZOKz6TlWppVwoQCGAxCeOOP1j7MIZGRw=;
        b=ClEXPV1J/09ncCZ6d0NoaoALAgbzmuM6j3kEsub608YGxpVh5FIz/vaFvUCzAK9y4K
         VZ+oA2iQ/vwCnh40BmvUmY7ESeb051EeEX4sVilcW7ONkXK0n14dJx8yNLpFCI2lahWV
         SXILJRJh/je5m1BARVMiVPox3tGorDebM22EssXnf1wVNUhGZmp24L5mDnlYRjlwn/sw
         sZXe8+M0JPeR+SjiOF1e/M4DhlZVf8oSdb/dSF56kOU2oMBu93y5nlEQmlO/7E7NSLJ8
         qIzReV/FgDgniq2imhqHZVrSE5dHHz5AuyeXizDpK4k/VRnC/6lWHtRWc8R66arAHUpm
         Butg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744815868; x=1745420668;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nfVG8rZrRwVZOKz6TlWppVwoQCGAxCeOOP1j7MIZGRw=;
        b=k4ZJTHGTZLz1X1LVMe9Dtdf4rQRHpxrrJ/ivYAvEWrs/GtnFX6ELKBFL1UlFaZKM+h
         WvnE1ASOfpirHRWFcapzfF1OIEJcDq2KrpGis3bBkMZWb3VyK2enk8S1z7TdCyBkhpga
         ygWMtRDtIvAGzvK3dDwe6NiiUfq3EGNZcahCl/WELEy/nhJqImF3bRnfCFnlcxB1SW4O
         VYYAd17XqPIrXCYF97qWdLstD2tkaIZxL6YWIFwFPCu24Owthu5QWjC8ROBblt7EMcHv
         eU1f8CXqLvxPkZ+hz3nNQLbhSYYMfYAty7ZUqm8lwqS1qT9zjY+uo/UgzhEKIvB8Y6GU
         i5tA==
X-Forwarded-Encrypted: i=1; AJvYcCVzdMXXGR8NCz0vW/JrJqnfAGPQhzzK28f8f2xAHwg4IsxalvDHaYrpuLIPjxkPeq7fK3L4rdVe8MqZoWk=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywnp7TpmRkZ5lseKfFkFrpl5rkv1q1CKTbGMEsyDXUazEVORsB2
	Wj6VO9WdtlfTTdh85nqCPdTgdpWACg1e1XC9oprVJl88KOaHdFHqTQ/Vj2HZWw==
X-Gm-Gg: ASbGncuACu5VH5txZEJB6v33SGY1W5ogzrzrlCjVMHfAbTJjwiqVIRTaPEJc8GDo1YM
	duyjSXZ2xjYvTnwkg6O0jVg2tY/6QLNgEeDOt2z5tPVwItaFLJCc1WpfSewUlX2hVw5ttyfiFSo
	KZs3iSXrGEm6JuYDYXrMk4johpkJy4Uae3zWJcUvm95Y7Lcata8lYk4XgbFvDgMd4gZioeLJXnT
	nWmr1mwqG7aE3YZGaPN5xJt6OaotVDC746iW4LshtFi82Skh0CvPDxIpvRDE7CbRHEbnO1ewQjq
	tV6sCReJUcpp1MbJ3f1smkWltGzOm/kjiwhyhRa8toQtEhuMJM4=
X-Google-Smtp-Source: AGHT+IGhtyNmiMmaDXqhLwWa1sShCSn/DUyQsAgpk7UXgCpMw78TMynnnA2HPDDqv4w0w9QstcvPGQ==
X-Received: by 2002:a05:6a21:8cc1:b0:1f5:7df9:f13c with SMTP id adf61e73a8af0-203b400cfdfmr2815792637.41.1744815867897;
        Wed, 16 Apr 2025 08:04:27 -0700 (PDT)
Received: from thinkpad ([120.60.130.16])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0b220a988bsm1391403a12.14.2025.04.16.08.04.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 08:04:27 -0700 (PDT)
Date: Wed, 16 Apr 2025 20:34:21 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 2/4] PCI/ERR: Add support for resetting the slot in a
 platforms specific way
Message-ID: <rrqn7hlefn7klaczi2jkfta72pwmtentj3zp37yvw3brwpnalk@3eapwfeo5y4d>
References: <20250404-pcie-reset-slot-v1-0-98952918bf90@linaro.org>
 <20250404-pcie-reset-slot-v1-2-98952918bf90@linaro.org>
 <Z--cY5Uf6JyTYL9y@wunner.de>
 <3dokyirkf47lqxgx5k2ybij5b5an6qnceifsub3mcmjvzp3kdb@sm7f2jxxepdc>
 <Z__AyQeZmXiNwT7c@wunner.de>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z__AyQeZmXiNwT7c@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 04:38:01PM +0200, Lukas Wunner wrote:
> On Tue, Apr 15, 2025 at 07:03:17PM +0530, Manivannan Sadhasivam wrote:
> > On Fri, Apr 04, 2025 at 10:46:27AM +0200, Lukas Wunner wrote:
> > > On Fri, Apr 04, 2025 at 01:52:22PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > > > When the PCI error handling requires resetting the slot, reset it
> > > > using the host bridge specific 'reset_slot' callback if available
> > > > before calling the 'slot_reset' callback of the PCI drivers.
> > > > 
> > > > The 'reset_slot' callback is responsible for resetting the given slot
> > > > referenced by the 'pci_dev' pointer in a platform specific way and
> > > > bring it back to the working state if possible. If any error occurs
> > > > during the slot reset operation, relevant errno should be returned.
> > > 
> > > This feels like something that should be plumbed into
> > > pcibios_reset_secondary_bus(), rather than pcie_do_recovery().
> > 
> > I did consider that, but didn't go for it since there was no platform
> > reset code present in that function. But I will try to use it as I
> > don't have a strong preference to do reset slot in pcie_do_recovery().
> 
> The only platform overriding pcibios_reset_secondary_bus() is powerpc,
> and it only does that on PowerNV.
> 
> I think you could continue to stick with the approach of adding a
> ->reset_slot() callback to struct pci_host_bridge, but it would
> be good if at the same time you could convert PowerNV to use the
> newly introduced callback as well.  And then remove the way to
> override the reset procedure via pcibios_reset_secondary_bus().
> 
> All pci_host_bridge's which do not define a ->reset_slot() could be
> assigned a default callback which just calls pci_reset_secondary_bus().
> 
> Alternatively, pcibios_reset_secondary_bus() could be made to invoke the
> pci_host_bridge's ->reset_slot() callback if it's not NULL, else
> pci_reset_secondary_bus(). 

Yes. This is what I now tried locally as well.

> And in that case, the __weak attribute
> could be removed as well as the powerpc-specific version of
> pcibios_reset_secondary_bus().
> 

I don't think it is possible to get rid of the powerpc version. It has its own
pci_dev::sysdata pointing to 'struct pci_controller' pointer which is internal
to powerpc arch code. And the generic code would need 'struct pci_host_bridge'
to access the callback.

> I guess what I'm trying to say is, you don't *have* to plumb this
> into pcibios_reset_secondary_bus().  In fact, having a host bridge
> specific callback could be useful if the SoC contains several
> host bridges which require different callbacks to perform a reset.
> 
> I just want to make sure that the code remains maintainable,
> i.e. we don't have two separate ways to override how a bus reset
> is performed.
> 

I think we need to have the override in powerpc anyway. But I will move the
'reset_slot' callback to it and get it called from pci_bus_error_reset() (for
both AER and Link Down).

- Mani

-- 
மணிவண்ணன் சதாசிவம்

