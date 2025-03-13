Return-Path: <linuxppc-dev+bounces-6949-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B6DCA5EE00
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 09:28:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD0xz1S4tz3bx0;
	Thu, 13 Mar 2025 19:28:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741854503;
	cv=none; b=FJf4rHr2SmvCPPk4OX7aSgwz2AbV0Dzbj91kmlP0bsnLnTnOTUywt0zmV1GsF7UY7HDsqJyWqzPwWp7auAPcO0Qiyu9E4X90fbb5y4bYb6cK93pdpKrhFo2xMsU4z9MknvX90QptKtH/apfF60Y4iutqz8/aEUunT0qrjO6mqdGljqSvscOMqQTOBPkjyw+KDUiIUwUCB7fGroUIigjKqFuxecE8YShyaDJedCXA+YFRwdkNhKcywDnYXNLsyMClXAuCprYbHcqywk08bsEGbO7NBr92uZIa19PUw/bsPfqIhJMpF3a1YVzYQ3cTmxUW6dd0oKXK7TkUYm0vE4DvWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741854503; c=relaxed/relaxed;
	bh=hYTf+roZVwk/zZ8TL6GyLFHMzoS/ehVdXTGsNkjBFv0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKKIVWzrp6alFdqWNAnY1CY/qupdK5bYjWbXYPYmRp5toKOrxroFKaEiGGsol7capLmSmF75cS2ZrXl6A5vHz0QLvVx2OwbrQ6Xb1L5/kfbjYpvrTOHSJbJ0aaczZ/1AK7ns3UKz4SKZqH7GaU24aiyUoPqcpxCtTZwMUaUSLe+7+sEFZsJsbT71LT8AC/wb+WXI7lZNJe+KwGLqnS5fBwolYULASSxV+W6PDP68MUVNbYCcKdMCXPjgvkcx5i/kY872u7xbqI/NcT/MXw4NIUSpz4rXeS8e4R6esSN8vh9zXxABXj0D0NG+GFYFv3mUkEJ/eRTT7hYALMPL9yWs4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nJStTGOz; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nJStTGOz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD0xy44NYz300g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 19:28:22 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 91260A4608A;
	Thu, 13 Mar 2025 08:22:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E363BC4CEDD;
	Thu, 13 Mar 2025 08:28:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854500;
	bh=DAX95E8dRRp3Vn7GvTsb/Qtinub6DX3AThaLwxvmN+s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nJStTGOz+8qCd6/5/X7ary1f750sVjJHuVYuuX8VD/tY+SqBr4OZB/2ZvktXNFKgI
	 0GXLyh1IoSfDyGNXKoFWgSrtzBBnSO/l1+od7KVeciHg93IUcBgKZgxuLmyrIGy3+O
	 CsAKdzReP8eLuztKBZJknocy9PKmZhxKYcaM5QJnqqqeWAh/seDJ6mFEfbsoIbTHp0
	 C0Z5IIrfY3xYU9BK0FR23sBBM4sdYUOePE7aNXy9nsEUjmCfPNsqnx7SwKOnbzJonF
	 YWA3CiCkOGdEy4aaCMyJSHZyciu9I4BcVtacNgn4oTqarirUiP6WsetSnK4d4Tx0jD
	 kLOyZOrDkT9oQ==
Date: Thu, 13 Mar 2025 09:28:12 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 2/4] spufs: fix gang directory lifetimes
Message-ID: <20250313-lakai-halbjahr-d302c0e6108b@brauner>
References: <20250313042702.GU2023217@ZenIV>
 <20250313042901.GB2123707@ZenIV>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250313042901.GB2123707@ZenIV>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 04:29:01AM +0000, Al Viro wrote:
> prior to "[POWERPC] spufs: Fix gang destroy leaks" we used to have
> a problem with gang lifetimes - creation of a gang returns opened
> gang directory, which normally gets removed when that gets closed,
> but if somebody has created a context belonging to that gang and
> kept it alive until the gang got closed, removal failed and we
> ended up with a leak.
> 
> Unfortunately, it had been fixed the wrong way.  Dentry of gang
> directory was no longer pinned, and rmdir on close was gone.
> One problem was that failure of open kept calling simple_rmdir()
> as cleanup, which meant an unbalanced dput().  Another bug was
> in the success case - gang creation incremented link count on
> root directory, but that was no longer undone when gang got
> destroyed.
> 
> Fix consists of
> 	* reverting the commit in question
> 	* adding a counter to gang, protected by ->i_rwsem
> of gang directory inode.
> 	* having it set to 1 at creation time, dropped
> in both spufs_dir_close() and spufs_gang_close() and bumped
> in spufs_create_context(), provided that it's not 0.
> 	* using simple_recursive_removal() to take the gang
> directory out when counter reaches zero.
> 
> Fixes: 877907d37da9 "[POWERPC] spufs: Fix gang destroy leaks"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---

Reviewed-by: Christian Brauner <brauner@kernel.org>

