Return-Path: <linuxppc-dev+bounces-5753-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1C0A24107
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Jan 2025 17:49:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl21L6lB5z30NN;
	Sat,  1 Feb 2025 03:49:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=63.228.1.57
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738342182;
	cv=none; b=Yt+UbHaUvVE+foCZkBxQcFVjIU3hBuJe+OQaTTzKUVPjAYvsFUI5bZkeOqFNBCL+7iFckiiEH0E2GYDgw0pNvjiALg70gjow8gUor565nNSEBJg6AwUWIjxV66PKapcH+842WTJ7n39njlgX8pxzS1O1CDCLs+tYIjHptVIak8p0fvf4xgqqseclYcYIVm2VHLCghXsrUF6+0LE9SoFJqd4aVIFJkba41RdlFu+u2QcjmPvjMQTmcSSVFmoI+C5FfA0f0yN24SEkuToYQ8PXVXlk++7HotRk95H7d096JtH5Cb4jME7ki/xb13E5b69AW8UtzSk36Vq4W9NpvYscSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738342182; c=relaxed/relaxed;
	bh=1vEaJ3isschshjH7y0pDnVJ2wmfDpiacGS4nLjkY4aM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Mime-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jk3tHsix7HB/Mw34VDPMxWDQxxtkT3QJUorhtipHTI2JxN9gmahUSDCQzXfrI45aXf/Y3G217+b9mxAosCYV7bi1oQbrTh4oAy1OK+4ROfVYNyj5sR22R9840Gcs9zg+J5Tk7lC9J63U+r2+W0QtI3kIgz/rz8BQzR7txF/uNTyTtqTN/tyPmRjbR1J+dZlYnZanOfuBEVZZLAueM/E5/CwBxVU0l9X6wQH3ucewA2g8MeIUbERML0DopZZuMFKSJv5S70TrJC8maJMHjKbQzR0BpjfSFXn4/WefIotmcIC/qf3I/VC2y3ezl4OfI3il6JPvTUXFvgX2XyH2kfK8HQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org; spf=pass (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=kernel.crashing.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.crashing.org (client-ip=63.228.1.57; helo=gate.crashing.org; envelope-from=segher@kernel.crashing.org; receiver=lists.ozlabs.org)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yl21L0srtz2yMh
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Feb 2025 03:49:41 +1100 (AEDT)
Received: from gate.crashing.org (localhost.localdomain [127.0.0.1])
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 50VGmeuM028158;
	Fri, 31 Jan 2025 10:48:40 -0600
Received: (from segher@localhost)
	by gate.crashing.org (8.14.1/8.14.1/Submit) id 50VGmd9l028155;
	Fri, 31 Jan 2025 10:48:39 -0600
X-Authentication-Warning: gate.crashing.org: segher set sender to segher@kernel.crashing.org using -f
Date: Fri, 31 Jan 2025 10:48:39 -0600
From: Segher Boessenkool <segher@kernel.crashing.org>
To: Paul Mackerras <paulus@ozlabs.org>
Cc: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/5] powerpc/microwatt: Device-tree updates
Message-ID: <20250131164839.GB20626@gate.crashing.org>
References: <Z5lfDb8wsLlmSLBZ@thinks.paulus.ozlabs.org> <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z5lfmZtfHD7t2IvK@thinks.paulus.ozlabs.org>
User-Agent: Mutt/1.4.2.3i
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 29, 2025 at 09:52:09AM +1100, Paul Mackerras wrote:
> -			isa = <3000>;
> +			isa = <3010>;

Does this mean 3.1, or 3.01?  If the former, can this also encode 3.1C?
Should uwatt say to support that?

>  			little-endian {
> -				isa = <2050>;
> -				usable-privilege = <3>;
> +				isa = <0>;
> +				usable-privilege = <7>;
> +				os-support = <0>;
>  				hwcap-bit-nr = <1>;
>  			};

What does "isa" in this node mean?  Why is it changed to 0?  (I don't
know this node at all, I only know a property with the same name).

>  			cache-inhibited-large-page {
> -				isa = <2040>;
> -				usable-privilege = <2>;
> +				isa = <0>;
> +				usable-privilege = <6>;
> +				os-support = <0>;
>  			};

Similar question here.

> -				isa = <2010>;
> +				isa = <0x00>;
>  				usable-privilege = <2>;
> +				os-support = <0>;
>  			};

And here.  That's a quite woolly way to say "0" btw ;-)


Segher

