Return-Path: <linuxppc-dev+bounces-9862-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED5EBAECC5E
	for <lists+linuxppc-dev@lfdr.de>; Sun, 29 Jun 2025 14:06:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVShD5xgmz2yfx;
	Sun, 29 Jun 2025 22:06:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.118
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751196557;
	cv=none; b=bJOwdxL9zd0eg+evdE1rT+QKHXtRgO9hetN3D/I8drG0cqQTxLvZ3l62Buj2VOjVL7D2yeKv8PZca8pFGltWGIzc1cp6pfsbYfL8aIBM8Tkf97w+WgWzuiMEgh844PsG77DoXbkKt21mAMQC00eZwhH0Dz/oajUw6nXlqSJT/HCiXDEUd/3Nd1KskOLaJIUIcfZhItecpzyqGwv5tuN6ta/XK20OKSuiXaL6CGude/hq7cV/6Pz9VhChnb0DwPtovwvpzT3MUdnt9uD7j9So2Z9Qvk6mf6hvWYwTOBL9YkGBRDg/wS2PsN3d78SDUPDAOn904zLSoOT0x5E2TDjcCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751196557; c=relaxed/relaxed;
	bh=Td91IaRHPLMg0S4S34rjLSxSTe+KTe00bq2/ozJgwkc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ZzR7RIkYZKx7PH25wbpqYQ8wilWnwIMZf7Z9SndTp0955uSaqomw3EOL9HCr8c9ozNiUD8+mF+8A+VQLHnCdPW2fwktoWUGw+LzlXu9JurIsHruQhrB/1FoCaKX5J8ujuhuskT67ZTk2VpCVEZTvkpdkLSegzxqn/lk4iV0JZmwM3jq1oHtu22iUjMaUWUfFOsiALWKv9jeGfJ4PwL1O9Uz1qCNP+PfQ216yYgDLAKpEvYEI6hV9W7CnETC2cEjoZ7aN7bAIBD39haSmuR9DZWMstP8j5JPBSe7GKwWnAGyXM2tY98tq+gBJUY//bDGfDHcdQHm0aGw3vqt17JnUWw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Hz1LZy6c; dkim-atps=neutral; spf=pass (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=Hz1LZy6c;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.118; helo=out30-118.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVRrq4vdxz2xS9
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 29 Jun 2025 21:29:13 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751196549; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=Td91IaRHPLMg0S4S34rjLSxSTe+KTe00bq2/ozJgwkc=;
	b=Hz1LZy6cpy+H/wOTzfnlqkK8lssQzmn/0qTy1P7WmiV3KlwlMKbecPTJO8dyT12Irra+c5wVQIU6mV/MxRmYG1HYuJ+a1nmQuLH/MnhVO7sWE23LbsG/WtLxPFhWpwFsGvRITpRueFdcMg/mFOxpCmRNArqZfSdRE+Q+8K4M+PI=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WfwyPTY_1751196530 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 29 Jun 2025 19:29:05 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: David Hildenbrand <david@redhat.com>, Zi Yan <ziy@nvidia.com>
Cc: Matthew Wilcox <willy@infradead.org>,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org,  linux-doc@vger.kernel.org,
  linuxppc-dev@lists.ozlabs.org,  virtualization@lists.linux.dev,
  linux-fsdevel@vger.kernel.org,  Andrew Morton
 <akpm@linux-foundation.org>,  Jonathan Corbet <corbet@lwn.net>,  Madhavan
 Srinivasan <maddy@linux.ibm.com>,  Michael Ellerman <mpe@ellerman.id.au>,
  Nicholas Piggin <npiggin@gmail.com>,  Christophe Leroy
 <christophe.leroy@csgroup.eu>,  Jerrin Shaji George
 <jerrin.shaji-george@broadcom.com>,  Arnd Bergmann <arnd@arndb.de>,  Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>,  "Michael S. Tsirkin"
 <mst@redhat.com>,  Jason Wang <jasowang@redhat.com>,  Xuan Zhuo
 <xuanzhuo@linux.alibaba.com>,  Eugenio =?utf-8?Q?P=C3=A9rez?=
 <eperezma@redhat.com>,
  Alexander Viro <viro@zeniv.linux.org.uk>,  Christian Brauner
 <brauner@kernel.org>,  Jan Kara <jack@suse.cz>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,  Rakie
 Kim <rakie.kim@sk.com>,  Byungchul Park <byungchul@sk.com>,  Gregory Price
 <gourry@gourry.net>,  Alistair Popple <apopple@nvidia.com>,  Lorenzo
 Stoakes <lorenzo.stoakes@oracle.com>,  "Liam R. Howlett"
 <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,  Mike
 Rapoport <rppt@kernel.org>,  Suren Baghdasaryan <surenb@google.com>,
  Michal Hocko <mhocko@suse.com>,  Minchan Kim <minchan@kernel.org>,
  Sergey Senozhatsky <senozhatsky@chromium.org>,  Brendan Jackman
 <jackmanb@google.com>,  Johannes Weiner <hannes@cmpxchg.org>,  Jason
 Gunthorpe <jgg@ziepe.ca>,  John Hubbard <jhubbard@nvidia.com>,  Peter Xu
 <peterx@redhat.com>,  Xu Xin <xu.xin16@zte.com.cn>,  Chengming Zhou
 <chengming.zhou@linux.dev>,  Miaohe Lin <linmiaohe@huawei.com>,  Naoya
 Horiguchi <nao.horiguchi@gmail.com>,  Oscar Salvador <osalvador@suse.de>,
  Rik van Riel <riel@surriel.com>,  Harry Yoo <harry.yoo@oracle.com>,  Qi
 Zheng <zhengqi.arch@bytedance.com>,  Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH RFC 07/29] mm/migrate: rename isolate_movable_page() to
 isolate_movable_ops_page()
In-Reply-To: <bef13481-5218-4732-831d-fe22d95184c1@redhat.com> (David
	Hildenbrand's message of "Mon, 23 Jun 2025 17:33:15 +0200")
References: <20250618174014.1168640-1-david@redhat.com>
	<20250618174014.1168640-8-david@redhat.com>
	<9F76592E-BB0E-4136-BDBA-195CC6FF3B03@nvidia.com>
	<aFMH0TmoPylhkSjZ@casper.infradead.org>
	<4D6D7321-CAEC-4D82-9354-4B9786C4D05E@nvidia.com>
	<bef13481-5218-4732-831d-fe22d95184c1@redhat.com>
Date: Sun, 29 Jun 2025 19:28:50 +0800
Message-ID: <87h5zyrdl9.fsf@DESKTOP-5N7EMDA>
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
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

David Hildenbrand <david@redhat.com> writes:

> On 18.06.25 20:48, Zi Yan wrote:
>> On 18 Jun 2025, at 14:39, Matthew Wilcox wrote:
>> 
>>> On Wed, Jun 18, 2025 at 02:14:15PM -0400, Zi Yan wrote:
>>>> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
>>>>
>>>>> ... and start moving back to per-page things that will absolutely not be
>>>>> folio things in the future. Add documentation and a comment that the
>>>>> remaining folio stuff (lock, refcount) will have to be reworked as well.
>>>>>
>>>>> While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
>>>>> it gracefully (relevant with further changes), and convert a
>>>>> WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().
>>>>
>>>> The reason is that there is no upstream code, which use movable_ops for
>>>> folios? Is there any fundamental reason preventing movable_ops from
>>>> being used on folios?
>>>
>>> folios either belong to a filesystem or they are anonymous memory, and
>>> so either the filesystem knows how to migrate them (through its a_ops)
>>> or the migration code knows how to handle anon folios directly.
>
> Right, migration of folios will be handled by migration core.
>
>> for device private pages, to support migrating >0 order anon or fs
>> folios
>> to device, how should we represent them for devices? if you think folio is
>> only for anon and fs.
>
> I assume they are proper folios, so yes. Just like they are handled
> today (-> folios)
>
> I was asking a related question at LSF/MM in Alistair's session: are
> we sure these things will be folios even before they are assigned to a
> filesystem? I recall the answer was "yes".
>
> So we don't (and will not) support movable_ops for folios.

Is it possible to use some device specific callbacks (DMA?) to copy
from/to the device private folios (or pages) to/from the normal
file/anon folios in the future?

---
Best Regards,
Huang, Ying

