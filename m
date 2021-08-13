Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 186353EBD0D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Aug 2021 22:06:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GmZLY6VgSz3cYx
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 Aug 2021 06:05:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20161025 header.b=tDG79y8J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--morbo.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3fnawyqukdicxz2mzrzzrwp.nzxwty5800n-op6wt343.zawlm3.z2r@flex--morbo.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=tDG79y8J; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GmZKs07sPz3bW8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 Aug 2021 06:05:18 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id
 b12-20020a25cb0c0000b0290593e6b14f6aso9341134ybg.22
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Aug 2021 13:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4EYkfl7u3c0fe6BZm+nywHzPnvU49Nzp4mTk0DIT6Qs=;
 b=tDG79y8JxkEeMITM/Dz4I+5ruSVrztX+8ungXNgGhNZjJf8sdiadYlyroOHQSkRkfh
 Bl6lclrN2WWca0OdrkgyfALXglNegzaXZq46X6yOKy1VWa/8b/lJEmEbytlXQJ62OUHV
 hFAoE27wYE7nhfiwyiC4XrPfhfuqGJS8647UVKLAujIMYmrS5/tVMdDuhQF5mnevCL+R
 jkfHmduS826o4/5KDRsfdBviGLDVwRMWx16xPYTr1XCFAoJcjRIe507ct0XKZQXWDdCv
 HKotn/TRxraXxsDE9+K/W0SQ2TqlA0vhIk0QOB9HIBaEWTl1rVT5bFhHPLcQtVuVjJnd
 RQPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4EYkfl7u3c0fe6BZm+nywHzPnvU49Nzp4mTk0DIT6Qs=;
 b=BTkK3jN/hXo3j9IFfG5h4tvyv6AS8DJQ+iaPPQevfM0ghaoZbI3JHDlSDwYoUCzFpx
 6pZ3vhIclYQPP2W1JfSKOH//WE2KKRsPsegGyoi1jHq30X+l5snsBs2AjgbF0n2uaYeM
 w/T+PeQlcYJsS7J4U1jXLTosEfnJwS7iNPhakRhrgfUHXAZXorVM/7Z06DRpbHbggZDg
 9hSAzcF4chOWU+4tRjlIo+RIFseukqA2gpn/HGt1KR+1nlNQcuPDQCGNDmdDwOY09fJi
 WxU67nJ7uYiUssJo2aGPFL6zTd6RlsVGH1so1916xBq0zMw8AwRiIh/Z0TeR9By3oU4f
 OvGA==
X-Gm-Message-State: AOAM533RpmMQMOo7TIvnKW27xhexgRzUuNL8fyxjrYxldAr4cAS3Wv5E
 uPDouFugatz6m5drU8uYo34tJ3Wd
X-Google-Smtp-Source: ABdhPJxOLdvxgHb9JGu7E7H94pvG+O55jjxNK8CLGUihMstI5TpU89TWclMjGii3Kz6pWo5nZlQMIyGZFg==
X-Received: from fawn.svl.corp.google.com
 ([2620:15c:2cd:202:47b8:ed1f:f8e9:a664])
 (user=morbo job=sendgmr) by 2002:a25:bb13:: with SMTP id
 z19mr5539560ybg.347.1628885116494; 
 Fri, 13 Aug 2021 13:05:16 -0700 (PDT)
Date: Fri, 13 Aug 2021 13:05:11 -0700
In-Reply-To: <20210812204951.1551782-1-morbo@google.com>
Message-Id: <20210813200511.1905703-1-morbo@google.com>
Mime-Version: 1.0
References: <20210812204951.1551782-1-morbo@google.com>
X-Mailer: git-send-email 2.33.0.rc1.237.g0d66db33f3-goog
Subject: [PATCH v2] ppc: add "-z notext" flag to disable diagnostic
From: Bill Wendling <morbo@google.com>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, linuxppc-dev@lists.ozlabs.org, 
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, 
 Daniel Axtens <dja@axtens.net>, Fangrui Song <maskray@google.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Itaru Kitayama <itaru.kitayama@riken.jp>, Bill Wendling <morbo@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Fangrui Song <maskray@google.com>

Object files used to link .tmp_vmlinux.kallsyms1 have many R_PPC64_ADDR64
relocations in non-SHF_WRITE sections. There are many text relocations (e.g. in
.rela___ksymtab_gpl+* and .rela__mcount_loc sections) in a -pie link and are
disallowed by LLD:

  ld.lld: error: can't create dynamic relocation R_PPC64_ADDR64 against local symbol in readonly segment; recompile object files with -fPIC or pass '-Wl,-z,notext' to allow text relocations in the output
  >>> defined in arch/powerpc/kernel/head_64.o
  >>> referenced by arch/powerpc/kernel/head_64.o:(__restart_table+0x10)

Newer GNU ld configured with "--enable-textrel-check=error" will report an
error as well:

  $ ld-new -EL -m elf64lppc -pie ... -o .tmp_vmlinux.kallsyms1 ...
  ld-new: read-only segment has dynamic relocations

Add "-z notext" to suppress the errors. Non-CONFIG_RELOCATABLE builds use the
default -no-pie mode and thus R_PPC64_ADDR64 relocations can be resolved at
link-time.

Link: https://github.com/ClangBuiltLinux/linux/issues/811
Signed-off-by: Fangrui Song <maskray@google.com>
Co-developed-by: Bill Wendling <morbo@google.com>
Signed-off-by: Bill Wendling <morbo@google.com>
Reported-by: Itaru Kitayama <itaru.kitayama@riken.jp>
Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>
---
v2:
  - Assign "Fangrui Song" as the proper author.
  - Improve the commit message to add more context.
  - Appending tags from original patch's review.
---
 arch/powerpc/Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 6505d66f1193..17a9fbf9b789 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -122,6 +122,7 @@ endif
 
 LDFLAGS_vmlinux-y := -Bstatic
 LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) := -pie
+LDFLAGS_vmlinux-$(CONFIG_RELOCATABLE) += -z notext
 LDFLAGS_vmlinux	:= $(LDFLAGS_vmlinux-y)
 
 ifdef CONFIG_PPC64
-- 
2.33.0.rc1.237.g0d66db33f3-goog

