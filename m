Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 54B99377902
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 00:24:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FddyC2yJ0z306S
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 08:24:03 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=o1U7LHIo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::133;
 helo=mail-il1-x133.google.com; envelope-from=1337.noureddine@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=o1U7LHIo; dkim-atps=neutral
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FdN6l6nvyz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  9 May 2021 22:00:29 +1000 (AEST)
Received: by mail-il1-x133.google.com with SMTP id j12so11692575ils.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 09 May 2021 05:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=kTx7GsVUFbgNj4CE0ebZKgVk3lgKoqAHGQKzwKjpOTo=;
 b=o1U7LHIoILUMAKsu3Ff3u1/xNS1wn1G0pYDZnS8MFQxnPBmV6xnAJrwAYYsg8j7asq
 SD2hchkVH4BiazilUD8Uv3VHCVVLgKplOZ6IizO2/VicDHODdjTF9gEhaHhS0yXO8hlm
 fho+krDPMQFAPJJ+SlHhyyS6PbNpEoDSGTVksa5YeUaTc9IASJoQvAyaSXsCTugHNVEp
 PjeojXRE+ISwXshc/Ah7ngTBVgnll/17CRb/FV43maq56TDiUQziZThShSGrxcwnrXoU
 bV41slefQTRltwI6SfmFm4Z5zpgn0geIhyvZlzHEHajqtUK8+3c1YUJ0ukB2Hm6d1HS4
 sG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=kTx7GsVUFbgNj4CE0ebZKgVk3lgKoqAHGQKzwKjpOTo=;
 b=R7G6DaR++dTodCok2bwH/4WuZUgOJzk+UJSFeHT003ajYixChRDWlpgePqB0mc3w9j
 1hNiBBW0gnEC+b9PE3YcGFWIVBri6BrKxSUYyCi6bAmpGy0ksbs9d6Iw3VNNuB95fsWd
 UA6ys4i6Wwg/H22tXFCY89xJK02g2q+EXgKjPQpWpuXWYoHf+fm4/tzNDa9qgft1p83p
 mVEdlTEOXjS5lqPw1YllSY+ihDWgYxsRf58iLCi8t10gWnXpwpIykKzIsGuT4qT0nuU3
 pBL6AgnySxDGNnJ3YjAylomLC27pFD9Y4vxjJHqUD37KHOepY2yREW+drqUi2d9XdEJi
 e3Cg==
X-Gm-Message-State: AOAM532PmWaqCR666bVegGHfQl6H4ZII3fz0c+VdajwzdDg/20xE6HIW
 z/+flhK7Pk3+ykKp5DbdwOywHA7x+KnnE+lXqBg=
X-Google-Smtp-Source: ABdhPJxHWZ09Z3PyFi+Vxhf1zbM0wtuvfiwJ26dMwg1qAhPy7R05jGaIUlv+ZLXQXeRAllHhAF8Gkn7AEe12UokWC2E=
X-Received: by 2002:a05:6e02:1212:: with SMTP id
 a18mr17861723ilq.2.1620561621669; 
 Sun, 09 May 2021 05:00:21 -0700 (PDT)
MIME-Version: 1.0
From: Nour-eddine Taleb <1337.noureddine@gmail.com>
Date: Sun, 9 May 2021 12:00:10 +0000
Message-ID: <CAJO4vZwtVrYoMPZ9XoEAUJYgo-rND21eGorPrRF5m6rW4WT76w@mail.gmail.com>
Subject: [PATCH] arch: powerpc: kvm: remove unnecessary casting
To: paulus@ozlabs.org, mpe@ellerman.id.au, benh@kernel.crashing.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 10 May 2021 08:23:42 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

remove unnecessary castings, from "void *" to "struct kvmppc_xics *"

Signed-off-by: Nour-eddine Taleb <1337.noureddine@gmail.com>
---
 arch/powerpc/kvm/book3s_xics.c        | 2 +-
 arch/powerpc/kvm/book3s_xive.c        | 2 +-
 arch/powerpc/kvm/book3s_xive_native.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index 303e3cb096db..9ae74fa551a6 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -1440,7 +1440,7 @@ static int kvmppc_xics_create(struct kvm_device
*dev, u32 type)

 static void kvmppc_xics_init(struct kvm_device *dev)
 {
-    struct kvmppc_xics *xics = (struct kvmppc_xics *)dev->private;
+    struct kvmppc_xics *xics = dev->private;

     xics_debugfs_init(xics);
 }
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index e7219b6f5f9a..05bcaf81a90a 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2242,7 +2242,7 @@ static void xive_debugfs_init(struct kvmppc_xive *xive)

 static void kvmppc_xive_init(struct kvm_device *dev)
 {
-    struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
+    struct kvmppc_xive *xive = dev->private;

     /* Register some debug interfaces */
     xive_debugfs_init(xive);
diff --git a/arch/powerpc/kvm/book3s_xive_native.c
b/arch/powerpc/kvm/book3s_xive_native.c
index 76800c84f2a3..2703432cea78 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1265,7 +1265,7 @@ static void xive_native_debugfs_init(struct
kvmppc_xive *xive)

 static void kvmppc_xive_native_init(struct kvm_device *dev)
 {
-    struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
+    struct kvmppc_xive *xive = dev->private;

     /* Register some debug interfaces */
     xive_native_debugfs_init(xive);
-- 
2.30.2
