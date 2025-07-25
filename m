Return-Path: <linuxppc-dev+bounces-10405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CCDB121B0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Jul 2025 18:16:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bpY0Q4NZzz30Yb;
	Sat, 26 Jul 2025 02:16:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1753460198;
	cv=none; b=fyA+PE3HVwPQBCCsoml2zlbjZ8ECBnIOfGKfGpnSXujZzaVAzPqnwrkLN0Ng4hMwo0DjAqxZQUo1L4YbuM3MzZdVBBCOAyGPUITamdi2TpbLTrMY6Ai7aVr9vqvlmAWwCYgeG2/NQ2C6n3KCrhfswCkn7RDchrkhtxbBvkoodgRXjFDjeo9XXa0Goirp33/WG/c113p1v8BNaoZEXwCwTifKEIUOQNExKeD2WK649UbEJIjLU/JnDqODGdNuuWxTbon+EsQnlu7yUjRb11VaGSb43ycIb3BCzqTqHTG0ydw5DjZpobkuLpkl3tMGlzIztGef2AkkEIvUBBdgreOL3w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1753460198; c=relaxed/relaxed;
	bh=k9lVzColSUbzoyzWK1v2ytYya9LR+3IJRUPOrRIrYkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EaSpClqcyTX3uPlW+7yFm6GY699zKSbV8R8pXQceFDfa0H2MBEHbPMQSMMAMOlxYPOT8Fb12JkcKPiilSPGhMnLMXI34qRDi5/vyNh7u1N2owqaMQlQnseORvStt98l/7OZplZrSLLXcI7WfHdT7JY4Gk5GNbcCOq0qZChnba4bcz6ribQ/oVBsOvFyGMiIfy6q3Fscnccy5Yn9PfYgVQAfBpfbmwhLymhnJgQezQFShxT0Q9VU/AJ7zJwaznsI/ml4DrtMVDhvdBrvcimLTVL6FwqCbX6LGzspPwszRQgWScpa85dbr8IZq7mvTLTpC7/Yw5xaTCyaET0ESbpoCgw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.46; helo=mail-ej1-f46.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bpY0P31j2z30Wn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jul 2025 02:16:36 +1000 (AEST)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ae3b336e936so448581766b.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Jul 2025 09:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753460192; x=1754064992;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k9lVzColSUbzoyzWK1v2ytYya9LR+3IJRUPOrRIrYkE=;
        b=dBpFD+XcPgbuLXcRjupfTqIqVwoWoX2OOgXkXO7Z9hBTU4BBamKXfDiIxFpNsA9Y/K
         amqCURaSOsNWA/LnDwyaZn5H7R5cl7JU1FGBPuIJzF1Ru47pg8xd5PxC49lQwml0csTE
         esvbP3cJWEOcnrT5VxFL1FCh8uTKy2W8MlNKgU5iAG39O2o75kVAoKLQla1SsxKQmxv+
         sYP2I+iZCC8/ghZDLx91F/64lUV/bSs/BzsqZNrSrMHDKtErcYYW6dhYC5AUGKqgpzaO
         GVpPFHld1LM0KyvCkkiELosxNx0tl+Y1uh5iQRe+UCRFenFiJJqk3w2o0pod+er1xUrR
         krpw==
X-Forwarded-Encrypted: i=1; AJvYcCVyF9lDZduwHeNw4r7QJR6C4cnYxVYu/pmg5JbKlyTLMcZZT7qBilZHhxrZyNJ7808ERTDGBHq1Jzf5amY=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwdTUxGfKb5SqdbWr8LSag78s4zFLnBiV9lmuOYvNvC4FqrMVnL
	DxVUissneNMieAV9I+cgCOUH1xb+14UuVZxxzIh9cjM6d/eSBT4WeEAv
X-Gm-Gg: ASbGncuCVk6tgeHETdJSRkWMt/2aNupQfmAJd25MRlgJPm/LVhzZrRcQuldrCyRgoWG
	GjBYSDmVUu7tKDfrKGomW+d2KviMoI7twBaLVFkhX3m/XHzyGsaVMxVGlBPgdVzsMUDTyE2L5gT
	PPGOCDoT+w14NRQNe3rNGoJwgXURTdDJy7LDo3qfkgF4DCtc9ejnBZ/+HnC/NDCzO1+OY2cxgGa
	P0bCSVZLzGagq4FwVyL90eriDJ1w9rmfhaMuvfPVnffzoGNEpQaZbkGl+JZCkPH52WD/GjQ59EW
	Ql4oMcWrHJv5rRP2AusQuBPlds3GnD6d9DJ0lPDaSUxxjiWcq7h+ukzIUobkD3emqkxfRQovwVa
	dDyRVB8Lh1Phrzw==
X-Google-Smtp-Source: AGHT+IHbjaJ8cbbWsPvmFdchaHgB59gZMNGBegBtlGVNhjnCNqWbZSGSDTI+qaKic8T0W3LbKoDy/Q==
X-Received: by 2002:a17:907:7ea9:b0:ae0:9fdf:25e8 with SMTP id a640c23a62f3a-af61e6368d8mr274930166b.47.1753460191687;
        Fri, 25 Jul 2025 09:16:31 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:74::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af635af9967sm11514466b.131.2025.07.25.09.16.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 09:16:31 -0700 (PDT)
Date: Fri, 25 Jul 2025 09:16:28 -0700
From: Breno Leitao <leitao@debian.org>
To: Shuai Xue <xueshuai@linux.alibaba.com>
Cc: Tony Luck <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, James Morse <james.morse@arm.com>, 
	Robert Moore <robert.moore@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Hanjun Guo <guohanjun@huawei.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, acpica-devel@lists.linux.dev, osandov@osandov.com, 
	konrad.wilk@oracle.com, linux-edac@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-pci@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] vmcoreinfo: Track and log recoverable hardware errors
Message-ID: <ldlansfiesfxf4a6dzp5z2etquz5jgiq6ttx3al6q7sesgros6@xh4lkevbzsow>
References: <20250722-vmcore_hw_error-v3-1-ff0683fc1f17@debian.org>
 <7ce9731a-b212-4e27-8809-0559eb36c5f2@linux.alibaba.com>
 <4qh2wbcbzdajh2tvki26qe4tqjazmyvbn7v7aqqhkxpitdrexo@ucch4ppo7i4e>
 <fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
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
In-Reply-To: <fdb5dced-ea5a-48b8-bbb4-fc3ade7f3df8@linux.alibaba.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_MSPIKE_H3,
	RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Shuai,

On Fri, Jul 25, 2025 at 03:40:58PM +0800, Shuai Xue wrote:
> > > APEI does not define an error type named GHES. GHES is just a kernel
> > > driver name. Many hardware error types can be handled in GHES (see
> > > ghes_do_proc), for example, AER is routed by GHES when firmware-first
> > > mode is used. As far as I know, firmware-first mode is commonly used in
> > > production. Should GHES errors be categorized into AER, memory, and CXL
> > > memory instead?
> > 
> > I also considered slicing the data differently initially, but then
> > realized it would add more complexity than necessary for my needs.
> > 
> > If you believe we should further subdivide the data, I’m happy to do so.
> > 
> > You’re suggesting a structure like this, which would then map to the
> > corresponding CPER_SEC_ sections:
> > 
> > 	enum hwerr_error_type {
> > 	HWERR_RECOV_AER,     // maps to CPER_SEC_PCIE
> > 	HWERR_RECOV_MCE,     // maps to default MCE + CPER_SEC_PCIE
> 
> CPER_SEC_PCIE is typo?

Correct, HWERR_RECOV_MCE would map to the regular MCE and not errors
coming from GHES.

> > 	HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_*
> > 	HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM
> > 	}
> > 
> > Additionally, what about events related to CPU, Firmware, or DMA
> > errors—for example, CPER_SEC_PROC, CPER_SEC_FW, CPER_SEC_DMAR? Should we
> > include those in the classification as well?
> 
> I would like to split a error from ghes to its own type,
> it sounds more reasonable. I can not tell what happened from HWERR_RECOV_AERat all :(

Makes sense. Regarding your answer, I suppose we might want to have
something like the following:

	enum hwerr_error_type {
		HWERR_RECOV_MCE,     // maps to errors in do_machine_check()
		HWERR_RECOV_CXL,     // maps to CPER_SEC_CXL_
		HWERR_RECOV_PCI,     // maps to AER (pci_dev_aer_stats_incr()) and CPER_SEC_PCIE and CPER_SEC_PCI
		HWERR_RECOV_MEMORY,  // maps to CPER_SEC_PLATFORM_MEM_
		HWERR_RECOV_CPU,     // maps to CPER_SEC_PROC_
		HWERR_RECOV_DMA,     // maps to CPER_SEC_DMAR_
		HWERR_RECOV_OTHERS,  // maps to CPER_SEC_FW_, CPER_SEC_DMAR_, 
	}

Is this what you think we should track?

Thanks
--breno

