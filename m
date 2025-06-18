Return-Path: <linuxppc-dev+bounces-9512-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E69CADF88D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Jun 2025 23:17:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bMxQV1dY9z30Tf;
	Thu, 19 Jun 2025 07:17:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750281442;
	cv=none; b=VIKUhqApROKtmkyDOEcKi/+GPAB8RQbcCO+s55B/pBbRwo1noOuScJkBk4f89tb8Eu80sg1Bt2I5N66dmOQbGT7Clp44oL24zQJMteAmNb/Ej613m00rzmDyVj0b9ESe+fU0jnJdEu5saP1fxsKEZWt15NXZmdYRQFo/8RF3FscApOpyCBgEnJSGF1iVBxdciUyw4GPoRvJ6UdnjD+YlA3h2CqKV7lwYjdxoRnj3ClZ3CExbLnpLjWdZEJ9gYPcpHDloWCwzJOMgKONUoaxLc8D1+B05migiEGYBnG67lDQ8l6aiipl+iOdVL9Ji7FwS90O8FIaNkhOh5GHn0mL+iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750281442; c=relaxed/relaxed;
	bh=NKT1ifgDcehUIE1HAe53SQPyP8IuUX2gapbhAhmqJBM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J0zXonzBcph2G3CWH6p2rdgJOd8WIGUMjBRlm1BXy9IFq8cdPGlm4LTlE3BnRyJHDqRVESY3jxa/DYLGwVp2VU/dhwCSFOsDvZ7hXOTi25UtpTUXL6willPnqBi73jC1NJvBS0KgrP+HViVU69ElJSWNNnH5XzBi6efCyecQLxt6O17pJFX7WX2rSNxDOuchGZrdmwPfPjOpkQbHt1p4YJ8+8m70kksgmX+fT0ucIEkUElULOOc5Ch4hzRTtW7dRH1OHgGdt65wUeKPWvBGZrp9LyC8PJ+hftsNYyAd5rYU519pRDnA+rjyTW9199+SxnvAiit224KwP7J3b0Y21Jg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xalkmmc9; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Xalkmmc9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bMxQT0Ybbz30TY
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Jun 2025 07:17:20 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2AD4B5C6501;
	Wed, 18 Jun 2025 21:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5740BC4CEEF;
	Wed, 18 Jun 2025 21:17:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750281438;
	bh=KOEdlJiFTe+BKwO/glGv/UDTx5u3EWhGFs42UjnrPvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xalkmmc9lBVHnHqvSKVAyn2X9Z/p24HQJAE1EnfIInP6cyPmXNiIiZdgA4Vz9P0Ka
	 vlTMUlRBiP7lfkGLnRMehreY/IaGQQL0FHJ0jyGMaOziObPyRrFqkWMd4h58jcOoBJ
	 E50oJhdMsrxnP66TK66u/iwiozRJcVrd8WfoZhVD6YN8Y6rpYOI+opR+fbMZxSWahP
	 NQfPVwI/LPEodjKco+bjeFFspeachc2uyBv+g/pACl5ktiuPgBDNxZxHulA/BmhDb8
	 k96qY8/zzGBB/NbudKj3nDtjRMaCjMbPEdYGJlexw5KuiI6+B5D/hOnEC97J15D3wl
	 CGmTR+mfC8Lcg==
Date: Wed, 18 Jun 2025 14:17:17 -0700
From: Kees Cook <kees@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S . Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Jarkko Sakkinen <jarkko@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Xu Xin <xu.xin16@zte.com.cn>,
	Chengming Zhou <chengming.zhou@linux.dev>,
	Hugh Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Matthew Wilcox <willy@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Qi Zheng <zhengqi.arch@bytedance.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org,
	nvdimm@lists.linux.dev, linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] mm: update core kernel code to use vm_flags_t
 consistently
Message-ID: <202506181416.A32D378A6@keescook>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
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
In-Reply-To: <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Jun 18, 2025 at 08:42:53PM +0100, Lorenzo Stoakes wrote:
> The core kernel code is currently very inconsistent in its use of
> vm_flags_t vs. unsigned long. This prevents us from changing the type of
> vm_flags_t in the future and is simply not correct, so correct this.

Thank you for doing this!

> 
> While this results in rather a lot of churn, it is a critical pre-requisite
> for a future planned change to VMA flag type.
> 
> Additionally, update VMA userland tests to account for the changes.
> 
> To make review easier and to break things into smaller parts, driver and
> architecture-specific changes is left for a subsequent commit.
> 
> The code has been adjusted to cascade the changes across all calling code
> as far as is needed.
> 
> We will adjust architecture-specific and driver code in a subsequent patch.
> 
> Overall, this patch does not introduce any functional change.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  fs/exec.c                        |   2 +-

Acked-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook

