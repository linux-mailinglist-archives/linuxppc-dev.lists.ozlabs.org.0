Return-Path: <linuxppc-dev+bounces-1342-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5AA97851B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Sep 2024 17:49:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X4zJl2Bfrz2ytg;
	Sat, 14 Sep 2024 01:49:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1726242583;
	cv=none; b=jVwOdod7YKNctPA8N+ZJgI5BkcrnH1GcGDBnDUiRNyVcfSUwQ+wJYV2ETyp1eW5Qm+9vqfyb6DRhvcdENZyTd9MLB2SezH/4kp8ZoBCzYH1O+MH4iSQ+hk0VBwfkq3XgxCUAKBW5cqxZHBC8AmQsUC+KSzrZUKC+e7A2/H5NBeTOn7CW2ITzY0WOJtAlNWPoUsN2KuJx0utOsAUJ1RgygKpO+h4Slt3OyQW+jNqnf/AJ4q3WWRLbMwX26nbEqJgH9YlpUGuPiQ28zrpPSvnSjj2VDzeJ8HklG8u6kNRYGm5Ok634tjK87o/cpAxZ0PJX3DW/n115BE1Xy8psvA78Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1726242583; c=relaxed/relaxed;
	bh=QrqQFw7SEGPjzwfrIreTThSMh/YatdVF+h2SQFZdFVM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Jz3QrnPIvC/6lMjvXcCAbEr5WBaTSQLTTpKkM6cxAX8vZRHOt4s3Hepdliu2UILQEjlz332UDkeRLZLjJxZuMkqhHjG6xUeieIO4V9EPsrTSXYYdL3ETsHZi/miR6hxo2/KwehEtTEzgqpbj5kCWs0QB2H4RwcNkDPKF7X4sV3LEuFMwlNCzQPl7E6jiQ1KXzrPF+sCP51HsJreUjmji2015UiP5E/Et+tEg7WoDBdCL3gXSoUrY3a+TTaqQlOjH8HxKdDDgGkbpFO4r3Enokt6IAIKFVIiWJuRR/RmkmllH7DpBv8lAOFuBSZhZcFE9AsOYh/yWePhLcALIEWHCpA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OLxPSwzE; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OLxPSwzE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=kuba@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X4zJl0Q33z2ytR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Sep 2024 01:49:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 14F45A4554F;
	Fri, 13 Sep 2024 15:49:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD95BC4CEC0;
	Fri, 13 Sep 2024 15:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726242580;
	bh=uGdeG5g7YaZNYd+BdEq0aRneEgUwGE+WwMP/V0KR3sU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=OLxPSwzECO5j8oDRQ7bJS8onDj9zAVk316k6rA0SUXQ+LbuWNP9DuiVnvN0VRSLVF
	 zQM6b6A+uWgKaLSJgdj3DCltSOmwVbVw7VGUyvL4fLXfFR2Ow2dJjj5YYrBXdKUooK
	 y8iUJFIT+U+omqhEIDw4MlSxNmyWbmNDbgmOwhSZ7EF2ynF7vIqxDZQs0Mum650A4S
	 e5KRLHu45ull5SUE9PG2+JEd7MLQC+3iZ0f8xeAjxlqHU20g87GhQihAn/etSd3wAI
	 tHkwfudAzsfGIF2K2sdRxxvvxCPlM0kW5dEYCKpjxpWAEV88doayfenkN/CI9mL3MK
	 hqIvkScOKzBJg==
Date: Fri, 13 Sep 2024 08:49:38 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: David Miller <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>,
 Mina Almasry <almasrymina@google.com>, Networking <netdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: linux-next: build failure after merge of the net-next tree
Message-ID: <20240913084938.71ade4d5@kernel.org>
In-Reply-To: <20240913083426.30aff7f4@kernel.org>
References: <20240913125302.0a06b4c7@canb.auug.org.au>
	<20240912200543.2d5ff757@kernel.org>
	<20240913204138.7cdb762c@canb.auug.org.au>
	<20240913083426.30aff7f4@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Sep 2024 08:34:26 -0700 Jakub Kicinski wrote:
> > The second "asm" above (CONFIG_PPC_KERNEL_PREFIXED is not set).  I am
> > guessing by searching for "39" in net/core/page_pool.s
> > 
> > This is maybe called from page_pool_unref_netmem()  
> 
> Thanks! The compiler version helped, I can repro with GCC 14.
> 
> It's something special about compound page handling on powerpc64,
> AFAICT. I'm guessing that the assembler is mad that we're doing
> an unaligned read:
> 
>    3300         ld 8,39(8)       # MEM[(const struct atomic64_t *)_29].counter, t
> 
> which does indeed look unaligned to a naked eye. If I replace
> virt_to_head_page() with virt_to_page() on line 867 in net/core/page_pool.c
> I get:
> 
>    2982         ld 8,40(10)      # MEM[(const struct atomic64_t *)_94].counter, t
> 
> and that's what we'd expect. It's reading pp_ref_count which is at
> offset 40 in struct net_iov. I'll try to take a closer look at 
> the compound page handling, with powerpc assembly book in hand, 
> but perhaps this rings a bell for someone?

Oh, okay, I think I understand now. My lack of MM knowledge showing.
So if it's a compound head we do:

static inline unsigned long _compound_head(const struct page *page)             
{                                                                               
        unsigned long head = READ_ONCE(page->compound_head);                    
                                                                                
        if (unlikely(head & 1))                                                 
                return head - 1;                                                
        return (unsigned long)page_fixed_fake_head(page);                       
}

Presumably page->compound_head stores the pointer to the head page.
I'm guessing the compiler is "smart" and decides "why should I do
ld (page - 1) + 40, when I can do ld page + 39 :|

I think it's a compiler bug...

