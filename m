Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 539422A709F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Nov 2020 23:36:29 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRM2L1GVszDqjy
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 09:36:26 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRM0N4k6jzDqXS
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Nov 2020 09:34:44 +1100 (AEDT)
Received: by mail-ot1-f67.google.com with SMTP id g19so250533otp.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 04 Nov 2020 14:34:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=De/asBW+7ACsxJA0V0dI5OfXqmfuP7smHiv8mpwjXZ0=;
 b=Lxh127BIuc8DB8wcNEGC/Or3JtI5CwC9RzDHcQaDRic0af07yRrltR7SQ4S34GB2lS
 kzUr3YGjsoJ6tlmSpAsVtl7I8SZnuurj6sb97481ONxoIIw/dALen3kGS6YUU/nbPPHl
 YZLOeJucinc2STw1lMUE0PoSMq/ffU3IG1+AoK/Hso026G+ZfLuBLfhMih2O+u/gzFIr
 Aq/bjEsw6ueDl6yUt62jHDxm/eWGjYkfmfXpdY2zBkLKWg62h+MtdJbojLDOcC0XJRex
 l2vZkUFPJPPFwA2m1POZ+NPPsjmkCSVKctyBYDKqhdF4EzcXp3JFhZ4RgcImXPttXxww
 oD5A==
X-Gm-Message-State: AOAM531WwSg3uU8OCeYKCVoyjjLCbXrUZtTpoU9I/OQBdcGKNciYQYT9
 bp/J25WtrAXkZ1MrCVKEBQ==
X-Google-Smtp-Source: ABdhPJydVci5YTxHwBge3dnN274lTktXyAPo9XcUv0uObEVs8L/tBdqo/1r1n3NVYXAsKnCx7SfmbA==
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr19441014otr.303.1604529281700; 
 Wed, 04 Nov 2020 14:34:41 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id t83sm789898oie.58.2020.11.04.14.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Nov 2020 14:34:41 -0800 (PST)
Received: (nullmailer pid 48871 invoked by uid 1000);
 Wed, 04 Nov 2020 22:34:40 -0000
Date: Wed, 4 Nov 2020 16:34:40 -0600
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-ID: <20201104223440.GA48821@bogus>
References: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1604281947-26874-1-git-send-email-shengjiu.wang@nxp.com>
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
 Xiubo.Lee@gmail.com, festevam@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com, broonie@kernel.org,
 perex@perex.cz, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 02 Nov 2020 09:52:26 +0800, Shengjiu Wang wrote:
> AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> IP module found on i.MX8MP.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v3:
> - Add additionalProperties
> 
> changes in v2:
> - fix indentation issue
> - remove nodename
> 
>  .../bindings/sound/fsl,aud2htx.yaml           | 66 +++++++++++++++++++
>  1 file changed, 66 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
