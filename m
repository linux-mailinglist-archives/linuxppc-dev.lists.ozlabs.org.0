Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81B43457D12
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 11:36:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hx91L2LP7z3cDY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Nov 2021 21:36:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=rbKCaOFZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=desiato.srs.infradead.org
 (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org;
 envelope-from=batv+a034db1df2736406f323+6663+infradead.org+dwmw2@desiato.srs.infradead.org;
 receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org
 [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hx8sX4Lnkz2yw7
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Nov 2021 21:29:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=TRQbOF8/4m0nHVfskdWnV/CbhyujsfdkdJEMQwMkjO0=; b=rbKCaOFZ5JgbTWc13zVz+5G7pi
 KBsQiaKHv+h4s104PvBQTp/kMM6/OdJCllxmEOyK5rvtMsQSX46f5Kl9Z7EymiscQymAkHvlJOzzz
 4wfNgKl/OSoEhCEgRijyPyzUCTwgBZLGoQv1EKqX8xdLP88DagjU/O+5OIBKY2OoWzc0Nrc8gEbea
 58vMK2VKRZrZ484UmWfULmUrPnSj2kHDYl4O6wELuu4GZwiFjdj6JKMWUAxSxOZAZw2hOPDLSn5yU
 /iGuOmWhPC9CieBa65vESz2HpuvVn6zz7wBgOgj/SimKg5bMS6vVbHenWynsGrQpqppawbeIlgWkd
 10UdTq7g==;
Received: from i7.infradead.org ([2001:8b0:10b:1:21e:67ff:fecb:7a92])
 by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1moNbR-00H55u-Hg; Sat, 20 Nov 2021 10:28:13 +0000
Received: from dwoodhou by i7.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1moNbQ-0002K2-3l; Sat, 20 Nov 2021 10:28:12 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Paolo Bonzini <pbonzini@redhat.com>,
	kvm <kvm@vger.kernel.org>
Subject: PATCH v4 00/11] KVM: x86/xen: Add in-kernel Xen event channel delivery
Date: Sat, 20 Nov 2021 10:27:59 +0000
Message-Id: <20211120102810.8858-1-dwmw2@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by
 desiato.infradead.org. See http://www.infradead.org/rpr.html
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

Event channels, yeah. That really is where I started.

It was all so simple in Joao and Ankur's original version at 
https://www.spinics.net/lists/kvm/msg182556.html — just a handful
of simple test_and_set_bit() calls on the mapped page.

When I posted v1 I didn't quite understand how steal time and nesting
were safely using the kvm_map_gfn() function, and I posted the Xen
part declaring that I had "reduced it to a previously solved problem".

Then I frowned at kvm_map_gfn() for a bit longer, concluded it was
basically impossible to use it safely on its own because the page it
maps might belong to another guest by the time it even returns to its
caller, and posted a v2 in which I did something safer for myself by
hooking into the MMU notifiers.

I then fixed the steal time reporting, and killed gfn_to_pfn_cache,
under separate cover.

In v3 of this series I re-introduced a saner gfn_to_pfn_cache with MMU 
notifier support to give it proper invalidation semantics. This can now 
be used for the Xen event channel support and should also be usable for 
fixing the various use-after-free races in the nesting code too — the 
last patch in this series being an untested proof of concept attempt at 
fixing one such.

Since adding a C file in virt/kvm/ was somewhat more painful than it
really should have been, there is a small detour into all the arch
specific Makefiles to make them include a common one.

v4: Rework the dirty marking given the relevation that it can only be 
done from the context of an active vCPU. So just defer it to happen in 
the unmap. Also introduce a lightweight unmap call instead of just the 
full destroy. Document the Xen shared info page as NOT participating in 
dirty tracking. Fix a typo in the CONFIG_HAVE_KVM_DIRTY_RING patch which 
prevented the capability from being advertised.

Intended for merging up to patch 10. Patch 11 is for illustration.



