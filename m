Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DDC20687A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 01:34:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49s2fr2nnwzDqVr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 09:34:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=D3PrKqtt; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49s2bZ71slzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 09:31:21 +1000 (AEST)
Received: by mail-pf1-x443.google.com with SMTP id z63so188395pfb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jun 2020 16:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v2em8WufMe/XzcJqk7YFYQSWFx3qyHpDXzQPwunL4Mg=;
 b=D3PrKqttTaVJOmY8IJl9a74nK+vT3bB73vbRbEdADkSzTBJXKcW90YspYntqCqaJhL
 flrsd1SDjQCLrku8MvQ8ffq7WXYKSRZGpOZpkpo4jBmp8mt/S8qVrp+WIcjXLAe7m0ko
 4hPR6azoWVRP2H3o0QL67neEJZtUvscXqKhJetbfR1waX4Kr21d6Tx5UyWIuFiUn+ggZ
 pTTL8voMO9NWKPC/PhYy0SE0gPC1rE8w+3Sqkep5YwkwTRzpzrIJvD7ap/isv8xDIIkP
 3kgds5X7zJ30Hkne7cgO5PxcccR7DALNDjVPC5qn7FL9r/9FD7K39kmsydeCkzj2aDJ8
 pErw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v2em8WufMe/XzcJqk7YFYQSWFx3qyHpDXzQPwunL4Mg=;
 b=C/DBY6lb30o6VBGcH1Kqdp5exzsZQrwdSWquu5KCNAui5X87IXqxKjrUy0oseoPdew
 PVKgBlk/f7FulHsCxwMN/Mc0jgArd+v7gratKXoQs9zuBqsqzCSOdC+ZOg39Fulvi5LW
 F085bVX/dTUFvT5Ks2ohWGCQvx3Dnk0rH1UNoP7DrIs4rUgO1V/veS23GuR/jCWRsx0N
 l0HqoZwBv2zV0CKv1Umch/eX84d9iuQ7EcvHBfQ+Q4znD1LezRWcpn6YFnjutKLCZtlR
 jF7F7Cl1/PZf4QWwjVwKVrTrHTEjxyAh2Ns48dwCAYWbjPeVveIt+1xNauN/iRK2D1JP
 QgzQ==
X-Gm-Message-State: AOAM532XFWm9H09YWsyhhQheWtdm46MIerSOfEDB0txuyzVVlN/SEaUa
 8+2wr5wHtKbXE3HUpKWtTZU=
X-Google-Smtp-Source: ABdhPJygTOv/K578Nfi+keQ7SWHWmMxiyqT1qgqh4PY1PWO2ZBzG5y01Ax6vFA6ckUG9CyH3gxpZZw==
X-Received: by 2002:a63:531a:: with SMTP id h26mr19943514pgb.188.1592955078526; 
 Tue, 23 Jun 2020 16:31:18 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n62sm3651622pjb.42.2020.06.23.16.31.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 23 Jun 2020 16:31:18 -0700 (PDT)
Date: Tue, 23 Jun 2020 16:30:51 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: bindings: fsl-asoc-card: Add compatible string
 for wm8524
Message-ID: <20200623233050.GA28062@Asurada-Nvidia>
References: <1592895167-30483-1-git-send-email-shengjiu.wang@nxp.com>
 <1592895167-30483-2-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1592895167-30483-2-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 23, 2020 at 02:52:47PM +0800, Shengjiu Wang wrote:
> In order to support wm8524 codec with fsl-asoc-card machine
> driver, add compatible string "fsl,imx-audio-wm8524".
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
