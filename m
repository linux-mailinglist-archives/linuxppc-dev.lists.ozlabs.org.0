Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A05A4663224
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 22:02:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrRG03DqHz3fPD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 08:02:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hJQlgWQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=36h68ywykdpsvxuhqejrrjoh.frpolqx0ssf-ghyolvwv.r2odev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=hJQlgWQO;
	dkim-atps=neutral
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrR4q2Rcdz3cMr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 07:54:03 +1100 (AEDT)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-349423f04dbso105126037b3.13
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jan 2023 12:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bU2TYXI/IQ+ahWPrvtMjvIvPP35LcWsiAJFQ60YWV8o=;
        b=hJQlgWQOwjt9bdNS4iNCFQHGlLFypCJo9NibsA7lH+Cj66pCbZCU+CxVh9F7A2fm7T
         vmlH3bAYg1kSOc6vTNCehxfbrsiSwMkUwfklPcXaZBTBOgsQNuQ1lURfneHqEpASj7ak
         72wsJeHj+71ppFuT3bry8xcf97dMVhsy87IzDxduellVAKg7BiJc4vIK8HA7ompTnbjq
         +gURuiw11LvdH0ad+L6DkctzinvpOQbzYQIPe9DQz0Et4Siymb/UJSUp4isr8x/TUfSb
         z+/96aen7RzYU/fA94YBNLJOwTLnQ/SBQCaJx176+XVEeqKe1Aaxg+5hL1pkiSz0xMHc
         S9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bU2TYXI/IQ+ahWPrvtMjvIvPP35LcWsiAJFQ60YWV8o=;
        b=H5PcZbgq1iTQA1BL/KmPwh1JCPiMswX29GJ6hc4wOyengnl9G/dGgdm+C0MVmcmNYe
         I4Z76FmtHLQ8L58rVCKM51Qo/Uc0rSxiToABUxDImHm/TroyvelGCDjq5csT5jackgmQ
         KfY1vz/d4fWXyCUlAAOPesrhBAd8Jg4WCFL6LIgGm1cPrwC7zO0OWsdJcU+LJlHnTEZo
         iEKDSAVPhdUyF6OGwV39M+O+IHC9L5HGvCtRTeCVtLmFuNX12OAHXIo+kVVQeiWTqGdV
         HXN8/GZisEV/SZc18SeZ11Nxwu7DdmbNQpr2cNwiy224RI4EFxFFEeK18LS3F+Gj0+8l
         UDjw==
X-Gm-Message-State: AFqh2konvKjqEEJV8CBwiH/2Cg2RxrPwhaVPdZ0scvnrHVoQWzd95icA
	R9JKbqhb5IrZNutjV4bR4BFMDFnxqno=
X-Google-Smtp-Source: AMrXdXt3ngSzeTd4BjcWtYkKZUmKlJ+coRJjsu8zn30hseAAXL6r6J79qyIJjR/uVl5OkeApgAgECG74aLI=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:9393:6f7a:d410:55ca])
 (user=surenb job=sendgmr) by 2002:a25:9f8b:0:b0:705:cde7:2363 with SMTP id
 u11-20020a259f8b000000b00705cde72363mr8137319ybq.81.1673297640913; Mon, 09
 Jan 2023 12:54:00 -0800 (PST)
Date: Mon,  9 Jan 2023 12:53:03 -0800
In-Reply-To: <20230109205336.3665937-1-surenb@google.com>
Mime-Version: 1.0
References: <20230109205336.3665937-1-surenb@google.com>
X-Mailer: git-send-email 2.39.0.314.g84b9a713c41-goog
Message-ID: <20230109205336.3665937-9-surenb@google.com>
Subject: [PATCH 08/41] mm: introduce CONFIG_PER_VMA_LOCK
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, laurent.dufour@fr.ibm.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, hughlynch@google.com, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingu
 larity.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This configuration variable will be used to build the support for VMA
locking during page fault handling.

This is enabled by default on supported architectures with SMP and MMU
set.

The architecture support is needed since the page fault handler is called
from the architecture's page faulting code which needs modifications to
handle faults under VMA lock.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
---
 mm/Kconfig | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/mm/Kconfig b/mm/Kconfig
index ff7b209dec05..0aeca3794972 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1183,6 +1183,19 @@ config LRU_GEN_STATS
 	  This option has a per-memcg and per-node memory overhead.
 # }
 
+config ARCH_SUPPORTS_PER_VMA_LOCK
+       def_bool n
+
+config PER_VMA_LOCK
+	bool "Per-vma locking support"
+	default y
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
2.39.0

