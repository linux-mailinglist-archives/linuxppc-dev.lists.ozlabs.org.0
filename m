Return-Path: <linuxppc-dev+bounces-8936-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03350AC3C54
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 May 2025 11:05:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b5VGp3gCGz2xfR;
	Mon, 26 May 2025 19:05:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748250338;
	cv=none; b=RzEucWNe/GykQqiRIT0CKzJ3ERkLbUCR828EYI+4VYgqXQY0+jnqeCtxFRc11S2auO8gYhYm0D5/kAyRVM8YGkgvj9m/RJmQurtpF7B/YvFLb9Ddq+5x7iBbfOy3hY30Pa5tVhl59P4TWBpFbzK/2322uejolhEfyfE7LjrdlZKOCDa4peAbOvx3NNhqnpMBVy5ggBm1n5TKXwZzqKDYAK8RcUcf1nM84yyRCnzEYqGTUzxTmSARpKJepGzBFeA8XL2j4K3fHALlut2+cQGuwmx5jot4g8R25obLN3t7Z/bnNVqPX2ke62l/WZFc5WA4o+1xaIU9Cg4uzahvV+cyZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748250338; c=relaxed/relaxed;
	bh=dMiR4x8jT+rZ3/qCkv0QOdMaWLX9Gpp2J3SqElt5rto=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ggLWx6XagC3KhNPeNhTQgKKBWP+AGHacGne3cO6TOWjlCDARGlxIsM3rIoUbt8CEs3v50V3NBCRjdM0tyvW5A95msoS4a1R00Aruy7Z6YwZiDzpClMnLqRsc/geQ7qFG8UNGyl3rgldnZ5j99grShLpoOgpHQGRfYEwOPmlKThN2Xv+oqaipeoLS/0nhq4j7537b9PZFPYU0HU5NVRYi0Uex/ovSIFQIvvaXNm17ZfLatCCDvYEViAuC7xzoYQk0K8363pvjMo2Z56sI4vsGB4w7t5dGM8EFv4dkqa77eXGAQu7n1gOaNln6XXI0Yec2SxFEPIHwjllQYJeMdRJOyw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AZPFdMco; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=AZPFdMco;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b5VGn39Ydz2xfB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 May 2025 19:05:36 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7F98C44ED2;
	Mon, 26 May 2025 09:05:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F28AC4CEE7;
	Mon, 26 May 2025 09:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1748250334;
	bh=vcMTXAzTiY0mStel4N+6Gk6K2+W/6O20TELFymJTcK0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AZPFdMcoc0LslowRmZ8t+cKbpMAmIM28iJfJAuIGtj2VpTephFMItg/PQ/PJrEuu3
	 9Ttg3JLaHaRSUfONoDrWXyXUUAyZxfyo8hmog0s3Z3uXhQfmAVXztaP7ERodkBAay0
	 xeFAUgXQnYjPYbAlQv8H/DQNlmFv96ZE6aU62EcI=
Date: Mon, 26 May 2025 11:03:41 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Haoxiang Li <haoxiang_li2024@163.com>
Cc: ioana.ciornei@nxp.com, agraf@suse.de, German.Rivera@freescale.com,
	stuart.yoder@freescale.com, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] bus: fsl-mc: Fix an API misuse in fsl_mc_device_add()
Message-ID: <2025052622-nautical-suitably-486c@gregkh>
References: <20250526083622.3671123-1-haoxiang_li2024@163.com>
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
In-Reply-To: <20250526083622.3671123-1-haoxiang_li2024@163.com>
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, May 26, 2025 at 04:36:22PM +0800, Haoxiang Li wrote:
> In fsl_mc_device_add(), use put_device() to give up the
> device reference instead of kfree().
> 
> Fixes: bbf9d17d9875 ("staging: fsl-mc: Freescale Management Complex (fsl-mc) bus driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
> ---
>  drivers/bus/fsl-mc/fsl-mc-bus.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/bus/fsl-mc/fsl-mc-bus.c b/drivers/bus/fsl-mc/fsl-mc-bus.c
> index a8be8cf246fb..dfd79ecf65b6 100644
> --- a/drivers/bus/fsl-mc/fsl-mc-bus.c
> +++ b/drivers/bus/fsl-mc/fsl-mc-bus.c
> @@ -905,9 +905,7 @@ int fsl_mc_device_add(struct fsl_mc_obj_desc *obj_desc,
>  	return 0;
>  
>  error_cleanup_dev:
> -	kfree(mc_dev->regions);
> -	kfree(mc_bus);
> -	kfree(mc_dev);
> +	put_device(&mc_dev->dev);
>  
>  	return error;
>  }

No, sorry, this is not corrrect at all.  Always test your patches before
submitting them.

greg k-h

