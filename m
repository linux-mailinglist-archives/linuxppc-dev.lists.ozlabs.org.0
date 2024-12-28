Return-Path: <linuxppc-dev+bounces-4498-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8D59FD985
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Dec 2024 09:44:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YKwrX4NW2z2xbS;
	Sat, 28 Dec 2024 19:43:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=159.69.126.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735375436;
	cv=none; b=iljUaJ7Col6FA/FcaTvgRONewPFqVMcc89plfx0Qmet9/9kGi3J5oUOUM0nIRMH8GASRws+B/iPVc9+jYwwmCGYeiD9u5BVHbLv6MEEmocu9ylCprF3yCiGvhKGNDRZvgIWC/uHrNSr7XzKyi17J8TOAnRi0KMZVK0A4PC/x03Z45fQ7ry6KjkaK3LxGMhsnyZcaOf8qT+PBS+OcyJ15rPld0vZHycia2dDIuBcZqT90mHZloD3eIhOFQeFsOvVQa9WSLmDmqvvSLCoCpXkfDBB4tjrsQrQ00sYiA1i+8zz+cJilDRDs0yebn6GNLCnFdqEjs7Ep/fmlTHXfQ2CN/A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735375436; c=relaxed/relaxed;
	bh=DqUedKw/S4byZ5WaN59KkFySNtg3/haCdj2lX/FgdNk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=PWC3ammcGILy+ml+dO9c5lt2fx7rA0JoveFmMWshOc+ShRK7Xlh8OzyR3IbYn5qgOoZOo5ydD48ho9jDXEulx/aKPnUpb7xwdufvClI+QICAg+z+mmSMQEfVbNOQEjXHen9mX+ETj4s7eNhalYDAmd7jd/3PYnP/LjoYzCtGUJ1BP0C6nytXRjbih2Leeo3nLumXMAa89Twv5fhTRuTBqhwcZw02X+dnp8W2pVD7pAXv57V7FrCjqj1sQk6zG/V0kpV4nH3rdhmU2M52ig4caYMLgQYgZgsFKWS2ouvYCHA9XcUXB6MW92fm3tqrcaPsU2CQZe72NXu4zvzr/8cE2w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WbIl0pma; dkim-atps=neutral; spf=pass (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org) smtp.mailfrom=weissschuh.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=weissschuh.net header.i=@weissschuh.net header.a=rsa-sha256 header.s=mail header.b=WbIl0pma;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=weissschuh.net (client-ip=159.69.126.157; helo=todd.t-8ch.de; envelope-from=linux@weissschuh.net; receiver=lists.ozlabs.org)
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YKwrS71BNz2xJT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Dec 2024 19:43:50 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1735375425;
	bh=sZiTPlQI0gHuQF1THsJA4vQwmsj1H9KFzGpKq1nF9WY=;
	h=From:Subject:Date:To:Cc:From;
	b=WbIl0pmaTig4WqXVNlApAm/gyb1WPNf8/CGCDRFQ2XLpxpT+PxPxg35UzP1JJZETh
	 Q3KoWLjcxjBFclgDc1ljqUCgtj4BCRz5KJBBOSXNf7cg+q81h/i93BCRmMjQtSEtaN
	 DbKS7/3vht381rnDmgZWnDgHmB2Ws47fM4EcHsIg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/3] sysfs: constify bin_attribute argument of
 sysfs_bin_attr_simple_read()
Date: Sat, 28 Dec 2024 09:43:40 +0100
Message-Id: <20241228-sysfs-const-bin_attr-simple-v2-0-7c6f3f1767a3@weissschuh.net>
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
X-B4-Tracking: v=1; b=H4sIADy6b2cC/33NQQ6CMBCF4auQrh3TjjUkrryHIQbawU6ihXQqS
 gh3t+Le5f8W31uUUGISdaoWlWhi4SGWwF2lXGjjjYB9aYUarTGIILP0Am6IkqHjeG1zTiD8GO8
 EtdPed9i73qAqwpio5/emX5rSgSUPad7OJvNdfy7q4193MqDBtpasI18bOpxfxCLiwjPsI2XVr
 Ov6AWq7vmfLAAAA
X-Change-ID: 20241122-sysfs-const-bin_attr-simple-7c0ddb2fcf12
To: Michael Ellerman <mpe@ellerman.id.au>, 
 Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
 Sami Tolvanen <samitolvanen@google.com>, 
 Daniel Gomez <da.gomez@samsung.com>, Alexei Starovoitov <ast@kernel.org>, 
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
 Martin KaFai Lau <martin.lau@linux.dev>, 
 Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
 Yonghong Song <yonghong.song@linux.dev>, 
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>, 
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
 Jiri Olsa <jolsa@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1735375424; l=1255;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=sZiTPlQI0gHuQF1THsJA4vQwmsj1H9KFzGpKq1nF9WY=;
 b=bVK06F6W/XTwjZZrk9th4YWgZvI6fDp2ksynQwNyKsR4oUOGuKOfH8ZIpuVDiMoiNN90vtbQT
 fuheImUmzLGCCXSuRqocGwLuU0HITJO2We5q3ZL4M71LsJ3R3lMP4k4
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
Changes in v2:
- Rebase on torvalds/master
- Drop wmi-bmof patch
- Pick up Acks from Andrii
- Link to v1: https://lore.kernel.org/r/20241205-sysfs-const-bin_attr-simple-v1-0-4a4e4ced71e3@weissschuh.net

---
Thomas Weißschuh (3):
      sysfs: constify bin_attribute argument of sysfs_bin_attr_simple_read()
      btf: Switch vmlinux BTF attribute to sysfs_bin_attr_simple_read()
      btf: Switch module BTF attribute to sysfs_bin_attr_simple_read()

 arch/powerpc/platforms/powernv/opal.c |  2 +-
 fs/sysfs/file.c                       |  2 +-
 include/linux/sysfs.h                 |  4 ++--
 kernel/bpf/btf.c                      | 15 ++-------------
 kernel/bpf/sysfs_btf.c                | 12 ++----------
 kernel/module/sysfs.c                 |  2 +-
 6 files changed, 9 insertions(+), 28 deletions(-)
---
base-commit: d6ef8b40d075c425f548002d2f35ae3f06e9cf96
change-id: 20241122-sysfs-const-bin_attr-simple-7c0ddb2fcf12

Best regards,
-- 
Thomas Weißschuh <linux@weissschuh.net>


