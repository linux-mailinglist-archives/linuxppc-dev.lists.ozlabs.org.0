Return-Path: <linuxppc-dev+bounces-3386-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 157B09D03B9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:57 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjH46qlz2yLT;
	Sun, 17 Nov 2024 23:25:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=150.107.74.76
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846339;
	cv=none; b=ngh8qKjbh3rnmNb99fCedSs1VOI7thnQfpCOSPugc/IM1zHmdOb5vehxjVp+9eVi9fDddw10/guiFTJ5FfxRf4fyGWOQNwHs932kYXF4zWJl5I+FsKsuJ6v8WOHLxLQd7SZ/ZeWxqAtgUpAB6QlnwCsAbv1OVfun/VryrQvK1BdlN+i/mQj0saoKyWZAv45adUUYYrGHxWofUYYbqi/1/tR+cCbm+4a/P8EfZjDiq8TZRn8WJ17X9jeUEfj2krxpLvUY7DuWAiWemUIpLu7/v4HsBvN3gph3ujnvckpj4ALrpjo+rVLbKTMuW6bjcTI6CDcmf82vcKYb+JMpgUb6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846339; c=relaxed/relaxed;
	bh=Z5aRpQSJyAn7kaPIQ+8BIKi8SL2NVVYdH6QgQNoa8rM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=WYYt8kwr+G4SBqPrMRKBkHIOm0PF/YoAae9EQEBHQAo7L6IFGtEokRNQccTbNczvRpK5o9a/7Y3CT9Cq3JaEvgQtsE2/hU05edGKzuv8Tk4zudkB7q+pbdOHusxtXFlr0vwmzeI+poE+iF/OAFmfdsKqKmjsYy47A01vKIjcdDWa2sPk4QNytHdYCh2qUOuXdyZuXF5U0Rgy752wgGDD6cVpXF4btJXM6nMO2LqS4dgJpaxmyA6V/4wk6X7Fs9teGyOGKX1E/B+4vE83z9ZLs8EmomtTJ4ukWc5k+7K5/WcEfN4FPNgr7hpQwDL5631mzwPXsGpfO9P1LJEtdTV17A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BIrLZ6K4; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=BIrLZ6K4;
	dkim-atps=neutral
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjF5GrYz3bqm
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846334;
	bh=Z5aRpQSJyAn7kaPIQ+8BIKi8SL2NVVYdH6QgQNoa8rM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BIrLZ6K4TjilwIC8ZUM6+VF/KE+AJQ0faXUD7G8BWhhlJfQN2ybpU9fxO+PVju4ru
	 0hfudrhRIt2YLomYXScM6HFCb7U42GURiiZ0MrTKa2vDl8NVtZAHqqGDS5Hkqgfbar
	 owHGasJ9/boBc7E5sM/R3PpBh4UtrPxtB5DKHAwi3N4XkLemW98yw76+0kKJS8q4wU
	 oFPaLB5Tt9DSm1XUintORuQrJ51WnWN0EcIwhiXUEbS7edzVXL+8AVJcWNIm81SG5l
	 HMx6RrXKdo0j8vbMDsL0RTRNDWiUm0J9I+w9lJ//l4X4bClCPla/TtlB3065haVzyP
	 vvBqirIGYtcgw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqjB5GBgz4xfd;
	Sun, 17 Nov 2024 23:25:34 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Sourabh Jain <sourabhjain@linux.ibm.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>, Venkat Rao Bagalkote <venkat88@linux.ibm.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
References: <20241107055817.489795-1-sourabhjain@linux.ibm.com>
Subject: Re: [PATCH v2 1/2] powerpc/fadump: allocate memory for additional parameters early
Message-Id: <173184539746.890800.1383337121035968913.b4-ty@ellerman.id.au>
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

On Thu, 07 Nov 2024 11:28:16 +0530, Sourabh Jain wrote:
> Memory for passing additional parameters to fadump capture kernel
> is allocated during subsys_initcall level, using memblock. But
> as slab is already available by this time, allocation happens via
> the buddy allocator. This may work for radix MMU but is likely to
> fail in most cases for hash MMU as hash MMU needs this memory in
> the first memory block for it to be accessible in real mode in the
> capture kernel (second boot). So, allocate memory for additional
> parameters area as soon as MMU mode is obvious.
> 
> [...]

Applied to powerpc/next.

[1/2] powerpc/fadump: allocate memory for additional parameters early
      https://git.kernel.org/powerpc/c/f4892c68ecc1cf45e41a78820dd2eebccc945b66
[2/2] fadump: reserve param area if below boot_mem_top
      https://git.kernel.org/powerpc/c/fb90dca828b6070709093934c6dec56489a2d91d

cheers

