Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6247089FB77
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Apr 2024 17:26:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HXZkqCa5;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VF69l1MZtz3vXV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Apr 2024 01:26:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HXZkqCa5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VF6900RrTz2xTm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Apr 2024 01:25:40 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 9DB91CE2840;
	Wed, 10 Apr 2024 15:25:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 575CDC433F1;
	Wed, 10 Apr 2024 15:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712762735;
	bh=LQ/3a9IWIRDOqBxwrTVme9CWku1ILOMQBl7mQRLiAWo=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=HXZkqCa5C0cWESyOvDvsdJ7721ywkhj/ZHDFrvD0IPpt97pujLFOxypMEA9gROI/E
	 2f60JkFVXQSBcP62ktSdW5Sp+dbS4S0iOCvLYqDeAIPwmVaEKjjIcRuNpBELHUXSp/
	 4xe+yjxKl08Sp5q9dpHF4yKlqjz+YASdD6MPd/ZYSBkfk2eJfq+GTld7hZbIPJvrsZ
	 /gcSdMLe0UdDc6O0EXmeEAO89UeSGXMOBdyx2yqqqPPnzUpGry+b2wf4PB7zAcLH3+
	 3Bfkk2kgYJMrp39G0/2VtCdQe3R3wDp0gzMuxXGEGxNG8VCEY/8SdRUXL3ekVPbeVg
	 YZ11CgOGXfeDQ==
Date: Wed, 10 Apr 2024 17:25:31 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	linux-i2c@vger.kernel.org, Jochen Friedrich <jochen@scram.de>, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
Message-ID: <26y3smrxv3q56peuqatospr3q6annxvdmleyhykyrjrovne6mu@yg44mmr7aaqp>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
 <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
 <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <maxjcriuq6qfoeoing5ic7l5pnxdyylovjdoh4w3bzhnmco6ax@mslv35p4k35k>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> > >  	out_8(&cpm->i2c_reg->i2mod, 0x00);
> > > -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
> > > +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */
> > 
> > I2COM_MASTER might be coming from the datasheet.
> 
> Maybe we can just drop the comment? The value we write is pretty
> self-explaining.

indeed.

Andi
