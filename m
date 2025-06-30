Return-Path: <linuxppc-dev+bounces-9865-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 093F6AED20F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Jun 2025 02:58:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bVnpJ2D7dz2yft;
	Mon, 30 Jun 2025 10:58:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.113
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751245096;
	cv=none; b=aCkcsnGOPzE9oTdcK3+D0NW7S2a7kyPEJdYC1th3CSwHJ2LwbMMEBFe1PCURof+WsJFx7f50XTu2m5PgOCgPyzMdVjYgl9BtRPghcPm7g5ag8Imtg7t8ONqEev9CE02jxmJgAf+XBfldqbMNDSnRbStpzOCHjKIBR3OpvA0+CceA6pyNxdjd8EIeAn1kYYNh/U4PrO2Q1k/xA7quSQ7HMFTlG3bby65+MtkqZhH5G6UQJtIwDzXjKXX0dwhPeC6bx02Fg/OoJqkmGyMr60lMSExVNm7BIUxvu9aHKTBarUxQFRKnTHslTJBN2Oo3JmR19G7W7ScT2M9wuv9e+tPp8A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751245096; c=relaxed/relaxed;
	bh=KE5Ke26crJ20g62CV0eTsdMDqmR58zlWRKiqOi/7eNA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bZlTl8aY1tu+7uYVqB3PEOw49QX0BNQaH+1agdjg+RjkTewfbvLC/38LKRwDF/CoR/Z0b020N3GWwGI5I/0PGhOV5Q8wl/DTRxSeO9kBSu+OQNk3IiBrjmUlvpt1evpT4PGAU0Mgi2pz5kpVuxcNyhNt+bh9KJu551bp43jYopY0A0mBEJ76JwOB4PdGnUz8IJlynV2F6X1bXZ28YI3+z1Ds5AU48qLNEb5rJcbGqQlEPkOCJHUy0Z2R6q4pcy8IGmGpRppqQT8xEMG097A+cQ3xyqy4bof3AWMTxGwak0xUMaLlxBeRO90LAiE8FSmod02yEjpAwauq3EqfuzQ2HA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JsOjj3LY; dkim-atps=neutral; spf=pass (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=JsOjj3LY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.113; helo=out30-113.freemail.mail.aliyun.com; envelope-from=ying.huang@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bVnpG184Jz2ydj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Jun 2025 10:58:12 +1000 (AEST)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751245088; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=KE5Ke26crJ20g62CV0eTsdMDqmR58zlWRKiqOi/7eNA=;
	b=JsOjj3LYAE/2bD8rhcWjCHpgvFs8SF2+iSPiyKRiZMX4yYw57ND0HRo17ezy1J7U17SihYB3QNbMaF1IaXqWHih3K2OlF5ffgB1jpzudQs6jpzxUufyTmi/Q7MwYzgtIXKa8QMqEr7FgVq/xZ60CRvs/OxzAYAikw3KX9gfGkzQ=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0Wg25R9f_1751245082 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 08:58:04 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Alistair Popple <apopple@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>,  Zi Yan <ziy@nvidia.com>,  Matthew
 Wilcox <willy@infradead.org>,  linux-kernel@vger.kernel.org,
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
 <gourry@gourry.net>,  Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  "Liam
 R. Howlett" <Liam.Howlett@oracle.com>,  Vlastimil Babka <vbabka@suse.cz>,
  Mike Rapoport <rppt@kernel.org>,  Suren Baghdasaryan <surenb@google.com>,
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
In-Reply-To: <nr4e7unt2dtfav5y5ckmsrehu37xejqonarlulzcn6mnhnnvxl@o3ppo34wqyyj>
	(Alistair Popple's message of "Mon, 30 Jun 2025 10:20:56 +1000")
References: <20250618174014.1168640-1-david@redhat.com>
	<20250618174014.1168640-8-david@redhat.com>
	<9F76592E-BB0E-4136-BDBA-195CC6FF3B03@nvidia.com>
	<aFMH0TmoPylhkSjZ@casper.infradead.org>
	<4D6D7321-CAEC-4D82-9354-4B9786C4D05E@nvidia.com>
	<bef13481-5218-4732-831d-fe22d95184c1@redhat.com>
	<87h5zyrdl9.fsf@DESKTOP-5N7EMDA>
	<nr4e7unt2dtfav5y5ckmsrehu37xejqonarlulzcn6mnhnnvxl@o3ppo34wqyyj>
Date: Mon, 30 Jun 2025 08:58:03 +0800
Message-ID: <878qlaqc4k.fsf@DESKTOP-5N7EMDA>
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

Alistair Popple <apopple@nvidia.com> writes:

> On Sun, Jun 29, 2025 at 07:28:50PM +0800, Huang, Ying wrote:
>> David Hildenbrand <david@redhat.com> writes:
>> 
>> > On 18.06.25 20:48, Zi Yan wrote:
>> >> On 18 Jun 2025, at 14:39, Matthew Wilcox wrote:
>> >> 
>> >>> On Wed, Jun 18, 2025 at 02:14:15PM -0400, Zi Yan wrote:
>> >>>> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
>> >>>>
>> >>>>> ... and start moving back to per-page things that will absolutely not be
>> >>>>> folio things in the future. Add documentation and a comment that the
>> >>>>> remaining folio stuff (lock, refcount) will have to be reworked as well.
>> >>>>>
>> >>>>> While at it, convert the VM_BUG_ON() into a WARN_ON_ONCE() and handle
>> >>>>> it gracefully (relevant with further changes), and convert a
>> >>>>> WARN_ON_ONCE() into a VM_WARN_ON_ONCE_PAGE().
>> >>>>
>> >>>> The reason is that there is no upstream code, which use movable_ops for
>> >>>> folios? Is there any fundamental reason preventing movable_ops from
>> >>>> being used on folios?
>> >>>
>> >>> folios either belong to a filesystem or they are anonymous memory, and
>> >>> so either the filesystem knows how to migrate them (through its a_ops)
>> >>> or the migration code knows how to handle anon folios directly.
>> >
>> > Right, migration of folios will be handled by migration core.
>> >
>> >> for device private pages, to support migrating >0 order anon or fs
>> >> folios
>> >> to device, how should we represent them for devices? if you think folio is
>> >> only for anon and fs.
>> >
>> > I assume they are proper folios, so yes. Just like they are handled
>> > today (-> folios)
>
> Yes, they should be proper folios.

So, folios include file cache, anonymous, and some device private.

>> > I was asking a related question at LSF/MM in Alistair's session: are
>> > we sure these things will be folios even before they are assigned to a
>> > filesystem? I recall the answer was "yes".
>> >
>> > So we don't (and will not) support movable_ops for folios.
>> 
>> Is it possible to use some device specific callbacks (DMA?) to copy
>> from/to the device private folios (or pages) to/from the normal
>> file/anon folios in the future?
>
> I guess we could put such callbacks on the folio->pgmap, but I'm not sure why
> we would want to. Currently all migration to/from device private (or coherent)
> folios is managed by the device, which is one of the features of ZONE_DEVICE.

Yes.  The is the current behavior per my understanding too.

> Did you have some particular reason/idea for why we might want to do this?

No.  Just want to check whether there are some requirements for that.  I
think that it's just another way to organize code.

---
Best Regards,
Huang, Ying

