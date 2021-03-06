Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B857B32FD25
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 21:36:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DtGbv4S1Sz3dJt
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Mar 2021 07:36:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.216.41; helo=mail-pj1-f41.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com
 [209.85.216.41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DtGbZ6zvBz2xxw
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Mar 2021 07:36:25 +1100 (AEDT)
Received: by mail-pj1-f41.google.com with SMTP id
 nh23-20020a17090b3657b02900c0d5e235a8so1022964pjb.0
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Mar 2021 12:36:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kxst1hG7ALyCmuPlQ7JFD7SMZloRyR6/yTfXMK8W7T0=;
 b=Q1WdDMhEW3Kq5DbuNmNMNaKOyohPvq6d4tQeRhlN4GCja3wktujKsY7hBSHVp1Z6en
 6ysgCIkqQaNrGski/tBmlHZP5KsS3r1sqnugTqk2QLvMWaL3YMT2ADkIY0gOuF1Ykj+b
 xlE9KixlkhJx1J1FhxoPph8urFrVwTPff8AZrL985Wrhtbumr7mkqdOb9Fa3SsV8bjf6
 Is+ls/0/1/z0RoY77jWdZpxD2Nb1eQK9Sj6GcckojFDl4nclNN8z3JW/UXfn+I/+Mz/w
 Jxl5vbObX8hzum1PTfAVR7MZLPIoaOJjKRt7tjf4Reo3/j20IDqLVurPS41s4TLVVRHI
 SNgw==
X-Gm-Message-State: AOAM532sgarROCw6aEch1kVNvrJG3QSp3cmmc8HgLI2OL5NS3vaAph/i
 WgF04ifDZpX4hePfjfqPgw==
X-Google-Smtp-Source: ABdhPJz0P+6rkvVUSXxTrcwxqhCKO6b8X5k2tVKedc0iXxGFF8nD+HcxsXL0EuR95YHQZyqlJKMczg==
X-Received: by 2002:a17:90b:809:: with SMTP id
 bk9mr16677761pjb.83.1615062983602; 
 Sat, 06 Mar 2021 12:36:23 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.27.98])
 by smtp.gmail.com with ESMTPSA id t22sm6300886pjw.54.2021.03.06.12.36.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 06 Mar 2021 12:36:22 -0800 (PST)
Received: (nullmailer pid 1172590 invoked by uid 1000);
 Sat, 06 Mar 2021 20:36:17 -0000
Date: Sat, 6 Mar 2021 13:36:17 -0700
From: Rob Herring <robh@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH v3 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
Message-ID: <20210306203617.GA1164939@robh.at.kernel.org>
References: <1614221563-26822-1-git-send-email-shengjiu.wang@nxp.com>
 <1614221563-26822-8-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1614221563-26822-8-git-send-email-shengjiu.wang@nxp.com>
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
 lgirdwood@gmail.com, linuxppc-dev@lists.ozlabs.org, Xiubo.Lee@gmail.com,
 linux-kernel@vger.kernel.org, tiwai@suse.com, nicoleotsuka@gmail.com,
 broonie@kernel.org, perex@perex.cz, festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 25, 2021 at 10:52:43AM +0800, Shengjiu Wang wrote:
> Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> core. The Cortex-M core will control the audio interface, DMA and audio
> codec, setup the pipeline, the audio driver on Cortex-A core side is just
> to communitcate with M core, it is a virtual sound card and don't touch
> the hardware.

This sounds like 1 h/w block (the interface to the cortex-M), your DT 
should be 1 node. If you need 2 drivers to satisfy the needs of the OS, 
then instantiate one device from the other device's driver.

Rob
