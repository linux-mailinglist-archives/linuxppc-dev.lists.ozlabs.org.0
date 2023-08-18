Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ED93781329
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Aug 2023 20:58:36 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jg5Lk3YV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RSB3Y6whMz3cSq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Aug 2023 04:58:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jg5Lk3YV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RSB2c6n30z3cKc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Aug 2023 04:57:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 4AB1864990;
	Fri, 18 Aug 2023 18:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEED6C433C8;
	Fri, 18 Aug 2023 18:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692385059;
	bh=fv/YYb3G79cUIhqviOxhsIiBdv4mGX2JwCYM6ITqusY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jg5Lk3YV8urrZSH3kVlW/415SKMtgRWrWMfVf47GKQ+J/tVt9Vgw9Z2UZgnOol/qC
	 7afiKAiWB0o2SKDPCZ81iT+idyLOlQjuI/imkQWQ6+pNxyTCIKgTEgo8EX4ztGqAeV
	 Bi57ox0dgjOd7Q0I5HJG+7JwrttKkcNDuOZWacjdHlqu67P/DGs1BDxjMahqbpvV/s
	 MLr6SpB5/ZU7c2r5KMgjvbPA75aL+KWFAAmR/98dFybAuo8zrYRe60OQ0X8EuVH8yb
	 3qCPxEfFXkU9Z63lIY2R9fRZANzoARQJ/ecahP7npEeftfdwhlDTVyBPtwXbjq8yt/
	 +HT32omfYIFJw==
Date: Fri, 18 Aug 2023 21:57:32 +0300
From: Leon Romanovsky <leon@kernel.org>
To: Yue Haibing <yuehaibing@huawei.com>
Subject: Re: [PATCH net-next] net: freescale: Remove unused declarations
Message-ID: <20230818185732.GK22185@unreal>
References: <20230817134159.38484-1-yuehaibing@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230817134159.38484-1-yuehaibing@huawei.com>
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
Cc: madalin.bucur@nxp.com, sean.anderson@seco.com, netdev@vger.kernel.org, edumazet@google.com, camelia.groza@nxp.com, kuba@kernel.org, pabeni@redhat.com, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 17, 2023 at 09:41:59PM +0800, Yue Haibing wrote:
> Commit 5d93cfcf7360 ("net: dpaa: Convert to phylink") removed
> fman_set_mac_active_pause()/fman_get_pause_cfg() but not declarations.
> Commit 48257c4f168e ("Add fs_enet ethernet network driver, for several
> embedded platforms.") declared but never implemented
> fs_enet_platform_init() and fs_enet_platform_cleanup().
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> ---
>  drivers/net/ethernet/freescale/fman/mac.h        | 4 ----
>  drivers/net/ethernet/freescale/fs_enet/fs_enet.h | 5 -----
>  2 files changed, 9 deletions(-)
> 

Thanks,
Reviewed-by: Leon Romanovsky <leonro@nvidia.com>
