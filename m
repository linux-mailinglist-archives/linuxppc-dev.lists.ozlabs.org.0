Return-Path: <linuxppc-dev+bounces-11510-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3186AB3C7A1
	for <lists+linuxppc-dev@lfdr.de>; Sat, 30 Aug 2025 05:48:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cDLgy6dxsz2yrV;
	Sat, 30 Aug 2025 13:47:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::42b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1756525678;
	cv=none; b=U8fZ0ZIm39oVPBPjexcg1odfOU+/xGQDU0S6E9Ebb2uQOE3PqvKpJWcMkivrerCNXdYpZKr53O64Y33lCuphetzV6nD5Phqi+4DpglVASGhPrLhGmeOistK7GUDhjxaXWzCsDPZQwrKjPrmUHY3gte65MZJnxP3WuFQ3KD966UhiRBO50EuOO+hpQNWX6rl53sIsLnedUGcFPJ7P/ig/0ORImEycCl2ofGj3HpJEn+RYyRYeNPM0eHXzOJZ4kX6x2Eu9kNTtiPg2jnIgtHa21TSXahM+efSCnd9w9jwj5V350J6euYa/HDDt7uGMVQj4fiobV8oUzS9fya0m7UlPbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1756525678; c=relaxed/relaxed;
	bh=k2/fTYqyaBTbwpgo0An7jaT7XL2U1DhZhZo81MDgLHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PtyO8w5NToMNEq6gLBRdiBUwb0UdhYfexwLEGtvEcgGBQefcBnZQFB5r+CgTmVXOUSjoSBw1lEDJN84juh3nsrfzDtqylpngHhkVIuoi3WaCoWro9Ocu+l42CbRY2JWNAAG38Fm4kStj7ah03dPKMT6po4SPFPdwivb7yJ7qZoD3rujmxD/lm00+5DqlthMz0JlbR/3GR78ASYIQ0q8elxD/UqDcAPQ3O5XeeYdtA6ga4TsCuxw3XdqExbxy1RhD1i8o1MLpgv40SVBYg+8lpiLxTKrhFdrHhIA94OadU1jAQUXY6mEiHVoMg6el8aG0R2FmOk2AaXXCSXsBHMBN+Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mcnQSvib; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=mcnQSvib;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b; helo=mail-pf1-x42b.google.com; envelope-from=ritesh.list@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cDLgx2vn3z2yLJ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 30 Aug 2025 13:47:56 +1000 (AEST)
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-771f90a45easo2327738b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Aug 2025 20:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756525673; x=1757130473; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=k2/fTYqyaBTbwpgo0An7jaT7XL2U1DhZhZo81MDgLHY=;
        b=mcnQSvibhwcZ+oXXh9aDdicjF6Rb4wCkkQHtSIVhk6UEDiUBVaHlJodJZaHsjfUjwo
         OudtxezMJOpIBvxQN0vXqCcgpUQvwe3ls4PQh3qpVmuIrvieezQEEFRPUERK/Ej2RWD3
         8DDcCg0eHOTxiolZp3MrW/lGyI1VX7ldNchdbXSkoSwNDPcsGkOZRm7buuR9aZnq2IBN
         nYqdDSgit7uU7hjJwVl8G9S5Oz85gQzPFi82+zF7kQnKn0W3TDjF2HrJk0qyTFCqgtLD
         ZjbGtTbCU4c06nEsgaWqSQtA0fuRoPh8u9xNNtk8E9VRBClyLZIFFIHk7IBDg8eAtrj4
         JEpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756525673; x=1757130473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k2/fTYqyaBTbwpgo0An7jaT7XL2U1DhZhZo81MDgLHY=;
        b=lfOBNAEZzs+9PVqFhnNkLlIpi4UujLPK16+t6+hoN83HhubUFxXvoxw0C7lyEntttG
         812AslYYG0DOK6uggHG8t6IfG1YsAKjQ0LYkZSgoaeM5OO7lA+YG5StWdWFPHYq7lju1
         zUQT1TYbowmu+1zPiY8IN3V22xoMcj4udN5pli0M73QUb8aVzxRVoUA9knbBuMGIiUFL
         ou11ntUDQD9DSuqZawrJfhS6Avw9Wx3Dm7Os1foulnXSGJb58DX8D/scaL2mWd6Zh1Rg
         Pxdi8sierulduW/isDG7zO9WV8xSkLVGlTYVxywP3wo/NvCMxRgCAIIuQaFwZGo+XmJx
         vPKg==
X-Forwarded-Encrypted: i=1; AJvYcCVPCa5JM4TfzmHlU23lWXFHkBkdl+1HMfNAvfdphzMsDT34ihaO/J8PxsXZ7umfvwoU1n00UFY6nmfvvIo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyDVxHCuA9oroVpKVX9tSKt2ediNLw1X3+HPdmZA9pbmwObBy4p
	J+DAu0VoSx78sB55p/NJroHAZ4rLPAhWGsksm64qcpmsjIhxIOP+CO9B
X-Gm-Gg: ASbGncsd8TURuMzHBTUcirLHH/+31SPTuYXA80t4xdaCJHeBO32jcbxd+WwX5wvK0Qp
	HKyf/gzLyxxv85bLBMBnvJXaPsTJkULepn2AD/i+Uy9FlyHtzKXKtrvFEctCHfHOXeCq2MIf8ph
	PZMNNA9UHGxcNUGJF5Vbb/gcrGi/wrP+9bqzsdH9DuTNlDSRcP4RL5tpoDzDOYiFY+jvciv1xYR
	6iyPnIwaIhhpXWl6x25G5O3gwIJvY5AephOGWz8gWdLgJ/FK4DpGDa0p0i6ybD01Qf015vMpWIA
	XLN7Fsdd/ZUX1NGkhncmks850ZgECEWHB/Yc9RCKsMWeENtAgMhbLbXDKzuDds7xAa9ySh93ycT
	X2rb8TSuqpDdyHuIfrImUci3vBQ==
X-Google-Smtp-Source: AGHT+IEMUOTTpvLMbolO+IXe1S6PRSxHMgqxOU9soR4dq9x7m5tSAn/EQ70/OQyCkognPBo3oY67LQ==
X-Received: by 2002:aa7:8895:0:b0:771:fab2:83ca with SMTP id d2e1a72fcca58-7723e21e641mr1114145b3a.4.1756525673320;
        Fri, 29 Aug 2025 20:47:53 -0700 (PDT)
Received: from dw-tp ([171.76.86.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4ba1d8sm3895377b3a.51.2025.08.29.20.47.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 20:47:52 -0700 (PDT)
From: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
To: Jan Kiszka <jan.kiszka@siemens.com>,
	Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	"Ritesh Harjani (IBM)" <ritesh.list@gmail.com>
Subject: [PATCH 01/02] scripts/gdb/cpus: Add support for get_current_task for powerpc book3s64
Date: Sat, 30 Aug 2025 09:15:34 +0530
Message-ID: <cc4af3fa0fcda2a52cbbab05463e0ad0561fd017.1756521755.git.ritesh.list@gmail.com>
X-Mailer: git-send-email 2.50.1
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

This adds support to query p $lx_current() for ppc64 book3s64.
This allows us to utilize gdb scripts functions like:

function lx_current
function lx_task_by_pid
function lx_thread_info
function lx_thread_info_by_pid

e.g.
(gdb) p $lx_current()->comm
$1 = "swapper\000\000\000\000\000\000\000\00

Signed-off-by: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
---
 scripts/gdb/linux/constants.py.in |  1 +
 scripts/gdb/linux/cpus.py         | 17 ++++++++++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/scripts/gdb/linux/constants.py.in b/scripts/gdb/linux/constants.py.in
index c3886739a028..154db10fe94a 100644
--- a/scripts/gdb/linux/constants.py.in
+++ b/scripts/gdb/linux/constants.py.in
@@ -152,6 +152,7 @@ if IS_BUILTIN(CONFIG_ARM64):
     LX_VALUE(CONFIG_ARM64_VA_BITS)
     LX_VALUE(CONFIG_PAGE_SHIFT)
     LX_VALUE(CONFIG_ARCH_FORCE_MAX_ORDER)
+LX_CONFIG(CONFIG_PPC_BOOK3S_64)
 LX_CONFIG(CONFIG_SPARSEMEM)
 LX_CONFIG(CONFIG_SPARSEMEM_EXTREME)
 LX_CONFIG(CONFIG_SPARSEMEM_VMEMMAP)
diff --git a/scripts/gdb/linux/cpus.py b/scripts/gdb/linux/cpus.py
index 6edf4ef61636..c250de14ac19 100644
--- a/scripts/gdb/linux/cpus.py
+++ b/scripts/gdb/linux/cpus.py
@@ -13,7 +13,7 @@

 import gdb

-from linux import tasks, utils
+from linux import tasks, utils, constants


 task_type = utils.CachedType("struct task_struct")
@@ -207,6 +207,21 @@ def get_current_task(cpu):
             current_task = scratch_reg.cast(task_ptr_type)

         return current_task.dereference()
+    elif utils.is_target_arch("powerpc"):
+        if not constants.LX_CONFIG_PPC_BOOK3S_64:
+            raise gdb.GdbError('For now only supported for BOOK3S_64')
+
+        msr = gdb.parse_and_eval("(unsigned long)$msr")
+        # PR (Problem State) should be 0 for kernel mode
+        in_kernel = msr & (0x1 << 14) == 0
+        if in_kernel:
+            paca_ptr_type = gdb.lookup_type("struct paca_struct").pointer()
+            paca_ptr = gdb.parse_and_eval("$r13")
+            paca = paca_ptr.cast(paca_ptr_type).dereference()
+            return paca["__current"].cast(task_ptr_type).dereference()
+        else:
+            raise gdb.GdbError("Sorry, obtaining the current task is not allowed "
+                               "while running in userspace (Problem State)")
     else:
         raise gdb.GdbError("Sorry, obtaining the current task is not yet "
                            "supported with this arch")
--
2.50.1


