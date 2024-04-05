Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 636E1899C33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 13:59:07 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UF8NNnVz;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UF8NNnVz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9xpx1Jbsz3vbc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 22:59:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UF8NNnVz;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=UF8NNnVz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=pbonzini@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9xpB6Z4rz3020
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 22:58:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W+x0+CoZa6QVpu1rtgd+fH2pAb0xlu8sJLIuEb6A4kU=;
	b=UF8NNnVzDf/DQIBknZnHp0hw1idQ4fgvBp96CrPquMIa30b2eepda8I+08PWwzRVs8szYi
	0QHlBqr024GiHJWAOtBErRW+J2qPZ/hxlb95EA+FXJrK3mq/8UQt7lB17w70aRvBO+KIZu
	mDtXOC9US4jYuhC9Ax1VU0MYiCN8rA0=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1712318304;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W+x0+CoZa6QVpu1rtgd+fH2pAb0xlu8sJLIuEb6A4kU=;
	b=UF8NNnVzDf/DQIBknZnHp0hw1idQ4fgvBp96CrPquMIa30b2eepda8I+08PWwzRVs8szYi
	0QHlBqr024GiHJWAOtBErRW+J2qPZ/hxlb95EA+FXJrK3mq/8UQt7lB17w70aRvBO+KIZu
	mDtXOC9US4jYuhC9Ax1VU0MYiCN8rA0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-589-LvYJznJmMXOAGq3bGEzUmg-1; Fri,
 05 Apr 2024 07:58:19 -0400
X-MC-Unique: LvYJznJmMXOAGq3bGEzUmg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 675AB1C05AF2;
	Fri,  5 Apr 2024 11:58:18 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 20CB240C6CB5;
	Fri,  5 Apr 2024 11:58:16 +0000 (UTC)
From: Paolo Bonzini <pbonzini@redhat.com>
To: linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH 0/4] KVM, mm: remove the .change_pte() MMU notifier and set_pte_at_notify()
Date: Fri,  5 Apr 2024 07:58:11 -0400
Message-ID: <20240405115815.3226315-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
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
Cc: kvm-riscv@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, loongarch@lists.linux.dev, David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>, Atish Patra <atishp@atishpatra.org>, linux-mips@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Bibo Mao <maobibo@loongson.cn>, Sean Christopherson <seanjc@google.com>, Anup Patel <anup@brainfault.org>, kvmarm@lists.linux.dev, Oliver Upton <oliver.upton@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org, linux-trace-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The .change_pte() MMU notifier callback was intended as an optimization
and for this reason it was initially called without a surrounding
mmu_notifier_invalidate_range_{start,end}() pair.  It was only ever
implemented by KVM (which was also the original user of MMU notifiers)
and the rules on when to call set_pte_at_notify() rather than set_pte_at()
have always been pretty obscure.

It may seem a miracle that it has never caused any hard to trigger
bugs, but there's a good reason for that: KVM's implementation has
been nonfunctional for a good part of its existence.  Already in
2012, commit 6bdb913f0a70 ("mm: wrap calls to set_pte_at_notify with
invalidate_range_start and invalidate_range_end", 2012-10-09) changed the
.change_pte() callback to occur within an invalidate_range_start/end()
pair; and because KVM unmaps the sPTEs during .invalidate_range_start(),
.change_pte() has no hope of finding a sPTE to change.

Therefore, all the code for .change_pte() can be removed from both KVM
and mm/, and set_pte_at_notify() can be replaced with just set_pte_at().

Please review!  Also feel free to take the KVM patches through the mm
tree, as I don't expect any conflicts.

Thanks,

Paolo

Paolo Bonzini (4):
  KVM: delete .change_pte MMU notifier callback
  KVM: remove unused argument of kvm_handle_hva_range()
  mmu_notifier: remove the .change_pte() callback
  mm: replace set_pte_at_notify() with just set_pte_at()

 arch/arm64/kvm/mmu.c                  | 34 -----------------
 arch/loongarch/include/asm/kvm_host.h |  1 -
 arch/loongarch/kvm/mmu.c              | 32 ----------------
 arch/mips/kvm/mmu.c                   | 30 ---------------
 arch/powerpc/include/asm/kvm_ppc.h    |  1 -
 arch/powerpc/kvm/book3s.c             |  5 ---
 arch/powerpc/kvm/book3s.h             |  1 -
 arch/powerpc/kvm/book3s_64_mmu_hv.c   | 12 ------
 arch/powerpc/kvm/book3s_hv.c          |  1 -
 arch/powerpc/kvm/book3s_pr.c          |  7 ----
 arch/powerpc/kvm/e500_mmu_host.c      |  6 ---
 arch/riscv/kvm/mmu.c                  | 20 ----------
 arch/x86/kvm/mmu/mmu.c                | 54 +--------------------------
 arch/x86/kvm/mmu/spte.c               | 16 --------
 arch/x86/kvm/mmu/spte.h               |  2 -
 arch/x86/kvm/mmu/tdp_mmu.c            | 46 -----------------------
 arch/x86/kvm/mmu/tdp_mmu.h            |  1 -
 include/linux/kvm_host.h              |  2 -
 include/linux/mmu_notifier.h          | 44 ----------------------
 include/trace/events/kvm.h            | 15 --------
 kernel/events/uprobes.c               |  5 +--
 mm/ksm.c                              |  4 +-
 mm/memory.c                           |  7 +---
 mm/migrate_device.c                   |  8 +---
 mm/mmu_notifier.c                     | 17 ---------
 virt/kvm/kvm_main.c                   | 50 +------------------------
 26 files changed, 10 insertions(+), 411 deletions(-)

-- 
2.43.0

