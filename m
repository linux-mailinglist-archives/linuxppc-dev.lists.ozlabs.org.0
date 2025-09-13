Return-Path: <linuxppc-dev+bounces-12115-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B380EB55DFC
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Sep 2025 05:16:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNxJg71Nxz3cbF;
	Sat, 13 Sep 2025 13:16:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757725448;
	cv=none; b=nAvNHFNrCVZMIEiRzTyJZ1g8GX1jfibzo/gSAF0OHTfN89PHNEz2OiP+0xbUFndXoIvRhPq+ej644sKPkxnrtjelR2XOTK7tR13Rc/KhGnNs4y3YZG079OoKv0PNVP0UI3pbZrl9F5Z220m0LzaZeVVGfi35+RDFH+Ts/zky4gmgL+dXlG42u92mMuGE9o673qEHQnoAmVbuEMISGCCAOxV4U8lW8Ktu5ea0/QW/hxKtikibqzoSBiQiCQLAZvw0686OH2u/dGEnDE9NuCquk/MojKY0duDShsNrMZkUZiIh/Gu580JXCJ9DgL30L90bwkthRajkfsS5kwTpAMy1xg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757725448; c=relaxed/relaxed;
	bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N69ZfeonTLoKbTN1PI87qeZtaKhOIifI879ua8bbW2aotGU7k0SRy+9m5iZLvAtLdEht1bEp3RDZsbaJz4oK0v5wKm/gejAEZ9lwVyE1C98KH1pWYaJ0XDvyLBwZQRLIv2e58KuuaFzQB4e8Q0kCRCKvma9wPpHTYRj1dX4jz7WmnaSuVLTCAUopA9eFiNFwKlUBD2f4VsnGa6qMe5WN9gNwIM26eUPNe91VmCQWiNn7xgUTkLFlmeOdmzpB8cxQorC5H2gz5cujo6z9G8SsZ6u3qDiy5sjrJdtL3skdvJW54npmMKpxELLP6+WPwmI3BpVlE2oo2L/w50IW8dDTow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=co/aOtua; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=co/aOtua;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=safinaskar@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNtNQ6Q21z2yrN
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 11:04:06 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-620724883e6so4851763a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 18:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757725444; x=1758330244; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
        b=co/aOtuaPIaAyeRjlhPfhwZt/docD2em+7C1XSAqodlPrjzhMquXM/qO8rABBHZnmW
         K389NZZlz3Xj0o0A0QZ3HMhIDKcDx2e1u3Xo3g3h+d/XBaAu/lVWQ8hkqjipJ+7gZr/o
         zlHDdI0qyWVMoFwsdZbK6fWQNGPrb4AdmSj3JrR1xaCju7lSwfB9hAMCGPqeTyrRCTeI
         zHqh1mJOlCBmfhPIZRtI7o2lROP+UkUCM3zRgCoLxUZ7nCu51qtzYhvN1C+BPFTiUeqF
         OEcG7vGnaoxNHd8Be1aIVGaYLgA0+Hu6tCc+mPNdI7R9nGbYJ8AiJEW6hos7KuXg9rkG
         53pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757725444; x=1758330244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QP3KPO8+P4bejD4XvvOjfSlYK9K4kJKcAHCDef6XF+Q=;
        b=QkGtbx5KfTVb25yAD4OVogiDNcTGnbL3PqrR7GzMJg5ClLhrgWhwSsMpcr2EpsngaU
         Q9w3PARf0JnIBsu/EQTPQlQ0Rlrs8pS0kIFr175kdzYkDA2nj49k8FXwb/h64+sXmPkt
         JxkS6pv3TvEQBXk9izs8F0MshQRnjMpV44FeNysn95T0AYdFItS03Gyitb6h1E9w15rt
         ciPg91y2Gr0G3po6Foq6xpQsB1O7t74fByWLPixHFZPH3WsdZRj6I0A5yEzHDjD2/mzL
         oOG/8DYWH8ZiKYZ7a9sjnPwsgz/i0E9rSB4CWVVV7CtiXH0kCB+tWBQDdQFqXvjZDlzn
         PvDw==
X-Forwarded-Encrypted: i=1; AJvYcCVNtV9Bt64P9ovQCqUK3+2NarNsy8DOraSYIo/3Jck9myAmnoiz6qcnNHpwl5pjhL6cjz+G75jf/XD268o=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxLpVOQeKvgbGMivX+1bf/3BrIRPg8OYtR98ayCOgMCa6i/TIwo
	cvgZryoRmnIL/q5qlUfrlC2OGRXJlm57mCsgMTvZq6EhiVpI0MZrizaX
X-Gm-Gg: ASbGnctiO6zGpdcI2NErpko8iTgf30fyvop5gGVfWMYOa6m42ZnL5vYBgtycRItEDtz
	UbBXHeDfxHBiPaJBG/BO3jDkjOrJxV6yxOJT0XfcprH5eB9lLfjN5HAiF6xYYJXQHTKsuAODs4m
	7G8+mkYJwBSmBFlvnw94R+AVVvVLCVsF3BTy9/tM+m/QNq3DiGcBZw/x1r7Lb6LYMMRVu2k58kH
	l0XqMeLNf0cy38l8kpV4FXIlB21S7/CsNc3gBxhLImXdgMMoEv1mlI8Y8rncT1oVvNcsBcGtwdN
	txRG3pA0he+WtGKFHruPebHdqb3RqqB/eNCY9n1trP+UKsOmo5lMStXiAKO0lx2z5ptW7D/yLZt
	Nh1jQ2vjkd+BZekPYpw2ha62BZSTkEA==
X-Google-Smtp-Source: AGHT+IF5gJzNBXdtzBXv0OSH4ftjGJnmmybFv16rcAGk5hl57bAzoCs28S7e9w+ysKsSQWZRdIzUSQ==
X-Received: by 2002:a05:6402:3482:b0:61d:249a:43fe with SMTP id 4fb4d7f45d1cf-62ed82c5a43mr4352436a12.24.1757725443498;
        Fri, 12 Sep 2025 18:04:03 -0700 (PDT)
Received: from localhost ([212.73.77.104])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-62ec6b6cec5sm4014207a12.1.2025.09.12.18.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Sep 2025 18:04:02 -0700 (PDT)
From: Askar Safin <safinaskar@gmail.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Christian Brauner <brauner@kernel.org>,
	Al Viro <viro@zeniv.linux.org.uk>,
	Jan Kara <jack@suse.cz>,
	Christoph Hellwig <hch@lst.de>,
	Jens Axboe <axboe@kernel.dk>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Aleksa Sarai <cyphar@cyphar.com>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Julian Stecklina <julian.stecklina@cyberus-technology.de>,
	Gao Xiang <hsiangkao@linux.alibaba.com>,
	Art Nikpal <email2tema@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Eric Curtin <ecurtin@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Rob Landley <rob@landley.net>,
	Lennart Poettering <mzxreary@0pointer.de>,
	linux-arch@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-um@lists.infradead.org,
	x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	linux-block@vger.kernel.org,
	initramfs@vger.kernel.org,
	linux-api@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-ext4@vger.kernel.org,
	"Theodore Y . Ts'o" <tytso@mit.edu>,
	linux-acpi@vger.kernel.org,
	Michal Simek <monstr@monstr.eu>,
	devicetree@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Heiko Carstens <hca@linux.ibm.com>,
	patches@lists.linux.dev
Subject: [PATCH RESEND 22/62] doc: remove obsolete mentions of pivot_root
Date: Sat, 13 Sep 2025 00:38:01 +0000
Message-ID: <20250913003842.41944-23-safinaskar@gmail.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250913003842.41944-1-safinaskar@gmail.com>
References: <20250913003842.41944-1-safinaskar@gmail.com>
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
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

They refer to initrd, which was removed in previous commits

Signed-off-by: Askar Safin <safinaskar@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-init.rst | 4 ++--
 Documentation/arch/arm/ixp4xx.rst                   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/device-mapper/dm-init.rst b/Documentation/admin-guide/device-mapper/dm-init.rst
index 981d6a907699..586bb38d716b 100644
--- a/Documentation/admin-guide/device-mapper/dm-init.rst
+++ b/Documentation/admin-guide/device-mapper/dm-init.rst
@@ -5,8 +5,8 @@ Early creation of mapped devices
 It is possible to configure a device-mapper device to act as the root device for
 your system in two ways.
 
-The first is to build an initial ramdisk which boots to a minimal userspace
-which configures the device, then pivot_root(8) in to it.
+The first is to build initramfs which boots to a minimal userspace
+which configures the device, then switches to it.
 
 The second is to create one or more device-mappers using the module parameter
 "dm-mod.create=" through the kernel boot command line argument.
diff --git a/Documentation/arch/arm/ixp4xx.rst b/Documentation/arch/arm/ixp4xx.rst
index 17aafc610908..ac9cb28776c7 100644
--- a/Documentation/arch/arm/ixp4xx.rst
+++ b/Documentation/arch/arm/ixp4xx.rst
@@ -137,8 +137,8 @@ Intel IXDPG425 Development Platform
    added. One issue with this board is that the mini-PCI slots only
    have the 3.3v line connected, so you can't use a PCI to mini-PCI
    adapter with an E100 card. So to NFS root you need to use either
-   the CSR or a WiFi card and a ramdisk that BOOTPs and then does
-   a pivot_root to NFS.
+   the CSR or a WiFi card and initramfs that BOOTPs and then switches
+   to NFS.
 
 Motorola PrPMC1100 Processor Mezanine Card
 http://www.fountainsys.com
-- 
2.47.2


