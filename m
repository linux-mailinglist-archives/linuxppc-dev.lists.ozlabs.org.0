Return-Path: <linuxppc-dev+bounces-12930-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1067DBDFD8A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Oct 2025 19:28:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cmyj55dVDz3dTm;
	Thu, 16 Oct 2025 04:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760549289;
	cv=none; b=LhDhxQQoptAzeESeERx5P3aqAooWvWGoZFs2pC0DJsr7DvvgNnhMT1KKHngxxVZD5gS9nPMq+E/GIHzRpBhwPK71nRDh40A/B44ETEelZhlo0OqIo5etq6f+EsZmFeMCZ/exQvDKdtJZiLLNDAa9jn6LE5xaCezcue0hgWVQazUzkmNSRL6oZLxNuY30blLqLRfyvZZ7h5wpJ6mJuSty35vomrbLlcmEimTKgzIRjRd9F60TafXHuuivOncGzz16hMqNP5QLu9zsMTO0GpVu+ms1GS7rcZMeFpHe+YmXYUNrhAD7vZq8zfa7ZHPCW6VZs7u1LSXYELWqvX7FNJXmMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760549289; c=relaxed/relaxed;
	bh=gvVDRnFReodweIyh4vqEswR+ZdFxTXb+n1H2PWseY5g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dOGb5NiwuNV1ibwHQlHGvna5Pm4t6kv8khopcMl2QSgw88UUuLDZiIqNR+5Q7cDYf7/RmHBh7+LlUshuAWz9SXXXvJeE9aTyMwf2sc932IeCaeRpo2GDMP8Ifv17hMt9oP3jcD0FXtCSS7LMxdShGOv+0TxW8b1myErAVYhq4je0yyUNEAjazfmXgLc0HT9XMCuHidZaUMcyA56LTsx2oOzE5pDOvtey0TG8Cskt+eXyHfXuW+CVlTwO9vwAwqnUAH9Goq1oo7UQyH78yChN0/fVT2HVqQsVxgAihBh8l1M8Sd53MTdulV9B9SFk+z5kRl6U0IZiA2ZNyhsWwvgMKQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cLYcUCKM; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cLYcUCKM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=sj@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cmyj50blRz3dTD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Oct 2025 04:28:09 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F3C949E13;
	Wed, 15 Oct 2025 17:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14B3CC4CEF8;
	Wed, 15 Oct 2025 17:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760549286;
	bh=2/0p/0k/TXO7o16P7A/u4tyNONwtv678Sc1Mfzau9Y4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cLYcUCKM6bI5Mz3l/tIYX/Z8p679bj7v28Kvi74TY7ncPOkHDjSf4kSDNS4Rrv0gO
	 MfF8ObXedzSLW80dEXdPChqCCXcLRHpxhQ6sYCQyL5YhXIij7R6m25TNaY4w/I/oWn
	 GEor+iRGSfQ0uN5vatbPqIWjKlSmdPypIE8CTRamSxuDgJToelhnE5AKSaFiJ1BgD6
	 B0R24iWwCp75s3cU4Or6ZyBpF+8G8eic0/GknwhH8KbJ1bMQO5SWxjKfxapQgHQa+P
	 ZwtVJppb7CxWPrFLIcll1iselKsf67JYLLUZprpMBYL4YisI9hPlE7y0PO6EKSIBU5
	 AsY7Rn1AbrdlQ==
From: SeongJae Park <sj@kernel.org>
To: Donet Tom <donettom@linux.ibm.com>
Cc: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Aboorva Devarajan <aboorvad@linux.ibm.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	x86@kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Subject: Re: [PATCH v2 2/2] drivers/base/node: Fold unregister_node() into unregister_one_node()
Date: Wed, 15 Oct 2025 10:27:58 -0700
Message-ID: <20251015172759.69864-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <32b7d5d8f0f30d313c3e1d8798f591459c8746f9.1760097208.git.donettom@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 14 Oct 2025 21:09:17 +0530 Donet Tom <donettom@linux.ibm.com> wrote:

> The function unregister_node() is only called from unregister_one_node().
> This patch folds unregister_node() into its only caller and renames
> unregister_one_node() to unregister_node().
> 
> This reduces unnecessary indirection and simplifies the code structure.
> No functional changes are introduced.
> 
> Acked-by: David Hildenbrand <david@redhat.com>
> Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>

Acked-by: SeongJae Park <sj@kernel.org>

> ---
>  drivers/base/node.c  | 38 +++++++++++++++++---------------------
>  include/linux/node.h |  6 ++----
>  mm/memory_hotplug.c  |  4 ++--
>  3 files changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/base/node.c b/drivers/base/node.c
> index 4bcaa8006cd6..758b777dec1f 100644
> --- a/drivers/base/node.c
> +++ b/drivers/base/node.c
> @@ -676,23 +676,6 @@ static void node_device_release(struct device *dev)
>  	kfree(to_node(dev));
>  }
>  
> -/**
> - * unregister_node - unregister a node device
> - * @node: node going away
> - *
> - * Unregisters a node device @node.  All the devices on the node must be
> - * unregistered before calling this function.
> - */
> -void unregister_node(struct node *node)
> -{
> -	hugetlb_unregister_node(node);
> -	compaction_unregister_node(node);
> -	reclaim_unregister_node(node);
> -	node_remove_accesses(node);
> -	node_remove_caches(node);
> -	device_unregister(&node->dev);
> -}
> -
>  struct node *node_devices[MAX_NUMNODES];
>  
>  /*
> @@ -924,13 +907,26 @@ int register_node(int nid)
>  
>  	return error;
>  }
> -
> -void unregister_one_node(int nid)
> +/**
> + * unregister_node - unregister a node device
> + * @nid: nid of the node going away
> + *
> + * Unregisters the node device at node id  @nid.  All the devices on the

Nit.  Why two spaces before "@nid"?

[...]


Thanks,
SJ

