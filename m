Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 666081975EC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 09:44:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rPcB3v2PzDqdw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 18:44:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.128.68; helo=mail-wm1-f68.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rPZN4gwGzDqcj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 18:42:52 +1100 (AEDT)
Received: by mail-wm1-f68.google.com with SMTP id t128so436973wma.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Mar 2020 00:42:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=G2GbSd8nfrGqlF2CTXpVag+1XrsMr3qO8HlwnrY50kI=;
 b=fajxTnBQAQIedelEIMeET7fIvgJDor1eHx6L4rcpwHaEv4zACNXrFcDr+/BjpB/U8E
 bE9pLG8RQIvVLxAXw7lytRymf9psk6HP+e8QlCSiT08S3Uf6V3Bq6vmBqSwzJxoQB5Pc
 PgVrkFULy1uEz57x+izLaqmrzPM/o7VAre+pcojusax9LT2DNGNByErXRw8hjopUQxO1
 O7MECZN3y7dTLHfyqVgk8AEftBxtfeYcxf4c2mwavsIctt8/tTkR7aGZqGTzM2xjwjrY
 WxwYBaEMU7t+7hf9e8NUHlkBmIgU7JP9FqTpSeU9un1JC8PMUHzSxRhIIQrUkr8Wxc8q
 VPGw==
X-Gm-Message-State: ANhLgQ0nt/Vfc5eVhwux+McS262dbVS/aLMr+CYHzKOf6lOqSy9zlU8z
 7gCw5UzD68DNesj5CD8NzYc=
X-Google-Smtp-Source: ADFU+vtTO40ug73YLnNFJoExcCn1PsdhzxCpQLzjsmdgJmi+fsq6hPq9O7t9QjqmLmc+CwVgWIwn6A==
X-Received: by 2002:a05:600c:4145:: with SMTP id
 h5mr11604265wmm.3.1585554168707; 
 Mon, 30 Mar 2020 00:42:48 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id 98sm21456009wrk.52.2020.03.30.00.42.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Mar 2020 00:42:47 -0700 (PDT)
Date: Mon, 30 Mar 2020 09:42:46 +0200
From: Michal Hocko <mhocko@kernel.org>
To: Hoan Tran <Hoan@os.amperecomputing.com>
Subject: Re: [PATCH v3 0/5] mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by
 default for NUMA
Message-ID: <20200330074246.GA14243@dhcp22.suse.cz>
References: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585420282-25630-1-git-send-email-Hoan@os.amperecomputing.com>
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: mmorana@amperecomputing.com, Catalin Marinas <catalin.marinas@arm.com>,
 Heiko Carstens <heiko.carstens@de.ibm.com>,
 "open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, "H. Peter Anvin" <hpa@zytor.com>,
 sparclinux@vger.kernel.org,
 Alexander Duyck <alexander.h.duyck@linux.intel.com>,
 linux-s390@vger.kernel.org, x86@kernel.org, Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Vlastimil Babka <vbabka@suse.cz>,
 Pavel Tatashin <pavel.tatashin@microsoft.com>, lho@amperecomputing.com,
 Vasily Gorbik <gor@linux.ibm.com>, Will Deacon <will.deacon@arm.com>,
 Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Oscar Salvador <osalvador@suse.de>,
 linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat 28-03-20 11:31:17, Hoan Tran wrote:
> In NUMA layout which nodes have memory ranges that span across other nodes,
> the mm driver can detect the memory node id incorrectly.
> 
> For example, with layout below
> Node 0 address: 0000 xxxx 0000 xxxx
> Node 1 address: xxxx 1111 xxxx 1111
> 
> Note:
>  - Memory from low to high
>  - 0/1: Node id
>  - x: Invalid memory of a node
> 
> When mm probes the memory map, without CONFIG_NODES_SPAN_OTHER_NODES
> config, mm only checks the memory validity but not the node id.
> Because of that, Node 1 also detects the memory from node 0 as below
> when it scans from the start address to the end address of node 1.
> 
> Node 0 address: 0000 xxxx xxxx xxxx
> Node 1 address: xxxx 1111 1111 1111
> 
> This layout could occur on any architecture. Most of them enables
> this config by default with CONFIG_NUMA. This patch, by default, enables
> CONFIG_NODES_SPAN_OTHER_NODES or uses early_pfn_in_nid() for NUMA.

I am not opposed to this at all. It reduces the config space and that is
a good thing on its own. The history has shown that meory layout might
be really wild wrt NUMA. The config is only used for early_pfn_in_nid
which is clearly an overkill.

Your description doesn't really explain why this is safe though. The
history of this config is somehow messy, though. Mike has tried
to remove it a94b3ab7eab4 ("[PATCH] mm: remove arch independent
NODES_SPAN_OTHER_NODES") just to be reintroduced by 7516795739bd
("[PATCH] Reintroduce NODES_SPAN_OTHER_NODES for powerpc") without any
reasoning what so ever. This doesn't make it really easy see whether
reasons for reintroduction are still there. Maybe there are some subtle
dependencies. I do not see any TBH but that might be burried deep in an
arch specific code.

> v3:
>  * Revise the patch description
> 
> V2:
>  * Revise the patch description
> 
> Hoan Tran (5):
>   mm: Enable CONFIG_NODES_SPAN_OTHER_NODES by default for NUMA
>   powerpc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
>   x86: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
>   sparc: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
>   s390: Kconfig: Remove CONFIG_NODES_SPAN_OTHER_NODES
> 
>  arch/powerpc/Kconfig | 9 ---------
>  arch/s390/Kconfig    | 8 --------
>  arch/sparc/Kconfig   | 9 ---------
>  arch/x86/Kconfig     | 9 ---------
>  mm/page_alloc.c      | 2 +-
>  5 files changed, 1 insertion(+), 36 deletions(-)
> 
> -- 
> 1.8.3.1
> 

-- 
Michal Hocko
SUSE Labs
