Return-Path: <linuxppc-dev+bounces-9279-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 123BBAD4AD4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Jun 2025 08:11:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bHFfY0cdnz307V;
	Wed, 11 Jun 2025 16:11:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749622293;
	cv=none; b=DPRbh887Sk+xf5KdzMNC/8wZqkDBnjWFOYcNLuxCb9Q3nwWoskGJKKh34+WmV12IgZk1aUofa8H+xY3LRgYyjaPhDskdvRDwse85nnZ6J//BpwNyBzoy73ezknEu0xcMrDzGLxebiPiGemf+Q+/vlOvfHCDHZ+KD7/B19GC2gljFNH0p+/Ln+KXfLIPLnKu67MuY70vc4ILxXQZdyPguPFbKy48X5lV28WuyFZ/lrOKbVDGK8UTTR1et9ClxrEbk8j4cg0WgoSZ7kKIh6ElcG39Db3SybFoodb+skEEWPFsnmp8tR3alry4f2luHljU3OWwPaU4ymXxuV0ij61qdUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749622293; c=relaxed/relaxed;
	bh=11o6hd06zYw8uMfo8qA7FkMm3k4rDBJBmNKkVmX5DBc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:content-type; b=FZ++Nhptl/VYS0RRml49G8K3PEuRBggZowJGDTfJBYR4G5WkV1nO6sSlCg3gke3cEhuln0FynaaFBjFMWJ5B34vf0P9EpOKwM/2MsWw4Q+m/Yt6jr+J02Th9LnXcKz+fI/9YwaFFWsv+eB0Dnlf1NzpMww6H+2+alPXAfhLa8uq3NIW6W3rlSeV0nAPX4H+MQNCZbC5Pnhtx3IKF968kwRtFX1VfW1etOL5fhRd9G7VQdkAP7E+FzdMPUBNAOOLg5Qo0UNJzBKWgaii8KLoCXUnA3DLCO4YEM3Abv5PaYv5coWQCsCsPw//HgRrg4wR6xf8f1HrvsZnktaHnoMZF4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WYjM1mOL; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eiJ4kCR+; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=WYjM1mOL;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eiJ4kCR+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=thuth@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bHFfX0JNgz2xbX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Jun 2025 16:11:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749622287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=11o6hd06zYw8uMfo8qA7FkMm3k4rDBJBmNKkVmX5DBc=;
	b=WYjM1mOLQCi709GyV6JJPu1PGo0GAWJZD/8jg1cDY48HQkC6/WIKNXfey+v7nSIggcQuNS
	43AwfYCdsjdUYVb5uXiercnwmBZe9ZLbV2irHCYxocf6TjtBbcsHw6oQS78rLV2UsNw7Na
	OMRqhlgJI3ApSM8SfxJznrcYchIxaWs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749622288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=11o6hd06zYw8uMfo8qA7FkMm3k4rDBJBmNKkVmX5DBc=;
	b=eiJ4kCR+Xi7l4ed+1quamJlKDEtLVKIQpLwNfQ9z4WPr+glkaatScwpyLjXr+a7hWyRP7z
	T68IaW2ZZFAKEwE5v0YaypnfIPUZJ/qaoAHTDEpRtuSQ5ZOjcydardBrqsaoc1ZpabQIFD
	8ghE44I/LhEteANyTV50lfZ8L8prDwo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-568-2IFu6eP8MKW6M7CeMuT0vg-1; Wed,
 11 Jun 2025 02:11:22 -0400
X-MC-Unique: 2IFu6eP8MKW6M7CeMuT0vg-1
X-Mimecast-MFC-AGG-ID: 2IFu6eP8MKW6M7CeMuT0vg_1749622280
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 84EE91809C80;
	Wed, 11 Jun 2025 06:11:20 +0000 (UTC)
Received: from thuth-p1g4.redhat.com (unknown [10.45.224.174])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 010C9195608D;
	Wed, 11 Jun 2025 06:11:16 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: linuxppc-dev@lists.ozlabs.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Geoff Levand <geoff@infradead.org>,
	Naveen N Rao <naveen@kernel.org>,
	Segher Boessenkool <segher@kernel.crashing.org>
Subject: [PATCH v3 0/2] powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
Date: Wed, 11 Jun 2025 08:11:13 +0200
Message-ID: <20250611061115.81437-1-thuth@redhat.com>
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
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aqCTUTGvXkGOgFJzHzXdD7bpeHWVhH6FJ_LOVJb72b0_1749622280
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The kernel Makefiles define the __ASSEMBLY__ macro to provide
a way to use headers in both, assembler and C source code.
However, all the supported versions of the GCC and Clang compilers
also define the macro __ASSEMBLER__ automatically already when compiling
assembler code, so some kernel headers are using __ASSEMBLER__ instead.
With regards to userspace code, this seems also to be constant source
of confusion, see for example these links here:

 https://lore.kernel.org/kvm/20250222014526.2302653-1-seanjc@google.com/
 https://stackoverflow.com/questions/28924355/gcc-assembler-preprocessor-not-compatible-with-standard-headers
 https://forums.raspberrypi.com/viewtopic.php?p=1652944#p1653834
 https://github.com/riscv-software-src/opensbi/issues/199

To avoid confusion in the future, it would make sense to standardize
on the macro that gets defined by the compiler, so this patch series
changes all occurances of __ASSEMBLY__ into __ASSEMBLER__.

I split the patches per architecture to ease the review, and I also
split the uapi headers from the normal ones in case we decide that
uapi needs to be treated differently from the normal headers here.

The x86, parisc and sh patches already got merged via their specific
architecture tree:

 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=24a295e4ef1ca8
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=8a141be3233af7
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=cccaea1d66e94b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e2b6a188625a2b
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=9cc646950eefda

So I assume the powerpc patches should go via the powerpc tree.

v3:
- Updated the patch descriptions according to Segher's suggestions

v2:
- Split the powerpc patches from the global series
  (see https://lore.kernel.org/all/20250314071013.1575167-1-thuth@redhat.com/)
- Rebased the patches on linux-next and fixed the conflicts
  and new occurances of __ASSEMBLY__

Thomas Huth (2):
  powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
  powerpc: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

 arch/powerpc/boot/page.h                           |  2 +-
 arch/powerpc/include/asm/asm-const.h               |  2 +-
 arch/powerpc/include/asm/barrier.h                 |  2 +-
 arch/powerpc/include/asm/book3s/32/kup.h           |  4 ++--
 arch/powerpc/include/asm/book3s/32/mmu-hash.h      |  8 ++++----
 arch/powerpc/include/asm/book3s/32/pgtable.h       | 12 ++++++------
 arch/powerpc/include/asm/book3s/64/hash-4k.h       |  4 ++--
 arch/powerpc/include/asm/book3s/64/hash-64k.h      |  4 ++--
 arch/powerpc/include/asm/book3s/64/hash.h          |  4 ++--
 arch/powerpc/include/asm/book3s/64/kup.h           |  6 +++---
 arch/powerpc/include/asm/book3s/64/mmu-hash.h      | 12 ++++++------
 arch/powerpc/include/asm/book3s/64/mmu.h           |  8 ++++----
 arch/powerpc/include/asm/book3s/64/pgtable-64k.h   |  4 ++--
 arch/powerpc/include/asm/book3s/64/pgtable.h       | 10 +++++-----
 arch/powerpc/include/asm/book3s/64/radix.h         |  8 ++++----
 arch/powerpc/include/asm/book3s/64/slice.h         |  4 ++--
 arch/powerpc/include/asm/bug.h                     | 14 +++++++-------
 arch/powerpc/include/asm/cache.h                   |  4 ++--
 arch/powerpc/include/asm/cpu_has_feature.h         |  4 ++--
 arch/powerpc/include/asm/cpuidle.h                 |  2 +-
 arch/powerpc/include/asm/cputable.h                |  8 ++++----
 arch/powerpc/include/asm/cputhreads.h              |  4 ++--
 arch/powerpc/include/asm/dcr-native.h              |  4 ++--
 arch/powerpc/include/asm/dcr.h                     |  4 ++--
 arch/powerpc/include/asm/epapr_hcalls.h            |  4 ++--
 arch/powerpc/include/asm/exception-64e.h           |  2 +-
 arch/powerpc/include/asm/exception-64s.h           |  6 +++---
 arch/powerpc/include/asm/extable.h                 |  2 +-
 arch/powerpc/include/asm/feature-fixups.h          |  6 +++---
 arch/powerpc/include/asm/firmware.h                |  4 ++--
 arch/powerpc/include/asm/fixmap.h                  |  4 ++--
 arch/powerpc/include/asm/ftrace.h                  |  8 ++++----
 arch/powerpc/include/asm/head-64.h                 |  4 ++--
 arch/powerpc/include/asm/hvcall.h                  |  4 ++--
 arch/powerpc/include/asm/hw_irq.h                  |  4 ++--
 arch/powerpc/include/asm/interrupt.h               |  4 ++--
 arch/powerpc/include/asm/irqflags.h                |  2 +-
 arch/powerpc/include/asm/jump_label.h              |  2 +-
 arch/powerpc/include/asm/kasan.h                   |  4 ++--
 arch/powerpc/include/asm/kdump.h                   |  4 ++--
 arch/powerpc/include/asm/kexec.h                   |  4 ++--
 arch/powerpc/include/asm/kgdb.h                    |  4 ++--
 arch/powerpc/include/asm/kup.h                     |  8 ++++----
 arch/powerpc/include/asm/kvm_asm.h                 |  2 +-
 arch/powerpc/include/asm/kvm_book3s_asm.h          |  6 +++---
 arch/powerpc/include/asm/kvm_booke_hv_asm.h        |  4 ++--
 arch/powerpc/include/asm/lv1call.h                 |  4 ++--
 arch/powerpc/include/asm/mmu.h                     |  8 ++++----
 arch/powerpc/include/asm/mpc52xx.h                 | 12 ++++++------
 arch/powerpc/include/asm/nohash/32/kup-8xx.h       |  4 ++--
 arch/powerpc/include/asm/nohash/32/mmu-44x.h       |  4 ++--
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h       |  4 ++--
 arch/powerpc/include/asm/nohash/32/pgtable.h       | 12 ++++++------
 arch/powerpc/include/asm/nohash/32/pte-8xx.h       |  2 +-
 arch/powerpc/include/asm/nohash/64/pgtable-4k.h    |  8 ++++----
 arch/powerpc/include/asm/nohash/64/pgtable.h       |  4 ++--
 arch/powerpc/include/asm/nohash/kup-booke.h        |  4 ++--
 arch/powerpc/include/asm/nohash/mmu-e500.h         |  4 ++--
 arch/powerpc/include/asm/nohash/pgtable.h          |  6 +++---
 arch/powerpc/include/asm/nohash/pte-e500.h         |  4 ++--
 arch/powerpc/include/asm/opal-api.h                |  4 ++--
 arch/powerpc/include/asm/opal.h                    |  4 ++--
 arch/powerpc/include/asm/page.h                    | 14 +++++++-------
 arch/powerpc/include/asm/page_32.h                 |  4 ++--
 arch/powerpc/include/asm/page_64.h                 |  4 ++--
 arch/powerpc/include/asm/pgtable.h                 |  8 ++++----
 arch/powerpc/include/asm/ppc_asm.h                 |  4 ++--
 arch/powerpc/include/asm/processor.h               |  8 ++++----
 arch/powerpc/include/asm/ptrace.h                  |  6 +++---
 arch/powerpc/include/asm/reg.h                     |  6 +++---
 arch/powerpc/include/asm/reg_booke.h               |  4 ++--
 arch/powerpc/include/asm/reg_fsl_emb.h             |  4 ++--
 arch/powerpc/include/asm/setup.h                   |  4 ++--
 arch/powerpc/include/asm/smp.h                     |  4 ++--
 arch/powerpc/include/asm/spu_csa.h                 |  4 ++--
 arch/powerpc/include/asm/synch.h                   |  4 ++--
 arch/powerpc/include/asm/thread_info.h             |  8 ++++----
 arch/powerpc/include/asm/tm.h                      |  4 ++--
 arch/powerpc/include/asm/types.h                   |  4 ++--
 arch/powerpc/include/asm/unistd.h                  |  4 ++--
 arch/powerpc/include/asm/vdso.h                    |  6 +++---
 arch/powerpc/include/asm/vdso/getrandom.h          |  4 ++--
 arch/powerpc/include/asm/vdso/gettimeofday.h       |  4 ++--
 arch/powerpc/include/asm/vdso/processor.h          |  4 ++--
 arch/powerpc/include/asm/vdso/vsyscall.h           |  4 ++--
 arch/powerpc/include/asm/vdso_datapage.h           |  6 +++---
 arch/powerpc/include/uapi/asm/opal-prd.h           |  4 ++--
 arch/powerpc/include/uapi/asm/ptrace.h             | 12 ++++++------
 arch/powerpc/include/uapi/asm/types.h              |  4 ++--
 arch/powerpc/kernel/head_booke.h                   |  4 ++--
 arch/powerpc/net/bpf_jit.h                         |  2 +-
 arch/powerpc/platforms/powernv/subcore.h           |  4 ++--
 arch/powerpc/xmon/xmon_bpts.h                      |  4 ++--
 .../selftests/powerpc/include/instructions.h       |  2 +-
 94 files changed, 240 insertions(+), 240 deletions(-)

-- 
2.49.0


