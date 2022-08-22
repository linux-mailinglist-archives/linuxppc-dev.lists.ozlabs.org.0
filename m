Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5CC59C645
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Aug 2022 20:31:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MBLXs6QyHz3cdw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Aug 2022 04:31:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M7AO1nBK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=M7AO1nBK;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MBLXB6gdbz302S
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Aug 2022 04:30:50 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F2C35B81257;
	Mon, 22 Aug 2022 18:30:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65407C433C1;
	Mon, 22 Aug 2022 18:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1661193043;
	bh=OoTba3ydHbqkNB71cUiP4uky5w7voNgWy8VPUNjG+KI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7AO1nBKtRpjLwZAcfu3G3zEiXPS6YHJnnZnepO6S2YOr1eJHx3OXmRXeOOOoIfF5
	 s5xZ9MWWQSHPD5zT9oTn66n+h+1T1z00iXRXWvSmfFw6MRjul/AhG5y8Ml+SHlsTDv
	 eQc+MI/J17X1T+HdAXaX5yaOKKF1B+riE3rhTjeqI6TFH3U1pubpPLW/Sz5A3bbDT0
	 pIqBc2GMAlXklZF4dx+X21nYORgVM2aJsKoN3KyREKeu/AFU9CctSichWE+u+Nbu2i
	 WhFnap504LZOq32O0AkLm4PXkDM/83Oq0i+N14ReZzuqFU4JSyOqM5I6j4CGfopjvg
	 eftOcZKkj9m7g==
Received: by pali.im (Postfix)
	id 1D03E97B; Mon, 22 Aug 2022 20:30:40 +0200 (CEST)
Date: Mon, 22 Aug 2022 20:30:39 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] powerpc/85xx: DTS: Add CPLD definitions for P1021RDB
 Combo Board CPL Design
Message-ID: <20220822183039.sfpupym236ubkeio@pali>
References: <20220819084433.26011-1-pali@kernel.org>
 <20220822170056.GA4135542-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220822170056.GA4135542-robh@kernel.org>
User-Agent: NeoMutt/20180716
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Monday 22 August 2022 12:00:56 Rob Herring wrote:
> On Fri, Aug 19, 2022 at 10:44:33AM +0200, Pali Rohár wrote:
> > P1021RDB Combo Board CPLD Design is used on following Freescale boards:
> > P1021RDB-PC, P1020RDB-PD, P1020MBG-PC, P1020UTM-PC and P2020RDB-PCA.
> > 
> > Add CPLD definitions for all these boards for which already exist DTS file.
> > 
> > CPLD has bank size 128kB, it is connected via CS3 on LBC and mapped to
> > memory range 0xFFA00000~0xFFA1FFFF.
> > 
> > As CPLD firmware is common on all these boards, use just one compatible
> > string "fsl,p1021rdb-pc-cpld".
> > 
> > In some DTS files is CPLD already defined, but definition is either
> > incomplete or wrong. So fix it.
> > 
> > All these boards have via CPLD connected max6370 watchdog at offset 0x2
> > with GPIO 11, status led at offset 0x8 and reset controller at offset 0xd.
> > Additionally P1020MBG-PC and P1020RDB-PD boards have FXO led at offset 0x9
> > and FXS leds at offset 0xa.
> > 
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> > ---
> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi    | 92 +++++++++++++++++++
> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_32b.dts |  6 +-
> >  arch/powerpc/boot/dts/fsl/p1020mbg-pc_36b.dts |  6 +-
> >  arch/powerpc/boot/dts/fsl/p1020rdb-pd.dts     | 44 +++++++--
> >  arch/powerpc/boot/dts/fsl/p1020utm-pc.dtsi    | 37 ++++++++
> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_32b.dts |  4 +-
> >  arch/powerpc/boot/dts/fsl/p1020utm-pc_36b.dts |  4 +-
> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc.dtsi    | 37 ++++++++
> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_32b.dts |  5 +-
> >  arch/powerpc/boot/dts/fsl/p1021rdb-pc_36b.dts |  5 +-
> >  arch/powerpc/boot/dts/fsl/p2020rdb-pc.dtsi    | 33 ++++++-
> >  11 files changed, 251 insertions(+), 22 deletions(-)
> > 
> > diff --git a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi b/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
> > index a24699cfea9c..c73996dcd809 100644
> > --- a/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
> > +++ b/arch/powerpc/boot/dts/fsl/p1020mbg-pc.dtsi
> > @@ -83,6 +83,95 @@
> >  		compatible = "vitesse-7385";
> >  		reg = <0x2 0x0 0x20000>;
> >  	};
> > +
> > +	cpld@3,0 {
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		compatible = "fsl,p1021rdb-pc-cpld", "simple-bus", "syscon";
> > +		reg = <0x3 0x0 0x20000>;
> > +		ranges = <0x0 0x3 0x0 0x20000>;
> > +
> > +		watchdog@2 {
> > +			compatible = "maxim,max6370";
> > +			reg = <0x2 0x1>;
> > +			gpios = <&gpio 11 1>;
> > +		};
> > +
> > +		led@8 {
> 
> The register-bit-led schema says this should be 'led@8,0'. Did you 
> run 'dtbs_check'? 

No, it does not work and I lost interest to trying setup machine for it again.

> But that's going to conflict with what simple-bus schema says.

Another reason why not try it again. Lot of schemas says that are in
conflict, nobody understand it and when I ask how to do it, I just get
silence or answer which does not work on the real hw. And if there is
some schema error message then it looks like it was generated by random
word generator.

> I don't 
> know that 'simple-bus' is really appropriate here. The CPLD isn't really 
> just a bus. 'simple-mfd' is what's more commonly used with 'syscon'.

Sorry, I do not understand those schemas anymore. And based on previous
failures, I'm not going to try it again.

It is a _bus_ and it was tested that it works as a bus with more
existing drivers.

> > +			compatible = "register-bit-led";
> > +			reg = <0x8 0x1>;
> > +			offset = <0x8>;
> > +			mask = <0x1>;
> > +			active-low;
> > +			default-state = "keep";
> > +			label = "status";
> > +			function = "status";
> > +			color = <6>; /* LED_COLOR_ID_YELLOW */
> > +		};
> 
