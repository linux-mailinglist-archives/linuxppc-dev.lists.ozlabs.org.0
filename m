Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C3F9C446
	for <lists+linuxppc-dev@lfdr.de>; Sun, 25 Aug 2019 16:08:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46GcSQ29pKzDqY6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Aug 2019 00:08:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::542; helo=mail-pg1-x542.google.com;
 envelope-from=changbin.du@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="GO/PVWf3"; 
 dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46GbV35vJZzDqdp
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 23:25:15 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id k3so8734453pgb.10
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 25 Aug 2019 06:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0QzXKgHJNJjac27m2EIm1Lz0/kAofQ72J+526iejRFQ=;
 b=GO/PVWf3Aip/lj76SnUDb0sMdXD+1tVF4Pr4MtQbEEKh9xmXb2UDDeimXy+D9tSRoG
 ONfI3x+1GnVxlk4972mu5UBRbB3v9cDn0s0GXIfDvUkoxvFpZB7qpM3Wm7svq08IqXES
 3/9H/nvW/APPaP6DXd/ZlsqTaXXFgfY5nbRum3oET7EhpHDQM6O7aQgrLYUCx31vh/tp
 Pj3jnXMeh/9xoFgvF62TEqWkl9dtlG9kZEQ23LqbLsRsqn9qkIxzDaA35xnLfCdk7Yvg
 kdWiDXZHWBnkOUGF5K8KzJ635D2qzEbl/F8Ge9MZplop+b+vPJfi/jVV3tdF7l5wEKUI
 HPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0QzXKgHJNJjac27m2EIm1Lz0/kAofQ72J+526iejRFQ=;
 b=dRoNug4dD4j9l9Q52wrV28z1h7olouaH6eteBL14JkL1/ktU1/ja+pDen3pLl1DGmV
 A4mNAN05rsju/8e941iiYaZT7FlaWxVoQu7qnSpKnPn2UPL5CmKblaD7GwI97lKmY6AX
 Kav8iTzKdFxIVfF3yErDFLf3grdZStzhybT/xF2r3ccBLRWtYiiFgOLGQGBcLO7dUjq7
 tbwPLQzWimzb/mdoUS9yjl716wf0qcR28WVeuDG70B90BkDHnvpBDrgdDTk7utRXA8TW
 zQfdMiJZGZLZPH3pwpHx/yP0O3mEDGdSYT6hygE2QDqVD4djp/9kRMtnlZpYYq1hsNAq
 VSGQ==
X-Gm-Message-State: APjAAAW31Izq+I6jWdkpwl8un1McBHdRLcUgu0rVNwZZpy/OebAJBgQl
 1JS5PK/dH45fjSZfqn+SMxc=
X-Google-Smtp-Source: APXvYqxZ3PAtXLqHmn+Zgv1+tnSLgb0uWh1NyJ7+nIhirLt8hpEvkUAsM2RAxT5IIyrqsmvFKAmyHw==
X-Received: by 2002:a17:90a:3465:: with SMTP id
 o92mr14610155pjb.20.1566739513587; 
 Sun, 25 Aug 2019 06:25:13 -0700 (PDT)
Received: from localhost.localdomain ([149.28.153.17])
 by smtp.gmail.com with ESMTPSA id y23sm11076562pfr.86.2019.08.25.06.25.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2019 06:25:13 -0700 (PDT)
From: Changbin Du <changbin.du@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Ingo Molnar <mingo@redhat.com>
Subject: [PATCH 11/11] MAINTAINERS: make scripts/ftrace/ maintained
Date: Sun, 25 Aug 2019 21:23:30 +0800
Message-Id: <20190825132330.5015-12-changbin.du@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190825132330.5015-1-changbin.du@gmail.com>
References: <20190825132330.5015-1-changbin.du@gmail.com>
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
Cc: linux-arch@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, sparclinux@vger.kernel.org,
 linux-kbuild@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, Changbin Du <changbin.du@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make scripts/ftrace/ maintained and I would like to help with reviewing
related patches.

Signed-off-by: Changbin Du <changbin.du@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 9cbcf167bdd0..ca012ea260d7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16293,6 +16293,7 @@ F:	drivers/char/tpm/
 TRACING
 M:	Steven Rostedt <rostedt@goodmis.org>
 M:	Ingo Molnar <mingo@redhat.com>
+R:	Changbin Du <changbin.du@gmail.com>
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git perf/core
 S:	Maintained
 F:	Documentation/trace/ftrace.rst
@@ -16303,6 +16304,7 @@ F:	include/linux/trace*.h
 F:	include/trace/
 F:	kernel/trace/
 F:	tools/testing/selftests/ftrace/
+F:	scripts/ftrace/
 
 TRACING MMIO ACCESSES (MMIOTRACE)
 M:	Steven Rostedt <rostedt@goodmis.org>
-- 
2.20.1

