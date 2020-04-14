Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 99F921A70B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 03:55:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491T8K0RwnzDqG1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 11:55:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::644;
 helo=mail-pl1-x644.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=OCvhU4O/; dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 491T5G2FgzzDqHY
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 11:52:33 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id h11so4078263plr.11
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 18:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ueS8P+6v2FrlXivoVjNe19uVCUfAZxgQePy2A4X+RsE=;
 b=OCvhU4O/qcMY2FRjZ40rJkFvcFiCnnlXdwpTxot5wBOLYRNgpnFCHbxz852a6MeIj4
 NPa5mtPY5kIIvICQIRdv37OLe4jCCFm8PShYINo9ATeH1KlDDfWsZ63+QG4jZNNEo+JT
 ZyYXrSwFwjTBYt3Q7xqkXtfvZ6bICTCH9ANVE52aI2sjgtoMB7gTeo1rGz6wLMQK2Pi3
 HPAAtEEsaclya5CZ9i66SK7RRcTQNe54wG7Z76wzS/QaxaFwFWDD4Am8L5ZsOUjDswix
 rdZ6h8419sEHgMfFI4g0w+/ucUvgIoU75+jPx9MwFrekVFL1Z78EFnshuf0yOivCZApK
 7YSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ueS8P+6v2FrlXivoVjNe19uVCUfAZxgQePy2A4X+RsE=;
 b=Zxps4Od9BF8JFox+W73cphkNl2vKa7RBlcbrnP6shuGqxxPY4I2ESQkGpBjsi0CZz4
 7ht3dkizhJR8c6yh3K68R0iWfOhsNu2DXOi1lXsNF/kMktSmg7A07eFQXSn5qnGZkNqD
 zY26Am6PSMdUnl2ok4XcOJMEsfMzH73C4Mv0m/omYI/L0KplV1dornJkVxP8UvzvJPSD
 TlVdpofZkiQKVVftJpGO00urSXFd+7kWUCoDQn+OEQloBCYSzBD18Za3mmXj/sHwciei
 QZiH9t2f79Aj207g6zwK7jbXWBK/ogbO06fVGnCEHYX+iYzhZPz4z3tM6i3Jiw4txdW9
 AHFg==
X-Gm-Message-State: AGi0PuZm10jvXSN3eFfp4woWNHh3E3tzaxuuQ6KFDr07qc/VxLjcHTim
 thsYI69yezs4XBvVtsIdUqo=
X-Google-Smtp-Source: APiQypLV5A3zPqygKILoFJrzU50eijbeEVBpOWKiwDq2bSqyS0pUFarFX0qGCERIK8ocAccEOj2a5A==
X-Received: by 2002:a17:90a:252f:: with SMTP id
 j44mr16076039pje.9.1586829149030; 
 Mon, 13 Apr 2020 18:52:29 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x12sm2242431pfq.209.2020.04.13.18.52.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Apr 2020 18:52:28 -0700 (PDT)
Date: Mon, 13 Apr 2020 18:52:37 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v7 4/7] ASoC: fsl_asrc: Support new property
 fsl,asrc-format
Message-ID: <20200414015235.GA10195@Asurada-Nvidia.nvidia.com>
References: <cover.1586747728.git.shengjiu.wang@nxp.com>
 <d10df72d2e9985fede7969b5da1f579627f5e821.1586747728.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d10df72d2e9985fede7969b5da1f579627f5e821.1586747728.git.shengjiu.wang@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, tiwai@suse.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, perex@perex.cz, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Apr 14, 2020 at 08:43:06AM +0800, Shengjiu Wang wrote:
> In order to align with new ESARC, we add new property fsl,asrc-format.
> The fsl,asrc-format can replace the fsl,asrc-width, driver
> can accept format from devicetree, don't need to convert it to
> format through width.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
