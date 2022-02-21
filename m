Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2944C067A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 01:56:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Hf81r8kz30QY
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 11:56:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=i8nDzUKL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::229;
 helo=mail-oi1-x229.google.com; envelope-from=magalilemes00@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=i8nDzUKL; dkim-atps=neutral
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com
 [IPv6:2607:f8b0:4864:20::229])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2dJ24d5Xz2xDv
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Feb 2022 10:08:01 +1100 (AEDT)
Received: by mail-oi1-x229.google.com with SMTP id 12so4557941oix.12
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 15:08:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K9hTlkQ4IuC5xmGrUgF+6JWWC3ZwdH6QIpXtFbws0g=;
 b=i8nDzUKLL6rl5JY+BgTbruX22+HINcIGZojgBS+l7EOBSHob/zHQxoKz/rkvzwl1jO
 9YerA5fgBQmJIwTTi6k6UHdz3vUY/X7TxrmsFdswjaJbTgyLqJYI5TRX4qblgzViScrE
 PM5cu952Udn/bV639XnzW7WxzS5pw5h71bhAk2VA+wSZYd8ywnLmyqjJNTB7kHbHm2Te
 USBLUR7yd5Wut+NDPKADvaLjbtefpgdz6NqyJjBGvJve/L7j1nmkE584JVP6jdVZSwTf
 8rBzO56Zby58yhsJAUY/Kg0InO05ihiGpt7p5+9yROxNHi66vc2JfpCRRZYA/vCReqlX
 /rkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6K9hTlkQ4IuC5xmGrUgF+6JWWC3ZwdH6QIpXtFbws0g=;
 b=j6PD5VuGnRtRt0uCKgBqe3JUnEOrAh8fjrXbLwMBygnDbL595KLqnQjBtX9j2RWbDz
 TPrw5cdWhmkywDrVBYdbG20Zq/YfbcUHAfJ5DyHUwzmlwkT0yPI1nMto9X3es4nI3DI3
 REPj4cO3elkZP2BfqDJrIf6+pFw/dYQxvYt5xcBARGLdYmEf1G7GXDlZNcqVd9jogfp/
 PPuFfJoWGPBypLunraA2FiFmMIxdQ/ZO9q6eLKxY5bN4nViq6Bp+dx45BMtLTLH6W+GN
 ETPp4DuZ1lZ6h9SSHCfkf/4nUR28/Phfs+0ndBgwhLPevgXDGIjBEtLsDyQ4j0M36rKG
 LQ8A==
X-Gm-Message-State: AOAM533cU1Y9nJaslZMNl08RW2cpy54PUhHMOks9oAtD0RYhip0xzO4B
 25CYQFjxPibE/MgaBGqXncA=
X-Google-Smtp-Source: ABdhPJxCfUmPQeVI/1O8188AGEILF/Zou414Etg6LvUSSQRojMCG4adcQooCcGCcPJHByAYwAym59g==
X-Received: by 2002:a05:6808:128f:b0:2d5:3582:f5fa with SMTP id
 a15-20020a056808128f00b002d53582f5famr650923oiw.283.1645484874334; 
 Mon, 21 Feb 2022 15:07:54 -0800 (PST)
Received: from localhost.localdomain ([189.78.255.5])
 by smtp.gmail.com with ESMTPSA id z4sm6142794otu.24.2022.02.21.15.07.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Feb 2022 15:07:54 -0800 (PST)
From: Magali Lemes <magalilemes00@gmail.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc: Fix missing declaration of
 [en/dis]able_kernel_altivec()
Date: Mon, 21 Feb 2022 20:07:41 -0300
Message-Id: <20220221230741.293064-1-magalilemes00@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 23 Feb 2022 11:55:28 +1100
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
Cc: kernel test robot <lkp@intel.com>, siqueirajordao@riseup.net,
 Magali Lemes <magalilemes00@gmail.com>, sunpeng.li@amd.com, maira.canal@usp.br,
 Xinhui.Pan@amd.com, Rodrigo.Siqueira@amd.com, linuxppc-dev@lists.ozlabs.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org, mwen@igalia.com,
 alexander.deucher@amd.com, isabbasso@riseup.net, harry.wentland@amd.com,
 christian.koenig@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

When CONFIG_PPC64 is set and CONFIG_ALTIVEC is not the following build
failures occur:

   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_begin':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:61:17: error: implicit declaration of function 'enable_kernel_altivec'; did you mean 'enable_kernel_vsx'? [-Werror=implicit-function-declaration]
      61 |                 enable_kernel_altivec();
         |                 ^~~~~~~~~~~~~~~~~~~~~
         |                 enable_kernel_vsx
   drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c: In function 'dc_fpu_end':
>> drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/dc_fpu.c:89:17: error: implicit declaration of function 'disable_kernel_altivec'; did you mean 'disable_kernel_vsx'? [-Werror=implicit-function-declaration]
      89 |                 disable_kernel_altivec();
         |                 ^~~~~~~~~~~~~~~~~~~~~~
         |                 disable_kernel_vsx
   cc1: some warnings being treated as errors

This commit adds stub instances of both enable_kernel_altivec() and
disable_kernel_altivec() the same way as done in commit bd73758803c2
regarding enable_kernel_vsx() and disable_kernel_vsx().

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Magali Lemes <magalilemes00@gmail.com>
---
 arch/powerpc/include/asm/switch_to.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
index 1f43ef696033..aee25e3ebf96 100644
--- a/arch/powerpc/include/asm/switch_to.h
+++ b/arch/powerpc/include/asm/switch_to.h
@@ -62,6 +62,15 @@ static inline void disable_kernel_altivec(void)
 #else
 static inline void save_altivec(struct task_struct *t) { }
 static inline void __giveup_altivec(struct task_struct *t) { }
+static inline void enable_kernel_altivec(void)
+{
+	BUILD_BUG();
+}
+
+static inline void disable_kernel_altivec(void)
+{
+	BUILD_BUG();
+}
 #endif
 
 #ifdef CONFIG_VSX
-- 
2.25.1

