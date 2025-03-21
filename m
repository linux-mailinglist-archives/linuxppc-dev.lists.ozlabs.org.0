Return-Path: <linuxppc-dev+bounces-7272-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9EA6A6BF9F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Mar 2025 17:20:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZK72S3m2wz2xl6;
	Sat, 22 Mar 2025 03:20:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=139.178.84.217
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742574000;
	cv=none; b=hR7+K8SvGJ3v/X0bmOuNE6pxro2A6zOG1DGpS987FoW8NUwX91AwzHR0m7x/bG+unqZryAGNp8+mQD5hAkjs2jQKj8PhDQPDuTYVGTFQtV9iF9AdAsYVJP8DVhLuTkuiVfvmJcun52sSlNoTFXNKoOZBY01g0AyqE4SvTLtGp7Nh6wzorIqRbcDkJUsJ5Fmn5nxXPG1GXMaIZQQuBuCfWgqp7x4S8APo6mGqlY8Mkq0uIK+riZ1ZmgiMVTlk8SXCFgLjbpALl8mqnkGbt5R0GO5f4ZWSbxr+XWdboCpmqghSR+tJ31cH9/PmW9sXBIDj7Lo1sjlCkgnV8JKrDsJekA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742574000; c=relaxed/relaxed;
	bh=fG9wfZKtKEFmustfrPmN1a6rH6OGwMla1FdZ+LnH1fo=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=Gw6Q9jaK5OEA4XSme0ybYHOeL8ndYQWmYxmRwP2ZnMCrRiCvPHGrG1emvYEXE2KsiGAsyHzMcpSFPC0y9fDbGq/Iz4xLhXuKwZzods2PTpMej++dbxAKddkpeq3zkjqjtQn0wcinta4UpnDqQY2gFOmeKFD5/M59jlH1i7Iu8bVR3JNiUAoUxv3HcY2oNkoW4tPy2F5WtJvi3jdDUCJ61jxcgmfOP+Rff0pCv/Y9zZxXnitNI0651NjBhESkX3420oFsKG87YnK3ZR8IbjrNW7SD6qN2oGw3U6C/+ReWvYRuJsML07XGNDOletR55Zj/zF1IboSfgQKTy8KiVOIu9Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Liw89G9J; dkim-atps=neutral; spf=pass (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Liw89G9J;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZK72R5qm2z2xdg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Mar 2025 03:19:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 17DE65C6A7B;
	Fri, 21 Mar 2025 16:17:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3447C4CEE3;
	Fri, 21 Mar 2025 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742573995;
	bh=XI2f7SgbQyb+AjtyGj/tTNrFlGkFGsaPs29m6a6WOvg=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=Liw89G9JebAAheTFGPYolng/r/+euxjKQK+sJFI4TrqTrKYLQRHVbvcRQ/cBk+UVz
	 5nhfYLQHDxA+gubhPIX/1xxcAZ7mt/hNfftQON3JbzzwBeE3g8oGNTS+bKrhNsh8QI
	 ZHbtZoZ+aMGmkJRNMypGw1p3Gf92SK3ZSEmv4S65j6IY9IQtQTpWa4ZJ/OFUsXhmXH
	 DFxXrfg96Zi7aDVu/DBm1R3ssg6ut6k52DxOERAQWd2qPMLTXBmAsJQr9eSykde5hY
	 bp2Rev6o3RCi4m78rkwZAMcMxqxJDPV7/raGRMQfAYLU75KhLqFmmnYpqmfaysku+2
	 djJW8iK6RmiWQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EBF0A3806659;
	Fri, 21 Mar 2025 16:20:32 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
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
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: remove sb1000 cable modem driver
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174257403177.2538209.5678698281791174462.git-patchwork-notify@kernel.org>
Date: Fri, 21 Mar 2025 16:20:31 +0000
References: <20250312085236.2531870-1-arnd@kernel.org>
In-Reply-To: <20250312085236.2531870-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, andrew+netdev@lunn.ch, arnd@arndb.de, horms@kernel.org,
 corbet@lwn.net, christophe.leroy@csgroup.eu, rafael@kernel.org,
 netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-acpi@vger.kernel.org
X-Spam-Status: No, score=-6.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to netdev/net-next.git (main)
by Paolo Abeni <pabeni@redhat.com>:

On Wed, 12 Mar 2025 09:51:19 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This one is hilariously outdated, it provided a faster downlink over
> TV cable for users of analog modems in the 1990s, through an ISA card.
> 
> The web page for the userspace tools has been broken for 25 years, and
> the driver has only ever seen mechanical updates.
> 
> [...]

Here is the summary with links:
  - net: remove sb1000 cable modem driver
    https://git.kernel.org/netdev/net-next/c/3fed9fda150d

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



