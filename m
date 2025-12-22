Return-Path: <linuxppc-dev+bounces-14936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA671CD4C9E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Dec 2025 07:20:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dZSfx2XQ9z2yFY;
	Mon, 22 Dec 2025 17:20:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766384409;
	cv=none; b=LfONGwqQ/gnkfXLMfwgu+HKtj3qDL6osX2emu2jpscYsH4e9JoT1fz/T08fdyaRO4mHL0y93TuACdAvVCPzP+f3w7EXz7Uf4M7wwheFBQ3jSX4SzCznCZUv1kamga+JNvMwkzcQiGVospwrEPs/LIXzC56eJEv9Fo6WESH9C4GPsj+HyK4WdaWXaWW1lyz8h8gGDZcjZTkHSMuKmarenzmH5koOUBHI9PRPEeUMbOdcSats5Q0ddUHEpSTrfRpgUTMUFoBcL4vG55TY7MchC0bIRoLn5sDShlx5zGnpKzZ+hNV/BdjUebVoHxxQ6ofzZQZapyXmiOVtoX0ikhVEIGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766384409; c=relaxed/relaxed;
	bh=3fKYtWqofbkCgnPNsL8R/DUbeuU98UiEjsylA+ETtWg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KDGiLDcMSrbLpvPGifBcfAQwV8T3rE380iZfdIbiCtvloDbKLIv8q9ja5p6/Kvzv42V0yiRLDJmrMyXiJ/pdf5IskLNoHOBoCKJAQqT9Wa5PRrFOEfw8b66MJKHdy2doCD7wLzkcLGUG/VylqstABlepYbtKMmWA3sV9/mUSMuJjVNLWrdkniOmkb/CA5KnKc6m8NjUCyHG6OC4aKdCKoJIc5OvL6+3KNLR7w2k4+03/Vu+0AwRZYBOMHugzZ4pUEo1K+GDUE3eGxXRw6vSUfnkZ18zuoLS1oGE4p3cQdeT9wxLZmmudjDK0PgYCOzI0HJoCbHE9vqq/52LykHWIpg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VIPSrzns; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=VIPSrzns;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dZSfw0SVnz2xSX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Dec 2025 17:20:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 093E260052;
	Mon, 22 Dec 2025 06:20:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E4DC4CEF1;
	Mon, 22 Dec 2025 06:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1766384404;
	bh=YGkELqsIKU8rBjyfo2gCT07jzGxgx9BW3JXVX/lfT4g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VIPSrznsWaB+SAA4R19WJuv7g80xiVd+ss+g9racXlGqm4Mec73FjxMdxs+yrcvTj
	 rltvWpowMowB5dMDGV8MioAjDN4uJoyfvHanYm1xZdqQhwHWHzVthxQ9ydtHTo/CGd
	 W+90/8K4xw7uj5PbaJztrKle88fhwLklOmOIQCBM=
Date: Mon, 22 Dec 2025 07:20:01 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	chleroy@kernel.org, akpm@linux-foundation.org, david@kernel.org,
	ritesh.list@gmail.com, byungchul@sk.com, abarnas@google.com,
	kay.sievers@vrfy.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] powerpc/pseries/cmm: fix the error handling in
 cmm_sysfs_register()
Message-ID: <2025122248-obsession-urgent-648f@gregkh>
References: <20251222031225.968472-1-lihaoxiang@isrc.iscas.ac.cn>
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
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251222031225.968472-1-lihaoxiang@isrc.iscas.ac.cn>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Dec 22, 2025 at 11:12:25AM +0800, Haoxiang Li wrote:
> If device_register() fails, put_device() should be called to drop
> the device reference.
> Thus add put_device() after subsys_unregister label and change
> device_unregister() to device_del() in fail label.
> 
> Found by code review.
> 
> Fixes: 6c9d29095264 ("power: cmm - convert sysdev_class to a regular subsystem")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
> ---
>  arch/powerpc/platforms/pseries/cmm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/platforms/pseries/cmm.c b/arch/powerpc/platforms/pseries/cmm.c
> index 4cbbe2ee58ab..0666d3300bdb 100644
> --- a/arch/powerpc/platforms/pseries/cmm.c
> +++ b/arch/powerpc/platforms/pseries/cmm.c
> @@ -419,8 +419,9 @@ static int cmm_sysfs_register(struct device *dev)
>  fail:
>  	while (--i >= 0)
>  		device_remove_file(dev, cmm_attrs[i]);
> -	device_unregister(dev);
> +	device_del(dev);
>  subsys_unregister:
> +	put_device(dev);
>  	bus_unregister(&cmm_subsys);
>  	return rc;
>  }

this does not look to be correct, how was it tested?

Also, why not fix all of this up properly by calling the correct
functions so that you don't have to manually add/remove the sysfs files?
That would resolve the "problem" you seem to think is here in a much
simpler way, and also fix the real bug in this function (i.e. it races
with userspace and looses.)

thanks,

greg k-h

