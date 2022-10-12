Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2E05FBFCA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 06:03:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnJtK4fcqz2xf7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 15:03:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iES0p44t;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=iES0p44t;
	dkim-atps=neutral
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnJsP5pRbz2xtF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 15:03:04 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id l4so15118885plb.8
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Oct 2022 21:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=czJrj/731IUlvmoVQv8+EB2Iw53LGmAfM1eDO+tGk7M=;
        b=iES0p44tkSov9mAQ1iwQeEwpr2WkeblkbjINuFVKjky5j6OVDtjIw+qJGpJkj4GP8i
         FH611H9QnYI08XmUCVQwJ2aeSG5tr7pIHacCDmmhEtlvxDBX/3N5b6Iw/K1oq2Te/Ao7
         +j1Nnew2r3dsykbSC+IuMYOQL5O9eck+407s6FKCqKqj52tcfOlAtEIHogdvwfLQlgiZ
         6tY7fxncDNzG98hqSaycSP2axlJu9ANZDWWxQQnlBGF+QANONdl+yTOy+ADlK73FTTbf
         jnA5vdH5y6sRcaiL3ENT4RSSrQ6PBRMFigpOSYhfEfwG+tCadQGRuosqLV1m/dZpsDSG
         SQ0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=czJrj/731IUlvmoVQv8+EB2Iw53LGmAfM1eDO+tGk7M=;
        b=s+0zJyn5kwP3jwK/TX7lfgj8PfJjh3xjutR4qr+4lVSVyJXjYmY3hjDRuzC9+sh3GR
         1RAft3KpA/GwZS3ae8S490Zl/k+L7L177mjXEdfm0iIX6xPjML53odWi0kW6IqmmyZJY
         lblWjOgKBbZ1Cd9eKjV2TW0+XiO3C+8vay+Ws5WUQsQgV1fe1A7pRF1FNnPzNAPBu3Ag
         ihw58luH/jjsiJDYc9bpBvhv5mrcRhhQ/nOU14lYKsJ6mNSY3mH4GKNgcERo9dwgeKJe
         7NH47yFJpunMP+MPWs3dV4vYjc8OU6jRNW4f05kdF+VKLLteC7ejpg571NcpoynuxiIc
         NRrg==
X-Gm-Message-State: ACrzQf06FqwwCWHbchR7AVTHdfl7Mh1ztFZ5Bbk/b/1aAJZB1MThGteH
	gLi0NB9HK4FWji2yhqTvebGM5DUv3xU=
X-Google-Smtp-Source: AMsMyM6JAMDkk1mgKqWJTfLjoP/PnCxAvDYWQXI5XV2hCQf3Y4hBbP+IDI8dUxvwb1E0D9U8j9YEhA==
X-Received: by 2002:a17:902:f60b:b0:178:6a49:d4e3 with SMTP id n11-20020a170902f60b00b001786a49d4e3mr28200346plg.75.1665547382565;
        Tue, 11 Oct 2022 21:03:02 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id w11-20020a170902e88b00b0017e64da44c5sm9447140plg.203.2022.10.11.21.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Oct 2022 21:03:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] powerpc: move sync_file_range2 compat definition
Date: Wed, 12 Oct 2022 13:53:35 +1000
Message-Id: <20221012035335.866440-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221012035335.866440-1-npiggin@gmail.com>
References: <20221012035335.866440-1-npiggin@gmail.com>
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
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

sync_file_range2 is not a special unaligned-odd-pair calling convention
syscall, it's just a regular one that does not have a generic compat
definition. Move it out of sys_ppc32.c and into syscalls.c.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
This one doesn't fix anything and is not required for the previous
fix, so it could be merged later. Now that we've repurposed sys_ppc32.c
for the difficult syscalls and compat syscalls live all over the kernel
now anyway, IMO it's makes things less confusing to move this.

Thanks,
Nick

 arch/powerpc/include/asm/syscalls.h | 23 ++++++++++++-----------
 arch/powerpc/kernel/sys_ppc32.c     | 11 -----------
 arch/powerpc/kernel/syscalls.c      | 11 +++++++++++
 3 files changed, 23 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/include/asm/syscalls.h b/arch/powerpc/include/asm/syscalls.h
index a1142496cd58..810ce45d670b 100644
--- a/arch/powerpc/include/asm/syscalls.h
+++ b/arch/powerpc/include/asm/syscalls.h
@@ -79,8 +79,20 @@ long compat_sys_old_getrlimit(unsigned int resource,
 			      struct compat_rlimit __user *rlim);
 long compat_sys_sigreturn(void);
 long compat_sys_rt_sigreturn(void);
+long compat_sys_ppc_sync_file_range2(int fd, unsigned int flags,
+				     unsigned int offset1,
+				     unsigned int offset2,
+				     unsigned int nbytes1,
+				     unsigned int nbytes2);
 #endif /* CONFIG_COMPAT */
 
+#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
+long sys_ppc_fadvise64_64(int fd, int advice,
+			  u32 offset_high, u32 offset_low,
+			  u32 len_high, u32 len_low);
+#endif
+
+
 /*
  * Architecture specific signatures required by long long munging:
  * The 32 bit ABI passes long longs in an odd even register pair.
@@ -123,19 +135,8 @@ long compat_sys_ppc_ftruncate64(unsigned int fd, u32 reg4,
 				unsigned long len1, unsigned long len2);
 long compat_sys_ppc32_fadvise64(int fd, u32 unused, u32 offset1, u32 offset2,
 				size_t len, int advice);
-long compat_sys_ppc_sync_file_range2(int fd, unsigned int flags,
-				     unsigned int offset1,
-				     unsigned int offset2,
-				     unsigned int nbytes1,
-				     unsigned int nbytes2);
 #endif /* CONFIG_COMPAT */
 
-#if defined(CONFIG_PPC32) || defined(CONFIG_COMPAT)
-long sys_ppc_fadvise64_64(int fd, int advice,
-			  u32 offset_high, u32 offset_low,
-			  u32 len_high, u32 len_low);
-#endif
-
 #else
 
 #define __SYSCALL_WITH_COMPAT(nr, native, compat)	__SYSCALL(nr, native)
diff --git a/arch/powerpc/kernel/sys_ppc32.c b/arch/powerpc/kernel/sys_ppc32.c
index 6bdfe11a7689..53927abcda82 100644
--- a/arch/powerpc/kernel/sys_ppc32.c
+++ b/arch/powerpc/kernel/sys_ppc32.c
@@ -111,14 +111,3 @@ PPC32_SYSCALL_DEFINE6(ppc32_fadvise64,
 	return ksys_fadvise64_64(fd, merge_64(offset1, offset2), len,
 				 advice);
 }
-
-COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
-		       int, fd, unsigned int, flags,
-		       unsigned int, offset1, unsigned int, offset2,
-		       unsigned int, nbytes1, unsigned int, nbytes2)
-{
-	loff_t offset = merge_64(offset1, offset2);
-	loff_t nbytes = merge_64(nbytes1, nbytes2);
-
-	return ksys_sync_file_range(fd, offset, nbytes, flags);
-}
diff --git a/arch/powerpc/kernel/syscalls.c b/arch/powerpc/kernel/syscalls.c
index 68ebb23a5af4..8bdc41879045 100644
--- a/arch/powerpc/kernel/syscalls.c
+++ b/arch/powerpc/kernel/syscalls.c
@@ -97,6 +97,17 @@ COMPAT_SYSCALL_DEFINE1(ppc64_personality, unsigned long, personality)
 {
 	return do_ppc64_personality(personality);
 }
+
+COMPAT_SYSCALL_DEFINE6(ppc_sync_file_range2,
+		       int, fd, unsigned int, flags,
+		       unsigned int, offset1, unsigned int, offset2,
+		       unsigned int, nbytes1, unsigned int, nbytes2)
+{
+	loff_t offset = merge_64(offset1, offset2);
+	loff_t nbytes = merge_64(nbytes1, nbytes2);
+
+	return ksys_sync_file_range(fd, offset, nbytes, flags);
+}
 #endif /* CONFIG_COMPAT */
 #endif /* CONFIG_PPC64 */
 
-- 
2.37.2

