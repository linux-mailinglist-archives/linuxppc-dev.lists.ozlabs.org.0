Return-Path: <linuxppc-dev+bounces-2172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A19499BB61
	for <lists+linuxppc-dev@lfdr.de>; Sun, 13 Oct 2024 22:18:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRWrh5RmFz2yGF;
	Mon, 14 Oct 2024 07:18:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=192.134.164.104
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728850692;
	cv=none; b=hQ2tIfqSCtbaryor8E3RW2amn/qFHojnkLjQF2NAW6EjV1bIuU7B6xFkAI/TcU9N2HKUlDMcO6tUFZDhkudB96tjxnxHy2TBaHtPWj/vUpkN3297Yw0TM7ijXutHD5JB2az/xmk06lFnsFqUWHaQ5AA5/rQWvG4qRWaVz6UVYLy9GBci4WgAvdSIaaPRfBY3oYn4CyVzmfz2sqpdvILUNa9A+WcYON+437YMqD5pEWxW+mxWaoR4FV6dq4CLAPkHC8j4xNUd4pG7ktQtAAAqasWUuzdCjOOOXh9FktcJ3L8PldTnZsakmjqyqTvBxM8m4FxBezDnGaBg2V6P7X4Orw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728850692; c=relaxed/relaxed;
	bh=Sja7FWx2J2pFF7H03F4ldwixL8Qb/r4LwdjP0v1pkNc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BFxXzNz7f9oMIdlhi8vIdl6VHH3JRxDvq8zd05nHqneql2Wr+qpc9OMzf7Aw8Q2eG49Af4fkFKboHrp4rfXueZusQAA0woRRal0kagU1KUFm/fUvGzPj9Kqk13JTiagSckfGW9tn0k8YyKaXCpPDqYd5gzzdWkDRNoZo2NOmtj6fMTw/wFF1l1U/Mb1m9BeRJCC9PRxa/UtCvSIChBv2kwJ7d+RdigJGelpV+BgqwHY6mEg1ykuhcsu5H2Bm5MlBXzkH2HmB6bqi7eeNDK9PnMoS3Wka6/fNYGF7qCHK3rchHTjCs4GBHogY6vp0HRZkBaIoNITdt1eaoJY6UmIyeQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr; dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=exIvs+i/; dkim-atps=neutral; spf=pass (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org) smtp.mailfrom=inria.fr
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=exIvs+i/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.104; helo=mail3-relais-sop.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRWrc1vnjz2yF0
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 07:18:04 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Sja7FWx2J2pFF7H03F4ldwixL8Qb/r4LwdjP0v1pkNc=;
  b=exIvs+i/vmrrOC1BhG1dWTdYhowcV77JbThYwDdjK0/Wqiaqq9Fr0cce
   rNzCFJlH0Zl3Gc94qiLI1s9PCSVuCYpsLvZjcvp+ULtzzTXbcfRvMqOYM
   ncj7g6L1s1poZOa9BL666TBGtZjDcSWk9IcDnPVvWZAmigUTgCebAcAqC
   Y=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,201,1725314400"; 
   d="scan'208";a="98968275"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2024 22:17:57 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-nfs@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	vbabka@suse.cz,
	paulmck@kernel.org,
	Tom Talpey <tom@talpey.com>,
	Dai Ngo <Dai.Ngo@oracle.com>,
	Olga Kornievskaia <okorniev@redhat.com>,
	Neil Brown <neilb@suse.de>,
	linux-can@vger.kernel.org,
	bridge@lists.linux.dev,
	b.a.t.m.a.n@lists.open-mesh.org,
	linux-kernel@vger.kernel.org,
	wireguard@lists.zx2c4.com,
	netdev@vger.kernel.org,
	ecryptfs@vger.kernel.org,
	linux-block@vger.kernel.org,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	netfilter-devel@vger.kernel.org,
	coreteam@netfilter.org
Subject: [PATCH 00/17] replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Date: Sun, 13 Oct 2024 22:16:47 +0200
Message-Id: <20241013201704.49576-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Since SLOB was removed and since
commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
it is not necessary to use call_rcu when the callback only performs
kmem_cache_free. Use kfree_rcu() directly.

The changes were done using the following Coccinelle semantic patch.
This semantic patch is designed to ignore cases where the callback
function is used in another way.

// <smpl>
#spatch --all-includes --include-headers

@r@
expression e;
local idexpression e2;
identifier cb,f,g;
position p;
@@

(
call_rcu(...,e2)
|
call_rcu(&e->f,cb@p)
|
call_rcu(&e->f.g,cb@p)
)

@r1@
type T,T1;
identifier x,r.cb;
@@

 cb(...) {
(
   kmem_cache_free(...);
|
   T x = ...;
   kmem_cache_free(...,(T1)x);
|
   T x;
   x = ...;
   kmem_cache_free(...,(T1)x);
)
 }

@s depends on r1@
position p != r.p;
identifier r.cb;
@@

 cb@p

@script:ocaml@
cb << r.cb;
p << s.p;
@@

Printf.eprintf "Other use of %s at %s:%d\n" cb (List.hd p).file (List.hd p).line

@depends on r1 && !s@
expression e;
identifier r.cb,f,g;
position r.p;
@@

(
- call_rcu(&e->f,cb@p)
+ kfree_rcu(e,f)
|
- call_rcu(&e->f.g,cb@p)
+ kfree_rcu(e,f.g)
)

@r1a depends on !s@
type T,T1;
identifier x,r.cb;
@@

- cb(...) {
(
-  kmem_cache_free(...);
|
-  T x = ...;
-  kmem_cache_free(...,(T1)x);
|
-  T x;
-  x = ...;
-  kmem_cache_free(...,(T1)x);
)
- }

@r2 depends on !r1@
identifier r.cb;
@@

cb(...) {
 ...
}

@script:ocaml depends on !r1 && !r2@
cb << r.cb;
@@

Printf.eprintf "need definition for %s\n" cb
// </smpl>

---

 arch/powerpc/kvm/book3s_mmu_hpte.c  |    8 ------
 block/blk-ioc.c                     |    9 ------
 drivers/net/wireguard/allowedips.c  |    9 +-----
 fs/ecryptfs/dentry.c                |    8 ------
 fs/nfsd/nfs4state.c                 |    9 ------
 kernel/time/posix-timers.c          |    9 ------
 net/batman-adv/translation-table.c  |   47 ++----------------------------------
 net/bridge/br_fdb.c                 |    9 ------
 net/can/gw.c                        |   13 ++-------
 net/ipv4/fib_trie.c                 |    8 ------
 net/ipv4/inetpeer.c                 |    9 +-----
 net/ipv6/ip6_fib.c                  |    9 ------
 net/ipv6/xfrm6_tunnel.c             |    8 ------
 net/kcm/kcmsock.c                   |   10 -------
 net/netfilter/nf_conncount.c        |   10 -------
 net/netfilter/nf_conntrack_expect.c |   10 -------
 net/netfilter/xt_hashlimit.c        |    9 ------
 17 files changed, 23 insertions(+), 171 deletions(-)

