Return-Path: <linuxppc-dev+bounces-8457-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F26F5AB0AE8
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 08:51:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zv05c2g05z2yqR;
	Fri,  9 May 2025 16:51:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::433"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746773476;
	cv=none; b=TehsKDYhVaGGpPQ/Egmo1CZJSFvJzop/YXo5YhJEYDS+6ngBWZa9bZYCgg5eHIZeC6fttPpfa5QtU+C/oVNymvSJNI9E2r/CK/AmOfRm7rpFjCyU7ZKWqAG7rkeb549lf9OQl1xD7KqYVLIt7cfthwx/FhD8IbnBy39DXUx1q8htUsJeqigsWvJRfM/hl3WKfgF99AijE+ZlLf60/OqdODJxgkkr0Y3zjcd3YMCzDX4bKJ2GgrfGFftKNv4DfnU5e60rgsqmHxhzRSdi5p/Bh1zQekl7xHSGAhI75s+2c7OPQhvBRMukE+hMBwmfE6zTwMaXjfq13ch/X2mI9xe5cw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746773476; c=relaxed/relaxed;
	bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AkdP0M4vNJvZqt39FQumkKj21f1yNhzwHJNcMZ7scstyEUD48UU1/jGwtozS8EVitNBOjuH0o7+my53Uj2uFTitQ6390hA1m+mxiLjHyoNg1iJmguJzcc+EVDIynmPxNZujwwtjAYVBQwUprap6SptRnghrqtf1xfrrFjpUyuiDGeb7q8GrsjOUl4xJ5zcFN57z4hnKZDthtpXxJvx/CQPQTthAxi4QwAf15eV97d+Vk/FOf4xbbzR52IXFAQ7r4Wk92zdSX9G6BjzW4/OB26MHWF6PfbIFiDxZ7PC3Jl6mA1GtVJUjomwTBYpkUcqHyXnwqVqDcVXZlXxxbBE8roA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org; dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g/IQ6XYf; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org) smtp.mailfrom=linaro.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=g/IQ6XYf;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com; envelope-from=manivannan.sadhasivam@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zv05Y1wMnz2yfy
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 May 2025 16:51:11 +1000 (AEST)
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a1fb18420aso22601f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 May 2025 23:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746773468; x=1747378268; darn=lists.ozlabs.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=g/IQ6XYfPEx/Tt5KeJ8paNVane6/SbHY1lxEKIDCCEqnYniILqJmhMFxh4xqSz4nUb
         Xa5XkWjCoTar/UcYRI6RW98XSEd0RXM584GkQLK2sVUcqgtooftEDnvXh6laDh5Ovyo7
         Se9nf22WCsin5DHG9EyDz79pAv/l+Cb0rw+rCwKej1rCk9gp/59xrdnhlehOXhXEsKYl
         kdi8+Rgg356jx37q6EqqMfGhcq1BRRlCotP4k5dPDb7GVYNaQeTrPYG4A/w4ZYQ3268N
         g7bfoBU4O2NyZ3SF1djlnO7N5pQJVVBoZWOyJ+w9xRfwVtzyLy26lsW8tTw5YsAKfIqr
         1W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746773468; x=1747378268;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ypnr2THvthLLCavYo7AZWLvgkehzz9yqDu3s2kWxJOs=;
        b=JJ4vf+K5VYcOeMpe/6a73e1I81P3J7UynSr4ltiXLYru50g3ObgnuWMXf3deOdcpsp
         JP1fByvX/Hji/yYPSc8MvYkBMLN10cX+sWUna88ViKovith/zX3Bl1BR+RBlX2oB7LGA
         pxqOANA4UXnIlpw51G6eu3o6XQ29uKSGCVWXdtsJj0dkX6z31gSaOSTU/EgSXbkj4Tg9
         tT4olk/NhqmoSWpYZ7gAEK2j/OzI08NY8f2wNBLLyJCFQ711MYWRwM3qMyPJU+KrXygc
         On+Xyn4Wy0LNFZeM0LwJUf1cCYQNKHlFiAP9sK7x+iBaqtWLDtnlIhLK9c8m737LLDPM
         v6WA==
X-Forwarded-Encrypted: i=1; AJvYcCXIfLHGkcMD5z5/Q6spbqG0wjnj5sjWwDc6Ig7JNkVx8lAn5d5P31KWSGoZuTjklIWqPiQolD22PPGn7wU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKgDee1u3YXxwuVX4zLLJGK311Gg8i+fbVCiu2//a7nDn7gjfW
	BcQrki/lw64nk9tUfieJ+mZgSbrGD96SiV4j3M3o6DQcV+Ziax88CODPJsmpjA==
X-Gm-Gg: ASbGncvhojLDLcpr74kXZkZ6QZWVHImTn71ZMMWz8BPL/W0h4P4Xj0MCqxKEA58028Y
	ahESP3fBpQNQF6ol0Gg6oVWO0D2wEuQk4OqAIf6EoUzPZOQuBXdLyPUGQTABuzth9bY1AjnQMm9
	YU+bUR6N4dvF10prQthcyAhs7uuVzu0TXuAOXsZjhonj21tXFDH/z700n1viTbe0GZv9A89NF2y
	X0HYRLHfjHvvoP2gZDn9OuW9MPuaVEQUty1fZW/tMo3gJ77eBmtf6HB0JtciXxfTD2B90aa18mg
	sXbSdL8tCSUBDVyP/QJ0UIM5kBMtOwyrvaulNe9LQQwuHjBJS409n89gz/tF1uFcgHvmNdEK8Dq
	kKltDWEPkyWCPjASjWSW/sHg=
X-Google-Smtp-Source: AGHT+IEBZ+xyU+mtZq/TJ5fu+6WMLt3/ZEPH5kI6vP9q6SNWA2Tnohwr4qj0xsEIdaPCJ/e8n6vxRA==
X-Received: by 2002:a05:6000:178e:b0:391:4889:5045 with SMTP id ffacd0b85a97d-3a1f649be24mr1423812f8f.36.1746773468403;
        Thu, 08 May 2025 23:51:08 -0700 (PDT)
Received: from thinkpad (cust-east-par-46-193-69-61.cust.wifirst.net. [46.193.69.61])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f5a4c5e1sm2214791f8f.89.2025.05.08.23.51.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 23:51:07 -0700 (PDT)
Date: Fri, 9 May 2025 12:21:07 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Ethan Zhao <etzhao1900@gmail.com>
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
Subject: Re: [PATCH v4 1/5] PCI/ERR: Remove misleading TODO regarding kernel
 panic
Message-ID: <34nnkgbfkccvxiksjb5qaojppcvnkq4l7rchllsppy7cl4fics@4mwtb3rhko5n>
References: <20250508-pcie-reset-slot-v4-0-7050093e2b50@linaro.org>
 <20250508-pcie-reset-slot-v4-1-7050093e2b50@linaro.org>
 <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
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
In-Reply-To: <ec5bd8d1-c865-40ac-b03d-9e07875d931c@gmail.com>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 09, 2025 at 02:11:00PM +0800, Ethan Zhao wrote:
> 
> 
> On 5/8/2025 3:10 PM, Manivannan Sadhasivam wrote:
> > A PCI device is just another peripheral in a system. So failure to
> > recover it, must not result in a kernel panic. So remove the TODO which
> > is quite misleading.
> > 
> Could you explain what the result would be if A PCI device failed to
> recovery from FATAL/NON_FATAL aer error or DPC event ? what else
> better choice we have as next step ? or just saying "failed" then
> go ahead ?
> 

If the recovery is not possible (with device,bus,host reset), then there is
nothing could be done.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

