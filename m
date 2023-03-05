Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB6B06AB267
	for <lists+linuxppc-dev@lfdr.de>; Sun,  5 Mar 2023 22:05:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVDkx3znKz3fQk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 08:05:45 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aaSodGvZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=ubizjak@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=aaSodGvZ;
	dkim-atps=neutral
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVDY0180Qz3cdL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Mar 2023 07:57:08 +1100 (AEDT)
Received: by mail-ed1-x52f.google.com with SMTP id u9so30877617edd.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 05 Mar 2023 12:57:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678049827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Rhi81UV6n4gJ23KpYxVv3UnO+FDfYmlmuIH3bT2sEE=;
        b=aaSodGvZdSV4IP+c2rumCkx8LxrQY+OBcusU42ckg9I4HKl7svI97bHUL8PVa79jUn
         xPkYv74szn3W9Ezoiv7g17E92uqKZF9Q6lBk+rGSEagwXuvpV3i07e8Pkz9ghdOWM4i1
         iAl7K94WX200NR6mzgorkcWMi2oDE5W7MB8oFzbbHYstFEsoUP9VT8+2rb1+kLDxgFBE
         ZcscWfl9eYRBg4Ct/7ikk8jQHl/U1WRWKyYDrbRBQqttA6QIp2sq8CY+PM01/wuGFC2y
         y6zmednb1IPxVz9Qo9+FsPJS256xZdDaz0IlmMKsI4jFxJQKu6pKz93CrGfjPPmVLESV
         KAMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678049827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Rhi81UV6n4gJ23KpYxVv3UnO+FDfYmlmuIH3bT2sEE=;
        b=cFWq3ttj532QabDIXsSChcehN+yYVCekwUaXaL8Hs0ahgFU18cIgU75KrODPJEv6lS
         /OU5hY+6r7yEjcBuSfzQl4VrtKYIIVIczVaYLFV9jtlJ1SgzL4u8EnTU39jgS6ubYSUq
         VbkzJBg0XmN2T+2LVxmOKH+Xqy/BXMB4Qduy0+MdmICq3Y9m35FNezINLeQNI2QMvSE/
         xp5h213ns97LgF0f8idgnurAIogn0+4HE5oMGNtS0fXuJZvgRe0T0/PHu7fSDOV8j7yV
         0PLMMAX/x8tHsLhTHAijpNw/IYwWAYhTWgHUy2OgxQ2F7pEvOMV8hGvqQw6Xq3UQ/ox4
         BIVg==
X-Gm-Message-State: AO0yUKUnASSsYjRzKspleu+1L3/AHPmCgJ6YoA/KDATfg7bO6tgpCcr0
	wvlIeo3Lg4efkiCmpy4lM5Y=
X-Google-Smtp-Source: AK7set9KsKppg5AWKoMtA+hKEWxwqg26/PPfzfADGxEx0JJl9+WRzjaOFmjzce84cTTXvCp3CMtMKA==
X-Received: by 2002:a17:906:408f:b0:8b1:7968:7fb8 with SMTP id u15-20020a170906408f00b008b179687fb8mr9606766ejj.62.1678049827406;
        Sun, 05 Mar 2023 12:57:07 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id ay24-20020a170906d29800b0090953b9da51sm3615436ejb.194.2023.03.05.12.57.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Mar 2023 12:57:07 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arch@vger.kernel.org,
	linux-perf-users@vger.kernel.org
Subject: [PATCH 09/10] locking/x86: Enable local{,64}_try_cmpxchg
Date: Sun,  5 Mar 2023 21:56:27 +0100
Message-Id: <20230305205628.27385-10-ubizjak@gmail.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230305205628.27385-1-ubizjak@gmail.com>
References: <20230305205628.27385-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Dave Hansen <dave.hansen@linux.intel.com>, Uros Bizjak <ubizjak@gmail.com>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Enable local_try_cmpxchg and also local64_try_cmpxchg for x86_64.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
---
 arch/x86/include/asm/cmpxchg.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/include/asm/cmpxchg.h b/arch/x86/include/asm/cmpxchg.h
index 94fbe6ae7431..e8f939e8432e 100644
--- a/arch/x86/include/asm/cmpxchg.h
+++ b/arch/x86/include/asm/cmpxchg.h
@@ -221,9 +221,15 @@ extern void __add_wrong_size(void)
 #define __try_cmpxchg(ptr, pold, new, size)				\
 	__raw_try_cmpxchg((ptr), (pold), (new), (size), LOCK_PREFIX)
 
+#define __try_cmpxchg_local(ptr, pold, new, size)			\
+	__raw_try_cmpxchg((ptr), (pold), (new), (size), "")
+
 #define arch_try_cmpxchg(ptr, pold, new) 				\
 	__try_cmpxchg((ptr), (pold), (new), sizeof(*(ptr)))
 
+#define arch_try_cmpxchg_local(ptr, pold, new) 				\
+	__try_cmpxchg_local((ptr), (pold), (new), sizeof(*(ptr)))
+
 /*
  * xadd() adds "inc" to "*ptr" and atomically returns the previous
  * value of "*ptr".
-- 
2.39.2

