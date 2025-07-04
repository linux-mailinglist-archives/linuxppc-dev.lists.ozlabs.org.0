Return-Path: <linuxppc-dev+bounces-10120-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 122CAAF9BD5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jul 2025 23:06:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bYmQZ6dGJz30Tm;
	Sat,  5 Jul 2025 07:06:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751663190;
	cv=none; b=ZvOXX7teYmr2PlKSJ26+/ckQoGmT4WrlRd0F5U3jpTuRABgTNvJkyNJla1My0SPOuUu+pTXHy0fzglPa0iRXKPb3VOlSbuO5UPR73qALqA49fgH8edvJdyd6YD1AsdBv+0k+gy/rFO99jPfS3o24xv2bfVU++r3LfZfLsehpTQOm8lm2qTqFJMJvfYi3R2Xf4tGUKBMxRqGzr6HqDKccPelILNAPXTkSQaY0RKvtN9MgTbY+5aqv2sRknd+533DC8DvdShkbFcBBckwAJNiT1cEh9qhg4t1k0az5GmCYTlk+mUgCG8VBHLwF/vemmyxunTqgqsYEEUEQ+r0ILT08/g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751663190; c=relaxed/relaxed;
	bh=rz1wYmtKueq5l7IHoM3D8osm91cbs1ouesF/PNHx3gU=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=iZov3JkOjJcp4Ct6iMGMQG3g2C7SvJPuOSk70T5UCL/z4hav/P4euebJ2WSBwiuZQDSv7SactM7RtbjrBtYKjXr1SdylCke9Po6C8HyhVhR9C7m4DvFlRA6t9BlCi51t5KCU6E/T87yP5x6Tr0PH4JjCBc+zU+XAfr0xkUofo4SaaOqlJ3X6E70SZY57FzQPqzzgbDXKcpXmN6q4FvFJH5bKFEJODLSBwzkZqONI4XtKTQ1TC7q75l/D7ZXCf2P7HYRvMOIbSFuzNcVHwqA8xYvhhHixQOYusasM+ZRXtHIzpRCLY9RljUXO9YLmQQwT9J//q05AV+h4hp9Arjb2Rg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=y88kB/pc; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linux-foundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=korg header.b=y88kB/pc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux-foundation.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=akpm@linux-foundation.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bYmQY1Kj6z2xd3
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  5 Jul 2025 07:06:28 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EE5861469;
	Fri,  4 Jul 2025 21:06:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27406C4CEE3;
	Fri,  4 Jul 2025 21:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1751663185;
	bh=f1hFiasjHfmlcHU6lmk4NYAher/zzJdd1u4QQBrYVJ8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=y88kB/pcD4E4EqtT4CkMHjZGaNV/MSL+BfunpDneJYf0u7QKpcXsSW9s14r8BkNmx
	 WaI24KqTkwL1L2kVQDd0U0gUqzKoB3oOSJKBdiYtW2qefak2kybpZOsGNd5sTK4MTP
	 njKj4JxNYga3WE9rzmNqEaH7gILlxUtdajr7p1I8=
Date: Fri, 4 Jul 2025 14:06:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, Jonathan
 Corbet <corbet@lwn.net>, Madhavan Srinivasan <maddy@linux.ibm.com>, Michael
 Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Jerrin Shaji George
 <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowang@redhat.com>, Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>, Eugenio =?UTF-8?B?UMOpcmV6?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, Christian
 Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Zi Yan
 <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>, Joshua Hahn
 <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>, Byungchul Park
 <byungchul@sk.com>, Gregory Price <gourry@gourry.net>, Ying Huang
 <ying.huang@linux.alibaba.com>, Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett"
 <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport
 <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko
 <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, Minchan
 Kim <minchan@kernel.org>, Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner
 <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin
 <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>, Miaohe
 Lin <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>, Harry
 Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel
 Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v2 00/29] mm/migration: rework movable_ops page
 migration (part 1)
Message-Id: <20250704140623.d6b9a013984bc2a109dd4dc9@linux-foundation.org>
In-Reply-To: <20250704102524.326966-1-david@redhat.com>
References: <20250704102524.326966-1-david@redhat.com>
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri,  4 Jul 2025 12:24:54 +0200 David Hildenbrand <david@redhat.com> wrote:

> In the future, as we decouple "struct page" from "struct folio", pages
> that support "non-lru page migration" -- movable_ops page migration
> such as memory balloons and zsmalloc -- will no longer be folios. They
> will not have ->mapping, ->lru, and likely no refcount and no
> page lock. But they will have a type and flags 🙂
> 
> This is the first part (other parts not written yet) of decoupling
> movable_ops page migration from folio migration.
> 
> In this series, we get rid of the ->mapping usage, and start cleaning up
> the code + separating it from folio migration.
> 
> Migration core will have to be further reworked to not treat movable_ops
> pages like folios. This is the first step into that direction.
> 
> Heavily tested with virtio-balloon and lightly tested with zsmalloc
> on x86-64. Cross-compile-tested.

Thanks, I added this to mm-new.  I suppressed the 1363 mm-commits
emails to avoid breaking the internet.


