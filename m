Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0FB7D7B44
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 05:32:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iJEo+D8N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGBDc1TRsz3ccS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Oct 2023 14:32:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iJEo+D8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=devnull+nathanl.linux.ibm.com@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGB4H0kJcz2ysD
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Oct 2023 14:24:46 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 3DD0EB833E8;
	Thu, 26 Oct 2023 03:24:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D13AC433CA;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698290682;
	bh=mTcID06joDHyD25+fjNwg4n3wKIyGQcLw55luLJBFtA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=iJEo+D8NXXjb4GL9u+ZfpBBEIvpl6VGzJRCranf86hlSpehxR1zjmneaGomdST3ZH
	 s+g9wmUZZFD/RPGGnvJ4C27s0F6dzpAPk3PVFUbO+8qRO8IRgclxuSG5qAZIgFn5bP
	 iQCyTFX0i0zA/WSsxm0+/nNQ8P3V80Qe8tKH+JwhTZy3J4N9HuTQvoAe91e0RQvOjE
	 mnu7ekWrAcE4GJbrijz+U6iBPgMF7nts3MJmaElnEo2CgQ7MPFbVJ22IJHDRbt2s70
	 cVBvW5BTrp5RHtrUn3afCn8a7dCMTvejBxQNLgreN2Wonp/36gG9WqxbYjId2+q8eA
	 JSCjmkYPABkqw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C865C0032E;
	Thu, 26 Oct 2023 03:24:42 +0000 (UTC)
From: Nathan Lynch via B4 Relay <devnull+nathanl.linux.ibm.com@kernel.org>
Date: Wed, 25 Oct 2023 22:24:20 -0500
Subject: [PATCH v3 06/10] powerpc/pseries: Add papr-vpd character driver
 for VPD retrieval
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id:  <20231025-papr-sys_rtas-vs-lockdown-v3-6-5eb04559e7d8@linux.ibm.com>
References:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
In-Reply-To:  <20231025-papr-sys_rtas-vs-lockdown-v3-0-5eb04559e7d8@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698290680; l=19877;
 i=nathanl@linux.ibm.com; s=20230817; h=from:subject:message-id;
 bh=/Ob8Unp6Ih1bpzVMMC7ubcv5HLS9D7rkG18J+b1M2bM=;
 b=8FcF7Mbghp9cmz+gp66bAUFgfLT93pFurjhiFk+gNyv7Vj5ErCNnCkD1wKyFD1H2PVEU3hsFk
 brHhITjXxe6DpMdCPm7NSXUI3YdFlkVOgyimsCjjc+RPZEXZyoOtx8w
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

PowerVM LPARs may retrieve Vital Product Data (VPD) for system
components using the ibm,get-vpd RTAS function.

We can expose this to user space with a /dev/papr-vpd character
device, where the programming model is:

  struct papr_location_code plc = { .str = "", }; /* obtain all VPD */
  int devfd = open("/dev/papr-vpd", O_RDONLY);
  int vpdfd = ioctl(devfd, PAPR_VPD_CREATE_HANDLE, &plc);
  size_t size = lseek(vpdfd, 0, SEEK_END);
  char *buf = malloc(size);
  pread(devfd, buf, size, 0);

When a file descriptor is obtained from ioctl(PAPR_VPD_CREATE_HANDLE),
the file contains the result of a complete ibm,get-vpd sequence. The
file contents are immutable from the POV of user space. To get a new
view of the VPD, the client must create a new handle.

This design choice insulates user space from most of the complexities
that ibm,get-vpd brings:

* ibm,get-vpd must be called more than once to obtain complete
  results.

* Only one ibm,get-vpd call sequence should be in progress at a time;
  interleaved sequences will disrupt each other. Callers must have a
  protocol for serializing their use of the function.

* A call sequence in progress may receive a "VPD changed, try again"
  status, requiring the client to abandon the sequence and start
  over.

The memory required for the VPD buffers seems acceptable, around 20KB
for all VPD on one of my systems. And the value of the
/rtas/ibm,vpd-size DT property (the estimated maximum size of VPD) is
consistently 300KB across various systems I've checked.

I've implemented support for this new ABI in the rtas_get_vpd()
function in librtas, which the vpdupdate command currently uses to
populate its VPD database. I've verified that an unmodified vpdupdate
binary generates an identical database when using a librtas.so that
prefers the new ABI.

Note that the driver needs to serialize its call sequences with legacy
sys_rtas(ibm,get-vpd) callers, so it exposes its internal lock for
sys_rtas.

Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
---
 Documentation/userspace-api/ioctl/ioctl-number.rst |   2 +
 arch/powerpc/include/uapi/asm/papr-vpd.h           |  22 +
 arch/powerpc/platforms/pseries/Makefile            |   1 +
 arch/powerpc/platforms/pseries/papr-vpd.c          | 522 +++++++++++++++++++++
 4 files changed, 547 insertions(+)

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
index 000000000000..b62e4f897a70
--- /dev/null
+++ b/arch/powerpc/include/uapi/asm/papr-vpd.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _UAPI_PAPR_VPD_H_
+#define _UAPI_PAPR_VPD_H_
+
+#include <asm/ioctl.h>
+#include <asm/papr-miscdev.h>
+
+struct papr_location_code {
+	/*
+	 * PAPR+ 12.3.2.4 Converged Location Code Rules - Length
+	 * Restrictions. 79 characters plus nul.
+	 */
+	char str[80];
+};
+
+/*
+ * ioctl for /dev/papr-vpd. Returns a VPD handle fd corresponding to
+ * the location code.
+ */
+#define PAPR_VPD_IOC_CREATE_HANDLE _IOW(PAPR_MISCDEV_IOC_ID, 0, struct papr_location_code)
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
index 000000000000..dd3e702d6a88
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/papr-vpd.c
@@ -0,0 +1,522 @@
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
+#include <linux/miscdevice.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+#include <linux/string_helpers.h>
+#include <asm/machdep.h>
+#include <asm/papr-vpd.h>
+#include <asm/rtas-work-area.h>
+#include <asm/rtas.h>
+#include <uapi/asm/papr-vpd.h>
+
+/**
+ * struct rtas_ibm_get_vpd_params - Parameters (in and out) for ibm,get-vpd.
+ * @loc_code:  In: Caller-provided location code buffer. Must be RTAS-addressable.
+ * @work_area: In: Caller-provided work area buffer for results.
+ * @sequence:  In: Sequence number. Out: Next sequence number.
+ * @written:   Out: Bytes written by ibm,get-vpd to @work_area.
+ * @status:    Out: RTAS call status.
+ */
+struct rtas_ibm_get_vpd_params {
+	const struct papr_location_code *loc_code;
+	struct rtas_work_area *work_area;
+	u32 sequence;
+	u32 written;
+	s32 status;
+};
+
+/**
+ * rtas_ibm_get_vpd() - Call ibm,get-vpd to fill a work area buffer.
+ * @params: See &struct rtas_ibm_get_vpd_params.
+ *
+ * Calls ibm,get-vpd until it errors or successfully deposits data
+ * into the supplied work area. Handles RTAS retry statuses. Maps RTAS
+ * error statuses to reasonable errno values.
+ *
+ * The caller is expected to invoke rtas_ibm_get_vpd() multiple times
+ * to retrieve all the VPD for the provided location code. Only one
+ * sequence should be in progress at any time; starting a new sequence
+ * will disrupt any sequence already in progress. Serialization of VPD
+ * retrieval sequences is the responsibility of the caller.
+ *
+ * The caller should inspect @params.status to determine whether more
+ * calls are needed to complete the sequence.
+ *
+ * Context: May sleep.
+ * Return: -ve on error, 0 otherwise.
+ */
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
+/*
+ * Internal VPD "blob" APIs for accumulating ibm,get-vpd results into
+ * an immutable buffer to be attached to a file descriptor.
+ */
+struct vpd_blob {
+	const char *data;
+	size_t len;
+};
+
+static bool vpd_blob_has_data(const struct vpd_blob *blob)
+{
+	return blob->data && blob->len;
+}
+
+static void vpd_blob_free(const struct vpd_blob *blob)
+{
+	if (blob) {
+		kvfree(blob->data);
+		kfree(blob);
+	}
+}
+
+/**
+ * vpd_blob_extend() - Append data to a &struct vpd_blob.
+ * @blob: The blob to extend.
+ * @data: The new data to append to @blob.
+ * @len:  The length of @data.
+ *
+ * Context: May sleep.
+ * Return: -ENOMEM on allocation failure, 0 otherwise.
+ */
+static int vpd_blob_extend(struct vpd_blob *blob, const char *data, size_t len)
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
+ * vpd_blob_generate() - Construct a new &struct vpd_blob.
+ * @generator: Function that supplies the blob data.
+ * @arg:       Context pointer supplied by caller, passed to @generator.
+ *
+ * The @generator callback is invoked until it returns NULL. @arg is
+ * passed to @generator in its first argument on each call. When
+ * @generator returns data, it should store the data length in its
+ * second argument.
+ *
+ * Context: May sleep.
+ * Return: A completely populated &struct vpd_blob, or NULL on error.
+ */
+static const struct vpd_blob *
+vpd_blob_generate(const char * (*generator)(void *, size_t *), void *arg)
+{
+	struct vpd_blob *blob;
+	const char *buf;
+	size_t len;
+	int err = 0;
+
+	blob  = kzalloc(sizeof(*blob), GFP_KERNEL_ACCOUNT);
+	if (!blob)
+		return NULL;
+
+	while (err == 0 && (buf = generator(arg, &len)))
+		err = vpd_blob_extend(blob, buf, len);
+
+	if (err != 0 || !vpd_blob_has_data(blob))
+		goto free_blob;
+
+	return blob;
+free_blob:
+	vpd_blob_free(blob);
+	return NULL;
+}
+
+/*
+ * Internal VPD sequence APIs. A VPD sequence is a series of calls to
+ * ibm,get-vpd for a given location code. The sequence ends when an
+ * error is encountered or all VPD for the location code has been
+ * returned.
+ */
+
+/**
+ * struct vpd_sequence - State for managing a VPD sequence.
+ * @error:  Shall be zero as long as the sequence has not encountered an error,
+ *          -ve errno otherwise. Use vpd_sequence_set_err() to update this.
+ * @params: Parameter block to pass to rtas_ibm_get_vpd().
+ */
+struct vpd_sequence {
+	int error;
+	struct rtas_ibm_get_vpd_params params;
+};
+
+/**
+ * vpd_sequence_begin() - Begin a VPD retrieval sequence.
+ * @seq:      Uninitialized sequence state.
+ * @loc_code: Location code that defines the scope of the VPD to return.
+ *
+ * Initializes @seq with the resources necessary to carry out a VPD
+ * sequence. Callers must pass @seq to vpd_sequence_end() regardless
+ * of whether the sequence succeeds.
+ *
+ * Context: May sleep.
+ */
+static void vpd_sequence_begin(struct vpd_sequence *seq,
+			       const struct papr_location_code *loc_code)
+{
+	/*
+	 * Use a static data structure for the location code passed to
+	 * RTAS to ensure it's in the RMA and avoid a separate work
+	 * area allocation. Guarded by the function lock.
+	 */
+	static struct papr_location_code static_loc_code;
+
+	/*
+	 * We could allocate the work area before acquiring the
+	 * function lock, but that would allow concurrent requests to
+	 * exhaust the limited work area pool for no benefit. So
+	 * allocate the work area under the lock.
+	 */
+	rtas_function_lock(RTAS_FN_IBM_GET_VPD);
+	static_loc_code = *loc_code;
+	*seq = (struct vpd_sequence) {
+		.params = {
+			.work_area = rtas_work_area_alloc(SZ_4K),
+			.loc_code = &static_loc_code,
+			.sequence = 1,
+		},
+	};
+}
+
+/**
+ * vpd_sequence_end() - Finalize a VPD retrieval sequence.
+ * @seq: Sequence state.
+ *
+ * Releases resources obtained by vpd_sequence_begin().
+ */
+static void vpd_sequence_end(struct vpd_sequence *seq)
+{
+	rtas_work_area_free(seq->params.work_area);
+	rtas_function_unlock(RTAS_FN_IBM_GET_VPD);
+}
+
+/**
+ * vpd_sequence_should_stop() - Determine whether a VPD retrieval sequence
+ *                              should continue.
+ * @seq: VPD sequence state.
+ *
+ * Examines the sequence error state and outputs of the last call to
+ * ibm,get-vpd to determine whether the sequence in progress should
+ * continue or stop.
+ *
+ * Return: True if the sequence has encountered an error or if all VPD for
+ *         this sequence has been retrieved. False otherwise.
+ */
+static bool vpd_sequence_should_stop(const struct vpd_sequence *seq)
+{
+	bool done;
+
+	if (seq->error)
+		return true;
+
+	switch (seq->params.status) {
+	case 0:
+		if (seq->params.written == 0)
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
+static int vpd_sequence_set_err(struct vpd_sequence *seq, int err)
+{
+	/* Preserve the first error recorded. */
+	if (seq->error == 0)
+		seq->error = err;
+
+	return seq->error;
+}
+
+/*
+ * Generator function to be passed to vpd_blob_generate().
+ */
+static const char *vpd_sequence_fill_work_area(void *arg, size_t *len)
+{
+	struct vpd_sequence *seq = arg;
+	struct rtas_ibm_get_vpd_params *p = &seq->params;
+
+	if (vpd_sequence_should_stop(seq))
+		return NULL;
+	if (vpd_sequence_set_err(seq, rtas_ibm_get_vpd(p)))
+		return NULL;
+	*len = p->written;
+	return rtas_work_area_raw_buf(p->work_area);
+}
+
+/*
+ * Higher-level VPD retrieval code below. These functions use the
+ * vpd_blob_* and vpd_sequence_* APIs defined above to create fd-based
+ * VPD handles for consumption by user space.
+ */
+
+/**
+ * papr_vpd_run_sequence() - Run a single VPD retrieval sequence.
+ * @loc_code: Location code that defines the scope of VPD to return.
+ *
+ * Context: May sleep. Holds a mutex and an RTAS work area for its
+ *          duration. Typically performs multiple sleepable slab
+ *          allocations.
+ *
+ * Return: A populated &struct vpd_blob on success. Encoded error
+ * pointer otherwise.
+ */
+static const struct vpd_blob *papr_vpd_run_sequence(const struct papr_location_code *loc_code)
+{
+	const struct vpd_blob *blob;
+	struct vpd_sequence seq;
+
+	vpd_sequence_begin(&seq, loc_code);
+	blob = vpd_blob_generate(vpd_sequence_fill_work_area, &seq);
+	if (!blob)
+		vpd_sequence_set_err(&seq, -ENOMEM);
+	vpd_sequence_end(&seq);
+
+	if (seq.error) {
+		vpd_blob_free(blob);
+		return ERR_PTR(seq.error);
+	}
+
+	return blob;
+}
+
+/**
+ * papr_vpd_retrieve() - Return the VPD for a location code.
+ * @loc_code: Location code that defines the scope of VPD to return.
+ *
+ * Run VPD sequences against @loc_code until a blob is successfully
+ * instantiated, or a hard error is encountered, or a fatal signal is
+ * pending.
+ *
+ * Context: May sleep.
+ * Return: A fully populated VPD blob when successful. Encoded error
+ * pointer otherwise.
+ */
+static const struct vpd_blob *papr_vpd_retrieve(const struct papr_location_code *loc_code)
+{
+	const struct vpd_blob *blob;
+
+	/*
+	 * EAGAIN means the sequence errored with a -4 (VPD changed)
+	 * status from ibm,get-vpd, and we should attempt a new
+	 * sequence. PAPR+ R1–7.3.20–5 indicates that this should be a
+	 * transient condition, not something that happens
+	 * continuously. But we'll stop trying on a fatal signal.
+	 */
+	do {
+		blob = papr_vpd_run_sequence(loc_code);
+		if (!IS_ERR(blob)) /* Success. */
+			break;
+		if (PTR_ERR(blob) != -EAGAIN) /* Hard error. */
+			break;
+		pr_info_ratelimited("VPD changed during retrieval, retrying\n");
+		cond_resched();
+	} while (!fatal_signal_pending(current));
+
+	return blob;
+}
+
+static ssize_t papr_vpd_handle_read(struct file *file, char __user *buf, size_t size, loff_t *off)
+{
+	const struct vpd_blob *blob = file->private_data;
+
+	/* bug: we should not instantiate a handle without any data attached. */
+	if (!vpd_blob_has_data(blob)) {
+		pr_err_once("handle without data\n");
+		return -EIO;
+	}
+
+	return simple_read_from_buffer(buf, size, off, blob->data, blob->len);
+}
+
+static int papr_vpd_handle_release(struct inode *inode, struct file *file)
+{
+	const struct vpd_blob *blob = file->private_data;
+
+	vpd_blob_free(blob);
+
+	return 0;
+}
+
+static loff_t papr_vpd_handle_seek(struct file *file, loff_t off, int whence)
+{
+	const struct vpd_blob *blob = file->private_data;
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
+/**
+ * papr_vpd_create_handle() - Create a fd-based handle for reading VPD.
+ * @ulc: Location code in user memory; defines the scope of the VPD to retrieve.
+ *
+ * Handler for PAPR_VPD_IOC_CREATE_HANDLE ioctl command. Validates
+ * @ulc and instantiates a VPD "blob" for it. The blob is attached to
+ * a file descriptor for reading by user space. The memory associated
+ * with the blob is freed when the file is released.
+ *
+ * Return: The installed fd number if successful, -ve errno otherwise.
+ */
+static long papr_vpd_create_handle(struct papr_location_code __user *ulc)
+{
+	struct papr_location_code klc;
+	const struct vpd_blob *blob;
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
+				  (void *)blob, O_RDONLY);
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
+/*
+ * Top-level ioctl handler for /dev/papr-vpd.
+ */
+static long papr_vpd_dev_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
+{
+	void __user *argp = (__force void __user *)arg;
+	long ret;
+
+	switch (ioctl) {
+	case PAPR_VPD_IOC_CREATE_HANDLE:
+		ret = papr_vpd_create_handle(argp);
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

