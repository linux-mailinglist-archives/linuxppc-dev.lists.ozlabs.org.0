Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD76784C1F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Aug 2023 23:36:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dTGNb3Wu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RVjN02pPTz3c7Q
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 07:36:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dTGNb3Wu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RVjKF3hW3z3bNm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 07:34:09 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 78727633B1;
	Tue, 22 Aug 2023 21:34:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3D91C433C8;
	Tue, 22 Aug 2023 21:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692740044;
	bh=ab+0/BfFEop+SvX34BlINY4/Yj+iD7AvaDREEfDAaFY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dTGNb3WusyNjv79Qut2rSje7sGhIsJL5tg32uPNJueL4s2kS5Si2NGmSkZ/sltkc9
	 pQ2cBbam0TBrBw2ekYzlWkcEsHIGv032ukTwsGUL2JAqR9aaLz7hkKIEBeGe2Wkrm9
	 zG3FDL2TezdSgtQ68Dp0uyiMRi0Sf55lU6fjdUa1ja24IuKMY5q4o+L3Y/EYPn7XG3
	 kBjCLKmNosRzmZhYtmUZ1XpnCl76utpiHWXCX7FelN0Bk+O4mLnlfQUlOn308ZWKJH
	 8iMhuiN+g5pCB0C18o8vuyERv61/3RMO3mVutPjdYvq669sqzTYrVMTiRhhloWL6jR
	 nutdTZ6JzQ1lw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2C3AEE49AF;
	Tue, 22 Aug 2023 21:34:04 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Tue, 22 Aug 2023 16:33:39 -0500
Subject: [PATCH RFC 1/2] powerpc/pseries: papr-vpd char driver for VPD
 retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230822-papr-sys_rtas-vs-lockdown-v1-1-932623cf3c7b@linux.ibm.com>
References:  <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
In-Reply-To:  <20230822-papr-sys_rtas-vs-lockdown-v1-0-932623cf3c7b@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692740044; l=14483;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=Np/1Zw9Fy0X/4ziER0AtDbC1+m80SlkjFWs8a1tYygs=;
 b=OySqBDQC/Db8abhvCL3LLA3O+5VKerI40+GkJ7krTbn/7P5q6x0m7/750q9pY78ycw2lf0Ldz
 XdF1QLjkjioAHHMsxQ61EM6BjooU8hI34Ed9qxhmGVTxfxTr+NLg24k
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, tyreld@linux.ibm.com, gcwilson@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Nathan Lynch <nathanl@linux.ibm.com>

PowerVM LPARs may retrieve Vital Product Data (VPD) for system
components using the ibm,get-vpd RTAS function.

We can expose this to user space with a /dev/papr-vpd character
device, where the programming model is:

  struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
  int devfd = open("/dev/papr-vpd", O_WRONLY);
  int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
  size_t size = lseek(vpdfd, 0, SEEK_END);
  char *buf = malloc(size);
  pread(devfd, buf, size, 0);

When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
the file contains the result of a complete ibm,get-vpd sequence. The
file contents are immutable from the POV of user space. To get a new
view of VPD, clients must create a new handle.

This design choice insulates user space from most of the complexities
that ibm,get-vpd brings:

* ibm,get-vpd must be called more than once to obtain complete
  results.
* Only one ibm,get-vpd call sequence should be in progress at a time;
  concurrent sequences will disrupt each other. Callers must have a
  protocol for serializing their use of the function.
* A call sequence in progress may receive a "VPD changed, try again"
  status, requiring the client to start over. (The driver does not yet
  handle this, but it should be easy to add.)

The memory required for the VPD buffers seems acceptable, around 20KB
for all VPD on one of my systems. And the value of the
/rtas/ibm,vpd-size DT property (the estimated maximum size of VPD) is
consistently 300KB across various systems I've checked.

I've implemented support for this new ABI in the rtas_get_vpd()
function in librtas, which the vpdupdate command currently uses to
populate its VPD database. I've verified that an unmodified vpdupdate
binary generates an identical database when using a librtas.so that
prefers the new ABI.

Likely remaining work:

* Handle RTAS call status -4 (VPD changed) during ibm,get-vpd call
  sequence.
* Prevent ibm,get-vpd calls via rtas(2) from disrupting ibm,get-vpd
  call sequences in this driver.
* (Maybe) implement a poll method for delivering notifications of
  potential changes to VPD, e.g. after a partition migration.

Questions, points for discussion:

* Am I allocating the ioctl numbers correctly?
* The only way to discover the size of a VPD buffer is
  lseek(SEEK_END). fstat() doesn't work for anonymous fds like
  this. Is this OK, or should the buffer length be discoverable some
  other way?

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
 arch/powerpc/include/uapi/asm/papr-vpd.h           |  29 ++
 arch/powerpc/platforms/pseries/Makefile            |   1 +
 arch/powerpc/platforms/pseries/papr-vpd.c          | 353 +++++++++++++++++++++
 4 files changed, 385 insertions(+)

diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
index 4ea5b837399a..a950545bf7cd 100644
--- a/Documentation/userspace-api/ioctl/ioctl-number.rst
+++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
@@ -349,6 +349,8 @@ Code  Seq#    Include File                                           Comments
                                                                      <mailto:vgo@ratio.de>
 0xB1  00-1F                                                          PPPoX
                                                                      <mailto:mostrows@styx.uwaterloo.ca>
+0xB2  00     arch/powerpc/include/uapi/asm/papr-vpd.h                powerpc/pseries VPD API
+                                                                     <mailto:linuxppc-dev>
 0xB3  00     linux/mmc/ioctl.h
 0xB4  00-0F  linux/gpio.h                                            <mailto:linux-gpio@vger.kernel.org>
 0xB5  00-0F  uapi/linux/rpmsg.h                                      <mailto:linux-remoteproc@vger.kernel.org>
diff --git a/arch/powerpc/include/uapi/asm/papr-vpd.h b/arch/powerpc/include/uapi/asm/papr-vpd.h
new file mode 100644
index 000000000000..aa33217ad5de
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-vpd.h
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note
+#ifndef _UAPI_PAPR_VPD_H_
+#define _UAPI_PAPR_VPD_H_
+
+#include <linux/types.h>
+#include <asm/ioctl.h>
+
+struct papr_location_code {
+	/*
+	 * PAPR+ 12.3.2.4 Converged Location Code Rules - Length
+	 * Restrictions. 79 characters plus nul.
+	 */
+	char str[80];
+};
+
+#define PAPR_VPD_IOCTL_BASE 0xb2
+
+#define PAPR_VPD_IO(nr)         _IO(PAPR_VPD_IOCTL_BASE, nr)
+#define PAPR_VPD_IOR(nr, type)  _IOR(PAPR_VPD_IOCTL_BASE, nr, type)
+#define PAPR_VPD_IOW(nr, type)  _IOW(PAPR_VPD_IOCTL_BASE, nr, type)
+#define PAPR_VPD_IOWR(nr, type) _IOWR(PAPR_VPD_IOCTL_BASE, nr, type)
+
+/*
+ * ioctl for /dev/papr-vpd. Returns a VPD handle fd corresponding to
+ * the location code.
+ */
+#define PAPR_VPD_CREATE_HANDLE PAPR_VPD_IOW(0, struct papr_location_code)
+
+#endif /* _UAPI_PAPR_VPD_H_ */
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index 53c3b91af2f7..cbcaa102e2b4 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -4,6 +4,7 @@ ccflags-$(CONFIG_PPC_PSERIES_DEBUG)	+= -DDEBUG
 
 obj-y			:= lpar.o hvCall.o nvram.o reconfig.o \
 			   of_helpers.o rtas-work-area.o papr-sysparm.o \
+			   papr-vpd.o \
 			   setup.o iommu.o event_sources.o ras.o \
 			   firmware.o power.o dlpar.o mobility.o rng.o \
 			   pci.o pci_dlpar.o eeh_pseries.o msi.o \
diff --git a/arch/powerpc/platforms/pseries/papr-vpd.c b/arch/powerpc/platforms/pseries/papr-vpd.c
new file mode 100644
index 000000000000..6fc9ee0c48ae
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -0,0 +1,353 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define pr_fmt(fmt) "papr-vpd: " fmt
+
+#include <linux/anon_inodes.h>
+#include <linux/build_bug.h>
+#include <linux/file.h>
+#include <linux/fs.h>
+#include <linux/init.h>
+#include <linux/kernel.h>
+#include <linux/kernel.h>
+#include <linux/miscdevice.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <asm/machdep.h>
+#include <asm/papr-vpd.h>
+#include <asm/rtas-work-area.h>
+#include <asm/rtas.h>
+
+/*
+ * Internal VPD "blob" APIs: for accumulating successive ibm,get-vpd results
+ * into a buffer to be attached to a file descriptor.
+ */
+struct vpd_blob {
+	const char *data;
+	size_t len;
+};
+
+static struct vpd_blob *vpd_blob_new(void)
+{
+	return kzalloc(sizeof(struct vpd_blob), GFP_KERNEL_ACCOUNT);
+}
+
+static void vpd_blob_free(struct vpd_blob *blob)
+{
+	if (blob) {
+		kvfree(blob->data);
+		kfree(blob);
+	}
+}
+
+static int vpd_blob_accumulate(struct vpd_blob *blob, const char *data, size_t len)
+{
+	const size_t new_len = blob->len + len;
+	const size_t old_len = blob->len;
+	const char *old_ptr = blob->data;
+	char *new_ptr;
+
+	new_ptr = old_ptr ?
+		kvrealloc(old_ptr, old_len, new_len, GFP_KERNEL_ACCOUNT) :
+		kvmalloc(len, GFP_KERNEL_ACCOUNT);
+
+	if (!new_ptr)
+		return -ENOMEM;
+
+	memcpy(&new_ptr[old_len], data, len);
+	blob->data = new_ptr;
+	blob->len = new_len;
+	return 0;
+}
+
+/**
+ * struct rtas_ibm_get_vpd_params - Parameters (in and out) for ibm,get-vpd.
+ *
+ * @loc_code: In: Location code buffer. Must be RTAS-addressable.
+ * @work_area: In: Work area buffer for results.
+ * @sequence: In: Sequence number. Out: Next sequence number.
+ * @written: Out: Bytes written by ibm,get-vpd to @work_area.
+ * @status: Out: RTAS call status.
+ */
+struct rtas_ibm_get_vpd_params {
+	const struct papr_location_code *loc_code;
+	struct rtas_work_area *work_area;
+	u32 sequence;
+	u32 written;
+	s32 status;
+};
+
+static int rtas_ibm_get_vpd(struct rtas_ibm_get_vpd_params *params)
+{
+	const struct papr_location_code *loc_code = params->loc_code;
+	struct rtas_work_area *work_area = params->work_area;
+	u32 rets[2];
+	s32 fwrc;
+	int ret;
+
+	do {
+		fwrc = rtas_call(rtas_function_token(RTAS_FN_IBM_GET_VPD), 4, 3,
+				 rets,
+				 __pa(loc_code),
+				 rtas_work_area_phys(work_area),
+				 rtas_work_area_size(work_area),
+				 params->sequence);
+	} while (rtas_busy_delay(fwrc));
+
+	switch (fwrc) {
+	case -1:
+		ret = -EIO;
+		break;
+	case -3:
+		ret = -EINVAL;
+		break;
+	case -4:
+		ret = -EAGAIN;
+		break;
+	case 1:
+		params->sequence = rets[0];
+		fallthrough;
+	case 0:
+		params->written = rets[1];
+		/*
+		 * Kernel or firmware bug, do not continue.
+		 */
+		if (WARN(params->written > rtas_work_area_size(work_area),
+			 "possible write beyond end of work area"))
+			ret = -EFAULT;
+		else
+			ret = 0;
+		break;
+	default:
+		ret = -EIO;
+		pr_err_ratelimited("unexpected ibm,get-vpd status %d\n", fwrc);
+		break;
+	}
+
+	params->status = fwrc;
+	return ret;
+}
+
+struct vpd_sequence_state {
+	struct mutex *mutex; /* always &vpd_sequence_mutex */
+	struct pin_cookie cookie;
+	int error;
+	struct rtas_ibm_get_vpd_params params;
+};
+
+static void vpd_sequence_begin(struct vpd_sequence_state *state,
+			       const struct papr_location_code *loc_code)
+{
+	static DEFINE_MUTEX(vpd_sequence_mutex);
+	/*
+	 * Use a static data structure for the location code passed to
+	 * RTAS to ensure it's in the RMA and avoid a separate work
+	 * area allocation.
+	 */
+	static struct papr_location_code static_loc_code;
+
+	mutex_lock(&vpd_sequence_mutex);
+
+	static_loc_code = *loc_code;
+	*state = (struct vpd_sequence_state) {
+		.mutex = &vpd_sequence_mutex,
+		.cookie = lockdep_pin_lock(&vpd_sequence_mutex),
+		.params = {
+			.work_area = rtas_work_area_alloc(SZ_4K),
+			.loc_code = &static_loc_code,
+			.sequence = 1,
+		},
+	};
+}
+
+static bool vpd_sequence_done(const struct vpd_sequence_state *state)
+{
+	bool done;
+
+	if (state->error)
+		return true;
+
+	switch (state->params.status) {
+	case 0:
+		if (state->params.written == 0)
+			done = false; /* Initial state. */
+		else
+			done = true; /* All data consumed. */
+		break;
+	case 1:
+		done = false; /* More data available. */
+		break;
+	default:
+		done = true; /* Error encountered. */
+		break;
+	}
+
+	return done;
+}
+
+static bool vpd_sequence_advance(struct vpd_sequence_state *state)
+{
+	if (vpd_sequence_done(state))
+		return false;
+
+	state->error = rtas_ibm_get_vpd(&state->params);
+
+	return state->error == 0;
+}
+
+static size_t vpd_sequence_get_buffer(const struct vpd_sequence_state *state, const char **buf)
+{
+	*buf = rtas_work_area_raw_buf(state->params.work_area);
+	return state->params.written;
+}
+
+static void vpd_sequence_set_err(struct vpd_sequence_state *state, int err)
+{
+	state->error = err;
+}
+
+static void vpd_sequence_end(struct vpd_sequence_state *state)
+{
+	rtas_work_area_free(state->params.work_area);
+	lockdep_unpin_lock(state->mutex, state->cookie);
+	mutex_unlock(state->mutex);
+}
+
+static struct vpd_blob *papr_vpd_retrieve(const struct papr_location_code *loc_code)
+{
+	struct vpd_sequence_state state;
+	struct vpd_blob *blob;
+
+	blob = vpd_blob_new();
+	if (!blob)
+		return ERR_PTR(-ENOMEM);
+
+	vpd_sequence_begin(&state, loc_code);
+
+	while (vpd_sequence_advance(&state)) {
+		const char *buf;
+		const size_t len = vpd_sequence_get_buffer(&state, &buf);
+
+		vpd_sequence_set_err(&state, vpd_blob_accumulate(blob, buf, len));
+	}
+
+	vpd_sequence_end(&state);
+
+	if (!state.error)
+		return blob;
+
+	vpd_blob_free(blob);
+
+	return ERR_PTR(state.error);
+}
+
+static ssize_t papr_vpd_handle_read(struct file *file, char __user *buf, size_t size, loff_t *off)
+{
+	struct vpd_blob *blob = file->private_data;
+
+	/* Blobs should always have a valid data pointer and nonzero size. */
+	if (WARN_ON_ONCE(!blob->data))
+		return -EIO;
+	if (WARN_ON_ONCE(blob->len == 0))
+		return -EIO;
+	return simple_read_from_buffer(buf, size, off, blob->data, blob->len);
+}
+
+static int papr_vpd_handle_release(struct inode *inode, struct file *file)
+{
+	struct vpd_blob *blob = file->private_data;
+
+	vpd_blob_free(blob);
+
+	return 0;
+}
+
+static loff_t papr_vpd_handle_seek(struct file *file, loff_t off, int whence)
+{
+	struct vpd_blob *blob = file->private_data;
+
+	return fixed_size_llseek(file, off, whence, blob->len);
+}
+
+
+static const struct file_operations papr_vpd_handle_ops = {
+	.read = papr_vpd_handle_read,
+	.llseek = papr_vpd_handle_seek,
+	.release = papr_vpd_handle_release,
+};
+
+static long papr_vpd_ioctl_create_handle(struct papr_location_code __user *ulc)
+{
+	struct papr_location_code klc;
+	struct vpd_blob *blob;
+	struct file *file;
+	long err;
+	int fd;
+
+	if (copy_from_user(&klc, ulc, sizeof(klc)))
+		return -EFAULT;
+
+	if (!string_is_terminated(klc.str, ARRAY_SIZE(klc.str)))
+		return -EINVAL;
+
+	blob = papr_vpd_retrieve(&klc);
+	if (IS_ERR(blob))
+		return PTR_ERR(blob);
+
+	fd = get_unused_fd_flags(O_RDONLY | O_CLOEXEC);
+	if (fd < 0) {
+		err = fd;
+		goto free_blob;
+	}
+
+	file = anon_inode_getfile("[papr-vpd]", &papr_vpd_handle_ops,
+				  blob, O_RDONLY);
+	if (IS_ERR(file)) {
+		err = PTR_ERR(file);
+		goto put_fd;
+	}
+
+	file->f_mode |= FMODE_LSEEK | FMODE_PREAD;
+	fd_install(fd, file);
+	return fd;
+put_fd:
+	put_unused_fd(fd);
+free_blob:
+	vpd_blob_free(blob);
+	return err;
+}
+
+/* handler for /dev/papr-vpd */
+static long papr_vpd_dev_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
+{
+	void __user *argp = (__force void __user *)arg;
+	long ret;
+
+	switch (ioctl) {
+	case PAPR_VPD_CREATE_HANDLE:
+		ret = papr_vpd_ioctl_create_handle(argp);
+		break;
+	default:
+		ret = -ENOIOCTLCMD;
+		break;
+	}
+	return ret;
+}
+
+static const struct file_operations papr_vpd_ops = {
+	.unlocked_ioctl = papr_vpd_dev_ioctl,
+};
+
+static struct miscdevice papr_vpd_dev = {
+	.minor = MISC_DYNAMIC_MINOR,
+	.name = "papr-vpd",
+	.fops = &papr_vpd_ops,
+};
+
+static __init int papr_vpd_init(void)
+{
+	if (!rtas_function_implemented(RTAS_FN_IBM_GET_VPD))
+		return -ENODEV;
+
+	return misc_register(&papr_vpd_dev);
+}
+machine_device_initcall(pseries, papr_vpd_init);

-- 
2.41.0

