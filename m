Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 443F95A9E74
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Sep 2022 19:49:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MJT8D2Jj1z3g36
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 03:49:48 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pWHztwJe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3le0qywykdnigif2bz4cc492.0ca96bildd0-12j96ghg.cn9yzg.cf4@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=pWHztwJe;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MJSrv3KcJz30FQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Sep 2022 03:36:21 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-343a77f2129so37864697b3.15
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Sep 2022 10:36:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date;
        bh=OXbMCMaGP4Ta1BmgGlOZJjCZdxKE/BRmpYL5lrPVZHE=;
        b=pWHztwJetxx0qowvevLvkxkCmwM1DSAQ7wjfJnXzpjijYQSBqPMfI0rG6nxi/Vrs1X
         CRVPAVdxEFSJIvF4wmbUwj7aCZVm5fVfcrhjUQbBf8n+p0SayMBlb1is6WVkqvLBgMjP
         AxVJ3sKIAz8Kn28I4Sanz2jyBLjhA5Sgmh51jOnVumpasjSH/FjDxpS14KsDzSHBeJ/z
         Yb37UvWIKHVN5xc1I6JjnIWO9Obyji3HzdX43E3p6Zl4/DUSGGEIR7W2aNpSc1VwX28m
         zHCfb00UkmpquMPwx5yKTUZ6c6Sedty+81FiCoVN909m08MOGYjyTskfX4dvSl+gNSYm
         xxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date;
        bh=OXbMCMaGP4Ta1BmgGlOZJjCZdxKE/BRmpYL5lrPVZHE=;
        b=l7gkmFzkMld2zqFEMpgZvZVZCvej1PBjrEzzxGO9masWfPs6p5dEMvKKuz0ceNQbjn
         BPHBjFvehRof1S6FWmaV2p3bHSmZh/ylAeBVGvY7gAtln+htoYOkfaYxQhCfaFt6WQtS
         8rC1kEeH0JYATBAhw8Ep6KWBlWLuqTOb2v+Srylny3yUh4tHUSZjK3sCci8U0yfT9cPG
         i+KGoi0zXVyS2XWwj+mvKBGKEAn9M2P78kOkZXwpl1zaT1gyt+cLGY15/IoVitMVZ0Jc
         4Tsbgk8E8f4gJzRBwqmKvfAE88PmXlxRBMTA76TfKcs3pbnsnXd5vabLx3S467+AAml4
         c11Q==
X-Gm-Message-State: ACgBeo23/duky2AtRbftQF0WFYBNBET3kq+Mmy9Unddis9GI2VaNbd4c
	AypyiIbrssGpGKL08A9CT3eS+8KBM8k=
X-Google-Smtp-Source: AA6agR61BxBFn9qdHU9nkuJxxLaKayaG/YdyWtcsF9HYohujUkmqtvR1t3mL9v3jybeuPbaW7lxRg4vyZUk=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:1bfc:e7ee:6530:4449])
 (user=surenb job=sendgmr) by 2002:a25:340d:0:b0:696:4dbf:614a with SMTP id
 b13-20020a25340d000000b006964dbf614amr21859755yba.470.1662053781470; Thu, 01
 Sep 2022 10:36:21 -0700 (PDT)
Date: Thu,  1 Sep 2022 10:35:11 -0700
In-Reply-To: <20220901173516.702122-1-surenb@google.com>
Mime-Version: 1.0
References: <20220901173516.702122-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
Message-ID: <20220901173516.702122-24-surenb@google.com>
Subject: [RFC PATCH RESEND 23/28] x86/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, mgorman@suse.de, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linux-arm-kernel@lists.infradead.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Set ARCH_SUPPORTS_PER_VMA_LOCK so that the per-VMA lock support can be
compiled on this architecture.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index f9920f1341c8..ee19de020b27 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -27,6 +27,7 @@ config X86_64
 	# Options that are inherently 64-bit kernel only:
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_USE_CMPXCHG_LOCKREF
 	select HAVE_ARCH_SOFT_DIRTY
 	select MODULES_USE_ELF_RELA
-- 
2.37.2.789.g6183377224-goog

