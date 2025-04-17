Return-Path: <linuxppc-dev+bounces-7731-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 24FF3A917FB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 11:33:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdXkw1x9qz2yrS;
	Thu, 17 Apr 2025 19:33:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::430"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744882408;
	cv=none; b=FuXvnqycFk0Dn3NCrKPiP5Qi4Aov/22/bBFRqcdD9bwvfhSR+VEDpTABlB7vey9ZETnVAt7zPkZiI5OO+b0pQbmvONzLcbg8VlcQJCKi/LJugRbGRP/5jbGSpcskd2XW3CSY4gO93AzYB5wz/SmVS+4z+i3Op92eREOQRo1e9UkV+FS2EjeCB0DVkLAk/lXaoDKfF7FRlm/V5wNFFOoePRMnlQzcugbu4HVuaUr9oJp7Ws0GibtbjauuCRtKbaSFiG38lUBJDUMX98R9L2+pAHgaQeR7OaxpsJi5C6k1UBiXPvQNhQG6T+HkbAffxOazHuJOOl7FbchZDq8MtTupWw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744882408; c=relaxed/relaxed;
	bh=9N0xhgZNCRJbzkyeaB5Kdu2W0GpuGNyTH2hczyIgWGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnVDaW/yuVtFPr/6Gl+P4+Haz6z2JSWxdVWxSHqia+yPjWqxMV8HSIixmS0rf0yZVVNsHX0itid1ydfem4yMSfbv1bjPY7kz6B9rt6UQf89/94ov1b5C/WDNMDoMuIFB1/0HBbLjpxYgluyPwR/GxTxytCFG/h9NnnmY79LTDEugT8ioTgZILrbglWkcIDuBw9RpNRHvmGiH1EXmD+2kiGbPBCDQ6YsyFRxDRuL4tO5KlegeVzRYkmE+Sl8WWYZjRdc6ZSNzE+zTjVLcHULtyVsXHTUr+2tJlgQX1bKnggH2tE+WTL3T+fVyaWvf9gvKZdjL4d49q9PTDzkVBuLRGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ku8p9pz3; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ku8p9pz3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdXkv0XnMz2xd6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 19:33:25 +1000 (AEST)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-739be717eddso375321b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 02:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744882403; x=1745487203; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9N0xhgZNCRJbzkyeaB5Kdu2W0GpuGNyTH2hczyIgWGQ=;
        b=ku8p9pz3H/znsmgjYbRliZEY0DOBnXRdPMc5bMHKvlFPZFistPY8Oso5iIgrhUR8DA
         aLampFY/W5KlZcV+Dz7hw3gIXfU7pxp1Ntm4w/aTYBb8wZ3rzJrC/p6EMn0+sd2IxdWd
         lAYyLfou/lcsc1/clmBIoP4b2x8cPA2mRx+YvKAiuuiMPoSWHjdOnSjWJ/iiwTukVAnu
         w72DzK6LOQOvqkxxPFaJF72W79eff94FxA3DZNAJP9kS7zV956Av5OVUTHq8bbKr9jpp
         z6uQUbUayHfa5erJGaAjFFkF3oulGi33fsNL0KUqFv/MNs7e2+6Tf8l3qonSFKIE9sss
         pkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744882403; x=1745487203;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9N0xhgZNCRJbzkyeaB5Kdu2W0GpuGNyTH2hczyIgWGQ=;
        b=UCKHRCv0peLX7V5zk0rVD39cf2lyPM+qu9l91qp6ofyEqkljxHX4VTur1Tx7tGYP5s
         jeg5n6gKFsmXlG8fisTO9kSy4tshrgRpQzZj7JN5urkO81xz62QqhtVvFHZsanABrAB4
         NEe1/3jRNyc6kwNpaPHQ9xPh619WN0ukLDd+t0IMYCVDLIaa5UWSYMJfEscHmxmJk6mj
         C4IUf6qgN6jB+plLBVpApFlQI5+5m94klohQzzg4PqjzeAYH+IZZ6K5/OKIA/lgrQdQz
         tlUDYuyI0+3UQuc6d5bfIwTjDoVj8WTS7OXeMBDTiOv8C3ucfLgRpa4gHOq0dpVT09+Z
         ZGNw==
X-Forwarded-Encrypted: i=1; AJvYcCXmkQ3TdMOR3kFZgZAPz1vUeOPxANE2RxEc50Ebtks2zF8dxqXxRQNzTb5Pqzg4EFLv9gQTTt3qayIm+hU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy+uNuyVeqrf8T2dN2+0JP6oSbrhbxI5Rfkw8uLbqOM/bqWs/30
	3smB4hh6uWXCo6+PBJY5rQ9OMpQ2yhalO2slx/sRnvfYWuu89HmApdJ7Wo/+qg==
X-Gm-Gg: ASbGncubq53iRui+nKwvZwRhNd3+StzHZWgZcUcHPhRvgPUy9e9KU8HnYML4jUaz3f4
	9tfLmJm/3xzOaS6dFT6c7ppNiUdzjZ3mq2ArPgKM4VBvraqBW+gSP5eu8XoF5mXyAoG+ZFudwE8
	D3A4iwywPAk2u3XPBHhF0M+oq8OJzM0n5e25UnUFexcRbG1NOWp9PinntMQoDE8YmLLQtWyTrnb
	cD/Lq2mSvNnDhnO+SrexEv/MFns4yeLQuhrfMxmPnIAJrNRzmfZOYd8CNIxl68r1xlzlKhnPdRu
	zFZNrPJ/wWbeAV3Qy5qD59AD8he1mWUbXXwpmfbvlIsIPm/q
X-Google-Smtp-Source: AGHT+IEDIoppzt9Qk8ptm5Tvdr9bMM0BM2cyotG2JtwFXQXfEIWSI1eGvMWwitL7P6ll2IgmvhRvXA==
X-Received: by 2002:a05:6a00:2e24:b0:736:8c0f:774f with SMTP id d2e1a72fcca58-73c267ee1bbmr7570930b3a.22.1744882402798;
        Thu, 17 Apr 2025 02:33:22 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2198d95sm12277569b3a.17.2025.04.17.02.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 02:33:22 -0700 (PDT)
Date: Thu, 17 Apr 2025 15:03:16 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <hcjqtycb3dpauylwx726f3kb722dinuxootjswitchmh6cymlc@d4gzshhlfodh>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
 <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
 <2c0b0929-0610-3e99-03be-a50e9f5f323b@oss.qualcomm.com>
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
In-Reply-To: <2c0b0929-0610-3e99-03be-a50e9f5f323b@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Apr 17, 2025 at 02:41:55PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/17/2025 1:24 PM, Manivannan Sadhasivam wrote:
> > On Wed, Apr 16, 2025 at 11:21:49PM +0530, Krishna Chaitanya Chundru wrote:
> > > 
> > > 
> > > On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > > > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > 
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
> > > > pcie_do_slot_reset() will be called for each slots, which will reset the
> > > > slots using 'reset_slot' callback to recover the link. Once that's done,
> > > > resume message will be broadcasted to the bridge and the downstream devices
> > > > indicating successful link recovery.
> > > > 
> > > > In case if the AER support is not enabled in the kernel, only
> > > > pci_bus_error_reset() will be called for each slots as there is no way we
> > > > could inform the drivers about link recovery.
> > > > 
> > > The PCIe endpoint drivers are registering with err_handlers and they
> > > will be invoked only from pcie_do_recovery, but there are getting built
> > > by default irrespective of AER is enabled or not.
> > > 
> > 
> > AER is *one* of the functionalities of an endpoint. And the endpoint could
> > mostly work without AER reporting (except for AER fatal/non-fatal where recovery
> > need to be performed by the host). So it wouldn't make sense to add AER
> > dependency for them.
> > 
> > > Does it make sense to built err.c irrespective of AER is enabled or not
> > > to use common logic without the need of having dependency on AER.
> > > 
> > 
> > Well, yes and no. Right now, only DPC reuses the err handlers except AER. But
> > DPC driver itself is functional dependent on AER. So I don't think it is really
> > required to build err.c independent of AER. But I will try to rework the code in
> > the future for fixing things like 'AER' prefix added to logs and such.
> > 
> Right now we have DPC & AER to use this pcie_do_recovery(), now we are
> adding supporting for controller reported error (Link down) not sure if
> there will be newer ways to report errors in future.
> 
> May be not in this series, in future better to de-couple err.c from
> AER as err.c. As the sources of error reporting is not limited to AER
> or DPC alone now.
> 

Yes, that's part of my plan.

> > > Also since err.c is tied with AER, DPC also had a hard requirement
> > > to enable AER which is not needed technically.
> > > 
> > 
> > DPC driver is functional dependent on AER.
> I got a impression by seeing below statement that DPC can work
> independently.
> As per spec 6 sec 6.2.11.2, DPC error signaling "A DPC-capable
> Downstream Port must support ERR_COR signaling, independent of whether
> it supports Advanced Error Reporting (AER) or not".
> 

That's why I intentionally said 'DPC driver' not 'DPC'. The driver has the
dependency, not the feature.

> In fact it can work if AER is not enabled also, but will not have full
> functionality of DPC.
> 

Right. That's why I said functionally dependent.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

