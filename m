Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 07B407FED02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 11:39:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IjEJHGbZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sgt3h3YD8z3cdM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 21:39:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=IjEJHGbZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=naveen@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sgt2s42wlz3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 21:38:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 5DB1DB83FE3;
	Thu, 30 Nov 2023 10:38:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41BEBC433C8;
	Thu, 30 Nov 2023 10:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701340719;
	bh=LChB7dpq5ze2DuZowozV9pxOnro9/13+QusgW+8LgoE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IjEJHGbZrXdpeJLRbeIDj21lSr2euwPubFIvf0D5/YOjxRMSCJJRsDgEs09/VrR6k
	 r9lJBbyuojgYdNcd4M6p+pjqkg3PHbdtF47WPsXWOO5UIuvkuOw7IxvBTvQdVX/X6/
	 XooIh5/yTpjMySGvQ6C7CccVZFJer/aKHd8RrU8t6shXYtIGZwTND8GQpdeef/saq8
	 0gHFbguUMVG6aOu/9INjtPCfwhpYiPVAWCPIJcDgBqKYw91GGJtHezw2bezUP7RgJ9
	 j7yCRM3X+1vX0yi5xJPyDmpMeBo0WrMe8evt19zYTftIdCwJph60GROy0s+baji1lI
	 3cvG7ID4ZxOFA==
Date: Thu, 30 Nov 2023 16:01:18 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Benjamin Gray <bgray@linux.ibm.com>
Subject: Re: [PATCH v2 2/3] powerpc/64: Convert patch_instruction() to
 patch_u32()
Message-ID: <oosokrfyuti2u4u6tnzku4scr5k6o4d7ahr2coxa3fb43cqtlk@idfs65m6qjyi>
References: <20231016050147.115686-1-bgray@linux.ibm.com>
 <20231016050147.115686-3-bgray@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016050147.115686-3-bgray@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 16, 2023 at 04:01:46PM +1100, Benjamin Gray wrote:
> This use of patch_instruction() is working on 32 bit data, and can fail
> if the data looks like a prefixed instruction and the extra write
> crosses a page boundary. Use patch_u32() to fix the write size.
> 
> Fixes: 8734b41b3efe ("powerpc/module_64: Fix livepatching for RO modules")
> Link: https://lore.kernel.org/all/20230203004649.1f59dbd4@yea/
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> 
> ---
> 
> v2: * Added the fixes tag, it seems appropriate even if the subject does
>       mention a more robust solution being required.
> 
> patch_u64() should be more efficient, but judging from the bug report
> it doesn't seem like the data is doubleword aligned.

That doesn't look to be the case anymore due to commits 77e69ee7ce07 
("powerpc/64: modules support building with PCREL addresing") and 
7e3a68be42e1 ("powerpc/64: vmlinux support building with PCREL 
addresing")

- Naveen

