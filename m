Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E59F483E8C5
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 01:53:41 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZQnSWAFG;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TMGJy432Gz3bNs
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jan 2024 11:53:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=ZQnSWAFG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TMGJ64swDz30gJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 11:52:53 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 447F562596
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jan 2024 00:52:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EE0C433F1;
	Sat, 27 Jan 2024 00:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1706316768;
	bh=RohiRduCZDhu1mva0s61yl4yuysjE3+49ErZTdVjkNU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZQnSWAFGeGWy7MU0zFIGG/icKSXF0E0aHOFilBQpFfYNfyiR67arTnxzW90DzCbO3
	 Qs8LZ4R1gf7uuG+X/dXDRZg7Ou5206t6HAKwbjUS+b8Ng5v5NRVeDkOTb9iJaAp8UM
	 pYylThzRaMV58pM3h625BBc6LxdIubDALLMIydR4=
Date: Fri, 26 Jan 2024 16:52:47 -0800
From: Greg KH <gregkh@linuxfoundation.org>
To: Nathan Chancellor <nathan@kernel.org>
Subject: Re: [PATCH 4.19] powerpc: Use always instead of always-y in for
 crtsavres.o
Message-ID: <2024012640-macaroni-earlobe-bec5@gregkh>
References: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240126-4-19-fix-lib-powerpc-backport-v1-1-f0de224db66b@kernel.org>
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
Cc: sashal@kernel.org, llvm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org, linux-kbuild@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 26, 2024 at 10:36:31AM -0700, Nathan Chancellor wrote:
> This commit is for linux-4.19.y only, it has no direct upstream
> equivalent.
> 
> Prior to commit 5f2fb52fac15 ("kbuild: rename hostprogs-y/always to
> hostprogs/always-y"), always-y did not exist, making the backport of
> mainline commit 1b1e38002648 ("powerpc: add crtsavres.o to always-y
> instead of extra-y") to linux-4.19.y as commit b7b85ec5ec15 ("powerpc:
> add crtsavres.o to always-y instead of extra-y") incorrect, breaking the
> build with linkers that need crtsavres.o:
> 
>   ld.lld: error: cannot open arch/powerpc/lib/crtsavres.o: No such file or directory
> 
> Backporting the aforementioned kbuild commit is not suitable for stable
> due to its size and number of conflicts, so transform the always-y usage
> to an equivalent form using always, which resolves the build issues.
> 
> Fixes: b7b85ec5ec15 ("powerpc: add crtsavres.o to always-y instead of extra-y")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---

Both now queued up, thanks!

greg k-h
