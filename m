Return-Path: <linuxppc-dev+bounces-6950-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 758C8A5EE06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 09:28:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD0yY1WDCz2xfR;
	Thu, 13 Mar 2025 19:28:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741854533;
	cv=none; b=GWYQbsd84oRq0RoVqvRd08wb3MRoDfR2OQJ5Bn9vTO60z4MTcqm0LTuCa4bNRz9VwTZ1Ee6kWIL12gHk7n7yok45futY+rFMq+h+D9VyKwfHFiABZC62ViMCfT0/gsgqkGdTqGr6WziJiZWAw8EFKULSWzrbGcJ2hbTqR0IH5tWel36VjrpRVG6Qgd3hM2HbT13xiATRPOe3MWPrZLUku04wfUDA2zk5v+rS8fHfLYmDj6qQFjcbvfy0T2yygFSXKzS88zvTK7Zm+SkBlf3TdV5GHKh7WGJmnCeNC5rVxjVtwRQSF2YsZIZC5Hxye/gjuQcqL1HoFrzR4x2CklgDXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741854533; c=relaxed/relaxed;
	bh=LNyZMfUTx2tl26PcJ2035KPpSUXcQv/vjDx/Pr1o+8I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv5EYoOMRpMxSEw9k49e4poAd0dQ8qMTwbb2v19m2cO8Prqb4O3xi/zDfcIM9D0Yjztj+KBu4M7h061PIUROOEqnJ0lPU9rYVmKYv53N6KtOi6UuzRfFxylXP/bwZZDkxziqpRcu+J9J6z906dL0j5eu5pkcQkeRjTl/WdNetbxn9zgCIPZBGM66yf5uO8wNAt1jeyAZgL8UJINZehw4yoYfDHaUh1E5pmUZ/CUZdGCv1Lx3t139LB0UNIBszP+KHQsSan4jmD11UIwOTFMuK9PLwenH6xZQo5zM4GxiUZz9fEzTyvspq6kvdrE6+If6ms0WUAO9ap7PzSmGYRJKLw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RGnqti/H; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RGnqti/H;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=brauner@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD0yX46k3z2xGF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 19:28:52 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A1640A46146;
	Thu, 13 Mar 2025 08:23:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EECCEC4CEEE;
	Thu, 13 Mar 2025 08:28:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741854530;
	bh=WotYYtMMdfZ0VCxbi9UyDMVGioMw80hNCXYhhfpnPsI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGnqti/HDfekk1i7pUnGdWG2m1Wg0E5GsHF2IRdsSbdfsO1z6yGIUyW4bSvJW9LZo
	 iQ1NVxOnzCtJ7eYNJZAjdzQHZhvV33fBLVyeV7VijMMS1mUPYjb5+10UVtnLkXj4s+
	 eX4QJUbFbMRBbrZvcK0ZASuWLXkmfrdza+pWLQ/To7ltMffGc6AicpKTPhrbVuPhqR
	 PLvW7AgECo89rjKC7QFBkMmC8G6s8FakUiYLKP3jj+jv/PqNQpRQqpYEA7FG8CzNpe
	 RyXBInMc+iHDGjG4AthivZZ7STuaZ4zScFVXStNjpyeHm1w/WidePAFgwT0FTnl+CY
	 inR/0khhVqp1Q==
Date: Thu, 13 Mar 2025 09:28:43 +0100
From: Christian Brauner <brauner@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 3/4] spufs: fix a leak in spufs_create_context()
Message-ID: <20250313-bonzen-glorreiche-47b46db84b86@brauner>
References: <20250313042702.GU2023217@ZenIV>
 <20250313042932.GC2123707@ZenIV>
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
In-Reply-To: <20250313042932.GC2123707@ZenIV>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 04:29:32AM +0000, Al Viro wrote:
> Leak fixes back in 2008 missed one case - if we are trying to set affinity
> and spufs_mkdir() fails, we need to drop the reference to neighbor.
> 
> Fixes: 58119068cb27 "[POWERPC] spufs: Fix memory leak on SPU affinity"
> Signed-off-by: Al Viro <viro@zeniv.linux.org.uk>
> ---

Reviewed-by: Christian Brauner <brauner@kernel.org>

