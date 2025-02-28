Return-Path: <linuxppc-dev+bounces-6576-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F55A49FB3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2025 18:03:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z4F0V1Yr7z3bqP;
	Sat,  1 Mar 2025 04:03:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740762218;
	cv=none; b=ASrccOjPuW2X1NqxGHD2++rPaDjG7vx2/kxjokFXcldIarVN23kdNE+Yl/c9xqm7r0QaPiHbtS30pr5NZNKIggJ57D0PVM2HIP9OCJ5ACzRXAtFqifOqtCqy2qwVteMpUW290VagO+715NcNNLO9odZzW8+e294UtohdQ+TcOlbuU4UjuzyXntavO/G3z2yHHVyZFv96pds3VUUPCwQpB0V0f2q9w5dq/h3HUjL71R1RlmCfT4jHc35SoqhmnRarRI9Jeoj7ks7YiEy1jOTXgYw3kSO01xZoCCeuGHD5IpkDXYGHZrkljY3nKMU0nTtSNa1oeiwh1VWCfLN//ooxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740762218; c=relaxed/relaxed;
	bh=YNktoPWYpG97Au3SojDNeJ0HCFNczneSkYHAVZw6UME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CTa0cC/UN/e5dCZFsc3/VROOlooJb/7L6n6KfCQpWh6Aq1tOV4swOHGHvGfGtUqZ2agoivV43EOfOEO/kGTxUImQCm5PXuLwooU+JlEXaDYTo+dCCSiYcIq4Uvdjafcc6wbhd5eDQRZ7qfxlMnDxxgIhmDnIno6qPqZpwshlQfK4Z+iOOD223UPi3d4S0MBG429gLluS6bglk9H258bRID5gMsGr/oaHgZ6AoqqpOfnpVgB2zfuiYjlPLLg0tDILGac7rg9cUBbg8v+Yz/manSdzVSjKtSm1E+MGLlWSvFRoXc7T46DOPnUiXXQROfvG2Yol8lAgevp+zFg02iXWDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VMh90KSX; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VMh90KSX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z4F0T2Txzz3bnx
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Mar 2025 04:03:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 66BAA5C6801;
	Fri, 28 Feb 2025 17:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FB13C4CEE5;
	Fri, 28 Feb 2025 17:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1740762212;
	bh=87MeIyTnCh42lvIVh/gUDVDz6THw0IS0/ekXuG8Yp9I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VMh90KSX/qkhcZk//yf1Huc/CHYyS1ct0ZwCI1hUItnPu0xfocWwEeJhWKUlxrUsc
	 m8lMS5KZQQSRVSlWmu5pjWAyYbWZXtIvVxf6NQGADM8nf8CwyHh9dWbAP7CHtBeiMy
	 UhadyHL0qs1ei5gL7x9GZ3PM0UhekqSBq5I/txXc=
Date: Fri, 28 Feb 2025 09:02:10 -0800
From: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To: Aditya Garg <gargaditya08@live.com>
Cc: "castet.matthieu@free.fr" <castet.matthieu@free.fr>,
	"stf_xl@wp.pl" <stf_xl@wp.pl>, "b-liu@ti.com" <b-liu@ti.com>,
	"johan@kernel.org" <johan@kernel.org>,
	"heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
	"valentina.manea.m@gmail.com" <valentina.manea.m@gmail.com>,
	"shuah@kernel.org" <shuah@kernel.org>,
	"i@zenithal.me" <i@zenithal.me>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] usb: replace strcpy() with strscpy()
Message-ID: <2025022833-unawake-barricade-7bb8@gregkh>
References: <DEF7EF73-12C4-4F30-BC14-DD829F0C6884@live.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DEF7EF73-12C4-4F30-BC14-DD829F0C6884@live.com>
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Feb 28, 2025 at 03:07:03PM +0000, Aditya Garg wrote:
> From: Aditya Garg <gargaditya08@live.com>
> 
> The strcpy() function has been deprecated and replaced with strscpy().
> This patch shall replace it in the whole USB tree.
> 
> Link: https://github.com/KSPP/linux/issues/88
> Signed-off-by: Aditya Garg <gargaditya08@live.com>

As the two functions do different things, are you sure it is safe to
just do a search/replace here?  If so, you need to explain that in the
changelog why this is ok, and if not, please document that as well :)

thanks,

greg k-h

