Return-Path: <linuxppc-dev+bounces-6430-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7493BA428F2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Feb 2025 18:09:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Z1nK851m8z2yjR;
	Tue, 25 Feb 2025 04:09:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1740416972;
	cv=none; b=SxGu/JCc6NyFw2q2XemrwDqfFTv5He/Oq/2xrTjIo9vuUH4nZ01AklKCGEZl9BbZExzCceJLQgYXLOdjvybUjoQd8c/JbMwtf6OoHNwHgDUHM6WNJ6Iih5Bhc9MdFs+j0ZG576rhPQ4Q2fD8rmYPvQv8fnWKZfxeOpCt1Ep3wi1pCeqZvXoSX0IzafSaU1gt8jnovyoMRHmC+D17Q6ADQ09UKwU9eYbgMnlGTvs94Afiagm8sq0Yqq4sHQp3EJDp06vttjSOz6l9+4Ya511UbPG3n2Smwilbu13BhWa7W56PtNeW6PdHxEJ7mH5lxNx5cAPplAQ3PyWjsFk4bG+QsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1740416972; c=relaxed/relaxed;
	bh=HvWdkXOo1C1KAWAOLvwRKhxqJ3fInLp7Pg+kRzB2l1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgb2tuOKIo/rv6naV3CERvCfQSMz3+M0hq2vz2RpUNfl8R21aheMXJT7TKMMOZp9FR78GQN4oz76Ug1Qphr4nBMGbA0vgJp1yys0Roe523EexEc31pnfeBnlCZ3AN+Rbzrj3NVE60YW5Rc8B+knrCTG1hDmP3OJPCwxPNkoqOoY/P0jruPTv2H3FRUYshaC8AgnVPAIvmbldUhWd6NYnsef0GMCYSPXI6fybBbkGC1ZRS5E9MNqxoKYQ7vG7GOOZiCipdj7pmyPgvE7x7BsmdM2Gh+DHzSQ1e4MdpYgINBCizMkzUBzfnfqx4j97GnbpHnwnwxOC+xoiVUHjusviSA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GyXMT7+O; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GyXMT7+O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=nathan@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Z1nK76knpz2yRd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2025 04:09:31 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 27752611BE;
	Mon, 24 Feb 2025 17:09:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA959C4CED6;
	Mon, 24 Feb 2025 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740416966;
	bh=PqlySbYyMKDngQANnkO11zBqIw/Fq8qCXFRHMY8ig+8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GyXMT7+OT6qMFl5b6FWqiPBbEYF8PAyw9i3xJ2wsDXbIuty60UPWvwIxLQpCElzci
	 E7vnNKA0sz7wd3fe5LUMJ8vLhc8z+T/CAbpI7V21AyIQVDi3qPgxzlAtw0VLG11y69
	 cgWLC7ZjymdwTn9//eVlNi6ecSWQ3dq9Nr6MFnEQvNRAOiGwH95LV1W5UqBalAvMaF
	 Y6hn+kOqSsA9wkKINnGZX18446mp2xMz8Ri/kzGk0I1SndQOrXIS1rt7OtwLHEUnwS
	 njj4ngcCD+ZzHOmc5D5bT7fuKkOpo7HJTb77G02N7dglqJ6CVJZfpSn1nJgwoT0RO8
	 X9w6mQVcxfi0w==
Date: Mon, 24 Feb 2025 09:09:22 -0800
From: Nathan Chancellor <nathan@kernel.org>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Sathvika Vasireddy <sv@linux.ibm.com>, jpoimboe@kernel.org,
	peterz@infradead.org, npiggin@gmail.com, maddy@linux.ibm.com,
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	llvm@lists.linux.dev
Subject: Re: [RFC PATCH] objtool: Skip unannotated intra-function call
 warning for bl+mflr pattern
Message-ID: <20250224170922.GA585841@ax162>
References: <20250219162014.10334-1-sv@linux.ibm.com>
 <3223ec0e-c445-4bbf-ae72-276688e40908@csgroup.eu>
 <d5ada017-1ba2-4a89-8a58-4555f09f9d97@csgroup.eu>
 <8f4ec6d4-2646-4a87-b3a1-edfaecff2a01@csgroup.eu>
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
In-Reply-To: <8f4ec6d4-2646-4a87-b3a1-edfaecff2a01@csgroup.eu>
X-Spam-Status: No, score=-0.4 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Mon, Feb 24, 2025 at 02:19:14PM +0100, Christophe Leroy wrote:
> Well, this problem already exists on clang 18 it seems:
> 
> 00000004 <btext_map>:
>    4:   7c 08 02 a6     mflr    r0
>    8:   94 21 ff e0     stwu    r1,-32(r1)
>    c:   93 c1 00 18     stw     r30,24(r1)
>   10:   90 01 00 24     stw     r0,36(r1)
>   14:   93 a1 00 14     stw     r29,20(r1)
>   18:   48 00 00 05     bl      1c <btext_map+0x18>
>   1c:   38 a0 00 00     li      r5,0
>   20:   7f c8 02 a6     mflr    r30
> 
> While GCC generates:
> 
> 00000418 <btext_map>:
>  418:   94 21 ff e0     stwu    r1,-32(r1)
>  41c:   7c 08 02 a6     mflr    r0
>  420:   42 9f 00 05     bcl     20,4*cr7+so,424 <btext_map+0xc>
>  424:   39 20 00 00     li      r9,0
>  428:   93 c1 00 18     stw     r30,24(r1)
>  42c:   7f c8 02 a6     mflr    r30
> 
> So lets make the kernel tolerate it allthough it should be fixed on clang at
> the end.
> 
> I can't find any related issue in the clang issues database
> (https://github.com/llvm/llvm-project/issues), should we open one ?

Yes please, especially if you happen to have a simplified reproducer
(but no worries if not). I can make sure it gets labeled for the PowerPC
backend folks to take a look at.

Cheers,
Nathan

