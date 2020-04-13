Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1E61A6E84
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 23:40:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 491MVm2yWgzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Apr 2020 07:40:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=eesposit@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=MKKdXREx; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4919Mv3p01zDq9p
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Apr 2020 00:04:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586786638;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tr36Ztz1zaNKdeDfrf7SQyxfeOTbsC/uHO5FgmoVJ30=;
 b=MKKdXRExodyzRzdWFN0V64aNaLXrN9Og35Y+b/olAGteLLoaHMEYaqO1IZyVQWbJj35GMM
 wyZQ1mDOzLOeYFjaOBRRCxsTCuRP8R/MNQW9vFa1+U2dkIZkQmiE2QsguBWsgWVFHA5obk
 sRRVChJvMPzeUe0t/l7tWqCnQGPsVZs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-rJNJjbBWPlyuQjL-01wZwQ-1; Mon, 13 Apr 2020 10:03:55 -0400
X-MC-Unique: rJNJjbBWPlyuQjL-01wZwQ-1
Received: by mail-wr1-f72.google.com with SMTP id r11so5705330wrx.21
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 07:03:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=DMxjnALOO+13jpd4EXyv1/+VreDyJBNjIrO01oQGGFU=;
 b=L25i+NDzhVozpBDHnSfByT9nOB2msKrNzIHzYOR9uXTvMQDzwLOUBAgLOI+gwzHIPJ
 PoOIubXpPD39Aw8wqgzPUth+RMmF0h77tRkZOrg7ng49i1KxgOXw3XE1CVOqrXY9q5YK
 c6iDJZTUz2114pCxFN1ycweogeHAwYo30UBxyLXwuqkz7lgGtoX29dr4V1BgUbftmIiQ
 1S6P9WptamMw/Zx9RAzgjiU15xav2Xp9m7gb6WYBPOAWXTe1kZZdyQoa99HlBbM3i626
 2dZQoeGSc95r8cfz2PRIZ4XAB7hd2fitnu7rFOVFfxxF8xAk5AqBmDunbiSd+BXi38mi
 hmGg==
X-Gm-Message-State: AGi0Puau2qFLOBO9ioO1Cvv5RPGCoOyQUq8if8wmpFx885j+ghqjCVlI
 5ycTzsMHDlCgY+OUXrqSEDLjivYDVPQZLC2xztk730YPLsoRl+4ZWEwFpRYvM3OpPXlrwueEQnW
 XQRly+he5EyVafU+09jbGn7kCHA==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr18660287wrs.265.1586786634645; 
 Mon, 13 Apr 2020 07:03:54 -0700 (PDT)
X-Google-Smtp-Source: APiQypLRZJuELUsSHD7peAwU3uRWTiihVpgUEtD1l8rr9Jo5lHrC+5Swh69bNDnIpYlTippwc8wt9Q==
X-Received: by 2002:adf:fc4c:: with SMTP id e12mr18660255wrs.265.1586786634361; 
 Mon, 13 Apr 2020 07:03:54 -0700 (PDT)
Received: from emanuele-MacBookPro.redhat.com ([194.230.155.239])
 by smtp.gmail.com with ESMTPSA id j10sm11726263wmi.18.2020.04.13.07.03.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2020 07:03:53 -0700 (PDT)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: kvm@vger.kernel.org
Subject: [PATCH] kvm_host: unify VM_STAT and VCPU_STAT definitions in a single
 place
Date: Mon, 13 Apr 2020 16:03:32 +0200
Message-Id: <20200413140332.22896-1-eesposit@redhat.com>
X-Mailer: git-send-email 2.17.1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-Mailman-Approved-At: Tue, 14 Apr 2020 07:39:21 +1000
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
Cc: Wanpeng Li <wanpengli@tencent.com>, David Hildenbrand <david@redhat.com>,
 linux-mips@vger.kernel.org, kvmarm@lists.cs.columbia.edu,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, linux-s390@vger.kernel.org,
 Janosch Frank <frankja@linux.ibm.com>, Marc Zyngier <maz@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Christian Borntraeger <borntraeger@de.ibm.com>,
 Julien Thierry <julien.thierry.kdev@gmail.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, kvm-ppc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Jim Mattson <jmattson@google.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-kernel@vger.kernel.org,
 Sean Christopherson <sean.j.christopherson@intel.com>,
 James Morse <james.morse@arm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vitaly Kuznetsov <vkuznets@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The macros VM_STAT and VCPU_STAT are redundantly implemented in multiple
files, each used by a different architecure to initialize the debugfs
entries for statistics. Since they all have the same purpose, they can be
unified in a single common definition in include/linux/kvm_host.h

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 arch/arm64/kvm/guest.c    | 23 +++++++--------
 arch/mips/kvm/mips.c      | 61 +++++++++++++++++++--------------------
 arch/powerpc/kvm/book3s.c |  3 --
 arch/powerpc/kvm/booke.c  |  3 --
 arch/s390/kvm/kvm-s390.c  |  3 --
 arch/x86/kvm/x86.c        |  3 --
 include/linux/kvm_host.h  |  3 ++
 7 files changed, 43 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
index 23ebe51410f0..3e3aee8b37c0 100644
--- a/arch/arm64/kvm/guest.c
+++ b/arch/arm64/kvm/guest.c
@@ -29,20 +29,17 @@
=20
 #include "trace.h"
=20
-#define VM_STAT(x) { #x, offsetof(struct kvm, stat.x), KVM_STAT_VM }
-#define VCPU_STAT(x) { #x, offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCP=
U }
-
 struct kvm_stats_debugfs_item debugfs_entries[] =3D {
-=09VCPU_STAT(halt_successful_poll),
-=09VCPU_STAT(halt_attempted_poll),
-=09VCPU_STAT(halt_poll_invalid),
-=09VCPU_STAT(halt_wakeup),
-=09VCPU_STAT(hvc_exit_stat),
-=09VCPU_STAT(wfe_exit_stat),
-=09VCPU_STAT(wfi_exit_stat),
-=09VCPU_STAT(mmio_exit_user),
-=09VCPU_STAT(mmio_exit_kernel),
-=09VCPU_STAT(exits),
+=09{ "halt_successful_poll", VCPU_STAT(halt_successful_poll) },
+=09{ "halt_attempted_poll", VCPU_STAT(halt_attempted_poll) },
+=09{ "halt_poll_invalid", VCPU_STAT(halt_poll_invalid) },
+=09{ "halt_wakeup", VCPU_STAT(halt_wakeup) },
+=09{ "hvc_exit_stat", VCPU_STAT(hvc_exit_stat) },
+=09{ "wfe_exit_stat", VCPU_STAT(wfe_exit_stat) },
+=09{ "wfi_exit_stat", VCPU_STAT(wfi_exit_stat) },
+=09{ "mmio_exit_user", VCPU_STAT(mmio_exit_user) },
+=09{ "mmio_exit_kernel", VCPU_STAT(mmio_exit_kernel) },
+=09{ "exits", VCPU_STAT(exits) },
 =09{ NULL }
 };
=20
diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
index 8f05dd0a0f4e..f14b93d02f02 100644
--- a/arch/mips/kvm/mips.c
+++ b/arch/mips/kvm/mips.c
@@ -39,40 +39,39 @@
 #define VECTORSPACING 0x100=09/* for EI/VI mode */
 #endif
=20
-#define VCPU_STAT(x) offsetof(struct kvm_vcpu, stat.x)
 struct kvm_stats_debugfs_item debugfs_entries[] =3D {
-=09{ "wait",=09  VCPU_STAT(wait_exits),=09 KVM_STAT_VCPU },
-=09{ "cache",=09  VCPU_STAT(cache_exits),=09 KVM_STAT_VCPU },
-=09{ "signal",=09  VCPU_STAT(signal_exits),=09 KVM_STAT_VCPU },
-=09{ "interrupt",=09  VCPU_STAT(int_exits),=09=09 KVM_STAT_VCPU },
-=09{ "cop_unusable", VCPU_STAT(cop_unusable_exits), KVM_STAT_VCPU },
-=09{ "tlbmod",=09  VCPU_STAT(tlbmod_exits),=09 KVM_STAT_VCPU },
-=09{ "tlbmiss_ld",=09  VCPU_STAT(tlbmiss_ld_exits),=09 KVM_STAT_VCPU },
-=09{ "tlbmiss_st",=09  VCPU_STAT(tlbmiss_st_exits),=09 KVM_STAT_VCPU },
-=09{ "addrerr_st",=09  VCPU_STAT(addrerr_st_exits),=09 KVM_STAT_VCPU },
-=09{ "addrerr_ld",=09  VCPU_STAT(addrerr_ld_exits),=09 KVM_STAT_VCPU },
-=09{ "syscall",=09  VCPU_STAT(syscall_exits),=09 KVM_STAT_VCPU },
-=09{ "resvd_inst",=09  VCPU_STAT(resvd_inst_exits),=09 KVM_STAT_VCPU },
-=09{ "break_inst",=09  VCPU_STAT(break_inst_exits),=09 KVM_STAT_VCPU },
-=09{ "trap_inst",=09  VCPU_STAT(trap_inst_exits),=09 KVM_STAT_VCPU },
-=09{ "msa_fpe",=09  VCPU_STAT(msa_fpe_exits),=09 KVM_STAT_VCPU },
-=09{ "fpe",=09  VCPU_STAT(fpe_exits),=09=09 KVM_STAT_VCPU },
-=09{ "msa_disabled", VCPU_STAT(msa_disabled_exits), KVM_STAT_VCPU },
-=09{ "flush_dcache", VCPU_STAT(flush_dcache_exits), KVM_STAT_VCPU },
+=09{ "wait",=09  VCPU_STAT(wait_exits) },
+=09{ "cache",=09  VCPU_STAT(cache_exits) },
+=09{ "signal",=09  VCPU_STAT(signal_exits) },
+=09{ "interrupt",=09  VCPU_STAT(int_exits) },
+=09{ "cop_unusable", VCPU_STAT(cop_unusable_exits) },
+=09{ "tlbmod",=09  VCPU_STAT(tlbmod_exits) },
+=09{ "tlbmiss_ld",=09  VCPU_STAT(tlbmiss_ld_exits) },
+=09{ "tlbmiss_st",=09  VCPU_STAT(tlbmiss_st_exits) },
+=09{ "addrerr_st",=09  VCPU_STAT(addrerr_st_exits) },
+=09{ "addrerr_ld",=09  VCPU_STAT(addrerr_ld_exits) },
+=09{ "syscall",=09  VCPU_STAT(syscall_exits) },
+=09{ "resvd_inst",=09  VCPU_STAT(resvd_inst_exits) },
+=09{ "break_inst",=09  VCPU_STAT(break_inst_exits) },
+=09{ "trap_inst",=09  VCPU_STAT(trap_inst_exits) },
+=09{ "msa_fpe",=09  VCPU_STAT(msa_fpe_exits) },
+=09{ "fpe",=09  VCPU_STAT(fpe_exits) },
+=09{ "msa_disabled", VCPU_STAT(msa_disabled_exits) },
+=09{ "flush_dcache", VCPU_STAT(flush_dcache_exits) },
 #ifdef CONFIG_KVM_MIPS_VZ
-=09{ "vz_gpsi",=09  VCPU_STAT(vz_gpsi_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_gsfc",=09  VCPU_STAT(vz_gsfc_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_hc",=09  VCPU_STAT(vz_hc_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_grr",=09  VCPU_STAT(vz_grr_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_gva",=09  VCPU_STAT(vz_gva_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_ghfc",=09  VCPU_STAT(vz_ghfc_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_gpa",=09  VCPU_STAT(vz_gpa_exits),=09 KVM_STAT_VCPU },
-=09{ "vz_resvd",=09  VCPU_STAT(vz_resvd_exits),=09 KVM_STAT_VCPU },
+=09{ "vz_gpsi",=09  VCPU_STAT(vz_gpsi_exits) },
+=09{ "vz_gsfc",=09  VCPU_STAT(vz_gsfc_exits) },
+=09{ "vz_hc",=09  VCPU_STAT(vz_hc_exits) },
+=09{ "vz_grr",=09  VCPU_STAT(vz_grr_exits) },
+=09{ "vz_gva",=09  VCPU_STAT(vz_gva_exits) },
+=09{ "vz_ghfc",=09  VCPU_STAT(vz_ghfc_exits) },
+=09{ "vz_gpa",=09  VCPU_STAT(vz_gpa_exits) },
+=09{ "vz_resvd",=09  VCPU_STAT(vz_resvd_exits) },
 #endif
-=09{ "halt_successful_poll", VCPU_STAT(halt_successful_poll), KVM_STAT_VCP=
U },
-=09{ "halt_attempted_poll", VCPU_STAT(halt_attempted_poll), KVM_STAT_VCPU =
},
-=09{ "halt_poll_invalid", VCPU_STAT(halt_poll_invalid), KVM_STAT_VCPU },
-=09{ "halt_wakeup",  VCPU_STAT(halt_wakeup),=09 KVM_STAT_VCPU },
+=09{ "halt_successful_poll", VCPU_STAT(halt_successful_poll) },
+=09{ "halt_attempted_poll", VCPU_STAT(halt_attempted_poll) },
+=09{ "halt_poll_invalid", VCPU_STAT(halt_poll_invalid) },
+=09{ "halt_wakeup",  VCPU_STAT(halt_wakeup) },
 =09{NULL}
 };
=20
diff --git a/arch/powerpc/kvm/book3s.c b/arch/powerpc/kvm/book3s.c
index 5690a1f9b976..55cb728ba06e 100644
--- a/arch/powerpc/kvm/book3s.c
+++ b/arch/powerpc/kvm/book3s.c
@@ -36,9 +36,6 @@
 #include "book3s.h"
 #include "trace.h"
=20
-#define VM_STAT(x, ...) offsetof(struct kvm, stat.x), KVM_STAT_VM, ## __VA=
_ARGS__
-#define VCPU_STAT(x, ...) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCPU=
, ## __VA_ARGS__
-
 /* #define EXIT_DEBUG */
=20
 struct kvm_stats_debugfs_item debugfs_entries[] =3D {
diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
index 6c18ea88fd25..fb8fa7060804 100644
--- a/arch/powerpc/kvm/booke.c
+++ b/arch/powerpc/kvm/booke.c
@@ -35,9 +35,6 @@
=20
 unsigned long kvmppc_booke_handlers;
=20
-#define VM_STAT(x) offsetof(struct kvm, stat.x), KVM_STAT_VM
-#define VCPU_STAT(x) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCPU
-
 struct kvm_stats_debugfs_item debugfs_entries[] =3D {
 =09{ "mmio",       VCPU_STAT(mmio_exits) },
 =09{ "sig",        VCPU_STAT(signal_exits) },
diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
index 19a81024fe16..1a7bf8759750 100644
--- a/arch/s390/kvm/kvm-s390.c
+++ b/arch/s390/kvm/kvm-s390.c
@@ -57,9 +57,6 @@
 #define VCPU_IRQS_MAX_BUF (sizeof(struct kvm_s390_irq) * \
 =09=09=09   (KVM_MAX_VCPUS + LOCAL_IRQS))
=20
-#define VCPU_STAT(x) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCPU
-#define VM_STAT(x) offsetof(struct kvm, stat.x), KVM_STAT_VM
-
 struct kvm_stats_debugfs_item debugfs_entries[] =3D {
 =09{ "userspace_handled", VCPU_STAT(exit_userspace) },
 =09{ "exit_null", VCPU_STAT(exit_null) },
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index b8124b562dea..fb035d304004 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -97,9 +97,6 @@ static u64 __read_mostly efer_reserved_bits =3D ~((u64)EF=
ER_SCE);
=20
 static u64 __read_mostly cr4_reserved_bits =3D CR4_RESERVED_BITS;
=20
-#define VM_STAT(x, ...) offsetof(struct kvm, stat.x), KVM_STAT_VM, ## __VA=
_ARGS__
-#define VCPU_STAT(x, ...) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCPU=
, ## __VA_ARGS__
-
 #define KVM_X2APIC_API_VALID_FLAGS (KVM_X2APIC_API_USE_32BIT_IDS | \
                                     KVM_X2APIC_API_DISABLE_BROADCAST_QUIRK=
)
=20
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 6d58beb65454..e02d38c7fff1 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -1130,6 +1130,9 @@ struct kvm_stats_debugfs_item {
 #define KVM_DBGFS_GET_MODE(dbgfs_item)                                    =
     \
 =09((dbgfs_item)->mode ? (dbgfs_item)->mode : 0644)
=20
+#define VM_STAT(x, ...) offsetof(struct kvm, stat.x), KVM_STAT_VM, ## __VA=
_ARGS__
+#define VCPU_STAT(x, ...) offsetof(struct kvm_vcpu, stat.x), KVM_STAT_VCPU=
, ## __VA_ARGS__
+
 extern struct kvm_stats_debugfs_item debugfs_entries[];
 extern struct dentry *kvm_debugfs_dir;
=20
--=20
2.17.1

