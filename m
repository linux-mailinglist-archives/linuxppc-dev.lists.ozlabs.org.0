Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41597663214
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:00:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRCq13G4z3fGB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:00:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FGVUXzbM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::b49; helo=mail-yb1-xb49.google.com; envelope-from=35h68ywykdpcrtqdmafnnfkd.bnlkhmtwoob-cdukhrsr.nykzar.nqf@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=FGVUXzbM;
	dkim-atps=neutral
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4k2Wx8z3cFt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:53:58 +1100 (AEDT)
Received: by mail-yb1-xb49.google.com with SMTP id z17-20020a25e311000000b00719e04e59e1so10330301ybd.10
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:53:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tpY24U65dxDevik5396IsQMXmVZXiLzmW2j6b7ptC2o=;
        b=FGVUXzbMKsAgHtVe2H+ZGPByy9vTxmIYvrPV7ZuF76ZDV4PCOupJdRY2uHLiI7i+8R
         4Fjm3rnOC/ry4DX8g5MN/0YQ4aHPdCQZYFwG7UcSZ/43mvYNjuR6DmjlzCEnl8acF7KD
         ERVaFO4iv0zgtEZ4MmYzhpcYCiFLTkatnznfDTOltPoYyw5CvEIb1yptgTPwDbjWQDix
         pGxXZ1tFpWIKQUAKj6j+gMffNX2JeuA3u7s8cWrwnHHzy9T6apLvHv6bApzCw3vZvb6B
         a2xiK595oO97JhT8ZQYkTmP/j11qoIyiGxI24X5jHCYtpJjinnDlcXs5UPFQKhdZ/Kdz
         DK0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tpY24U65dxDevik5396IsQMXmVZXiLzmW2j6b7ptC2o=;
        b=Rt/5NuXQdQi/YRDOOR24Mgph85U8ZuSlFMWG0ZxuEu1gvr2BYqoBOamcRhxKThMY7c
         phpI7Qb8DTxLAj7x3LIIPvpziT0ruPj/iP4yKz0lTiJ6ujs7AFqxV0qCndofi22U943s
         unUZycWoetyjxUkEzi0fgPfffo9w3rXrJ0w0dCPFjZtLxLAjpTldYB2T0+HY+MuK+W2Y
         kDNWg3w33mwoOsg3FWAVdoHne4630Yf/SvULBVxIiIa1+Qarsa+A0S1SBEq0ZgigRYjq
         oNb4uRLI1Svx88WRnrpgyLkRD+rfJVz6BR2FXUp8z6dVi4/T9CI7f9kffUWhF53AIRVp
         1pNg==
X-Gm-Message-State: AFqh2koILZVve++Wfv/zycJD/wvxtj/rTLwEg7EmzHcsi9Sd/7T0eBCI
	ciNAATJAyfsYBZWbESL+LpEW6naxDiA=
X-Google-Smtp-Source: AMrXdXs5jnkdpf0WLGjSqHJja91Z23ecX2Os+zrAvpCFIdrfHWytTqhc2UPXUEbTUa59RZZK2SYuIAkg8gM=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:2491:0:b0:7ba:cd98:5bed with SMTP id
 k139-20020a252491000000b007bacd985bedmr646916ybk.69.1673297636065; Mon, 09
 Jan 2023 12:53:56 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:01 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-7-surenb@google.com>
Subject: [PATCH 06/41] maple_tree: Add smp_rmb() to dead node detection
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, "Liam R. Howlett" <Liam.Howlett@oracle.com>, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.co
 m, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: "Liam R. Howlett" <Liam.Howlett@oracle.com>

Add an smp_rmb() before reading the parent pointer to ensure that
anything read from the node prior to the parent pointer hasn't been
reordered ahead of this check.

The is necessary for RCU mode.

Fixes: 54a611b60590 ("Maple Tree: add new data structure")
Signed-off-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 lib/maple_tree.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/lib/maple_tree.c b/lib/maple_tree.c
index 8066fb1e8ec9..80ca28b656d3 100644
--- a/lib/maple_tree.c
+++ b/lib/maple_tree.c
@@ -535,9 +535,11 @@ static inline struct maple_node *mte_parent(const struct maple_enode *enode)
  */
 static inline bool ma_dead_node(const struct maple_node *node)
 {
-	struct maple_node *parent = (void *)((unsigned long)
-					     node->parent & ~MAPLE_NODE_MASK);
+	struct maple_node *parent;
 
+	/* Do not reorder reads from the node prior to the parent check */
+	smp_rmb();
+	parent = (void *)((unsigned long) node->parent & ~MAPLE_NODE_MASK);
 	return (parent == node);
 }
 
@@ -552,6 +554,8 @@ static inline bool mte_dead_node(const struct maple_enode *enode)
 	struct maple_node *parent, *node;
 
 	node = mte_to_node(enode);
+	/* Do not reorder reads from the node prior to the parent check */
+	smp_rmb();
 	parent = mte_parent(enode);
 	return (parent == node);
 }
-- 
2.39.0

