Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F31D901506
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2024 10:29:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=c3jg9XiA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vxp5N4fxpz3cR1
	for <lists+linuxppc-dev@lfdr.de>; Sun,  9 Jun 2024 18:29:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=inria.fr header.i=@inria.fr header.a=rsa-sha256 header.s=dc header.b=c3jg9XiA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=inria.fr (client-ip=192.134.164.83; helo=mail2-relais-roc.national.inria.fr; envelope-from=julia.lawall@inria.fr; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Sun, 09 Jun 2024 18:29:04 AEST
Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vxp4c3WL5z30PD
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 Jun 2024 18:29:04 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=REYx9XJxXex1wT0g8DdBknTJa5z8s+++8BsQM1tAkdE=;
  b=c3jg9XiAgeKcNkg9Ypz1MXA57+I6z9Upi3oqzG67AIxQoc2Tb/l9+twd
   o1xqjWHj9bZB/XffVTZ6y3Q5wlIBrpiRIuaxP20ZifTf9z4PP9a6/uHrQ
   jbNAr8EHCg32T8reqfZHBfM1Bu9ssqsOLmK26M8DXHwpWqbgwQfkqJwz8
   I=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=Julia.Lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.08,225,1712613600"; 
   d="scan'208";a="169696895"
Received: from i80.paris.inria.fr (HELO i80.paris.inria.fr.) ([128.93.90.48])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 10:27:48 +0200
From: Julia Lawall <Julia.Lawall@inria.fr>
To: linux-block@vger.kernel.org
Subject: [PATCH 00/14] replace call_rcu by kfree_rcu for simple kmem_cache_free callback
Date: Sun,  9 Jun 2024 10:27:12 +0200
Message-Id: <20240609082726.32742-1-Julia.Lawall@inria.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: kvm@vger.kernel.org, Neil Brown <neilb@suse.de>, Lai Jiangshan <jiangshanlai@gmail.com>, Olga Kornievskaia <kolga@netapp.com>, kernel-janitors@vger.kernel.org, Dai Ngo <Dai.Ngo@oracle.com>, coreteam@netfilter.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linux-trace-kernel@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>, bridge@lists.linux.dev, ecryptfs@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-can@vger.kernel.org, Tom Talpey <tom@talpey.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Vlastimil Babka <vbabka@suse.cz>, linux-nfs@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, netfilter-devel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, wireguard@lists.zx2c4.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Since SLOB was removed, it is not necessary to use call_rcu
when the callback only performs kmem_cache_free. Use
kfree_rcu() directly.

The changes were done using the following Coccinelle semantic patch.
This semantic patch is designed to ignore cases where the callback
function is used in another way.

// <smpl>
@r@
expression e;
local idexpression e2;
identifier cb,f;
position p;
@@

(
call_rcu(...,e2)
|
call_rcu(&e->f,cb@p)
)

@r1@
type T;
identifier x,r.cb;
@@

 cb(...) {
(
   kmem_cache_free(...);
|
   T x = ...;
   kmem_cache_free(...,x);
|
   T x;
   x = ...;
   kmem_cache_free(...,x);
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

Printf.eprintf "Other use of %s at %s:%d\n"
   cb (List.hd p).file (List.hd p).line

@depends on r1 && !s@
expression e;
identifier r.cb,f;
position r.p;
@@

- call_rcu(&e->f,cb@p)
+ kfree_rcu(e,f)

@r1a depends on !s@
type T;
identifier x,r.cb;
@@

- cb(...) {
(
-  kmem_cache_free(...);
|
-  T x = ...;
-  kmem_cache_free(...,x);
|
-  T x;
-  x = ...;
-  kmem_cache_free(...,x);
)
- }
// </smpl>

Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>
Reviewed-by: Paul E. McKenney <paulmck@kernel.org>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>

---

 arch/powerpc/kvm/book3s_mmu_hpte.c  |    8 +-------
 block/blk-ioc.c                     |    9 +--------
 drivers/net/wireguard/allowedips.c  |    9 ++-------
 fs/ecryptfs/dentry.c                |    8 +-------
 fs/nfsd/nfs4state.c                 |    9 +--------
 fs/tracefs/inode.c                  |   10 +---------
 kernel/time/posix-timers.c          |    9 +--------
 kernel/workqueue.c                  |    8 +-------
 net/bridge/br_fdb.c                 |    9 +--------
 net/can/gw.c                        |   13 +++----------
 net/ipv4/fib_trie.c                 |    8 +-------
 net/ipv4/inetpeer.c                 |    9 ++-------
 net/ipv6/ip6_fib.c                  |    9 +--------
 net/ipv6/xfrm6_tunnel.c             |    8 +-------
 net/kcm/kcmsock.c                   |   10 +---------
 net/netfilter/nf_conncount.c        |   10 +---------
 net/netfilter/nf_conntrack_expect.c |   10 +---------
 net/netfilter/xt_hashlimit.c        |    9 +--------
 18 files changed, 22 insertions(+), 143 deletions(-)
