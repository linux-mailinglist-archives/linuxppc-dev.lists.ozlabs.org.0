Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 546193A9561
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 10:52:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G4f7l4b9zz307n
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Jun 2021 18:52:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f6ble5QM;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f6ble5QM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=omosnace@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=f6ble5QM; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=f6ble5QM; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G4f7B1BWMz2ymZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 18:51:30 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623833484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AB6ZxFwEiVQfqIPhGFFnK7ltxA1SeNPzuaBqLy4Pvrs=;
 b=f6ble5QMDQsFpukCEFgaqi1L+2gHySBK+W3ZvCUoAgpTpM0gRfTtwRH8vblEc4d3SXd+Uk
 2imxCUJFgV4uEQU0UcC6YHbRO6iEP3d1gsbo76u2vyVeOXdJMphv1VeW3MSEGtyK+GRfie
 tFEBP2tNDUjqgjClMlyY9/MtGBuFy04=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623833484;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AB6ZxFwEiVQfqIPhGFFnK7ltxA1SeNPzuaBqLy4Pvrs=;
 b=f6ble5QMDQsFpukCEFgaqi1L+2gHySBK+W3ZvCUoAgpTpM0gRfTtwRH8vblEc4d3SXd+Uk
 2imxCUJFgV4uEQU0UcC6YHbRO6iEP3d1gsbo76u2vyVeOXdJMphv1VeW3MSEGtyK+GRfie
 tFEBP2tNDUjqgjClMlyY9/MtGBuFy04=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-413-kczwlciwOumGDQPHVO2upA-1; Wed, 16 Jun 2021 04:51:22 -0400
X-MC-Unique: kczwlciwOumGDQPHVO2upA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q15-20020adfc50f0000b0290111f48b865cso796649wrf.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Jun 2021 01:51:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AB6ZxFwEiVQfqIPhGFFnK7ltxA1SeNPzuaBqLy4Pvrs=;
 b=aV9D6Y0eq3qChgAv6YHb67Aqi9/l23M1zb62fTHbx5F2YCGzPjCspFvNb8v4MFuxP9
 F73h4sre/roJRYAl7KrnKcpCpDOQb4ta1bQ8Viu1QQb07YpNRHdIGqZx/mS0Dtp3NP6I
 tSBL/WI7nda4Y+sC1+g4UBjUPTlyeogHnhXgoqhYlIsaikk+eeLQnzzArXoMno00XEYK
 2IB3INO+8V6Oc39fe30gzgbCyDD2CEqgrOf5Ace+3AEZgpSY3xPC7fHqT4wf7OzNM268
 eAwUpnws2Mi4+oWe2sED5q5Affjyz1A09KkPntWcOpusMhREZnP4eRYUFWn/Y/KCkLcR
 Ii5g==
X-Gm-Message-State: AOAM532BK1oNX5CkZTcZ9FxJAlrHMQtxs1eeT8aHmQx9uB+GXFTFER76
 nl47xKpP81Fc87Mt0vBzSWNG5Zl6RQznWcGw8azpHtaCGki6nD3fcCWlWh4ZheDGBrvdd/xvGw5
 DRBDa89oMqXuKFWEkKfR/xN0NrA==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr3839994wrq.324.1623833480529; 
 Wed, 16 Jun 2021 01:51:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwVaB1Yy4TfWOgsKMr2ZOLvRY7RWv51QU5AcWhRc3eaiUX795ClOgBAWniIo9a+rXZCu9EnJA==
X-Received: by 2002:a5d:4610:: with SMTP id t16mr3839956wrq.324.1623833480163; 
 Wed, 16 Jun 2021 01:51:20 -0700 (PDT)
Received: from localhost.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id s1sm4408854wmj.8.2021.06.16.01.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 01:51:19 -0700 (PDT)
From: Ondrej Mosnacek <omosnace@redhat.com>
To: linux-security-module@vger.kernel.org,
	James Morris <jmorris@namei.org>
Subject: [PATCH v3] lockdown,
 selinux: fix wrong subject in some SELinux lockdown checks
Date: Wed, 16 Jun 2021 10:51:18 +0200
Message-Id: <20210616085118.1141101-1-omosnace@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=omosnace@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
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
Cc: linux-efi@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-cxl@vger.kernel.org, Steffen Klassert <steffen.klassert@secunet.com>,
 Paul Moore <paul@paul-moore.com>, x86@kernel.org, linux-acpi@vger.kernel.org,
 Ingo Molnar <mingo@redhat.com>, linux-serial@vger.kernel.org,
 linux-pm@vger.kernel.org, selinux@vger.kernel.org,
 Steven Rostedt <rostedt@goodmis.org>, linux-fsdevel@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, netdev@vger.kernel.org,
 Stephen Smalley <stephen.smalley.work@gmail.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Casey Schaufler <casey@schaufler-ca.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 59438b46471a ("security,lockdown,selinux: implement SELinux
lockdown") added an implementation of the locked_down LSM hook to
SELinux, with the aim to restrict which domains are allowed to perform
operations that would breach lockdown.

However, in several places the security_locked_down() hook is called in
situations where the current task isn't doing any action that would
directly breach lockdown, leading to SELinux checks that are basically
bogus.

To fix this, add an explicit struct cred pointer argument to
security_lockdown() and define NULL as a special value to pass instead
of current_cred() in such situations. LSMs that take the subject
credentials into account can then fall back to some default or ignore
such calls altogether. In the SELinux lockdown hook implementation, use
SECINITSID_KERNEL in case the cred argument is NULL.

Most of the callers are updated to pass current_cred() as the cred
pointer, thus maintaining the same behavior. The following callers are
modified to pass NULL as the cred pointer instead:
1. arch/powerpc/xmon/xmon.c
     Seems to be some interactive debugging facility. It appears that
     the lockdown hook is called from interrupt context here, so it
     should be more appropriate to request a global lockdown decision.
2. fs/tracefs/inode.c:tracefs_create_file()
     Here the call is used to prevent creating new tracefs entries when
     the kernel is locked down. Assumes that locking down is one-way -
     i.e. if the hook returns non-zero once, it will never return zero
     again, thus no point in creating these files. Also, the hook is
     often called by a module's init function when it is loaded by
     userspace, where it doesn't make much sense to do a check against
     the current task's creds, since the task itself doesn't actually
     use the tracing functionality (i.e. doesn't breach lockdown), just
     indirectly makes some new tracepoints available to whoever is
     authorized to use them.
3. net/xfrm/xfrm_user.c:copy_to_user_*()
     Here a cryptographic secret is redacted based on the value returned
     from the hook. There are two possible actions that may lead here:
     a) A netlink message XFRM_MSG_GETSA with NLM_F_DUMP set - here the
        task context is relevant, since the dumped data is sent back to
        the current task.
     b) When adding/deleting/updating an SA via XFRM_MSG_xxxSA, the
        dumped SA is broadcasted to tasks subscribed to XFRM events -
        here the current task context is not relevant as it doesn't
        represent the tasks that could potentially see the secret.
     It doesn't seem worth it to try to keep using the current task's
     context in the a) case, since the eventual data leak can be
     circumvented anyway via b), plus there is no way for the task to
     indicate that it doesn't care about the actual key value, so the
     check could generate a lot of "false alert" denials with SELinux.
     Thus, let's pass NULL instead of current_cred() here faute de
     mieux.

Improvements-suggested-by: Casey Schaufler <casey@schaufler-ca.com>
Improvements-suggested-by: Paul Moore <paul@paul-moore.com>
Fixes: 59438b46471a ("security,lockdown,selinux: implement SELinux lockdown")
Signed-off-by: Ondrej Mosnacek <omosnace@redhat.com>
---

v3:
- add the cred argument to security_locked_down() and adapt all callers
- keep using current_cred() in BPF, as the hook calls have been shifted
  to program load time (commit ff40e51043af ("bpf, lockdown, audit: Fix
  buggy SELinux lockdown permission checks"))
- in SELinux, don't ignore hook calls where cred == NULL, but use
  SECINITSID_KERNEL as the subject instead
- update explanations in the commit message

v2: https://lore.kernel.org/lkml/20210517092006.803332-1-omosnace@redhat.com/
- change to a single hook based on suggestions by Casey Schaufler

v1: https://lore.kernel.org/lkml/20210507114048.138933-1-omosnace@redhat.com/

 arch/powerpc/xmon/xmon.c             |  4 ++--
 arch/x86/kernel/ioport.c             |  4 ++--
 arch/x86/kernel/msr.c                |  4 ++--
 arch/x86/mm/testmmiotrace.c          |  2 +-
 drivers/acpi/acpi_configfs.c         |  2 +-
 drivers/acpi/custom_method.c         |  2 +-
 drivers/acpi/osl.c                   |  3 ++-
 drivers/acpi/tables.c                |  2 +-
 drivers/char/mem.c                   |  2 +-
 drivers/cxl/mem.c                    |  2 +-
 drivers/firmware/efi/efi.c           |  2 +-
 drivers/firmware/efi/test/efi_test.c |  2 +-
 drivers/pci/pci-sysfs.c              |  6 +++---
 drivers/pci/proc.c                   |  6 +++---
 drivers/pci/syscall.c                |  2 +-
 drivers/pcmcia/cistpl.c              |  2 +-
 drivers/tty/serial/serial_core.c     |  2 +-
 fs/debugfs/file.c                    |  2 +-
 fs/debugfs/inode.c                   |  2 +-
 fs/proc/kcore.c                      |  2 +-
 fs/tracefs/inode.c                   |  2 +-
 include/linux/lsm_hook_defs.h        |  2 +-
 include/linux/lsm_hooks.h            |  1 +
 include/linux/security.h             |  4 ++--
 kernel/bpf/helpers.c                 | 10 ++++++----
 kernel/events/core.c                 |  2 +-
 kernel/kexec.c                       |  2 +-
 kernel/kexec_file.c                  |  2 +-
 kernel/module.c                      |  2 +-
 kernel/params.c                      |  2 +-
 kernel/power/hibernate.c             |  3 ++-
 kernel/trace/bpf_trace.c             | 20 ++++++++++++--------
 kernel/trace/ftrace.c                |  4 ++--
 kernel/trace/ring_buffer.c           |  2 +-
 kernel/trace/trace.c                 | 10 +++++-----
 kernel/trace/trace_events.c          |  2 +-
 kernel/trace/trace_events_hist.c     |  4 ++--
 kernel/trace/trace_events_synth.c    |  2 +-
 kernel/trace/trace_events_trigger.c  |  2 +-
 kernel/trace/trace_kprobe.c          |  6 +++---
 kernel/trace/trace_printk.c          |  2 +-
 kernel/trace/trace_stack.c           |  2 +-
 kernel/trace/trace_stat.c            |  2 +-
 kernel/trace/trace_uprobe.c          |  4 ++--
 net/xfrm/xfrm_user.c                 | 11 +++++++++--
 security/lockdown/lockdown.c         |  3 ++-
 security/security.c                  |  4 ++--
 security/selinux/hooks.c             |  7 +++++--
 48 files changed, 97 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index c8173e92f19d..63176798f235 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -299,7 +299,7 @@ static bool xmon_is_locked_down(void)
 	static bool lockdown;
 
 	if (!lockdown) {
-		lockdown = !!security_locked_down(LOCKDOWN_XMON_RW);
+		lockdown = !!security_locked_down(NULL, LOCKDOWN_XMON_RW);
 		if (lockdown) {
 			printf("xmon: Disabled due to kernel lockdown\n");
 			xmon_is_ro = true;
@@ -307,7 +307,7 @@ static bool xmon_is_locked_down(void)
 	}
 
 	if (!xmon_is_ro) {
-		xmon_is_ro = !!security_locked_down(LOCKDOWN_XMON_WR);
+		xmon_is_ro = !!security_locked_down(NULL, LOCKDOWN_XMON_WR);
 		if (xmon_is_ro)
 			printf("xmon: Read-only due to kernel lockdown\n");
 	}
diff --git a/arch/x86/kernel/ioport.c b/arch/x86/kernel/ioport.c
index e2fab3ceb09f..838ba45ecc71 100644
--- a/arch/x86/kernel/ioport.c
+++ b/arch/x86/kernel/ioport.c
@@ -71,7 +71,7 @@ long ksys_ioperm(unsigned long from, unsigned long num, int turn_on)
 	if ((from + num <= from) || (from + num > IO_BITMAP_BITS))
 		return -EINVAL;
 	if (turn_on && (!capable(CAP_SYS_RAWIO) ||
-			security_locked_down(LOCKDOWN_IOPORT)))
+			security_locked_down(current_cred(), LOCKDOWN_IOPORT)))
 		return -EPERM;
 
 	/*
@@ -187,7 +187,7 @@ SYSCALL_DEFINE1(iopl, unsigned int, level)
 	/* Trying to gain more privileges? */
 	if (level > old) {
 		if (!capable(CAP_SYS_RAWIO) ||
-		    security_locked_down(LOCKDOWN_IOPORT))
+		    security_locked_down(current_cred(), LOCKDOWN_IOPORT))
 			return -EPERM;
 	}
 
diff --git a/arch/x86/kernel/msr.c b/arch/x86/kernel/msr.c
index ed8ac6bcbafb..6a687d91515b 100644
--- a/arch/x86/kernel/msr.c
+++ b/arch/x86/kernel/msr.c
@@ -116,7 +116,7 @@ static ssize_t msr_write(struct file *file, const char __user *buf,
 	int err = 0;
 	ssize_t bytes = 0;
 
-	err = security_locked_down(LOCKDOWN_MSR);
+	err = security_locked_down(current_cred(), LOCKDOWN_MSR);
 	if (err)
 		return err;
 
@@ -179,7 +179,7 @@ static long msr_ioctl(struct file *file, unsigned int ioc, unsigned long arg)
 			err = -EFAULT;
 			break;
 		}
-		err = security_locked_down(LOCKDOWN_MSR);
+		err = security_locked_down(current_cred(), LOCKDOWN_MSR);
 		if (err)
 			break;
 
diff --git a/arch/x86/mm/testmmiotrace.c b/arch/x86/mm/testmmiotrace.c
index bda73cb7a044..c43a13241ae8 100644
--- a/arch/x86/mm/testmmiotrace.c
+++ b/arch/x86/mm/testmmiotrace.c
@@ -116,7 +116,7 @@ static void do_test_bulk_ioremapping(void)
 static int __init init(void)
 {
 	unsigned long size = (read_far) ? (8 << 20) : (16 << 10);
-	int ret = security_locked_down(LOCKDOWN_MMIOTRACE);
+	int ret = security_locked_down(current_cred(), LOCKDOWN_MMIOTRACE);
 
 	if (ret)
 		return ret;
diff --git a/drivers/acpi/acpi_configfs.c b/drivers/acpi/acpi_configfs.c
index 3a14859dbb75..2221a63d57e1 100644
--- a/drivers/acpi/acpi_configfs.c
+++ b/drivers/acpi/acpi_configfs.c
@@ -29,7 +29,7 @@ static ssize_t acpi_table_aml_write(struct config_item *cfg,
 {
 	const struct acpi_table_header *header = data;
 	struct acpi_table *table;
-	int ret = security_locked_down(LOCKDOWN_ACPI_TABLES);
+	int ret = security_locked_down(current_cred(), LOCKDOWN_ACPI_TABLES);
 
 	if (ret)
 		return ret;
diff --git a/drivers/acpi/custom_method.c b/drivers/acpi/custom_method.c
index d39a9b474727..8cac7f683245 100644
--- a/drivers/acpi/custom_method.c
+++ b/drivers/acpi/custom_method.c
@@ -30,7 +30,7 @@ static ssize_t cm_write(struct file *file, const char __user *user_buf,
 	acpi_status status;
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_ACPI_TABLES);
+	ret = security_locked_down(current_cred(), LOCKDOWN_ACPI_TABLES);
 	if (ret)
 		return ret;
 
diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 327e1b4eb6b0..b55364f50164 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -198,7 +198,8 @@ acpi_physical_address __init acpi_os_get_root_pointer(void)
 	 * specific location (if appropriate) so it can be carried
 	 * over further kexec()s.
 	 */
-	if (acpi_rsdp && !security_locked_down(LOCKDOWN_ACPI_TABLES)) {
+	if (acpi_rsdp && !security_locked_down(current_cred(),
+					       LOCKDOWN_ACPI_TABLES)) {
 		acpi_arch_set_root_pointer(acpi_rsdp);
 		return acpi_rsdp;
 	}
diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 9d581045acff..e9d18d0a69b6 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -568,7 +568,7 @@ void __init acpi_table_upgrade(void)
 	if (table_nr == 0)
 		return;
 
-	if (security_locked_down(LOCKDOWN_ACPI_TABLES)) {
+	if (security_locked_down(current_cred(), LOCKDOWN_ACPI_TABLES)) {
 		pr_notice("kernel is locked down, ignoring table override\n");
 		return;
 	}
diff --git a/drivers/char/mem.c b/drivers/char/mem.c
index 15dc54fa1d47..aa1e6c542e90 100644
--- a/drivers/char/mem.c
+++ b/drivers/char/mem.c
@@ -618,7 +618,7 @@ static int open_port(struct inode *inode, struct file *filp)
 	if (!capable(CAP_SYS_RAWIO))
 		return -EPERM;
 
-	rc = security_locked_down(LOCKDOWN_DEV_MEM);
+	rc = security_locked_down(current_cred(), LOCKDOWN_DEV_MEM);
 	if (rc)
 		return rc;
 
diff --git a/drivers/cxl/mem.c b/drivers/cxl/mem.c
index 2acc6173da36..c1747b6555c7 100644
--- a/drivers/cxl/mem.c
+++ b/drivers/cxl/mem.c
@@ -568,7 +568,7 @@ static bool cxl_mem_raw_command_allowed(u16 opcode)
 	if (!IS_ENABLED(CONFIG_CXL_MEM_RAW_COMMANDS))
 		return false;
 
-	if (security_locked_down(LOCKDOWN_NONE))
+	if (security_locked_down(current_cred(), LOCKDOWN_NONE))
 		return false;
 
 	if (cxl_raw_allow_all)
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index 4b7ee3fa9224..b2121e190ffe 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -200,7 +200,7 @@ static void generic_ops_unregister(void)
 static char efivar_ssdt[EFIVAR_SSDT_NAME_MAX] __initdata;
 static int __init efivar_ssdt_setup(char *str)
 {
-	int ret = security_locked_down(LOCKDOWN_ACPI_TABLES);
+	int ret = security_locked_down(current_cred(), LOCKDOWN_ACPI_TABLES);
 
 	if (ret)
 		return ret;
diff --git a/drivers/firmware/efi/test/efi_test.c b/drivers/firmware/efi/test/efi_test.c
index 47d67bb0a516..942c25843665 100644
--- a/drivers/firmware/efi/test/efi_test.c
+++ b/drivers/firmware/efi/test/efi_test.c
@@ -722,7 +722,7 @@ static long efi_test_ioctl(struct file *file, unsigned int cmd,
 
 static int efi_test_open(struct inode *inode, struct file *file)
 {
-	int ret = security_locked_down(LOCKDOWN_EFI_TEST);
+	int ret = security_locked_down(current_cred(), LOCKDOWN_EFI_TEST);
 
 	if (ret)
 		return ret;
diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index beb8d1f4fafe..7fcfdddfd586 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -753,7 +753,7 @@ static ssize_t pci_write_config(struct file *filp, struct kobject *kobj,
 	u8 *data = (u8 *) buf;
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
@@ -1047,7 +1047,7 @@ static int pci_mmap_resource(struct kobject *kobj, struct bin_attribute *attr,
 	struct resource *res = &pdev->resource[bar];
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
@@ -1128,7 +1128,7 @@ static ssize_t pci_write_resource_io(struct file *filp, struct kobject *kobj,
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
diff --git a/drivers/pci/proc.c b/drivers/pci/proc.c
index 9bab07302bbf..0cc69bba4c4a 100644
--- a/drivers/pci/proc.c
+++ b/drivers/pci/proc.c
@@ -118,7 +118,7 @@ static ssize_t proc_bus_pci_write(struct file *file, const char __user *buf,
 	int size = dev->cfg_size;
 	int cnt, ret;
 
-	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
@@ -201,7 +201,7 @@ static long proc_bus_pci_ioctl(struct file *file, unsigned int cmd,
 #endif /* HAVE_PCI_MMAP */
 	int ret = 0;
 
-	ret = security_locked_down(LOCKDOWN_PCI_ACCESS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS);
 	if (ret)
 		return ret;
 
@@ -248,7 +248,7 @@ static int proc_bus_pci_mmap(struct file *file, struct vm_area_struct *vma)
 	int i, ret, write_combine = 0, res_bit = IORESOURCE_MEM;
 
 	if (!capable(CAP_SYS_RAWIO) ||
-	    security_locked_down(LOCKDOWN_PCI_ACCESS))
+	    security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS))
 		return -EPERM;
 
 	if (fpriv->mmap_state == pci_mmap_io) {
diff --git a/drivers/pci/syscall.c b/drivers/pci/syscall.c
index 8b003c890b87..29da701bcc25 100644
--- a/drivers/pci/syscall.c
+++ b/drivers/pci/syscall.c
@@ -92,7 +92,7 @@ SYSCALL_DEFINE5(pciconfig_write, unsigned long, bus, unsigned long, dfn,
 	int err = 0;
 
 	if (!capable(CAP_SYS_ADMIN) ||
-	    security_locked_down(LOCKDOWN_PCI_ACCESS))
+	    security_locked_down(current_cred(), LOCKDOWN_PCI_ACCESS))
 		return -EPERM;
 
 	dev = pci_get_domain_bus_and_slot(0, bus, dfn);
diff --git a/drivers/pcmcia/cistpl.c b/drivers/pcmcia/cistpl.c
index 948b763dc451..96c96c1cd6da 100644
--- a/drivers/pcmcia/cistpl.c
+++ b/drivers/pcmcia/cistpl.c
@@ -1577,7 +1577,7 @@ static ssize_t pccard_store_cis(struct file *filp, struct kobject *kobj,
 	struct pcmcia_socket *s;
 	int error;
 
-	error = security_locked_down(LOCKDOWN_PCMCIA_CIS);
+	error = security_locked_down(current_cred(), LOCKDOWN_PCMCIA_CIS);
 	if (error)
 		return error;
 
diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
index 18ff85a83f80..23dcfbb9cbdb 100644
--- a/drivers/tty/serial/serial_core.c
+++ b/drivers/tty/serial/serial_core.c
@@ -864,7 +864,7 @@ static int uart_set_info(struct tty_struct *tty, struct tty_port *port,
 	}
 
 	if (change_irq || change_port) {
-		retval = security_locked_down(LOCKDOWN_TIOCSSERIAL);
+		retval = security_locked_down(current_cred(), LOCKDOWN_TIOCSSERIAL);
 		if (retval)
 			goto exit;
 	}
diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index e813acfaa6e8..92b5eda0722e 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -154,7 +154,7 @@ static int debugfs_locked_down(struct inode *inode,
 	    !real_fops->mmap)
 		return 0;
 
-	if (security_locked_down(LOCKDOWN_DEBUGFS))
+	if (security_locked_down(current_cred(), LOCKDOWN_DEBUGFS))
 		return -EPERM;
 
 	return 0;
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 8129a430d789..17f6438cc1b5 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -48,7 +48,7 @@ static int debugfs_setattr(struct user_namespace *mnt_userns,
 	int ret;
 
 	if (ia->ia_valid & (ATTR_MODE | ATTR_UID | ATTR_GID)) {
-		ret = security_locked_down(LOCKDOWN_DEBUGFS);
+		ret = security_locked_down(current_cred(), LOCKDOWN_DEBUGFS);
 		if (ret)
 			return ret;
 	}
diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 4d2e64e9016c..3747ac4097b8 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -545,7 +545,7 @@ out:
 
 static int open_kcore(struct inode *inode, struct file *filp)
 {
-	int ret = security_locked_down(LOCKDOWN_KCORE);
+	int ret = security_locked_down(current_cred(), LOCKDOWN_KCORE);
 
 	if (!capable(CAP_SYS_RAWIO))
 		return -EPERM;
diff --git a/fs/tracefs/inode.c b/fs/tracefs/inode.c
index 1261e8b41edb..9db8dd52d429 100644
--- a/fs/tracefs/inode.c
+++ b/fs/tracefs/inode.c
@@ -396,7 +396,7 @@ struct dentry *tracefs_create_file(const char *name, umode_t mode,
 	struct dentry *dentry;
 	struct inode *inode;
 
-	if (security_locked_down(LOCKDOWN_TRACEFS))
+	if (security_locked_down(NULL, LOCKDOWN_TRACEFS))
 		return NULL;
 
 	if (!(mode & S_IFMT))
diff --git a/include/linux/lsm_hook_defs.h b/include/linux/lsm_hook_defs.h
index 04c01794de83..a763e373ce0d 100644
--- a/include/linux/lsm_hook_defs.h
+++ b/include/linux/lsm_hook_defs.h
@@ -394,7 +394,7 @@ LSM_HOOK(int, 0, bpf_prog_alloc_security, struct bpf_prog_aux *aux)
 LSM_HOOK(void, LSM_RET_VOID, bpf_prog_free_security, struct bpf_prog_aux *aux)
 #endif /* CONFIG_BPF_SYSCALL */
 
-LSM_HOOK(int, 0, locked_down, enum lockdown_reason what)
+LSM_HOOK(int, 0, locked_down, const struct cred *cred, enum lockdown_reason what)
 
 #ifdef CONFIG_PERF_EVENTS
 LSM_HOOK(int, 0, perf_event_open, struct perf_event_attr *attr, int type)
diff --git a/include/linux/lsm_hooks.h b/include/linux/lsm_hooks.h
index 5c4c5c0602cb..8156f2dbaab7 100644
--- a/include/linux/lsm_hooks.h
+++ b/include/linux/lsm_hooks.h
@@ -1543,6 +1543,7 @@
  *     Determine whether a kernel feature that potentially enables arbitrary
  *     code execution in kernel space should be permitted.
  *
+ *     @cred: credential asociated with the operation, or NULL if not applicable
  *     @what: kernel feature being accessed
  *
  * Security hooks for perf events
diff --git a/include/linux/security.h b/include/linux/security.h
index 06f7c50ce77f..ed01b1425ce7 100644
--- a/include/linux/security.h
+++ b/include/linux/security.h
@@ -470,7 +470,7 @@ void security_inode_invalidate_secctx(struct inode *inode);
 int security_inode_notifysecctx(struct inode *inode, void *ctx, u32 ctxlen);
 int security_inode_setsecctx(struct dentry *dentry, void *ctx, u32 ctxlen);
 int security_inode_getsecctx(struct inode *inode, void **ctx, u32 *ctxlen);
-int security_locked_down(enum lockdown_reason what);
+int security_locked_down(const struct cred *cred, enum lockdown_reason what);
 #else /* CONFIG_SECURITY */
 
 static inline int call_blocking_lsm_notifier(enum lsm_event event, void *data)
@@ -1343,7 +1343,7 @@ static inline int security_inode_getsecctx(struct inode *inode, void **ctx, u32
 {
 	return -EOPNOTSUPP;
 }
-static inline int security_locked_down(enum lockdown_reason what)
+static inline int security_locked_down(struct cred *cred, enum lockdown_reason what)
 {
 	return 0;
 }
diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index a2f1f15ce432..69b9b72f1b5f 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -1070,13 +1070,15 @@ bpf_base_func_proto(enum bpf_func_id func_id)
 	case BPF_FUNC_probe_read_user:
 		return &bpf_probe_read_user_proto;
 	case BPF_FUNC_probe_read_kernel:
-		return security_locked_down(LOCKDOWN_BPF_READ) < 0 ?
-		       NULL : &bpf_probe_read_kernel_proto;
+		if (security_locked_down(current_cred(), LOCKDOWN_BPF_READ) < 0)
+			return NULL;
+		return &bpf_probe_read_kernel_proto;
 	case BPF_FUNC_probe_read_user_str:
 		return &bpf_probe_read_user_str_proto;
 	case BPF_FUNC_probe_read_kernel_str:
-		return security_locked_down(LOCKDOWN_BPF_READ) < 0 ?
-		       NULL : &bpf_probe_read_kernel_str_proto;
+		if (security_locked_down(current_cred(), LOCKDOWN_BPF_READ) < 0)
+			return NULL;
+		return &bpf_probe_read_kernel_str_proto;
 	case BPF_FUNC_snprintf_btf:
 		return &bpf_snprintf_btf_proto;
 	case BPF_FUNC_snprintf:
diff --git a/kernel/events/core.c b/kernel/events/core.c
index 6fee4a7e88d7..188c38f470c2 100644
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -11977,7 +11977,7 @@ SYSCALL_DEFINE5(perf_event_open,
 
 	/* REGS_INTR can leak data, lockdown must prevent this */
 	if (attr.sample_type & PERF_SAMPLE_REGS_INTR) {
-		err = security_locked_down(LOCKDOWN_PERF);
+		err = security_locked_down(current_cred(), LOCKDOWN_PERF);
 		if (err)
 			return err;
 	}
diff --git a/kernel/kexec.c b/kernel/kexec.c
index c82c6c06f051..abbed3eeb631 100644
--- a/kernel/kexec.c
+++ b/kernel/kexec.c
@@ -213,7 +213,7 @@ static inline int kexec_load_check(unsigned long nr_segments,
 	 * kexec can be used to circumvent module loading restrictions, so
 	 * prevent loading in that case
 	 */
-	result = security_locked_down(LOCKDOWN_KEXEC);
+	result = security_locked_down(current_cred(), LOCKDOWN_KEXEC);
 	if (result)
 		return result;
 
diff --git a/kernel/kexec_file.c b/kernel/kexec_file.c
index 33400ff051a8..add00b325f4f 100644
--- a/kernel/kexec_file.c
+++ b/kernel/kexec_file.c
@@ -204,7 +204,7 @@ kimage_validate_signature(struct kimage *image)
 		 * down.
 		 */
 		if (!ima_appraise_signature(READING_KEXEC_IMAGE) &&
-		    security_locked_down(LOCKDOWN_KEXEC))
+		    security_locked_down(current_cred(), LOCKDOWN_KEXEC))
 			return -EPERM;
 
 		pr_debug("kernel signature verification failed (%d).\n", ret);
diff --git a/kernel/module.c b/kernel/module.c
index 7e78dfabca97..9351ea9d394b 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -2905,7 +2905,7 @@ static int module_sig_check(struct load_info *info, int flags)
 		return -EKEYREJECTED;
 	}
 
-	return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
+	return security_locked_down(current_cred(), LOCKDOWN_MODULE_SIGNATURE);
 }
 #else /* !CONFIG_MODULE_SIG */
 static int module_sig_check(struct load_info *info, int flags)
diff --git a/kernel/params.c b/kernel/params.c
index 2daa2780a92c..42c8f28f6071 100644
--- a/kernel/params.c
+++ b/kernel/params.c
@@ -100,7 +100,7 @@ bool parameq(const char *a, const char *b)
 static bool param_check_unsafe(const struct kernel_param *kp)
 {
 	if (kp->flags & KERNEL_PARAM_FL_HWPARAM &&
-	    security_locked_down(LOCKDOWN_MODULE_PARAMETERS))
+	    security_locked_down(current_cred(), LOCKDOWN_MODULE_PARAMETERS))
 		return false;
 
 	if (kp->flags & KERNEL_PARAM_FL_UNSAFE) {
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index da0b41914177..a980e587b93a 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -81,7 +81,8 @@ void hibernate_release(void)
 
 bool hibernation_available(void)
 {
-	return nohibernate == 0 && !security_locked_down(LOCKDOWN_HIBERNATION);
+	return nohibernate == 0 &&
+		!security_locked_down(current_cred(), LOCKDOWN_HIBERNATION);
 }
 
 /**
diff --git a/kernel/trace/bpf_trace.c b/kernel/trace/bpf_trace.c
index 7a52bc172841..9b374e077e96 100644
--- a/kernel/trace/bpf_trace.c
+++ b/kernel/trace/bpf_trace.c
@@ -999,20 +999,24 @@ bpf_tracing_func_proto(enum bpf_func_id func_id, const struct bpf_prog *prog)
 	case BPF_FUNC_probe_read_user:
 		return &bpf_probe_read_user_proto;
 	case BPF_FUNC_probe_read_kernel:
-		return security_locked_down(LOCKDOWN_BPF_READ) < 0 ?
-		       NULL : &bpf_probe_read_kernel_proto;
+		if (security_locked_down(current_cred(), LOCKDOWN_BPF_READ) < 0)
+			return NULL;
+		return &bpf_probe_read_kernel_proto;
 	case BPF_FUNC_probe_read_user_str:
 		return &bpf_probe_read_user_str_proto;
 	case BPF_FUNC_probe_read_kernel_str:
-		return security_locked_down(LOCKDOWN_BPF_READ) < 0 ?
-		       NULL : &bpf_probe_read_kernel_str_proto;
+		if (security_locked_down(current_cred(), LOCKDOWN_BPF_READ) < 0)
+			return NULL;
+		return &bpf_probe_read_kernel_str_proto;
 #ifdef CONFIG_ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	case BPF_FUNC_probe_read:
-		return security_locked_down(LOCKDOWN_BPF_READ) < 0 ?
-		       NULL : &bpf_probe_read_compat_proto;
+		if (security_locked_down(current_cred(), LOCKDOWN_BPF_READ) < 0)
+			return NULL;
+		return &bpf_probe_read_compat_proto;
 	case BPF_FUNC_probe_read_str:
-		return security_locked_down(LOCKDOWN_BPF_READ) < 0 ?
-		       NULL : &bpf_probe_read_compat_str_proto;
+		if (security_locked_down(current_cred(), LOCKDOWN_BPF_READ) < 0)
+			return NULL;
+		return &bpf_probe_read_compat_str_proto;
 #endif
 #ifdef CONFIG_CGROUPS
 	case BPF_FUNC_get_current_cgroup_id:
diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
index 2e8a3fde7104..73cae115a523 100644
--- a/kernel/trace/ftrace.c
+++ b/kernel/trace/ftrace.c
@@ -3688,7 +3688,7 @@ ftrace_avail_open(struct inode *inode, struct file *file)
 	struct ftrace_iterator *iter;
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
@@ -5817,7 +5817,7 @@ __ftrace_graph_open(struct inode *inode, struct file *file,
 	int ret;
 	struct ftrace_hash *new_hash = NULL;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/ring_buffer.c b/kernel/trace/ring_buffer.c
index 2c0ee6484990..e9fa3bd389f7 100644
--- a/kernel/trace/ring_buffer.c
+++ b/kernel/trace/ring_buffer.c
@@ -5860,7 +5860,7 @@ static __init int test_ringbuffer(void)
 	int cpu;
 	int ret = 0;
 
-	if (security_locked_down(LOCKDOWN_TRACEFS)) {
+	if (security_locked_down(current_cred(), LOCKDOWN_TRACEFS)) {
 		pr_warn("Lockdown is enabled, skipping ring buffer tests\n");
 		return 0;
 	}
diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index a21ef9cd2aae..8f5915aabae1 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -477,7 +477,7 @@ int tracing_check_open_get_tr(struct trace_array *tr)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
@@ -2063,7 +2063,7 @@ int __init register_tracer(struct tracer *type)
 		return -1;
 	}
 
-	if (security_locked_down(LOCKDOWN_TRACEFS)) {
+	if (security_locked_down(current_cred(), LOCKDOWN_TRACEFS)) {
 		pr_warn("Can not register tracer %s due to lockdown\n",
 			   type->name);
 		return -EPERM;
@@ -9356,7 +9356,7 @@ int tracing_init_dentry(void)
 {
 	struct trace_array *tr = &global_trace;
 
-	if (security_locked_down(LOCKDOWN_TRACEFS)) {
+	if (security_locked_down(current_cred(), LOCKDOWN_TRACEFS)) {
 		pr_warn("Tracing disabled due to lockdown\n");
 		return -EPERM;
 	}
@@ -9818,7 +9818,7 @@ __init static int tracer_alloc_buffers(void)
 	int ret = -ENOMEM;
 
 
-	if (security_locked_down(LOCKDOWN_TRACEFS)) {
+	if (security_locked_down(current_cred(), LOCKDOWN_TRACEFS)) {
 		pr_warn("Tracing disabled due to lockdown\n");
 		return -EPERM;
 	}
@@ -9989,7 +9989,7 @@ __init static int tracing_set_default_clock(void)
 {
 	/* sched_clock_stable() is determined in late_initcall */
 	if (!trace_boot_clock && !sched_clock_stable()) {
-		if (security_locked_down(LOCKDOWN_TRACEFS)) {
+		if (security_locked_down(current_cred(), LOCKDOWN_TRACEFS)) {
 			pr_warn("Can not set tracing clock due to lockdown\n");
 			return -EPERM;
 		}
diff --git a/kernel/trace/trace_events.c b/kernel/trace/trace_events.c
index 80e96989770e..3703afc687f6 100644
--- a/kernel/trace/trace_events.c
+++ b/kernel/trace/trace_events.c
@@ -2129,7 +2129,7 @@ ftrace_event_open(struct inode *inode, struct file *file,
 	struct seq_file *m;
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_events_hist.c b/kernel/trace/trace_events_hist.c
index c1abd63f1d6c..9fccd239abae 100644
--- a/kernel/trace/trace_events_hist.c
+++ b/kernel/trace/trace_events_hist.c
@@ -4783,7 +4783,7 @@ static int event_hist_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
@@ -5055,7 +5055,7 @@ static int event_hist_debug_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_events_synth.c b/kernel/trace/trace_events_synth.c
index 2ac75eb6aa86..7157a6bd64b7 100644
--- a/kernel/trace/trace_events_synth.c
+++ b/kernel/trace/trace_events_synth.c
@@ -2171,7 +2171,7 @@ static int synth_events_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_events_trigger.c b/kernel/trace/trace_events_trigger.c
index b8bfa8505b7b..0db73069d8fa 100644
--- a/kernel/trace/trace_events_trigger.c
+++ b/kernel/trace/trace_events_trigger.c
@@ -178,7 +178,7 @@ static int event_trigger_regex_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
index ea6178cb5e33..370fa23d7f0f 100644
--- a/kernel/trace/trace_kprobe.c
+++ b/kernel/trace/trace_kprobe.c
@@ -483,7 +483,7 @@ static int __register_trace_kprobe(struct trace_kprobe *tk)
 {
 	int i, ret;
 
-	ret = security_locked_down(LOCKDOWN_KPROBES);
+	ret = security_locked_down(current_cred(), LOCKDOWN_KPROBES);
 	if (ret)
 		return ret;
 
@@ -1150,7 +1150,7 @@ static int probes_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
@@ -1208,7 +1208,7 @@ static int profile_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_printk.c b/kernel/trace/trace_printk.c
index 4b320fe7df70..47c808484cb2 100644
--- a/kernel/trace/trace_printk.c
+++ b/kernel/trace/trace_printk.c
@@ -362,7 +362,7 @@ ftrace_formats_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_stack.c b/kernel/trace/trace_stack.c
index 63c285042051..63b6ebe7bdce 100644
--- a/kernel/trace/trace_stack.c
+++ b/kernel/trace/trace_stack.c
@@ -477,7 +477,7 @@ static int stack_trace_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_stat.c b/kernel/trace/trace_stat.c
index 8d141c3825a9..2f6ae81ee67e 100644
--- a/kernel/trace/trace_stat.c
+++ b/kernel/trace/trace_stat.c
@@ -236,7 +236,7 @@ static int tracing_stat_open(struct inode *inode, struct file *file)
 	struct seq_file *m;
 	struct stat_session *session = inode->i_private;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/kernel/trace/trace_uprobe.c b/kernel/trace/trace_uprobe.c
index 9b50869a5ddb..a5a71096d363 100644
--- a/kernel/trace/trace_uprobe.c
+++ b/kernel/trace/trace_uprobe.c
@@ -781,7 +781,7 @@ static int probes_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
@@ -836,7 +836,7 @@ static int profile_open(struct inode *inode, struct file *file)
 {
 	int ret;
 
-	ret = security_locked_down(LOCKDOWN_TRACEFS);
+	ret = security_locked_down(current_cred(), LOCKDOWN_TRACEFS);
 	if (ret)
 		return ret;
 
diff --git a/net/xfrm/xfrm_user.c b/net/xfrm/xfrm_user.c
index f0aecee4d539..e3a8c66bead0 100644
--- a/net/xfrm/xfrm_user.c
+++ b/net/xfrm/xfrm_user.c
@@ -850,8 +850,15 @@ static int copy_user_offload(struct xfrm_state_offload *xso, struct sk_buff *skb
 
 static bool xfrm_redact(void)
 {
-	return IS_ENABLED(CONFIG_SECURITY) &&
-		security_locked_down(LOCKDOWN_XFRM_SECRET);
+	/* Don't use current_cred() here, since this may be called when
+	 * broadcasting a notification that an SA has been created/deleted.
+	 * In that case current task is the one triggering the notification,
+	 * but the SA key is actually leaked to the event subscribers.
+	 * Since we can't easily do the redact decision per-subscriber,
+	 * just pass NULL here, indicating to the LSMs that a global lockdown
+	 * decision should be made instead.
+	 */
+	return security_locked_down(NULL, LOCKDOWN_XFRM_SECRET);
 }
 
 static int copy_to_user_auth(struct xfrm_algo_auth *auth, struct sk_buff *skb)
diff --git a/security/lockdown/lockdown.c b/security/lockdown/lockdown.c
index 87cbdc64d272..2abe92157e82 100644
--- a/security/lockdown/lockdown.c
+++ b/security/lockdown/lockdown.c
@@ -55,7 +55,8 @@ early_param("lockdown", lockdown_param);
  * lockdown_is_locked_down - Find out if the kernel is locked down
  * @what: Tag to use in notice generated if lockdown is in effect
  */
-static int lockdown_is_locked_down(enum lockdown_reason what)
+static int lockdown_is_locked_down(const struct cred *cred,
+				   enum lockdown_reason what)
 {
 	if (WARN(what >= LOCKDOWN_CONFIDENTIALITY_MAX,
 		 "Invalid lockdown reason"))
diff --git a/security/security.c b/security/security.c
index b38155b2de83..9719327b5d70 100644
--- a/security/security.c
+++ b/security/security.c
@@ -2592,9 +2592,9 @@ void security_bpf_prog_free(struct bpf_prog_aux *aux)
 }
 #endif /* CONFIG_BPF_SYSCALL */
 
-int security_locked_down(enum lockdown_reason what)
+int security_locked_down(const struct cred *cred, enum lockdown_reason what)
 {
-	return call_int_hook(locked_down, 0, what);
+	return call_int_hook(locked_down, 0, cred, what);
 }
 EXPORT_SYMBOL(security_locked_down);
 
diff --git a/security/selinux/hooks.c b/security/selinux/hooks.c
index eaea837d89d1..f7cb702598b9 100644
--- a/security/selinux/hooks.c
+++ b/security/selinux/hooks.c
@@ -7017,10 +7017,10 @@ static void selinux_bpf_prog_free(struct bpf_prog_aux *aux)
 }
 #endif
 
-static int selinux_lockdown(enum lockdown_reason what)
+static int selinux_lockdown(const struct cred *cred, enum lockdown_reason what)
 {
 	struct common_audit_data ad;
-	u32 sid = current_sid();
+	u32 sid;
 	int invalid_reason = (what <= LOCKDOWN_NONE) ||
 			     (what == LOCKDOWN_INTEGRITY_MAX) ||
 			     (what >= LOCKDOWN_CONFIDENTIALITY_MAX);
@@ -7032,6 +7032,9 @@ static int selinux_lockdown(enum lockdown_reason what)
 		return -EINVAL;
 	}
 
+	/* Use SECINITSID_KERNEL if there is no relevant cred to check against */
+	sid = cred ? cred_sid(cred) : SECINITSID_KERNEL;
+
 	ad.type = LSM_AUDIT_DATA_LOCKDOWN;
 	ad.u.reason = what;
 
-- 
2.31.1

