Return-Path: <linuxppc-dev+bounces-9866-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBD5AED22C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 03:18:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVpG705yNz2yfx;
	Mon, 30 Jun 2025 11:18:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.132
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751246334;
	cv=none; b=RreBImshoCmLdv4JzFRTJ/K95jHb6Mc89gk8kt5Ez89q/dyZ0+ulEc/OboNhYLYTxvx3a1MArpwz4+qX5BbSgHKlZl5rRg5EuRRPDv6yBgHzHQbxcCHiK2MFVqrQuDDc6V03gqhwjnuVoXYn2/h2z+dy6TmYkgC8fzxubHxYsmqMRL/PNjuPdmollPuyn2HAvp2XEjnTsQszOyoKTgkLHMSxRpx1zcYK8YLPm9QrRz3C1Zct+ysz5Xn7NkiJds7TIV3x7/MSSQpXhJ5zMlvKaALvTmPSZ8zuu7CYN/UMbiA/iGsW1AxW2SyD9muGXrtIItaCDXqwlbA19d9dbdGdBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751246334; c=relaxed/relaxed;
	bh=RbZOpy8J0k5RuQe6TfwdpEBKFEQv7E87hUnTEjHxunw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=GYM+lsqVDWVImcGWTvRsa6rRl/w4Vj8rxZkZP/cF4BZ12/V7ECtJVNnIQqsFZube+Z4O/zDe9iB3Nz//0NbiF1mev4N6XWUCJNzFau9FEbh1ViolG9uGhkiSAkiY89XqpZdcjTdz5wMz9DAIoVPOhOqeuaeiI+5KTYPUkE9NEYMfKJoJHU2AFZkvHkAxYJ75Di55Vw/lWJ4xUsHwKeCq/KNmS5BpfYXyDeyiWgwVCcZpX7DYxDQbDbyAW4MmQHbWMrpUthtGaTfU3EMyMWNCsRTJgpmD1E5uYqjQI3jGN7xxBN1c1+ZEoPYLkjKRnQUT1QT0y+Z0cj/grJ6OR+GlJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=e3Usm7JX; dkim-atps=neutral; spf=pass (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=e3Usm7JX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.132; helo=out30-132.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVpG45qzRz2yft
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 11:18:51 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751246327; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=RbZOpy8J0k5RuQe6TfwdpEBKFEQv7E87hUnTEjHxunw=;
	b=e3Usm7JX62/lShfnLGXJEYUQBHkBM1W3N6G+pWyn3J8vywke3JuhDEQB71MTN0ZtRDSwBD+w+MVoQfO+Qzqc64pU4taiWl6EfrNt7zknFHVDhkAWHyWJ3jT/MxhQo09t4rlAVb+V69xEvrmRTCZXgzgp8qLrnzuLkc851SR52zI=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wg2L3YV_1751246322 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 09:18:43 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>
Cc: linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  linux-doc@vger.kernel.org,  linuxppc-dev@lists.ozlabs.org,
  virtualization@lists.linux.dev,  linux-fsdevel@vger.kernel.org,  Andrew
 Morton <akpm@linux-foundation.org>,  Jonathan Corbet <corbet@lwn.net>,
  Madhavan Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman
 <mpe@ellerman.id.au>,  Nicholas Piggin <npiggin@gmail.com>,  Christophe
 Leroy <christophe.leroy@csgroup.eu>,  Jerrin Shaji George
 <jerrin.shaji-george@broadcom.com>,  Arnd Bergmann <arnd@arndb.de>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,
  Alexander Viro <viro@zeniv.linux.org.uk>,  Christian Brauner
 <brauner@kernel.org>,  Jan Kara <jack@suse.cz>,  Zi Yan <ziy@nvidia.com>,
  Matthew Brost <matthew.brost@intel.com>,  Joshua Hahn
 <joshua.hahnjy@gmail.com>,  Rakie Kim <rakie.kim@sk.com>,  Byungchul Park
 <byungchul@sk.com>,  Gregory Price <gourry@gourry.net>,  Alistair Popple
 <apopple@nvidia.com>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
  "Liam R. Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka
 <vbabka@suse.cz>,  Mike Rapoport <rppt@kernel.org>,  Suren Baghdasaryan
 <surenb@google.com>,  Michal Hocko <mhocko@suse.com>,  "Matthew Wilcox
 (Oracle)" <willy@infradead.org>,  Minchan Kim <minchan@kernel.org>,
  Sergey Senozhatsky <senozhatsky@chromium.org>,  Brendan Jackman
 <jackmanb@google.com>,  Johannes Weiner <hannes@cmpxchg.org>,  Jason
 Gunthorpe <jgg@ziepe.ca>,  John Hubbard <jhubbard@nvidia.com>,  Peter Xu
 <peterx@redhat.com>,  Xu Xin <xu.xin16@zte.com.cn>,  Chengming Zhou
 <chengming.zhou@linux.dev>,  Miaohe Lin <linmiaohe@huawei.com>,  Naoya
 Horiguchi <nao.horiguchi@gmail.com>,  Oscar Salvador <osalvador@suse.de>,
  Rik van Riel <riel@surriel.com>,  Harry Yoo <harry.yoo@oracle.com>,  Qi
 Zheng <zhengqi.arch@bytedance.com>,  Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 13/29] mm/balloon_compaction: stop using
 __ClearPageMovable()
In-Reply-To: <20250618174014.1168640-14-david@redhat.com> (David Hildenbrand's
	message of "Wed, 18 Jun 2025 19:39:56 +0200")
References: <20250618174014.1168640-1-david@redhat.com>
	<20250618174014.1168640-14-david@redhat.com>
Date: Mon, 30 Jun 2025 09:18:42 +0800
Message-ID: <87ldpaowlp.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
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
Content-Type: text/plain; charset=ascii
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

David Hildenbrand <david@redhat.com> writes:

> We can just look at the balloon device (stored in page->private), to see
> of the page is still part of the balloon.

s/of/if/

?

just a trivial issue if I'm not wrong.

> As isolated balloon pages cannot get released (they are taken off the
> balloon list while isolated), we don't have to worry about this case in
> the putback and migration callback. Add a WARN_ON_ONCE for now.
>
> Signed-off-by: David Hildenbrand <david@redhat.com>

[snip]

---
Best Regards,
Huang, Ying

