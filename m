Return-Path: <linuxppc-dev+bounces-16906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cJ3bOUGYlGkoFwIAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 17:33:05 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 13CBB14E36C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Feb 2026 17:33:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fFlYl3Qcxz2yrn;
	Wed, 18 Feb 2026 03:32:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::124a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1771345979;
	cv=none; b=RKOOwUfN3BXtZNI9cGKVWwg5R/LdtBc/tHJngvXIbwDPRmRmSazbwo+PXO/EQEcjn2RqO6wXcDR1rFOYtmSGr6YREohsJ19q6CNQA3vGK4E+/F2QPkR+OIVvW0iwZ2lM2mfhKxTEgdu7gPnNv9z0Tx17sNxy01QTYkmFyipERxmttqfZlDrMqErxzeR++Bybw8EZBaMAvp51Ub/GuumXx0crrWSxo+p4lI15Tsa7r9VopnETr0Wu5248p501Xf3iZwExaYLd/aQccEyThj6CyyJDdJL4DtItTtPDjY7EvRqf3LB2yFcrfizyXJVX1XI+z5WMgv1KMcLGzRWuWC8JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1771345979; c=relaxed/relaxed;
	bh=bJd/jsI1Ahr6ZvCTFiQFd3QULQDNn4kGH1XUoRnqvFw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=X925HlNGm+hupx7JkRWgNfFyXm2K1xIyteFtPwVEYwHwbgv8SRvGvzEFO804/Kapx3GOlhJarTgWZcygJABxGy/H/lypyXapJ5qZqexi7M/6Dkea134qmNM/JrthnnlIQFilQasEVGTyg2vWwHD7a5kIFAddiSUQsfuqQ3CWe+XpUnOAKQi+210dDoob+bXHxNx5Nq5/TZwaCJhKr+QYA6rXiIqjjonbBFU4mG/a/dgIOskfazWUypL6ZoK3yZo1UstzUtuq8Lmj5sO/hGtWVnC2EcPNqrXrSnMMsccH2I4xhlm+kB1IhHouQAqehQ4+dtns6muTUl4tn7Wnp8DJ4A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ySW8VjNi; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::124a; helo=mail-dl1-x124a.google.com; envelope-from=3nziuaqykdaw463qzns00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=ySW8VjNi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::124a; helo=mail-dl1-x124a.google.com; envelope-from=3nziuaqykdaw463qzns00sxq.o0yxuz6911o-pq7xu454.0bxmn4.03s@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-dl1-x124a.google.com (mail-dl1-x124a.google.com [IPv6:2607:f8b0:4864:20::124a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fFlYj5XPjz2xjP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Feb 2026 03:32:57 +1100 (AEDT)
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-1273665df8fso7149286c88.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Feb 2026 08:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771345974; x=1771950774; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bJd/jsI1Ahr6ZvCTFiQFd3QULQDNn4kGH1XUoRnqvFw=;
        b=ySW8VjNipv5m2sl3sC8xv5eLgPYoHj/HE6AoNy2r+iiTnBTVv/dW5UBa6Xa3eSKN+T
         JDbuNA95e7Gnb0qivpmSEm1zn67pSyn3RQK4HACM1tbHh7SuOYIbmu4o/AhiWrFyvHV0
         6egDat/+LA7HadndXnrE79sqdWBKDDxg8r11zPY5kU205Uc09D0EjsJLpPbvZKp35EQo
         x39x+tfXakRiKy81BOIty5U/q2fsXYrk1JZbzrbGwJRAiTQbsjKCV6BYWDOnUxxdOqTY
         W70oy6wrBsaRF+QHSFUQMG/7bXC8zU7i6AzkLXjtIuXP7JW5be/jpe2zub82e7mT7Kj1
         0q0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771345974; x=1771950774;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bJd/jsI1Ahr6ZvCTFiQFd3QULQDNn4kGH1XUoRnqvFw=;
        b=L7kVh2kmj1yBEyH5DJ7VRnkW3rPhK16uE7OqneyHnfn6EGOZiOzt07feo9AVqNxcqK
         N7JPzC4QL9ppbNWwTfoCJF8zfqlrNiyerGLScFKkkP0yQLtPVFeEt2XVEi+Ko2NJl9Ct
         ZYnYdk+67eW7LCVf85/M1Z89NisEi8RZtjBpr9YKNn3k/vsIw8UxB52fiZ4DOyB99oxf
         Oj1eIkseKEZAarBH2WKAGMOu6h+GdZ94Fjj7kljMSRv7eJeoJ/ymnKaQHw1d5LUup1TI
         APodeaIJOhOzpnVopKoaBBAft/Wy+SDiQR4UVMCeVV+YSzV+hfOVfpshJZnZVs2WmGLN
         2sWg==
X-Forwarded-Encrypted: i=1; AJvYcCXrGCXd0ZL246zmaCKv4pYXddszVVq6iHvSMD/6YHgNuJ3SXgboLwqAtrul++xI/ByGUzqXtjmji6ylKsI=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwmIEho+x4e72WwgHfCkBnPGN+QzoXLHc/mNSeIdmew+F9rnx8G
	GxlG7KTouaixyhWEQbBYUn2OezF/Q0pEtxPLiQJ8AJDFCjuZt6imiFnhpwq3HDLLR0L5pA8gYDO
	7b5l2Pg==
X-Received: from dlbur9.prod.google.com ([2002:a05:7022:ea49:b0:127:e77:9377])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:6b9f:b0:123:3488:899c
 with SMTP id a92af1059eb24-1273ae56e4dmr5617423c88.40.1771345973444; Tue, 17
 Feb 2026 08:32:53 -0800 (PST)
Date: Tue, 17 Feb 2026 08:32:47 -0800
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
Mime-Version: 1.0
X-Mailer: git-send-email 2.53.0.273.g2a3d683680-goog
Message-ID: <20260217163250.2326001-1-surenb@google.com>
Subject: [PATCH v2 0/3] Use killable vma write locking in most places
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: willy@infradead.org, david@kernel.org, ziy@nvidia.com, 
	matthew.brost@intel.com, joshua.hahnjy@gmail.com, rakie.kim@sk.com, 
	byungchul@sk.com, gourry@gourry.net, ying.huang@linux.alibaba.com, 
	apopple@nvidia.com, lorenzo.stoakes@oracle.com, baolin.wang@linux.alibaba.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, baohua@kernel.org, lance.yang@linux.dev, vbabka@suse.cz, 
	jannh@google.com, rppt@kernel.org, mhocko@suse.com, pfalcato@suse.de, 
	kees@kernel.org, maddy@linux.ibm.com, npiggin@gmail.com, mpe@ellerman.id.au, 
	chleroy@kernel.org, borntraeger@linux.ibm.com, frankja@linux.ibm.com, 
	imbrenda@linux.ibm.com, hca@linux.ibm.com, gor@linux.ibm.com, 
	agordeev@linux.ibm.com, svens@linux.ibm.com, gerald.schaefer@linux.ibm.com, 
	linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.6 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	MAILLIST(-0.20)[generic];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-16906-lists,linuxppc-dev=lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:surenb@
 google.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[google.com:+];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 13CBB14E36C
X-Rspamd-Action: no action

Now that we have vma_start_write_killable() we can replace most of the
vma_start_write() calls with it, improving reaction time to the kill
signal.

There are several places which are left untouched by this patchset:

1. free_pgtables() because function should free page tables even if a
fatal signal is pending.

2. userfaultd code, where some paths calling vma_start_write() can
handle EINTR and some can't without a deeper code refactoring.

3. vm_flags_{set|mod|clear} require refactoring that involves moving
vma_start_write() out of these functions and replacing it with
vma_assert_write_locked(), then callers of these functions should
lock the vma themselves using vma_start_write_killable() whenever
possible.

A cleanup patch is added in the beginning to make later changes more
readable. The second patch contains most of the changes and the last
patch contains the changes associated with process_vma_walk_lock()
error handling.

Changes since v1 [1]:
- Moved vma_start_write_killable() inside set_mempolicy_home_node()
to be done before mpol_dup(new), per Jann Horn
- Added error propagation for the missing PGWALK_WRLOCK users and
split it into a separate patch, per Jann Horn
- Moved vma_start_write_killable() inside __split_vma() to be done
before new->vm_ops->open(), per Jann Horn
- Added a separate patch to change flow control in vma_expand(),
per Jann Horn
- Brought back signal_pending() in mm_take_all_locks, per Jann Horn
- Moved vma_start_write_killable() inside __mmap_new_vma() to be done
before __mmap_new_file_vma(), per Jann Horn
- Added Reviewed-by for powerpc, per Ritesh Harjani
- Added s390 reviewers and the list due to changes in the last patch

[1] https://lore.kernel.org/all/20260209220849.2126486-1-surenb@google.com/

Suren Baghdasaryan (3):
  mm/vma: cleanup error handling path in vma_expand()
  mm: replace vma_start_write() with vma_start_write_killable()
  mm: use vma_start_write_killable() in process_vma_walk_lock()

 arch/powerpc/kvm/book3s_hv_uvmem.c |   5 +-
 arch/s390/kvm/kvm-s390.c           |   5 +-
 arch/s390/mm/gmap.c                |  13 +++-
 fs/proc/task_mmu.c                 |   7 +-
 include/linux/mempolicy.h          |   5 +-
 mm/khugepaged.c                    |   5 +-
 mm/madvise.c                       |   4 +-
 mm/memory.c                        |   2 +
 mm/mempolicy.c                     |  23 +++++--
 mm/mlock.c                         |  20 ++++--
 mm/mprotect.c                      |   4 +-
 mm/mremap.c                        |   4 +-
 mm/pagewalk.c                      |  20 ++++--
 mm/vma.c                           | 105 ++++++++++++++++++++---------
 mm/vma_exec.c                      |   6 +-
 15 files changed, 164 insertions(+), 64 deletions(-)


base-commit: b08472d036a36893ecf68296d87beb58d21f4357
-- 
2.53.0.273.g2a3d683680-goog


