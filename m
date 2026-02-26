Return-Path: <linuxppc-dev+bounces-17229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFGSIO/wn2kyfAQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:06:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A73501A19BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 08:06:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fM2Yk4g3qz2yFm;
	Thu, 26 Feb 2026 18:06:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::134a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772089578;
	cv=none; b=I5m9ZrM5w6fqnWmfxtKfXoF7erc7ODDAnnnTeHaNTmW9W39Pd17jDmkenKrNJpD1JDWS+YrXajqQctVEP6bLplnIeTTGdMZWkHdT2o4zW58vqojoZQsfRKcEdI1WevK0VnJDBEKKI5a98b3eaIg2okB9MPL5+lA2ZxhpfvUzx2SrxShP5WPyBhV+zTEVi4caWDXrMqm9HW33WvJn54XTXF2lF0CnecbCPdubBowzB6pcKpm4Ope0nlZcDMSEGQqqZaqsCWL6OhqGKWg2BBfIozaJPG0T0xHHK34ctxFtHmmx+LmkXW5dbsSEHFuTYmhtYVvHokERaRsHQlC1jDltMA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772089578; c=relaxed/relaxed;
	bh=vucVmOFSxssu4W4+hD04IB0isnzzlwVXoGbpC2l+3Iw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SXCcUVnLX/BU8Z+O+MmEgpc0sdzsEMfsqYNr0amL7r5CqNGPOMKwTp1gKq4v2hRxb2PoTXbBpjEuHWmgeHGQJWcx6UTjOhlDiSTjFgGSXTHw5+eh/346mWNedabZhyuMLPaBPDoTXAgrpyV/Asai5twyNlQ7r/TeUNqXzddNwVpazIslra0LTCeC9fx0w3kce1z46AIsc26YQq1z2WTp63eyGSz96EVELvsRgbBhTtlYuxtyHwq7eZ2H+TvAo5aIocvl3nIwUAnptV0YyvBcEkXCNuz/dscKU/cKbU9Hjixi9qvsWNhkfM3n63fpNYwdbf+S8P+tepMwQdiTF+ECRw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P/vWR45s; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::134a; helo=mail-dy1-x134a.google.com; envelope-from=35fcfaqykdjomol8h5aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org) smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=P/vWR45s;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::134a; helo=mail-dy1-x134a.google.com; envelope-from=35fcfaqykdjomol8h5aiiaf8.6igfchorjj6-78pfcmnm.itf45m.ila@flex--surenb.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-dy1-x134a.google.com (mail-dy1-x134a.google.com [IPv6:2607:f8b0:4864:20::134a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fM2Yj4Gtqz2xMt
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Feb 2026 18:06:16 +1100 (AEDT)
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2bdcd394f5bso603873eec.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Feb 2026 23:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772089573; x=1772694373; darn=lists.ozlabs.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vucVmOFSxssu4W4+hD04IB0isnzzlwVXoGbpC2l+3Iw=;
        b=P/vWR45sq5OKygnBabOcM+ucO6WuKjEy2xSm7/O9YDkJvOM73CHQ7n6UDZaFrSVUPc
         wuWfDNQwd7GoC3JoZl+jif9re0CM9s/NQLf0S2h2VelnB54qPEcR9pYeZ/ymEPDdTx2F
         xMeJ6+LeJjoOgfUrNeVn0ODykOgRZA/FOpJiBQSDjwyi+3ajuHlK3WpDikjVQ2Sl7qgi
         9S2AhAEoDawsdL3vROMgkQlf477NUKhf+BIOGCyxoMrKQmVNdguyV+1IsKRi3ToUOalF
         zLzEp2GzAuSFlSE7rjZ+RdNaWWYiC3uA6zWLFwYAUhmzB2mM/yWfD1R0dwFJ8pj1h2A2
         QYBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772089573; x=1772694373;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vucVmOFSxssu4W4+hD04IB0isnzzlwVXoGbpC2l+3Iw=;
        b=fY8LaV63+kKUrhkOdF1YXgpY5/Y+xBqnq6EUe0rZuj+6jJvN5XH/FCIGIM71r4k1WP
         vK/tft1SfPfJFd3y966VYqovwW0DvgkgmDNPVCqmuuMeJaENYdPDnz/qcgF5aCh6a9el
         Qkk9MOUNkrU+z6Z9HpvDGCK4SbJbGU0aFPvN+v+lrcmZxQx6ob33c/xcWWVoy2zORATs
         QKi10xF7h0BHOeTa6MOB7F11CkQw5dtoj1y/a2wDTZAELFiT3NYiusOXzrVObsAKlfu2
         TSKFj62Nkp/6JxYmHeYnmM6MFB0MW8sHwGDbBSWSfwzql8a9HhOcj9UhDVAzT5ExhHZf
         QbXw==
X-Forwarded-Encrypted: i=1; AJvYcCU68kUmktA5Sly2OCJZ54MIg5wwEHYAE+kSXHPLNBU8KzYwrp4wp66CfhL3ZA9ofurwu64EbNbEhIFAt38=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yz2gQ6OfomrLQY0PQWYSW2gec2jQHQwtPYDJGyy1CLRBFIQ/uA7
	BkKOmUBicbC84df7vSfFLPQ+M0TH3SofD9Z1iMV8gJ64JEqAHsP2Oyuiu4J8oZ4PqK3gh/Pas5q
	LBWZQVA==
X-Received: from dlam21-n1.prod.google.com ([2002:a05:701b:2095:10b0:127:89b6:8d2a])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:60aa:b0:127:3b16:bf4f
 with SMTP id a92af1059eb24-127869c9ac6mr1332481c88.40.1772089573227; Wed, 25
 Feb 2026 23:06:13 -0800 (PST)
Date: Wed, 25 Feb 2026 23:06:06 -0800
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
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
Message-ID: <20260226070609.3072570-1-surenb@google.com>
Subject: [PATCH v3 0/3] Use killable vma write locking in most places
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
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[google.com,reject];
	MV_CASE(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[google.com:s=20230601];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17229-lists,linuxppc-dev=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:willy@infradead.org,m:david@kernel.org,m:ziy@nvidia.com,m:matthew.brost@intel.com,m:joshua.hahnjy@gmail.com,m:rakie.kim@sk.com,m:byungchul@sk.com,m:gourry@gourry.net,m:ying.huang@linux.alibaba.com,m:apopple@nvidia.com,m:lorenzo.stoakes@oracle.com,m:baolin.wang@linux.alibaba.com,m:Liam.Howlett@oracle.com,m:npache@redhat.com,m:ryan.roberts@arm.com,m:dev.jain@arm.com,m:baohua@kernel.org,m:lance.yang@linux.dev,m:vbabka@suse.cz,m:jannh@google.com,m:rppt@kernel.org,m:mhocko@suse.com,m:pfalcato@suse.de,m:kees@kernel.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:borntraeger@linux.ibm.com,m:frankja@linux.ibm.com,m:imbrenda@linux.ibm.com,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:svens@linux.ibm.com,m:gerald.schaefer@linux.ibm.com,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-s390@vger.kernel.org,m:surenb@
 google.com,m:joshuahahnjy@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[3];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[infradead.org,kernel.org,nvidia.com,intel.com,gmail.com,sk.com,gourry.net,linux.alibaba.com,oracle.com,redhat.com,arm.com,linux.dev,suse.cz,google.com,suse.com,suse.de,linux.ibm.com,ellerman.id.au,kvack.org,lists.ozlabs.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[43];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[surenb@google.com,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[google.com:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.569];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: A73501A19BA
X-Rspamd-Action: no action

Now that we have vma_start_write_killable() we can replace most of the
vma_start_write() calls with it, improving reaction time to the kill
signal.

There are several places which are left untouched by this patchset:

1. free_pgtables() because function should free page tables even if a
fatal signal is pending.

2. userfaultd code, where some paths calling vma_start_write() can
handle EINTR and some can't without a deeper code refactoring.

3. mpol_rebind_mm() which is used by cpusset controller for migrations
and operates on a remote mm. Incomplete operations here would result
in an inconsistent cgroup state.

4. vm_flags_{set|mod|clear} require refactoring that involves moving
vma_start_write() out of these functions and replacing it with
vma_assert_write_locked(), then callers of these functions should
lock the vma themselves using vma_start_write_killable() whenever
possible.

A cleanup patch is added in the beginning to make later changes more
readable. The second patch contains most of the changes and the last
patch contains the changes associated with process_vma_walk_lock()
error handling.

Changes since v2 [1]:
- rebased over mm-unstable, per Matthew Wilcox;
- removed mpol_rebind_mm() changes since the function operates on a
remote mm and incomplete operation can leave unrelated process in an
inconsistent state;
- moved vma_start_write_killable() inside set_mempolicy_home_node() to
avoid locking extra vmas, per Liam R. Howlett
- moved vma_start_write_killable() inside __mmap_new_vma() to lock the
vma right after it's allocation, per Liam R. Howlett
- introduced VMA_MERGE_ERROR_INTR to add EINTR handling for vma_modify()
- changed do_mbind() error handling for avoid EINTR overrides;
- changed migrate_to_node() error handling for avoid EINTR overrides;
- added EINTR handling in queue_pages_range();
- fixed clear_refs_write() error handling which previous verstion broke
by skipping some of the cleanup logic;

[1] https://lore.kernel.org/all/20260217163250.2326001-1-surenb@google.com/

Suren Baghdasaryan (3):
  mm/vma: cleanup error handling path in vma_expand()
  mm: replace vma_start_write() with vma_start_write_killable()
  mm: use vma_start_write_killable() in process_vma_walk_lock()

 arch/powerpc/kvm/book3s_hv_uvmem.c |   5 +-
 arch/s390/kvm/kvm-s390.c           |   2 +-
 fs/proc/task_mmu.c                 |   5 +-
 mm/khugepaged.c                    |   5 +-
 mm/madvise.c                       |   4 +-
 mm/memory.c                        |   2 +
 mm/mempolicy.c                     |  22 +++--
 mm/mlock.c                         |  21 +++--
 mm/mprotect.c                      |   4 +-
 mm/mremap.c                        |   4 +-
 mm/pagewalk.c                      |  20 +++--
 mm/vma.c                           | 127 ++++++++++++++++++++---------
 mm/vma.h                           |   6 ++
 mm/vma_exec.c                      |   6 +-
 14 files changed, 167 insertions(+), 66 deletions(-)


base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
-- 
2.53.0.414.gf7e9f6c205-goog


