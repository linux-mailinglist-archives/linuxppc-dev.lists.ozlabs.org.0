Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBE5698BEA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 06:27:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PHNjl2wm7z3fDL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 16:27:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hDLR1pvR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3mbztywykdo4ikhudrweewbu.secbydknffs-tulbyiji.epbqri.ehw@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hDLR1pvR;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PHNWb4nCrz3chs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 16:18:19 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-52ec7c792b1so8685727b3.5
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 21:18:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pFZiiTJ1lM5Y9cE9VJMMN6c4zys62lyfuQWFB/SvSfY=;
        b=hDLR1pvRXBoNPEsd5rWO1uuL2xRvkViIuLxNT0AXT2es+wKEpveR0MayIpEY9kMwnX
         yKqoPf3/kr2W8U8aZxHHsI3MeVglv4Uuopqy/RZQvDUL+Iw/1b3yNPaW9UiWpFiktEjT
         IG17SwGNRtI3Tudjcg57P2Pp6pg3eItytQO0663ElsQFpDjPji34Qnzv66OgBFV/+yja
         uvKllpdQQMscfNlzsu7K4yE4HNqAZ53EkNxV25Op17ac2k06MkhohfLIKcbxFpec+BdV
         695/dYeBJhC1TaWGjUDZda/yGXvfwWspsF3C1nfSkAJuqCo5le3F23yvLzWMlOVw2Nnw
         Ls0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pFZiiTJ1lM5Y9cE9VJMMN6c4zys62lyfuQWFB/SvSfY=;
        b=42lnPazn/0Q2FzNxVqNaIIMaTbTD/5ixVZ2uwjAFyg4Sfm5F1zvikniyZASvJQ9tgy
         hU70x/2o74/XqxoDALww2aQcPJiwwGrSe87wAKJBZcsCatPbRh5+23cDfAfLOHweucSp
         QiE8xgM+w4UwuueywSucBx4mJwJFPJixp9v7f/wQtanAau9QAaVSdAcj3Sl9A4VACZgS
         guw7zXMl0KFiLam3Ad1vKUlSZdGjBrxwaQ0P2tQcjYqmxabuk7qAD8Foev058wEchnLb
         ElSUTTxNPrtnWwQipRU7E8X4sxvKn0z8kICCQaRl8LkybG9OT/2GBxYwK0l50yzYHda0
         k33Q==
X-Gm-Message-State: AO0yUKV6lFAfqcxY1C5s/XLVlm726wMDZrWYNtT0wbyWDh5bjlx5/BTy
	G7Wk7HdvXNZ//HCVCGDokxdz0BY52h8=
X-Google-Smtp-Source: AK7set/vOsUP0PVWaWbTlqFxALvIpJBlIbMQnTBHBu2Oot2RdkwCU0iTN4oS1VPXE/uz69lz5N2GmOvT6GU=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:f781:d5ed:1806:6ebb])
 (user=surenb job=sendgmr) by 2002:a81:9e45:0:b0:50f:f163:7072 with SMTP id
 n5-20020a819e45000000b0050ff1637072mr442506ywj.285.1676524697322; Wed, 15 Feb
 2023 21:18:17 -0800 (PST)
Date: Wed, 15 Feb 2023 21:17:24 -0800
In-Reply-To: <20230216051750.3125598-1-surenb@google.com>
Mime-Version: 1.0
References: <20230216051750.3125598-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
Message-ID: <20230216051750.3125598-10-surenb@google.com>
Subject: [PATCH v3 09/35] mm: introduce CONFIG_PER_VMA_LOCK
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, chriscli@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, michalechner92@googlemail.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, Suren Baghdasaryan <surenb@google.com>, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org,
  hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This configuration variable will be used to build the support for VMA
locking during page fault handling.

This is enabled on supported architectures with SMP and MMU set.

The architecture support is needed since the page fault handler is called
from the architecture's page faulting code which needs modifications to
handle faults under VMA lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/Kconfig | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index ca98b2072df5..2e4a7e61768a 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1211,6 +1211,18 @@ config LRU_GEN_STATS
 	  This option has a per-memcg and per-node memory overhead.
 # }
 
+config ARCH_SUPPORTS_PER_VMA_LOCK
+       def_bool n
+
+config PER_VMA_LOCK
+	def_bool y
+	depends on ARCH_SUPPORTS_PER_VMA_LOCK && MMU && SMP
+	help
+	  Allow per-vma locking during page fault handling.
+
+	  This feature allows locking each virtual memory area separately when
+	  handling page faults instead of taking mmap_lock.
+
 source "mm/damon/Kconfig"
 
 endmenu
-- 
2.39.1

