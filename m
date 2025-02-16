Return-Path: <linuxppc-dev+bounces-6220-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE35A3757A
	for <lists+linuxppc-dev@lfdr.de>; Sun, 16 Feb 2025 17:11:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YwrQN51zhz2yFD;
	Mon, 17 Feb 2025 03:11:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739722316;
	cv=none; b=Ke33j0/SEY/kQrflqb28n49AJ3V9sq7yKe4kL7jwHsMeLmWggcTXq2LWQIEo0GtHmHksdFi/tpHDtCllkqsd+YcshZjdZ+bb4ys1HdL2JCawPuceVeh5sGslH9KdTUrFLo8XIa6afE7S7qIQNVQ+zvUag7TvjKvj93q0HjIcsOHO2KVzDpVy7dDTWcRA5RtSnw3xBVF7bsp6CIx14I6DG7XOwYLXbrUCfQ3wv9ITdaWblb2JOGKDmK662KxV533lMx80xRtA4Ly8oGVzLrzrTAbdUYzcwGCZcegXdKJgNyuBtewxGZOwpc7Y3X9pCmbVLTHeg/93wW//kKfAfs8Ufg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739722316; c=relaxed/relaxed;
	bh=vPlsygBoVYgKF0XxgqjRHRq8oNBSSRb6++kSEv3ypGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cL7N01GL3j7DbBcYZdFrQGtgxOe5njmeykY2DdA2ivV2JZxpDMs2P0ZtnoiCTAuAMF+B1Xd5cwTcntEemgX9qcD51EOJxZYxznm3zP4oHBt//WsM/4kw4EvNy4+txtqa3JTBHRH9BqV1jgL3FTNfMCF0lKdg7BG75uiNT1yPiJWRhBw+QieLdGfgrVXcKnTBh5MPo0KuE4T81IBk8AULNL7882PXxDv7tOFX+skbtmXMDbl6rzYDhalD+rg4ZvvC3KSb2Lff3/sJq74z8qO3PVNjHj2wKC2yCp0EJRx1ay4fryTBUxY8G4NYKy2i+sP9fUCTX0mYJspBNLiqkt+YyQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OfNO+Eem; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=tj@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OfNO+Eem;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=tj@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YwrQM5VK6z2xs7
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Feb 2025 03:11:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A9F735C56D9;
	Sun, 16 Feb 2025 16:11:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96CF5C4CEDD;
	Sun, 16 Feb 2025 16:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739722312;
	bh=IuYx+RCyfyZ6iqiPjwSDvnja0Qr0myQxPu/vJqnSYdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfNO+EemfjTmmipKYxMl+sGeair0y8gIwc0AFZbmNMvzUV4cW+2l6vzU1UoMZxtbg
	 CIU37PKhq/+0idxPtUnqDbxCMCMGxm2jbRyW73MHzrtZ7iov0QmDXiADDMt0XZVKrJ
	 wvfrzr2jO0jt3Ct2Wbl5vRFXWg+oi1sywkPm7NaHMywgxH8FcMHNrF49SOqalERvBH
	 lLAnxDCza/Mcl2xz3UQOlE3Mw5lMyhMOZCJO7ViwOBwo4NFa4LIuT0unURdmK8bmwr
	 UnPl/fFbWWqsz0oZ4BM5dNpVShpOnIpigxgVyw2wSbRx3qXFYDGUUtqYc3urrOHGRx
	 HuSEqo2N4SbjQ==
Date: Sun, 16 Feb 2025 06:11:51 -1000
From: Tejun Heo <tj@kernel.org>
To: Aditya Dutt <duttaditya18@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	"David S . Miller" <davem@davemloft.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel-mentees@lists.linuxfoundation.org,
	cgroups@vger.kernel.org, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] selftests: make shell scripts POSIX-compliant
Message-ID: <Z7IOR2UNzjy7cQA7@slm.duckdns.org>
References: <20250216120225.324468-1-duttaditya18@gmail.com>
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
In-Reply-To: <20250216120225.324468-1-duttaditya18@gmail.com>
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Feb 16, 2025 at 05:32:25PM +0530, Aditya Dutt wrote:
> Changes include:
> - Replaced [[ ... ]] with [ ... ]
> - Replaced == with =
> - Replaced printf -v with cur=$(printf ...).
> - Replaced echo -e with printf "%b\n" ...
> 
> The above mentioned are Bash/GNU extensions and are not part of POSIX.
> Using shells like dash or non-GNU coreutils may produce errors.
> They have been replaced with POSIX-compatible alternatives.

Maybe just update them to use /bin/bash instead? There haven't been a lot of
reports of actual breakges and a lot of existing tests are using /bin/bash
already.

Thanks.

-- 
tejun

