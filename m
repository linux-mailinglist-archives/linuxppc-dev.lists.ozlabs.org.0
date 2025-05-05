Return-Path: <linuxppc-dev+bounces-8299-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FFC9AA986C
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 May 2025 18:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zrmnp2BlJz2xd6;
	Tue,  6 May 2025 02:14:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746461694;
	cv=none; b=JKoSZclCPRvsIYLq44ieFRF9esfjDmk989Ietg/STDu9Jil9Oihe89T6pCp3Q8lmiBcyOXKL6PEXFrmncw3uwtEaaYS4lKxaz0KTb396qQDntqEB6/ZMbH3EsURAx1L6byzW1rPX/NlE84LAcLzOT1H65pM+5g0JzQET4xExX4nzViCcLVgDIV8B1ierKx2wQMq6dToeAe3f+3Rn/odp6IxLKzH1qPFeviSyMt7VcVu3KQr+2mm37MXG33MQdXP9xI/7RVL8FVBXJLvHSlItIcZ7oi1+sVlmwGL7eMfatr0Od1U5SxN/Maxp7F1KMwQrkxV5uj+AWr7AB61Cz5yb0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746461694; c=relaxed/relaxed;
	bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dqDwd0YksuYjJpPyoL0dmLav7om61C5QD4FRlbTH8wUiDeSlVBzI4XaDJmoW7sCH0U8Fxt6MwRG0Xg++3Q17YZijM2ASmwYm+qVHuoNXZqsr3tB1BVRcVetiaHxM0ZdrA0cBOBFasnI3IChJqpT6ljSoVk/XQWpTUyNCunysselJFC5HhHSdDHkqRdPv/COhssIvTz/Ge+vqC5ESzRwADbawZRKSVZmdO7oC/3J67JqUS9hPVeelCckI+4lAUd0QBY7d5Ixr/+/oDYTpiIUa0UMLbPc8DdSUHnAUH4Ax0RYd3tddVg3PbsbYiVydnxaVYJ9iuiBih+F5T+awlyH3Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j+IS4q8M; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=j+IS4q8M;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zrmnn0cgZz2xTh
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 May 2025 02:14:51 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-736c3e7b390so5338780b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 May 2025 09:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746461689; x=1747066489; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=j+IS4q8MZAoNYkAYz+eZ1WCm1lLjRnI0eUK7OFxOiTd2xfQg1BkXahmc6n93RP0pRx
         ionZCtwWvf2SQzFj38cmb5+36Nbkk9Gls/LSGN6i6e4ekPuuuREoHA0Dqi6d2WD97IBq
         qRbiTJbQd6fAvvsQw2drbKk9yDCGyxFLrcshKt1lSui6zoVeKjJLIsUC+OyvpjRv4mw3
         hiJsxM0YQWQNo3/ZpfbirYquKm6iXFTT/LRMl2frscPhJW+n/BOH3sIlNy1xIrkxly65
         uGIzyT1KPFy+/j8nMF0qwGsLyq1fzqyzyDKKmi+uIg+tfyW65RrJR1XLMVswwAKsS/Lm
         GA8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746461689; x=1747066489;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SWvry4KDZapMEnULakjmTiQHQSX4k/taW1KwMUhJXLA=;
        b=lpMoTjVJaEiwRbiyJDGMBGLma8Rhfp2iB5G5PGByq4zbOGZaMuAgIlnM6l9/iGeZMM
         HeMgtsA3bv63jUNvZ8iF4kgtUfR5L8z/rVsscNIslsKq1U5W/ldTszQJIdz2Y4j0dmVU
         rUrDx25Z4g0jGSgpLQXYJktvEJ+mqnMLkF3hEqrvVen3YzQ6d9XSS521by25N5FVcBbn
         0SZJff55XkpfYGOjw1ENDevLm/rGXiHMQn7lsQgiWhYVN5SE/ZXvX8bKYmNL2cp6t2OC
         bl3xK/U0VgBTlZ47FtFZ+dCkW0shrZAVHkrh2NVs2q/l1k3dM4I7crCrmjV++e8DBIN0
         kpfg==
X-Forwarded-Encrypted: i=1; AJvYcCUyBDbY/CB1taDdiLSlnDUTmi/OuW3x7IldYr4zsl4a5O/URhULPM91VBrA/bFCA2Roois3gKbX1nywJoE=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyRRsxwbtTLykV85weRrGzGGf+h2jQp5GHDa3bF/ld2g22bH21K
	i2LXNEEBdydYCt2FG+kY8GdKgoSqVydqJDkwqKlgIyPEG2mEgUhrcXc5DcOkqQ==
X-Gm-Gg: ASbGnctWpfJA9DylBN/KRsqzUsyYBbIGPev+MAblDtZGTzt29yL30NT6wacFtqcEaRS
	9M+EYejfGjgGKU4KPnZLvNu/kAyUXohIix9/14Q1e1UA6006Lyli/4vuootsF/DRwoK0JTO4wST
	W0ffWtAqDRZF0HnPo1+husGQ7L0qZPNnkn7KRxHiiGYZYmAa5Wz/qEEz+b72393uUpkLMyQ6Qar
	A5IKJ3OY36cMAAIymneYXHqqPwXUv7wCDxaX1+6Nvag0oBm7eyuBC7yE5UPsbeKWX4ie+rOJAtY
	htPAyU0SZU+qHEyTFZ43A2LyowyzTDL+eJbCMh71/6n2aCzSpaE=
X-Google-Smtp-Source: AGHT+IGDlihVIhUXhK0fIymH88F2X8FV0rkQuFidNrc3Roi5FkXvbM1MtssO/KpT/pJrJT2EqnO02g==
X-Received: by 2002:a05:6a00:9095:b0:732:5164:3cc with SMTP id d2e1a72fcca58-7406f17ac90mr10027660b3a.19.1746461688655;
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Received: from thinkpad ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590a1c09sm6964138b3a.168.2025.05.05.09.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:14:48 -0700 (PDT)
Date: Mon, 5 May 2025 21:44:38 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Niklas Cassel <cassel@kernel.org>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Zhou Wang <wangzhou1@hisilicon.com>, 
	Will Deacon <will@kernel.org>, Robert Richter <rric@kernel.org>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Marc Zyngier <maz@kernel.org>, 
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	dingwei@marvell.com, Lukas Wunner <lukas@wunner.de>, 
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, wilfred.mallawa@wdc.com
Subject: Re: [PATCH v3 5/5] PCI: qcom: Add support for resetting the slot due
 to link down event
Message-ID: <tflie6ncttih5jxn5xg3zvktidqv5jaqsnsuryy56qfq7pghxd@ippj4lhsdqme>
References: <20250417-pcie-reset-slot-v3-0-59a10811c962@linaro.org>
 <20250417-pcie-reset-slot-v3-5-59a10811c962@linaro.org>
 <aBjTpglI5_P2Q3Aa@ryzen>
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
In-Reply-To: <aBjTpglI5_P2Q3Aa@ryzen>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 05, 2025 at 05:05:10PM +0200, Niklas Cassel wrote:
> Hello Mani,
> 
> On Thu, Apr 17, 2025 at 10:46:31PM +0530, Manivannan Sadhasivam via B4 Relay wrote:
> > @@ -1571,6 +1652,9 @@ static irqreturn_t qcom_pcie_global_irq_thread(int irq, void *data)
> >  		pci_unlock_rescan_remove();
> >  
> >  		qcom_pcie_icc_opp_update(pcie);
> > +	} else if (FIELD_GET(PARF_INT_ALL_LINK_DOWN, status)) {
> > +		dev_dbg(dev, "Received Link down event\n");
> > +		pci_host_handle_link_down(pp->bridge);
> >  	} else {
> >  		dev_WARN_ONCE(dev, 1, "Received unknown event. INT_STATUS: 0x%08x\n",
> >  			      status);
> 
> From debugging an unrelated problem, I noticed that dw-rockchip can
> sometimes have both "link up" bit and "hot reset or link down" bit set
> at the same time, when reading the status register.
> 

That's a good catch. It is quite possible that both fields could be set at once,
so 'if..else' is indeed a bad idea.

> Perhaps the link went down very quickly and then was established again
> by the time the threaded IRQ handler gets to run.
> 
> Your code seems to do an if + else if.
> 
> Without knowing how the events work for your platforms, I would guess
> that it should also be possible to have multiple events set.
> 

I agree.

> 
> In you code, if both LINK UP and hot reset/link down are set,
> I would assume that you driver will not do the right thing.
> 
> Perhaps you want to swap the order? So that link down is handled first,
> and then link up is handled. (If you convert to "if + if "instead of
> "if + else if" that is.)
> 

Makes sense. I'll incorporate this change in v5, thanks!

- Mani

-- 
மணிவண்ணன் சதாசிவம்

