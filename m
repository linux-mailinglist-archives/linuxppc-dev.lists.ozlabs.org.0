Return-Path: <linuxppc-dev+bounces-1850-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 51E079954BA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 18:44:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XNMKp6yNXz2yZ1;
	Wed,  9 Oct 2024 03:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728405838;
	cv=none; b=aHe1HmdPgDyZJiwYou2mcPXYOjq2+1JITq59B+Bv354wsJ0Yg1WmM8SUjMGa0G4UBgE+6FmP4PnPt01Hfv/L+TR0QPJNEW1P7LxaIuq932s/WeHKWswChlYC231EHt/7DdQOxj+qjZZoruRgTOmivKeBNY3+f+7ocTCMISaQ7bDQ7h6LFucGGjuroEeXDyV39Cglh1/O2zC6Du0u9p4eV7Z6RqtiHlIfcbtUtmfUSfW7du1FPm/NFp7n+W/0+txQaINAGIzHcku3nu4cwwvCqhe0Ms+gsF1m0q4SIQSmMtXZrZ6x+050JHJ7fhStPwzg6AnEmfPQlKSKSlXAfYkhSw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728405838; c=relaxed/relaxed;
	bh=BMUPyVXLd+LDl/ZL7ymEeTwuIs5yS/vjsLxKqhtCqaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jFdqlfNREmC2CctGxjkK8nH2xe7olu7oYVNmGdyZBDeYbedUcMJ2yzHcqHwz/ZXhDgsWLZl/zlyhBXEpyJhae0bNekoVw/Gi876iehhLyzPdnuE+gwZIY+MTIBoHZb9y1QWhIX1dYmnULywXPQDQofzTgl6G16VYJcz35F0eCrCW4pbIhUwjxGWLqusnai+Z3aqjwsj0IEkqcYWw/iWx8qGprVeuRUjuo7T/F8X9slb9OvG4islCLYQQcbCPA6jKs3VTvoFsp+V3pvLEsvxRBKIAwgv+CN994Fc+JwMKTZSz4F1GZFzslzYSgKa3pMwqU3JxeDpq2UmmKZnYjltjXg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz; dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mQlP9E5s; dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hwesBxXa; dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mQlP9E5s; dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hwesBxXa; dkim-atps=neutral; spf=pass (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org) smtp.mailfrom=suse.cz
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mQlP9E5s;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hwesBxXa;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=mQlP9E5s;
	dkim=neutral header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=hwesBxXa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.223.130; helo=smtp-out1.suse.de; envelope-from=vbabka@suse.cz; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XNMKn6bnZz2yTs
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Oct 2024 03:43:57 +1100 (AEDT)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 341EC21D5B;
	Tue,  8 Oct 2024 16:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728405371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BMUPyVXLd+LDl/ZL7ymEeTwuIs5yS/vjsLxKqhtCqaw=;
	b=mQlP9E5s/11e/CjftGGrRoU6j7K/s36FGlOqcFLpbhBLLkMQ/ljT5HzNIZEr4ZzK5XYYOZ
	am2BUh542vweWyC83EybNarwaLWVq6x/eeNNR4UW5ZFL69mVlGB7P9Q5u65UZYyw/Ka8o6
	lBm8cnkhDd4YKqdTevX8+1KnCMgFQ10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728405371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BMUPyVXLd+LDl/ZL7ymEeTwuIs5yS/vjsLxKqhtCqaw=;
	b=hwesBxXanA3ymRC+PkaTSPZd29rMLk9C+fEk/Am2Y4bZMgwG/qKzPXTKF6SSYgtUEgQJkY
	5MTzEj/k8e9GZXAQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=mQlP9E5s;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=hwesBxXa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1728405371; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BMUPyVXLd+LDl/ZL7ymEeTwuIs5yS/vjsLxKqhtCqaw=;
	b=mQlP9E5s/11e/CjftGGrRoU6j7K/s36FGlOqcFLpbhBLLkMQ/ljT5HzNIZEr4ZzK5XYYOZ
	am2BUh542vweWyC83EybNarwaLWVq6x/eeNNR4UW5ZFL69mVlGB7P9Q5u65UZYyw/Ka8o6
	lBm8cnkhDd4YKqdTevX8+1KnCMgFQ10=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1728405371;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BMUPyVXLd+LDl/ZL7ymEeTwuIs5yS/vjsLxKqhtCqaw=;
	b=hwesBxXanA3ymRC+PkaTSPZd29rMLk9C+fEk/Am2Y4bZMgwG/qKzPXTKF6SSYgtUEgQJkY
	5MTzEj/k8e9GZXAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F0ECE137CF;
	Tue,  8 Oct 2024 16:36:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id c4GBOnpfBWeLSwAAD6G6ig
	(envelope-from <vbabka@suse.cz>); Tue, 08 Oct 2024 16:36:10 +0000
Message-ID: <1585a3fc-ade2-4e1e-a016-e04336c0a103@suse.cz>
Date: Tue, 8 Oct 2024 18:36:10 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Content-Language: en-US
To: Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 "Paul E . McKenney" <paulmck@kernel.org>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Steven Rostedt <rostedt@goodmis.org>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
From: Vlastimil Babka <vbabka@suse.cz>
Autocrypt: addr=vbabka@suse.cz; keydata=
 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
 EP+ylKVEKb0Q2A==
In-Reply-To: <20240609082726.32742-1-Julia.Lawall@inria.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 341EC21D5B
X-Spam-Level: 
X-Spamd-Result: default: False [-4.51 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RLujeud1qp5x6qhm7ow61zc6bu)];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,efficios.com,lists.ozlabs.org,linux.ibm.com,csgroup.eu,gmail.com,lists.zx2c4.com,suse.de,netapp.com,oracle.com,talpey.com,netfilter.org,kernel.org,zx2c4.com,goodmis.org];
	MID_RHS_MATCH_FROM(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spam-Score: -4.51
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 6/9/24 10:27, Julia Lawall wrote:
> Since SLOB was removed, it is not necessary to use call_rcu
> when the callback only performs kmem_cache_free. Use
> kfree_rcu() directly.

FYI, as of 6.12-rc1 - commit 6c6c47b063b5 ("mm, slab: call
kvfree_rcu_barrier() from kmem_cache_destroy()")
it should be possible to restart this effort for the remaining cases which
had to be postponed until kmem_cache_destroy() / module unload is sorted out.

Thanks,
Vlastimil

> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.
> 
> // <smpl>
> @r@
> expression e;
> local idexpression e2;
> identifier cb,f;
> position p;
> @@
> 
> (
> call_rcu(...,e2)
> |
> call_rcu(&e->f,cb@p)
> )
> 
> @r1@
> type T;
> identifier x,r.cb;
> @@
> 
>  cb(...) {
> (
>    kmem_cache_free(...);
> |
>    T x = ...;
>    kmem_cache_free(...,x);
> |
>    T x;
>    x = ...;
>    kmem_cache_free(...,x);
> )
>  }
> 
> @s depends on r1@
> position p != r.p;
> identifier r.cb;
> @@
> 
>  cb@p
> 
> @script:ocaml@
> cb << r.cb;
> p << s.p;
> @@
> 
> Printf.eprintf "Other use of %s at %s:%d\n"
>    cb (List.hd p).file (List.hd p).line
> 
> @depends on r1 && !s@
> expression e;
> identifier r.cb,f;
> position r.p;
> @@
> 
> - call_rcu(&e->f,cb@p)
> + kfree_rcu(e,f)
> 
> @r1a depends on !s@
> type T;
> identifier x,r.cb;
> @@
> 
> - cb(...) {
> (
> -  kmem_cache_free(...);
> |
> -  T x = ...;
> -  kmem_cache_free(...,x);
> |
> -  T x;
> -  x = ...;
> -  kmem_cache_free(...,x);
> )
> - }
> // </smpl>
> 
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
> Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> 
> ---
> 
>  arch/powerpc/kvm/book3s_mmu_hpte.c  |    8 +-------
>  block/blk-ioc.c                     |    9 +--------
>  drivers/net/wireguard/allowedips.c  |    9 ++-------
>  fs/ecryptfs/dentry.c                |    8 +-------
>  fs/nfsd/nfs4state.c                 |    9 +--------
>  fs/tracefs/inode.c                  |   10 +---------
>  kernel/time/posix-timers.c          |    9 +--------
>  kernel/workqueue.c                  |    8 +-------
>  net/bridge/br_fdb.c                 |    9 +--------
>  net/can/gw.c                        |   13 +++----------
>  net/ipv4/fib_trie.c                 |    8 +-------
>  net/ipv4/inetpeer.c                 |    9 ++-------
>  net/ipv6/ip6_fib.c                  |    9 +--------
>  net/ipv6/xfrm6_tunnel.c             |    8 +-------
>  net/kcm/kcmsock.c                   |   10 +---------
>  net/netfilter/nf_conncount.c        |   10 +---------
>  net/netfilter/nf_conntrack_expect.c |   10 +---------
>  net/netfilter/xt_hashlimit.c        |    9 +--------
>  18 files changed, 22 insertions(+), 143 deletions(-)


