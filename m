Return-Path: <linuxppc-dev+bounces-10077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D87AF6BF9
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jul 2025 09:50:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bXpnx2Lkqz2yhX;
	Thu,  3 Jul 2025 17:49:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::631"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751528997;
	cv=none; b=KuWqJf++E3DAG+mnFzv2bvG45JpUx8IbwABy/vZr37w4ohsiYANEK7KNHDw/Bos38uIX7Lx2TOpQVuTDWL376iq+Yr1ujNFdqHjllsU00mq+AyyqFPPLSVKCY9yWQNfLKupximei39Oxy1F4t6ZSMaxpzoDDkfvxYZXErybu/646yPcFumGv3r+25cAaoHBqdPHPW0E3pSHNWSkVKFnqAkIoy5VGBpFe2gCfzzgcD024xXMAJJsSkGRRLV5IFEIQAackhkNE3yvHtpuHMUtpF7Ig2CJHFumVXQwS7mDxcJRJeOMBPOLIOINF77j/P7o1yaJjnCSKxxW26eI38v5oPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751528997; c=relaxed/relaxed;
	bh=4rdlP0nTwM1j9GZkgPlLuvN9K1I59CDnggPz0pqAh0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lGlBy1lDSHj0k5GpfOSUVJBwlizElHWvbeH9U/gpq40HiJ4h1L81/Ns5tzz734DPgvQV+fg9Qq4AEUKVwOTdVSEmUjOkMBXPUa4LSzXgHkP4Hq0dKV7/Au+RTF3SD3futtPfAPjnjwxru6vggFHyuVl1k92+ovTjHQ7KufNPCZRg8lCwrCjqrT8LWa+N4LZZpXi0j9pyhRlb+9noS5za78q82dB0TDfkhx2GP6YpOZyNC7PvqGQ1A+UVTjLzt3FT9kkQd5seAcclDLTbKdA7Pc09kUI61knO+pZzKuE3YVIy5cuqj8byVU7wYFJVmbpObgR+KuG+E2bso4+pV/hh3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i9vWAlkm; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=i9vWAlkm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=senozhatsky@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bXpns23lHz2yPd
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jul 2025 17:49:52 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-234f17910d8so75289685ad.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Jul 2025 00:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751528990; x=1752133790; darn=lists.ozlabs.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4rdlP0nTwM1j9GZkgPlLuvN9K1I59CDnggPz0pqAh0M=;
        b=i9vWAlkmwtI5cA+SVhVbuxlpXFmiwbhJTmm8vtSmD687kE32lJ0pzfaLyFokMYKPiq
         ckF2TO0yeVUkdYhxbmipPJAwC1yL3BXsOx7IvzHWtTPa0klRMCZQSQZEmzbYU1AcvSpI
         grtnn6ItYys3+YG0V7B7rOWWBLnCyNArAnYUQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751528990; x=1752133790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4rdlP0nTwM1j9GZkgPlLuvN9K1I59CDnggPz0pqAh0M=;
        b=fL1sHTZqtjEOCWn/RGDRj+OSPpjvRAiP2PRYpOFzCc4FKyjl24K5TgckyVJ4733Q2N
         w4myvsb47VQg0AA50xWqm6URScpUSkmUCMEVN6Q5VJC/JHmNFoOY3BQX7xTlwhf5EaZz
         gfGo4kSlBqAWzTApaD8hLKzITGgCtSqCqobOkbZGnas0GAo2wIqvSH0dMaxNz0zGDfLK
         foHB9owwYE4GMtnOc+gZI33HWayDUJ4LYg7oCn3DXjZvJaxZd/Wzvjyx306T6+Pi1T+e
         okNwDUyaJdPJrR7v0z0u8GxinBTZ9FVREPbQm8BXgaavZ3nvzZ112SD03vk2ljqshynr
         Gerg==
X-Forwarded-Encrypted: i=1; AJvYcCXeWuPinDs6SSQ/eUy7ypeUcsB6lmg5RxvaFjfeVGO28BEMsTaNtA+ouNiDL2yUA3PKja2iUKew8TBulSg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxK7Q2mbOW4XEYg5RkQ9TkFGXbX7HKUFWNAafBleD1urmwue/wM
	3X0WOVzEDE8WfA1/UqKzj+5P/Mtbao5/BPjyqhZlQYnTzQp8kVY6XDvIsfdj9K3pYg==
X-Gm-Gg: ASbGncsVy6HgH9Ovqi7/jjzSP+/gJbxeZ/ikS4d5iWuztceQSfG1e9KI7vmG1kMTP/O
	M9P4Y+IMt2TqUwRO6QRpRNwycxGMAV/43P9rHX7LTQfJMheLlC5czW5uyU49rA2AIZWvzyot7EL
	5/RCWHI2/V2I7rGCLKToARK6cqmIWc+m/Dv33brfB2ICq2MKGMJjzclxoiE+RQAdaqeaznRP6lQ
	SopSETE3wi0IPjuwYzzQk3N0z63tW1Okbs6dVMwSonWfpQWkg0UPpI707MIZ718GGUDCEke4ANC
	KbrqFKVKuL8rKRSl172r0Wotlykt/x2rnhLq+zuz4mxIO6uRodQuj3oLGNDfd3sG5w==
X-Google-Smtp-Source: AGHT+IEKxYsiAxh8kaPSjnmxQLTx3GgbE7KRESYB7LYtUj4r49YBA8q40hB+RM5u8/Kf7sPDiMHXFw==
X-Received: by 2002:a17:903:1b65:b0:235:f2d7:375e with SMTP id d9443c01a7336-23c79842f5cmr39376735ad.52.1751528990271;
        Thu, 03 Jul 2025 00:49:50 -0700 (PDT)
Received: from google.com ([2401:fa00:8f:203:8e3f:7c33:158f:349b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39ba83sm144377755ad.89.2025.07.03.00.49.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:49:49 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:49:37 +0900
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: David Hildenbrand <david@redhat.com>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, linux-doc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jerrin Shaji George <jerrin.shaji-george@broadcom.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowang@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Matthew Brost <matthew.brost@intel.com>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
	Rakie Kim <rakie.kim@sk.com>, Byungchul Park <byungchul@sk.com>, 
	Gregory Price <gourry@gourry.net>, Ying Huang <ying.huang@linux.alibaba.com>, 
	Alistair Popple <apopple@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>, 
	Minchan Kim <minchan@kernel.org>, Brendan Jackman <jackmanb@google.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>, 
	Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin <linmiaohe@huawei.com>, 
	Naoya Horiguchi <nao.horiguchi@gmail.com>, Oscar Salvador <osalvador@suse.de>, 
	Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Shakeel Butt <shakeel.butt@linux.dev>
Subject: Re: [PATCH v1 12/29] mm/zsmalloc: stop using __ClearPageMovable()
Message-ID: <w2hhkx6nwgtk22bcyqm7drvozddwiumj6glixpyrrub7f4ivvf@3as22jquijyu>
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-13-david@redhat.com>
 <zmsay3nrpmjec5n7v44svfa7iwl6vklqan4dgjn4wpvsr5hqt7@cqfwdvhncgrg>
 <757cf6b9-730b-4b12-9a3d-27699e20e3ac@redhat.com>
 <ugm7j66msq2w2hd3jg3thsxd2mv7vudozal3nblnfemclvut64@yp7d6vgesath>
 <11de6ae0-d4ec-43d5-a82e-146d82f17fff@redhat.com>
 <5thkl2h5qan5gm7putqd4o6yn5ht2c5zeei5qbjoni677xr7po@kbfokuekiubj>
 <vscedd6m3cq73c5ggjjz6ndordivgeh4dmvzeok222bnderr5c@dujm4ndthtxb>
 <6a83e3e1-ab1d-409b-8395-df363321cade@redhat.com>
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
In-Reply-To: <6a83e3e1-ab1d-409b-8395-df363321cade@redhat.com>
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On (25/07/03 09:45), David Hildenbrand wrote:
> Not sure if there is real value for that; given the review status, I assume
> this series won't take too long to be ready for upstream. Of course, if that
> is not the case we could try pulling them out.

Sounds good to me.

