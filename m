Return-Path: <linuxppc-dev+bounces-7730-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8825A915CB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Apr 2025 09:54:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZdVY7223tz2yr4;
	Thu, 17 Apr 2025 17:54:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::436"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1744876491;
	cv=none; b=nQOA6xkCRxqploijmmcUOironZRSDHhDN7+2akg7mAyua00zVwml1Yvcff2WVw/YSMTVu0vJePDfFIkOKqv+Til2HvXD4A3glCdxr2dFEGoX1g8qU9wpSfOlK8yB4jRmjVdvNFZAu+ocs7Yo84RxPz7aH4ZucRsOrKIBFs2ODiv1DyUKgOu1eFJsJka2oIRxPV3mm6eRG0dqpx81QfOJN5A2bwD/yTyEop+96GGrQ2REGvGB3s+3AhaFdq4yNJooVF7uuUFOec4LPLoZQfpYObe+I4SAwtxQcJzLT26de+vRvBIoon08vfohPQ9ek268JNCOVtsXRfcdeZGoBYWZTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1744876491; c=relaxed/relaxed;
	bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YnQF7dJNI+AGj/cgR1wFlqhX27mWHa26hsTCVa0p/eR17VxCB4pe8B1Q0E55Hgd9VBOcGFUn89DpI4V+99ZPJb8L5A+P5sULlt1XUQZHH0W1DFQbtrQBrk+2ieLsn7IEURGvwXF2YkFJ2lc4iRGsvEt6TOMBw/q8Om4DNdX7OObF4qvUq83xTMvNRmPu1fzLPmnSWNlBsneVId8aX/DE7UNScXD84XgHUWO+NB/teFW5GL3+KhOU0iyZslXfL/Mw9Ts8IOYjtTFlioRXl7lUv/kISh9v5wL/rFiSFPwiSAIkGjXnxSfhp91ZzX+xN2uwfLd/K78kEF6MCafEj2c93Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VKswod50; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=VKswod50;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZdVY62NTRz2yqd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 17:54:48 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-736a72220edso435719b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Apr 2025 00:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744876487; x=1745481287; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
        b=VKswod50lZ90iFc0cZcC5zUK8ZwIrTYg8VrzxXZ8aSVVuT3Ewxepi74+iShmoNGyD+
         wz8Qpp/XXB+pnRZNDJAyXCxjZNxLF1l6o70BX4zauRIZy9h2CCer9mDya/qfdZxbGT5H
         rFgi0enI48ClUGgu98Qg1D3HvhI5MrpJ9La0JP4pCVAGtUi+00ItButEzlNTHOiJgnAv
         zlTvetE7k5DRsi1N26ZIZKBSUvJ0DEVK6Rvdvg22isKFRQxAwKPSWRYl5EGgdiZnuziq
         fX0jVwYMGNwNWsHAvTBuMS6hPS+ECGEQMx4esJodKB6kD3BK1tApJY3cyK4pL2R3k4QD
         tYlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744876487; x=1745481287;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzOw82UGgblpmMtgHt3tu3Y7oCEf0jc/oLwNceOiuZ8=;
        b=qs8DdWrtkuGx3t9R3/e9JneOy49P5b6vgnTWP8EqAcK2ccfPnoJHaMrZvpBQWJlHAu
         Z80ha5iBMvdE8wtAr8jN98TyTl3cPIITnQMTBEA8uFRqwR84d9KEsx1GtNBNVnDIgnOq
         YUvkAWMadUUaAs/+SjYoM7n0idiwax5bntqTY3ShF89bosc8CIZViOhUjkqJdLjk+3hC
         kw5DmYn9hWwRyGTRlHVS1bsmgh3JhhB0Or8v3KPKu/+Y1n51D/k5rzsfToprYcKmJ1xC
         Qn4zKx3O2e7b6Gk5+xHSvP78H2TgZaO5vrUI/YhjbfvFvybWoaboxLoqi8JhpacDyWtv
         nT5A==
X-Forwarded-Encrypted: i=1; AJvYcCVjvETehyg291i+onv4uZyrpn87DbDVkOW4E8KfEDkHkO/idhgvPKuTW5ZlRfi45x/xPxL6J1MBlWDeeI0=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YziMN8RS8qVe5+y5KNUhA2tqAw1wTzHo6iRoZdFoM0SxAP9Vbkc
	ckjCVWRd5zR5hosojkM9X/HGBcMmhpNWn60KmoMfxKBbsbuITcllivLDDwl/WQ==
X-Gm-Gg: ASbGncuunKcwudPxOtdsBHiFR0nMj+NvwQMQTJEDK6qDLVinHA4RaEB2FNl0+yFC3ij
	7kKBklaWWYd/wVYDorbagKyoIe+w8Don0coQg0/nKiwjxKVr68Cff75djOGLV19dGZQ33zbrxEw
	CI/exi9jiMFv54CzTpcLAWTQy8zWXQLtrSczvL8xjUSyffUvq8WRrs5kJInj5HnUmCs2DsEuv7f
	TS+pElvMV90IB8gRkS17BYD8dKlV7NlhYpHHiWrqhqI+Pz46Do7NAw6htDWCtOg2B0V/Ba4rDP1
	Hqhf6ZHpfxHZQGi0KVINJrFBrhId3VTQviMWsEBWOxyr7qUK
X-Google-Smtp-Source: AGHT+IHr4TLOn+vWmMUG8we+6H82JH3XHC68smquEz0SW0g3spOjs92CiF0f680vTLzBzdTTUPC87Q==
X-Received: by 2002:a17:90b:5824:b0:2fe:a79e:f56f with SMTP id 98e67ed59e1d1-30863f19571mr7527508a91.13.1744876487050;
        Thu, 17 Apr 2025 00:54:47 -0700 (PDT)
Received: from thinkpad ([120.60.54.0])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308613b2f13sm3318363a91.36.2025.04.17.00.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 00:54:46 -0700 (PDT)
Date: Thu, 17 Apr 2025 13:24:41 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, dingwei@marvell.com, cassel@kernel.org, 
	Lukas Wunner <lukas@wunner.de>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 3/4] PCI: Add link down handling for host bridges
Message-ID: <lsehjhqicvit32jcsjkfqemgypnpim6zbxwapzdrncm3hwrp44@bvwg2acyyvle>
References: <20250416-pcie-reset-slot-v2-0-efe76b278c10@linaro.org>
 <20250416-pcie-reset-slot-v2-3-efe76b278c10@linaro.org>
 <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
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
In-Reply-To: <26b70e1b-861f-4c94-47a7-a267c41cadbb@oss.qualcomm.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Apr 16, 2025 at 11:21:49PM +0530, Krishna Chaitanya Chundru wrote:
> 
> 
> On 4/16/2025 9:59 PM, Manivannan Sadhasivam via B4 Relay wrote:
> > From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > 
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
> > pcie_do_slot_reset() will be called for each slots, which will reset the
> > slots using 'reset_slot' callback to recover the link. Once that's done,
> > resume message will be broadcasted to the bridge and the downstream devices
> > indicating successful link recovery.
> > 
> > In case if the AER support is not enabled in the kernel, only
> > pci_bus_error_reset() will be called for each slots as there is no way we
> > could inform the drivers about link recovery.
> > 
> The PCIe endpoint drivers are registering with err_handlers and they
> will be invoked only from pcie_do_recovery, but there are getting built
> by default irrespective of AER is enabled or not.
> 

AER is *one* of the functionalities of an endpoint. And the endpoint could
mostly work without AER reporting (except for AER fatal/non-fatal where recovery
need to be performed by the host). So it wouldn't make sense to add AER
dependency for them.

> Does it make sense to built err.c irrespective of AER is enabled or not
> to use common logic without the need of having dependency on AER.
> 

Well, yes and no. Right now, only DPC reuses the err handlers except AER. But
DPC driver itself is functional dependent on AER. So I don't think it is really
required to build err.c independent of AER. But I will try to rework the code in
the future for fixing things like 'AER' prefix added to logs and such.

> Also since err.c is tied with AER, DPC also had a hard requirement
> to enable AER which is not needed technically.
> 

DPC driver is functional dependent on AER.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

