Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D480E3BCA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Oct 2019 21:05:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46zcCJ6zjDzDqbX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 25 Oct 2019 06:05:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=buserror.net
 (client-ip=165.227.176.147; helo=baldur.buserror.net;
 envelope-from=oss@buserror.net; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=buserror.net
Received: from baldur.buserror.net (baldur.buserror.net [165.227.176.147])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46zbY93qkNzDqLw
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 25 Oct 2019 05:36:12 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1iNhve-0007jA-Qd; Thu, 24 Oct 2019 13:33:47 -0500
Message-ID: <ef150e9eb155eff410194ba5362ef404ce117c4a.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Ran Wang <ran.wang_1@nxp.com>, "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Rob Herring <robh+dt@kernel.org>, Li Yang <leoyang.li@nxp.com>, Mark
 Rutland <mark.rutland@arm.com>,  Pavel Machek <pavel@ucw.cz>
Date: Thu, 24 Oct 2019 13:33:45 -0500
In-Reply-To: <20191021034927.19300-2-ran.wang_1@nxp.com>
References: <20191021034927.19300-1-ran.wang_1@nxp.com>
 <20191021034927.19300-2-ran.wang_1@nxp.com>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: ran.wang_1@nxp.com, rjw@rjwysocki.net, robh+dt@kernel.org,
 leoyang.li@nxp.com, mark.rutland@arm.com, pavel@ucw.cz, biwen.li@nxp.com,
 len.brown@intel.com, devicetree@vger.kernel.org, gregkh@linuxfoundation.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
X-SA-Exim-Mail-From: oss@buserror.net
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on baldur.localdomain
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 GREYLIST_ISWHITE autolearn=ham autolearn_force=no version=3.4.2
X-Spam-Report: * -1.0 ALL_TRUSTED Passed through trusted hosts only via SMTP
 *  -15 BAYES_00 BODY: Bayes spam probability is 0 to 1%
 *      [score: 0.0000]
 * -1.5 GREYLIST_ISWHITE The incoming server has been whitelisted for
 *      this recipient and sender
Subject: Re: [PATCH v7 2/3] Documentation: dt: binding: fsl: Add
 'little-endian' and update Chassis define
X-SA-Exim-Version: 4.2.1 (built Tue, 02 Aug 2016 21:08:31 +0000)
X-SA-Exim-Scanned: Yes (on baldur.buserror.net)
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
Cc: Li Biwen <biwen.li@nxp.com>, Len Brown <len.brown@intel.com>,
 devicetree@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2019-10-21 at 11:49 +0800, Ran Wang wrote:
> By default, QorIQ SoC's RCPM register block is Big Endian. But
> there are some exceptions, such as LS1088A and LS2088A, are
> Little Endian. So add this optional property to help identify
> them.
> 
> Actually LS2021A and other Layerscapes won't totally follow Chassis
> 2.1, so separate them from powerpc SoC.

Did you mean LS1021A and "don't" instead of "won't", given the change to the
examples?

> Change in v5:
> 	- Add 'Reviewed-by: Rob Herring <robh@kernel.org>' to commit message.
> 	- Rename property 'fsl,#rcpm-wakeup-cells' to '#fsl,rcpm-wakeup-
> cells'.
> 	please see https://lore.kernel.org/patchwork/patch/1101022/

I'm not sure why Rob considers this the "correct form" -- there are other
examples of the current form, such as ibm,#dma-address-cells and ti,#tlb-
entries, and the current form makes more logical sense (# is part of the
property name, not the vendor).  Oh well.

> Required properites:
>    - reg : Offset and length of the register set of the RCPM block.
> -  - fsl,#rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
> +  - #fsl,rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
>  	fsl,rcpm-wakeup property.
>    - compatible : Must contain a chip-specific RCPM block compatible string
>  	and (if applicable) may contain a chassis-version RCPM compatible
> @@ -20,6 +20,7 @@ Required properites:
>  	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
>  	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
>  	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
> +	* "fsl,qoriq-rcpm-2.1+": for chassis 2.1+ rcpm

Is there something actually called "2.1+"?  It looks a bit like an attempt to
claim compatibility with all future versions.  If the former, is it a name
that comes from the hardware side with an intent for it to describe a stable
interface, or are we later going to see a patch changing some by-then-existing 
device trees from "2.1+" to "2.1++" when some new incompatibility is found?

Perhaps it would be better to bind to the specific chip compatibles.

-Scott


