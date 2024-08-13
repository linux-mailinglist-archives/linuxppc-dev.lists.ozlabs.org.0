Return-Path: <linuxppc-dev+bounces-42-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5757F94FB07
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Aug 2024 03:23:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=uie2b65X;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WjYYh6zC5z2yGl;
	Tue, 13 Aug 2024 11:23:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=uie2b65X;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WjXg86sMVz2yFC
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Aug 2024 10:43:15 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CD154CE10C6;
	Tue, 13 Aug 2024 00:43:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B95F8C4AF0E;
	Tue, 13 Aug 2024 00:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1723509791;
	bh=RMlTgwdaLR6T5Ksf4+8ZHhXQoYW2DhU52FFvyfCnJP4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=uie2b65XSulxQ2UxOcERz1wYDWMNsdYKLWFc9uyUMvUfKt41jUZklX8e0tHyMcV0H
	 wf/4MLLL7KYak4TDUynGgpzmDA0hh74nhh6FTya4zLnv5jQREBJjmfqPI5uFrnl5bF
	 qsG4VMxnGqMoX96SM2Dii5xMsvm9ZPgbr7K4DQ3Y=
Date: Mon, 12 Aug 2024 17:43:10 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Michael Ellerman <mpe@ellerman.id.au>, PowerPC
 <linuxppc-dev@lists.ozlabs.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: duplicate patch in the powerpc-fixes tree
Message-Id: <20240812174310.968cd1988045662c3b5379c9@linux-foundation.org>
In-Reply-To: <20240813093207.77fc03d8@canb.auug.org.au>
References: <20240813093207.77fc03d8@canb.auug.org.au>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 Aug 2024 09:32:07 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:

> Hi all,
> 
> The following commit is also in the mm-hotfixes tree as a different commit
> (but the same patch):
> 
>   e7a9af8c93aa ("powerpc/mm: Fix size of allocated PGDIR")
> 
> This is commit
> 
>   6cd04a440f57 ("powerpc/mm: fix size of allocated PGDIR")
> 
> in the mm-hot-fixes-unstable branch of the mm-hotfixes tree.

Thanks, I dropped the mm.git copy.

