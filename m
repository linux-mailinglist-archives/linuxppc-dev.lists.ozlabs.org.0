Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD9A7D87EC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 19:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGYTK146jz3cbB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 04:59:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.161.50; helo=mail-oo1-f50.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGYSn1Q3fz300g
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 04:58:47 +1100 (AEDT)
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-586a516755aso586993eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 10:58:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698343124; x=1698947924;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8z1yGiJBBI9AoK8qoFUV3Ia7kjAwo9PR+/1kimU+UtM=;
        b=eALLInabW4ZxynloMImgHW3nt+nEbziY4zJ3yTmdAPJBcR/UwOCxcXnzQkHnwDlUg1
         NpRGHE6j0KNVOcJ/1xTszRs6XwYil6s2US0Iuz7roQjDvFIHKbgXMwwEka3MwG4qKniu
         90D8aLAzXgIQr8vsDVS92rE1l7qyX0hU+QF2EQTUeKEVe/XC3IE0e8US6UBbp6sM/qgx
         HvYzv3VDKnYfDib9DyEiM0DTJUDmOR4mygJuOJE2B9idsF3o4Hl7RuoM37DRLooMmxap
         OjDntZB2MFyckb7dkpXeGB7I9BZFm2g2TychcGzGaF0qhYU/jlGMftoYywXeebD8zk6O
         c72g==
X-Gm-Message-State: AOJu0YybDC7j/2OhssOrH7TuCsI0oNH52HlNgjJ/giNkJnDgBMjRmAJu
	lOyNs2+34joDxNOW0xmUcA==
X-Google-Smtp-Source: AGHT+IHr9EOYODQ6j0BtriylyMdcCEFd57N1ORR/U0SxrpWPOj4Kh9FB988mGZIYTgeXUar4RzptMg==
X-Received: by 2002:a05:6870:10d4:b0:1e9:eb35:c548 with SMTP id 20-20020a05687010d400b001e9eb35c548mr313657oar.6.1698343124249;
        Thu, 26 Oct 2023 10:58:44 -0700 (PDT)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v24-20020a056830141800b006ce3241a7fasm2740604otp.72.2023.10.26.10.58.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 10:58:43 -0700 (PDT)
Received: (nullmailer pid 4107072 invoked by uid 1000);
	Thu, 26 Oct 2023 17:58:42 -0000
Date: Thu, 26 Oct 2023 12:58:42 -0500
From: Rob Herring <robh@kernel.org>
To: Chancel Liu <chancel.liu@nxp.com>
Subject: Re: [PATCH v4 1/2] ASoC: dt-bindings: sound-card-common: List sound
 widgets ignoring system suspend
Message-ID: <20231026175842.GA4101469-robh@kernel.org>
References: <20231023020718.1276000-1-chancel.liu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231023020718.1276000-1-chancel.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, alsa-devel@alsa-project.org, Xiubo.Lee@gmail.com, festevam@gmail.com, s.hauer@pengutronix.de, tiwai@suse.com, lgirdwood@gmail.com, perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org, shengjiu.wang@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 23, 2023 at 10:07:17AM +0800, Chancel Liu wrote:
> Add a property to list audio sound widgets which are marked ignoring
> system suspend. Paths between these endpoints are still active over
> suspend of the main application processor that the current operating
> system is running.

Perhaps it would be better to define components used for low power 
audio rather than the OS mode that gets used. Isn't LPA just audio 
handling that doesn't require the OS CPU to be involved? So the state of 
the CPU is kind of orthogonal.

Rob
