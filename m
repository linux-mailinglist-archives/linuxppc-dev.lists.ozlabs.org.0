Return-Path: <linuxppc-dev+bounces-4342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A0D9F725C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Dec 2024 03:00:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YDDJb0KD9z30VP;
	Thu, 19 Dec 2024 12:59:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734573598;
	cv=none; b=nGRzb3oGg6SrcGGppazLz9NlR5hCm59rPw3hasiizx50Y7Q42XAxSeyL6ByimWfvgjRnlPsTS8SRJgrIH+PoU2GnkeEsYBGXrRLinOyj6snQ2aAK9j6bSlH9mv9KWx0nwp8NAC7aQMbOmUdfZ8t4f3ZCSAzsMD+P55DzkTETOjRVC//FvyLJaHn0oKYAhDXrwDDPkwvMCmS33xaeiwOZJk8AkcI4IsStIKvJ6+V/3Q+9YMS/8URBYq9QS5HxFX0EQriSWySDS77qJ0tGkKmNUPvfbxKEutZnlfKjFTnppV6SvgAR1Cv2RyscZXRAGGvPFDqHReUv7iuQ6lb4Z1rqJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734573598; c=relaxed/relaxed;
	bh=96kWeARv/jqWBkA/YUkWNnsyXtuQAH4dtfOao5d9gew=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Zn6SVTJEun2lRsL8qBAnzkB+1NhTmTJRoGRi0nCzLHIJUqiwF7nM0VrDVnG/+7Sz9OVM2IwHl924ad6ySb/bf+75c/QnGdqic9UfkiGIxTKoYJi2HnNv2D9ezgu0ykBe7NRz1hDy+3K+syffCO2We6aoxNy2SrUgETrWLwrOuThTZanoiMgpC71n2IZWEVuhXfPT/4w+9xQ4G3l5ZT6Bn41kDbrAYF0dzSsi7tGbqg488NEMEJ/TKKhcgIgDa0y9X7UBN1vwFGUY8roR7zheJbwauZyGoZeqPi5tkqxKC85B1SpfGmqwiQCW7poef9TfGyPNiwjPbEo7mmtlqas8Bg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E4LdgTts; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=E4LdgTts;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YDDJZ1DlQz2xBk
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 12:59:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3DB75A4102D;
	Thu, 19 Dec 2024 01:58:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E2E6C4CECD;
	Thu, 19 Dec 2024 01:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734573595;
	bh=pktD9tMB/NkIA24GcTNudFt0kYH6590n4rXQZVZy5Xw=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=E4LdgTtsbkMKdioeAmYB8lQWJpPTV/Gaj/Usy+7dMJeWFdycJfWIgI4P3m0eDgtxl
	 dYEvcPDypEeiZBlR7yMJZRHT+iYgohlDdcovU6GFTPkFiJM8buLg9xETxOscpSi9Wb
	 +W+Hs7/XmuVWEnvsaInEcHR2sQBTOeu7G5osplb3gy2fG/VWkCtWB2z+5iV+bJ8lhc
	 s2lbR6uthBiJQAKtP4ZV1qYy5gohwf2Likwosgr6F4HduevedYG73DUr17VcDO/P10
	 pyBn0fmltb6M6mRCMK2btbpGewTy0UN1dbiSjusSRqkv3ID79ClxfpVJCjDUKTfCqe
	 CH8CzMHNv9K1Q==
Date: Wed, 18 Dec 2024 17:59:54 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: <linuxppc-dev@lists.ozlabs.org>, <arnd@arndb.de>, <jk@ozlabs.org>,
 <segher@kernel.crashing.org>, netdev@vger.kernel.org
Subject: Re: [PATCH v2 24/25] net: spider_net: Remove powerpc Cell driver
Message-ID: <20241218175954.3d0487c1@kernel.org>
In-Reply-To: <20241218175917.74a404c1@kernel.org>
References: <20241218105523.416573-1-mpe@ellerman.id.au>
	<20241218105523.416573-24-mpe@ellerman.id.au>
	<20241218175917.74a404c1@kernel.org>
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
X-Spam-Status: No, score=-0.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS,TVD_SUBJ_WIPE_DEBT autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 18 Dec 2024 17:59:17 -0800 Jakub Kicinski wrote:
> On Wed, 18 Dec 2024 21:55:12 +1100 Michael Ellerman wrote:
> > This driver can no longer be built since support for IBM Cell Blades was
> > removed, in particular PPC_IBM_CELL_BLADE.
> > 
> > Remove the driver and the documentation.
> > Remove the MAINTAINERS entry, and add Ishizaki and Geoff to CREDITS.  
> 
> Yay! Please let us know if you'd like us to take these, otherwise I'll
> assume you'll take them via powerpc.

I meant to say:

Acked-by: Jakub Kicinski <kuba@kernel.org>

