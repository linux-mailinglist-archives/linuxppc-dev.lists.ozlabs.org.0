Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E092679F3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 13:28:45 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BpVkL6qWFzDrGG
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Sep 2020 21:28:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::541;
 helo=mail-pg1-x541.google.com; envelope-from=keescook@chromium.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256
 header.s=google header.b=AHH/amkQ; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BpVH70yBWzDqmY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 21:08:35 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id v15so8207714pgh.6
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Sep 2020 04:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pONZKNsoYmecan6Kvfo6IohiIkOTvwMfLoaC7wDxjJY=;
 b=AHH/amkQdeWLyBAxU3pffopTPxgFrBFBprJ+PpEdvWf1lAYD5H+lgruCFy2n/X0+XX
 yY7j6ILtJvVkoXTgPU/Q0Nx0Ff/quYRXHPXNvwJmR6j+U5zNUucDghfcm6CBWGBetvGy
 4eTIchjU58tkxxv/jWjM7df5Qqcmyycxt1Xts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pONZKNsoYmecan6Kvfo6IohiIkOTvwMfLoaC7wDxjJY=;
 b=Q0Rw+6cAm5PEcogPvtlvF/k6uLi3ezwVdevnWn8ApAOigeOVJWdvwMc9zHFhJ+rKTa
 MfODH3smf0itpz2CUxJ5rK39VVy8JPTeFK3E+jad2DWaADEuOYce4aSLdYbU5ugyip8y
 vVjSewYuq7NL/9mfz1ZYmLxboq/CXvWZiHu4WYXB/jxuR6HQew58uz5rs/Ip8r1B2q0M
 92JQrYHe96dVIev05VQqeEpphOTfL+G0T72U5pAKTWOmuoQmH96BbHNtczSE2qwoyRVJ
 ywoP8/bi320WEKK0PCsLf44ESeuRobnAEVzfTEtbBNsef6WI45NMV8j/Bdnl28X0tSi8
 +qrw==
X-Gm-Message-State: AOAM533U2kTaSxZS9+i8OYV0zZIgpSOnwJQwb0rrFRpjO+1f+xBKv3CD
 ZDAbbSMiBZvN1T7v5ZezdVx9Yw==
X-Google-Smtp-Source: ABdhPJxh5feYLWNyYkQfm0AMemI2YVevpROI7r4tOHO1a8H0MHk0I/H+X87vqakNf9zn1pnikeC7qw==
X-Received: by 2002:a05:6a00:8c5:b029:13e:ce2c:88bd with SMTP id
 s5-20020a056a0008c5b029013ece2c88bdmr5950676pfu.0.1599908913398; 
 Sat, 12 Sep 2020 04:08:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
 by smtp.gmail.com with ESMTPSA id np1sm4004435pjb.2.2020.09.12.04.08.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Sep 2020 04:08:27 -0700 (PDT)
From: Kees Cook <keescook@chromium.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 12/15] selftests/seccomp: powerpc: Fix seccomp return value
 testing
Date: Sat, 12 Sep 2020 04:08:17 -0700
Message-Id: <20200912110820.597135-13-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200912110820.597135-1-keescook@chromium.org>
References: <20200912110820.597135-1-keescook@chromium.org>
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>,
 Will Drewry <wad@chromium.org>, Kees Cook <keescook@chromium.org>,
 linux-xtensa@linux-xtensa.org, linux-mips@vger.kernel.org,
 Andy Lutomirski <luto@amacapital.net>, Max Filippov <jcmvbkbc@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-kselftest@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Christian Brauner <christian@brauner.io>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On powerpc, the errno is not inverted, and depends on ccr.so being
set. Add this to a powerpc definition of SYSCALL_RET_SET().

Co-developed-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Signed-off-by: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>
Link: https://lore.kernel.org/linux-kselftest/20200911181012.171027-1-cascardo@canonical.com/
Fixes: 5d83c2b37d43 ("selftests/seccomp: Add powerpc support")
Signed-off-by: Kees Cook <keescook@chromium.org>
---
 tools/testing/selftests/seccomp/seccomp_bpf.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/seccomp/seccomp_bpf.c b/tools/testing/selftests/seccomp/seccomp_bpf.c
index 623953a53032..bbab2420d708 100644
--- a/tools/testing/selftests/seccomp/seccomp_bpf.c
+++ b/tools/testing/selftests/seccomp/seccomp_bpf.c
@@ -1750,6 +1750,21 @@ TEST_F(TRACE_poke, getpid_runs_normally)
 # define ARCH_REGS		struct pt_regs
 # define SYSCALL_NUM(_regs)	(_regs).gpr[0]
 # define SYSCALL_RET(_regs)	(_regs).gpr[3]
+# define SYSCALL_RET_SET(_regs, _val)				\
+	do {							\
+		typeof(_val) _result = (_val);			\
+		/*						\
+		 * A syscall error is signaled by CR0 SO bit	\
+		 * and the code is stored as a positive value.	\
+		 */						\
+		if (_result < 0) {				\
+			SYSCALL_RET(_regs) = -result;		\
+			(_regs).ccr |= 0x10000000;		\
+		} else {					\
+			SYSCALL_RET(_regs) = result;		\
+			(_regs).ccr &= ~0x10000000;		\
+		}						\
+	} while (0)
 #elif defined(__s390__)
 # define ARCH_REGS		s390_regs
 # define SYSCALL_NUM(_regs)	(_regs).gprs[2]
-- 
2.25.1

