Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DEED80B0DC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 01:11:04 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qyp1eqJc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sn7hQ00RFz3dRP
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Dec 2023 11:11:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qyp1eqJc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sn7gX2zV6z3cDT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Dec 2023 11:10:16 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ECD6DCE2A9E;
	Sat,  9 Dec 2023 00:10:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C54C5C433C8;
	Sat,  9 Dec 2023 00:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702080611;
	bh=XwpafKSxSIaU9fO0Z1UPvQPkXRe7CXV3jWPAij1MXpw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyp1eqJcUWRaLF+8m75gLOK//4mNJy/GuZHSvYCaXRgJz9esiNNrjvs+umzyX9dqU
	 LxkG5R2NuGxY8iNhia+dC8pzM8O1iMzrpx79tD0UxIQSmmauB9VjAKNAQV7XQTgZX1
	 mhvs54RCEGnSFYldR2F6PZij6IlDsx9fLXFaajWViQ2rSpv0VzOo6ZKH0Wg4WDQ2RN
	 w+Fy8HE4TwXztb2YZLZnfteLXRI37sDiuiNCGp0m6XIttof0K2RaYcfj5ycn2QGGkY
	 px1E/jOzxzhSMKWu22gsrHkYucocPl1lm1KsQ7utaP8cMCKEoZD7JCtESAvYEZx8DI
	 LhxTREBtKbX3g==
Date: Sat, 9 Dec 2023 01:10:04 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] i2c: cpm: Remove linux,i2c-index conversion from be32
Message-ID: <20231209001004.n6dcdjwf2dqjctap@zenone.zhora.eu>
References: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <460afa20784a445dff05b552ebb8c6a389d9de85.1701901105.git.christophe.leroy@csgroup.eu>
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
Cc: linux-i2c@vger.kernel.org, kernel test robot <lkp@intel.com>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

On Wed, Dec 06, 2023 at 11:24:03PM +0100, Christophe Leroy wrote:
> sparse reports an error on some data that gets converted from be32.
> 
> That's because that data is typed u32 instead of __be32.
> 
> The type is correct, the be32_to_cpu() conversion is not.
> 
> Remove the conversion.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202312042210.QL4DA8Av-lkp@intel.com/
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
> v2: Use u32 directly, remove be32_to_cpu().
> ---
>  drivers/i2c/busses/i2c-cpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/i2c/busses/i2c-cpm.c b/drivers/i2c/busses/i2c-cpm.c
> index 9a664abf734d..771d60bc8d71 100644
> --- a/drivers/i2c/busses/i2c-cpm.c
> +++ b/drivers/i2c/busses/i2c-cpm.c
> @@ -658,7 +658,7 @@ static int cpm_i2c_probe(struct platform_device *ofdev)
>  	/* register new adapter to i2c module... */
>  
>  	data = of_get_property(ofdev->dev.of_node, "linux,i2c-index", &len);
> -	cpm->adap.nr = (data && len == 4) ? be32_to_cpup(data) : -1;
> +	cpm->adap.nr = (data && len == 4) ? *data : -1;

thanks!

Reviewed-by: Andi Shyti <andi.shyti@kernel.org>

Andi
