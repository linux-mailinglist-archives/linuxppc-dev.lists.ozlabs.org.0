Return-Path: <linuxppc-dev+bounces-11231-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A5B32E91
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Aug 2025 11:01:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c8nw73ggqz30VZ;
	Sun, 24 Aug 2025 19:01:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756026071;
	cv=none; b=kl3G/0K47n2xUaP+9qGFFlm1OT2NxGwpf9lcpAcCPlVF2bYTw0eYeVAKuqTTR8xyBnDHkLIb3qBe5YL4slToAEoQVrVtn1DdccQCPZap0tsmJoowz+mTQsW+rKALn1IdCdXOYlr9TDUg1YGmNcZuSNZpIXH8+YH9qhoYEVCdbyDUtYgAbQw6A1VypERoXCDsKkYiYPPRwFY50hbW594uJz/qnUvwJilhoDgGndVFwi5NfE7LURJqKXU2avHHqq5RK+bn4ffoFPWW2WpYEWQqYl9+YtbYD9I6HFNfNQ+UoU2nXrkrqVjUF2FmpN6GIkc54WbYxqIHtuvIsMKPYo9Ccg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756026071; c=relaxed/relaxed;
	bh=62vn7UBr1QjhWa9SxSR650yYWFtscgIqCu806v/4WP4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dm0BwtEaTlJD0ZENKAU/3Bjaarme8a1oN/h4CzGpMj95B/+DsMJIB3qjVM86yWqC/ds5AKGMNW41Zbd6Tco79LaTNnj2yNKfp78JvVUXZ8xCeEOXiW5LSFF0FYlKJq3Ou86rWU/Aeks1nqjQ3ItGkPBwcqyQbmJkeYqz9c7feqz0K8J2NmcnDwalhsCYIe+yLTOU0bkiiiKAcRXh/XUvPW7fHgfdl8+KSPDqGmfMG8qIAhS2cM+ygDHTCEmrX78sD559EWvBGUQNzceNL6mrWJa/i1+PI2yRXjiyNrNOa7GItI0kqLzRA0S66Magni31WRif1r6A3eeTlaiMsN+/oQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FBLH6vD1; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FBLH6vD1;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=gregkh@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c8nw52lt2z30FR
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 24 Aug 2025 19:01:08 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05F5E443C0;
	Sun, 24 Aug 2025 09:01:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 797D4C4CEEB;
	Sun, 24 Aug 2025 09:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1756026064;
	bh=/FmCqj2u2V8mp0UjjYF2Fnjzx7frypxGep1lBC5W+ww=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBLH6vD1xyZHGhZupurJJiXDqq58uRTXx4NKkircguBR1slJBtNWWA+62IXIMwGlB
	 CZQ+WJlLuS5jRVb/CtF7osgc0FoMzMTfMhLRhanK5QcOIK35gkicqhvc66YoNZxHut
	 naUdlTf1k1KUwp7VkDqq7HZcr/O1ZWIQ4B1E5PXc=
Date: Sun, 24 Aug 2025 11:01:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linux-stable <stable@vger.kernel.org>,
	"linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Subject: Re: Apply commit 5a821e2d69e2 ("powerpc/boot: Fix build with gcc
 15") to stable kernels
Message-ID: <2025082435-swoop-cyclist-b6fc@gregkh>
References: <7240379a-176f-4187-a353-1e6b68a359ce@csgroup.eu>
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
In-Reply-To: <7240379a-176f-4187-a353-1e6b68a359ce@csgroup.eu>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 08:03:49AM +0200, Christophe Leroy wrote:
> Hi,
> 
> Could you please apply commit 5a821e2d69e2 ("powerpc/boot: Fix build with
> gcc 15") to stable kernels, just like you did with commit ee2ab467bddf
> ("x86/boot: Use '-std=gnu11' to fix build with GCC 15")
> 
> Ref: https://bugzilla.kernel.org/show_bug.cgi?id=220407

It only applies to 6.6.y and 6.12.y, not older.  If you want it in older
trees please send a backport.

thanks,

greg k-h

