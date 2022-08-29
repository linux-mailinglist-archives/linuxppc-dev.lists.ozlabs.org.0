Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 890765A56EA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:16:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGlBr41rMz3dqZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:16:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=keg1i0nk;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1049; helo=mail-pj1-x1049.google.com; envelope-from=3-y4nywykdkwegdqznsaasxq.oayxuzgjbbo-pqhxuefe.alxmne.ads@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=keg1i0nk;
	dkim-atps=neutral
Received: from mail-pj1-x1049.google.com (mail-pj1-x1049.google.com [IPv6:2607:f8b0:4864:20::1049])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5T6CWDz3blw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:21 +1000 (AEST)
Received: by mail-pj1-x1049.google.com with SMTP id mq13-20020a17090b380d00b001fb60a596c8so106421pjb.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=M/5Y14x1SSOe03/jfupiRT6TG6dq1ngDrWV9hskObuI=;
        b=keg1i0nk+izk1klWl7kacG2dqLVFCBBFr7DTBR9Vkh347LyX6fgOptbA6FX9RaUao+
         vJTGW+XEi+UTAE6ZSui/ACoLYvw+CzBRdshi7UOcb6GKyXUkGWluK1e9ViX0u2MOFUby
         n+VIqiL1KgbaHmBILZRqDKCT7yq9OcaG3eWuWfyFbeDAc3tNJSfOayUDVB763p8OZugP
         N6WyMveSXRyt1x9RwdvL650Tufs+g4oBOJJ5iU1MJBZM9QMXfDComRZRSTq/8D/ye7ef
         ZSEe/ZXHQtclALcTUMn5apyFMWCE/g3tgTBxLG+Y3u9vQ4Ps1pm7jxw7nOrCfEth2Ax0
         A9EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=M/5Y14x1SSOe03/jfupiRT6TG6dq1ngDrWV9hskObuI=;
        b=JG74zNElJtOceF+gd6mixcMT15MUNqFSA5s0/iKXHLA8qWIauAYweBEnYZxM1q481T
         D9fDjlVn5ElUxVpc9uVeg6sNTgNrMyN4hzfU9nhKvW11likXZWhmS9K17Lq6Msh1dsVz
         2hTcmo00xIFzl5FChjQy6AegiWkX8VpGW4gs6kCfy66aphrMpA6sDmx7TELEXGfljlPZ
         fjOnmttFvZzabvTbFva2sC7io+NALAooZ5kmmCNOIy9XgWaVkt3iWpcHW+/jk2UwpZVl
         q2+UZ6euLScDhW7kQU6gz4iqnZ2BAC36Px51U1WBeeh2LAYFNLRFryAOCrHEnVH12Ev6
         D36Q==
X-Gm-Message-State: ACgBeo35Wy0zI3iKqn+Y+SfCSF+QEkiTQ0I6IYWz6dhWal3g5W5RRXbx
	Imh/woZUxBH74RTHDE96X1MwuxF83Aw=
X-Google-Smtp-Source: AA6agR4Lx1uzJZ7T/fCqu0c+3ou3bFPxSP7qIc7HtsIZjbU9yCjHgv7Z+4FP1+5TPgAu6qrR46XQccXnjfE=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:90a:e558:b0:1fb:c4b7:1a24 with SMTP id
 ei24-20020a17090ae55800b001fbc4b71a24mr21113pjb.1.1661808379380; Mon, 29 Aug
 2022 14:26:19 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:28 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-26-surenb@google.com>
Subject: [RFC PATCH 25/28] arm64/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Tue, 30 Aug 2022 08:01:45 +1000
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, jglisse@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, paulmck@kernel.org, riel@surriel.com, liam.howlett@oracle.com, luto@kernel.org, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, mgorman@techsingularity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Set ARCH_SUPPORTS_PER_VMA_LOCK so that the per-VMA lock support can be
compiled on this architecture.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 arch/arm64/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 9fb9fff08c94..0747ae1f3b39 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -93,6 +93,7 @@ config ARM64
 	select ARCH_SUPPORTS_INT128 if CC_HAS_INT128
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
+	select ARCH_SUPPORTS_PER_VMA_LOCK
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION if COMPAT
 	select ARCH_WANT_DEFAULT_BPF_JIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
-- 
2.37.2.672.g94769d06f0-goog

