Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E2C302AF26C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 14:45:47 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWQwm5v9jzDqMx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 00:45:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=zhuyifei1999@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=vNGoRE4T; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQh00G1NzDqQY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 00:34:39 +1100 (AEDT)
Received: by mail-qt1-x844.google.com with SMTP id p12so1232865qtp.7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 05:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p4ug0/ujexdr5eX2KHZwXV+5OEEE0LQ6CHuZfwOYci4=;
 b=vNGoRE4T2vueWtMyfIqsMJnHQf5sexlSfNm5+JYWvZrbhr28FRAtAv3lFmTY0+4W0Y
 WcYZoYHknNJQqlmA5lKA2IjQ5N2wYEjtpuzYl7OO06EsiIGv6XJZ3Kb9UjRl3/b7/1X8
 XfCjrkryG0QaqerFaC1fcQ9Tr2HyAB4KKtxuVtQp0xutUOI57AMaDr4CA2MgmoE4mjCv
 KB12O8KYoI95e70wD3aaXcRNbfK6zccMr68ebqQN7E8uk7S2TR1coNLaubqwUvBts/Lv
 zorqhisqngJ2ZuCEG1/njxhxTc7yrzx1m99VyQR+bb/RgHndyJV5i+iGi1vdeZUV7FdW
 piDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=p4ug0/ujexdr5eX2KHZwXV+5OEEE0LQ6CHuZfwOYci4=;
 b=AEr6QqjVHa+r6gTTIAFtkc0Xgj4cRKWAKgEFdQiLjT2Eutx1VDkzDUdwHc9bJ4K4RY
 HYHY04LjxpLg8c1DGE2CMJki/EUNObwY7K9Bus/SZcnaIyMFPox5eJhwEqh/UfB67Z3J
 CwMHtjqBDG0AuH9iHPl8HDxSvqeMdMI6eerAqZpH3YJ8zIZjyrFRT9GV+BmiKM+4VukT
 77ZMb5kgRFBbvn8hsU/QUOEjzoBOxAuKoU8YfK4tW8vxOR/DIoB0ht5hGgt8kbkrWQsi
 8W80edhP4RG2cTi99VVaHTptg35uujkyC5XHcssy03i07t9OmQdFdPhUtXPqLcemrZ/W
 yywg==
X-Gm-Message-State: AOAM532zD/IU0GKzhFxCTKOlXzmeoTLSHOns805JqMB5U5ypcO1utK3j
 M0m/oxyfmPgnLbxxQU8IjCY=
X-Google-Smtp-Source: ABdhPJyVXjxkJWplKVPB4NFyM0YLYj5IP428vFSUkWNwwyzA8cf7e/mXCgVyvFukKTHkEaORyR7aHQ==
X-Received: by 2002:aed:39c2:: with SMTP id m60mr12461442qte.206.1605101676823; 
 Wed, 11 Nov 2020 05:34:36 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:36 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 3/8] powerpc: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:49 -0600
Message-Id: <0b64925362671cdaa26d01bfe50b3ba5e164adfd.1605101222.git.yifeifz2@illinois.edu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <cover.1605101222.git.yifeifz2@illinois.edu>
References: <cover.1605101222.git.yifeifz2@illinois.edu>
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
Cc: linux-sh@vger.kernel.org, Tobin Feldman-Fitzthum <tobin@ibm.com>,
 Hubertus Franke <frankeh@us.ibm.com>, Jack Chen <jianyan2@illinois.edu>,
 linux-riscv@lists.infradead.org, Andrea Arcangeli <aarcange@redhat.com>,
 linux-s390@vger.kernel.org, YiFei Zhu <yifeifz2@illinois.edu>,
 linux-csky@vger.kernel.org, Tianyin Xu <tyxu@illinois.edu>,
 linux-xtensa@linux-xtensa.org, Kees Cook <keescook@chromium.org>,
 Jann Horn <jannh@google.com>, Valentin Rothberg <vrothber@redhat.com>,
 Aleksa Sarai <cyphar@cyphar.com>, Josep Torrellas <torrella@illinois.edu>,
 Will Drewry <wad@chromium.org>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
 Dimitrios Skarlatos <dskarlat@cs.cmu.edu>,
 David Laight <David.Laight@aculab.com>,
 Giuseppe Scrivano <gscrivan@redhat.com>, linuxppc-dev@lists.ozlabs.org,
 Tycho Andersen <tycho@tycho.pizza>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: YiFei Zhu <yifeifz2@illinois.edu>

To enable seccomp constant action bitmaps, we need to have a static
mapping to the audit architecture and system call table size. Add these
for powerpc.

__LITTLE_ENDIAN__ is used here instead of CONFIG_CPU_LITTLE_ENDIAN
to keep it consistent with asm/syscall.h.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/powerpc/include/asm/seccomp.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/powerpc/include/asm/seccomp.h b/arch/powerpc/include/asm/seccomp.h
index 51209f6071c5..ac2033f134f0 100644
--- a/arch/powerpc/include/asm/seccomp.h
+++ b/arch/powerpc/include/asm/seccomp.h
@@ -8,4 +8,27 @@
 
 #include <asm-generic/seccomp.h>
 
+#ifdef __LITTLE_ENDIAN__
+#define __SECCOMP_ARCH_LE		__AUDIT_ARCH_LE
+#define __SECCOMP_ARCH_LE_NAME		"le"
+#else
+#define __SECCOMP_ARCH_LE		0
+#define __SECCOMP_ARCH_LE_NAME
+#endif
+
+#ifdef CONFIG_PPC64
+# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC64 | __SECCOMP_ARCH_LE)
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"ppc64" __SECCOMP_ARCH_LE_NAME
+# ifdef CONFIG_COMPAT
+#  define SECCOMP_ARCH_COMPAT		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
+#  define SECCOMP_ARCH_COMPAT_NR	NR_syscalls
+#  define SECCOMP_ARCH_COMPAT_NAME	"ppc" __SECCOMP_ARCH_LE_NAME
+# endif
+#else /* !CONFIG_PPC64 */
+# define SECCOMP_ARCH_NATIVE		(AUDIT_ARCH_PPC | __SECCOMP_ARCH_LE)
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"ppc" __SECCOMP_ARCH_LE_NAME
+#endif
+
 #endif	/* _ASM_POWERPC_SECCOMP_H */
-- 
2.29.2

