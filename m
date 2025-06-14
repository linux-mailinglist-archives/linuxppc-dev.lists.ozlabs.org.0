Return-Path: <linuxppc-dev+bounces-9367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 372D6AD9B3C
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Jun 2025 10:20:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bK8N61q8Xz2xd3;
	Sat, 14 Jun 2025 18:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749889238;
	cv=none; b=BYZarQNLslspYYszYqaqqSSxdwQDmd+oXd/uOJvrZxl+BejQLWmQ07RLLfbzquznXgLllw1EXiZ8wyCc3hfV3jJ0poogWB26Q/Goe+FCrpCpa18cPJA3CCH/5JGLVvdSwpvmuo7Ium+NhxXk2JiWRx69B9rMFsrlEcblwAce7U1kIk8FSkshq/ma/7+YkwQxPcmZEDwjYv8PYs3qPJ+rXopSsaY3ADeFmeKdEIeWzd7N+6swUfkSeeGJ2DoAbqkwGTIAodkl9AdCXBiqL8BQbKv65IaIUAbzjRHZ8Yb62WkTVqKzBt6sUPsDAS7od/cp3D9rsEgRS3v3eNeMi4wNqA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749889238; c=relaxed/relaxed;
	bh=VmkdJ/8QmJaXNNAOIpzYqxkdetMUpJqjXvaVDclZecU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBicxJvLdCVOgbVczxaZTI/1AKUy0TMx/aa/ccRHWfsUeJPGMtBcpSb/JK9jqQy9ubAY2B01D7D6nvCOrnon6DTMftkcRTMd1JsQlroKA0bVmZ+us7K9eyG1XHuDZABq8JxGFVTf7aOjxnJ5IENS5iEVxs5QnIAtAtyqK3YSoWcdSta1XGbd/TJRUDJuA5ZNvKy/fJZJ3pufISFCKFNK2r+IEazLAjf55PVwThBFTIC5ND8Kf0cANveBZ4NEtL+cbAq2PCz6mxJyF3GBYlQspG2DCQ3GY+Zl4HHCmzsNVlmUYzEq/8JaZp+IthIOktzZ9dH7GaqHPia3flvOgbQkaw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bK8N46PS5z2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Jun 2025 18:20:35 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bK6Cz2hnVz9t0K;
	Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nzJiJVWnwwT0; Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bK6Cz1jFTz9t0H;
	Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 353E18B77B;
	Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rpo6pN8d7mWZ; Sat, 14 Jun 2025 08:43:27 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BCE058B769;
	Sat, 14 Jun 2025 08:43:22 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	Herve Codina <herve.codina@bootlin.com>
Subject: [PATCH v3 0/4] ALSA: pcm: Convert SNDRV_PCM_IOCTL_SYNC_PTR to user_access_begin/user_access_end()
Date: Sat, 14 Jun 2025 08:43:13 +0200
Message-ID: <cover.1749883041.git.christophe.leroy@csgroup.eu>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749883393; l=4713; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=b+ZNK9H+MGbconJey2jD2y8seac9nVP4q217lbRq7W4=; b=LKyYrK0DlNR6aTIHoEmvIpc7BaxFRlaNMYY0kH7LUAkeVzoBPw3szJ7OXhhUT2gm5Q8dXeypn 3cQAAhKIJHODOeBk8pkfFhNys5NCZKJe05ts30wOinxe70bTLJqipIi
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

Since v2:
- Fix macros to skip user_read_access_end() when user_read_access_begin() failed
- Fix some tabulations for properly aligning backslashes

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
 sound/core/pcm_native.c | 98 ++++++++++++++++++++++++++---------------
 2 files changed, 64 insertions(+), 48 deletions(-)

-- 
2.47.0


