Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 66BF4266016
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 15:17:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BnxBP60WjzDqcM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Sep 2020 23:17:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bnx7g17BczDqcD
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Sep 2020 23:15:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=K+ZBQQL8; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 4Bnx7g05rNz9sTN; Fri, 11 Sep 2020 23:15:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Bnx7f0Tbwz9sTC;
 Fri, 11 Sep 2020 23:15:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1599830110;
 bh=E6bMDqJsUb+xgcTwhcnczzVvFUDMt/EWMnlP3L+2fmY=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=K+ZBQQL8i9GnDjmFSLChWG1r9giNUKgdftTQXMY6ccwRqn/2sWZZut5Tz1g8tAH8B
 x36T94wWduJ3CijjST9DSCQVok1ugG3QJl9Q5EKIalv0mCl3k6JMnlAulvb2bWAEIw
 lfRwLZC2pNJN7VwtU+5SmCQA7WjbWHiB1+SbddykiiEipt4kjJuf9ejOIr9Zk6pZnn
 vPkN+/ee8lZlDl7kx+HggLyvaxqa2IS4i1F/aI6nzQv0O6qHPDYGJirREBjN3zny0w
 i878qb1tD8M/3AezXevDIEEe5GbjrgNIwEsKoJcGKO9oK3xb7kwGjizDBUQXCilJXP
 6z9JtY8BLlySA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v1] pseries/hotplug-memory: hot-add: skip redundant LMB
 lookup
In-Reply-To: <20200910175637.2865160-1-cheloha@linux.ibm.com>
References: <20200910175637.2865160-1-cheloha@linux.ibm.com>
Date: Fri, 11 Sep 2020 23:15:09 +1000
Message-ID: <87sgboqwte.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michal Suchanek <msuchanek@suse.de>,
 David Hildenbrand <david@redhat.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>,
 Laurent Dufour <ldufour@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Scott Cheloha <cheloha@linux.ibm.com> writes:
> During memory hot-add, dlpar_add_lmb() calls memory_add_physaddr_to_nid()
> to determine which node id (nid) to use when later calling __add_memory().
>
...
>
> Consider an LPAR with 126976 LMBs.  In one test, hot-adding 126000

Nice little machine you got there :P

> LMBs on an upatched kernel took ~3.5 hours while a patched kernel
> completed the same operation in ~2 hours:

...

> diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
> index 0ea976d1cac4..9cd572440175 100644
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -595,6 +595,8 @@ static int dlpar_memory_remove_by_ic(u32 lmbs_to_remove, u32 drc_index)
>  }
>  #endif /* CONFIG_MEMORY_HOTREMOVE */
>  
> +extern int of_drconf_to_nid_single(struct drmem_lmb *);
> +

This needs to go in a header.

It should probably go in arch/powerpc/include/asm/topology.h

cheers

>  static int dlpar_add_lmb(struct drmem_lmb *lmb)
>  {
>  	unsigned long block_sz;
> @@ -611,8 +613,10 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
>  
>  	block_sz = memory_block_size_bytes();
>  
> -	/* Find the node id for this address. */
> -	nid = memory_add_physaddr_to_nid(lmb->base_addr);
> +	/* Find the node id for this address.  Fake one if necessary. */
> +	nid = of_drconf_to_nid_single(lmb);
> +	if (nid < 0 || !node_possible(nid))
> +		nid = first_online_node;
>  
>  	/* Add the memory */
>  	rc = __add_memory(nid, lmb->base_addr, block_sz);
> -- 
> 2.24.1
