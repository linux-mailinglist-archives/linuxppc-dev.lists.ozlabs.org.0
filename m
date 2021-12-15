Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B071476BD1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 09:23:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF4r831cvz3f0g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 19:23:20 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fiARBmrY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82f;
 helo=mail-qt1-x82f.google.com; envelope-from=nnac123@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fiARBmrY; dkim-atps=neutral
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDgKM0X8vz2yPd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 03:13:42 +1100 (AEDT)
Received: by mail-qt1-x82f.google.com with SMTP id m25so22247501qtq.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 08:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OE3+5CpxkYX4iMQfoMPd+nrcMF/Lyjn5CJWDEbn23FI=;
 b=fiARBmrYpgwXUaBEI4P5ZxhcLSy4nourz5ytErTt6eOAo1R63Zy6MnWE82aP9K4cAY
 y8GgLCmH3wg6Fa+UlfFr2rEgJJdsrzhWP1h3WPAdjkwsJf3dOAOwlz2pzlPS/Ca/KCDN
 TpEYzYoFIvU8K8gVp6XZUdTSYIoqW8VKrnrUtf8aBn1YR+jjGGGXj+N20l+mg6hIJVfN
 aJ6FNrMk/RgRfDItoKv3JsTC8hiXZOrqBNDwEiL6s3NyYHHyLrQizS3uIdsG/DlEsOjT
 dmkdqmgEZTValmf+XVbSg4tcJQg4VB8iWGd35qoh2nC2hfNmCXjHr/dwiGhOqxMdAOBr
 k2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OE3+5CpxkYX4iMQfoMPd+nrcMF/Lyjn5CJWDEbn23FI=;
 b=5XYWJ8ybCsp4QVN3eVJ7Zzt6VLqVdB9c4NYt+OtaeVxq+EdyiwSwouJEiuVouAJZGv
 tnYZCa8+SwEbDcGmCCMpuJTcKNUFAJ6Vmx2pYc4U2v11m5ThjY9bhwvGXK+9hBP5wFBW
 9+Qjjbuh7/Vs49zyoPswOESiIGsQ9+Ev5flMCGsbOfw9ncOtLHC9ZwawTHHaxdEQA3GC
 K4x3k0Nrm9hUlG0RMh7OCJntNKaIBEgVjoRQ6vohEGFaN2HMwgSurQcjHsBilmuFJ7uu
 hVTh6DiPRJHyuTtJYMpmtjEKN5Z2EOLprG3BIxC0rU2jt0aqplgtveFvUgsDZAH+jV/k
 zTgQ==
X-Gm-Message-State: AOAM531dhV0HqoFmNPvjGfTIt2N0bJZjxk6i0GHC9EFZMDQtrXkNalwC
 tCt72DZF67gZhZOmMJTlWlHcwxyCQ8Q=
X-Google-Smtp-Source: ABdhPJzaUC9FCobD9Zuk4BkYrKLRZb6CPp4tFsykC34oALSblps/WBO3gE4HgHepFvL1hPf9+MTjYg==
X-Received: by 2002:a05:622a:120d:: with SMTP id
 y13mr12546351qtx.155.1639584820462; 
 Wed, 15 Dec 2021 08:13:40 -0800 (PST)
Received: from starship-12.hsd1.fl.comcast.net
 ([2601:589:4a00:1ed0:73:d0b0:acf1:e2d0])
 by smtp.gmail.com with ESMTPSA id t11sm1276436qkp.56.2021.12.15.08.13.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Dec 2021 08:13:39 -0800 (PST)
From: Nick Child <nnac123@gmail.com>
X-Google-Original-From: Nick Child <nick.child@ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 20/20] cuda/pmu: Make find_via_cuda/pmu init functions
Date: Wed, 15 Dec 2021 11:12:43 -0500
Message-Id: <20211215161243.16396-21-nick.child@ibm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211215161243.16396-1-nick.child@ibm.com>
References: <20211215161243.16396-1-nick.child@ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 16 Dec 2021 19:09:28 +1100
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
Cc: Nick Child <nick.child@ibm.com>, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make `find_via_cuda` and `find_via_pmu` initialization functions.
Previously, their definitions in `drivers/macintosh/via-cuda.h` include the
`__init` attribute but their alternative definitions in `arch/powerpc/powermac
/sectup./c` and prototypes in `include/linux/cuda.h` and `include/linux/
pmu.h` do not use the `__init` macro. Since, only initialization functions
call `find_via_cuda` and `find_via_pmu` it is safe to label these functions
with `__init`.

Signed-off-by: Nick Child <nick.child@ibm.com>
---
 arch/powerpc/platforms/powermac/setup.c | 4 ++--
 include/linux/cuda.h                    | 2 +-
 include/linux/pmu.h                     | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platforms/powermac/setup.c
index f7661b81db18..974d4b49867b 100644
--- a/arch/powerpc/platforms/powermac/setup.c
+++ b/arch/powerpc/platforms/powermac/setup.c
@@ -166,7 +166,7 @@ static void pmac_show_cpuinfo(struct seq_file *m)
 }
 
 #ifndef CONFIG_ADB_CUDA
-int find_via_cuda(void)
+int __init find_via_cuda(void)
 {
 	struct device_node *dn = of_find_node_by_name(NULL, "via-cuda");
 
@@ -180,7 +180,7 @@ int find_via_cuda(void)
 #endif
 
 #ifndef CONFIG_ADB_PMU
-int find_via_pmu(void)
+int __init find_via_pmu(void)
 {
 	struct device_node *dn = of_find_node_by_name(NULL, "via-pmu");
 
diff --git a/include/linux/cuda.h b/include/linux/cuda.h
index 45bfe9d61271..e1bfbcadb601 100644
--- a/include/linux/cuda.h
+++ b/include/linux/cuda.h
@@ -12,7 +12,7 @@
 #include <uapi/linux/cuda.h>
 
 
-extern int find_via_cuda(void);
+extern int find_via_cuda(void) __init;
 extern int cuda_request(struct adb_request *req,
 			void (*done)(struct adb_request *), int nbytes, ...);
 extern void cuda_poll(void);
diff --git a/include/linux/pmu.h b/include/linux/pmu.h
index 52453a24a24f..bfe891eb6e0f 100644
--- a/include/linux/pmu.h
+++ b/include/linux/pmu.h
@@ -13,7 +13,7 @@
 #include <uapi/linux/pmu.h>
 
 
-extern int find_via_pmu(void);
+extern int find_via_pmu(void) __init;
 
 extern int pmu_request(struct adb_request *req,
 		void (*done)(struct adb_request *), int nbytes, ...);
-- 
2.25.1

