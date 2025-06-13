Return-Path: <linuxppc-dev+bounces-9363-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D56CAD954E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jun 2025 21:20:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJq4720pjz2ynh;
	Sat, 14 Jun 2025 05:20:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749842439;
	cv=none; b=Vx5BO9YKKTvEep2jrJEdZn84SslyKeMnWTl8ovac9+yUX6MpEKXQ4maWWPqGSq+WXM931/KWC8bye9W+mmUllrYeg56K2Ny/MaiDju9UgtcaMzRfHII21oFVzrNG/Jt+ej2igayXrFWRoMhoqE7VkQKVts6yp4xoFAlJJg0Ufl2xftQGH+iIM60/cvpXsZSsLtFAr0S4/ZiStxZVa5ySMMO0p9ReFjh5FSCgKNSxgimrbg+hJzhCtjdu7/aD9UerLneYIlW1qlYgSITf/0n6JWY3Y+q3pgXDvTE5IQ+HzVxEvs1iHpnLpY321IClsV0x6XF5SLNGA2gGCAHXGptwIw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749842439; c=relaxed/relaxed;
	bh=0/LXUSdsOc3xSRat+EpURJre4aHd2fXowf3mojbGthc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=abJmOVYN64fw0Gd81mQLT4G3NAvhBDMy6Z2hwtZt2AzqNlOUmKfmVnC26IpicRnw/YpBDzukWNlJJShsFE7OqD24KOo4a3Gt8swGaCZXRfRRkt8ehzoLe4cSkXALp5gP20fPyS7PTQs4G75GlpfSNkAE/WIdAc7ZOK72lgsJMGMUvP2c20rTUdoTNpjlM1EHtEexclRry9dVU7XXERQ0au5d6dJ+SGCafQZsDq539dNRZ6I2cgvksb8Yy3O4bh+ZXXhCqzFne23v+YiYXAxM6N6LFyNJ7UApDo2fuTyD8lYWi1ReYyM8BniyaLYjII0vS80RzhlqCjvXlMjX47Lv4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bJq4561T8z2xKN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 05:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bJk6P0b8rz9sqS;
	Fri, 13 Jun 2025 17:37:17 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PCOWwKqZyxEi; Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bJk6N70qRz9sfW;
	Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EA98D8B77C;
	Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uYUCd0b22SLg; Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7EAB98B769;
	Fri, 13 Jun 2025 17:37:16 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v2 0/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
Date: Fri, 13 Jun 2025 17:37:07 +0200
Message-ID: <cover.1749828169.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749829028; l=4560; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=jlE0SCVg7sa2yGK773TAr9cyOmP621uHgVHW+CuTNss=; b=l3AE6pDZs6HimY4utPStAcfFbd+gbXdCu8zDpmIt5piqkMbaCvlsaxClGqOAATPsTE1XXP09k egnLVqIAslQBYOxh25axpEMO/3bqyyVB9LNIfigGUmGlGOz21+2HS/t
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

This series converts all variants of SNDRV_PCM_IOCTL_SYNC_PTR to 
user_access_begin/user_access_end() in order to reduce the CPU load
measured in function snd_pcm_ioctl.

With the current implementation, "perf top" reports a high load in
snd_pcm_iotcl(). Most calls to that function are SNDRV_PCM_IOCTL_SYNC_PTR.

    14.20%  test_perf           [.] engine_main
==> 12.86%  [kernel]            [k] snd_pcm_ioctl
    11.91%  [kernel]            [k] finish_task_switch.isra.0
     4.15%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
     4.07%  libc.so.6           [.] __ioctl_time64
     3.58%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
     3.37%  [kernel]            [k] sys_ioctl
     2.96%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
     2.73%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
     2.58%  [kernel]            [k] system_call_exception
     1.93%  libasound.so.2.0.0  [.] sync_ptr1
     1.85%  libasound.so.2.0.0  [.] snd_pcm_unlock
     1.84%  libasound.so.2.0.0  [.] snd_pcm_mmap_begin
     1.83%  libasound.so.2.0.0  [.] bad_pcm_state
     1.68%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
     1.67%  libasound.so.2.0.0  [.] snd_pcm_avail_update

A tentative was done with going via intermediaire structs on stack to
replace the multiple get_user() and put_user() with copy_from_user()
and copy_to_user(). But copy_from_user() calls _copy_from_user() and
copy_to_user() calls _copy_to_user(). Both then call __copy_tofrom_user().
In total it is 16.4% so it is worse than before.

    14.47%  test_perf           [.] engine_main
    12.00%  [kernel]            [k] finish_task_switch.isra.0
==>  8.37%  [kernel]            [k] snd_pcm_ioctl
     5.44%  libc.so.6           [.] __ioctl_time64
     5.03%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
==>  4.86%  [kernel]            [k] __copy_tofrom_user
     4.62%  [kernel]            [k] sys_ioctl
     3.22%  [kernel]            [k] system_call_exception
     2.42%  libasound.so.2.0.0  [.] snd_pcm_mmap_begin
     2.31%  [kernel]            [k] fdget
     2.23%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
     2.19%  [kernel]            [k] syscall_exit_prepare
     1.92%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
     1.86%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
     1.68%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
==>  1.67%  [kernel]            [k] _copy_from_user
     1.66%  libasound.so.2.0.0  [.] bad_pcm_state
==>  1.53%  [kernel]            [k] _copy_to_user
     1.40%  libasound.so.2.0.0  [.] sync_ptr1

With this series which uses unsafe_put_user() and unsafe_get_user(),
the load is significantly reduced:

    17.46%  test_perf           [.] engine_main
     9.14%  [kernel]            [k] finish_task_switch.isra.0
==>  4.92%  [kernel]            [k] snd_pcm_ioctl
     3.99%  [kernel]            [k] snd_pcm_group_unlock_irq.part.0
     3.71%  libc.so.6           [.] __ioctl_time64
     3.61%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin_generic
     2.72%  libasound.so.2.0.0  [.] sync_ptr1
     2.65%  [kernel]            [k] system_call_exception
     2.46%  [kernel]            [k] sys_ioctl
     2.43%  [kernel]            [k] __rseq_handle_notify_resume
     2.34%  [kernel]            [k] do_epoll_wait
     2.30%  libasound.so.2.0.0  [.] __snd_pcm_mmap_commit
     2.14%  libasound.so.2.0.0  [.] __snd_pcm_avail
     2.04%  libasound.so.2.0.0  [.] snd_pcm_hw_avail_update
     1.89%  libasound.so.2.0.0  [.] snd_pcm_lock
     1.84%  libasound.so.2.0.0  [.] snd_pcm_mmap_avail
     1.76%  libasound.so.2.0.0  [.] __snd_pcm_avail_update
     1.61%  libasound.so.2.0.0  [.] bad_pcm_state
     1.60%  libasound.so.2.0.0  [.] __snd_pcm_mmap_begin
     1.49%  libasound.so.2.0.0  [.] query_status_data

Since RFC:
- Added a cover letter to summarize some of the measurements done on and around the RFC
- Fixed relevant checkpatch feedback
- Split last patch in two

Christophe Leroy (4):
  ALSA: pcm: refactor copy from/to user in SNDRV_PCM_IOCTL_SYNC_PTR
  ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to
    user_access_begin/user_access_end()
  ALSA: pcm: Replace [audio_]tstamp_[n]sec by struct __snd_timespec in
    struct snd_pcm_mmap_status32
  ALSA: pcm: Convert snd_pcm_sync_ptr() to
    user_access_begin/user_access_end()

 sound/core/pcm_compat.c | 14 +-----
 sound/core/pcm_native.c | 96 +++++++++++++++++++++++++----------------
 2 files changed, 62 insertions(+), 48 deletions(-)

-- 
2.47.0


