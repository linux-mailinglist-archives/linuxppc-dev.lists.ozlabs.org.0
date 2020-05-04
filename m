Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DACFE1C37CE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 13:15:18 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49G0dG4F3lzDqRM
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 21:15:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=207.211.31.81;
 helo=us-smtp-delivery-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Bi+GMALy; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=OBfQnUWG; 
 dkim-atps=neutral
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49G0NR00wZzDqRB
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 21:04:06 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ge2kIyJdgRHgJc3xIEJpHZvhqDCwpTLXsJfRGK12sg0=;
 b=Bi+GMALyVnBQso3eVYLVYMIp3vcBidNmokRoLJUheRoQp5SMuE3Qzk4FbjWIJaaR1p0AzU
 sAmISlrzsraPA8ZnShCcFW50z7+VOPK/kBFTHbfkXBqEQkWGMOJDpKJLA0MzSy2oBy8B6y
 eQVDhQIUc/KY7O7tlEndB8HuBMO47xw=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588590244;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ge2kIyJdgRHgJc3xIEJpHZvhqDCwpTLXsJfRGK12sg0=;
 b=OBfQnUWGiqlTHr0UpmXCmPThDSnwrfFhcwmbzjc5Cu1P3CCR94EwEYJiUDtJHA3x8dWYfQ
 G+UTt9s3jIX++NQtOIdpbiLiNq751uxlpD5/puAJvBsao0jsA8b9hO+pTMmV+cKmsbeKbQ
 vCGFAfdBDhluhRIuvZBrIzWbmJ3jdmk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-gpvSz9yONIOugE7AWMPFdg-1; Mon, 04 May 2020 07:04:01 -0400
X-MC-Unique: gpvSz9yONIOugE7AWMPFdg-1
Received: by mail-wm1-f70.google.com with SMTP id w2so4684364wmc.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 May 2020 04:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rsTdEgsyypdyRB9o18FwxbdIncnKg1Ww1Dhq95WU8LI=;
 b=ClvxWmnU/rBQR05MtRddAtSHLiNIGZoHIv35p9UFmEX9adne2Ka563nMxecOm9KPvp
 xbgG/tTJf+FakQCR0Qp333D10ux+3v20fBqab+hlxOSHdViFsYD8QSgUBq5ZBOZt2X+6
 dZ7koBJXLSPL1Aw23dcn74Ugvi6cGmyO/p9VMmX51ZJqw+4W40rgVqwADfdppH+lSYDl
 EJYwcbASYEyscMMBmVefgPfPYJb+5B8C8/y93D9GdPNPFLegunmo6neSu7egRFvOHhLE
 9C2p5NZOI4NVQtzIrsJ9yjvH6/tay1L+ywxqPQBGCPTb+eg19R5vwT8RRnBjoI0L6Bun
 t8LQ==
X-Gm-Message-State: AGi0Pua/Ib5JqrcHWZjBrIydHllj9TOeoPEtdGIVXljt5CEeZyGM9ut/
 ThO9uw5Rr4uEwven2uYErPmCbYMrW1ps0V44jCsvkHAJbBZU0OkAGPhRdoltxFiSdbwGA/W04CA
 UX6iZxM5DR/ZKJczaynOV2wrgkw==
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr13928086wme.89.1588590240242; 
 Mon, 04 May 2020 04:04:00 -0700 (PDT)
X-Google-Smtp-Source: APiQypI40Kl2O1Zs9u7xdk4chjTFUgOIeVTTMpFgh5XD+4FOR/YLz9o0UcJ/VIKtHj6/P8ehdEPo3A==
X-Received: by 2002:a1c:a9c3:: with SMTP id s186mr13928039wme.89.1588590239488; 
 Mon, 04 May 2020 04:03:59 -0700 (PDT)
Received: from localhost.localdomain.com ([194.230.155.213])
 by smtp.gmail.com with ESMTPSA id a13sm10885750wrv.67.2020.05.04.04.03.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 May 2020 04:03:58 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH v2 5/5] kvm_main: replace debugfs with stats_fs
Date: Mon,  4 May 2020 13:03:44 +0200
Message-Id: <20200504110344.17560-6-eesposit@redhat.com>
X-Mailer: git-send-email 2.25.2
In-Reply-To: <20200504110344.17560-1-eesposit@redhat.com>
References: <20200504110344.17560-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
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
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 linux-s390@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 linux-mips@vger.kernel.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>, linux-fsdevel@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>,
 linuxppc-dev@lists.ozlabs.org, Jim Mattson <jmattson@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use stats_fs API instead of debugfs to create sources and add values.

This also requires to change all architecture files to replace the old
debugfs_entries with stats_fs_vcpu_entries and statsfs_vm_entries.

The files/folders name and organization is kept unchanged, and a symlink
in sys/kernel/debugfs/kvm is left for backward compatibility.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 arch/arm64/kvm/Kconfig          |   1 +
 arch/arm64/kvm/guest.c          |   2 +-
 arch/mips/kvm/Kconfig           |   1 +
 arch/mips/kvm/mips.c            |   2 +-
 arch/powerpc/kvm/Kconfig        |   1 +
 arch/powerpc/kvm/book3s.c       |   6 +-
 arch/powerpc/kvm/booke.c        |   8 +-
 arch/s390/kvm/Kconfig           |   1 +
 arch/s390/kvm/kvm-s390.c        |  16 +-
 arch/x86/include/asm/kvm_host.h |   2 +-
 arch/x86/kvm/Kconfig            |   1 +
 arch/x86/kvm/Makefile           |   2 +-
 arch/x86/kvm/debugfs.c          |  64 -------
 arch/x86/kvm/stats_fs.c         |  56 ++++++
 arch/x86/kvm/x86.c              |   6 +-
 include/linux/kvm_host.h        |  39 +---
 virt/kvm/arm/arm.c              |   2 +-
 virt/kvm/kvm_main.c             | 314 ++++----------------------------
 18 files changed, 142 insertions(+), 382 deletions(-)
 delete mode 100644 arch/x86/kvm/debugfs.c
 create mode 100644 arch/x86/kvm/stats_fs.c

diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index 449386d76441..8c125387b673 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -23,6 +23,7 @@ config KVM
 =09depends on OF
 =09# for TASKSTATS/TASK_DELAY_ACCT:
 =09depends on NET && MULTIUSER
+=09imply STATS_FS
 =09select MMU_NOTIFIER
 =09select PREEMPT_NOTIFIERS
 =09select HAVE_KVM_CPU_RELAX_INTERCEPT
diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 8417b200bec9..235ed44e4353 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -29,7 +29,7 @@
=20
 #include "trace.h"
=20
-struct kvm_stats_debugfs_item debugfs_entries[] =3D {
+struct stats_fs_value stats_fs_vcpu_entries[] =3D {
 =09VCPU_STAT("halt_successful_poll", halt_successful_poll),
 =09VCPU_STAT("halt_attempted_poll", halt_attempted_poll),
 =09VCPU_STAT("halt_poll_invalid", halt_poll_invalid),
diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
index b91d145aa2d5..19d14e979e5f 100644
--- a/arch/mips/kvm/Kconfig
+++ b/arch/mips/kvm/Kconfig
@@ -19,6 +19,7 @@ config KVM
 =09tristate "Kernel-based Virtual Machine (KVM) support"
 =09depends on HAVE_KVM
 =09depends on MIPS_FP_SUPPORT
+=09imply STATS_FS
 =09select EXPORT_UASM
 =09select PREEMPT_NOTIFIERS
 =09select KVM_GENERIC_DIRTYLOG_READ_PROTECT
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index fdf1c14d9205..a47d21f35444 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -39,7 +39,7 @@
 #define VECTORSPACING 0x100=09/* for EI/VI mode */
 #endif
=20
-struct kvm_stats_debugfs_item debugfs_entries[] =3D {
+struct stats_fs_value stats_fs_vcpu_entries[] =3D {
 =09VCPU_STAT("wait", wait_exits),
 =09VCPU_STAT("cache", cache_exits),
 =09VCPU_STAT("signal", signal_exits),
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 12885eda324e..feb5e110ebb0 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -19,6 +19,7 @@ if VIRTUALIZATION
=20
 config KVM
 =09bool
+=09imply STATS_FS
 =09select PREEMPT_NOTIFIERS
 =09select HAVE_KVM_EVENTFD
 =09select HAVE_KVM_VCPU_ASYNC_IOCTL
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 37508a356f28..76222ab148da 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -38,7 +38,7 @@
=20
 /* #define EXIT_DEBUG */
=20
-struct kvm_stats_debugfs_item debugfs_entries[] =3D {
+struct stats_fs_value stats_fs_vcpu_entries[] =3D {
 =09VCPU_STAT("exits", sum_exits),
 =09VCPU_STAT("mmio", mmio_exits),
 =09VCPU_STAT("sig", signal_exits),
@@ -66,6 +66,10 @@ struct kvm_stats_debugfs_item debugfs_entries[] =3D {
 =09VCPU_STAT("pthru_all", pthru_all),
 =09VCPU_STAT("pthru_host", pthru_host),
 =09VCPU_STAT("pthru_bad_aff", pthru_bad_aff),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vm_entries[] =3D {
 =09VM_STAT("largepages_2M", num_2M_pages, .mode =3D 0444),
 =09VM_STAT("largepages_1G", num_1G_pages, .mode =3D 0444),
 =09{ NULL }
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index c2984cb6dfa7..b14c07786cc8 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -35,7 +35,12 @@
=20
 unsigned long kvmppc_booke_handlers;
=20
-struct kvm_stats_debugfs_item debugfs_entries[] =3D {
+struct stats_fs_value stats_fs_vm_entries[] =3D {
+=09VM_STAT("remote_tlb_flush", remote_tlb_flush),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vcpu_entries[] =3D {
 =09VCPU_STAT("mmio", mmio_exits),
 =09VCPU_STAT("sig", signal_exits),
 =09VCPU_STAT("itlb_r", itlb_real_miss_exits),
@@ -54,7 +59,6 @@ struct kvm_stats_debugfs_item debugfs_entries[] =3D {
 =09VCPU_STAT("halt_wakeup", halt_wakeup),
 =09VCPU_STAT("doorbell", dbell_exits),
 =09VCPU_STAT("guest doorbell", gdbell_exits),
-=09VM_STAT("remote_tlb_flush", remote_tlb_flush),
 =09{ NULL }
 };
=20
diff --git a/arch/s390/kvm/Kconfig b/arch/s390/kvm/Kconfig
index def3b60f1fe8..4e912ffcde78 100644
--- a/arch/s390/kvm/Kconfig
+++ b/arch/s390/kvm/Kconfig
@@ -20,6 +20,7 @@ config KVM
 =09def_tristate y
 =09prompt "Kernel-based Virtual Machine (KVM) support"
 =09depends on HAVE_KVM
+=09imply STATS_FS
 =09select PREEMPT_NOTIFIERS
 =09select HAVE_KVM_CPU_RELAX_INTERCEPT
 =09select HAVE_KVM_VCPU_ASYNC_IOCTL
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index dbeb7da07f18..f2f090b78529 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -57,7 +57,16 @@
 #define VCPU_IRQS_MAX_BUF (sizeof(struct kvm_s390_irq) * \
 =09=09=09   (KVM_MAX_VCPUS + LOCAL_IRQS))
=20
-struct kvm_stats_debugfs_item debugfs_entries[] =3D {
+struct stats_fs_value stats_fs_vm_entries[] =3D {
+=09VM_STAT("inject_float_mchk", inject_float_mchk),
+=09VM_STAT("inject_io", inject_io),
+=09VM_STAT("inject_pfault_done", inject_pfault_done),
+=09VM_STAT("inject_service_signal", inject_service_signal),
+=09VM_STAT("inject_virtio", inject_virtio),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vcpu_entries[] =3D {
 =09VCPU_STAT("userspace_handled", exit_userspace),
 =09VCPU_STAT("exit_null", exit_null),
 =09VCPU_STAT("exit_validity", exit_validity),
@@ -95,18 +104,13 @@ struct kvm_stats_debugfs_item debugfs_entries[] =3D {
 =09VCPU_STAT("inject_ckc", inject_ckc),
 =09VCPU_STAT("inject_cputm", inject_cputm),
 =09VCPU_STAT("inject_external_call", inject_external_call),
-=09VM_STAT("inject_float_mchk", inject_float_mchk),
 =09VCPU_STAT("inject_emergency_signal", inject_emergency_signal),
-=09VM_STAT("inject_io", inject_io),
 =09VCPU_STAT("inject_mchk", inject_mchk),
-=09VM_STAT("inject_pfault_done", inject_pfault_done),
 =09VCPU_STAT("inject_program", inject_program),
 =09VCPU_STAT("inject_restart", inject_restart),
-=09VM_STAT("inject_service_signal", inject_service_signal),
 =09VCPU_STAT("inject_set_prefix", inject_set_prefix),
 =09VCPU_STAT("inject_stop_signal", inject_stop_signal),
 =09VCPU_STAT("inject_pfault_init", inject_pfault_init),
-=09VM_STAT("inject_virtio", inject_virtio),
 =09VCPU_STAT("instruction_epsw", instruction_epsw),
 =09VCPU_STAT("instruction_gs", instruction_gs),
 =09VCPU_STAT("instruction_io_other", instruction_io_other),
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_hos=
t.h
index 42a2d0d3984a..6a04f590963f 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -35,7 +35,7 @@
 #include <asm/kvm_vcpu_regs.h>
 #include <asm/hyperv-tlfs.h>
=20
-#define __KVM_HAVE_ARCH_VCPU_DEBUGFS
+#define __KVM_HAVE_ARCH_VCPU_STATS_FS
=20
 #define KVM_MAX_VCPUS 288
 #define KVM_SOFT_MAX_VCPUS 240
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index d8154e0684b6..834b8f4790a7 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -25,6 +25,7 @@ config KVM
 =09# for TASKSTATS/TASK_DELAY_ACCT:
 =09depends on NET && MULTIUSER
 =09depends on X86_LOCAL_APIC
+=09imply STATS_FS
 =09select PREEMPT_NOTIFIERS
 =09select MMU_NOTIFIER
 =09select HAVE_KVM_IRQCHIP
diff --git a/arch/x86/kvm/Makefile b/arch/x86/kvm/Makefile
index a789759b7261..18285a382eba 100644
--- a/arch/x86/kvm/Makefile
+++ b/arch/x86/kvm/Makefile
@@ -11,7 +11,7 @@ kvm-$(CONFIG_KVM_ASYNC_PF)=09+=3D $(KVM)/async_pf.o
=20
 kvm-y=09=09=09+=3D x86.o emulate.o i8259.o irq.o lapic.o \
 =09=09=09   i8254.o ioapic.o irq_comm.o cpuid.o pmu.o mtrr.o \
-=09=09=09   hyperv.o debugfs.o mmu/mmu.o mmu/page_track.o
+=09=09=09   hyperv.o stats_fs.o mmu/mmu.o mmu/page_track.o
=20
 kvm-intel-y=09=09+=3D vmx/vmx.o vmx/vmenter.o vmx/pmu_intel.o vmx/vmcs12.o=
 vmx/evmcs.o vmx/nested.o
 kvm-amd-y=09=09+=3D svm/svm.o svm/vmenter.o svm/pmu.o svm/nested.o svm/avi=
c.o svm/sev.o
diff --git a/arch/x86/kvm/debugfs.c b/arch/x86/kvm/debugfs.c
deleted file mode 100644
index 018aebce33ff..000000000000
--- a/arch/x86/kvm/debugfs.c
+++ /dev/null
@@ -1,64 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Kernel-based Virtual Machine driver for Linux
- *
- * Copyright 2016 Red Hat, Inc. and/or its affiliates.
- */
-#include <linux/kvm_host.h>
-#include <linux/debugfs.h>
-#include "lapic.h"
-
-static int vcpu_get_timer_advance_ns(void *data, u64 *val)
-{
-=09struct kvm_vcpu *vcpu =3D (struct kvm_vcpu *) data;
-=09*val =3D vcpu->arch.apic->lapic_timer.timer_advance_ns;
-=09return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(vcpu_timer_advance_ns_fops, vcpu_get_timer_advance=
_ns, NULL, "%llu\n");
-
-static int vcpu_get_tsc_offset(void *data, u64 *val)
-{
-=09struct kvm_vcpu *vcpu =3D (struct kvm_vcpu *) data;
-=09*val =3D vcpu->arch.tsc_offset;
-=09return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(vcpu_tsc_offset_fops, vcpu_get_tsc_offset, NULL, "=
%lld\n");
-
-static int vcpu_get_tsc_scaling_ratio(void *data, u64 *val)
-{
-=09struct kvm_vcpu *vcpu =3D (struct kvm_vcpu *) data;
-=09*val =3D vcpu->arch.tsc_scaling_ratio;
-=09return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(vcpu_tsc_scaling_fops, vcpu_get_tsc_scaling_ratio,=
 NULL, "%llu\n");
-
-static int vcpu_get_tsc_scaling_frac_bits(void *data, u64 *val)
-{
-=09*val =3D kvm_tsc_scaling_ratio_frac_bits;
-=09return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(vcpu_tsc_scaling_frac_fops, vcpu_get_tsc_scaling_f=
rac_bits, NULL, "%llu\n");
-
-void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
-{
-=09debugfs_create_file("tsc-offset", 0444, vcpu->debugfs_dentry, vcpu,
-=09=09=09    &vcpu_tsc_offset_fops);
-
-=09if (lapic_in_kernel(vcpu))
-=09=09debugfs_create_file("lapic_timer_advance_ns", 0444,
-=09=09=09=09    vcpu->debugfs_dentry, vcpu,
-=09=09=09=09    &vcpu_timer_advance_ns_fops);
-
-=09if (kvm_has_tsc_control) {
-=09=09debugfs_create_file("tsc-scaling-ratio", 0444,
-=09=09=09=09    vcpu->debugfs_dentry, vcpu,
-=09=09=09=09    &vcpu_tsc_scaling_fops);
-=09=09debugfs_create_file("tsc-scaling-ratio-frac-bits", 0444,
-=09=09=09=09    vcpu->debugfs_dentry, vcpu,
-=09=09=09=09    &vcpu_tsc_scaling_frac_fops);
-=09}
-}
diff --git a/arch/x86/kvm/stats_fs.c b/arch/x86/kvm/stats_fs.c
new file mode 100644
index 000000000000..f2ac6ed8b01b
--- /dev/null
+++ b/arch/x86/kvm/stats_fs.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Kernel-based Virtual Machine driver for Linux
+ *
+ * Copyright 2016 Red Hat, Inc. and/or its affiliates.
+ */
+#include <linux/kvm_host.h>
+#include <linux/stats_fs.h>
+#include "lapic.h"
+
+#define VCPU_ARCH_STATS_FS(n, s, x, ...)=09=09=09=09=09\
+=09=09=09{ n, offsetof(struct s, x), .aggr_kind =3D STATS_FS_SUM,=09\
+=09=09=09  ##__VA_ARGS__ }
+
+struct stats_fs_value stats_fs_vcpu_tsc_offset[] =3D {
+=09VCPU_ARCH_STATS_FS("tsc-offset", kvm_vcpu_arch, tsc_offset,
+=09=09=09   .type =3D STATS_FS_S64, .mode =3D 0444),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vcpu_arch_lapic_timer[] =3D {
+=09VCPU_ARCH_STATS_FS("lapic_timer_advance_ns", kvm_timer, timer_advance_n=
s,
+=09=09=09   .type =3D STATS_FS_U64, .mode =3D 0444),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vcpu_arch_tsc_ratio[] =3D {
+=09VCPU_ARCH_STATS_FS("tsc-scaling-ratio", kvm_vcpu_arch, tsc_scaling_rati=
o,
+=09=09=09   .type =3D STATS_FS_U64, .mode =3D 0444),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vcpu_arch_tsc_frac[] =3D {
+=09{ "tsc-scaling-ratio-frac-bits", 0, .type =3D STATS_FS_U64, .mode =3D 0=
444 },
+=09{ NULL } /* base is &kvm_tsc_scaling_ratio_frac_bits */
+};
+
+void kvm_arch_create_vcpu_stats_fs(struct kvm_vcpu *vcpu)
+{
+=09stats_fs_source_add_values(vcpu->stats_fs_src, stats_fs_vcpu_tsc_offset=
,
+=09=09=09=09   &vcpu->arch);
+
+=09if (lapic_in_kernel(vcpu))
+=09=09stats_fs_source_add_values(vcpu->stats_fs_src,
+=09=09=09=09=09   stats_fs_vcpu_arch_lapic_timer,
+=09=09=09=09=09   &vcpu->arch.apic->lapic_timer);
+
+=09if (kvm_has_tsc_control) {
+=09=09stats_fs_source_add_values(vcpu->stats_fs_src,
+=09=09=09=09=09   stats_fs_vcpu_arch_tsc_ratio,
+=09=09=09=09=09   &vcpu->arch);
+=09=09stats_fs_source_add_values(vcpu->stats_fs_src,
+=09=09=09=09=09   stats_fs_vcpu_arch_tsc_frac,
+=09=09=09=09=09   &kvm_tsc_scaling_ratio_frac_bits);
+=09}
+}
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 35723dafedeb..01fed7ac2e49 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -190,7 +190,7 @@ static u64 __read_mostly host_xss;
 u64 __read_mostly supported_xss;
 EXPORT_SYMBOL_GPL(supported_xss);
=20
-struct kvm_stats_debugfs_item debugfs_entries[] =3D {
+struct stats_fs_value stats_fs_vcpu_entries[] =3D {
 =09VCPU_STAT("pf_fixed", pf_fixed),
 =09VCPU_STAT("pf_guest", pf_guest),
 =09VCPU_STAT("tlb_flush", tlb_flush),
@@ -217,6 +217,10 @@ struct kvm_stats_debugfs_item debugfs_entries[] =3D {
 =09VCPU_STAT("nmi_injections", nmi_injections),
 =09VCPU_STAT("req_event", req_event),
 =09VCPU_STAT("l1d_flush", l1d_flush),
+=09{ NULL }
+};
+
+struct stats_fs_value stats_fs_vm_entries[] =3D {
 =09VM_STAT("mmu_shadow_zapped", mmu_shadow_zapped),
 =09VM_STAT("mmu_pte_write", mmu_pte_write),
 =09VM_STAT("mmu_pte_updated", mmu_pte_updated),
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 3845f857ef7b..1282799aa46e 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -27,6 +27,7 @@
 #include <linux/refcount.h>
 #include <linux/nospec.h>
 #include <asm/signal.h>
+#include <linux/stats_fs.h>
=20
 #include <linux/kvm.h>
 #include <linux/kvm_para.h>
@@ -318,7 +319,7 @@ struct kvm_vcpu {
 =09bool preempted;
 =09bool ready;
 =09struct kvm_vcpu_arch arch;
-=09struct dentry *debugfs_dentry;
+=09struct stats_fs_source *stats_fs_src;
 };
=20
 static inline int kvm_vcpu_exiting_guest_mode(struct kvm_vcpu *vcpu)
@@ -498,8 +499,7 @@ struct kvm {
 =09long tlbs_dirty;
 =09struct list_head devices;
 =09u64 manual_dirty_log_protect;
-=09struct dentry *debugfs_dentry;
-=09struct kvm_stat_data **debugfs_stat_data;
+=09struct stats_fs_source *stats_fs_src;
 =09struct srcu_struct srcu;
 =09struct srcu_struct irq_srcu;
 =09pid_t userspace_pid;
@@ -880,8 +880,8 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu);
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu);
=20
-#ifdef __KVM_HAVE_ARCH_VCPU_DEBUGFS
-void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu);
+#ifdef __KVM_HAVE_ARCH_VCPU_STATS_FS
+void kvm_arch_create_vcpu_stats_fs(struct kvm_vcpu *vcpu);
 #endif
=20
 int kvm_arch_hardware_enable(void);
@@ -1110,33 +1110,14 @@ static inline bool kvm_is_error_gpa(struct kvm *kvm=
, gpa_t gpa)
 =09return kvm_is_error_hva(hva);
 }
=20
-enum kvm_stat_kind {
-=09KVM_STAT_VM,
-=09KVM_STAT_VCPU,
-};
-
-struct kvm_stat_data {
-=09struct kvm *kvm;
-=09struct kvm_stats_debugfs_item *dbgfs_item;
-};
-
-struct kvm_stats_debugfs_item {
-=09const char *name;
-=09int offset;
-=09enum kvm_stat_kind kind;
-=09int mode;
-};
-
-#define KVM_DBGFS_GET_MODE(dbgfs_item)                                    =
     \
-=09((dbgfs_item)->mode ? (dbgfs_item)->mode : 0644)
-
 #define VM_STAT(n, x, ...) =09=09=09=09=09=09=09=09=09=09=09=09=09\
-=09{ n, offsetof(struct kvm, stat.x), KVM_STAT_VM, ## __VA_ARGS__ }
+=09{ n, offsetof(struct kvm, stat.x), STATS_FS_U64, STATS_FS_SUM, ## __VA_=
ARGS__ }
 #define VCPU_STAT(n, x, ...)=09=09=09=09=09=09=09=09=09=09=09=09\
-=09{ n, offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCPU, ## __VA_ARGS__ }
+=09{ n, offsetof(struct kvm_vcpu, stat.x), STATS_FS_U64, STATS_FS_SUM, ## =
__VA_ARGS__ }
=20
-extern struct kvm_stats_debugfs_item debugfs_entries[];
-extern struct dentry *kvm_debugfs_dir;
+extern struct stats_fs_value stats_fs_vcpu_entries[];
+extern struct stats_fs_value stats_fs_vm_entries[];
+extern struct stats_fs_source *kvm_stats_fs_dir;
=20
 #if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
 static inline int mmu_notifier_retry(struct kvm *kvm, unsigned long mmu_se=
q)
diff --git a/virt/kvm/arm/arm.c b/virt/kvm/arm/arm.c
index 48d0ec44ad77..4171f92fa473 100644
--- a/virt/kvm/arm/arm.c
+++ b/virt/kvm/arm/arm.c
@@ -140,7 +140,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long typ=
e)
 =09return ret;
 }
=20
-int kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
+int kvm_arch_create_vcpu_stats_fs(struct kvm_vcpu *vcpu)
 {
 =09return 0;
 }
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 74bdb7bf3295..093150125bc2 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -25,6 +25,7 @@
 #include <linux/vmalloc.h>
 #include <linux/reboot.h>
 #include <linux/debugfs.h>
+#include <linux/stats_fs.h>
 #include <linux/highmem.h>
 #include <linux/file.h>
 #include <linux/syscore_ops.h>
@@ -109,11 +110,8 @@ static struct kmem_cache *kvm_vcpu_cache;
 static __read_mostly struct preempt_ops kvm_preempt_ops;
 static DEFINE_PER_CPU(struct kvm_vcpu *, kvm_running_vcpu);
=20
-struct dentry *kvm_debugfs_dir;
-EXPORT_SYMBOL_GPL(kvm_debugfs_dir);
-
-static int kvm_debugfs_num_entries;
-static const struct file_operations stat_fops_per_vm;
+struct stats_fs_source *kvm_stats_fs_dir;
+EXPORT_SYMBOL_GPL(kvm_stats_fs_dir);
=20
 static long kvm_vcpu_ioctl(struct file *file, unsigned int ioctl,
 =09=09=09   unsigned long arg);
@@ -356,6 +354,8 @@ static void kvm_vcpu_init(struct kvm_vcpu *vcpu, struct=
 kvm *kvm, unsigned id)
=20
 void kvm_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
+=09stats_fs_source_revoke(vcpu->stats_fs_src);
+=09stats_fs_source_put(vcpu->stats_fs_src);
 =09kvm_arch_vcpu_destroy(vcpu);
=20
 =09/*
@@ -601,52 +601,27 @@ static void kvm_free_memslots(struct kvm *kvm, struct=
 kvm_memslots *slots)
 =09kvfree(slots);
 }
=20
-static void kvm_destroy_vm_debugfs(struct kvm *kvm)
+static void kvm_destroy_vm_stats_fs(struct kvm *kvm)
 {
-=09int i;
-
-=09if (!kvm->debugfs_dentry)
-=09=09return;
-
-=09debugfs_remove_recursive(kvm->debugfs_dentry);
-
-=09if (kvm->debugfs_stat_data) {
-=09=09for (i =3D 0; i < kvm_debugfs_num_entries; i++)
-=09=09=09kfree(kvm->debugfs_stat_data[i]);
-=09=09kfree(kvm->debugfs_stat_data);
-=09}
+=09stats_fs_source_remove_subordinate(kvm_stats_fs_dir, kvm->stats_fs_src)=
;
+=09stats_fs_source_revoke(kvm->stats_fs_src);
+=09stats_fs_source_put(kvm->stats_fs_src);
 }
=20
-static int kvm_create_vm_debugfs(struct kvm *kvm, int fd)
+static int kvm_create_vm_stats_fs(struct kvm *kvm, int fd)
 {
 =09char dir_name[ITOA_MAX_LEN * 2];
-=09struct kvm_stat_data *stat_data;
-=09struct kvm_stats_debugfs_item *p;
=20
-=09if (!debugfs_initialized())
+=09if (!stats_fs_initialized())
 =09=09return 0;
=20
 =09snprintf(dir_name, sizeof(dir_name), "%d-%d", task_pid_nr(current), fd)=
;
-=09kvm->debugfs_dentry =3D debugfs_create_dir(dir_name, kvm_debugfs_dir);
+=09kvm->stats_fs_src =3D stats_fs_source_create(dir_name);
+=09stats_fs_source_add_subordinate(kvm_stats_fs_dir, kvm->stats_fs_src);
=20
-=09kvm->debugfs_stat_data =3D kcalloc(kvm_debugfs_num_entries,
-=09=09=09=09=09 sizeof(*kvm->debugfs_stat_data),
-=09=09=09=09=09 GFP_KERNEL_ACCOUNT);
-=09if (!kvm->debugfs_stat_data)
-=09=09return -ENOMEM;
+=09stats_fs_source_add_values(kvm->stats_fs_src, stats_fs_vm_entries, kvm)=
;
=20
-=09for (p =3D debugfs_entries; p->name; p++) {
-=09=09stat_data =3D kzalloc(sizeof(*stat_data), GFP_KERNEL_ACCOUNT);
-=09=09if (!stat_data)
-=09=09=09return -ENOMEM;
-
-=09=09stat_data->kvm =3D kvm;
-=09=09stat_data->dbgfs_item =3D p;
-=09=09kvm->debugfs_stat_data[p - debugfs_entries] =3D stat_data;
-=09=09debugfs_create_file(p->name, KVM_DBGFS_GET_MODE(p),
-=09=09=09=09    kvm->debugfs_dentry, stat_data,
-=09=09=09=09    &stat_fops_per_vm);
-=09}
+=09stats_fs_source_add_values(kvm->stats_fs_src, stats_fs_vcpu_entries, NU=
LL);
 =09return 0;
 }
=20
@@ -783,7 +758,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 =09struct mm_struct *mm =3D kvm->mm;
=20
 =09kvm_uevent_notify_change(KVM_EVENT_DESTROY_VM, kvm);
-=09kvm_destroy_vm_debugfs(kvm);
+=09kvm_destroy_vm_stats_fs(kvm);
 =09kvm_arch_sync_events(kvm);
 =09mutex_lock(&kvm_lock);
 =09list_del(&kvm->vm_list);
@@ -2946,7 +2921,6 @@ static int kvm_vcpu_release(struct inode *inode, stru=
ct file *filp)
 {
 =09struct kvm_vcpu *vcpu =3D filp->private_data;
=20
-=09debugfs_remove_recursive(vcpu->debugfs_dentry);
 =09kvm_put_kvm(vcpu->kvm);
 =09return 0;
 }
@@ -2970,19 +2944,22 @@ static int create_vcpu_fd(struct kvm_vcpu *vcpu)
 =09return anon_inode_getfd(name, &kvm_vcpu_fops, vcpu, O_RDWR | O_CLOEXEC)=
;
 }
=20
-static void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu)
+static void kvm_create_vcpu_stats_fs(struct kvm_vcpu *vcpu)
 {
-#ifdef __KVM_HAVE_ARCH_VCPU_DEBUGFS
 =09char dir_name[ITOA_MAX_LEN * 2];
=20
-=09if (!debugfs_initialized())
+=09if (!stats_fs_initialized())
 =09=09return;
=20
 =09snprintf(dir_name, sizeof(dir_name), "vcpu%d", vcpu->vcpu_id);
-=09vcpu->debugfs_dentry =3D debugfs_create_dir(dir_name,
-=09=09=09=09=09=09  vcpu->kvm->debugfs_dentry);
=20
-=09kvm_arch_create_vcpu_debugfs(vcpu);
+=09vcpu->stats_fs_src =3D stats_fs_source_create(dir_name);
+=09stats_fs_source_add_subordinate(vcpu->kvm->stats_fs_src, vcpu->stats_fs=
_src);
+
+=09stats_fs_source_add_values(vcpu->stats_fs_src, stats_fs_vcpu_entries, v=
cpu);
+
+#ifdef __KVM_HAVE_ARCH_VCPU_STATS_FS
+=09kvm_arch_create_vcpu_stats_fs(vcpu);
 #endif
 }
=20
@@ -3031,8 +3008,6 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm, =
u32 id)
 =09if (r)
 =09=09goto vcpu_free_run_page;
=20
-=09kvm_create_vcpu_debugfs(vcpu);
-
 =09mutex_lock(&kvm->lock);
 =09if (kvm_get_vcpu_by_id(kvm, id)) {
 =09=09r =3D -EEXIST;
@@ -3061,11 +3036,11 @@ static int kvm_vm_ioctl_create_vcpu(struct kvm *kvm=
, u32 id)
=20
 =09mutex_unlock(&kvm->lock);
 =09kvm_arch_vcpu_postcreate(vcpu);
+=09kvm_create_vcpu_stats_fs(vcpu);
 =09return r;
=20
 unlock_vcpu_destroy:
 =09mutex_unlock(&kvm->lock);
-=09debugfs_remove_recursive(vcpu->debugfs_dentry);
 =09kvm_arch_vcpu_destroy(vcpu);
 vcpu_free_run_page:
 =09free_page((unsigned long)vcpu->run);
@@ -3839,7 +3814,7 @@ static int kvm_dev_ioctl_create_vm(unsigned long type=
)
 =09 * cases it will be called by the final fput(file) and will take
 =09 * care of doing kvm_put_kvm(kvm).
 =09 */
-=09if (kvm_create_vm_debugfs(kvm, r) < 0) {
+=09if (kvm_create_vm_stats_fs(kvm, r) < 0) {
 =09=09put_unused_fd(r);
 =09=09fput(file);
 =09=09return -ENOMEM;
@@ -4295,214 +4270,6 @@ struct kvm_io_device *kvm_io_bus_get_dev(struct kvm=
 *kvm, enum kvm_bus bus_idx,
 }
 EXPORT_SYMBOL_GPL(kvm_io_bus_get_dev);
=20
-static int kvm_debugfs_open(struct inode *inode, struct file *file,
-=09=09=09   int (*get)(void *, u64 *), int (*set)(void *, u64),
-=09=09=09   const char *fmt)
-{
-=09struct kvm_stat_data *stat_data =3D (struct kvm_stat_data *)
-=09=09=09=09=09  inode->i_private;
-
-=09/* The debugfs files are a reference to the kvm struct which
-=09 * is still valid when kvm_destroy_vm is called.
-=09 * To avoid the race between open and the removal of the debugfs
-=09 * directory we test against the users count.
-=09 */
-=09if (!refcount_inc_not_zero(&stat_data->kvm->users_count))
-=09=09return -ENOENT;
-
-=09if (simple_attr_open(inode, file, get,
-=09=09    KVM_DBGFS_GET_MODE(stat_data->dbgfs_item) & 0222
-=09=09    ? set : NULL,
-=09=09    fmt)) {
-=09=09kvm_put_kvm(stat_data->kvm);
-=09=09return -ENOMEM;
-=09}
-
-=09return 0;
-}
-
-static int kvm_debugfs_release(struct inode *inode, struct file *file)
-{
-=09struct kvm_stat_data *stat_data =3D (struct kvm_stat_data *)
-=09=09=09=09=09  inode->i_private;
-
-=09simple_attr_release(inode, file);
-=09kvm_put_kvm(stat_data->kvm);
-
-=09return 0;
-}
-
-static int kvm_get_stat_per_vm(struct kvm *kvm, size_t offset, u64 *val)
-{
-=09*val =3D *(ulong *)((void *)kvm + offset);
-
-=09return 0;
-}
-
-static int kvm_clear_stat_per_vm(struct kvm *kvm, size_t offset)
-{
-=09*(ulong *)((void *)kvm + offset) =3D 0;
-
-=09return 0;
-}
-
-static int kvm_get_stat_per_vcpu(struct kvm *kvm, size_t offset, u64 *val)
-{
-=09int i;
-=09struct kvm_vcpu *vcpu;
-
-=09*val =3D 0;
-
-=09kvm_for_each_vcpu(i, vcpu, kvm)
-=09=09*val +=3D *(u64 *)((void *)vcpu + offset);
-
-=09return 0;
-}
-
-static int kvm_clear_stat_per_vcpu(struct kvm *kvm, size_t offset)
-{
-=09int i;
-=09struct kvm_vcpu *vcpu;
-
-=09kvm_for_each_vcpu(i, vcpu, kvm)
-=09=09*(u64 *)((void *)vcpu + offset) =3D 0;
-
-=09return 0;
-}
-
-static int kvm_stat_data_get(void *data, u64 *val)
-{
-=09int r =3D -EFAULT;
-=09struct kvm_stat_data *stat_data =3D (struct kvm_stat_data *)data;
-
-=09switch (stat_data->dbgfs_item->kind) {
-=09case KVM_STAT_VM:
-=09=09r =3D kvm_get_stat_per_vm(stat_data->kvm,
-=09=09=09=09=09stat_data->dbgfs_item->offset, val);
-=09=09break;
-=09case KVM_STAT_VCPU:
-=09=09r =3D kvm_get_stat_per_vcpu(stat_data->kvm,
-=09=09=09=09=09  stat_data->dbgfs_item->offset, val);
-=09=09break;
-=09}
-
-=09return r;
-}
-
-static int kvm_stat_data_clear(void *data, u64 val)
-{
-=09int r =3D -EFAULT;
-=09struct kvm_stat_data *stat_data =3D (struct kvm_stat_data *)data;
-
-=09if (val)
-=09=09return -EINVAL;
-
-=09switch (stat_data->dbgfs_item->kind) {
-=09case KVM_STAT_VM:
-=09=09r =3D kvm_clear_stat_per_vm(stat_data->kvm,
-=09=09=09=09=09  stat_data->dbgfs_item->offset);
-=09=09break;
-=09case KVM_STAT_VCPU:
-=09=09r =3D kvm_clear_stat_per_vcpu(stat_data->kvm,
-=09=09=09=09=09    stat_data->dbgfs_item->offset);
-=09=09break;
-=09}
-
-=09return r;
-}
-
-static int kvm_stat_data_open(struct inode *inode, struct file *file)
-{
-=09__simple_attr_check_format("%llu\n", 0ull);
-=09return kvm_debugfs_open(inode, file, kvm_stat_data_get,
-=09=09=09=09kvm_stat_data_clear, "%llu\n");
-}
-
-static const struct file_operations stat_fops_per_vm =3D {
-=09.owner =3D THIS_MODULE,
-=09.open =3D kvm_stat_data_open,
-=09.release =3D kvm_debugfs_release,
-=09.read =3D simple_attr_read,
-=09.write =3D simple_attr_write,
-=09.llseek =3D no_llseek,
-};
-
-static int vm_stat_get(void *_offset, u64 *val)
-{
-=09unsigned offset =3D (long)_offset;
-=09struct kvm *kvm;
-=09u64 tmp_val;
-
-=09*val =3D 0;
-=09mutex_lock(&kvm_lock);
-=09list_for_each_entry(kvm, &vm_list, vm_list) {
-=09=09kvm_get_stat_per_vm(kvm, offset, &tmp_val);
-=09=09*val +=3D tmp_val;
-=09}
-=09mutex_unlock(&kvm_lock);
-=09return 0;
-}
-
-static int vm_stat_clear(void *_offset, u64 val)
-{
-=09unsigned offset =3D (long)_offset;
-=09struct kvm *kvm;
-
-=09if (val)
-=09=09return -EINVAL;
-
-=09mutex_lock(&kvm_lock);
-=09list_for_each_entry(kvm, &vm_list, vm_list) {
-=09=09kvm_clear_stat_per_vm(kvm, offset);
-=09}
-=09mutex_unlock(&kvm_lock);
-
-=09return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(vm_stat_fops, vm_stat_get, vm_stat_clear, "%llu\n"=
);
-
-static int vcpu_stat_get(void *_offset, u64 *val)
-{
-=09unsigned offset =3D (long)_offset;
-=09struct kvm *kvm;
-=09u64 tmp_val;
-
-=09*val =3D 0;
-=09mutex_lock(&kvm_lock);
-=09list_for_each_entry(kvm, &vm_list, vm_list) {
-=09=09kvm_get_stat_per_vcpu(kvm, offset, &tmp_val);
-=09=09*val +=3D tmp_val;
-=09}
-=09mutex_unlock(&kvm_lock);
-=09return 0;
-}
-
-static int vcpu_stat_clear(void *_offset, u64 val)
-{
-=09unsigned offset =3D (long)_offset;
-=09struct kvm *kvm;
-
-=09if (val)
-=09=09return -EINVAL;
-
-=09mutex_lock(&kvm_lock);
-=09list_for_each_entry(kvm, &vm_list, vm_list) {
-=09=09kvm_clear_stat_per_vcpu(kvm, offset);
-=09}
-=09mutex_unlock(&kvm_lock);
-
-=09return 0;
-}
-
-DEFINE_SIMPLE_ATTRIBUTE(vcpu_stat_fops, vcpu_stat_get, vcpu_stat_clear,
-=09=09=09"%llu\n");
-
-static const struct file_operations *stat_fops[] =3D {
-=09[KVM_STAT_VCPU] =3D &vcpu_stat_fops,
-=09[KVM_STAT_VM]   =3D &vm_stat_fops,
-};
-
 static void kvm_uevent_notify_change(unsigned int type, struct kvm *kvm)
 {
 =09struct kobj_uevent_env *env;
@@ -4537,34 +4304,32 @@ static void kvm_uevent_notify_change(unsigned int t=
ype, struct kvm *kvm)
 =09}
 =09add_uevent_var(env, "PID=3D%d", kvm->userspace_pid);
=20
-=09if (!IS_ERR_OR_NULL(kvm->debugfs_dentry)) {
+=09if (!IS_ERR_OR_NULL(kvm->stats_fs_src->source_dentry)) {
 =09=09char *tmp, *p =3D kmalloc(PATH_MAX, GFP_KERNEL_ACCOUNT);
=20
 =09=09if (p) {
-=09=09=09tmp =3D dentry_path_raw(kvm->debugfs_dentry, p, PATH_MAX);
+=09=09=09tmp =3D dentry_path_raw(kvm->stats_fs_src->source_dentry, p, PATH=
_MAX);
 =09=09=09if (!IS_ERR(tmp))
 =09=09=09=09add_uevent_var(env, "STATS_PATH=3D%s", tmp);
 =09=09=09kfree(p);
 =09=09}
 =09}
+
 =09/* no need for checks, since we are adding at most only 5 keys */
 =09env->envp[env->envp_idx++] =3D NULL;
 =09kobject_uevent_env(&kvm_dev.this_device->kobj, KOBJ_CHANGE, env->envp);
 =09kfree(env);
 }
=20
-static void kvm_init_debug(void)
+static void kvm_init_stats_fs(void)
 {
-=09struct kvm_stats_debugfs_item *p;
+=09kvm_stats_fs_dir =3D stats_fs_source_create("kvm");
+=09/* symlink to debugfs */
+=09debugfs_create_symlink("kvm", NULL, "/sys/kernel/stats_fs/kvm");
+=09stats_fs_source_register(kvm_stats_fs_dir);
=20
-=09kvm_debugfs_dir =3D debugfs_create_dir("kvm", NULL);
-
-=09kvm_debugfs_num_entries =3D 0;
-=09for (p =3D debugfs_entries; p->name; ++p, kvm_debugfs_num_entries++) {
-=09=09debugfs_create_file(p->name, KVM_DBGFS_GET_MODE(p),
-=09=09=09=09    kvm_debugfs_dir, (void *)(long)p->offset,
-=09=09=09=09    stat_fops[p->kind]);
-=09}
+=09stats_fs_source_add_values(kvm_stats_fs_dir, stats_fs_vcpu_entries, NUL=
L);
+=09stats_fs_source_add_values(kvm_stats_fs_dir, stats_fs_vm_entries, NULL)=
;
 }
=20
 static int kvm_suspend(void)
@@ -4738,7 +4503,7 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsign=
ed vcpu_align,
 =09kvm_preempt_ops.sched_in =3D kvm_sched_in;
 =09kvm_preempt_ops.sched_out =3D kvm_sched_out;
=20
-=09kvm_init_debug();
+=09kvm_init_stats_fs();
=20
 =09r =3D kvm_vfio_ops_init();
 =09WARN_ON(r);
@@ -4767,7 +4532,8 @@ EXPORT_SYMBOL_GPL(kvm_init);
=20
 void kvm_exit(void)
 {
-=09debugfs_remove_recursive(kvm_debugfs_dir);
+=09stats_fs_source_revoke(kvm_stats_fs_dir);
+=09stats_fs_source_put(kvm_stats_fs_dir);
 =09misc_deregister(&kvm_dev);
 =09kmem_cache_destroy(kvm_vcpu_cache);
 =09kvm_async_pf_deinit();
--=20
2.25.2

