Return-Path: <linuxppc-dev+bounces-3363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B6A9D0388
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:25:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xrqhp6SJCz2ywM;
	Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846314;
	cv=none; b=FP4Iphn5c+M29jJqkrRdMBjxmUtmPsyXY18zwYujn7iVhoqseF5G3kHAFYNBgbY8l2blE1pofPhXkxZqRp+naoBanmAHUl0Jz+TB/tj7codRZCyKg5Xy71AN/wjD+D/8sFnROW1uw9G/aNdZzzMinKjvscIlkCL0tq4zb0kp7lkWzU2zHFW1gHu/4qRgMYF2PB0Et7xBSaN6KzicNzTcbuDEVSg5iu9ce1jWJUAMPVI/4eB169Nf3m6KDPEkp6nZqBuA3Vm+t2PVVVIwhc7n/EkR1iS3x5gegWZxYNfw8vXTEcqWM7hvs6DnmV5dd8qkZw6a6pzK9aoeg27xU/sDxg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846314; c=relaxed/relaxed;
	bh=ZtVZjHZpNMLRUjQi5h35hHsNEqKCZhuH0S+3ozdVAic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ldqHqGG0h61JXOW0nEkYZtfcLyxw60lqrYeuKVxGgTUVsAyviOf4oG0RC4xn47dnFUG94h/hyVXjHmA4mSA7FTpNv3+K/gBG0TUMSVgbevggG6fGdeV1rDmDYzEqRLMutI6Q36UHXfKc+VfKkIrt4FVuEOlO+7YOw3CQwz9X7318mugRhRtgL/ba8vPY5w6ZxFjzaUmj0L2T9IouhjoTopRkVXAAQbxh+DJzGq4WIcobnviawG0CISf4P6cQat4Ws4kqNXfo8CriZ5mmpFrnmdd5RHcXQPB8nSNmIT0J/WO4IgM9r/3jyz9utuOZpWEGzg9MsmdkWdyQAXyjNX1PNw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hSDV47H0; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=hSDV47H0;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xrqhp0hK6z2yVj
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846311;
	bh=ZtVZjHZpNMLRUjQi5h35hHsNEqKCZhuH0S+3ozdVAic=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=hSDV47H0eD+7XS/3nGedPptWFN9AhomQxWk2sNvmdaeUi5uvsKpJcOSDj6II2JPos
	 Xua/MldRgW+De/0LMIn1cW7+mCyZuCI4rtTNooLvXMALcEHH33zb5hRmGLgmE1REXQ
	 onMQEoQU8IqiKQ9M9EiAzxeUQbV7YOzpC800mG/esXdW+c148ufAHxLls/oR02x6YB
	 fncbmELipMtjqabvH9U6Kt3x5Mei5UqTlfXtNzSNZ/O/h7rUDwP/OW7dNrFdlZvJfj
	 1daXFx3yfbMgWD7AMzBkrNXOMFtY56fXINBItNbuL+TGfgtZFsIE+BwXqZueH3wHEc
	 bwsLBlRPz/IZQ==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Xrqhk73vWz4xdm;
	Sun, 17 Nov 2024 23:25:10 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Naveen N Rao <naveen@kernel.org>, David Hunter <david.hunter.linux@gmail.com>
Cc: julia.lawall@inria.fr, skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
In-Reply-To: <20240709143553.117053-1-david.hunter.linux@gmail.com>
References: <20240709143553.117053-1-david.hunter.linux@gmail.com>
Subject: Re: [PATCH] powerpc-km82xx.c: replace of_node_put with __free improves cleanup
Message-Id: <173184539769.890800.11654652895579463795.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 09 Jul 2024 10:35:53 -0400, David Hunter wrote:
> The use of the __free function allows the cleanup to be based on scope
> instead of on another function called later. This makes the cleanup
> automatic and less susceptible to errors later.
> 
> This code was compiled without errors or warnings.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc-km82xx.c: replace of_node_put with __free improves cleanup
      https://git.kernel.org/powerpc/c/4aa5cc1e0012f784bc7f637458e597564833b425

cheers

