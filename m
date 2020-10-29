Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E74E29EFE6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 29 Oct 2020 16:30:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CMTsS0TFMzDqbF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Oct 2020 02:30:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.210.65; helo=mail-ot1-f65.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CMTp63W9XzDqZ3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Oct 2020 02:27:25 +1100 (AEDT)
Received: by mail-ot1-f65.google.com with SMTP id a6so2564914otp.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 29 Oct 2020 08:27:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=YqBVpZJyYpJyhp8SRHdLNd51IEGUo51ZrRSOs/0b7TU=;
 b=gIgyr3qZ6NY/b8ZLOYZiGYeXFkVFnevwnub2llmCvuITBnE0+RevrMknqMRXffuA41
 kH8o/2ZIgUWGpz3LIjtlzMFx67wVkM+2/C9qIu2ta61r/sfFuDXYPL+oaT3H48Dm79DF
 fgdAN4q7AvsQYMZq91vtvy8iNVSeGXk9A+0eNTxVGxK5oTlMsZ9yIT9vQkwIbumub3Vf
 nHB+2zf+JwxDL0Bdz/POMLTp4nhe2g6x77M34uYrfkjHWgyiDazNRUnhIy0Dm2S86kkd
 nG57SW78a8pliNTkXg/BbhvNc9tV4nNCNno1sPxKBHwSOWj0UGLzmUlmhtpoh02RvMvU
 0taQ==
X-Gm-Message-State: AOAM5303gCQXhdg2cph9cK0C8TogZRB0jLHg9K4k/5C729ggEAfxQThI
 V1RTEuOfi4FlGmlo0yc/dg==
X-Google-Smtp-Source: ABdhPJxBNf9vh1Y0QDtx0o5GqcNwyUkqQh3ylRhfQbv8CGPulkDRTiGrhi5y/dY64xZLdbWygxh2mw==
X-Received: by 2002:a05:6830:155a:: with SMTP id
 l26mr3438506otp.88.1603985242687; 
 Thu, 29 Oct 2020 08:27:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id f142sm688509oib.10.2020.10.29.08.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Oct 2020 08:27:21 -0700 (PDT)
Received: (nullmailer pid 1902942 invoked by uid 1000);
 Thu, 29 Oct 2020 15:27:21 -0000
Date: Thu, 29 Oct 2020 10:27:21 -0500
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: dt-bindings: fsl_aud2htx: Add binding doc
 for aud2htx module
Message-ID: <20201029152721.GB1901783@bogus>
References: <1603877930-10553-1-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603877930-10553-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 lgirdwood@gmail.com, broonie@kernel.org, tiwai@suse.com,
 linux-kernel@vger.kernel.org, perex@perex.cz, nicoleotsuka@gmail.com,
 robh+dt@kernel.org, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 28 Oct 2020 17:38:49 +0800, Shengjiu Wang wrote:
> AUD2HTX (Audio Subsystem TO HDMI TX Subsystem) is a new
> IP module found on i.MX8MP.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
> changes in v2:
> - fix indentation issue
> - remove nodename
> 
>  .../bindings/sound/fsl,aud2htx.yaml           | 64 +++++++++++++++++++
>  1 file changed, 64 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/sound/fsl,aud2htx.yaml


See https://patchwork.ozlabs.org/patch/1389813

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

