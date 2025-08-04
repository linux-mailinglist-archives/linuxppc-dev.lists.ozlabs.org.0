Return-Path: <linuxppc-dev+bounces-10595-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AE3B1A624
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Aug 2025 17:35:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bwgcG5nydz3bx0;
	Tue,  5 Aug 2025 01:35:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1754321726;
	cv=none; b=aekBK8rYmpT92IdynTQxtx7kYZOjARpYSuesEU88p3RCeyIEVGcxcN51Ay5rww1sWO9ed1acSZZaEoBV7nbOf0oCVx3YAwgpcWN2PBshe13vU6Wo5IBP9mESSSw3P9dcRSNzydMKzefJCVkNsprIXVnnoyh0VHvzFquzc5LejBLSlf6OCk6rijgLrslDMMcUIKFOGAKXYmkaWFA46SytUOH1FqdRNjOrPu0uYADJIhi8gf3LVIFlxOYPrqcRlYOTZAKSCCUAGCT4BWFA7U6Ee1+VNvex21FLqvA70Fagj5Zime6BiHDPVHPjIKde/pFyOxHgXUvnY7N7ZiiWKgYFKA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1754321726; c=relaxed/relaxed;
	bh=UkvknQsIRTLNlHjYffIfMN8B8TJuS69lKIHDLLVrOcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jGe9KRlcBAC6ED+9diMBAnFNejJwLgarlDMFI4MYw7Dv0ejQIgy0N8Hu8R4DokzxVePo3jnV9uJaICmIy9/aloVbtzgnDHqpkF/JLSnTgblnH/fEqhDnLyTWOAM1huUjlNlfoZDAsNQcWtWO1qd2QYrYCXpjQBvgefJzTzVGs23uF70YQMxE9nZy9QhQL63EPWVhwSWa8lPFa8cdvevdcx/379oo4mhJcqhr7invm0mKsZFj5ddzO05JILt6GBhF7SMrkgxiZBcJjacjcaRkXcXisPB4eW5dmF+mZQ16IRsdhI4BSLsB8va2WUdPoBzgHpLmFkBHrC0pVC6wZZemuw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org; spf=pass (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=debian.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.218.54; helo=mail-ej1-f54.google.com; envelope-from=breno.debian@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bwgcF6NT1z3bwf
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Aug 2025 01:35:25 +1000 (AEST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-af9618282a5so294901766b.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Aug 2025 08:35:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754321722; x=1754926522;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UkvknQsIRTLNlHjYffIfMN8B8TJuS69lKIHDLLVrOcs=;
        b=lyMhAeHd8mN0KvDkpfk124cReDJUlEbgHyYVyXqqHUnBCmXSSGbMBHxxRE9w1XOA5o
         AkUpKchWMUKWt16Vpa65/jldfwgjoeoLMlkwz5Ha/b98aGftsW31HgU5LrPqx30WAOlf
         PrwtoGTOHY1Zh0TZE+YYQNqj8zN4hD8hhgeo7Lgw1M5eAfOzTRaBeGj1ylVPSE23pq0M
         uXyF16rfBQaOV6lgYRf/YhpzTiTAb848M2lm9y2UBitPHM4lXAGvDTUreeWTMmr2NRYp
         UvT39Ff3TEA9xCvL0ukRQQAklT2PorxcXt3pyA7cQOPswdxljg5o+qPAOhQdwGhbVs+u
         G1GA==
X-Forwarded-Encrypted: i=1; AJvYcCVPHOlCNyQURlEM+H1NLXU6KNCI9BJndN0QxI9i0fGp24Y5U3FctDmQd/ycFx4EQGLxYjIXSKVC8AtH5xQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxZ0OqPnNE0dQUQKyDu79cO6uwGW00ZAfnkD3EgNxybi3yilXSA
	6TYQ0aUrtstU2kp6XhkffZTBoWAMAyoVWDGgcolmxyYzuD48IMqFd5rL
X-Gm-Gg: ASbGncs/aPOFkEDCoCCYWIDo9J3hrPxtPpm1Lm/PgE21+rD0TqHgUIxShix3+8Mt+0Q
	vpUx15yJnGW3f++tTINCgoozVt7wsMJWqDV6d3UMo/HN4cR/Vf8PSJHFo3CqByq+ZZ9eEWCrO9l
	/vpmwkBWGLPlXRV/85iDsNmvHvOKd8kNGJVApkZwsYSyfeOeO8hRGl/DCSu2q2rJk2V4/3pXB+P
	nEab08XPi+Qk3mUtaIjBtJcantrUr9dSd0dOAikm8z2ICRQkFt4zhCuxZ86a/eQ3zDVYt6lF+tu
	ofW/Y6yGRQKvSKREK31hB4J6q8oqJnSwbid+LwDHpghHWhPuOcHsDOr8rflviBWFQC2cgLjgnZ5
	L2h0V+Xt0X6GouE+LZg1Scdw=
X-Google-Smtp-Source: AGHT+IGY6yKz+FByCTSLRPrfqErAuLhPrr9SDzfJMrRAtdl7cm5w7Ayr/q2YVc1pbEeuWrcQqViPkA==
X-Received: by 2002:a17:907:c25:b0:ae3:4f80:ac4c with SMTP id a640c23a62f3a-af93ffc139emr1027516966b.12.1754321722244;
        Mon, 04 Aug 2025 08:35:22 -0700 (PDT)
Received: from gmail.com ([2a03:2880:30ff:4::])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-af91a2436a4sm753208266b.134.2025.08.04.08.35.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Aug 2025 08:35:21 -0700 (PDT)
Date: Mon, 4 Aug 2025 08:35:19 -0700
From: Breno Leitao <leitao@debian.org>
To: Sathyanarayanan Kuppuswamy <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>, 
	Oliver O'Halloran <oohall@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Jon Pan-Doh <pandoh@google.com>, linuxppc-dev@lists.ozlabs.org, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] PCI/AER: Check for NULL aer_info before ratelimiting in
 pci_print_aer()
Message-ID: <3kpkazpe4j4pws7rean5kelwmpfp5ij62psvdzvimcr37do47a@y2pvypskynno>
References: <20250804-aer_crash_2-v1-1-fd06562c18a4@debian.org>
 <9cd9f4cf-72ab-40f1-9ead-3e6807b4d474@linux.intel.com>
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
In-Reply-To: <9cd9f4cf-72ab-40f1-9ead-3e6807b4d474@linux.intel.com>
X-Spam-Status: No, score=0.0 required=3.0 tests=FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello Sathyanarayanan,

On Mon, Aug 04, 2025 at 06:50:30AM -0700, Sathyanarayanan Kuppuswamy wrote:
> 
> On 8/4/25 2:17 AM, Breno Leitao wrote:
> > Similarly to pci_dev_aer_stats_incr(), pci_print_aer() may be called
> > when dev->aer_info is NULL. Add a NULL check before proceeding to avoid
> > calling aer_ratelimit() with a NULL aer_info pointer, returning 1, which
> > does not rate limit, given this is fatal.
> 
> Why not add it to pci_print_aer() ?
> 
> > 
> > This prevents a kernel crash triggered by dereferencing a NULL pointer
> > in aer_ratelimit(), ensuring safer handling of PCI devices that lack
> > AER info. This change aligns pci_print_aer() with pci_dev_aer_stats_incr()
> > which already performs this NULL check.
> 
> Is this happening during the kernel boot ? What is the frequency and steps
> to reproduce? I am curious about why pci_print_aer() is called for a PCI device
> without aer_info. Not aer_info means, that particular device is already released
> or in the process of release (pci_release_dev()). Is this triggered by using a stale
> pci_dev pointer?

I've reported some of these investigations in here:

https://lore.kernel.org/all/buduna6darbvwfg3aogl5kimyxkggu3n4romnmq6sozut6axeu@clnx7sfsy457/

