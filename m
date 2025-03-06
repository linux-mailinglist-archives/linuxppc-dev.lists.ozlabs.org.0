Return-Path: <linuxppc-dev+bounces-6788-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A539A559DF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Mar 2025 23:35:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z844F5w1qz3c9D;
	Fri,  7 Mar 2025 09:35:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741300509;
	cv=none; b=gvIM3ZfN2qzJeKmk9ucFADRx3Cx/vNKS5PXWIhNzfr8qiLgaTEBrDKDIfalH2PlbCWmIwAcxZ7Z/BvB9+bbH/pSUvf4jXkN8iK94Nd/N1IvKPxaVE5hQFyaUeon7+nkOIRQIuXBjPrthLulX4WAua2YXoQ7gD2g2gU0HPpgWh+SDmdUERAbteIdMc4xboVylTVvfBX8B0Z+cgSn0LBfQKPJMygHB/3Uw2klsW9eC9gxGRuBMBZiB8Kn56OqdEo5+0NzUxVp0sP4ujfdp0uNCtebV1ILD11T77ArjQA1BpHvgklDrbi832jfWRVAGvhorlkxw/x/pxgjsLNPspvDK2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741300509; c=relaxed/relaxed;
	bh=Z7N77zWHP/4CxDIiJFIAtlhGNMG8C5FJY+uFF2kpMaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SNk8uST+Yq5LddvSih9vD4g5B5Id6FKI40fsj3LZV8JNXsr8aAlF54CwZiHrudarbAFoB3Fy+ZN+U1TB6sV7XDTX4PU9EoXYdpuuVcUz7uiXsVKM0OrJg1Qb0JrWMHDSxCU9kVGxqjU7fhCuJy9NuoiXxGNtpBP69/+rvArP7qCr2YuQraNVjytsBsQOYKk7rI+gDTarCT1zgfTEZUUYos5BYn1pKbLaS9kFbO1feIUjRcajgMFoDdmXCsduUBFY8V7JXYV7MhlQLaL+oNboATcLJ/4IMVj00mexLEL3uAETDk5/kMQj8vIduKdZEEgl43Dl685q8iSvlf1DXf/xrg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ry/ziY7u; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ry/ziY7u;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z844F12m1z2yhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Mar 2025 09:35:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FF7EA45224;
	Thu,  6 Mar 2025 22:29:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C275C4CEE0;
	Thu,  6 Mar 2025 22:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741300506;
	bh=9tOUqspPzeq+F0GQa+rMAGCm66NYRjg83C8QJNrxPck=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=ry/ziY7u8lB46ueKJnolwAQkIdAkcTyrwQcNcUbydYGg1m6WjwI3DxBIMvCPcknzu
	 cpHCUaZaGZ4fQhhUyuskxugOFsO7zd/kwudSNSdyW4CE63k9l4+GoLXvbue0BwmNqh
	 8A6tAC3+Qb7H9bpIBwokqB5EPz8AuqaUyUZazU70Z8WmDJjoT96QuGpfe7hgNYMsES
	 vHpzCZMTwU2tN1yunWbN9EjxnrTPn66c+v+o6h0nF1sskAFmw4WKSpF0XJ+1yZFSf5
	 etRejYq8oUPDLkynYyKYs7lgZP5ah27ScjMF/b6N487rK1y1D3y+T/gxiBTxMF8gTD
	 pgOBUlH12Bfcg==
Date: Thu, 6 Mar 2025 14:35:05 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Wei Fang <wei.fang@nxp.com>
Cc: claudiu.manoil@nxp.com, vladimir.oltean@nxp.com, xiaoning.wang@nxp.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 pabeni@redhat.com, christophe.leroy@csgroup.eu, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 net-next 07/13] net: enetc: check if the RSS hfunc is
 toeplitz
Message-ID: <20250306143505.00f034e3@kernel.org>
In-Reply-To: <20250304072201.1332603-8-wei.fang@nxp.com>
References: <20250304072201.1332603-1-wei.fang@nxp.com>
	<20250304072201.1332603-8-wei.fang@nxp.com>
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
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue,  4 Mar 2025 15:21:55 +0800 Wei Fang wrote:
> Both ENETC v1 and ENETC v4 only support the toeplitz algorithm for RSS,
> so add a check for RSS hfunc.

Rejecting unsupported configurations is considered a fix,
please send it to net with a Fixes tag.
-- 
pw-bot: cr

