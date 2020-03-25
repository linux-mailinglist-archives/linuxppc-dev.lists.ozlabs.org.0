Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2267B191EDF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 03:15:27 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48nBXp1DxGzDqgj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Mar 2020 13:15:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48nBV96blDzDqb9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Mar 2020 13:13:05 +1100 (AEDT)
Received: from [2601:449:8480:af0:12bf:48ff:fe84:c9a0]
 by baldur.buserror.net with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.89) (envelope-from <oss@buserror.net>)
 id 1jGvSx-0004so-1k; Tue, 24 Mar 2020 21:08:23 -0500
Message-ID: <81c68751cb89bbff13a09467b94530a555d69552.camel@buserror.net>
From: Scott Wood <oss@buserror.net>
To: Michael Ellerman <mpe@ellerman.id.au>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, robh+dt@kernel.org,
 mark.rutland@arm.com,  paulus@samba.org, benh@kernel.crashing.org
Date: Tue, 24 Mar 2020 21:08:21 -0500
In-Reply-To: <877dz9xkhr.fsf@mpe.ellerman.id.au>
References: <20200324213612.31614-1-chris.packham@alliedtelesis.co.nz>
 <877dz9xkhr.fsf@mpe.ellerman.id.au>
Organization: Red Hat
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2601:449:8480:af0:12bf:48ff:fe84:c9a0
X-SA-Exim-Rcpt-To: mpe@ellerman.id.au, chris.packham@alliedtelesis.co.nz,
 robh+dt@kernel.org, mark.rutland@arm.com, paulus@samba.org,
 benh@kernel.crashing.org, hamish.martin@alliedtelesis.co.nz,
 devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
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
Subject: Re: [PATCH] powerpc/fsl: Add cache properties for T2080/T2081
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
Cc: devicetree@vger.kernel.org,
 Hamish Martin <hamish.martin@alliedtelesis.co.nz>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2020-03-25 at 12:59 +1100, Michael Ellerman wrote:
> Chris Packham <chris.packham@alliedtelesis.co.nz> writes:
> > Add the d-cache/i-cache properties for the T208x SoCs. The L1 cache on
> > these SoCs is 32KiB and is split into 64 byte blocks (lines).
> > 
> > Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> > ---
> >  arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> 
> LGTM.
> 
> I'll wait a few days to see if Scott wants to ack it.
> 
> cheers
> 
> 
> > diff --git a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> > b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> > index 3f745de44284..2ad27e16ac16 100644
> > --- a/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> > +++ b/arch/powerpc/boot/dts/fsl/t208xsi-pre.dtsi
> > @@ -81,6 +81,10 @@ cpus {
> >  		cpu0: PowerPC,e6500@0 {
> >  			device_type = "cpu";
> >  			reg = <0 1>;
> > +			d-cache-line-size = <64>;
> > +			i-cache-line-size = <64>;
> > +			d-cache-size = <32768>;
> > +			i-cache-size = <32768>;
> >  			clocks = <&clockgen 1 0>;
> >  			next-level-cache = <&L2_1>;
> >  			fsl,portid-mapping = <0x80000000>;

U-Boot should be setting d/i-cache-size and d/i-cache-block-size -- are you
using something else?

The line size is the same as the block size so we don't need a separate d/i-
cache-line-size.

-Scott


