Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5B89111C6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jun 2024 21:04:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FRLORXOR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W4qg44Dmlz3ccN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Jun 2024 05:04:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FRLORXOR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W4qXf3Tycz3cX6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Jun 2024 04:59:14 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F65D62278;
	Thu, 20 Jun 2024 18:59:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0ED3CC32786;
	Thu, 20 Jun 2024 18:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718909953;
	bh=lTzTVp1u2ZY/33DSacWsJpPfGL854+EENYkyrza6jNc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FRLORXORdq/O8QdBB4WAPYndyKmuQN7QQ/aE1zBULz0N3fEN4Hk2AS7nQFW+QhXt4
	 7fxb9W+b0cZZBdFN+9GcX+JBtmR7dwjdWVkyQhEcMHmV5UgdveVAu7lZ9qHcqIxGhX
	 Sc4oQnzFtiJO8TZHSOgQ5WERuFhIowIslGEAQJsIquu4YHhBMzh6RuahbC7L5zb+mP
	 LvZMu4K/5ZoTB2QHzW2+jvHlldi4htSWNGf6t9HWoaDAMKChs1Sa5nogV/xnxoLxav
	 Wz1FJRMoMDe4XxhlcjdFGBVgmzyOuJTv+y+EClujBeDfyXatRqY2zYjPPlMbWCStf8
	 QVfewK1IOGvGQ==
Date: Thu, 20 Jun 2024 11:59:12 -0700
From: Kees Cook <kees@kernel.org>
To: Anjali K <anjalik@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: Whitelist dtl slub object for copying
 to userspace
Message-ID: <202406201158.346A2BE@keescook>
References: <20240614173844.746818-1-anjalik@linux.ibm.com>
 <202406171053.F72BF013@keescook>
 <499f5305-eb54-43a7-9864-d032f29c445d@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <499f5305-eb54-43a7-9864-d032f29c445d@linux.ibm.com>
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
Cc: naveen@kernel.org, christophe.leroy@csgroup.eu, gustavoars@kernel.org, npiggin@gmail.com, vishalc@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 20, 2024 at 10:58:49PM +0530, Anjali K wrote:
> However given that:                                                        
> (i) The dtl buffer is read-only. The dtl trace is a set of metrics which   
> are collected to be read by privileged users.                              
> (ii) Users usually reads all the dtl entries, not a subset.                                             
> (iii) Read overflows are unlikely to expose anything useful to attackers        
> since we are whitelisting the complete slub object and there are no        
> contiguous memory locations which need to be hidden.                       
> Can we go ahead with the whitelisting using kmem_cache_create_usercopy()   
> approach?                                                                  
> Or are there other reasons to prefer the bounce buffer approach?

Yeah, based on this and what mpe said, I have no objection to just
allowing it in kmem_cache_create_usercopy(). I was mainly just curious
what the threat model was. :)

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
