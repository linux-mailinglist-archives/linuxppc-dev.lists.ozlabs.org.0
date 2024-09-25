Return-Path: <linuxppc-dev+bounces-1575-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BE98538C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Sep 2024 09:17:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XD7Nf0DfNz2yGD;
	Wed, 25 Sep 2024 17:17:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1727248673;
	cv=none; b=bNMqUlu2TN3ypJ8GLDDLZ9HZR/OeFDjecSNz3IM0N/ycMTRqsykE3vvVOHQxgy5qvYYdaH9dZ6gobIZili1yK4XP0JOsPjcywaf/pMDwAzFaaKTtEZtXFcZyFGvjL879chONqHdkLrdrbcBDMOJHmCQvcFb1GaOG/zQk2UX533Q+v9SQoBsfBFbbVwIaVJBUE9hJWroRCTjhqa6p+0TpIsrbtLCWcT3OhUn/DwLYEva8FKL6jO7JNcZo0InyHGJIvkLYVcMwy32PtFNdnFKm7gDXUjVfhPIL9xqBEga0Ap2ucXWte5MQlpSpJd2e+CPdUa2JFppg7hg/tqbRNkjHbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1727248673; c=relaxed/relaxed;
	bh=ZJGi1X3TsBahL4jIMRiHIe6UdbGP+jUOobNIxTaq+jE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MjWXc17fUWfhRYMfrVgZXLYYbNjyujqqzj76u2c0+GZxK7oLvVhRKm4XXHFKVECy2pyUVn2IElV6ZnlJ+uNSOqQxP4VdTTe3MdPVsI/DWOnf3RZ9RJMTBtchmtuVVrMN090wne10/04cRUXLcgvp5T2Vit/EkgIpHpELQ2tGFOdK2FzUy8bl3rUe9swJ5gx5xzOl3ZDN23UwLjkmiBPXUTq9dQK6doW2S0ESY94g7DpUl61Lw7UqVFe5UCp4RbSL/qzRNQYwE8U1GcownUU2vpRaZjZ2PWmfqU9ed46rG0BFYamIAyl4+W2ZuYEaaXIpbrvkYdsSYi60K3bUNrmd8A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XD7Nd1Yjhz2y7J
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Sep 2024 17:17:52 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 69C7D1A0308;
	Wed, 25 Sep 2024 09:17:50 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 0792B1A062B;
	Wed, 25 Sep 2024 09:17:50 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 5A782183AD46;
	Wed, 25 Sep 2024 15:17:48 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: vkoul@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 1/7] ALSA: compress_offload: introduce accel operation mode
Date: Wed, 25 Sep 2024 14:55:10 +0800
Message-Id: <1727247316-16156-2-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
References: <1727247316-16156-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: ClamAV using ClamSMTP

From: Jaroslav Kysela <perex@perex.cz>

There is a requirement to expose the audio hardware that accelerates
various tasks for user space such as sample rate converters, compressed
stream decoders, etc.

This is description for the API extension for the compress ALSA API which
is able to handle "tasks" that are not bound to real-time operations
and allows for the serialization of operations.

For details, refer to "compress-accel.rst" document.

Cc: Mark Brown <broonie@kernel.org>
Cc: Shengjiu Wang <shengjiu.wang@gmail.com>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>
Cc: Amadeusz Sławiński <amadeuszx.slawinski@linux.intel.com>
Cc: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Cc: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 .../sound/designs/compress-accel.rst          | 136 +++++++
 include/sound/compress_driver.h               |  46 +++
 include/uapi/sound/compress_offload.h         |  63 +++-
 sound/core/Kconfig                            |   3 +
 sound/core/compress_offload.c                 | 351 +++++++++++++++++-
 5 files changed, 591 insertions(+), 8 deletions(-)
 create mode 100644 Documentation/sound/designs/compress-accel.rst

diff --git a/Documentation/sound/designs/compress-accel.rst b/Documentation/sound/designs/compress-accel.rst
new file mode 100644
index 000000000000..cfe4fa645ab2
--- /dev/null
+++ b/Documentation/sound/designs/compress-accel.rst
@@ -0,0 +1,136 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+==================================
+ALSA Co-processor Acceleration API
+==================================
+
+Jaroslav Kysela <perex@perex.cz>
+
+
+Overview
+========
+
+There is a requirement to expose the audio hardware that accelerates various
+tasks for user space such as sample rate converters, compressed
+stream decoders, etc.
+
+This is description for the API extension for the compress ALSA API which
+is able to handle "tasks" that are not bound to real-time operations
+and allows for the serialization of operations.
+
+Requirements
+============
+
+The main requirements are:
+
+- serialization of multiple tasks for user space to allow multiple
+  operations without user space intervention
+
+- separate buffers (input + output) for each operation
+
+- expose buffers using mmap to user space
+
+- signal user space when the task is finished (standard poll mechanism)
+
+Design
+======
+
+A new direction SND_COMPRESS_ACCEL is introduced to identify
+the passthrough API.
+
+The API extension shares device enumeration and parameters handling from
+the main compressed API. All other realtime streaming ioctls are deactivated
+and a new set of task related ioctls are introduced. The standard
+read/write/mmap I/O operations are not supported in the passthrough device.
+
+Device ("stream") state handling is reduced to OPEN/SETUP. All other
+states are not available for the passthrough mode.
+
+Data I/O mechanism is using standard dma-buf interface with all advantages
+like mmap, standard I/O, buffer sharing etc. One buffer is used for the
+input data and second (separate) buffer is used for the output data. Each task
+have separate I/O buffers.
+
+For the buffering parameters, the fragments means a limit of allocated tasks
+for given device. The fragment_size limits the input buffer size for the given
+device. The output buffer size is determined by the driver (may be different
+from the input buffer size).
+
+State Machine
+=============
+
+The passthrough audio stream state machine is described below :
+
+                                       +----------+
+                                       |          |
+                                       |   OPEN   |
+                                       |          |
+                                       +----------+
+                                             |
+                                             |
+                                             | compr_set_params()
+                                             |
+                                             v
+         all passthrough task ops      +----------+
+  +------------------------------------|          |
+  |                                    |   SETUP  |
+  |                                    |
+  |                                    +----------+
+  |                                          |
+  +------------------------------------------+
+
+
+Passthrough operations (ioctls)
+===============================
+
+All operations are protected using stream->device->lock (mutex).
+
+CREATE
+------
+Creates a set of input/output buffers. The input buffer size is
+fragment_size. Allocates unique seqno.
+
+The hardware drivers allocate internal 'struct dma_buf' for both input and
+output buffers (using 'dma_buf_export()' function). The anonymous
+file descriptors for those buffers are passed to user space.
+
+FREE
+----
+Free a set of input/output buffers. If a task is active, the stop
+operation is executed before. If seqno is zero, operation is executed for all
+tasks.
+
+START
+-----
+Starts (queues) a task. There are two cases of the task start - right after
+the task is created. In this case, origin_seqno must be zero.
+The second case is for reusing of already finished task. The origin_seqno
+must identify the task to be reused. In both cases, a new seqno value
+is allocated and returned to user space.
+
+The prerequisite is that application filled input dma buffer with
+new source data and set input_size to pass the real data size to the driver.
+
+The order of data processing is preserved (first started job must be
+finished at first).
+
+If the multiple tasks require a state handling (e.g. resampling operation),
+the user space may set SND_COMPRESS_TFLG_NEW_STREAM flag to mark the
+start of the new stream data. It is useful to keep the allocated buffers
+for the new operation rather using open/close mechanism.
+
+STOP
+----
+Stop (dequeues) a task. If seqno is zero, operation is executed for all
+tasks.
+
+STATUS
+------
+Obtain the task status (active, finished). Also, the driver will set
+the real output data size (valid area in the output buffer).
+
+Credits
+=======
+- Shengjiu Wang <shengjiu.wang@gmail.com>
+- Takashi Iwai <tiwai@suse.de>
+- Vinod Koul <vkoul@kernel.org>
diff --git a/include/sound/compress_driver.h b/include/sound/compress_driver.h
index bcf872c17dd3..66fd54dd36e2 100644
--- a/include/sound/compress_driver.h
+++ b/include/sound/compress_driver.h
@@ -19,6 +19,30 @@
 
 struct snd_compr_ops;
 
+/**
+ * struct snd_compr_task_runtime: task runtime description
+ * @list: list of all managed tasks
+ * @input: input DMA buffer
+ * @output: output DMA buffer
+ * @seqno: sequence number
+ * @input_size: really used data in the input buffer
+ * @output_size: really used data in the output buffer
+ * @flags: see SND_COMPRESS_TFLG_*
+ * @state: actual task state
+ * @private_value: used by the lowlevel driver (opaque)
+ */
+struct snd_compr_task_runtime {
+	struct list_head list;
+	struct dma_buf *input;
+	struct dma_buf *output;
+	u64 seqno;
+	u64 input_size;
+	u64 output_size;
+	u32 flags;
+	u8 state;
+	void *private_value;
+};
+
 /**
  * struct snd_compr_runtime: runtime stream description
  * @state: stream state
@@ -37,6 +61,10 @@ struct snd_compr_ops;
  * @dma_addr: physical buffer address (not accessible from main CPU)
  * @dma_bytes: size of DMA area
  * @dma_buffer_p: runtime dma buffer pointer
+ * @active_tasks: count of active tasks
+ * @total_tasks: count of all tasks
+ * @task_seqno: last task sequence number (!= 0)
+ * @tasks: list of all tasks
  */
 struct snd_compr_runtime {
 	snd_pcm_state_t state;
@@ -54,6 +82,13 @@ struct snd_compr_runtime {
 	dma_addr_t dma_addr;
 	size_t dma_bytes;
 	struct snd_dma_buffer *dma_buffer_p;
+
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	u32 active_tasks;
+	u32 total_tasks;
+	u64 task_seqno;
+	struct list_head tasks;
+#endif
 };
 
 /**
@@ -132,6 +167,12 @@ struct snd_compr_ops {
 			struct snd_compr_caps *caps);
 	int (*get_codec_caps) (struct snd_compr_stream *stream,
 			struct snd_compr_codec_caps *codec);
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	int (*task_create)(struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_start)(struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_stop)(struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+	int (*task_free)(struct snd_compr_stream *stream, struct snd_compr_task_runtime *task);
+#endif
 };
 
 /**
@@ -242,4 +283,9 @@ int snd_compr_free_pages(struct snd_compr_stream *stream);
 int snd_compr_stop_error(struct snd_compr_stream *stream,
 			 snd_pcm_state_t state);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+void snd_compr_task_finished(struct snd_compr_stream *stream,
+			     struct snd_compr_task_runtime *task);
+#endif
+
 #endif
diff --git a/include/uapi/sound/compress_offload.h b/include/uapi/sound/compress_offload.h
index d185957f3fe0..0a41173c77f2 100644
--- a/include/uapi/sound/compress_offload.h
+++ b/include/uapi/sound/compress_offload.h
@@ -14,7 +14,7 @@
 #include <sound/compress_params.h>
 
 
-#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 2, 0)
+#define SNDRV_COMPRESS_VERSION SNDRV_PROTOCOL_VERSION(0, 3, 0)
 /**
  * struct snd_compressed_buffer - compressed buffer
  * @fragment_size: size of buffer fragment in bytes
@@ -68,7 +68,8 @@ struct snd_compr_avail {
 
 enum snd_compr_direction {
 	SND_COMPRESS_PLAYBACK = 0,
-	SND_COMPRESS_CAPTURE
+	SND_COMPRESS_CAPTURE,
+	SND_COMPRESS_ACCEL
 };
 
 /**
@@ -127,6 +128,57 @@ struct snd_compr_metadata {
 	 __u32 value[8];
 } __attribute__((packed, aligned(4)));
 
+/* flags for struct snd_compr_task */
+#define SND_COMPRESS_TFLG_NEW_STREAM		(1 << 0)	/* mark for the new stream data */
+
+/**
+ * struct snd_compr_task - task primitive for non-realtime operation
+ * @seqno: sequence number (task identifier)
+ * @origin_seqno: previous sequence number (task identifier) - for reuse
+ * @input_fd: data input file descriptor (dma-buf)
+ * @output_fd: data output file descriptor (dma-buf)
+ * @input_size: filled data in bytes (from caller, must not exceed fragment size)
+ * @flags: see SND_COMPRESS_TFLG_* defines
+ */
+struct snd_compr_task {
+	__u64 seqno;
+	__u64 origin_seqno;
+	int input_fd;
+	int output_fd;
+	__u64 input_size;
+	__u32 flags;
+	__u8 reserved[16];
+} __attribute__((packed, aligned(4)));
+
+/**
+ * enum snd_compr_state - task state
+ * @SND_COMPRESS_TASK_STATE_IDLE: task is not queued
+ * @SND_COMPRESS_TASK_STATE_ACTIVE: task is in the queue
+ * @SND_COMPRESS_TASK_STATE_FINISHED: task was processed, output is available
+ */
+enum snd_compr_state {
+	SND_COMPRESS_TASK_STATE_IDLE = 0,
+	SND_COMPRESS_TASK_STATE_ACTIVE,
+	SND_COMPRESS_TASK_STATE_FINISHED
+};
+
+/**
+ * struct snd_compr_task_status - task status
+ * @seqno: sequence number (task identifier)
+ * @input_size: filled data in bytes (from user space)
+ * @output_size: filled data in bytes (from driver)
+ * @output_flags: reserved for future (all zeros - from driver)
+ * @state: actual task state (SND_COMPRESS_TASK_STATE_*)
+ */
+struct snd_compr_task_status {
+	__u64 seqno;
+	__u64 input_size;
+	__u64 output_size;
+	__u32 output_flags;
+	__u8 state;
+	__u8 reserved[15];
+} __attribute__((packed, aligned(4)));
+
 /*
  * compress path ioctl definitions
  * SNDRV_COMPRESS_GET_CAPS: Query capability of DSP
@@ -164,6 +216,13 @@ struct snd_compr_metadata {
 #define SNDRV_COMPRESS_DRAIN		_IO('C', 0x34)
 #define SNDRV_COMPRESS_NEXT_TRACK	_IO('C', 0x35)
 #define SNDRV_COMPRESS_PARTIAL_DRAIN	_IO('C', 0x36)
+
+#define SNDRV_COMPRESS_TASK_CREATE	_IOWR('C', 0x60, struct snd_compr_task)
+#define SNDRV_COMPRESS_TASK_FREE	_IOW('C', 0x61, __u64)
+#define SNDRV_COMPRESS_TASK_START	_IOWR('C', 0x62, struct snd_compr_task)
+#define SNDRV_COMPRESS_TASK_STOP	_IOW('C', 0x63, __u64)
+#define SNDRV_COMPRESS_TASK_STATUS	_IOWR('C', 0x68, struct snd_compr_task_status)
+
 /*
  * TODO
  * 1. add mmap support
diff --git a/sound/core/Kconfig b/sound/core/Kconfig
index 2c5b9f964703..48db44fa56fe 100644
--- a/sound/core/Kconfig
+++ b/sound/core/Kconfig
@@ -59,6 +59,9 @@ config SND_CORE_TEST
 config SND_COMPRESS_OFFLOAD
 	tristate
 
+config SND_COMPRESS_ACCEL
+	bool
+
 config SND_JACK
 	bool
 
diff --git a/sound/core/compress_offload.c b/sound/core/compress_offload.c
index b8c0d6edbdd1..2dbb12a5c91b 100644
--- a/sound/core/compress_offload.c
+++ b/sound/core/compress_offload.c
@@ -24,6 +24,7 @@
 #include <linux/types.h>
 #include <linux/uio.h>
 #include <linux/uaccess.h>
+#include <linux/dma-buf.h>
 #include <linux/module.h>
 #include <linux/compat.h>
 #include <sound/core.h>
@@ -54,6 +55,12 @@ struct snd_compr_file {
 
 static void error_delayed_work(struct work_struct *work);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+static void snd_compr_task_free_all(struct snd_compr_stream *stream);
+#else
+static inline void snd_compr_task_free_all(struct snd_compr_stream *stream) { }
+#endif
+
 /*
  * a note on stream states used:
  * we use following states in the compressed core
@@ -85,6 +92,8 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 		dirn = SND_COMPRESS_PLAYBACK;
 	else if ((f->f_flags & O_ACCMODE) == O_RDONLY)
 		dirn = SND_COMPRESS_CAPTURE;
+	else if ((f->f_flags & O_ACCMODE) == O_RDWR)
+		dirn = SND_COMPRESS_ACCEL;
 	else
 		return -EINVAL;
 
@@ -125,6 +134,9 @@ static int snd_compr_open(struct inode *inode, struct file *f)
 	}
 	runtime->state = SNDRV_PCM_STATE_OPEN;
 	init_waitqueue_head(&runtime->sleep);
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	INIT_LIST_HEAD(&runtime->tasks);
+#endif
 	data->stream.runtime = runtime;
 	f->private_data = (void *)data;
 	scoped_guard(mutex, &compr->lock)
@@ -154,6 +166,8 @@ static int snd_compr_free(struct inode *inode, struct file *f)
 		break;
 	}
 
+	snd_compr_task_free_all(&data->stream);
+
 	data->stream.ops->free(&data->stream);
 	if (!data->stream.runtime->dma_buffer_p)
 		kfree(data->stream.runtime->buffer);
@@ -226,6 +240,9 @@ snd_compr_ioctl_avail(struct snd_compr_stream *stream, unsigned long arg)
 	struct snd_compr_avail ioctl_avail;
 	size_t avail;
 
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		return -EBADFD;
+
 	avail = snd_compr_calc_avail(stream, &ioctl_avail);
 	ioctl_avail.avail = avail;
 
@@ -287,6 +304,8 @@ static ssize_t snd_compr_write(struct file *f, const char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		return -EBADFD;
 	guard(mutex)(&stream->device->lock);
 	/* write is allowed when stream is running or has been steup */
 	switch (stream->runtime->state) {
@@ -336,6 +355,8 @@ static ssize_t snd_compr_read(struct file *f, char __user *buf,
 		return -EFAULT;
 
 	stream = &data->stream;
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		return -EBADFD;
 	guard(mutex)(&stream->device->lock);
 
 	/* read is allowed when stream is running, paused, draining and setup
@@ -385,6 +406,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 {
 	struct snd_compr_file *data = f->private_data;
 	struct snd_compr_stream *stream;
+	struct snd_compr_runtime *runtime;
 	size_t avail;
 	__poll_t retval = 0;
 
@@ -392,6 +414,7 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 		return EPOLLERR;
 
 	stream = &data->stream;
+	runtime = stream->runtime;
 
 	guard(mutex)(&stream->device->lock);
 
@@ -405,6 +428,21 @@ static __poll_t snd_compr_poll(struct file *f, poll_table *wait)
 
 	poll_wait(f, &stream->runtime->sleep, wait);
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	if (stream->direction == SND_COMPRESS_ACCEL) {
+		struct snd_compr_task_runtime *task;
+
+		if (runtime->fragments > runtime->active_tasks)
+			retval |= EPOLLOUT | EPOLLWRNORM;
+		task = list_first_entry_or_null(&runtime->tasks,
+						struct snd_compr_task_runtime,
+						list);
+		if (task && task->state == SND_COMPRESS_TASK_STATE_FINISHED)
+			retval |= EPOLLIN | EPOLLRDNORM;
+		return retval;
+	}
+#endif
+
 	avail = snd_compr_get_avail(stream);
 	pr_debug("avail is %ld\n", (unsigned long)avail);
 	/* check if we have at least one fragment to fill */
@@ -521,6 +559,9 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 	unsigned int buffer_size;
 	void *buffer = NULL;
 
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		goto params;
+
 	buffer_size = params->buffer.fragment_size * params->buffer.fragments;
 	if (stream->ops->copy) {
 		buffer = NULL;
@@ -543,18 +584,30 @@ static int snd_compr_allocate_buffer(struct snd_compr_stream *stream,
 		if (!buffer)
 			return -ENOMEM;
 	}
-	stream->runtime->fragment_size = params->buffer.fragment_size;
-	stream->runtime->fragments = params->buffer.fragments;
+
 	stream->runtime->buffer = buffer;
 	stream->runtime->buffer_size = buffer_size;
+params:
+	stream->runtime->fragment_size = params->buffer.fragment_size;
+	stream->runtime->fragments = params->buffer.fragments;
 	return 0;
 }
 
-static int snd_compress_check_input(struct snd_compr_params *params)
+static int
+snd_compress_check_input(struct snd_compr_stream *stream, struct snd_compr_params *params)
 {
+	u32 max_fragments;
+
 	/* first let's check the buffer parameter's */
-	if (params->buffer.fragment_size == 0 ||
-	    params->buffer.fragments > U32_MAX / params->buffer.fragment_size ||
+	if (params->buffer.fragment_size == 0)
+		return -EINVAL;
+
+	if (stream->direction == SND_COMPRESS_ACCEL)
+		max_fragments = 64;			/* safe value */
+	else
+		max_fragments = U32_MAX / params->buffer.fragment_size;
+
+	if (params->buffer.fragments > max_fragments ||
 	    params->buffer.fragments == 0)
 		return -EINVAL;
 
@@ -583,7 +636,7 @@ snd_compr_set_params(struct snd_compr_stream *stream, unsigned long arg)
 		if (IS_ERR(params))
 			return PTR_ERR(params);
 
-		retval = snd_compress_check_input(params);
+		retval = snd_compress_check_input(stream, params);
 		if (retval)
 			return retval;
 
@@ -939,6 +992,266 @@ static int snd_compr_partial_drain(struct snd_compr_stream *stream)
 	return snd_compress_wait_for_drain(stream);
 }
 
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+
+static struct snd_compr_task_runtime *
+snd_compr_find_task(struct snd_compr_stream *stream, __u64 seqno)
+{
+	struct snd_compr_task_runtime *task;
+
+	list_for_each_entry(task, &stream->runtime->tasks, list) {
+		if (task->seqno == seqno)
+			return task;
+	}
+	return NULL;
+}
+
+static void snd_compr_task_free(struct snd_compr_task_runtime *task)
+{
+	if (task->output)
+		dma_buf_put(task->output);
+	if (task->input)
+		dma_buf_put(task->input);
+	kfree(task);
+}
+
+static u64 snd_compr_seqno_next(struct snd_compr_stream *stream)
+{
+	u64 seqno = ++stream->runtime->task_seqno;
+
+	if (seqno == 0)
+		seqno = ++stream->runtime->task_seqno;
+	return seqno;
+}
+
+static int snd_compr_task_new(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+{
+	struct snd_compr_task_runtime *task;
+	int retval;
+
+	if (stream->runtime->total_tasks >= stream->runtime->fragments)
+		return -EBUSY;
+	if (utask->origin_seqno != 0 || utask->input_size != 0)
+		return -EINVAL;
+	task = kzalloc(sizeof(*task), GFP_KERNEL);
+	if (!task)
+		return -ENOMEM;
+	utask->seqno = snd_compr_seqno_next(stream);
+	task->seqno = utask->seqno;
+	task->input_size = utask->input_size;
+	retval = stream->ops->task_create(stream, task);
+	if (retval < 0)
+		goto cleanup;
+	utask->input_fd = dma_buf_fd(task->input, O_WRONLY | O_CLOEXEC);
+	if (utask->input_fd < 0) {
+		retval = utask->input_fd;
+		goto cleanup;
+	}
+	utask->output_fd = dma_buf_fd(task->output, O_RDONLY | O_CLOEXEC);
+	if (utask->output_fd < 0) {
+		retval = utask->output_fd;
+		goto cleanup;
+	}
+	/* keep dmabuf reference until freed with task free ioctl */
+	dma_buf_get(utask->input_fd);
+	dma_buf_get(utask->output_fd);
+	list_add_tail(&task->list, &stream->runtime->tasks);
+	stream->runtime->total_tasks++;
+	return 0;
+cleanup:
+	snd_compr_task_free(task);
+	return retval;
+}
+
+static int snd_compr_task_create(struct snd_compr_stream *stream, unsigned long arg)
+{
+	struct snd_compr_task *task __free(kfree) = NULL;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	task = memdup_user((void __user *)arg, sizeof(*task));
+	if (IS_ERR(task))
+		return PTR_ERR(no_free_ptr(task));
+	retval = snd_compr_task_new(stream, task);
+	if (retval >= 0)
+		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
+			retval = -EFAULT;
+	return retval;
+}
+
+static int snd_compr_task_start_prepare(struct snd_compr_task_runtime *task,
+					struct snd_compr_task *utask)
+{
+	if (!task)
+		return -EINVAL;
+	if (task->state >= SND_COMPRESS_TASK_STATE_FINISHED)
+		return -EBUSY;
+	if (utask->input_size > task->input->size)
+		return -EINVAL;
+	task->flags = utask->flags;
+	task->input_size = utask->input_size;
+	task->state = SND_COMPRESS_TASK_STATE_IDLE;
+	return 0;
+}
+
+static int snd_compr_task_start(struct snd_compr_stream *stream, struct snd_compr_task *utask)
+{
+	struct snd_compr_task_runtime *task;
+	int retval;
+
+	if (utask->origin_seqno > 0) {
+		task = snd_compr_find_task(stream, utask->origin_seqno);
+		retval = snd_compr_task_start_prepare(task, utask);
+		if (retval < 0)
+			return retval;
+		utask->seqno = snd_compr_seqno_next(stream);
+		task->seqno = utask->seqno;
+		utask->origin_seqno = 0;
+		list_move_tail(&task->list, &stream->runtime->tasks);
+	} else {
+		task = snd_compr_find_task(stream, utask->seqno);
+		if (task && task->state != SND_COMPRESS_TASK_STATE_IDLE)
+			return -EBUSY;
+		retval = snd_compr_task_start_prepare(task, utask);
+		if (retval < 0)
+			return retval;
+	}
+	retval = stream->ops->task_start(stream, task);
+	if (retval >= 0) {
+		task->state = SND_COMPRESS_TASK_STATE_ACTIVE;
+		stream->runtime->active_tasks++;
+	}
+	return retval;
+}
+
+static int snd_compr_task_start_ioctl(struct snd_compr_stream *stream, unsigned long arg)
+{
+	struct snd_compr_task *task __free(kfree) = NULL;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	task = memdup_user((void __user *)arg, sizeof(*task));
+	if (IS_ERR(task))
+		return PTR_ERR(no_free_ptr(task));
+	retval = snd_compr_task_start(stream, task);
+	if (retval >= 0)
+		if (copy_to_user((void __user *)arg, task, sizeof(*task)))
+			retval = -EFAULT;
+	return retval;
+}
+
+static void snd_compr_task_stop_one(struct snd_compr_stream *stream,
+				    struct snd_compr_task_runtime *task)
+{
+	if (task->state != SND_COMPRESS_TASK_STATE_ACTIVE)
+		return;
+	stream->ops->task_stop(stream, task);
+	if (!snd_BUG_ON(stream->runtime->active_tasks == 0))
+		stream->runtime->active_tasks--;
+	list_move_tail(&task->list, &stream->runtime->tasks);
+	task->state = SND_COMPRESS_TASK_STATE_IDLE;
+}
+
+static void snd_compr_task_free_one(struct snd_compr_stream *stream,
+				    struct snd_compr_task_runtime *task)
+{
+	snd_compr_task_stop_one(stream, task);
+	stream->ops->task_free(stream, task);
+	list_del(&task->list);
+	snd_compr_task_free(task);
+	stream->runtime->total_tasks--;
+}
+
+static void snd_compr_task_free_all(struct snd_compr_stream *stream)
+{
+	struct snd_compr_task_runtime *task;
+
+	list_for_each_entry_reverse(task, &stream->runtime->tasks, list)
+		snd_compr_task_free_one(stream, task);
+}
+
+typedef void (*snd_compr_seq_func_t)(struct snd_compr_stream *stream,
+					struct snd_compr_task_runtime *task);
+
+static int snd_compr_task_seq(struct snd_compr_stream *stream, unsigned long arg,
+			      snd_compr_seq_func_t fcn)
+{
+	struct snd_compr_task_runtime *task;
+	__u64 seqno;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	retval = get_user(seqno, (__u64 __user *)arg);
+	if (retval < 0)
+		return retval;
+	retval = 0;
+	if (seqno == 0) {
+		list_for_each_entry_reverse(task, &stream->runtime->tasks, list)
+			fcn(stream, task);
+	} else {
+		task = snd_compr_find_task(stream, seqno);
+		if (!task)
+			retval = -EINVAL;
+		else
+			fcn(stream, task);
+	}
+	return retval;
+}
+
+static int snd_compr_task_status(struct snd_compr_stream *stream,
+				 struct snd_compr_task_status *status)
+{
+	struct snd_compr_task_runtime *task;
+
+	task = snd_compr_find_task(stream, status->seqno);
+	if (!task)
+		return -EINVAL;
+	status->input_size = task->input_size;
+	status->output_size = task->output_size;
+	status->state = task->state;
+	return 0;
+}
+
+static int snd_compr_task_status_ioctl(struct snd_compr_stream *stream, unsigned long arg)
+{
+	struct snd_compr_task_status *status __free(kfree) = NULL;
+	int retval;
+
+	if (stream->runtime->state != SNDRV_PCM_STATE_SETUP)
+		return -EPERM;
+	status = memdup_user((void __user *)arg, sizeof(*status));
+	if (IS_ERR(status))
+		return PTR_ERR(no_free_ptr(status));
+	retval = snd_compr_task_status(stream, status);
+	if (retval >= 0)
+		if (copy_to_user((void __user *)arg, status, sizeof(*status)))
+			retval = -EFAULT;
+	return retval;
+}
+
+/**
+ * snd_compr_task_finished: Notify that the task was finished
+ * @stream: pointer to stream
+ * @task: runtime task structure
+ *
+ * Set the finished task state and notify waiters.
+ */
+void snd_compr_task_finished(struct snd_compr_stream *stream,
+			     struct snd_compr_task_runtime *task)
+{
+	guard(mutex)(&stream->device->lock);
+	if (!snd_BUG_ON(stream->runtime->active_tasks == 0))
+		stream->runtime->active_tasks--;
+	task->state = SND_COMPRESS_TASK_STATE_FINISHED;
+	wake_up(&stream->runtime->sleep);
+}
+EXPORT_SYMBOL_GPL(snd_compr_task_finished);
+
+#endif /* CONFIG_SND_COMPRESS_ACCEL */
+
 static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 {
 	struct snd_compr_file *data = f->private_data;
@@ -968,6 +1281,27 @@ static long snd_compr_ioctl(struct file *f, unsigned int cmd, unsigned long arg)
 		return snd_compr_set_metadata(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_GET_METADATA):
 		return snd_compr_get_metadata(stream, arg);
+	}
+
+	if (stream->direction == SND_COMPRESS_ACCEL) {
+#if IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+		switch (_IOC_NR(cmd)) {
+		case _IOC_NR(SNDRV_COMPRESS_TASK_CREATE):
+			return snd_compr_task_create(stream, arg);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_FREE):
+			return snd_compr_task_seq(stream, arg, snd_compr_task_free_one);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_START):
+			return snd_compr_task_start_ioctl(stream, arg);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_STOP):
+			return snd_compr_task_seq(stream, arg, snd_compr_task_stop_one);
+		case _IOC_NR(SNDRV_COMPRESS_TASK_STATUS):
+			return snd_compr_task_status_ioctl(stream, arg);
+		}
+#endif
+		return -ENOTTY;
+	}
+
+	switch (_IOC_NR(cmd)) {
 	case _IOC_NR(SNDRV_COMPRESS_TSTAMP):
 		return snd_compr_tstamp(stream, arg);
 	case _IOC_NR(SNDRV_COMPRESS_AVAIL):
@@ -1140,6 +1474,11 @@ int snd_compress_new(struct snd_card *card, int device,
 	};
 	int ret;
 
+#if !IS_ENABLED(CONFIG_SND_COMPRESS_ACCEL)
+	if (snd_BUG_ON(dirn == SND_COMPRESS_ACCEL))
+		return -EINVAL;
+#endif
+
 	compr->card = card;
 	compr->device = device;
 	compr->direction = dirn;
-- 
2.34.1


