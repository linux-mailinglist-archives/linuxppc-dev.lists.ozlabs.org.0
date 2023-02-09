Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0500D68FBDA
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 01:11:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PBy2c6nYbz3f5R
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Feb 2023 11:11:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=brsO3Ecz;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=pali@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=brsO3Ecz;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PBy1f0hzLz3bTc
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Feb 2023 11:10:29 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C3BDAB81098;
	Thu,  9 Feb 2023 00:10:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F975C433EF;
	Thu,  9 Feb 2023 00:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675901424;
	bh=ZYf7HFKe3KxHCdzX5bazbA0mBH1EZKc7KXigulhBb1Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=brsO3Ecz/1uU0Tyt0kggV9Bp+/uaed0Hmre/NISSCJQexm1NjVzbKmL1jjxffrfyR
	 s9hHkjzHdyJbBtmG6LSe57akuCR4bsrJ98PiWSaOxSDblkPXSdmJhx7pitU/kefyOw
	 P6KFTlKA6Xeik3tPItqjNp824LnZAaHZc9FA9XKLxk1RBJU6ed/BK3AaezrQsW4udz
	 hgJlQTBIjegX/tkSgISkb908xRUAZAhY83tRvIc0awE9LqERX7Iri3xvPazb17301e
	 AUFcT/LBQD4HvRZvtR09ylWhCDIjC38x4izIXC2nq3dULhyVVE032x6BKzbdxL27QQ
	 K9vQctTmWuSWQ==
Received: by pali.im (Postfix)
	id 5C11A798; Thu,  9 Feb 2023 01:10:21 +0100 (CET)
Date: Thu, 9 Feb 2023 01:10:21 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Subject: Re: [PATCH v4 3/3] powerpc: dts: turris1x.dts: Set lower priority
 for CPLD syscon-reboot
Message-ID: <20230209001021.oitnv6x7ilwvy4it@pali>
References: <20220820102925.29476-1-pali@kernel.org>
 <20221226114513.4569-1-pali@kernel.org>
 <20221226114513.4569-3-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221226114513.4569-3-pali@kernel.org>
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

On Monday 26 December 2022 12:45:13 Pali Rohár wrote:
> Due to CPLD firmware bugs, set CPLD syscon-reboot priority level to 64
> (between rstcr and watchdog) to ensure that rstcr's global-utilities reset
> method which is preferred stay as default one, and to ensure that CPLD
> syscon-reboot is more preferred than watchdog reset method.
> 
> Fixes: 0531a4abd1c6 ("powerpc: dts: turris1x.dts: Add CPLD reboot node")
> Signed-off-by: Pali Rohár <pali@kernel.org>

May I ask who can take this 3/3 patch? powersupply or powerpc tree?

> ---
>  arch/powerpc/boot/dts/turris1x.dts | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/powerpc/boot/dts/turris1x.dts b/arch/powerpc/boot/dts/turris1x.dts
> index e9cda34a140e..c9b619f6ed5c 100644
> --- a/arch/powerpc/boot/dts/turris1x.dts
> +++ b/arch/powerpc/boot/dts/turris1x.dts
> @@ -367,11 +367,34 @@
>  			};
>  
>  			reboot@d {
> +				/*
> +				 * CPLD firmware which manages system reset and
> +				 * watchdog registers has bugs. It does not
> +				 * autoclear system reset register after change
> +				 * and watchdog ignores reset line on immediate
> +				 * succeeding reset cycle triggered by watchdog.
> +				 * These bugs have to be workarounded in U-Boot
> +				 * bootloader. So use system reset via syscon as
> +				 * a last resort because older U-Boot versions
> +				 * do not have workaround for watchdog.
> +				 *
> +				 * Reset method via rstcr's global-utilities
> +				 * (the preferred one) has priority level 128,
> +				 * watchdog has priority level 0 and default
> +				 * syscon-reboot priority level is 192.
> +				 *
> +				 * So define syscon-reboot with custom priority
> +				 * level 64 (between rstcr and watchdog) because
> +				 * rstcr should stay as default preferred reset
> +				 * method and reset via watchdog is more broken
> +				 * than system reset via syscon.
> +				 */
>  				compatible = "syscon-reboot";
>  				reg = <0x0d 0x01>;
>  				offset = <0x0d>;
>  				mask = <0x01>;
>  				value = <0x01>;
> +				priority = <64>;
>  			};
>  
>  			led-controller@13 {
> -- 
> 2.20.1
> 
