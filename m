Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C294D5347
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Mar 2022 21:51:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KF1Sv11fqz3bb8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 07:51:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com
 [209.85.210.47])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KF1SR73xJz2ypn
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Mar 2022 07:51:19 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id
 s35-20020a0568302aa300b005b2463a41faso4888795otu.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Mar 2022 12:51:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=slxCGGqrUztha0XPfFAUWL5ID7RQgaEMphARvX9hCBs=;
 b=1E+6RLzHtwS6e2DN9PZl5QH1pYVnUM6CelokaAnSgZzEU/YOlUG+ZikjwWiyegT8Vq
 jdjvuCfhOmxC0I1HIXp9gaQWfyoGmJuvuMetLwxA0ZPP2/WgPgpcs6KAizwUghfJKcE5
 HJt8lvUt7QRzus8nxzDPQEzfAOoCoj7cVhxKNuq3fDf1u+OBx1jOw5CcQ92aPTeXfjwU
 FIoi9zIRkfkup2yODijz0wDO9fmX1jmbhIBg6p/YDorBTG3XHqm1WWJsPz5rfoM1fIyd
 oD8UXsydN2cxFKtVi8zWZDeWrD4zbb+Kp50lU6YO6Issj/bDG71dOgsHIa8eJnC636+h
 m6kQ==
X-Gm-Message-State: AOAM531p3ljHdG3LzYi5zo3Z+ycb5KZsmhiX/mPEU9dpW77PhD5IHNEv
 5exJVjgGWhKqN6AS3sKuew==
X-Google-Smtp-Source: ABdhPJz8G/QtOa+879lxZGa2RhwdFvUCb7Fy+vOXp2rvMTapgI5pc7gEgYdwEjMMeo8zWtoeAvPFGw==
X-Received: by 2002:a05:6830:22f2:b0:5c4:3f05:33cf with SMTP id
 t18-20020a05683022f200b005c43f0533cfmr2425782otc.330.1646945475301; 
 Thu, 10 Mar 2022 12:51:15 -0800 (PST)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 y8-20020a544d88000000b002d525da014bsm2668280oix.42.2022.03.10.12.51.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 12:51:14 -0800 (PST)
Received: (nullmailer pid 2046461 invoked by uid 1000);
 Thu, 10 Mar 2022 20:51:13 -0000
Date: Thu, 10 Mar 2022 14:51:13 -0600
From: Rob Herring <robh@kernel.org>
To: Alifer Moraes <alifer.m@variscite.com>
Subject: Re: [PATCH 3/4] ASoC: wm8904: extend device tree support
Message-ID: <YipkwW6rUbWweXn7@robh.at.kernel.org>
References: <20220307141041.27538-1-alifer.m@variscite.com>
 <20220307141041.27538-3-alifer.m@variscite.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220307141041.27538-3-alifer.m@variscite.com>
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
Cc: pierluigi.p@variscite.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, shengjiu.wang@gmail.com, tiwai@suse.com,
 linux-kernel@vger.kernel.org, lgirdwood@gmail.com, eran.m@variscite.com,
 broonie@kernel.org, patches@opensource.cirrus.com, perex@perex.cz,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 07, 2022 at 11:10:40AM -0300, Alifer Moraes wrote:
> From: Pierluigi Passaro <pierluigi.p@variscite.com>
> 
> The platform_data structure is not populated when using device trees.
> This patch adds optional dts properties to allow populating it:
> - gpio-cfg
> - mic-cfg
> - num-drc-cfgs
> - drc-cfg-regs
> - drc-cfg-names
> - num-retune-mobile-cfgs
> - retune-mobile-cfg-regs
> - retune-mobile-cfg-names
> - retune-mobile-cfg-rates

If you want to add all this, convert to DT schema first. 

They all need vendor prefixes for starters.

> 
> Signed-off-by: Pierluigi Passaro <pierluigi.p@variscite.com>
> Signed-off-by: Alifer Moraes <alifer.m@variscite.com>
> ---
>  .../devicetree/bindings/sound/wm8904.txt      |  53 ++++++++
>  sound/soc/codecs/wm8904.c                     | 113 +++++++++++++++++-

Binding changes go in their own patches.
