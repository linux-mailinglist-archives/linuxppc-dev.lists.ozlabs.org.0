Return-Path: <linuxppc-dev+bounces-4109-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB619F0A92
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Dec 2024 12:14:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y8mtw0Pnmz3bTQ;
	Fri, 13 Dec 2024 22:14:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734088456;
	cv=none; b=jtruiJjbyEtayxXwBCPnoE5+qX2QYkVDzpALWuYlypLh3hyItakot3yHtw02EkvoEAES77o/T6XSkKVztxeI8QKmUyURpgNkrVsr9W3t/qQB6uMviz9oNFnv2oe5hgRBK9DoeHNJqba8boD8oTz2XjqAGqjuaZmrE/BNm8Jb7E6Ds8shtGo6sZZc+I5r7B8ljoZ6ubzOO6tHxauCynpyvmehglGViGqsA1M9d31+uxS8OeDUZgwimIC3cA6fbBg/+16FBzyzadNSdOmY2t7UQ4/PEbrfnp9hXt1qEP4qEpOsUrKH+aDk2VCZiR7InI+DBjJKQzpz8fdb+spfJeRTSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734088456; c=relaxed/relaxed;
	bh=zNps1o8g8ZHEPXY9dK6SFi8sePTdL9U3g0bTmkxdIJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kwJbMGsqzQlL3JwtOB0Nzv4TQWTv8cuewVtBqit7yxx2+IgbrM06eJwDq/+eq64bhTW+snNzWxvw00VlNeVXgBX9RG/kEGtV1cWXngj28rxNHgTtiiJe2HImK/pBnXyG+KMQ8d+Bavc4M8MI9QtXyh4GAi5nJNiBdkVs+zbkKGeutLT++8qjHcD3M7j3b1AAetShoHSwMz3SmFe7hLIigWx+IiIg6W1QWpvGGzahx2/RUXumji7K3aUEPrj4YQdhVReo8J7mWi6s8X82/Irhqd31LlNqJiUnhyv6OEgzlz4nlmX9+aGMUVPcKsdsE+c5Ri/EHVRR4xWK/E/92wsWVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kmaRwMMW; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=kmaRwMMW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y8mtv06FFz3bTM
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Dec 2024 22:14:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2ACDDA42B04;
	Fri, 13 Dec 2024 11:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85744C4CED0;
	Fri, 13 Dec 2024 11:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734088452;
	bh=6646rlh+vU0geIq1jRDLfASPiHXhYsJuMUx/KA8ipK8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kmaRwMMWuDBJ02xjNv1OVGvUGGZmgNvUxL8+/iSi0uzmdFX2Cj85wPkCApS/2Zh94
	 f8+d60af/ohbFE2gH97H+Y02Gt5dH4I0WX9maAh+tSefEIrxEcKZ1RhXr3fSmmbx5V
	 3Ljz3NGfWuQFOgnIYNnVDyRcsf1e7l9RVbWkSLE8=
Date: Fri, 13 Dec 2024 12:14:08 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: haixiao.yan.cn@eng.windriver.com
Cc: nathanl@linux.ibm.com, mpe@ellerman.id.au, benh@kernel.crashing.org,
	paulus@samba.org, linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	haixiao.yan.cn@windriver.com
Subject: Re: [PATCH] powerpc/rtas: Prevent Spectre v1 gadget construction in
 sys_rtas()
Message-ID: <2024121332-earplugs-monkhood-745d@gregkh>
References: <20241213034422.2916981-1-haixiao.yan.cn@eng.windriver.com>
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
In-Reply-To: <20241213034422.2916981-1-haixiao.yan.cn@eng.windriver.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Dec 13, 2024 at 11:44:22AM +0800, haixiao.yan.cn@eng.windriver.com wrote:
> From: Nathan Lynch <nathanl@linux.ibm.com>
> 
> [ Upstream commit 0974d03eb479384466d828d65637814bee6b26d7 ]
> 
> Smatch warns:
> 
>   arch/powerpc/kernel/rtas.c:1932 __do_sys_rtas() warn: potential
>   spectre issue 'args.args' [r] (local cap)
> 
> The 'nargs' and 'nret' locals come directly from a user-supplied
> buffer and are used as indexes into a small stack-based array and as
> inputs to copy_to_user() after they are subject to bounds checks.
> 
> Use array_index_nospec() after the bounds checks to clamp these values
> for speculative execution.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Reported-by: Breno Leitao <leitao@debian.org>
> Reviewed-by: Breno Leitao <leitao@debian.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> Link: https://msgid.link/20240530-sys_rtas-nargs-nret-v1-1-129acddd4d89@linux.ibm.com
> Signed-off-by: Haixiao Yan <haixiao.yan.cn@windriver.com>
> ---
> This commit is backporting 0974d03eb479 to the branch linux-5.15.y to
> solve the CVE-2024-46774.

Now deleted, please see:
	https://lore.kernel.org/r/2024121322-conjuror-gap-b542@gregkh
for what you all need to do, TOGETHER, to get this fixed and so that I
can accept patches from your company in the future.

thanks,

greg k-h

