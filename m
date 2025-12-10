Return-Path: <linuxppc-dev+bounces-14715-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E69DCB2E4C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Dec 2025 13:31:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dRFSZ6DlFz2yKr;
	Wed, 10 Dec 2025 23:31:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765369870;
	cv=none; b=lG/5YWPCa0evJRK55c8yHH9fvKG8dT6eiG89eAABd0xVM82BoWlD0oHg7UuXaCT23ArD+p0skaPGtsooSnEgCEH9hc8N9IWS99vFuXojbK2Z0YpHAJMhNUVVzpokuA2s6ZaKoM3V+EAmEQ0oYIOa5rzGJLXH3C6IrR9M+BBR65WH1qlOVOyON9fIipkKH2YlY9g+zsBMDGB4RCIaSTmgyaMAY+zdZwd1phiZqqz23I+aa314dSnRyX6PAunViu5yJW5UWcY7kMXvCLbXJQDo1T6Cs6XPDPTFZxluV+FP0hVqvFGFJG3NRaZr6A7FNbFsC8tgZQPuf3M4Eki6DKO/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765369870; c=relaxed/relaxed;
	bh=bs4Nvh7wcafrSDigF6jb9/xBl2rvyHdC6iSByDm1J7c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DsPuwyDKfSwsin0aZcFTpbA95G5avMNGpQaNhfXekhQs364EGxqqAUPJ8GJ5PcH0iQeWvQBpTuA3wvXvuV3SE98vJzRPBIMSFYxnIQFTE3Y2/ZYvmtf/Hz1VzuQkFQfLKZQrFcKx7xgSIgTE7VJYxxPCHP06kY9ODCDqOyCg6VHSIvL3glluFlgAcQ2lTGKA2sQFV6EiuQnAwQb8dN2jb+k4TOsxY1Z0e1QuQnfIP7aprNy82ajFAgkdRPF1E4HVPrAG76d90qiuu9vQIjLW/izgFSBhd+lvoM/+TaHZkvq+G/LHVKf2SZaSWjMjQWk0jY8F0tiBrdqk6BCmbPjnKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fESva4RG; dkim-atps=neutral; spf=pass (client-ip=74.125.224.43; helo=mail-yx1-f43.google.com; envelope-from=joshua.hahnjy@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=fESva4RG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=74.125.224.43; helo=mail-yx1-f43.google.com; envelope-from=joshua.hahnjy@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dRFSY18z6z2yHD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 23:31:07 +1100 (AEDT)
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-64472ea7d18so370041d50.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Dec 2025 04:31:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765369805; x=1765974605; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bs4Nvh7wcafrSDigF6jb9/xBl2rvyHdC6iSByDm1J7c=;
        b=fESva4RGgakA5+Yaww1eVu1xPDMahy9414A4voZofPvgAth9beLsdRfz73cg9xNj3t
         HXtlwF6TeyZL1n1WAG3chtoC2fKVcdsh8v1D06ujnADFUhgKUtJkHcm5O5M7tr5Vregf
         jpID+79K8npEVpyCwTNLyQf+cwULBv04EMDHy535bvgdDCyFnsblJ3kpJvN+/D6+NOUw
         6fOOlGWGhZxOx7DHouzD/Nk4BL/ev5J9Y/7XfpMv4zy5cO6ZyLE7kwFtitN8dssH/1OC
         vq0vrky4YweMO7+K3bA0nb+bMsGRJVUe9NpQGSrgfO2s0D78XucNwzUIZYIa3cAqn1x0
         w86A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765369805; x=1765974605;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bs4Nvh7wcafrSDigF6jb9/xBl2rvyHdC6iSByDm1J7c=;
        b=KvfCLc2ERH/4GN//avji1sC+CTWA15PJQNg6eyrBATzYL///rp+3q2hqYn1WYuCQ+x
         3KVwA6YNCKIWe/bUBPGAjfJnvIQzCkan3I4i8fLLr5PSQli+EIbkojHKfxluW+3ng6zd
         yjW/0G++e1o+pMd2ygxQCuSvPcEyP/51cmxlzuVjQ5ImYk+TCCoS5cFQSirTc+C+YjgP
         xKArBsTwBS+4cUwX2a9truSSuEtzpBecsZ12Sse9I0dz6w1zaD1A/806rr/ezD7mx33K
         CwCqjFUR8RJqX1S2hBJ9z7AOUNBf9aUE+rnsz1kB8fwTYjhHmhcTUl9X2IP6wDTjifgS
         kA2w==
X-Forwarded-Encrypted: i=1; AJvYcCXwKLRaPnBzbVDdJ3/EN5SCBEgAOA8TMT+A/OY4zn4xCZKUIhkbDPTL38oIY5RZaRlLUVPmDiGcWZaOw2Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzLUkaNJoPbnJPK/2wZgY11G4uzV+3Ce/nIOF5IBU4OXj6CZjU5
	I6vbFQzcGzdhGzMGIKDnFkx5qpJ0Z+H5KpNjZESt6HiOpro1oTE6Pu0K
X-Gm-Gg: AY/fxX5FRunNa9WHEqKtDy6c2hJovMLb25gLMFcJcU1dwc8H4ZdMyhWDsTkgKrJlMLV
	l991hLXoijjVXvjqGxfCw1sT1jcMUMlkvx0bI0hOvU5Wt0eZAERAabpNXD/cAyXBW4THDYN8aU2
	ilYt5uDAbhPxppz8Qb0zgvZMKXtmsunS/fYLRmLlmdDJvJGEk/Nxoht8Ms0Xf5TSycTcLK5cO6k
	PKN45KFjqGYfNHvJVj/gHzXU6skOPEhJeBsnejWjtT1yiA78nfAA3z25qLS3iV3JK2vKPv1fDJm
	SiOb0LR7yy5KVOL5c2cR2yYqicc22wudmrr6/b/mOjLyDdGTzim7Dzs2h1yD/Xnp2VpKhTPi/Ru
	HoVJtSEFiV/yV7TKZfotyDE1zuVTgtoBXLaqlHbIPJo/UgW+8eZtm7ho4v84AJFjeqyuWuJrZKt
	/E1moQuRKgIPehgsKd/4YUJV8QPWa3OPW9
X-Google-Smtp-Source: AGHT+IFNh53RYGhBm0spY9cGU4hrvZl3rVUUUljhOpXEUJgWRnGD1AENe9Wq19Qn4XXLgG15AaZkgw==
X-Received: by 2002:a05:690e:2597:b0:63f:c52c:3828 with SMTP id 956f58d0204a3-6446e98333amr1349152d50.26.1765369805247;
        Wed, 10 Dec 2025 04:30:05 -0800 (PST)
Received: from localhost ([2a03:2880:25ff:5c::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78c1b4ac94dsm70695807b3.9.2025.12.10.04.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 04:30:04 -0800 (PST)
From: Joshua Hahn <joshua.hahnjy@gmail.com>
To: mawupeng <mawupeng1@huawei.com>
Cc: joshua.hahnjy@gmail.com,
	willy@infradead.org,
	david@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	kernel-team@meta.com
Subject: Re: [RFC LPC2025 PATCH 0/4] Deprecate zone_reclaim_mode
Date: Wed, 10 Dec 2025 04:30:01 -0800
Message-ID: <20251210123003.424248-1-joshua.hahnjy@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <fc00c53c-ab54-42a2-979b-0ecb49ff6b48@huawei.com>
References: 
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 9 Dec 2025 20:43:01 +0800 mawupeng <mawupeng1@huawei.com> wrote:
> 
> On 2025/12/6 7:32, Joshua Hahn wrote:
> > Hello folks, 
> > This is a code RFC for my upcoming discussion at LPC 2025 in Tokyo [1].
> >
> > zone_reclaim_mode was introduced in 2005 to prevent the kernel from facing
> > the high remote access latency associated with NUMA systems. With it enabled,
> > when the kernel sees that the local node is full, it will stall allocations and
> > trigger direct reclaim locally, instead of making a remote allocation, even
> > when there may still be free memory. Thsi is the preferred way to consume memory
> > if remote memory access is more expensive than performing direct reclaim.
> > The choice is made on a system-wide basis, but can be toggled at runtime.
> > 
> > This series deprecates the zone_reclaim_mode sysctl in favor of other NUMA
> > aware mechanisms, such as NUMA balancing, memory.reclaim, membind, and
> > tiering / promotion / demotion. Let's break down what differences there are
> > in these mechanisms, based on workload characteristics.

[...snip...]

Hello mawupeng, thank you for your feedback on this RFC.

I was wondering if you were planning to attend LPC this year. If so, I'll be
discussing this idea at the MM microconference tomorrow (December 11th) and
would love to discuss this after the presentation with you in the hallway.
I want to make sure that I'm not missing any important nuances or use cases
for zone_reclaim_mode. After all, my only motivation for deprecating this is
to simplify the code allocation path and reduce maintenence burden, both of
which definitely does not outweigh valid usecases. On the other hand if we can
find out that we can deprecate zone_reclaim_mode, and also find some
alternatives that lead to better performance on your end, that sounds
like the ultimate win-win scenario for me : -)

> In real-world scenarios, we have observed on a dual-socket (2P) server with multiple
> NUMA nodes—each having relatively limited local memory capacity—that page cache
> negatively impacts overall performance. The zone_reclaim_node feature is used to
> alleviate performance issues.
> 
> The main reason is that page cache consumes free memory on the local node, causing
> processes without mbind restrictions to fall back to other nodes that still have free
> memory. Accessing remote memory comes with a significant latency penalty. In extreme
> testing, if a system is fully populated with page cache beforehand, Spark application
> performance can drop by 80%. However, with zone_reclaim enabled, the performance
> degradation is limited to only about 30%.

This sounds right to me. In fact, I have observed similar results in some
experiments that I ran myself, where on a 2-NUMA system with 125GB memory each,
I fill up one node with 100G of garbage filecache and try to run a 60G anon
workload in it. Here are the average access latency results:

- zone_reclaim_mode enabled: 56.34 ns/access
- zone_reclaim_mode disabled: 67.86 ns/access

However, I was able to achieve better results by disabling zone_reclaim_mode
and using membind instead:

- zone_reclaim_mode disabled + membind: 52.98 ns/access

Of course, these are on my specific system with my specific workload so the
numbers (and results) may be different on your end. You specifically mentioned
"processes without mbind restrictions". Is there a reason why these workloads
cannot be membound to a node?

On that note, I had another follow-up question. If remote latency really is a
big concern, I am wondering if you have seen remote allocations despite
enabling zone_reclaim_mode. From my understanding of the code, zone_reclaim_mode
is not a strict guarantee of memory locality. If direct reclaim fails and
we fail to reclaim enough, the allocation is serviced from a remote node anyways.

Maybe I did not make this clear in my RFC, but I definitely believe that there
are workloads out there that benefit from zone_reclaim_mode. However, I
also believe that membind is just a better alternative for all the scenarios
that I can think of, so it would really be helpful for my education to learn
about workloads that benefit from zone_reclaim_mode but cannot use membind.

> Furthermore, for typical HPC applications, memory pressure tends to be balanced
> across NUMA nodes. Yet page cache is often generated by background tasks—such as
> logging modules—which breaks memory locality and adversely affects overall performance.

I see. From my very limited understanding of HPC applications, they tend to be
perfectly sized for the nodes they run on, so having logging agents generate
additional page cache really does sound like a problem to me. 

> At the same time, there are a large number of __GFP_THISNODE memory allocation requests in
> the system. Anonymous pages that fall back from other nodes cannot be migrated or easily
> reclaimed (especially when swap is disabled), leading to uneven distribution of available
> memory within a single node. By enabling zone_reclaim_mode, the kernel preferentially reclaims
> file pages within the local NUMA node to satisfy local anonymous-page allocations, which
> effectively avoids warn_alloc problems caused by uneven distribution of anonymous pages.
> 
> In such scenarios, relying solely on mbind may offer limited flexibility.

I see. So if I understand your scenario correctly, what you want is something
between mbind which is strict in guaranteeing that memory comes locally, and
the default memory allocation preference, which prefers allocating from
remote nodes when the local node runs out of memory.

I have some follow-up questions here.
It seems like the fact that anonymous memory from remote processes leaking
their memory into the current node is actually caused by two characteristics
of zone_reclaim_mode. Namely, that it does not guarantee memory locality,
and that it is a system-wide setting. Under your scenario, we cannot have
a mixture of HPC workloads that cannot handle remote memory access latency,
as well as non-HPC workloads that would actually benefit from being able to
consume free memory from remote nodes before triggering reclaim.

So in a scenario where we have multiple HPC workloads running on a multi-NUMA
system, we can just size each workload to fit the nodes, and membind them so
that we don't have to worry about migrating or reclaiming remote processes'
anonymous memory.

In a scenario where we have an HPC workload + non-HPC workloads, we can membind
the HPC workload to a single node, and exclude that node from the other
workloads' nodemasks to prevent anonymous memory from leaking into it.

> We have also experimented with proactively waking kswapd to improve synchronous reclaim
> efficiency. Our actual tests show that this can roughly double the memory allocation rate[1].

Personally I believe that this could be the way forward. However, there are
still some problems that we have to address, the biggest one being: pagecache
can be considered "garbage" in both your HPC workloads and my microbenchmark.
However, the pagecache can be very valuable in certain scenarios. What if
the workload will access the pagecache in the future? I'm not really sure if
it makes sense to clean up that pagecache and allocate locally, when the
worst-case scenario is that we have to incur much more latency reading from
disk and bringing in those pages again, when there is free memory still
available in the system.

Perhaps the real solution is to deprecate zone_reclaim_mode and offer more
granular (per-workload basis), and sane (guarantee memory locality and also
perform kswapd when the ndoe is full) options for the user.

> We could also discuss whether there are better solutions for such HPC scenarios.

Yes, I really hope that we can reach the win-win scenario that I mentioned at
the beginning of the reply. I really want to help users achieve the best
performance they can, and also help keep the kernel easy to maintain in the
long-run. Thank you for sharing your perspective, I really learned a lot.
Looking forward to your response, or if you are coming to LPC, would love to
grab a coffee. Have a grat day!
Joshua

> [1]: https://lore.kernel.org/all/20251011062043.772549-1-mawupeng1@huawei.com/

