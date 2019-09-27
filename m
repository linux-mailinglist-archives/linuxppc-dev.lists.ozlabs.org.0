Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 09162C0A20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Sep 2019 19:17:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46fz4H1VG3zDqwJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Sep 2019 03:17:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=209.85.210.66; helo=mail-ot1-f66.google.com;
 envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com
 [209.85.210.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46fz1D5GMyzDqyn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Sep 2019 03:14:24 +1000 (AEST)
Received: by mail-ot1-f66.google.com with SMTP id o44so2866622ota.10
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Sep 2019 10:14:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=tD2ql8Ol3YdJ0O/cTPgB7oovPA/McdYPrrIyUtCvDio=;
 b=QTCJRRSBDA38fFpyjR5AUkPEQyIYar3raVbMMgPrE7bKVu1BCcTeFVyEIQCCf2Tixg
 mHIYE1OwwN0JW40srLkX4g0OCpj5IzdzhLFR+/olZCdTYcj9UcRzKDzSTOgiR7HOQhiA
 K/2rYPf+I0JZb3rEJ9JoB8qxwEULe+N1tbHlMHJicyk9BSSMCOgiKEMIbzTQXn7aou3w
 0ygImHBO73uSyXhYQ+fHZMZFVk1ZBSlf3eEDb7SVDqZJbDxB/dxS3bD2G25oiH++cYiw
 fzre3+TC+Hvtk5zjY326mUQoXl2TB8o//ddMVcOTU8lGqYmgJ6nP0cM3D631moQ7WeFj
 cEig==
X-Gm-Message-State: APjAAAVCistxU1op8EPJazuukvxaCeVJnVJLTdWUssaD3ui3A/4Bkyo7
 qS/g8BXzzvkpAEMllX3TfA==
X-Google-Smtp-Source: APXvYqypL0vEhdlG4ePe2RIoOH0cqp7SRZ9d2fcberRcnUEis5/CkGDrnlNF5opn3EvvXltDKXa2Uw==
X-Received: by 2002:a05:6830:15d7:: with SMTP id
 j23mr3871347otr.343.1569604461562; 
 Fri, 27 Sep 2019 10:14:21 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 21sm1750040oin.26.2019.09.27.10.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2019 10:14:21 -0700 (PDT)
Date: Fri, 27 Sep 2019 12:14:20 -0500
From: Rob Herring <robh@kernel.org>
To: Biwen Li <biwen.li@nxp.com>
Subject: Re: [v4,3/3] Documentation: dt: binding: fsl: Add
 'fsl,ippdexpcr1-alt-addr' property
Message-ID: <20190927171420.GA28375@bogus>
References: <20190926024118.15931-1-biwen.li@nxp.com>
 <20190926024118.15931-3-biwen.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190926024118.15931-3-biwen.li@nxp.com>
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, shawnguo@kernel.org,
 linux-kernel@vger.kernel.org, leoyang.li@nxp.com, ran.wang_1@nxp.com,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 26, 2019 at 10:41:18AM +0800, Biwen Li wrote:
> The 'fsl,ippdexpcr1-alt-addr' property is used to handle an errata A-008646
> on LS1021A
> 
> Signed-off-by: Biwen Li <biwen.li@nxp.com>
> ---
> Change in v4:
> 	- rename property name
> 	  fsl,ippdexpcr-alt-addr -> fsl,ippdexpcr1-alt-addr
> 
> Change in v3:
> 	- rename property name
> 	  fsl,rcpm-scfg -> fsl,ippdexpcr-alt-addr
> 
> Change in v2:
> 	- update desc of the property 'fsl,rcpm-scfg'
> 
>  .../devicetree/bindings/soc/fsl/rcpm.txt      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> index 5a33619d881d..751a7655b694 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> +++ b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
> @@ -34,6 +34,13 @@ Chassis Version		Example Chips
>  Optional properties:
>   - little-endian : RCPM register block is Little Endian. Without it RCPM
>     will be Big Endian (default case).
> + - fsl,ippdexpcr1-alt-addr : The property is related to a hardware issue
> +   on SoC LS1021A and only needed on SoC LS1021A.
> +   Must include 1 + 2 entries.
> +   The first entry must be a link to the SCFG device node.
> +   The non-first entry must be offset of registers of SCFG.
> +   The second and third entry compose an alt offset address
> +   for IPPDEXPCR1(SCFG_SPARECR8)

If only on 1 SoC, can't all this be implied by "fsl,ls1021a-rcpm"?

Adding a property means you need both a new dtb and kernel to fix the 
errata. Using the compatible string means you only need a new kernel.

>  
>  Example:
>  The RCPM node for T4240:
> @@ -43,6 +50,20 @@ The RCPM node for T4240:
>  		#fsl,rcpm-wakeup-cells = <2>;
>  	};
>  
> +The RCPM node for LS1021A:
> +	rcpm: rcpm@1ee2140 {
> +		compatible = "fsl,ls1021a-rcpm", "fsl,qoriq-rcpm-2.1+";

Both of these compatible strings aren't documented.

> +		reg = <0x0 0x1ee2140 0x0 0x8>;
> +		#fsl,rcpm-wakeup-cells = <2>;
> +
> +		/*
> +		 * The second and third entry compose an alt offset
> +		 * address for IPPDEXPCR1(SCFG_SPARECR8)
> +		 */
> +		fsl,ippdexpcr1-alt-addr = <&scfg 0x0 0x51c>;
> +	};
> +
> +
>  * Freescale RCPM Wakeup Source Device Tree Bindings
>  -------------------------------------------
>  Required fsl,rcpm-wakeup property should be added to a device node if the device
> -- 
> 2.17.1
> 
