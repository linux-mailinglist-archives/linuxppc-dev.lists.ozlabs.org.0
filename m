Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 132987E3814
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 10:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SPjzS6vC8z3ccf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Nov 2023 20:46:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=srs0=ghx7=gu=xs4all.nl=hverkuil@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SPjyz73w4z2yGF
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Nov 2023 20:46:19 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A51B86102A;
	Tue,  7 Nov 2023 09:46:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96834C43391;
	Tue,  7 Nov 2023 09:46:12 +0000 (UTC)
Message-ID: <a4d502be-42aa-43d1-b816-a2c545509d9f@xs4all.nl>
Date: Tue, 7 Nov 2023 10:46:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [RFC PATCH] v4l-utils: add support for v4l-audioX devices
Content-Language: en-US, nl
From: Hans Verkuil <hverkuil@xs4all.nl>
To: Shengjiu Wang <shengjiu.wang@nxp.com>, sakari.ailus@iki.fi,
 tfiga@chromium.org, m.szyprowski@samsung.com, mchehab@kernel.org,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 shengjiu.wang@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 nicoleotsuka@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org,
 linuxppc-dev@lists.ozlabs.org
References: <1698402948-10618-1-git-send-email-shengjiu.wang@nxp.com>
 <1698402948-10618-14-git-send-email-shengjiu.wang@nxp.com>
 <c7daf33d-9d6d-499e-b477-35176dbaca38@xs4all.nl>
 <0db3d822-9bfa-4efc-bf9d-3ae218b6815d@xs4all.nl>
Autocrypt: addr=hverkuil@xs4all.nl; keydata=
 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
In-Reply-To: <0db3d822-9bfa-4efc-bf9d-3ae218b6815d@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

This patch adds support for v4l-audio devices to v4l2-ctl, v4l2-compliance
and the test-media script.

This is RFC quality: when media controller support is added to the m2m audio
drivers, this patch will need to be updated. And it also need to be split into
smaller pieces, but I will wait with that until vim2m-audio uses the media
controller.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
diff --git a/contrib/test/test-media b/contrib/test/test-media
index afe20760..c2a71b89 100755
--- a/contrib/test/test-media
+++ b/contrib/test/test-media
@@ -7,6 +7,7 @@
 vidtv=0
 vivid=0
 vim2m=0
+vim2m_audio=0
 vimc=0
 vicodec=0
 cec=0
@@ -53,13 +54,14 @@ if [ -z "$1" ]; then
 	echo Test Targets:
 	echo "vivid: test the vivid driver"
 	echo "vim2m: test the vim2m driver"
+	echo "vim2m-audio: test the vim2m-audio driver"
 	echo "vimc: test the vimc driver"
 	echo "vicodec: test the vicodec driver"
 	echo "vidtv: test the vidtv driver"
 	echo "cec: adds the vivid CEC compliance tests, except for the CEC standby/wakeup tests."
 	echo "cec-pwr: adds the vivid CEC compliance tests, including the CEC standby/wakeup tests."
-	echo "all: equals 'vivid vim2m vimc vicodec vidtv cec cec-pwr'"
-	echo "mc: equals 'vivid vim2m vimc vicodec vidtv'"
+	echo "all: equals 'vivid vim2m vim2m-audio vimc vicodec vidtv cec cec-pwr'"
+	echo "mc: equals 'vivid vim2m vim2m-audio vimc vicodec vidtv'"
 	exit 0
 fi

@@ -116,6 +118,7 @@ while [ ! -z "$1" ]; do
 		vidtv=1
 		vivid=1
 		vim2m=1
+		vim2m_audio=1
 		vimc=1
 		vicodec=1
 		cec=1
@@ -124,6 +127,7 @@ while [ ! -z "$1" ]; do
 	mc)
 		vivid=1
 		vim2m=1
+		vim2m_audio=1
 		vimc=1
 		vicodec=1
 		vidtv=1
@@ -137,6 +141,9 @@ while [ ! -z "$1" ]; do
 	vim2m)
 		vim2m=1
 		;;
+	vim2m-audio)
+		vim2m_audio=1
+		;;
 	vimc)
 		vimc=1
 		;;
@@ -421,6 +428,83 @@ if [ $vim2m -eq 1 -a $setup -eq 0 ]; then
 	echo
 fi

+
+if [ $vim2m_audio -eq 1 ]; then
+	rmmod vim2m-audio 2&>/dev/null
+	modprobe vim2m-audio
+	sleep $modprobe_time
+	dmesg -n notice
+
+	if ! $v4l2_ctl -z platform:vim2m-audio ; then
+		echo "FAIL: the vim2m-audio module failed to load" | tee -a $tmp
+		echo "Grand Total for vim2m-audio: Succeeded: 0, Failed: 1, Warnings: 0" | tee -a $tmp
+		echo "Final Summary: 1, Succeeded: 0, Failed: 1, Warnings: 0"
+		rmmod vivid
+		exit 0
+	fi
+fi
+
+if [ $vim2m_audio -eq 1 -a $setup -eq 0 ]; then
+	echo
+	echo vim2m-audio compliance tests | tee /dev/kmsg
+	echo
+	date
+	stdbuf -oL $v4l2_compliance -A0 -z platform:vivid-002 -e vivid-002-vid-cap -s10 -P -a 2>&1 | tee -a $tmp
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo unbind vim2m-audio | tee /dev/kmsg
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/unbind
+	sleep $unbind_time
+	echo
+	echo rebind vim2m-audio | tee /dev/kmsg
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/bind
+	sleep 1
+	echo
+	echo second unbind vim2m-audio | tee /dev/kmsg
+	echo
+	for i in `$v4l2_ctl -z platform:vim2m-audio --list-devices`; do
+		let "t = 1 + $RANDOM / 4096"
+		echo $i: sleep ${t}s
+		sleep $t <$i &
+	done
+	sleep 1
+	echo
+	echo -n vim2m-audio.0 >/sys/bus/platform/drivers/vim2m-audio/unbind
+	sleep $reunbind_time
+	echo
+	echo rmmod vim2m-audio | tee /dev/kmsg
+	echo
+	rmmod vim2m-audio
+	sleep $rmmod_time
+	if [ $kmemleak -eq 1 ]; then
+		echo
+		echo kmemleak results for vim2m-audio:
+		echo
+		echo scan >/sys/kernel/debug/kmemleak
+		cat /sys/kernel/debug/kmemleak
+		echo
+		echo end of kmemleak results
+		echo clear >/sys/kernel/debug/kmemleak
+	fi
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+	echo
+fi
+
 if [ $vimc -eq 1 ]; then
 	rmmod vimc 2&>/dev/null
 	modprobe vimc
diff --git a/utils/common/cv4l-helpers.h b/utils/common/cv4l-helpers.h
index 91a04146..235368ec 100644
--- a/utils/common/cv4l-helpers.h
+++ b/utils/common/cv4l-helpers.h
@@ -78,6 +78,13 @@ public:
 	bool has_rds_out() const { return v4l_has_rds_out(this); }
 	bool has_sdr_cap() const { return v4l_has_sdr_cap(this); }
 	bool has_sdr_out() const { return v4l_has_sdr_out(this); }
+	bool has_touch() const { return v4l_has_touch(this); }
+	bool has_meta_cap() const { return v4l_has_meta_cap(this); }
+	bool has_meta_out() const { return v4l_has_meta_out(this); }
+	bool has_audio_cap() const { return v4l_has_audio_cap(this); }
+	bool has_audio_out() const { return v4l_has_audio_out(this); }
+	bool has_audio_m2m() const { return v4l_has_audio_m2m(this); }
+	bool has_m2m() const { return v4l_has_m2m(this); }
 	bool has_hwseek() const { return v4l_has_hwseek(this); }
 	bool has_rw() const { return v4l_has_rw(this); }
 	bool has_streaming() const { return v4l_has_streaming(this); }
diff --git a/utils/common/v4l-helpers.h b/utils/common/v4l-helpers.h
index 5a256603..a01b3e48 100644
--- a/utils/common/v4l-helpers.h
+++ b/utils/common/v4l-helpers.h
@@ -404,11 +404,26 @@ static inline bool v4l_has_touch(const struct v4l_fd *f)
 	return v4l_g_caps(f) & V4L2_CAP_TOUCH;
 }

+static inline bool v4l_has_audio_cap(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
+static inline bool v4l_has_audio_out(const struct v4l_fd *f)
+{
+	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
+}
+
 static inline bool v4l_has_audio_m2m(const struct v4l_fd *f)
 {
 	return v4l_g_caps(f) & V4L2_CAP_AUDIO_M2M;
 }

+static inline bool v4l_has_m2m(const struct v4l_fd *f)
+{
+	return v4l_has_vid_m2m(f) || v4l_has_audio_m2m(f);
+}
+
 static inline bool v4l_has_hwseek(const struct v4l_fd *f)
 {
 	return v4l_g_caps(f) & V4L2_CAP_HW_FREQ_SEEK;
@@ -454,6 +469,10 @@ static inline __u32 v4l_determine_type(const struct v4l_fd *f)
 		return V4L2_BUF_TYPE_META_CAPTURE;
 	if (v4l_has_meta_out(f))
 		return V4L2_BUF_TYPE_META_OUTPUT;
+	if (v4l_has_audio_cap(f))
+		return V4L2_BUF_TYPE_AUDIO_CAPTURE;
+	if (v4l_has_audio_out(f))
+		return V4L2_BUF_TYPE_AUDIO_OUTPUT;

 	return 0;
 }
@@ -706,6 +725,10 @@ static inline void v4l_format_s_pixelformat(struct v4l2_format *fmt, __u32 pixel
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		fmt->fmt.meta.dataformat = pixelformat;
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		fmt->fmt.audio.audioformat = pixelformat;
+		break;
 	}
 }

@@ -727,6 +750,9 @@ static inline __u32 v4l_format_g_pixelformat(const struct v4l2_format *fmt)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return fmt->fmt.meta.dataformat;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return fmt->fmt.audio.audioformat;
 	default:
 		return 0;
 	}
@@ -1068,6 +1094,9 @@ v4l_format_g_sizeimage(const struct v4l2_format *fmt, unsigned plane)
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return plane ? 0 : fmt->fmt.meta.buffersize;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return plane ? 0 : fmt->fmt.audio.buffersize;
 	default:
 		return 0;
 	}
@@ -1192,12 +1221,22 @@ static inline bool v4l_type_is_meta(unsigned type)
 	       type == V4L2_BUF_TYPE_META_OUTPUT;
 }

+static inline bool v4l_type_is_audio(unsigned type)
+{
+	return type == V4L2_BUF_TYPE_AUDIO_CAPTURE ||
+	       type == V4L2_BUF_TYPE_AUDIO_OUTPUT;
+}
+
 static inline unsigned v4l_type_invert(unsigned type)
 {
 	if (v4l_type_is_planar(type))
 		return v4l_type_is_output(type) ?
 			V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE :
 			V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE;
+	if (v4l_type_is_audio(type))
+		return v4l_type_is_output(type) ?
+			V4L2_BUF_TYPE_AUDIO_CAPTURE :
+			V4L2_BUF_TYPE_AUDIO_OUTPUT;
 	return v4l_type_is_output(type) ?
 		V4L2_BUF_TYPE_VIDEO_CAPTURE :
 		V4L2_BUF_TYPE_VIDEO_OUTPUT;
diff --git a/utils/v4l2-compliance/v4l2-compliance.h b/utils/v4l2-compliance/v4l2-compliance.h
index bba56b12..1e83fba3 100644
--- a/utils/v4l2-compliance/v4l2-compliance.h
+++ b/utils/v4l2-compliance/v4l2-compliance.h
@@ -102,7 +102,7 @@ using frmsizes_count_map = std::map<__u32, unsigned>;

 struct base_node;

-#define V4L2_BUF_TYPE_LAST V4L2_BUF_TYPE_META_OUTPUT
+#define V4L2_BUF_TYPE_LAST V4L2_BUF_TYPE_AUDIO_OUTPUT

 struct base_node {
 	bool is_video;
diff --git a/utils/v4l2-compliance/v4l2-test-buffers.cpp b/utils/v4l2-compliance/v4l2-test-buffers.cpp
index 6d592c9b..d5c8d17c 100644
--- a/utils/v4l2-compliance/v4l2-test-buffers.cpp
+++ b/utils/v4l2-compliance/v4l2-test-buffers.cpp
@@ -235,12 +235,14 @@ public:
 		if (v4l_type_is_output(g_type()))
 			fill_output_buf(fill_bytesused);
 		err = node->qbuf(*this);
-		if (err == 0 &&
-		    v4l_type_is_video(g_type()) && v4l_type_is_output(g_type())) {
-			fail_on_test(g_field() == V4L2_FIELD_ANY);
+		if (err)
+			return err;
+		if (v4l_type_is_output(g_type())) {
+			if (v4l_type_is_video(g_type()))
+				fail_on_test(g_field() == V4L2_FIELD_ANY);
 			buffer_info[g_timestamp()] = buf;
 		}
-		return err;
+		return 0;
 	}
 	int qbuf(node *node, const cv4l_queue &q)
 	{
diff --git a/utils/v4l2-compliance/v4l2-test-formats.cpp b/utils/v4l2-compliance/v4l2-test-formats.cpp
index c92e9658..adec678a 100644
--- a/utils/v4l2-compliance/v4l2-test-formats.cpp
+++ b/utils/v4l2-compliance/v4l2-test-formats.cpp
@@ -451,6 +451,7 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 	struct v4l2_sliced_vbi_format &sliced = fmt.fmt.sliced;
 	struct v4l2_sdr_format &sdr = fmt.fmt.sdr;
 	struct v4l2_meta_format &meta = fmt.fmt.meta;
+	struct v4l2_audio_format &audio = fmt.fmt.audio;
 	unsigned min_data_samples;
 	unsigned min_sampling_rate;
 	v4l2_std_id std;
@@ -595,6 +596,13 @@ static int testFormatsType(struct node *node, int ret,  unsigned type, struct v4
 					meta.dataformat, fcc2s(meta.dataformat).c_str(), type);
 		fail_on_test(meta.buffersize == 0);
 		break;
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		if (map.find(audio.audioformat) == map.end())
+			return fail("audioformat %08x (%s) for buftype %d not reported by ENUM_FMT\n",
+					audio.audioformat, fcc2s(audio.audioformat).c_str(), type);
+		fail_on_test(audio.buffersize == 0);
+		break;
 	case V4L2_BUF_TYPE_PRIVATE:
 		break;
 	}
@@ -709,6 +717,9 @@ static bool matchFormats(const struct v4l2_format &f1, const struct v4l2_format
 	case V4L2_BUF_TYPE_META_CAPTURE:
 	case V4L2_BUF_TYPE_META_OUTPUT:
 		return !memcmp(&f1.fmt.meta, &f2.fmt.meta, sizeof(f1.fmt.meta));
+	case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+	case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+		return !memcmp(&f1.fmt.audio, &f2.fmt.audio, sizeof(f1.fmt.audio));

 	}
 	return false;
@@ -788,6 +799,10 @@ int testTryFormats(struct node *node)
 			case V4L2_BUF_TYPE_META_OUTPUT:
 				pixelformat = fmt.fmt.meta.dataformat;
 				break;
+			case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+			case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+				pixelformat = fmt.fmt.audio.audioformat;
+				break;
 			case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 			case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
 				pixelformat = fmt.fmt.pix_mp.pixelformat;
@@ -866,6 +881,9 @@ static int testM2MFormats(struct node *node)
 	fail_on_test(node->g_fmt(fmt_out, out_type));
 	fail_on_test(node->g_fmt(fmt_cap, cap_type));

+	if (node->has_audio_m2m())
+		return 0;
+
 	/*
 	 * JPEG codec have fixed colorspace, so these tests
 	 * are different compared to other m2m devices.
@@ -1138,6 +1156,10 @@ int testSetFormats(struct node *node)
 			case V4L2_BUF_TYPE_META_OUTPUT:
 				pixelformat = fmt_set.fmt.meta.dataformat;
 				break;
+			case V4L2_BUF_TYPE_AUDIO_CAPTURE:
+			case V4L2_BUF_TYPE_AUDIO_OUTPUT:
+				pixelformat = fmt_set.fmt.audio.audioformat;
+				break;
 			case V4L2_BUF_TYPE_SDR_CAPTURE:
 			case V4L2_BUF_TYPE_SDR_OUTPUT:
 				pixelformat = fmt_set.fmt.sdr.pixelformat;
diff --git a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
index ffa36164..18dd2c9b 100644
--- a/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
+++ b/utils/v4l2-ctl/v4l2-ctl-streaming.cpp
@@ -2156,7 +2156,7 @@ static FILE *open_input_file(cv4l_fd &fd, __u32 type)

 static void streaming_set_out(cv4l_fd &fd, cv4l_fd &exp_fd)
 {
-	__u32 type = fd.has_vid_m2m() ? v4l_type_invert(fd.g_type()) : fd.g_type();
+	__u32 type = fd.has_m2m() ? v4l_type_invert(fd.g_type()) : fd.g_type();
 	cv4l_queue q(type, out_memory);
 	cv4l_queue exp_q(exp_fd.g_type(), V4L2_MEMORY_MMAP);
 	int fd_flags = fcntl(fd.g_fd(), F_GETFL);
@@ -2713,7 +2713,7 @@ static void streaming_set_m2m(cv4l_fd &fd, cv4l_fd &exp_fd)
 	fd.g_fmt(fmt[OUT], out.g_type());
 	fd.g_fmt(fmt[CAP], in.g_type());

-	if (!fd.has_vid_m2m()) {
+	if (!fd.has_m2m()) {
 		fprintf(stderr, "unsupported m2m stream type\n");
 		return;
 	}
@@ -2763,7 +2763,7 @@ static void streaming_set_cap2out(cv4l_fd &fd, cv4l_fd &out_fd)
 	bool use_poll = options[OptStreamPoll];
 	bool use_dmabuf = options[OptStreamDmaBuf] || options[OptStreamOutDmaBuf];
 	bool use_userptr = options[OptStreamUser] && options[OptStreamOutUser];
-	__u32 out_type = out_fd.has_vid_m2m() ? v4l_type_invert(out_fd.g_type()) : out_fd.g_type();
+	__u32 out_type = out_fd.has_m2m() ? v4l_type_invert(out_fd.g_type()) : out_fd.g_type();
 	cv4l_queue in(fd.g_type(), memory);
 	cv4l_queue out(out_type, out_memory);
 	fps_timestamps fps_ts[2];
@@ -3002,7 +3002,7 @@ void streaming_list(cv4l_fd &fd, cv4l_fd &out_fd)
 		list_buffers(fd, fd.g_type());

 	if (options[OptListBuffersOut])
-		list_buffers(*p_out_fd, p_out_fd->has_vid_m2m() ?
+		list_buffers(*p_out_fd, p_out_fd->has_m2m() ?
 			     v4l_type_invert(p_out_fd->g_type()) : p_out_fd->g_type());

 	if (options[OptStreamBufCaps])

