Return-Path: <linuxppc-dev+bounces-11269-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 761C7B34E2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Aug 2025 23:37:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c9kfH1YBHz3cmk;
	Tue, 26 Aug 2025 07:37:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756157847;
	cv=none; b=KOQH9JdVK3VMU72wEgNlHnQbss0s5LRQW8USMuqgxI+ynqduWJSdPzzacYq0IKHCz9BLKxxrfTX5nW2uZw1z4uzP3HcldJHMV01A9iYf+VqNdB89LL3uf693vDypRoU5/c0V1nt372ZCLdvn/UFxuiFjBBrI5qdUTMt994NFipG64LFHbPd0eOVvCWkyMdxEoG5/E2VPBOTQEOaATj6238QbEOww30lq9yrPCsEcyH/g6zj4y7T4HcXL3k6f/zbDvT1BMYgNeNHfPMR1V1uCadzU1YJmusc+23H/0WmD7pZpU7yOsMYd9d2fh1nJyoilZJIU67e5O8Bfkdn3QMbnXA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756157847; c=relaxed/relaxed;
	bh=SodRd8/l8bZXSul9LRhyWd7CWue1H3vk6/6DPpbt56E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SyVNd0WCrkWsHWzXX60J0VeWBlb14t17QG+cGOT6S69FZ5EqH8z3j+KIk6Jsf00zRp3pv3FSWKkUCCMPHjFmgy6+n2nNotMHDM9M4Gh71flf6kWG5T65GVKI61/JoCkwuDM3MvYyNaTWouO+UgcbQVunHSRhwpwRoRE3gEI3z3Crbx86eNk578E0cVUAWKuHUIYcIRX7ZM1PVvNOhjsqiMDZPeVITbPdR6FI4tMtYcN1mbMQ4E4cunWijeS/iVjGoqjtukm98Zs7Db+8p9Smw7fcHSrfs2+5aISnHs543sFAzqsQXB3e/ZghpP4WlFQ40XNw44U1HA13Dyh3xEvRKA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cHK0J2XK; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cHK0J2XK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=kees@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c9kfG3PdJz3clx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Aug 2025 07:37:26 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6D49406ED;
	Mon, 25 Aug 2025 21:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 567C9C113D0;
	Mon, 25 Aug 2025 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756157832;
	bh=R44bcAauESCYgLUnJio9oy6n01PzJ9gIprVhrTrJHrw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cHK0J2XKD7O53HrO4WZ8mbIIVXn1J5qjjnP+8NSiRBKE3qlSqot7fO4LiyDmh3qgE
	 994EaQi3GxaYUTiVcTdNq2CGuy4qPwf/BZ6vvOP7yQ30A6KQwyOxLpJ4d9L/7pKqbH
	 63qLEryMSPxlPH2YhbRhXt0pRoKURT7ELLjHiKpyDkSL4+J1AcoW5Sk8qXCImM2+ak
	 p+lYv9xx85LoSuSqFv4ayEsXAVqjvuHqIqMi44uUedVEGuxxRKPPODQHHSRnAgIdh6
	 6clMMLqdhTofD9UT8HCFqf2Jy7NMLg5RmykPuzN+FoKKgILHRb4q6/nyDxdavQQRRP
	 2Gu14gyBVu0BQ==
Date: Mon, 25 Aug 2025 14:37:11 -0700
From: Kees Cook <kees@kernel.org>
To: Uladzislau Rezki <urezki@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>,
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
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Rik van Riel <riel@surriel.com>,
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
Message-ID: <202508251436.762035B@keescook>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
 <d1588e7bb96d1ea3fe7b9df2c699d5b4592d901d.1750274467.git.lorenzo.stoakes@oracle.com>
 <aIgSpAnU8EaIcqd9@hyeyoo>
 <73764aaa-2186-4c8e-8523-55705018d842@lucifer.local>
 <aIkVRTouPqhcxOes@pc636>
 <69860c97-8a76-4ce5-b1d6-9d7c8370d9cd@lucifer.local>
 <aJCRXVP-ZFEPtl1Y@pc636>
 <aJHQ9XCLtibFjt93@kernel.org>
 <aJItxJNfn8B2JBbn@pc636>
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
In-Reply-To: <aJItxJNfn8B2JBbn@pc636>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Aug 05, 2025 at 06:13:56PM +0200, Uladzislau Rezki wrote:
> I agree. Also it can be even moved under vmalloc.c. There is only one
> user which needs it globally, it is usercopy.c. It uses find_vmap_area()
> which is wrong. See:
> 
> <snip>
> 	if (is_vmalloc_addr(ptr) && !pagefault_disabled()) {
> 		struct vmap_area *area = find_vmap_area(addr);
> 
> 		if (!area)
> 			usercopy_abort("vmalloc", "no area", to_user, 0, n);
> 
> 		if (n > area->va_end - addr) {
> 			offset = addr - area->va_start;
> 			usercopy_abort("vmalloc", NULL, to_user, offset, n);
> 		}
> 		return;
> 	}
> <snip>
> 
> we can add a function which just assign va_start, va_end as input
> parameters and use them in the usercopy.c. 

Yes please! I'd must rather use some exported validation routine than
having it hand-coded in usercopy.c. :)

-- 
Kees Cook

