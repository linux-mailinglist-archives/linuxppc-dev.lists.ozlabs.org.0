Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 217492A86C9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Nov 2020 20:07:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CRtLr3Zr9zDr7N
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Nov 2020 06:07:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.194;
 helo=mail-oi1-f194.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com
 [209.85.167.194])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CRtKC1XvpzDr5j
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Nov 2020 06:06:04 +1100 (AEDT)
Received: by mail-oi1-f194.google.com with SMTP id w145so2786623oie.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 05 Nov 2020 11:06:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=5TdTBo8+xhg1iEq7AD8ddCfAOVpH58Ab88MfiBQ3Rdo=;
 b=twyWFzAcUFvNtYOcep1s+LeCraV8YZFd35i9rCLOLaHLPxm2eu0ybPR4gZ62OuqYLN
 mDQsCEy/t9O/zW5U/+SivMj6FRwXXKbEXW+7NW/KaycbZahkm12kBGGOSTAmDoKsgZNh
 6vxRJzdjK+90rKgvRR7MSDsWc1/UY0U8pjBjuRJZl/xws0wBN9zPC/NCGBstcrosuO+g
 IDAZ9XF/2/MedZJNEM6sKnxiEF35O7XdjfmvG+w9FtgPOlNLc/I3U/8myUV9wAdC6EgH
 XqdNU2pZWBQFG8WxfUcx8zun4lxXOTaEWapE4hA4nPYDux6f9mkYB/kVda6aTmmoAfdE
 cU1A==
X-Gm-Message-State: AOAM532YuOiKro4kZ+RRAds1xIpkr6ZP7/xok6p0qGPfeqQVoBVc3Qzp
 TlfU8iaFH5+HArBL3ePCzg==
X-Google-Smtp-Source: ABdhPJzvEnno8CWZseyI+f28L7rppStqqjiyCy/Xq1WHbvbGfPOCft3nRAzqjzbuvTpHPXVpCAM3gg==
X-Received: by 2002:aca:4257:: with SMTP id p84mr556542oia.68.1604603161729;
 Thu, 05 Nov 2020 11:06:01 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id h4sm537209oot.45.2020.11.05.11.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 11:06:01 -0800 (PST)
Received: (nullmailer pid 1643637 invoked by uid 1000);
 Thu, 05 Nov 2020 19:06:00 -0000
Date: Thu, 5 Nov 2020 13:06:00 -0600
From: Rob Herring <robh@kernel.org>
To: Laurentiu Tudor <laurentiu.tudor@nxp.com>
Subject: Re: [PATCH 1/2] dt-bindings: misc: convert fsl, dpaa2-console from
 txt to YAML
Message-ID: <20201105190600.GA1643395@bogus>
References: <20201105141114.18161-1-laurentiu.tudor@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201105141114.18161-1-laurentiu.tudor@nxp.com>
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
Cc: devicetree@vger.kernel.org, corbet@lwn.net, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, leoyang.li@nxp.com,
 robh+dt@kernel.org, ioana.ciornei@nxp.com,
 Ionut-robert Aron <ionut-robert.aron@nxp.com>, kuba@kernel.org,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 05 Nov 2020 16:11:13 +0200, Laurentiu Tudor wrote:
> From: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> 
> Convert fsl,dpaa2-console to YAML in order to automate the
> verification process of dts files.
> 
> Signed-off-by: Ionut-robert Aron <ionut-robert.aron@nxp.com>
> Signed-off-by: Laurentiu Tudor <laurentiu.tudor@nxp.com>
> ---
>  .../bindings/misc/fsl,dpaa2-console.txt       | 11 ---------
>  .../bindings/misc/fsl,dpaa2-console.yaml      | 23 +++++++++++++++++++
>  2 files changed, 23 insertions(+), 11 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.txt
>  create mode 100644 Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml: 'additionalProperties' is a required property
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml: ignoring, error in schema: 
warning: no schema found in file: ./Documentation/devicetree/bindings/misc/fsl,dpaa2-console.yaml


See https://patchwork.ozlabs.org/patch/1395015

The base for the patch is generally the last rc1. Any dependencies
should be noted.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

