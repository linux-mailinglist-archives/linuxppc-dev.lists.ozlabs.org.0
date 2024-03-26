Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCE188CCBF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 20:09:55 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbeLgwVU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3zrd4GLNz3vZZ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 06:09:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IbeLgwVU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3zqr712Sz3cy9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Mar 2024 06:09:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5FF4061360;
	Tue, 26 Mar 2024 19:09:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E2C433C7;
	Tue, 26 Mar 2024 19:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711480150;
	bh=pb+u35OyTvLTyzRDf1w+2oKwdrPFHhbSH0PY66OLQKw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IbeLgwVUPuTL2Cphgye4KFfoLgH4dvlhl7kXfNHgYpXP1+3ZD5zyMUyOTAahq3VZv
	 oShMCS3dnEvmY+6PB1Tz7sk3k1b6fU03JBfaOD1KT6zyje+w5zusn1xm4aqCQFqbPY
	 PsKBsZN4hAaFth6/3cVl4kU+mU0iHY8hvBaVqU9/r8HQcIdHYtBglP/kn6EBQ3bHFU
	 3FQ2Uf6gv5ZPRsAWCmuT51/HbLf8nIMjvkeWL0Mk85j8lGg9Pi0gOAwCWDjFCgDu3y
	 6TxcxF+bHMuO4vKJJhx7wnnesXvRYiAgn0KfMbbQ/YLubx23FrX0fw0/tylzE1E8Dn
	 T+YwPywk4IvZw==
Date: Tue, 26 Mar 2024 20:09:06 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH 14/64] i2c: cpm: reword according to newest specification
Message-ID: <jpp67ejeropvsc6gwompwc5t2nbl6cde2o33vtf42e2on2ycal@42ovfdhp6oh4>
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240322132619.6389-15-wsa+renesas@sang-engineering.com>
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
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Wolfram,

...

> @@ -570,7 +570,7 @@ static int cpm_i2c_setup(struct cpm_i2c *cpm)
>  	out_8(&cpm->i2c_reg->i2brg, brg);
>  
>  	out_8(&cpm->i2c_reg->i2mod, 0x00);
> -	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Master mode */
> +	out_8(&cpm->i2c_reg->i2com, I2COM_MASTER);	/* Host mode */

I2COM_MASTER might be coming from the datasheet.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Thanks,
