Return-Path: <linuxppc-dev+bounces-3830-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11A79E5D55
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Dec 2024 18:36:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y41ky6hGCz300V;
	Fri,  6 Dec 2024 04:35:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733420154;
	cv=none; b=nEK+02OTWkkRStWd4HmrE7c28ldDHHr/fTmVN3xD+Cj5d1DXoLdhiRV31dj6u1LWpYfBZOAYwE55qxz/0OXizyj/ea8S53JUQws29p7HOf7aX7JvE+3C/8qbwvhzuKxn7JERKe773UI+oK/TrackbJKp5NZ8zPrGoLVHnBGF3NTn8BaGiMmgj6sJOfRycffCwBFmpW7Dy2XyQQpL2LXVRpXTWx3IGMtYMFswyviPbzMPCC8IDIpT8zzJN26HMFnjdtEOkXJQjd3Eq4OahSY2q/I6WMbMqdeAb4gSUmkdMKqpyHvIok3wPEDwRtzy2HFxCvz+Sb3LbKeez+TPW+4I3g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733420154; c=relaxed/relaxed;
	bh=V7yqIF0hpa70J1Es4osz7ul+iLI05ka3BCzLr2JD3+4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dQSEqjtCLng0FUvqIfqhPclArjntfquXqZ+6CH1FsFK3WfY1cShyIgVi/L22XxFRVHRI3QQ8G0mYMNqmN3OB8fGRztmmG0levhM4cxeCbaRpDl4SY4VSdB1SmK62jORqzoznLsG1WngMNPJjCkaFlEyZ3tELxtC9f33DOqqO93uAPHSjinsN3hGPLJTE8Vj0FI10aoAXKNCRw8vgQMEKgRt5eCWRIBuR8daUH1pSye36FcW7vXUUublfSyaWNJyryc3mDIXt5V/mhpOJA5p29iK9+zl3UqwVwfnczJtXvZkpsQO/DqmLAYOUaGjDf/D+qqdXMl34a5sL1YjcPXMiGA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=osaoXBUG; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=osaoXBUG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y41km5D1Kz2yYd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Dec 2024 04:35:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733420137;
	bh=68WNMR27/Jh6Vy7PvAle7AaTWkBct2qgXVk12kHAaEY=;
	h=From:Subject:Date:To:Cc:From;
	b=osaoXBUGfRb46luXfjCGTPlnbK7q0cEYSDeeHPKe6F5/8fT1bXolzVbZEr743sp7n
	 OYCOlxC/xSo+G3OjW0YG7pLTN295Pga9v2NcIMjRFaP+ZC6R3UrV8BOWJePkDk1HGc
	 yOQXl/blyJageLhTjzhHwYNhUOVSru+iMXlM/kHE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
Date: Thu, 05 Dec 2024 18:35:12 +0100
Message-Id: <20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAFDkUWcC/x3MwQpAQBAA0F/RnE3ZSSm/IondWaZY2tlE8u82x
 3d5DyhHYYW2eCDyKSp7yDBlAXYZw8woLhuootoYItRbvaLdgyacJAxjShFVtmNlbGzl3ETeekO
 QhyOyl+vfu/59P/HJDYRtAAAA
X-Change-ID: 20241122-sysfs-const-bin_attr-simple-7c0ddb2fcf12
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
 Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
 bpf@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733420137; l=1170;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=68WNMR27/Jh6Vy7PvAle7AaTWkBct2qgXVk12kHAaEY=;
 b=T+PbqYnqnoXWLbF5FULrGKTEWzZ8sXpbVXoqId9h5bVMynN1gxzdjACjy9czZW5+/hfIaiOMY
 927yDeHmNmiBbYl7QYj+NHuMWTZRXQl9ozjUUHoyQqHpqA28sdx295H
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

Most users use this function through the BIN_ATTR_SIMPLE* macros,
they can handle the switch transparently.

This series is meant to be merged through the driver core tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Thomas Weißschuh (4):
      sysfs: constify bin_attribute argument of sysfs_bin_attr_simple_read()
      platform/x86: wmi-bmof: Switch to sysfs_bin_attr_simple_read()
      btf: Switch vmlinux BTF attribute to sysfs_bin_attr_simple_read()
      btf: Switch module BTF attribute to sysfs_bin_attr_simple_read()

 arch/powerpc/platforms/powernv/opal.c |  2 +-
 drivers/platform/x86/wmi-bmof.c       | 12 ++----------
 fs/sysfs/file.c                       |  2 +-
 include/linux/sysfs.h                 |  4 ++--
 kernel/bpf/btf.c                      | 15 ++-------------
 kernel/bpf/sysfs_btf.c                | 12 ++----------
 kernel/module/sysfs.c                 |  2 +-
 7 files changed, 11 insertions(+), 38 deletions(-)
---
base-commit: feffde684ac29a3b7aec82d2df850fbdbdee55e4
change-id: 20241122-sysfs-const-bin_attr-simple-7c0ddb2fcf12

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


