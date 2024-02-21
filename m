Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9AC85E615
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 19:33:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EBaIETGL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tg4fB1P3hz3d2N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 05:33:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=EBaIETGL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com; envelope-from=dan.carpenter@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tg4dQ0V18z3bwR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Feb 2024 05:32:39 +1100 (AEDT)
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-41275f1b45aso6949665e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 10:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708540353; x=1709145153; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdCNHUB8NlhEWaYuHhsXiudAInPYTn2vq7tNOUbWmbI=;
        b=EBaIETGLnRtzFKlvUjx1SLG7QulZDA5niohX+Fo7GQRViH66lg1x7Bd/6JX8ajxROu
         2sxRXpTbbdGltbCdVeXbKTrmVSqWMh62DRz11sGE90m5IQAPzdQS7JUcdZ3fR7F6xRER
         iHdtTyCiOa74EL+38sCC5+9IMOhh9N5dZ8uT0kh3aqNxjTHJelTTKSd/lNRbxjP5nW4x
         o+A2m5eJ73idE6oi5djxdJxeVUNZ+EXZDL9QWeaSGAPVOqJNCSTCoTyzpZOMmAEUpveM
         9XknS2XoMcWuDe2a8da3q7xcZUj5P0WVODjmpXXi3oEhzOVrSisMzn9qjfd977SOVbh9
         Zevg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708540353; x=1709145153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdCNHUB8NlhEWaYuHhsXiudAInPYTn2vq7tNOUbWmbI=;
        b=m8bWUSdgJB3Erz47GlIjMXj7iMg6QDLcphKhP8cw/RkAESeh/Y1OfnPBghxQZGTP7j
         n7NVyRLwvZOcf3+NXw4DiTfavPRAbkQW7ClJytRN0LXv67JNFfVud1QzzBFw5nnoTjD4
         3VT8XN7vDRpIm1Psi5aOpm9HluPd5Bcl+S7nEoRM/C9h/SrumgETuo8buCWABBkJorOh
         IekV/oOP1PaYLIYIdXJ2Pu6e1txb/PQ39i5Zam4kDzgIlNtpc4F0YVJHJQWSkbeLR+PS
         FjtooVDNMLJjpcDaVwmcwyNq1OiGnxdmr3heqlL2M1ftV4oY+/nA6ceFYg62fWKa/Q1I
         8zBg==
X-Forwarded-Encrypted: i=1; AJvYcCVPqtLqf3FCOuJBEYSQ6pU/vRSOrUknqxaLvG5RZyUxgOanJPGCyzPJSuyQlXWBwJCXY6a2zpP7FbM9oJ398XYSzAtzm6+/5qvxNCKAwA==
X-Gm-Message-State: AOJu0Yw5LpId9GHSLGgib2vhz06XFq0+13s5On4w3XALxKi9oZSjwJ9A
	od50PcTlVuzcIjsy/iOjPZRpXexijy517H699SQMPQOCfv55MJxjLig5v94x+Sw=
X-Google-Smtp-Source: AGHT+IGjjh41J8R6w1HgLCzLEhL+yAFtNJQ8Did+W2yZkuwwHAhhY4N1gRhnvSo6GKC5QbcXWFhzlA==
X-Received: by 2002:a05:6000:809:b0:33d:1656:21fa with SMTP id bt9-20020a056000080900b0033d165621famr19010789wrb.24.1708540352842;
        Wed, 21 Feb 2024 10:32:32 -0800 (PST)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id bx14-20020a5d5b0e000000b0033d6bd4eab9sm6552101wrb.1.2024.02.21.10.32.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 10:32:32 -0800 (PST)
Date: Wed, 21 Feb 2024 21:32:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Simon Horman <horms@kernel.org>, Geoff Levand <geoff@infradead.org>
Subject: Re: [PATCH RFC net] ps3/gelic: Fix possible NULL pointer dereference
Message-ID: <d8cfc517-f597-420b-a164-1d33f3117b93@moroto.mountain>
References: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240221-ps3-gelic-null-deref-v1-1-f4fe159c7cb0@kernel.org>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Jeff Garzik <jeff@garzik.org>, Geoff Levand <geoff@infradead.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Eric Dumazet <edumazet@google.com>, netdev@vger.kernel.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This driver is PPC so I have never looked at the code before.  I noticed
another issue that was introduced last December in commit 3ce4f9c3fbb3
("net/ps3_gelic_net: Add gelic_descr structures").

net/ethernet/toshiba/ps3_gelic_net.c
   375  static int gelic_descr_prepare_rx(struct gelic_card *card,
   376                                    struct gelic_descr *descr)
   377  {
   378          static const unsigned int rx_skb_size =
   379                  ALIGN(GELIC_NET_MAX_FRAME, GELIC_NET_RXBUF_ALIGN) +
   380                  GELIC_NET_RXBUF_ALIGN - 1;
   381          dma_addr_t cpu_addr;
   382          int offset;
   383  
   384          if (gelic_descr_get_status(descr) !=  GELIC_DESCR_DMA_NOT_IN_USE)
   385                  dev_info(ctodev(card), "%s: ERROR status\n", __func__);
   386  
   387          descr->skb = netdev_alloc_skb(*card->netdev, rx_skb_size);
   388          if (!descr->skb) {
   389                  descr->hw_regs.payload.dev_addr = 0; /* tell DMAC don't touch memory */
   390                  return -ENOMEM;
   391          }
   392          descr->hw_regs.dmac_cmd_status = 0;
   393          descr->hw_regs.result_size = 0;
   394          descr->hw_regs.valid_size = 0;
   395          descr->hw_regs.data_error = 0;
   396          descr->hw_regs.payload.dev_addr = 0;
   397          descr->hw_regs.payload.size = 0;
   398          descr->skb = NULL;
                ^^^^^^^^^^^^^^^^^^
NULL

   399  
   400          offset = ((unsigned long)descr->skb->data) &
                                         ^^^^^^^^^^^^
Dereferenced here.

   401                  (GELIC_NET_RXBUF_ALIGN - 1);
   402          if (offset)
   403                  skb_reserve(descr->skb, GELIC_NET_RXBUF_ALIGN - offset);
   404          /* io-mmu-map the skb */
   405          cpu_addr = dma_map_single(ctodev(card), descr->skb->data,
   406                                    GELIC_NET_MAX_FRAME, DMA_FROM_DEVICE);

regards,
dan carpenter

