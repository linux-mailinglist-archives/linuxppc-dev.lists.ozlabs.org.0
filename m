Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A5E4583B2
	for <lists+linuxppc-dev@lfdr.de>; Sun, 21 Nov 2021 14:01:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HxrBf2ZGQz3dpw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Nov 2021 00:01:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Vu9vRhXy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+e22a5da41c9f680ae1ec+6664+infradead.org+dwmw2@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hxr4F6JSzz2yKN
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 21 Nov 2021 23:55:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=IgNSXNY2TpIuc5DjPBel8XiPwVYxmuy/OdeenPYbteI=; b=Vu9vRhXy7bRTzRn551qpp2Sl2x
 zCtr/gMJ4DW8RwOHmzxJxzo7vDlzWes4Hqvf8OhYVQvu8TgUnPYAkp+B7dwWJGxd4qa98SoZOYuWV
 5bhHnd4moc54T+xIGj//+Ct1psMVjPk+Pdg32UPn83uTEm30Y2xWCWDUWG7zzQA8A9jiya3kArabf
 lHB8fd0S9GhuLNI6EX6C0akf58/mnAKpVwdY1c0zqvxOiNqI8W9eVWQtmP2IMzGzdVo5+UUmKjlgh
 pghg+NjWVpziG/dkvqPqodD+6axkmt7LKPKsHXKEoxT0UziAnHuI2HqKcy6sNMq8iwkWYu+xYx/tX
 kWDa6thg==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1momMv-00C3xt-Mo; Sun, 21 Nov 2021 12:54:54 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1momMv-0002Vv-R2; Sun, 21 Nov 2021 12:54:53 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: [PATCH v5 00/12] KVM: x86/xen: Add in-kernel Xen event channel
 delivery
Date: Sun, 21 Nov 2021 12:54:39 +0000
Message-Id: <20211121125451.9489-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: Anup Patel <anup.patel@wdc.com>,
 "wanpengli @ tencent . com" <wanpengli@tencent.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Joao Martins <joao.m.martins@oracle.com>, Will Deacon <will@kernel.org>,
 kvmarm@lists.cs.columbia.edu, linux-s390@vger.kernel.org,
 "joro @ 8bytes . org" <joro@8bytes.org>, Huacai Chen <chenhuacai@kernel.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, karahmed@amazon.com,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 butt3rflyh4ck <butterflyhuangxx@gmail.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "jmattson @ google . com" <jmattson@google.com>,
 "seanjc @ google . com" <seanjc@google.com>,
 "mtosatti @ redhat . com" <mtosatti@redhat.com>, linux-mips@vger.kernel.org,
 James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, "vkuznets @ redhat . com" <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Introduce the basic concept of 2 level event channels for kernel delivery,
which is just a simple matter of a few test_and_set_bit calls on a mapped
shared info page.

This can be used for routing MSI of passthrough devices to PIRQ event
channels in a Xen guest, and we can build on it for delivering IPIs and
timers directly from the kernel too.

v1: Use kvm_map_gfn() although I didn't quite see how it works.

v2: Avoid kvm_map_gfn() and implement a safe mapping with invalidation
    support for myself.

v3: Reinvent gfn_to_pfn_cache with sane invalidation semantics, for my
    use case as well as nesting.

v4: Rework dirty handling, as it became apparently that we need an active
    vCPU context to mark pages dirty so it can't be done from the MMU
    notifier duing the invalidation; it has to happen on unmap.

v5: Fix sparse warnings reported by kernel test robot <lkp@intel.com>.

    Fix revalidation when memslots change but the resulting HVA stays
    the same. We can use the same kernel mapping in that case, if the
    HVA → PFN translation was valid before. So that probably means we
    shouldn't unmap the "old_hva". Augment the test case to exercise
    that one too.

    Include the fix for the dirty ring vs. Xen shinfo oops reported
    by butt3rflyh4ck <butterflyhuangxx@gmail.com>.


As in the previous two rounds, the last patch (this time patch 12) is
included as illustration of how we *might* use this for fixing the UAF
bugs in nesting, but isn't intended to be applied as-is. Patches 1-11 are.



David Woodhouse (12):
      KVM: Introduce CONFIG_HAVE_KVM_DIRTY_RING
      KVM: Add Makefile.kvm for common files, use it for x86
      KVM: s390: Use Makefile.kvm for common files
      KVM: mips: Use Makefile.kvm for common files
      KVM: RISC-V: Use Makefile.kvm for common files
      KVM: powerpc: Use Makefile.kvm for common files
      KVM: arm64: Use Makefile.kvm for common files
      KVM: Reinstate gfn_to_pfn_cache with invalidation support
      KVM: x86/xen: Maintain valid mapping of Xen shared_info page
      KVM: x86/xen: Add KVM_IRQ_ROUTING_XEN_EVTCHN and event channel delivery
      KVM: x86: Fix wall clock writes in Xen shared_info not to mark page dirty
      KVM: x86: First attempt at converting nested virtual APIC page to gpc

 Documentation/virt/kvm/api.rst                     |  33 ++
 arch/arm64/kvm/Makefile                            |   6 +-
 arch/mips/kvm/Makefile                             |   3 +-
 arch/powerpc/kvm/Makefile                          |   6 +-
 arch/riscv/kvm/Makefile                            |   6 +-
 arch/s390/kvm/Makefile                             |   6 +-
 arch/x86/include/asm/kvm_host.h                    |   4 +-
 arch/x86/kvm/Kconfig                               |   2 +
 arch/x86/kvm/Makefile                              |   7 +-
 arch/x86/kvm/irq_comm.c                            |  12 +
 arch/x86/kvm/vmx/nested.c                          |  50 ++-
 arch/x86/kvm/vmx/vmx.c                             |  12 +-
 arch/x86/kvm/vmx/vmx.h                             |   2 +-
 arch/x86/kvm/x86.c                                 |  15 +-
 arch/x86/kvm/x86.h                                 |   1 -
 arch/x86/kvm/xen.c                                 | 341 +++++++++++++++++++--
 arch/x86/kvm/xen.h                                 |   9 +
 include/linux/kvm_dirty_ring.h                     |   8 +-
 include/linux/kvm_host.h                           | 110 +++++++
 include/linux/kvm_types.h                          |  18 ++
 include/uapi/linux/kvm.h                           |  11 +
 .../testing/selftests/kvm/x86_64/xen_shinfo_test.c | 184 ++++++++++-
 virt/kvm/Kconfig                                   |   6 +
 virt/kvm/Makefile.kvm                              |  14 +
 virt/kvm/dirty_ring.c                              |   2 +-
 virt/kvm/kvm_main.c                                |  16 +-
 virt/kvm/kvm_mm.h                                  |  44 +++
 virt/kvm/mmu_lock.h                                |  23 --
 virt/kvm/pfncache.c                                | 323 +++++++++++++++++++
 29 files changed, 1173 insertions(+), 101 deletions(-)


