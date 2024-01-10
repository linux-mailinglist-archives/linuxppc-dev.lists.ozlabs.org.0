Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B95829BDC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Jan 2024 14:56:20 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O6TbQguN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4T98Tm6fTrz3cWB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Jan 2024 00:56:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O6TbQguN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4T98T00THSz2xYk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jan 2024 00:55:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CE3ECB81C65;
	Wed, 10 Jan 2024 13:55:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACF1BC433C7;
	Wed, 10 Jan 2024 13:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704894929;
	bh=8cm9X2P8JYXw7A6UqBJ+ZFDDqdDXxzCcOiudFrjGdOI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O6TbQguNMgR/y3t+xczXWvamymNDp6a8gfRA4n037V8PADmzUSZBkZh9dDwhMF4Rr
	 L/YFlqfSueyA/wIdK9XULXk3tTyUrpirhOp0oiKLwHPM5QpOL0XjP2UoBTMV7VLGtx
	 rm8bccisrJfmhUmL5xcuGVRl0K0k106hQ8mhUSOhUYpjJz2dgSndYOAqwhmG5lGoqs
	 KWZmFVCOM3GUM8KGD8J82idqF6n+Q366giWk1OHhEVuf8IiDdp3ZW1lhRB8Zhmb2vX
	 2iVAY4yzDQl8GRoWYFtb/K4juctdVvRwtzf56lotOtWOwyLxfYMj7VbwsVbYygbcC1
	 Wfd65gNUA8SjQ==
Date: Wed, 10 Jan 2024 19:19:21 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/Makefile: Remove bits related to the previous
 use of -mcmodel=large
Message-ID: <4a5vd4eo2pypiw3jjyx4mo4clf64vqxjutmnnnqy6h6ax7mxx3@2wbc45fqxsci>
References: <20240109133420.3048719-1-naveen@kernel.org>
 <47691590-3698-4dea-b093-6619796fa9ea@csgroup.eu>
 <20240109183936.GK19790@gate.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240109183936.GK19790@gate.crashing.org>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jan 09, 2024 at 12:39:36PM -0600, Segher Boessenkool wrote:
> On Tue, Jan 09, 2024 at 03:15:35PM +0000, Christophe Leroy wrote:
> > >   CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcall-aixdesc)
> > >   endif
> > >   endif
> > > -CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium,$(call cc-option,-mminimal-toc))
> > > +CFLAGS-$(CONFIG_PPC64)	+= $(call cc-option,-mcmodel=medium)
> > 
> > Should we still use $(call cc-option  here ?
> > As we only deal with medium model now, shouldn't we make it such that it 
> > fails in case the compiler doesn't support -mcmodel=medium ?

Yup, v2 on its way.

> 
> The -mcmodel= flag has been supported since 2010.  The kernel requires
> a GCC from 2015 or later (GCC 5.1 is the minimum).  -mcmodel=medium is
> (and always has been) the default, so it is always supported, yes.

Thanks for confirming!

- Naveen
