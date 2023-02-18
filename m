Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C6FA669B9E9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 13:06:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJnTR4wzYz3c2j
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 23:06:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=unQDxG2s;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=unQDxG2s;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJnSX432rz3byj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Feb 2023 23:05:32 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A9D99B822BA;
	Sat, 18 Feb 2023 12:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F4E8C433EF;
	Sat, 18 Feb 2023 12:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676721928;
	bh=TmAb1GafN4gpzoQhxhlwDTfphssUg/5r9Sqy94z7ifo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=unQDxG2swsiziDdZOR3cHzU1vK66DWAJWytXvML35cY72loxGCGXTOS6lBPpYXUm9
	 UgK1Auf5GxywMv1xtdvTkYR9/w3q6M4hhl5PY8iJLVn7pOOQd8ABW4y2YBnkCvaAu0
	 i3LQkLkwR5K5jn8JyETMX5tqfx7K7+Cbhkfi/yrTimB66aR5OHUxbd9WJde8ki0ubj
	 05Wch5vEKcCOm6VxoL/6msH8MdYvRiJJMRRLE4Y06Os2yY+O37KEsksZL4x4c6U5yh
	 b1sUvuRu0XX8X3D9oJzjBaWrYmGpdMr5JrvwtQvA5eGY52dvf09PdxCZ6wtW19Qw0x
	 iv9ga7MWTUyIw==
Received: by pali.im (Postfix)
	id 8754D71F; Sat, 18 Feb 2023 13:05:25 +0100 (CET)
Date: Sat, 18 Feb 2023 13:05:25 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v4 3/3] powerpc: dts: turris1x.dts: Set lower priority
 for CPLD syscon-reboot
Message-ID: <20230218120525.7zplk5zdg5qmkmaz@pali>
References: <20220820102925.29476-1-pali@kernel.org>
 <20221226114513.4569-1-pali@kernel.org>
 <20221226114513.4569-3-pali@kernel.org>
 <20230209001021.oitnv6x7ilwvy4it@pali>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230209001021.oitnv6x7ilwvy4it@pali>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thursday 09 February 2023 01:10:21 Pali Rohár wrote:
> On Monday 26 December 2022 12:45:13 Pali Rohár wrote:
> > Due to CPLD firmware bugs, set CPLD syscon-reboot priority level to 64
> > (between rstcr and watchdog) to ensure that rstcr's global-utilities reset
> > method which is preferred stay as default one, and to ensure that CPLD
> > syscon-reboot is more preferred than watchdog reset method.
> > 
> > Fixes: 0531a4abd1c6 ("powerpc: dts: turris1x.dts: Add CPLD reboot node")
> > Signed-off-by: Pali Rohár <pali@kernel.org>
> 
> May I ask who can take this 3/3 patch? powersupply or powerpc tree?

+ Christophe

> > ---
> >  arch/powerpc/boot/dts/turris1x.dts | 23 +++++++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> > 
> > diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
> > index e9cda34a140e..c9b619f6ed5c 100644
> > --- a/arch/powerpc/boot/dts/turris1x.dts
> > +++ b/arch/powerpc/boot/dts/turris1x.dts
> > @@ -367,11 +367,34 @@
> >  			};
> >  
> >  			reboot@d {
> > +				/*
> > +				 * CPLD firmware which manages system reset and
> > +				 * watchdog registers has bugs. It does not
> > +				 * autoclear system reset register after change
> > +				 * and watchdog ignores reset line on immediate
> > +				 * succeeding reset cycle triggered by watchdog.
> > +				 * These bugs have to be workarounded in U-Boot
> > +				 * bootloader. So use system reset via syscon as
> > +				 * a last resort because older U-Boot versions
> > +				 * do not have workaround for watchdog.
> > +				 *
> > +				 * Reset method via rstcr's global-utilities
> > +				 * (the preferred one) has priority level 128,
> > +				 * watchdog has priority level 0 and default
> > +				 * syscon-reboot priority level is 192.
> > +				 *
> > +				 * So define syscon-reboot with custom priority
> > +				 * level 64 (between rstcr and watchdog) because
> > +				 * rstcr should stay as default preferred reset
> > +				 * method and reset via watchdog is more broken
> > +				 * than system reset via syscon.
> > +				 */
> >  				compatible = "syscon-reboot";
> >  				reg = <0x0d 0x01>;
> >  				offset = <0x0d>;
> >  				mask = <0x01>;
> >  				value = <0x01>;
> > +				priority = <64>;
> >  			};
> >  
> >  			led-controller@13 {
> > -- 
> > 2.20.1
> > 
