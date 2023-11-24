Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E34F7F69BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 01:22:01 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=rgyTx3L8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sbwdz1VHsz3ddL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Nov 2023 11:21:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=canonical.com header.i=@canonical.com header.a=rsa-sha256 header.s=20210705 header.b=rgyTx3L8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=canonical.com (client-ip=185.125.188.123; helo=smtp-relay-internal-1.canonical.com; envelope-from=dimitri.ledkov@canonical.com; receiver=lists.ozlabs.org)
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sbwd31yWrz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 11:21:09 +1100 (AEDT)
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com [209.85.221.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id A965C3F18D
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Nov 2023 00:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1700785264;
	bh=UhoHIyhhwl4sHG01/ZhjDRgn+wI1Do7c9E/cI3DypWA=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=rgyTx3L8h7SCUDYI81nrRpJf4vcLeXR3+lX2j66ULYhUDZzoKi0Nb5KcuRlOruATE
	 NqCcggkdcLsSvJBE3wulSVnVGO1xAuJa8ie1pZD3PXaOz6xxm9Oe68z5Jkbb1QPmJy
	 JzA3wX8P5ite02wfbfPiE8ZuSL02bHPVHnOfVuXVGDjcQW+5253few1nLKXwaMp2Hw
	 5I1d1VBJ9dxv3ZmF9sYJvk524oQehSR+i1PFLfcC2jLt4F4gRlOaVmt6nSR0h8JK1n
	 jW87qV7i2a2ErOgm9X5J5lJvnb2ETJScppwFfolRqH8Q6TQhvXTi4sYBb73jgSY05m
	 Vrga7KvoyPc4w==
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-332c9c2df90so686384f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Nov 2023 16:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700785263; x=1701390063;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UhoHIyhhwl4sHG01/ZhjDRgn+wI1Do7c9E/cI3DypWA=;
        b=QbtAvuAVuAGqhZ4u6xbY1iDHPSebaKa4TECUIJ2MUNHM9ed1Ur90NTZ5SzU3k3VVCk
         Hg2F3Fto7uAElu2h+nsU6pkHnuxxw1XSUZ3a/B/hWRsNXQpv5qMV3wwxgwxzehP5BMbg
         829c5UkIAGp4PQLhxBCYr1SYh7eeEOzlGsfHtcTwKRMgiCaKpx+wcc+MyFsGJohdr2sK
         GR9IG7uepW9b5KT/lsODFzIC4lNfKChUBc2wnl461dx/hsfdHKZ8apmiYpWreBrntSr1
         96HPf4l1TYrd4irpSqZp5SqhjOjFooe1f+hzOhEZoEi1NsQ0GaIapOJTl00dDUbjyLPI
         eevQ==
X-Gm-Message-State: AOJu0YxLnsVGy3eyYrSTh3ox34hMaMyLz8QzXFspsFniquOLk/T4l/on
	P1F5kNTrvZsnzBWw27C0n/YLFIp9hruCZogPAh7sYcwEHHCJZvnVk5Mo/RMgaCFf9VNhsezWe7v
	pwPtRRFaIzaY9NIqPoJfUIPaZ2wrh0Ec9iE25deCIVweU6G3Z508=
X-Received: by 2002:a5d:5005:0:b0:332:cea3:ac7d with SMTP id e5-20020a5d5005000000b00332cea3ac7dmr722199wrt.2.1700785263531;
        Thu, 23 Nov 2023 16:21:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEbrFMlQrEpY/Le51NbQhZL+A+zJxZDJpeMYd6m456jLxhVln2Ezt5lmIzPAcmHn0ojZ/Z8ag==
X-Received: by 2002:a5d:5005:0:b0:332:cea3:ac7d with SMTP id e5-20020a5d5005000000b00332cea3ac7dmr722184wrt.2.1700785262965;
        Thu, 23 Nov 2023 16:21:02 -0800 (PST)
Received: from localhost ([2001:67c:1560:8007::aac:c15c])
        by smtp.gmail.com with ESMTPSA id o14-20020a5d4a8e000000b00332e073f12bsm2859294wrq.19.2023.11.23.16.21.02
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Nov 2023 16:21:02 -0800 (PST)
From: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC] UBUNTU: [Config] y2038: Disable COMPAT and COMPAT_32BIT_TIME on ppc64le
Date: Fri, 24 Nov 2023 00:20:42 +0000
Message-Id: <20231124002042.1741578-1-dimitri.ledkov@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

BugLink: https://bugs.launchpad.net/bugs/2038587

ppc64le is exclusively little endian and 64-bit, thus there is no need
for COMPAT_32BIT_TIME, nor COMPAT.

diffconfig result of these changes is:

 -ARCH_MMAP_RND_COMPAT_BITS 13
 -ARCH_WANT_COMPAT_IPC_PARSE_VERSION y
 -ARCH_WANT_OLD_COMPAT_IPC y
 -COMPAT_BINFMT_ELF y
 -COMPAT_NETLINK_MESSAGES y
 -COMPAT_OLD_SIGACTION y
 -HAVE_ARCH_MMAP_RND_COMPAT_BITS y
 -KVM_COMPAT y
 -NETFILTER_XTABLES_COMPAT y
 -SYSVIPC_COMPAT y
 -VDSO32 y
  COMPAT y -> n
  COMPAT_32BIT_TIME y -> n
 +ARCH_HAS_SYSCALL_WRAPPER y
 +INTERRUPT_SANITIZE_REGISTERS y

What confused me, if the above combination is even valid or just pure
dead code.

Is it really possible to run 32bit big-endian KVM on a 64bit
little-endian POWER?

Or is Kconfig slightly buggy and should be fixed up to prevent
offering COMPAT options when little-endian 64bit POWER kernel is being
configured?

Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@canonical.com>
---
 debian.master/config/annotations | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/debian.master/config/annotations b/debian.master/config/annotations
index 2fc37c961d..e96eeee2e5 100644
--- a/debian.master/config/annotations
+++ b/debian.master/config/annotations
@@ -15,7 +15,7 @@ CONFIG_AGP                                      note<'not autoloadable'>
 CONFIG_ARCH_MMAP_RND_BITS                       policy<{'amd64': '32', 'arm64': '33', 'arm64-generic-64k': '29', 'armhf': '16', 'ppc64el': '29', 'riscv64': '24'}>
 CONFIG_ARCH_MMAP_RND_BITS                       note<'LP: #1983357'>
 
-CONFIG_ARCH_MMAP_RND_COMPAT_BITS                policy<{'amd64': '16', 'arm64': '16', 'ppc64el': '13', 'riscv64': '-'}>
+CONFIG_ARCH_MMAP_RND_COMPAT_BITS                policy<{'amd64': '16', 'arm64': '16', 'ppc64el': '-', 'riscv64': '-'}>
 CONFIG_ARCH_MMAP_RND_COMPAT_BITS                note<'LP: #1983357'>
 
 CONFIG_ARCH_ROCKCHIP                            policy<{'arm64': 'y', 'armhf': 'y'}>
@@ -1230,7 +1230,7 @@ CONFIG_ARCH_HAS_SUBPAGE_FAULTS                  policy<{'arm64': 'y'}>
 CONFIG_ARCH_HAS_SYNC_CORE_BEFORE_USERMODE       policy<{'amd64': 'y'}>
 CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU                policy<{'arm64': 'y', 'armhf': 'y', 'riscv64': 'y'}>
 CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE             policy<{'arm64': 'y', 'armhf': 'y', 'riscv64': 'y'}>
-CONFIG_ARCH_HAS_SYSCALL_WRAPPER                 policy<{'amd64': 'y', 'arm64': 'y', 'riscv64': 'y', 's390x': 'y'}>
+CONFIG_ARCH_HAS_SYSCALL_WRAPPER                 policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_ARCH_HAS_TEARDOWN_DMA_OPS                policy<{'arm64': 'y', 'armhf': 'y'}>
 CONFIG_ARCH_HAS_TICK_BROADCAST                  policy<{'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y'}>
 CONFIG_ARCH_HAS_UACCESS_FLUSHCACHE              policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y'}>
@@ -1463,7 +1463,7 @@ CONFIG_ARCH_WANTS_DYNAMIC_TASK_STRUCT           policy<{'amd64': 'y', 's390x': '
 CONFIG_ARCH_WANTS_NO_INSTR                      policy<{'amd64': 'y', 'arm64': 'y', 's390x': 'y'}>
 CONFIG_ARCH_WANTS_THP_SWAP                      policy<{'amd64': 'y', 'arm64': 'y', 'arm64-generic-64k': '-', 'riscv64': 'y'}>
 CONFIG_ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH        policy<{'amd64': 'y', 'arm64': 'y'}>
-CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION       policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 's390x': 'y'}>
+CONFIG_ARCH_WANT_COMPAT_IPC_PARSE_VERSION       policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-', 's390x': 'y'}>
 CONFIG_ARCH_WANT_DEFAULT_BPF_JIT                policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 's390x': 'y'}>
 CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT    policy<{'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y'}>
 CONFIG_ARCH_WANT_FLAT_DTB_INSTALL               policy<{'armhf': 'y'}>
@@ -1474,7 +1474,7 @@ CONFIG_ARCH_WANT_IPC_PARSE_VERSION              policy<{'armhf': 'y', 'ppc64el':
 CONFIG_ARCH_WANT_IRQS_OFF_ACTIVATE_MM           policy<{'ppc64el': 'y'}>
 CONFIG_ARCH_WANT_KERNEL_PMD_MKWRITE             policy<{'s390x': 'y'}>
 CONFIG_ARCH_WANT_LD_ORPHAN_WARN                 policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y'}>
-CONFIG_ARCH_WANT_OLD_COMPAT_IPC                 policy<{'amd64': 'y', 'ppc64el': 'y', 's390x': 'y'}>
+CONFIG_ARCH_WANT_OLD_COMPAT_IPC                 policy<{'amd64': 'y', 'ppc64el': '-', 's390x': 'y'}>
 CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP           policy<{'amd64': 'y', 'ppc64el': 'y'}>
 CONFIG_ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP       policy<{'amd64': 'y', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_ARCH_WANT_PMD_MKWRITE                    policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
@@ -3145,14 +3145,14 @@ CONFIG_COMMON_RESET_HI6220                      policy<{'arm64': 'm', 'armhf': '
 CONFIG_COMPACTION                               policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_COMPACT_UNEVICTABLE_DEFAULT              policy<{'amd64': '1', 'arm64': '1', 'armhf': '1', 'ppc64el': '1', 'riscv64': '1', 's390x': '1'}>
 CONFIG_COMPAL_LAPTOP                            policy<{'amd64': 'm'}>
-CONFIG_COMPAT                                   policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 'riscv64': 'n', 's390x': 'y'}>
+CONFIG_COMPAT                                   policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'n', 'riscv64': 'n', 's390x': 'y'}>
 CONFIG_COMPAT_32                                policy<{'amd64': 'y'}>
-CONFIG_COMPAT_32BIT_TIME                        policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
+CONFIG_COMPAT_32BIT_TIME                        policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'n', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_COMPAT_ALIGNMENT_FIXUPS                  policy<{'arm64': 'n'}>
-CONFIG_COMPAT_BINFMT_ELF                        policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 's390x': 'y'}>
+CONFIG_COMPAT_BINFMT_ELF                        policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-', 's390x': 'y'}>
 CONFIG_COMPAT_FOR_U64_ALIGNMENT                 policy<{'amd64': 'y'}>
-CONFIG_COMPAT_NETLINK_MESSAGES                  policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y'}>
-CONFIG_COMPAT_OLD_SIGACTION                     policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 's390x': 'y'}>
+CONFIG_COMPAT_NETLINK_MESSAGES                  policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-'}>
+CONFIG_COMPAT_OLD_SIGACTION                     policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-', 's390x': 'y'}>
 CONFIG_COMPAT_VDSO                              policy<{'amd64': 'n'}>
 CONFIG_COMPILE_TEST                             policy<{'amd64': 'n', 'arm64': 'n', 'armhf': 'n', 'ppc64el': 'n', 'riscv64': 'n', 's390x': 'n'}>
 CONFIG_CONFIGFS_FS                              policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
@@ -5473,7 +5473,7 @@ CONFIG_HAVE_ARCH_KGDB                           policy<{'amd64': 'y', 'arm64': '
 CONFIG_HAVE_ARCH_KGDB_QXFER_PKT                 policy<{'riscv64': 'y'}>
 CONFIG_HAVE_ARCH_KMSAN                          policy<{'amd64': 'y'}>
 CONFIG_HAVE_ARCH_MMAP_RND_BITS                  policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y'}>
-CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS           policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y'}>
+CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS           policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-'}>
 CONFIG_HAVE_ARCH_NODE_DEV_GROUP                 policy<{'amd64': 'y'}>
 CONFIG_HAVE_ARCH_NVRAM_OPS                      policy<{'ppc64el': 'y'}>
 CONFIG_HAVE_ARCH_PFN_VALID                      policy<{'armhf': 'y'}>
@@ -6600,6 +6600,7 @@ CONFIG_INTERCONNECT_QCOM_SM8550                 policy<{'arm64': 'm', 'armhf': '
 CONFIG_INTERCONNECT_QCOM_SMD_RPM                policy<{'arm64': 'm', 'armhf': 'm'}>
 CONFIG_INTERCONNECT_SAMSUNG                     policy<{'armhf': 'n'}>
 CONFIG_INTERRUPT_CNT                            policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm'}>
+CONFIG_INTERRUPT_SANITIZE_REGISTERS             policy<{'ppc64el': 'y'}>
 CONFIG_INTERVAL_TREE                            policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_INTERVAL_TREE_SPAN_ITER                  policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y'}>
 CONFIG_INTERVAL_TREE_TEST                       policy<{'amd64': 'n', 'arm64': 'n', 'armhf': 'n', 'ppc64el': 'n', 'riscv64': 'n', 's390x': 'n'}>
@@ -7121,7 +7122,7 @@ CONFIG_KVM_BOOK3S_HV_NESTED_PMU_WORKAROUND      policy<{'ppc64el': 'y'}>
 CONFIG_KVM_BOOK3S_HV_P9_TIMING                  policy<{'ppc64el': 'y'}>
 CONFIG_KVM_BOOK3S_HV_POSSIBLE                   policy<{'ppc64el': 'y'}>
 CONFIG_KVM_BOOK3S_PR_POSSIBLE                   policy<{'ppc64el': 'y'}>
-CONFIG_KVM_COMPAT                               policy<{'amd64': 'y', 'ppc64el': 'y'}>
+CONFIG_KVM_COMPAT                               policy<{'amd64': 'y', 'ppc64el': '-'}>
 CONFIG_KVM_EXTERNAL_WRITE_TRACKING              policy<{'amd64': 'y'}>
 CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT        policy<{'amd64': 'y', 'arm64': 'y', 'riscv64': 'y'}>
 CONFIG_KVM_GENERIC_HARDWARE_ENABLING            policy<{'amd64': 'y', 'arm64': 'y', 'riscv64': 'y'}>
@@ -8475,7 +8476,7 @@ CONFIG_NETFILTER_NETLINK_QUEUE                  policy<{'amd64': 'm', 'arm64': '
 CONFIG_NETFILTER_SKIP_EGRESS                    policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_NETFILTER_SYNPROXY                       policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm', 's390x': 'm'}>
 CONFIG_NETFILTER_XTABLES                        policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm', 's390x': 'm'}>
-CONFIG_NETFILTER_XTABLES_COMPAT                 policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 'riscv64': '-', 's390x': 'y'}>
+CONFIG_NETFILTER_XTABLES_COMPAT                 policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-', 'riscv64': '-', 's390x': 'y'}>
 CONFIG_NETFILTER_XT_CONNMARK                    policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm', 's390x': 'm'}>
 CONFIG_NETFILTER_XT_MARK                        policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm', 's390x': 'm'}>
 CONFIG_NETFILTER_XT_MATCH_ADDRTYPE              policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm', 's390x': 'm'}>
@@ -13422,7 +13423,7 @@ CONFIG_SYSTEM_TRUSTED_KEYRING                   policy<{'amd64': 'y', 'arm64': '
 CONFIG_SYSTEM_TRUSTED_KEYS                      policy<{'amd64': '"debian/canonical-certs.pem"', 'arm64': '"debian/canonical-certs.pem"', 'armhf': '"debian/canonical-certs.pem"', 'ppc64el': '"debian/canonical-certs.pem"', 'riscv64': '"debian/canonical-certs.pem"', 's390x': '"debian/canonical-certs.pem"'}>
 CONFIG_SYSV68_PARTITION                         policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'n'}>
 CONFIG_SYSVIPC                                  policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
-CONFIG_SYSVIPC_COMPAT                           policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': 'y', 's390x': 'y'}>
+CONFIG_SYSVIPC_COMPAT                           policy<{'amd64': 'y', 'arm64': 'y', 'ppc64el': '-', 's390x': 'y'}>
 CONFIG_SYSVIPC_SYSCTL                           policy<{'amd64': 'y', 'arm64': 'y', 'armhf': 'y', 'ppc64el': 'y', 'riscv64': 'y', 's390x': 'y'}>
 CONFIG_SYSV_FS                                  policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm', 's390x': 'n'}>
 CONFIG_SYS_HYPERVISOR                           policy<{'amd64': 'y', 'arm64': 'y', 's390x': 'y'}>
@@ -14550,7 +14551,6 @@ CONFIG_VDPA_SIM_BLOCK                           policy<{'amd64': 'm', 'arm64': '
 CONFIG_VDPA_SIM_NET                             policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm'}>
 CONFIG_VDPA_USER                                policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm'}>
 CONFIG_VDSO                                     policy<{'armhf': 'y'}>
-CONFIG_VDSO32                                   policy<{'ppc64el': 'y'}>
 CONFIG_VEML6030                                 policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm'}>
 CONFIG_VEML6070                                 policy<{'amd64': 'm', 'arm64': 'm', 'armhf': 'm', 'ppc64el': 'm', 'riscv64': 'm'}>
 CONFIG_VERSION_SIGNATURE                        policy<{'amd64': '""', 'arm64': '""', 'armhf': '""', 'ppc64el': '""', 'riscv64': '""', 's390x': '""'}>
-- 
2.34.1

