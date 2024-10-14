Return-Path: <linuxppc-dev+bounces-2176-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C91DF99BCED
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 02:31:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRdT21dkFz2y8d;
	Mon, 14 Oct 2024 11:31:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:45d1:ec00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728865894;
	cv=none; b=Jl0robRIS7S69oFTtOjY01gtLSmpcQP9utS2S2Qen6mXoGre9ksIres8etUeFBJSnpSfD8/iOXSG3U27GrdGULlLyB8aHGzvZiAX241CaRqi5teld+05JzkZv5jx7SlA8nybx4NieRO27l4XNO3CQ+oGibXib0BsRacp0o/K0AQkJXQ+5T3taWl6Z/tqoYg/l148D6sJb/GkoYSSD6OlhLKzRw9Za0LPQ5KGipsYAFQvzQ6s42mWo0aRX3yJtyo8eno37HqIGmAN0aWW8AWckxWGkqLQ3HSXVo2GkqxqJlcGT4kyysglWrLhixk7TYONNGMVEQYUh4buPd28jTluAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728865894; c=relaxed/relaxed;
	bh=YqtDK7QfopzOi6b82zo9ZPxlNTmjGRKlUMjxc3XnxKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bSdH6OYOW69Erfe2KLRd378b+YTC+l2nwAbWeogExMkqqaqGgXZNp+mRS1ShPDtcnLYlLymQkry8H/449Vd/6CmNxVs/r/JmVxNUgYIWfF55t/JbqWjtQBjuXA/9zvI0I+owGe6M1ar2bpy03yvrJ7kHRjyzS5bKFBzqTgkojXb5wCHY/VZxlMP8tE+1XakrcVMaKMmDLU+XXpnDLg6TqJhsW2CtMLTGqafI5TiJcfnnCrwWUzPqy/uy1FwDcPh43y6w0OHk2oVrdkSTkLVfc2VG6Vo/w1frpeM6ZMHQEbg4jEDWkoI3eK93DK5uHNsGW32m3E5mlTeL9DpO/BT0dQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r9YqRKuw; dkim-atps=neutral; spf=pass (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=bo0x=rk=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=r9YqRKuw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:45d1:ec00::3; helo=nyc.source.kernel.org; envelope-from=srs0=bo0x=rk=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [IPv6:2604:1380:45d1:ec00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRdT10LSJz2y83
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 11:31:32 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8AA7A4089B;
	Mon, 14 Oct 2024 00:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E461C4CEC5;
	Mon, 14 Oct 2024 00:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728865890;
	bh=XvIpO0hMtyh3Po24emY82DbVHrbP5ytugA80vx/L/C4=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=r9YqRKuw96RsL0f2maCvk78OVekNkjc1FC0l5peRj1xFsFUp+Wk6XpDbm8K/I8Dat
	 NtYj6Bt7tAjktwuIEYkK2pE6Nlz6suRz3IANFU3iMXWxI7B7SBdTbd2IFcE2RMqhNe
	 Gzl7d51zCrp3PEv9lrIW1gc/wLVjkJdAhHf/b8suVLDK9/64J6axNZwU42guB6nhKd
	 Bi+uaQAfSmkkbJhfVBfu3ahXZQy9cxY9cRnT2opvnrVBsZZFVpqu2kKlHbRWIQ75Yc
	 VF5aZimutRyJow22wfPFMyDIphrxGhIuf1iV5oDIrKq8jmbchhfe2c3wMu4V4yxCL9
	 zZuh3mAA+h63Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 043ABCE0D17; Sun, 13 Oct 2024 17:31:30 -0700 (PDT)
Date: Sun, 13 Oct 2024 17:31:30 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Julia Lawall <Julia.Lawall@inria.fr>
Cc: linux-nfs@vger.kernel.org, kernel-janitors@vger.kernel.org,
	vbabka@suse.cz, Tom Talpey <tom@talpey.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Olga Kornievskaia <okorniev@redhat.com>, Neil Brown <neilb@suse.de>,
	linux-can@vger.kernel.org, bridge@lists.linux.dev,
	b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org,
	wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
	ecryptfs@vger.kernel.org, linux-block@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [PATCH 00/17] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <47a98e77-8bbf-48d7-bb52-50e85a5336a0@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
X-Spam-Status: No, score=-0.3 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Oct 13, 2024 at 10:16:47PM +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.

For the series:

Acked-by: Paul E. McKenney <paulmck@kernel.org>

> // <smpl>
> #spatch --all-includes --include-headers
> 
> @r@
> expression e;
> local idexpression e2;
> identifier cb,f,g;
> position p;
> @@
> 
> (
> call_rcu(...,e2)
> |
> call_rcu(&e->f,cb@p)
> |
> call_rcu(&e->f.g,cb@p)
> )
> 
> @r1@
> type T,T1;
> identifier x,r.cb;
> @@
> 
>  cb(...) {
> (
>    kmem_cache_free(...);
> |
>    T x = ...;
>    kmem_cache_free(...,(T1)x);
> |
>    T x;
>    x = ...;
>    kmem_cache_free(...,(T1)x);
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
> Printf.eprintf "Other use of %s at %s:%d\n" cb (List.hd p).file (List.hd p).line
> 
> @depends on r1 && !s@
> expression e;
> identifier r.cb,f,g;
> position r.p;
> @@
> 
> (
> - call_rcu(&e->f,cb@p)
> + kfree_rcu(e,f)
> |
> - call_rcu(&e->f.g,cb@p)
> + kfree_rcu(e,f.g)
> )
> 
> @r1a depends on !s@
> type T,T1;
> identifier x,r.cb;
> @@
> 
> - cb(...) {
> (
> -  kmem_cache_free(...);
> |
> -  T x = ...;
> -  kmem_cache_free(...,(T1)x);
> |
> -  T x;
> -  x = ...;
> -  kmem_cache_free(...,(T1)x);
> )
> - }
> 
> @r2 depends on !r1@
> identifier r.cb;
> @@
> 
> cb(...) {
>  ...
> }
> 
> @script:ocaml depends on !r1 && !r2@
> cb << r.cb;
> @@
> 
> Printf.eprintf "need definition for %s\n" cb
> // </smpl>
> 
> ---
> 
>  arch/powerpc/kvm/book3s_mmu_hpte.c  |    8 ------
>  block/blk-ioc.c                     |    9 ------
>  drivers/net/wireguard/allowedips.c  |    9 +-----
>  fs/ecryptfs/dentry.c                |    8 ------
>  fs/nfsd/nfs4state.c                 |    9 ------
>  kernel/time/posix-timers.c          |    9 ------
>  net/batman-adv/translation-table.c  |   47 ++----------------------------------
>  net/bridge/br_fdb.c                 |    9 ------
>  net/can/gw.c                        |   13 ++-------
>  net/ipv4/fib_trie.c                 |    8 ------
>  net/ipv4/inetpeer.c                 |    9 +-----
>  net/ipv6/ip6_fib.c                  |    9 ------
>  net/ipv6/xfrm6_tunnel.c             |    8 ------
>  net/kcm/kcmsock.c                   |   10 -------
>  net/netfilter/nf_conncount.c        |   10 -------
>  net/netfilter/nf_conntrack_expect.c |   10 -------
>  net/netfilter/xt_hashlimit.c        |    9 ------
>  17 files changed, 23 insertions(+), 171 deletions(-)

