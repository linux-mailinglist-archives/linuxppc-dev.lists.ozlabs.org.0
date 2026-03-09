Return-Path: <linuxppc-dev+bounces-17914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iFRFCwvlrmmsJwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17914-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 16:19:39 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4458023B896
	for <lists+linuxppc-dev@lfdr.de>; Mon, 09 Mar 2026 16:19:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fV0zq5tvfz3c9r;
	Tue, 10 Mar 2026 02:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1773069575;
	cv=none; b=KqkUacd1yNXiALOh1YutszJzhGWyp044Dp1PABrfHgbiDVwnKVjF3MmrQBL61gaMUpOla8HJT837jmq1MbM4EDOvt1ELT9Tl3iF0ZN/AxE/EIjI29Sph2fTRBJtdQEIDXlmw/hTdZvGnY1hoS8BGD4nmWj7zNC3iu5fPb++55WNANuCafH+u/tgCT72epDiapi63sZIdN8JoEQcPctPOwo99qdL+3EvTCVMX0kOFgi2SJHPVdcGl2i0xKY1LpFLrT9eyV/0TI+gXeKG2A+6GaMJY1IEoTaV5Kp5hMWuEgAMwYa9iwEb5I6IJsJHm2ZKHfcQF9C+L7oyXzMBy/KgFhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1773069575; c=relaxed/relaxed;
	bh=ZfcQPKW0OITtqsF6mlfleo6MJjHr9NFl0AaTRWZ2Fvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DDNBK1YASiww+81kY9fGt2ym8O3Rqa43u1YvB4g7bjEIaSoS+aq7sPg+ASm3vAwqjCQKG6oqkdbm2X8ASby3NxmmZK9T/CBlDL6ZPdRiX+gwkvMPEYy8v8W1Ob1HclFu8v5RYW487t+W9UHFT0MPcH13DxUnMqcr3NnJzpv4m4Tx7rrbRKPWVyI6kUegl+ZV9w2kDEzTriE4uaIDBdwtMIWpcvKpMkbmlgtBAeJ4MnDwP8Kc3jrM8D6k1jbVhQfFiOKfzvx+5W1Y8UMbgH3kdsScT2qd1lVAAQlc7CJRJkXYztKgHgpsCdLIFc802yuJQHjviY3KYWb7iXbgN0C0Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U8TGSaQ0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U8TGSaQ0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fV0zq0yvfz2xm3
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Mar 2026 02:19:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9191343997;
	Mon,  9 Mar 2026 15:19:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70011C4CEF7;
	Mon,  9 Mar 2026 15:19:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773069573;
	bh=1Tpg8dpXogI43ldKvRVlXnwzZdDW6L9YkP34QCbqGtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U8TGSaQ09iR0FrKwfQh/wBeA8JtXPa5xh1Ijd5GD24HH22yWtc+WRIYBBREe/zHoX
	 mim+0F4xyogg6j27YYr6oJKdiXjqBE929wUafl3JTo8XBlu9GK0F3BawY08nMnNnN5
	 +dZqqJk/DQlH12qhxFlRweFgExjYT5kIvUesROaZ4jsW99zDPzXaNBzmbx0Z9pzSya
	 FVcCIb3miryqet2ggbFgd0dGu1BmqGwHdYr/EJT5KzwbLnzwxP6bklbZHFaXUh5xdO
	 wano4BfHvih62oU0ZcLBupR6QdJQT1Qvl6hD0050OGIcjN1HThoOUCGOUqmWope7ZF
	 BXIeXML+1yMnA==
From: "David Hildenbrand (Arm)" <david@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	kvm@vger.kernel.org,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v2 3/4] KVM: remove hugetlb.h inclusion
Date: Mon,  9 Mar 2026 16:19:00 +0100
Message-ID: <20260309151901.123947-4-david@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309151901.123947-1-david@kernel.org>
References: <20260309151901.123947-1-david@kernel.org>
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
X-Rspamd-Queue-Id: 4458023B896
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17914-lists,linuxppc-dev=lfdr.de];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,vger.kernel.org,kernel.org,linux-foundation.org,linux.ibm.com,gmail.com,ellerman.id.au,linux.dev,suse.de,oracle.com,google.com,suse.com,redhat.com,intel.com];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:pbonzini@redhat.com,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:rdns,lists.ozlabs.org:helo]
X-Rspamd-Action: no action

hugetlb.h is no longer required now that we moved vma_kernel_pagesize()
to mm.h.

Reviewed-by: Lorenzo Stoakes (Oracle) <ljs@kernel.org>
Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
---
 virt/kvm/kvm_main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 22f8a672e1fd..58059648b881 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -41,7 +41,6 @@
 #include <linux/spinlock.h>
 #include <linux/compat.h>
 #include <linux/srcu.h>
-#include <linux/hugetlb.h>
 #include <linux/slab.h>
 #include <linux/sort.h>
 #include <linux/bsearch.h>
-- 
2.43.0


