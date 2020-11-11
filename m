Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 970282AF289
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Nov 2020 14:51:01 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CWR2q01s9zDqs8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Nov 2020 00:50:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f41;
 helo=mail-qv1-xf41.google.com; envelope-from=zhuyifei1999@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kqmci847; dkim-atps=neutral
Received: from mail-qv1-xf41.google.com (mail-qv1-xf41.google.com
 [IPv6:2607:f8b0:4864:20::f41])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CWQh22d5JzDqSP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Nov 2020 00:34:42 +1100 (AEDT)
Received: by mail-qv1-xf41.google.com with SMTP id 13so855800qvr.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 11 Nov 2020 05:34:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=do2IkGTsgJZMce9dLCi5y9V7vjNX63EvX8bAUDpEGLM=;
 b=kqmci8479r1GmpSX/CsPK24jcw4ackZR09/fqBvzcYwOBOneuWx5PFapDrNR/y91zk
 ExAMU598dyHT/RcJ0vEsvLy4Ops+sFNh3zgqOE4JArPSyF7W9sja/hApRc2rC1Nwm2hJ
 u50FMSKsKEcagX5U7XeUcBUJxC1PhPsCIK1LzOF+1qxQDwvzDgWYavL+OHfPE2kcPPFp
 EApyeIYNOUYqsqaYXaV0Ji65m4GhaGRycYlamUWs8R5m/Eh5ESQ0qNfQZrDakTPeWfnR
 dkjvod65hl/fav16KIifE1cRgTcdlFaQ87PvVYqF5inQSFpWoASygEZjooid8wnIuGLL
 DptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=do2IkGTsgJZMce9dLCi5y9V7vjNX63EvX8bAUDpEGLM=;
 b=ZD+NxTZCqE648E9OSLYtbHDFFyD9F54pGF0eI+FVCXSQDJRgEf3PgB3sPHU4Dq0R5O
 2qzCwEfMs5NsQqhJj04b9TUtJeItMIA7TSVNJMWSYf43pg3LNJVzw/wGCcmWWsklk5J9
 KMNS/EilwudIxmME0mH9zRtih5ejxNEpSNOJFwA3SHAqVZOCfq0XrAJr9rexj+vZvMc/
 UC+AAATBwVqbEz506pOryYxRmdjQxAxnCExdsemW2DGhOwnFaU1UGzxxdOODJYK/3nE6
 rW/lPPCAqJ0Mf99BQ38CO3bqkywIY8cxR0G3p5f6J0+UdfDorboMweCOi3XYiLCshp3U
 nLgw==
X-Gm-Message-State: AOAM533sBdv58jwaduPGCrEOy7o9d1Ex3OqiDMO3dArkrtuIeazO+9bu
 N5fUb/MzSxG9uCWAJ1PRx04=
X-Google-Smtp-Source: ABdhPJzFsUI0zV9/mJU71uSGXIEeuyYH9ZXGj+0WaVMtZXX0iy4+DwFsWuBQL0cgOtuNbH4AHKgOyQ==
X-Received: by 2002:a0c:e443:: with SMTP id d3mr13987966qvm.18.1605101678476; 
 Wed, 11 Nov 2020 05:34:38 -0800 (PST)
Received: from localhost.localdomain
 (host-173-230-99-154.tnkngak.clients.pavlovmedia.com. [173.230.99.154])
 by smtp.gmail.com with ESMTPSA id r190sm1997814qkf.101.2020.11.11.05.34.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 05:34:37 -0800 (PST)
From: YiFei Zhu <zhuyifei1999@gmail.com>
To: containers@lists.linux-foundation.org
Subject: [PATCH seccomp v2 4/8] riscv: Enable seccomp architecture tracking
Date: Wed, 11 Nov 2020 07:33:50 -0600
Message-Id: <58ef925d00505cbb77478fa6bd2b48ab2d902460.1605101222.git.yifeifz2@illinois.edu>
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
for riscv.

Signed-off-by: YiFei Zhu <yifeifz2@illinois.edu>
---
 arch/riscv/include/asm/seccomp.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/seccomp.h b/arch/riscv/include/asm/seccomp.h
index bf7744ee3b3d..c7ee6a3507be 100644
--- a/arch/riscv/include/asm/seccomp.h
+++ b/arch/riscv/include/asm/seccomp.h
@@ -7,4 +7,14 @@
 
 #include <asm-generic/seccomp.h>
 
+#ifdef CONFIG_64BIT
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_RISCV64
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"riscv64"
+#else /* !CONFIG_64BIT */
+# define SECCOMP_ARCH_NATIVE		AUDIT_ARCH_RISCV32
+# define SECCOMP_ARCH_NATIVE_NR		NR_syscalls
+# define SECCOMP_ARCH_NATIVE_NAME	"riscv32"
+#endif
+
 #endif /* _ASM_SECCOMP_H */
-- 
2.29.2

