Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 470E77F39AA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Nov 2023 23:57:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G8bOLuu0;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SZfsw0qwXz3dBd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Nov 2023 09:57:56 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=G8bOLuu0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=namhyung@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SZfs40cy0z3c40
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Nov 2023 09:57:09 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1cc29f39e7aso40274945ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Nov 2023 14:57:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700607427; x=1701212227; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8cHNQWLeaX3Eaeqr4KDeKVPWKASKTSj+iTYazvJzg+8=;
        b=G8bOLuu03TBG0EdYk1S3eRVl9+8AgHdbGttDRGeZhOU9REoQQ7TTwgGYKabgNdJ5Aq
         vnvAFR5XdwduLXiXeBwfF8KdpXRc8qXqNrcuOFvFYXEY2KO7JviDEMh/UYWufBrcRypd
         NZjpXm+GnFKXJq9zOkA/y2kULdUAkTHi5bgc62aMwjpuA2+qWWb/zTiQZBmOB3KG3pUz
         N+Lw5R3YhvpUK8yBSZRLdBLuO8hqqy3/BAuVdSjjyjnLr2gxY7dzyrs83wfYBth4mfzL
         ophHUNNqQ9ndlIdsgJeUoNY9UsbLZo5bRDYj1SBANUpAtb7v84j+KATMo9+v31rrdk6U
         8/Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700607427; x=1701212227;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8cHNQWLeaX3Eaeqr4KDeKVPWKASKTSj+iTYazvJzg+8=;
        b=eZNfYIZwR0BIW1r3IAPK7/p8ud5sBRekv0TyjL7nLaMzQ+CJzwL7JzxdwPtS1TQ7Gp
         gg0syxysVvntQw+qiMcecLtu4ntiVwWosfyh6n/qeMsRmR4vElgwqyRIFQtfWRKMVEa1
         BlWpfBetaH4U4u0R+Zzu1hLJY47h2XtlmR0FXV6edj/1SYYkmAxKk+HAvqb8IHTFY2W6
         VrMN++bZmJ2WpFqY+v0EQWBvZVzHpMKjX7dLB/tgQqtnj9TovskD4HLbWwHtKgd5w4i/
         nPyhvVKzEWcwYfr1izMDkaV2TVsIypqY6thgAjqHmC++/dbq4MF4iqENVwAJqRzDjly+
         E3Lg==
X-Gm-Message-State: AOJu0Yzhm5+aIHc1f/SZeKZ4J2q0fLobfg2SVMGewjblUkqX10HmlKY3
	S+M8D6YkloMUMg5gkR0n46g=
X-Google-Smtp-Source: AGHT+IEqnRZoF/phD6HSzSdY21h0h7tC1I39JtK6IEk90MbB3dit3i9hvRB+rV+MUJcHWL2zIOUb3w==
X-Received: by 2002:a17:903:188:b0:1cf:5782:7c74 with SMTP id z8-20020a170903018800b001cf57827c74mr805479plg.7.1700607427036;
        Tue, 21 Nov 2023 14:57:07 -0800 (PST)
Received: from bangji.hsd1.ca.comcast.net ([2601:647:6780:42e0:7377:923f:1ff3:266d])
        by smtp.gmail.com with ESMTPSA id m12-20020a1709026bcc00b001cc47c1c29csm8413189plt.84.2023.11.21.14.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Nov 2023 14:57:06 -0800 (PST)
From: Namhyung Kim <namhyung@kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH 12/14] tools/perf: Update tools's copy of powerpc syscall table
Date: Tue, 21 Nov 2023 14:56:47 -0800
Message-ID: <20231121225650.390246-12-namhyung@kernel.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231121225650.390246-1-namhyung@kernel.org>
References: <20231121225650.390246-1-namhyung@kernel.org>
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
Cc: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, Adrian Hunter <adrian.hunter@intel.com>, Nicholas Piggin <npiggin@gmail.com>, LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

tldr; Just FYI, I'm carrying this on the perf tools tree.

Full explanation:

There used to be no copies, with tools/ code using kernel headers
directly. From time to time tools/perf/ broke due to legitimate kernel
hacking. At some point Linus complained about such direct usage. Then we
adopted the current model.

The way these headers are used in perf are not restricted to just
including them to compile something.

There are sometimes used in scripts that convert defines into string
tables, etc, so some change may break one of these scripts, or new MSRs
may use some different #define pattern, etc.

E.g.:

  $ ls -1 tools/perf/trace/beauty/*.sh | head -5
  tools/perf/trace/beauty/arch_errno_names.sh
  tools/perf/trace/beauty/drm_ioctl.sh
  tools/perf/trace/beauty/fadvise.sh
  tools/perf/trace/beauty/fsconfig.sh
  tools/perf/trace/beauty/fsmount.sh
  $
  $ tools/perf/trace/beauty/fadvise.sh
  static const char *fadvise_advices[] = {
        [0] = "NORMAL",
        [1] = "RANDOM",
        [2] = "SEQUENTIAL",
        [3] = "WILLNEED",
        [4] = "DONTNEED",
        [5] = "NOREUSE",
  };
  $

The tools/perf/check-headers.sh script, part of the tools/ build
process, points out changes in the original files.

So its important not to touch the copies in tools/ when doing changes in
the original kernel headers, that will be done later, when
check-headers.sh inform about the change to the perf tools hackers.

Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Namhyung Kim <namhyung@kernel.org>
---
 tools/perf/arch/powerpc/entry/syscalls/syscall.tbl | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
index e1412519b4ad..7fab411378f2 100644
--- a/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
+++ b/tools/perf/arch/powerpc/entry/syscalls/syscall.tbl
@@ -539,3 +539,7 @@
 450 	nospu	set_mempolicy_home_node		sys_set_mempolicy_home_node
 451	common	cachestat			sys_cachestat
 452	common	fchmodat2			sys_fchmodat2
+453	common	map_shadow_stack		sys_ni_syscall
+454	common	futex_wake			sys_futex_wake
+455	common	futex_wait			sys_futex_wait
+456	common	futex_requeue			sys_futex_requeue
-- 
2.43.0.rc1.413.gea7ed67945-goog

