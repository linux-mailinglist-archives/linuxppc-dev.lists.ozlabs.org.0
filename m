Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4758D5B61E5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 21:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MRHK52KwJz3c7k
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Sep 2022 05:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.160.47; helo=mail-oa1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=<UNKNOWN>)
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com [209.85.160.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MRHJg55TVz2y8L
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Sep 2022 05:50:43 +1000 (AEST)
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-1225219ee46so26280223fac.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 12:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=jjFDAUThbN7vtt9vwux7lJlDSmQyMgvdlrM38fRSRUY=;
        b=ebat6gyWwevjPIiVMtDbH/Em67M4G7Ot0jOHhiS9sxVhpZsbvb1wK0dLLiruCicTsb
         bJWDd7vPNRa3ta6uvwdoYuhletLqsQdw1/nW6aHXkrgGRimiGQeVsaQ9nKsVneKSeMQ7
         NISCcgGAL8JTvnuu4yktCNTlnIcyy93ClXY3Pc8HgArARw33thtljAlMYfTSAFl4jDGa
         8YiVGvuodlpmHIisbnFCjiRW0hI2W19Nm4b/CCU8J0HJghTXHNCtMf3KhNuMGuSSA6e+
         REKLBrO42vDR5Len1TK2bi1IVpHGi/4LazDynctBxGpYrzYg2QUl5A9lTjovTYNcDV6u
         RTSA==
X-Gm-Message-State: ACgBeo10oWDQH3ccs/INOaCioUUCS+QCsczYQS131xYQJOE/JZweMRjk
	VCCtRtfi6guFJBaQhgk/EQ==
X-Google-Smtp-Source: AA6agR4nvSs6/oyD1FOnWfMit5/ozmUIVsykwr6OJnIJD+tWOiEEiRnvXwBzhpAsAjFY8W5k4NMK6g==
X-Received: by 2002:a54:4e97:0:b0:345:4cd0:20fd with SMTP id c23-20020a544e97000000b003454cd020fdmr3037oiy.206.1663012241170;
        Mon, 12 Sep 2022 12:50:41 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y11-20020a056830208b00b0061c9f9c54e4sm5058643otq.80.2022.09.12.12.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Sep 2022 12:50:40 -0700 (PDT)
Received: (nullmailer pid 1724704 invoked by uid 1000);
	Mon, 12 Sep 2022 19:50:38 -0000
Date: Mon, 12 Sep 2022 14:50:38 -0500
From: Rob Herring <robh@kernel.org>
To: Sean Anderson <sean.anderson@seco.com>
Subject: Re: [PATCH v5 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Message-ID: <20220912195038.GA1724641-robh@kernel.org>
References: <20220902213721.946138-1-sean.anderson@seco.com>
 <20220902213721.946138-4-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220902213721.946138-4-sean.anderson@seco.com>
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linux-phy@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 02 Sep 2022 17:37:16 -0400, Sean Anderson wrote:
> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
> with assigned-clock* to specify a particular frequency to use. For
> example, to set the second PLL (at offset 0x20)'s frequency, use
> LYNX10G_PLLa(1). These are for use only in the device tree, and are not
> otherwise used by the driver.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v5:
> - Update commit description
> - Dual id header
> 
> Changes in v4:
> - New
> 
>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 

Acked-by: Rob Herring <robh@kernel.org>
