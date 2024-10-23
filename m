Return-Path: <linuxppc-dev+bounces-2496-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 205229ABDCE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Oct 2024 07:32:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XYHkR0Dnnz2yY1;
	Wed, 23 Oct 2024 16:32:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1729661567;
	cv=none; b=Wx/EuRXsNmCdlUfhiwXNpVi9+OhVTrz9Cw5ye8NxvSqvLTg6SsGhNWSOlaeLMEFy6UlwY+IwylyR8JNgeSdxXxKMQaGI+Zn5rGr2YFUVim6h/wFv0zK4nCPZY1gP61PZAkarSeyXNeapWn22Pn157r3oVjWPDhXfyv3hj7G7J2ZUvTzKeAM/bnvPvffNnKrphboiw7KFZhFOGwkkXeJPnIUolkpCn291bkn6T+WpqHs8+/H4iXnUdNXUk9dSXhSk5mFJRljGeFINOjX/9sIJkPJvpE62XSRLtz4dKaH+GabIuqNSAR9eYS6OCQHLD2KbeETlUgInJjAijOwJljSDDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1729661567; c=relaxed/relaxed;
	bh=/bi/SkScHKryPJCoLSlDU6fBUHcP9Evd9WbTu8KtzzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWWO/RK8vvsApzTTnd/LBsJ0v1QT5Xw7PnFawZ5dxLC4EpgLXq3YNhpMLaalV4R5B2tEEUCprW3Qbtw3sA1Hhp6OhA8CgQRJWDd+Rkcbct/45B3xDAS6npY84AB1JsUxNULEYB+Y6PVPlh4Zw1hi7+9RNj3vp5v3Qh6jRzu24gkPydrmjIlnQ5Wak5cnHAQ0UcvHfvroG6G3VC70ZWHBbcw/j8GeZSk+RWIA5JdGKFVTE55KjojvzuWkFjfcwZvRuD5ZDfBffg617Yu0zaDRBsKf0YRpcdwg8TLVFtjcYcWBEYUwAQIXW5FxZtsl7vUrg9iW79py6ga1kqpztTAHvA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gme5o/UU; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Gme5o/UU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XYHkQ1RD4z2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Oct 2024 16:32:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FE065C5CEF;
	Wed, 23 Oct 2024 05:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9954C4CEC6;
	Wed, 23 Oct 2024 05:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729661562;
	bh=IUl8/VA1UaXKPGhrMFImpLpr1YuAPaXtMJH2JgermgA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gme5o/UUp9F2KR6bU1055VofbBLMez72a/thNWlYHF5TlhAgWjpd8gjJ2M9yvLNuQ
	 S+YuEMGpEwxGjw7t3PQj08Dj2hPIXancpPfx98+UKJGAak4eMHZ/M56Nyv0StrsS8F
	 SY3TvAwl8z/NUE0CgqcbPcRuT9vY/x2SCpevI9nSvHCsvnzz4y5etTqLpQs5amSGmE
	 sADTRJqTgUDe47Ld16AEe37IPFJvrKzhFyzAYtpogsnJjDxRe8B/JFL+JTQJGNDTq5
	 BGHj5nX53K+QQYV5c02vdoc/9vMJNXGomZjhs3PyQQBp8K2pksgMS/mAbtMowLSkXZ
	 PV9Iz+67gNcrg==
Date: Wed, 23 Oct 2024 11:02:38 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Cc: perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
	nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v4 0/7] ASoC: fsl: add memory to memory function for ASRC
Message-ID: <ZxiKdpeuIhe/DiV4@vaman>
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lists.ozlabs.org/pipermail/linuxppc-dev/>,
  <https://lore.kernel.org/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 25-09-24, 14:55, Shengjiu Wang wrote:
> This function is base on the accelerator implementation
> for compress API:
> https://patchwork.kernel.org/project/alsa-devel/patch/20240731083843.59911-1-perex@perex.cz/
> Add it to this patch set.
> 
> Audio signal processing also has the requirement for memory to
> memory similar as Video.
> 
> This asrc memory to memory (memory ->asrc->memory) case is a non
> real time use case.
> 
> User fills the input buffer to the asrc module, after conversion, then asrc
> sends back the output buffer to user. So it is not a traditional ALSA playback
> and capture case.
> 
> Because we had implemented the "memory -> asrc ->i2s device-> codec"
> use case in ALSA.  Now the "memory->asrc->memory" needs
> to reuse the code in asrc driver, so the patch 1 and patch 2 is for refining
> the code to make it can be shared by the "memory->asrc->memory"
> driver.
> 
> Other change is to add memory to memory support for two kinds of i.MX ASRC
> modules.

Are there any patches for tinycompress to use the new IOCTLs here, I
would like to see those changes as well

-- 
~Vinod

