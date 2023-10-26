Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 221647D7B35
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 05:25:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tTfSXxyk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGB590MYLz3cF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 14:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tTfSXxyk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGB4F5xPhz2yV3
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 14:24:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 8523DCE0B5F;
	Thu, 26 Oct 2023 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8E299C43391;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698290682;
	bh=HBCr6Hdpp1glusNy1fAPnjK/liZ/Ojhk8iBY7HxiLUU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tTfSXxykB02V159EKq9Dauqxvi1d7v9arC29RZ4Tv0m8KSK6khvnWkLn8MVIcUMay
	 JX4wRQpTbiwhO18eLdL1K9SKs2NUo/Qd0crryKA+XFY3ofIVMEwK2kfr1dtUxVoyTm
	 23BfU3LUMCoO3UbsTxd6EMqwJ2Sv0+2nPA8XvOixoscFsqB3II5TDKGIs5AY/N6vb5
	 GrjrbXzcdvG6jF9hvv8oE72tFdb46g+7oIqIzJpd3PvaS50L9YYbiaadGeC4lGnqPW
	 1/GRJIjyB9B1UTZTpB2Yx5jjWQFuVxain5tDOB//qpE2aR0YM9Ytpjdew1HorIy3fB
	 WXQEw0IIExfOg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BF93C25B6B;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Wed, 25 Oct 2023 22:24:22 -0500
Subject: [PATCH v3 08/10] powerpc/pseries/papr-sysparm: Expose character
 device to user space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20231025-papr-sys_rtas-vs-lockdown-v3-8-5eb04559e7d8@linux.ibm.com>
References:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
In-Reply-To:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698290680; l=11223;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=LZ+BjA1g2VqeWBh9ERDby/DlgEt2V5tYu1PwiVAh5CQ=;
 b=1aposYIXstX6vfwVGaaUvpuGIGKI04EL/Nx3wQ9reVtO9DemuqfWPqQeYam+PAI+Gphly40UF
 gKdRtwmbaCKBKuRdtNJRMOwRK86KutZfgjPP7iKsWVSE1I5DihIwWtJ
X-Developer-Key: i=nathanl@linux.ibm.com; a=ed25519;
 pk=jPDF44RvT+9DGFOH3NGoIu1xN9dF+82pjdpnKjXfoJ0=
X-Endpoint-Received:  by B4 Relay for nathanl@linux.ibm.com/20230817 with auth_id=78
X-Original-From: Nathan Lynch <nathanl@linux.ibm.com>
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
Reply-To: nathanl@linux.ibm.com
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, linuxppc-dev@lists.ozlabs.org, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

Until now the papr_sysparm APIs have been kernel-internal. But user
space needs access to PAPR system parameters too. The only method
available to user space today to get or set system parameters is using
sys_rtas() and /dev/mem to pass RTAS-addressable buffers between user
space and firmware. This is incompatible with lockdown and should be
deprecated.

So provide an alternative ABI to user space in the form of a
/dev/papr-sysparm character device with just two ioctl commands (get
and set). The data payloads involved are small enough to fit in the
ioctl argument buffer, making the code relatively simple.

Exposing the system parameters through sysfs has been considered but
it would be too awkward:

* The kernel currently does not have to contain an exhaustive list of
  defined system parameters. This is a convenient property to maintain
  because we don't have to update the kernel whenever a new parameter
  is added to PAPR. Exporting a named attribute in sysfs for each
  parameter would negate this.

* Some system parameters are text-based and some are not.

* Retrieval of at least one system parameter requires input data,
  which a simple read-oriented interface can't support.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
 arch/powerpc/include/asm/papr-sysparm.h            |  17 ++-
 arch/powerpc/include/uapi/asm/papr-sysparm.h       |  58 ++++++++
 arch/powerpc/platforms/pseries/papr-sysparm.c      | 154 ++++++++++++++++++++-
 4 files changed, 223 insertions(+), 8 deletions(-)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index a950545bf7cd..d8b6cb1a3636 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -351,6 +351,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:mostrows@styx.uwaterloo.ca>
 0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
                                                                      <mailto:linuxppc-dev>
+0xB2  01-02  arch/powerpc/include/uapi/asm/papr-sysparm.h            powerpc/pseries system parameter API
+                                                                     <mailto:linuxppc-dev>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
diff --git a/arch/powerpc/include/asm/papr-sysparm.h b/arch/powerpc/include/asm/papr-sysparm.h
index f5fdbd8ae9db..0dbbff59101d 100644
--- a/arch/powerpc/include/asm/papr-sysparm.h
+++ b/arch/powerpc/include/asm/papr-sysparm.h
@@ -2,8 +2,10 @@
 #ifndef _ASM_POWERPC_PAPR_SYSPARM_H
 #define _ASM_POWERPC_PAPR_SYSPARM_H
 
+#include <uapi/asm/papr-sysparm.h>
+
 typedef struct {
-	const u32 token;
+	u32 token;
 } papr_sysparm_t;
 
 #define mk_papr_sysparm(x_) ((papr_sysparm_t){ .token = x_, })
@@ -20,11 +22,14 @@ typedef struct {
 #define PAPR_SYSPARM_TLB_BLOCK_INVALIDATE_ATTRS    mk_papr_sysparm(50)
 #define PAPR_SYSPARM_LPAR_NAME                     mk_papr_sysparm(55)
 
-enum {
-	PAPR_SYSPARM_MAX_INPUT  = 1024,
-	PAPR_SYSPARM_MAX_OUTPUT = 4000,
-};
-
+/**
+ * struct papr_sysparm_buf - RTAS work area layout for system parameter functions.
+ *
+ * This is the memory layout of the buffers passed to/from
+ * ibm,get-system-parameter and ibm,set-system-parameter. It is
+ * distinct from the papr_sysparm_io_block structure that is passed
+ * between user space and the kernel.
+ */
 struct papr_sysparm_buf {
 	__be16 len;
 	char val[PAPR_SYSPARM_MAX_OUTPUT];
diff --git a/arch/powerpc/include/uapi/asm/papr-sysparm.h b/arch/powerpc/include/uapi/asm/papr-sysparm.h
new file mode 100644
index 000000000000..9f9a0f267ea5
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-sysparm.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PAPR_SYSPARM_H_
+#define _UAPI_PAPR_SYSPARM_H_
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+#include <asm/papr-miscdev.h>
+
+enum {
+	PAPR_SYSPARM_MAX_INPUT  = 1024,
+	PAPR_SYSPARM_MAX_OUTPUT = 4000,
+};
+
+struct papr_sysparm_io_block {
+	__u32 parameter;
+	__u16 length;
+	char data[PAPR_SYSPARM_MAX_OUTPUT];
+};
+
+/**
+ * PAPR_SYSPARM_IOC_GET - Retrieve the value of a PAPR system parameter.
+ *
+ * Uses _IOWR because of one corner case: Retrieving the value of the
+ * "OS Service Entitlement Status" parameter (60) requires the caller
+ * to supply input data (a date string) in the buffer passed to
+ * firmware. So the @length and @data of the incoming
+ * papr_sysparm_io_block are always used to initialize the work area
+ * supplied to ibm,get-system-parameter. No other parameters are known
+ * to parameterize the result this way, and callers are encouraged
+ * (but not required) to zero-initialize @length and @data in the
+ * common case.
+ *
+ * On error the contents of the ioblock are indeterminate.
+ *
+ * Return:
+ * 0: Success; @length is the length of valid data in @data, not to exceed @PAPR_SYSPARM_MAX_OUTPUT.
+ * -EIO: Platform error. (-1)
+ * -EINVAL: Incorrect data length or format. (-9999)
+ * -EPERM: The calling partition is not allowed to access this parameter. (-9002)
+ * -EOPNOTSUPP: Parameter not supported on this platform (-3)
+ */
+#define PAPR_SYSPARM_IOC_GET _IOWR(PAPR_MISCDEV_IOC_ID, 1, struct papr_sysparm_io_block)
+
+/**
+ * PAPR_SYSPARM_IOC_SET - Update the value of a PAPR system parameter.
+ *
+ * The contents of the ioblock are unchanged regardless of success.
+ *
+ * Return:
+ * 0: Success; the parameter has been updated.
+ * -EIO: Platform error. (-1)
+ * -EINVAL: Incorrect data length or format. (-9999)
+ * -EPERM: The calling partition is not allowed to access this parameter. (-9002)
+ * -EOPNOTSUPP: Parameter not supported on this platform (-3)
+ */
+#define PAPR_SYSPARM_IOC_SET _IOW(PAPR_MISCDEV_IOC_ID, 2, struct papr_sysparm_io_block)
+
+#endif /* _UAPI_PAPR_SYSPARM_H_ */
diff --git a/arch/powerpc/platforms/pseries/papr-sysparm.c b/arch/powerpc/platforms/pseries/papr-sysparm.c
index a1e7aeac7416..d6f2957aa274 100644
--- a/arch/powerpc/platforms/pseries/papr-sysparm.c
+++ b/arch/powerpc/platforms/pseries/papr-sysparm.c
@@ -2,14 +2,19 @@
 
 #define pr_fmt(fmt)	"papr-sysparm: " fmt
 
+#include <linux/anon_inodes.h>
 #include <linux/bug.h>
+#include <linux/file.h>
+#include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/kernel.h>
+#include <linux/miscdevice.h>
 #include <linux/printk.h>
 #include <linux/slab.h>
-#include <asm/rtas.h>
+#include <asm/machdep.h>
 #include <asm/papr-sysparm.h>
 #include <asm/rtas-work-area.h>
+#include <asm/rtas.h>
 
 struct papr_sysparm_buf *papr_sysparm_buf_alloc(void)
 {
@@ -87,7 +92,6 @@ static bool papr_sysparm_buf_can_submit(const struct papr_sysparm_buf *buf)
  *
  * Return: 0 on success, -errno otherwise. @buf is unmodified on error.
  */
-
 int papr_sysparm_get(papr_sysparm_t param, struct papr_sysparm_buf *buf)
 {
 	const s32 token = rtas_function_token(RTAS_FN_IBM_GET_SYSTEM_PARAMETER);
@@ -196,3 +200,149 @@ int papr_sysparm_set(papr_sysparm_t param, const struct papr_sysparm_buf *buf)
 
 	return ret;
 }
+
+static struct papr_sysparm_buf *
+papr_sysparm_buf_from_user(const struct papr_sysparm_io_block __user *user_iob)
+{
+	struct papr_sysparm_buf *kern_spbuf;
+	long err;
+	u16 len;
+
+	/*
+	 * The length of valid data that userspace claims to be in
+	 * user_iob->data[].
+	 */
+	if (get_user(len, &user_iob->length))
+		return ERR_PTR(-EFAULT);
+
+	static_assert(sizeof(user_iob->data) >= PAPR_SYSPARM_MAX_INPUT);
+	static_assert(sizeof(kern_spbuf->val) >= PAPR_SYSPARM_MAX_INPUT);
+
+	if (len > PAPR_SYSPARM_MAX_INPUT)
+		return ERR_PTR(-EINVAL);
+
+	kern_spbuf = papr_sysparm_buf_alloc();
+	if (!kern_spbuf)
+		return ERR_PTR(-ENOMEM);
+
+	papr_sysparm_buf_set_length(kern_spbuf, len);
+
+	if (len > 0 && copy_from_user(kern_spbuf->val, user_iob->data, len)) {
+		err = -EFAULT;
+		goto free_sysparm_buf;
+	}
+
+	return kern_spbuf;
+
+free_sysparm_buf:
+	papr_sysparm_buf_free(kern_spbuf);
+	return ERR_PTR(err);
+}
+
+static int papr_sysparm_buf_to_user(const struct papr_sysparm_buf *kern_spbuf,
+				    struct papr_sysparm_io_block __user *user_iob)
+{
+	u16 len_out = papr_sysparm_buf_get_length(kern_spbuf);
+
+	if (put_user(len_out, &user_iob->length))
+		return -EFAULT;
+
+	static_assert(sizeof(user_iob->data) >= PAPR_SYSPARM_MAX_OUTPUT);
+	static_assert(sizeof(kern_spbuf->val) >= PAPR_SYSPARM_MAX_OUTPUT);
+
+	if (copy_to_user(user_iob->data, kern_spbuf->val, PAPR_SYSPARM_MAX_OUTPUT))
+		return -EFAULT;
+
+	return 0;
+}
+
+static long papr_sysparm_ioctl_get(struct papr_sysparm_io_block __user *user_iob)
+{
+	struct papr_sysparm_buf *kern_spbuf;
+	papr_sysparm_t param;
+	long ret;
+
+	if (get_user(param.token, &user_iob->parameter))
+		return -EFAULT;
+
+	kern_spbuf = papr_sysparm_buf_from_user(user_iob);
+	if (IS_ERR(kern_spbuf))
+		return PTR_ERR(kern_spbuf);
+
+	ret = papr_sysparm_get(param, kern_spbuf);
+	if (ret)
+		goto free_sysparm_buf;
+
+	ret = papr_sysparm_buf_to_user(kern_spbuf, user_iob);
+	if (ret)
+		goto free_sysparm_buf;
+
+	ret = 0;
+
+free_sysparm_buf:
+	papr_sysparm_buf_free(kern_spbuf);
+	return ret;
+}
+
+
+static long papr_sysparm_ioctl_set(struct papr_sysparm_io_block __user *user_iob)
+{
+	struct papr_sysparm_buf *kern_spbuf;
+	papr_sysparm_t param;
+	long ret;
+
+	if (get_user(param.token, &user_iob->parameter))
+		return -EFAULT;
+
+	kern_spbuf = papr_sysparm_buf_from_user(user_iob);
+	if (IS_ERR(kern_spbuf))
+		return PTR_ERR(kern_spbuf);
+
+	ret = papr_sysparm_set(param, kern_spbuf);
+	if (ret)
+		goto free_sysparm_buf;
+
+	ret = 0;
+
+free_sysparm_buf:
+	papr_sysparm_buf_free(kern_spbuf);
+	return ret;
+}
+
+static long papr_sysparm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
+{
+	void __user *argp = (__force void __user *)arg;
+	long ret;
+
+	switch (ioctl) {
+	case PAPR_SYSPARM_IOC_GET:
+		ret = papr_sysparm_ioctl_get(argp);
+		break;
+	case PAPR_SYSPARM_IOC_SET:
+		ret = papr_sysparm_ioctl_set(argp);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+	return ret;
+}
+
+static const struct file_operations papr_sysparm_ops = {
+	.unlocked_ioctl = papr_sysparm_ioctl,
+};
+
+static struct miscdevice papr_sysparm_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "papr-sysparm",
+	.fops = &papr_sysparm_ops,
+};
+
+static __init int papr_sysparm_init(void)
+{
+	if (!rtas_function_implemented(RTAS_FN_IBM_GET_SYSTEM_PARAMETER))
+		return -ENODEV;
+
+	return misc_register(&papr_sysparm_dev);
+}
+machine_device_initcall(pseries, papr_sysparm_init);

-- 
2.41.0

