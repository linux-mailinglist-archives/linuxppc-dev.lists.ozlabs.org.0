Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C49293056
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Oct 2020 23:16:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFV0y61w5zDqbr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 08:16:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.68; helo=mail-ot1-f68.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFTyz2zJJzDqNs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 08:14:17 +1100 (AEDT)
Received: by mail-ot1-f68.google.com with SMTP id f37so1123361otf.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Oct 2020 14:14:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AkXg9ywvkN5UzvdgIWgHzBaGiXjXW0zCY62KlslqE20=;
 b=gzKPiTQXyjfH4abknyM2BpqfCPvPT8JHXkECK/PsC39UmY0+YIdk1gXy2SCrIargk9
 7Yj7g3UJ3M0PxxI5h9buXTDBXdzc0m/Q4Xc7sreUrqiS63hSuqRIMGwl+1U/jIMC54Od
 0LGtcFo2cZ0T2L1zO5AKuronXoE78/kotCn1A0Ko9TisJ0MB3VF3Mlr2bfy/vLoX8fe2
 iZ2xUpoLwjxPt3fDjMtDfj1sOHKngB3sgogrnGlPy5gzEw3HFcZWXt+8EOOVVXIwEf9A
 Ace/PKmb2fn7ngYB9Q1/y5HlZanPGiugHvCWQ6He8gSm5PllBm7jQQ6Xa6Y5DZAa71zZ
 wI9A==
X-Gm-Message-State: AOAM533UcaMKlHkKbXNkjgPFw2+OYApXqnNeCBOeoIMyiHlVbQGqWKsO
 gGIG6ikyiNjB/P9niWwZFw==
X-Google-Smtp-Source: ABdhPJySWGj+x0Hi8zbrlVaFg82BBb5KUi35oGG9P+zK3XUXlyw0S3QakYsFzPn0pzs9rO9TYNDsEg==
X-Received: by 2002:a9d:65d7:: with SMTP id z23mr1380659oth.131.1603142054307; 
 Mon, 19 Oct 2020 14:14:14 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id v11sm221060otj.73.2020.10.19.14.14.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:14:13 -0700 (PDT)
Received: (nullmailer pid 3612712 invoked by uid 1000);
 Mon, 19 Oct 2020 21:14:12 -0000
Date: Mon, 19 Oct 2020 16:14:12 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: fsl_spdif: Add new compatible
 string for i.MX8QM
Message-ID: <20201019211412.GA3612681@bogus>
References: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1602739728-4433-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org, timur@kernel.org,
 Xiubo.Lee@gmail.com, festevam@gmail.com, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 15 Oct 2020 13:28:47 +0800, Shengjiu Wang wrote:
> Add new compatible string "fsl,imx8qm-spdif" for supporting spdif
> module on i.MX8QM.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  Documentation/devicetree/bindings/sound/fsl,spdif.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
