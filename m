Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E885A56E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 00:15:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGl9Z3Df0z3fvQ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Aug 2022 08:14:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CptXAEbT;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::64a; helo=mail-pl1-x64a.google.com; envelope-from=3-c4nywykdkkbdanwkpxxpun.lxvurwdgyyl-mneurbcb.xiujkb.xap@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=CptXAEbT;
	dkim-atps=neutral
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGk5Q0Cy2z3blw
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Aug 2022 07:26:18 +1000 (AEST)
Received: by mail-pl1-x64a.google.com with SMTP id b9-20020a170903228900b001730a0e11e5so6798379plh.19
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 14:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc;
        bh=2fd/wGll+ATU6BJRTn7wtpRUT69Ps19K4L9NuJFwTCo=;
        b=CptXAEbTEIrjcI1hpAhqMGzwstwkcEJJxmfb7we2Tkw33BFQo0d25Vl71IxE1hgwCE
         +/zdjUxBz/kfwlykJ2mpRLD2ASHh0Jx/8NPF+GvmOj+OIPDuJ9h8tJ0qgl8jIPnA0gyY
         HL/K18g+JnPGw8ocd38eG5KHL97qZgAE2vHMSq8EmM7kYFzwJqKpJAdVhwHK8rQ0CEUk
         zlwtiJI41bKlNxlGW7NWWuuvJOTrejKhLXTonY1HBOreH+6SF0a8TMKsBr5d7H138Lnw
         MYC4Krs42a4eoKPM77oYkjvTzwtNbqixe2Jty6RY0Tg1xXxoDrCaGfCoHKiNRbMG4ac9
         6NkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc;
        bh=2fd/wGll+ATU6BJRTn7wtpRUT69Ps19K4L9NuJFwTCo=;
        b=nkUJB1E8tbx4dKdy+RAX3KKF6AUnq5crGTwg+z3wcFunaCEjhIOyx1tf1eRgw1AZ21
         cOZO9dUzm2Tc79w5Plfo3EFhyGl85RH9+3wV+yBjmVP3I65o+9SLuDkvSbeOSS2+ZzKs
         iZU3Nr5jQJvf/HWJu5OXpqUK/k0g0XhD2+o6b+EiingAhufPLILdKeuEnR4aV+4lr0Ym
         qriLDhhPMOftGgFR2y2e+Q5Qzd5WM43CMSIF5fA1oLD190eD4hEA0Hv+M6/uM2XjhALH
         DxeJjDu1CvEJn8r4s96TaBtcqyE36wM6FlBjET3yCAfnVHQe4Ha7saAqC5gFi2qQPnEi
         l9xg==
X-Gm-Message-State: ACgBeo2HZ0GQyTUFuCqvONMzojcIBv2LVOyiY2SalUOZrpI8AuJprbSJ
	x7kiFzurR++P/3ecV/xypOV4A6KaTDE=
X-Google-Smtp-Source: AA6agR5QjqhJOQoDiATaLtKSN9vwads3L2SWpCSYlmwHfKycrJZLy9F13OZO0MNqEBq8/z8yofCbHCaZE68=
X-Received: from surenb-spec.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:3e30])
 (user=surenb job=sendgmr) by 2002:a17:902:d54b:b0:174:af35:4ba0 with SMTP id
 z11-20020a170902d54b00b00174af354ba0mr7860599plf.74.1661808376452; Mon, 29
 Aug 2022 14:26:16 -0700 (PDT)
Date: Mon, 29 Aug 2022 21:25:26 +0000
In-Reply-To: <20220829212531.3184856-1-surenb@google.com>
Mime-Version: 1.0
References: <20220829212531.3184856-1-surenb@google.com>
X-Mailer: git-send-email 2.37.2.672.g94769d06f0-goog
Message-ID: <20220829212531.3184856-24-surenb@google.com>
Subject: [RFC PATCH 23/28] x86/mm: define ARCH_SUPPORTS_PER_VMA_LOCK
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
2.37.2.672.g94769d06f0-goog

