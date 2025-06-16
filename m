Return-Path: <linuxppc-dev+bounces-9390-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BC2ADA78A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Jun 2025 07:20:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLJHW0KWlz2xfB;
	Mon, 16 Jun 2025 15:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750051238;
	cv=none; b=FInMxX161Az5LjJF8XnWTvRF3nuZvXZsBgoxPlXdF5Vhx8cT7mXZU26PzNvgDmn7DWQZxoXZwvArFbpVZvqgQ9RHd685/10jYWSCoS20p51BTZfnJlBDRy5aInh1iCO1Cu2560tiko7a8Q6kTJlR4ivFkyIh1ScYWX8yoKK4gwtJ0d1TazIoVVtYwGr/pHBSNhk/PNjai5fcmaMEvNTTNp6byoRAtRyJ21fjjNJbmzfSW+LzCghEhjVVhF8IE0vjA3+MtN/YTkcQhKTeDNh9ixG3bRnG3kI/WQ4W/RQIg+KRSUZfb+HQ3l8C2wz8fCC3BC76cUE8wteJsWS+Sibt4A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750051238; c=relaxed/relaxed;
	bh=1DiyzAn7mqkeIdA3KLlHAhKm7zypoY+7n8eYRToq5r0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KKs4Xn/UC4z5iZDUdlEyvN9NJzyjTzMdpYAZRwFgWgtk4PAE9NnvwY8vszidqZLm9HYnMSN48FBsOCqr/dq1FrzALBMO43vgH91TZyLuTu/WYt+y57kiNLZwXz7PK++z7yJC/rrrCRYHsS8fPOwUP9+4ri9WFxuYbdOXrH7VYLbnBgPii8Vu5YgtzCjCGpkhTPPX15gss3QYzeKCEArJxkclDsl+VTJEX1caw+aIB9iVqCpXb9NwjLU+3K0OhAQ+oo3sq8t1ia4bkrlBp5WyPkfjRCzH6ewzAJK7RPLj7AQgAZQr2lfdaSwFZrIjUUWHasGXZNquY6jyCnKIlkRuGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bLJHV2Y6Dz2xHv
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Jun 2025 15:20:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bLJ620D1Tz9sv8;
	Mon, 16 Jun 2025 07:12:26 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RSs8tuDgJhFH; Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bLJ616KWPz9st4;
	Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CB2868B764;
	Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Rr37r5e5VLCk; Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 67F758B763;
	Mon, 16 Jun 2025 07:12:25 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Stephen Rothwell <sfr@canb.auug.org.au>
Subject: [PATCH] ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec64 in struct snd_pcm_mmap_status_x32
Date: Mon, 16 Jun 2025 07:12:23 +0200
Message-ID: <e46139ed61bc52fab51babadb8b656fa1aa15506.1750050658.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750050743; l=1658; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=xZfMpcaAJypo8xW2lO2HU1GylS4Dp/zzkpIUOwMDvWU=; b=At18Z5Fc4zdB3x4w6XOU3pi1TVg75/+RxtbjV66c1LgIcr60frXVBJv1tni34PzNdunz11+Ye jnDuRaIAbKbC3D9+WM9Ha3jLIEcRzlL7OoqfFg24xwk+DsZ1ywp9fMF
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

To match struct __snd_pcm_mmap_status and enable reuse of
snd_pcm_sync_ptr_get_user() and snd_pcm_sync_ptr_put_user() by
snd_pcm_sync_ptr() replace tstamp_sec and tstamp_nsec fields by
a struct __snd_timespec64 in struct snd_pcm_mmap_status_x32.
Do the same with audio_tstamp_sec and audio_tstamp_nsec.

This is possible because struct snd_pcm_mmap_status_x32 is packed
and __SND_STRUCT_TIME64 is always defined for kernel which means
struct __snd_timespec64 is always defined as struct __kernel_timespec
which is:

	struct __kernel_timespec {
		long long tv_sec;
		long long tv_nsec;
	};

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Fixes: a0f3992ee86e ("ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in struct snd_pcm_mmap_status32")
Closes: https://lore.kernel.org/all/20250616130126.08729b84@canb.auug.org.au/
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
Might be squashed with a0f3992ee86e if you happen to rebase sound tree.
---
 sound/core/pcm_compat.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/sound/core/pcm_compat.c b/sound/core/pcm_compat.c
index 17540020ac2f..54eb9bd8eb21 100644
--- a/sound/core/pcm_compat.c
+++ b/sound/core/pcm_compat.c
@@ -377,12 +377,10 @@ struct snd_pcm_mmap_status_x32 {
 	s32 pad1;
 	u32 hw_ptr;
 	u32 pad2; /* alignment */
-	s64 tstamp_sec;
-	s64 tstamp_nsec;
+	struct __snd_timespec64 tstamp;
 	snd_pcm_state_t suspended_state;
 	s32 pad3;
-	s64 audio_tstamp_sec;
-	s64 audio_tstamp_nsec;
+	struct __snd_timespec64 audio_tstamp;
 } __packed;
 
 struct snd_pcm_mmap_control_x32 {
-- 
2.47.0


