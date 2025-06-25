Return-Path: <linuxppc-dev+bounces-9690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625EAE762B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jun 2025 06:51:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bRqC65k7vz306l;
	Wed, 25 Jun 2025 14:50:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750827058;
	cv=none; b=fX42zJ5gBBjdphJfpgM+i2//H6FMRq2bzd/jaj6M9faBLS6Rd964fv6irDUa2G2XOxi9iDuegQEeFBYc6nSeyVTqfCPFiT3XO6SWZflDNOvz0w+h4275pHSGiriH22YZoEM3v45v871WvXHkkxeWUmQZIr6BVcVHkQyuw1ocoN63yj3GC1WggAM198x+3bb1ot+AY0WmflEv4kI5IPMrydFjHagFkZPTeewmQm4fOO844RK0UJal4TPSZZWV5MCsXbMHkHBFAyLf1RghX647wWRyIzKNlan7T8cfq+/6mZhTAU3gqv4PpZN7E1UqoFV6eY9NfuigHw2M5nmsmzrsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750827058; c=relaxed/relaxed;
	bh=+mzb335htQd/H0Ye3in+i5hEmxFCkf2WhzsbXYfIdpM=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=e63VaAjP71nEfPXh7f0PpM+qgZa84fXZv5OZil9YPDE5XFdNTOzg4s5h+ChVMNhGcQatsp/2LIvfBVl1Je/D4TQcyZrEY6VdEiJ1Ku/CvrLrJD+QGVJ2SEkZYYNH7UlaPPzUhFx2LWCry1V03ruyONOth0uwJFRbZJ1bnU+lQNTscT4uW2wdiq+XJmmqFiNI6UeFrHfSkI5AtjnUwcSam4dB73QKiSvmkvpWwLk6xxjz/OplcM3CrCyNKcpVabd3QpMGh5d19QsrYEo2ZmIZZZXGvdWz6UKrkOtvChXcbPnasIT3K6u+D2V7GhbKp2atRwWwVQniu4Dam5dRmqF5iw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gdUJ68Xs; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=gdUJ68Xs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bRqC56JgSz2yFQ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jun 2025 14:50:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A64BF6116E;
	Wed, 25 Jun 2025 04:50:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D38C4CEEA;
	Wed, 25 Jun 2025 04:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1750827053;
	bh=R3JC+OY5M+o//Yl1v0b97s5nFwwOQDq4EZehW1mQ9d0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=gdUJ68XsmACxGdWI0eeeUoyOpEd28QFbC5WF3ix1zVAhBU7SFhiYWzSzFKt2ZrlWj
	 7iLbdug9pCu0GEEFGqG+eqSMBxxL3g3OVdWo8LF89sjc+P7CwNFlRebQlMJYAazuip
	 /uC9+0HyTEjBaK8UN8Dl5XE5P6m7252PiMnt5lv8=
Date: Tue, 24 Jun 2025 21:50:50 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Russell King
 <linux@armlinux.org.uk>, Catalin Marinas <catalin.marinas@arm.com>, Will
 Deacon <will@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, "David S . Miller"
 <davem@davemloft.net>, Andreas Larsson <andreas@gaisler.com>, Jarkko
 Sakkinen <jarkko@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>, Andy
 Lutomirski <luto@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner
 <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Kees Cook <kees@kernel.org>,
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, Zi Yan
 <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>, Dev Jain
 <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, Xu Xin
 <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Hugh
 Dickins <hughd@google.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, Rik van Riel <riel@surriel.com>, Harry Yoo
 <harry.yoo@oracle.com>, Dan Williams <dan.j.williams@intel.com>, Matthew
 Wilcox <willy@infradead.org>, Steven Rostedt <rostedt@goodmis.org>, Masami
 Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Jason Gunthorpe <jgg@ziepe.ca>, John
 Hubbard <jhubbard@nvidia.com>, Muchun Song <muchun.song@linux.dev>, Oscar
 Salvador <osalvador@suse.de>, Jann Horn <jannh@google.com>, Pedro Falcato
 <pfalcato@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, Qi Zheng
 <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-sgx@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] use vm_flags_t consistently
Message-Id: <20250624215050.83229f93cee5994f580720e6@linux-foundation.org>
In-Reply-To: <46432a2e-1a9d-44f7-aa09-689d6e2a022a@arm.com>
References: <cover.1750274467.git.lorenzo.stoakes@oracle.com>
	<46432a2e-1a9d-44f7-aa09-689d6e2a022a@arm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
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
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, 25 Jun 2025 08:25:35 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:

> ust wondering which tree-branch this series applies ? Tried all the usual
> ones but could not apply the series cleanly.
> 
> v6.16-rc3
> next-20250624
> mm-stable
> mm-unstable

It's now in mm-unstable if that helps.

