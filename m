Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4168B274F0B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 04:34:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bx2Lp5DrPzDqXR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Sep 2020 12:34:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.166.67; helo=mail-io1-f67.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
 [209.85.166.67])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bx2Jn5dXtzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Sep 2020 12:32:40 +1000 (AEST)
Received: by mail-io1-f67.google.com with SMTP id g7so22003209iov.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 19:32:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=NGynl9EWnOYAjqDciOCA1ZUmBatnlfsqNrenSSV7b/k=;
 b=rkv98+dTN+e49p/X44e8DP0kMrwyF3jL0TacVF1bpSS9nHOeF3lvxMSogbL1BoHDR3
 +lSqpHsbA9u3kU9nQmEsjOHERr+rx7Xa7N2ROwZ8gxfa8H9nl+8/wNrRcYY+Nram3jq6
 wxOViKk2nqSURovUEygcroT1wln+vHesDzS41udxIkoE8OKpWdy6LFGvk2qQZowOq09n
 bHOWOMvpH80p/Qyt9cUXjUy95Yu53FJixBune4Ad1/FYTeeTAAKETjvjG9raxE00B0QA
 hfctpt8nxHZnbc1GoXHqubvKYd4cKXTFsI8P/enXgGWQpLgt1ts/2+C8Rxb0r7rGb10b
 Rsrg==
X-Gm-Message-State: AOAM531eqZIvVoze+vugIj+31hk1vcb6iycNrPJkjJgaWnkVvfN75sI6
 gilUdW2vx429rcDHfiKAGQ==
X-Google-Smtp-Source: ABdhPJwDBV73yoy/NurZgFoVlMxMgxpqZZdAPMmS9hFuMK14aR/cjZ35OgXoJnXbYTzujz370Sa9PQ==
X-Received: by 2002:a6b:d606:: with SMTP id w6mr5542172ioa.89.1600828356037;
 Tue, 22 Sep 2020 19:32:36 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id j77sm10301353ili.31.2020.09.22.19.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 19:32:35 -0700 (PDT)
Received: (nullmailer pid 3757322 invoked by uid 1000);
 Wed, 23 Sep 2020 02:32:34 -0000
Date: Tue, 22 Sep 2020 20:32:34 -0600
From: Rob Herring <robh@kernel.org>
To: Ran Wang <ran.wang_1@nxp.com>
Subject: Re: [PATCH 1/5] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Message-ID: <20200923023234.GA3751572@bogus>
References: <20200916081831.24747-1-ran.wang_1@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916081831.24747-1-ran.wang_1@nxp.com>
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
Cc: devicetree@vger.kernel.org, Biwen Li <biwen.li@nxp.com>,
 Shawn Guo <shawnguo@kernel.org>, linux-kernel@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 16, 2020 at 04:18:27PM +0800, Ran Wang wrote:
> From: Biwen Li <biwen.li@nxp.com>
> 
> The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata A-008646
> on LS1021A
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> Signed-off-by: Ran Wang <ran.wang_1@nxp.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/rcpm.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> index 5a33619..1be58a3 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -34,6 +34,11 @@ Chassis Version		Example Chips
>  Optional properties:
>   - little-endian : RCPM register block is Little Endian. Without it RCPM
>     will be Big Endian (default case).
> + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware issue
> +   on SoC LS1021A and only needed on SoC LS1021A.
> +   Must include 2 entries:
> +   The first entry must be a link to the SCFG device node.
> +   The 2nd entry must be offset of register IPPDEXPCR1 in SCFG.

You don't need a DT change for this. You can find SCFG node by its 
compatible string and then the offset should be known given this issue 
is only on 1 SoC.

Rob
