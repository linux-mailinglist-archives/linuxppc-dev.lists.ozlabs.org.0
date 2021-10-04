Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 352254214A6
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 19:00:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNRmy0RtQz3c9Y
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 04:00:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.161.42; helo=mail-oo1-f42.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com
 [209.85.161.42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNRmS1gMgz2yY7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 04:00:23 +1100 (AEDT)
Received: by mail-oo1-f42.google.com with SMTP id
 v17-20020a4ae051000000b002b5a56e3da3so5572306oos.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 10:00:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Kwtxm5uDJtAtvdkR11+c/kBQtvDw2iewlRIV15Fpib4=;
 b=sUmb0AAxofWLWZD+KRmwjS7jL78aQNQhr4xKsu+U3f9qE3EtcEiPvkqZ54Z+sxt13e
 pi5IDJsLiX8dTPkVW1CNYbItQjq5EK1ALo032kCyQVBrPSq7rzr93fGz/ju8sbl97SSM
 vBkEKF8BMs/1LwEKK52tcAZl1BG/pqV3Ery2eRvi8QZKtfki2XwO9edA9OYeaNkfHeIc
 PYnWMDZ3lz/F3cWhvs6+eZSTYJiH2Nc4+5pcXqeDS8yEIu+x3Mlgd19kt+agft/thiJF
 mSsPQ6oG3D7ec0SK7a7XVYAS3gdLRrEP0GzZ9yM9nQNpDmY+nXgT5ECPKPMM45C662TU
 PBKw==
X-Gm-Message-State: AOAM532hJe4hT5HFd0EdotWf+5on9UE7aLO114J8OHegVzLbdTNC7xDA
 UjPlPMRyEyXTDom5JYCDOA==
X-Google-Smtp-Source: ABdhPJwI4xNm6SHgfjI/gavg1NLSNvf5DjG7t5FNNOWsZfgfBjBnvi9klDXNE+6vgn1qG1GkQYVSug==
X-Received: by 2002:a4a:7b4b:: with SMTP id l72mr9778665ooc.21.1633366816946; 
 Mon, 04 Oct 2021 10:00:16 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id c5sm2965069otb.35.2021.10.04.10.00.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 10:00:16 -0700 (PDT)
Received: (nullmailer pid 1474180 invoked by uid 1000);
 Mon, 04 Oct 2021 17:00:15 -0000
Date: Mon, 4 Oct 2021 12:00:15 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH v3 2/2] powerpc/powermac: constify device_node in
 of_irq_parse_oldworld()
Message-ID: <YVszH/UPGsrYsDwj@robh.at.kernel.org>
References: <20210924105653.46963-1-krzysztof.kozlowski@canonical.com>
 <20210924105653.46963-2-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210924105653.46963-2-krzysztof.kozlowski@canonical.com>
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
Cc: devicetree@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 24 Sep 2021 12:56:53 +0200, Krzysztof Kozlowski wrote:
> The of_irq_parse_oldworld() does not modify passed device_node so make
> it a pointer to const for safety.  Drop the extern while modifying the
> line.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> 
> ---
> 
> Changes since v1:
> 1. Drop extern.
> ---
>  arch/powerpc/platforms/powermac/pic.c | 2 +-
>  include/linux/of_irq.h                | 6 +++---
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
