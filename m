Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F14A3AA782
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 01:32:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G51h82XyZz3c15
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Jun 2021 09:32:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256 header.s=201707 header.b=moidIHmW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=paulus@ozlabs.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=moidIHmW; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G51gm0rhTz306W
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Jun 2021 09:32:36 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4G51gl1Q2Wz9sW4; Thu, 17 Jun 2021 09:32:35 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 4G51gl0s3Yz9sXN; Thu, 17 Jun 2021 09:32:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1623886355; bh=5M85ANr7LFR3zPwLLC1F8HJ6b+Cp30QkuPB21v7W57s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=moidIHmWhDZlq6/NxntyCxKNNZ09s1A+5hJOyzCsDuEjtcu9dlRjhQdK8jUn63Pxl
 1LEjJUT+8v8gNGeSS1S8ymtp39hsceiRz/B3/FV1vSvhHbXakhZ+sclHXgWNswSBrc
 hvnty7k8ktwgjlqpqNOFpq5GFPQur1nPW+8QhlY9t0HsJ87u8K9bGUzzCNXKCLvb+Q
 pHklLTHp9sk4wsjdkyca7nhJbwYk6FfXSWb4KWpJBB/XUIjtopQrjuI2qDw3u2iNH7
 wOmJPwUtvy7iA+4853FEuOOiUnA7nvE8moWwdUvemiMalMAi+3Q2qZm48GD01fiDgN
 bzyCYaJBPnI6g==
Date: Thu, 17 Jun 2021 08:24:51 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH 01/11] powerpc: Add Microwatt platform
Message-ID: <YMp6MydtCWvpWqYV@thinks.paulus.ozlabs.org>
References: <YMfeswgEHeXSLOUF@thinks.paulus.ozlabs.org>
 <YMfe56vkKKqtc0tQ@thinks.paulus.ozlabs.org>
 <20210616184007.GK5077@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210616184007.GK5077@gate.crashing.org>
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
Cc: linuxppc-dev@ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 16, 2021 at 01:40:07PM -0500, Segher Boessenkool wrote:
> Hi Paul,
> 
> On Tue, Jun 15, 2021 at 08:57:43AM +1000, Paul Mackerras wrote:
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -422,7 +422,7 @@ config HUGETLB_PAGE_SIZE_VARIABLE
> >  
> >  config MATH_EMULATION
> >  	bool "Math emulation"
> > -	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE
> > +	depends on 4xx || PPC_8xx || PPC_MPC832x || BOOKE || PPC_MICROWATT
> >  	select PPC_FPU_REGS
> 
> Why do you need this / want this, since you have FP hardware?

The FPU is optional, and doesn't fit in the smaller (-35T) version of
the Artix-7 that is readily available.

I should mention this in the commit message.

Paul.
