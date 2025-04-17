Return-Path: <linuxppc-dev+bounces-7727-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BB7A9157F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 09:42:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdVGh0Ltvz2yhY;
	Thu, 17 Apr 2025 17:42:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62e"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744875740;
	cv=none; b=Yu2nQHwNi1D3edzAO5JBx41gGDeNHOn4itck+u/e7yZ5pE2ztkkQawS3JoQ6o1V9h47/oj+W5DakSnEEyNfp+hmnv70ShR/NdQIiEEu1K+ACLYWcf014MceArWHCJjaOlMlQOllWxOlSHtbw5zp9+lF4cFT+dyWYwh7RGGzGLjopV2IImW9+912xlkD0PSTguUGYESQXuESkGxA8aSJLX3hyEK1DfzPxLRS3dOFfoz5nMPWmV0Q2ndE1JZBDwqZraByYvsccuirkQkn8bgQloQbnbqwjGOyGPRbDFv9P0GbAcTDOqrRcr0amspn1k0L3otI2AeqCXNGpxc9vwwFWpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744875740; c=relaxed/relaxed;
	bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5YFMXSnWtEyEcNdG+RwTRcd9/b3fKqCEaNxzZv/rHzc3/uJ5kVWbXfUtV+Mi1Eu7H/td0J0YDC19pMEt9As7VB6ohEw4tsG73vLWCKxYzaeTpl9yld4KV5e+a8lcNZpGlZkpBmQtt7x812tAxIIQBJsgCJXX0lxoNhew3nEvjx059lukBmvVRp/M3G0mo+ACvKC2Y8YSRaf0VLrtHZC6TJz6SZyTbikB9MrsdqP3LDlPVnzNGC3oE8L130IxyJM0OVB2bGbClqLp03FNeUSphlv/6Dn+xNl8Qd8oBygRiQJMZtF6TBoZoDMg3JbmCeZrtRq/q2LtigsODdY65SeLQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WaBEWtel; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WaBEWtel;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdVGg0C6Qz2xlP
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 17:42:17 +1000 (AEST)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-226185948ffso4996495ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 00:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744875735; x=1745480535; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
        b=WaBEWtelTvd3aAwd1QOXYfphl8O9ancgmdpPCf/7vSHdMeq+wXqz9Nr54EuNw2FCyt
         GY/bAsPfg0lGmkRnSGCi6Kv7Ppss52qytbNHC6PrIPNB5NwxlMLzzyxtlz6fjxXHEHrY
         rVYkZcFJ89Aoy9OEjnJbgjM9iMimUJwvxb/mMYfutdT1S/dwlXYlaFKApDZi+JzS6pst
         JAsRaF5u6y03JurMKpvzPloZCoTja0nXirBv4q1F3dZgM1XBvLZpGP9Txl18nmsGytnm
         SOkyoLmtKbvgS77pvDx+a9zQATA3kLk66nppT0685kQLsiU6iwgIBY52i1rnwFmuwsVr
         4CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744875735; x=1745480535;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eDgB7wJ22ie3HmeLXVm86GHefERwHEPMmaPgZUtFTeM=;
        b=QRlAF2Ur6wTSaBSwGyQ8vwn+a6bDdltUIukenwacaKQuZT5G53uJgqZrFkGgW9vDU+
         Va8Rc5BYtml1My/CYSRLrwwkXR9nTmdaxsYF7sN3FgHkONM/JSnu+LhDP0mQ65FlaKmq
         XxTZ3QnLQr7qW/LBii3DDedpx6xD0SS2fqzXOju8HqV8n1rSZA/h4DHAiUcfgqnLWTKi
         YKjN942j4q6kRtSha30aWZ1bFezbHYUxw1n2uQYvyuhVkE51rp0cf2QoF8RAuyHXFRoB
         7GXWS8pWhEI4/qhiPC3XYsogbrbnIKT8oNAs9iDaQH2pVe1XUIdr498qnc6b/vSIFDM+
         oIvg==
X-Forwarded-Encrypted: i=1; AJvYcCV4fxQfVuf9ByhwT682lHmWIhXLSiLWIcHj1UgD67jVMGM5K0JpQSre6Jurok52eGY2HrXToxfWNK4VSIM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxmQ4j9mzVFOFUimoPkcGkUOqhX64fgbqYyLr5wyb3M9YFDZgtB
	tWZhIHvMaUz56QWGKLg2fD6GvGFf2R0mFw31xdjhd2U3ucdsBjw1JSRw+wtacA==
X-Gm-Gg: ASbGncvY8GTj8MWFLP5MLGps+nubfREFtlTGQfYKIKD+w5a6ceFVTbqpOFY5+UCPbMe
	37Wkt/y0BTvHMIe3Fv3P411lNPNMrl3PrjJLd3jT5D2FsqYZ4QHUSFaR8wjnl4uj4ziXh1ObYMc
	W5MUguXkTIkqvpirP8jCulOxLZq2Bl5bAl987ZPKN0dWvXMpNjXMBKjBkuG8wCfP7S6jnYBjky3
	c6JA6EEnjXIesVhyqqNG6KuS6ufdQ+ZWlkh0+cP9zbBSbu864dV/1m8DNrMTuOSZppCCUbuBqr4
	bsaVpabvA34LvS417xQWD1hHnzsYjgWIdV456wEYj11By/2nahm6BQETDSs=
X-Google-Smtp-Source: AGHT+IG/Yi/qk4YGrJvgZRoRnXd14pk5pi5diwpsqtszPlC13bqbgZFlocoYN6rPXNF0yZn07MCGQQ==
X-Received: by 2002:a17:902:dacc:b0:223:35cb:e421 with SMTP id d9443c01a7336-22c35985d1dmr68962035ad.49.1744875735660;
        Thu, 17 Apr 2025 00:42:15 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c3e0e19d2sm15264935ad.91.2025.04.17.00.42.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:42:15 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:12:08 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lukas Wunner <lukas@wunner.de>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof Wilczy??ski <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <doyt4kcaffgjm5u5notcjnqur7ydim3dpo4se5em2an36wa3rp@xzntx4sa47dl>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <Z__hZ2M8wDHn2XSn@wunner.de>
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
In-Reply-To: <Z__hZ2M8wDHn2XSn@wunner.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 06:57:11PM +0200, Lukas Wunner wrote:
> On Wed, Apr 16, 2025 at 09:59:05PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > --- a/drivers/pci/pcie/err.c
> > +++ b/drivers/pci/pcie/err.c
> > @@ -270,3 +270,30 @@ pci_ers_result_t pcie_do_recovery(struct pci_dev *dev,
> >  
> >  	return status;
> >  }
> > +
> > +static pci_ers_result_t pcie_do_slot_reset(struct pci_dev *dev)
> > +{
> > +	int ret;
> > +
> > +	ret = pci_bus_error_reset(dev);
> > +	if (ret) {
> > +		pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		return PCI_ERS_RESULT_DISCONNECT;
> > +	}
> > +
> > +	pci_info(dev, "Slot has been reset\n");
> > +
> > +	return PCI_ERS_RESULT_RECOVERED;
> > +}
> > +
> > +void pcie_do_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (pci_is_root_bus(bus))
> > +			pcie_do_recovery(dev, pci_channel_io_frozen,
> > +					 pcie_do_slot_reset);
> > +	}
> > +}
> 
> Since pcie_do_slot_reset(), pcie_do_recover_slots() and
> pcie_do_recover_slots() are only needed on platforms with a
> specific host controller (and not, say, on x86), it would be good
> if they could be kept e.g. in a library in drivers/pci/controller/
> to avoid unnecessarily enlarging the .text section for everyone else.
> 
> One option would be the existing pci-host-common.c, another a
> completely new file.
> 

I don't like introducing a new file, so I'll make pci-host-common as a common
library for host controller drivers and move this code there.

> > --- a/drivers/pci/pci.h
> > +++ b/drivers/pci/pci.h
> > @@ -966,6 +966,7 @@ int pci_aer_clear_status(struct pci_dev *dev);
> >  int pci_aer_raw_clear_status(struct pci_dev *dev);
> >  void pci_save_aer_state(struct pci_dev *dev);
> >  void pci_restore_aer_state(struct pci_dev *dev);
> > +void pcie_do_recover_slots(struct pci_host_bridge *host);
> >  #else
> >  static inline void pci_no_aer(void) { }
> >  static inline void pci_aer_init(struct pci_dev *d) { }
> > @@ -975,6 +976,26 @@ static inline int pci_aer_clear_status(struct pci_dev *dev) { return -EINVAL; }
> >  static inline int pci_aer_raw_clear_status(struct pci_dev *dev) { return -EINVAL; }
> >  static inline void pci_save_aer_state(struct pci_dev *dev) { }
> >  static inline void pci_restore_aer_state(struct pci_dev *dev) { }
> > +static inline void pcie_do_recover_slots(struct pci_host_bridge *host)
> > +{
> > +	struct pci_bus *bus = host->bus;
> > +	struct pci_dev *dev;
> > +	int ret;
> > +
> > +	if (!host->reset_slot)
> > +		dev_warn(&host->dev, "Missing reset_slot() callback\n");
> > +
> > +	for_each_pci_bridge(dev, bus) {
> > +		if (!pci_is_root_bus(bus))
> > +			continue;
> > +
> > +		ret = pci_bus_error_reset(dev);
> > +		if (ret)
> > +			pci_err(dev, "Failed to reset slot: %d\n", ret);
> > +		else
> > +			pci_info(dev, "Slot has been reset\n");
> > +	}
> > +}
> >  #endif
> 
> Unusual to have such a large inline function in a header.
> Can this likewise be moved to some library file and separated
> from the other version via #ifdef please?
> 

Sure.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

