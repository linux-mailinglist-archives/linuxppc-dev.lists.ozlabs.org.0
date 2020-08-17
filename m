Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC4124659F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:44:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVXJz0WdpzDqWs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:44:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=allen.cryptic@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=snlOuFkt; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVSbk3ncvzDqTM
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 18:57:22 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id mw10so7380591pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 01:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=0b4hDbgubBeeHXRlursdhBMl3jFnpB2aLYnsOHqVEyc=;
 b=snlOuFktVD1cP5N09r0AccPqkRSPMz+cvjfUmySoCBbHAg5IqrIz//oiUEskZWFBpr
 WvYMGv0nxUz2prgAdW1W2WCUBYbwjEuXFvOXqQvQDemb2bOQVRke86WivzHQrMQZRB1f
 n7zXV4FZMYRZ3YylXm4t6JHV6yeOVf8lytGEkjdQNn+nRI+VzqOpkEC06NO0isZclWUl
 TlfDxFLlZW1kkEteoruH6rrJ0NqOreFPKS9Q2aSyxdg3xzCMqIJh7JyBHfTBR3mrN1ZA
 NFiQzrS0OC19GCaekoNy7ZIqNpa3wLP3s3orkMWFKreQcAQ5fYdVgB6u8Rrf8bajgR/q
 ndag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=0b4hDbgubBeeHXRlursdhBMl3jFnpB2aLYnsOHqVEyc=;
 b=Q9roeZSstb1m+dHZNbEUMGHj7iZVwfWmdN/UHmMGHQPFaEMrJZj4eXQt5RjfKGob+F
 mGBmjgHpOTy2U3hDCMnzVze6rphtIWzow1bp3SeNNDpYuFqGgnxizObBEx2igbwlSyoR
 I3p0MXPVwzzb/iwbE7WxF0xkfkZmDl9ddy2FCFhcjQyhMl+WLIvDJlh8F7IyouVFVERy
 9HOqTV2R7e3HcX4uCS1eLavPgi2rhqlZyNO+HYtZPPYxY9XvpzCnYak//0GO6YQWTHZ5
 9Me7xN2U2D1FTAeBAjwV7fW0NAzSs+KS2W9oKGqhmpQxIP0Tu5NU1tHGMXpUrft8skgh
 r7ig==
X-Gm-Message-State: AOAM532sv8uPDz/POzGYP19GX5stDYAbDmU9vNbt/Ayky4C4q/SL2DjY
 WER36DgN8Di3Sm66JlHpq4k=
X-Google-Smtp-Source: ABdhPJw7HRAC6poe+UqqVsK7dgB/sMPd8DjS9fktdGxdcAkuA1yd4TGrqN3B3HxZjnefmHY9/tBTCQ==
X-Received: by 2002:a17:90a:c28d:: with SMTP id
 f13mr8355288pjt.124.1597654637867; 
 Mon, 17 Aug 2020 01:57:17 -0700 (PDT)
Received: from localhost.localdomain ([49.207.202.98])
 by smtp.gmail.com with ESMTPSA id j5sm19057245pfg.80.2020.08.17.01.57.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:57:17 -0700 (PDT)
From: Allen Pais <allen.cryptic@gmail.com>
To: perex@perex.cz, tiwai@suse.com, clemens@ladisch.de,
 o-takashi@sakamocchi.jp, timur@kernel.org, nicoleotsuka@gmail.com,
 Xiubo.Lee@gmail.com
Subject: [PATCH 00/10] sound: convert tasklets to use new tasklet_setup()
Date: Mon, 17 Aug 2020 14:26:53 +0530
Message-Id: <20200817085703.25732-1-allen.cryptic@gmail.com>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Mon, 17 Aug 2020 21:23:57 +1000
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
Cc: alsa-devel@alsa-project.org, Allen Pais <allen.lkml@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, keescook@chromium.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Allen Pais <allen.lkml@gmail.com>

Commit 12cc923f1ccc ("tasklet: Introduce new initialization API")'
introduced a new tasklet initialization API. This series converts 
all the sound drivers to use the new tasklet_setup() API

Allen Pais (10):
  sound: core: convert tasklets to use new tasklet_setup() API
  sound: firewire: convert tasklets to use new tasklet_setup() API
  sound: asihpi: convert tasklets to use new tasklet_setup() API
  sound: riptide: convert tasklets to use new tasklet_setup() API
  sound: rm9652: convert tasklets to use new tasklet_setup() API
  sound/soc: fsl_esai: convert tasklets to use new tasklet_setup() API
  sound/soc: sh: convert tasklets to use new tasklet_setup() API
  sound/soc: txx9: convert tasklets to use new tasklet_setup() API
  sound: midi: convert tasklets to use new tasklet_setup() API
  sound: ua101: convert tasklets to use new tasklet_setup() API

 sound/core/timer.c            |  7 +++----
 sound/firewire/amdtp-stream.c |  8 ++++----
 sound/pci/asihpi/asihpi.c     |  9 ++++-----
 sound/pci/riptide/riptide.c   |  6 +++---
 sound/pci/rme9652/hdsp.c      |  6 +++---
 sound/pci/rme9652/hdspm.c     |  7 +++----
 sound/soc/fsl/fsl_esai.c      |  7 +++----
 sound/soc/sh/siu_pcm.c        | 10 ++++------
 sound/soc/txx9/txx9aclc.c     |  7 +++----
 sound/usb/midi.c              |  7 +++----
 sound/usb/misc/ua101.c        |  7 +++----
 11 files changed, 36 insertions(+), 45 deletions(-)

-- 
2.17.1

