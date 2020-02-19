Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D9AA165023
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Feb 2020 21:38:36 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48N8gs3s7HzDqSQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 07:38:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.67; helo=mail-ot1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48N8fH50BHzDqGx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 07:37:11 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id r27so1468770otc.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Feb 2020 12:37:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=+AqBZPuPGulRkYz04Uc64jE9ynggKm16TfsBQmv6si8=;
 b=GXUUJEdPFRMXvG+4uVhAdeGTlQGml/gQHS5yQgBBTBSkzc/4P0tWh5wh+kXomvF3WN
 c+/TzWc9HNdWdX/gljdkFbQ+KzOVfxm1DsjOiFg+kePblgCVC/PyZE3MGEThd+PdO38g
 uIBaR7jb7xGlpdvfdHt61aBPwM8CZrUvGo1qSvkTfb+BtYfbvxX/x34VTNisytVT88f8
 Wrqui/iwy3aGXpZXSi7mbpk41n9TYkrbI2eoUVRq5g35hzFmhp2yS9ouH/sd+0WzN3wI
 zdc8eVdAaVv9GGXM4UNXdl4ZcKUqFss9s3W4VAxLnV63BB7pSCKAal+zYpg55Bv+qeqw
 GTXw==
X-Gm-Message-State: APjAAAXLrvhhobx7SQ5GUwn2Gpv1KLnlc/1EAa2uKJncm1A9itBcvrHh
 gtME4WCmiAkAv3hps8SP2g==
X-Google-Smtp-Source: APXvYqwXHqdPF0eGfWGHZFMcj2qYo0Y8tJNnbLJqbB+BFR7YXs5aR7a2j8huyc4ZAUmLqR7q9DjA/w==
X-Received: by 2002:a9d:67d7:: with SMTP id c23mr21034247otn.262.1582144628599; 
 Wed, 19 Feb 2020 12:37:08 -0800 (PST)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n17sm282683otq.46.2020.02.19.12.37.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2020 12:37:07 -0800 (PST)
Received: (nullmailer pid 27543 invoked by uid 1000);
 Wed, 19 Feb 2020 20:37:06 -0000
Date: Wed, 19 Feb 2020 14:37:06 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: fsl_easrc: Add document for
 EASRC
Message-ID: <20200219203706.GA25618@bogus>
References: <cover.1582007379.git.shengjiu.wang@nxp.com>
 <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a02af544c73914fe3a5ab2f35eb237ef68ee29e7.1582007379.git.shengjiu.wang@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 perex@perex.cz, nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 18, 2020 at 02:39:36PM +0800, Shengjiu Wang wrote:
> EASRC (Enhanced Asynchronous Sample Rate Converter) is a new
> IP module found on i.MX8MN.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  .../devicetree/bindings/sound/fsl,easrc.txt   | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,easrc.txt

Bindings are now in DT schema format. See 
Documentation/devicetree/writing-schema.rst.

