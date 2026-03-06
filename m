Return-Path: <linuxppc-dev+bounces-17797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6FZICnSpqmniVAEAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17797-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC8521E8B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Mar 2026 11:16:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fS2PC6hGRz3c5f;
	Fri, 06 Mar 2026 21:16:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772792175;
	cv=none; b=bLgurMsN+7rcqQDKs4SsjUo/DvvofbKzcKHrGrjg7679z5Y6OwWAyP1mhlOX04gs7X+cE3VpwJluwrsGBukTOtOVCjBldeNmNxn81p2AbUqSNPlDTl9fRRSP3jBfvGXtJ2uPF8baS7nid4lKwxpVf+hNyXnuLmxLU3oIASHR+m6rL/sXL8O18VyBEWI/d6g/OhxCTkN3pBpdQv1miwDYlwGEb7ozDdBHy/6pc9bVUE6aEjKHFeoVftUAijPyBxBMe6VQRM34LcB0nWBF0ZBwkkdxVlo/o0Mz5EhUfAMiiTbPRcOzkPSKpljzLIyOwy/tZ/FCdBc4oXJyIH+Hz87bRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772792175; c=relaxed/relaxed;
	bh=kYk0svydTKp3HQQf4hdshMPBR2IVsFSBSSEtZBR6GWY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eYxlbN/P0EQfq9YfilsQWMG/ZOeU1ZNPYMvbv0Gn4ZEy7hv/DN3ssERhyTxtAfS7DBrofxmhenjVyQNgICVjZyZCIpIA7sxOqnDOBvsD8r1WNuPu6agUnTCYDa/G2XqAXD0ohiFDtnKvuqLMn5Z9YgqMLoYU5Lh+YBZ6icYDQmUGi2m7jhk1q347kjk27pGVud13uysDvYbMsb9RWnxS6kaiy31MHT0VY95m6WETcICHOVk5DaaPrIxcV3Sz5/hCHfF6oW13aEnD1ejc8rRNv1r+BB05XWwcwh4rqvPXGI9wBoftMgbAO5eziHZEo7U0iLIOkaqv/793h/zOiKP1Tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CHBI0MPc; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=CHBI0MPc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=david@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fS2PC00B7z30T9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Mar 2026 21:16:14 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47A5B60127;
	Fri,  6 Mar 2026 10:16:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A777C4CEF7;
	Fri,  6 Mar 2026 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772792172;
	bh=aN1f11VNXm8TEP7a6s26GhJ/SMe/0NluR98vebxUP6U=;
	h=From:To:Cc:Subject:Date:From;
	b=CHBI0MPcs3WqAo1RU5sZKFW8fwe2JFRLkXD2gEBfA05SDEdafzPVDHMH8aw0ejrD1
	 crqje38RReq5vJVpM1YI1zNvWsClMXXuzPbjwWw2W0Br0k8sZvXTCojMTKdsEYTBoF
	 TQZEpdbvWip2ZmFiT0To1T7WuSrRK/oAtsAHSsmxayfcl3ww60vjF9VLaepfe0bLPX
	 d9L6oZeF8Ol+LMb77zqQx3p9ZtaiJ7pb9/WGw38ryflhSGSDKO4NV7WRWCCrWtG+lG
	 kpXRz5yWs5U5TkzVWGjSi37i/3Xtj+xBxmdbgu53ij+gVc0IPtQbMLSP9cYAJC/xSl
	 sb3JchfU6+kZw==
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
Subject: [PATCH v1 0/4] mm: move vma_(kernel|mmu)_pagesize() out of hugetlb.c
Date: Fri,  6 Mar 2026 11:15:56 +0100
Message-ID: <20260306101600.57355-1-david@kernel.org>
X-Mailer: git-send-email 2.43.0
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
X-Rspamd-Queue-Id: EBC8521E8B6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-17797-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-mm@kvack.org,m:linuxppc-dev@lists.ozlabs.org,m:kvm@vger.kernel.org,m:david@kernel.org,m:akpm@linux-foundation.org,m:maddy@linux.ibm.com,m:npiggin@gmail.com,m:mpe@ellerman.id.au,m:chleroy@kernel.org,m:muchun.song@linux.dev,m:osalvador@suse.de,m:ljs@kernel.org,m:Liam.Howlett@oracle.com,m:vbabka@kernel.org,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:jannh@google.com,m:pfalcato@suse.de,m:pbonzini@redhat.com,m:dan.j.williams@intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kvack.org,lists.ozlabs.org,vger.kernel.org,kernel.org,linux-foundation.org,linux.ibm.com,gmail.com,ellerman.id.au,linux.dev,suse.de,oracle.com,google.com,suse.com,redhat.com,intel.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[david@kernel.org,linuxppc-dev@lists.ozlabs.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Action: no action

Looking into vma_(kernel|mmu)_pagesize(), I realized that there is one
scenario where DAX would not do the right thing when the kernel is
not compiled with hugetlb support.

Without hugetlb support, vma_(kernel|mmu)_pagesize() will always return
PAGE_SIZE instead of using the ->pagesize() result provided by dax-device
code.

Fix that by moving vma_kernel_pagesize() to core MM code, where it belongs.
I don't think this is stable material, but am not 100% sure.

Also, move vma_mmu_pagesize() while at it. Remove the unnecessary hugetlb.h
inclusion from KVM code.

Cross-compiled heavily.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>
Cc: Lorenzo Stoakes <ljs@kernel.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Vlastimil Babka <vbabka@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Jann Horn <jannh@google.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Dan Williams <dan.j.williams@intel.com>

David Hildenbrand (Arm) (4):
  mm: move vma_kernel_pagesize() from hugetlb to mm.h
  mm: move vma_mmu_pagesize() from hugetlb to vma.c
  KVM: remove hugetlb.h inclusion
  KVM: PPC: remove hugetlb.h inclusion

 arch/powerpc/kvm/book3s_hv.c |  1 -
 include/linux/hugetlb.h      | 14 --------------
 include/linux/mm.h           | 22 ++++++++++++++++++++++
 mm/hugetlb.c                 | 28 ----------------------------
 mm/vma.c                     | 21 +++++++++++++++++++++
 virt/kvm/kvm_main.c          |  1 -
 6 files changed, 43 insertions(+), 44 deletions(-)


base-commit: f75825cdfc4c5477cffcfd2cafa4e5ce5aa67f13
-- 
2.43.0


