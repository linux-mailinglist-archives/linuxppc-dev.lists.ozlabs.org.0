Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA89267EF44
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 21:07:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P3TBn55nxz3fZK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Jan 2023 07:07:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GSbfUJd9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--surenb.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3ginuywykdoevxuhqejrrjoh.frpolqxassf-ghyolvwv.rcodev.ruj@flex--surenb.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=GSbfUJd9;
	dkim-atps=neutral
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P3Sdm5PLqz3fM5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Jan 2023 06:42:20 +1100 (AEDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-509ab88f98fso56723997b3.10
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 11:42:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=dtbb/rgJDVPG5hb8ydKzjEL35WMZYcFrpyL4j03oF8s=;
        b=GSbfUJd90yi2xMLpxJwkNIQoO7AYaRuo1p0W3egBrsgFnTlql/QObCOWtQyWcyCJri
         L9IkPEewPotUja2mT2dWXCpgA9vVmlCVPbr2KFEVViPcTyej+SHFX8+fhAEaOP6xtrM/
         x5eCKOKsLW06Glc5jxntDrg/hIgANLyaiKO4UzofC0FOHh/fDzJT0Gg9GuJf/nEgmEZV
         hix6GjSSYXSWndo4QypjFazRowiaazjUscTvm2uHMbtPJDABgUnEX51b4PI7vURt3LgP
         X4xLvpH0mH+5Sv/7D+0hQE/rAXv1nGKdGusu8zdXbWRFOMqJp4iPgA6p21w37iQT/eTP
         bctw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dtbb/rgJDVPG5hb8ydKzjEL35WMZYcFrpyL4j03oF8s=;
        b=k6htKO0gfOEIfXvDJaz3qNYoG70TJETWpPxc3XH5aYfV3/8PVNrewscdqz+xxgirAe
         QvNxJ9K+dwFM02Bpu0TFB7r+U4VHuaM6JE3X1wdRD+FieshNxNLcfwQIVAuW70Svz1Nw
         tCt8pCeb2612yTTuQpNMZEfqnxBR3jGBjMif6xTX2NK7hynx2KwZKb15PNU/nASykUaY
         pUi/zaNv8OdgOUs2W0kn3w/9Iuu408yW2z2DCl8JyTYwf5r7MjBgbTlQeXKOC8KpOF/R
         dRP2rBgWA2sCm8alOPq8nNmMPCyglNxnq8v/E6d+4//zKjD9swHpsKUFtYhzT78muZKj
         xOMw==
X-Gm-Message-State: AFqh2kpGb0kjL33aubs8nUrpSFlB3IULySZz0ApbqpblA1mrA2amNVyf
	YfzxePkJXuwoH8nNHAHwY4zb74aCoR0=
X-Google-Smtp-Source: AMrXdXszwUWrk3+ezT3vpCagEl0mvWZa9sEHax26SYGf7QapJl4fBzpxwL0/6TcVCB7ktvgIaczCkSx6r1s=
X-Received: from surenb-desktop.mtv.corp.google.com ([2620:15c:211:200:4e19:be9:c5d0:8483])
 (user=surenb job=sendgmr) by 2002:a0d:fc86:0:b0:4db:3ac0:78a3 with SMTP id
 m128-20020a0dfc86000000b004db3ac078a3mr5702708ywf.266.1674848538548; Fri, 27
 Jan 2023 11:42:18 -0800 (PST)
Date: Fri, 27 Jan 2023 11:41:04 -0800
In-Reply-To: <20230127194110.533103-1-surenb@google.com>
Mime-Version: 1.0
References: <20230127194110.533103-1-surenb@google.com>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
Message-ID: <20230127194110.533103-28-surenb@google.com>
Subject: [PATCH v2 27/33] mm: prevent userfaults to be handled under per-vma lock
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
Cc: michel@lespinasse.org, joelaf@google.com, songliubraving@fb.com, mhocko@suse.com, leewalsh@google.com, david@redhat.com, peterz@infradead.org, bigeasy@linutronix.de, peterx@redhat.com, dhowells@redhat.com, linux-mm@kvack.org, edumazet@google.com, jglisse@google.com, punit.agrawal@bytedance.com, will@kernel.org, arjunroy@google.com, dave@stgolabs.net, minchan@google.com, x86@kernel.org, hughd@google.com, willy@infradead.org, gurua@google.com, mingo@redhat.com, linux-arm-kernel@lists.infradead.org, rientjes@google.com, axelrasmussen@google.com, kernel-team@android.com, soheil@google.com, paulmck@kernel.org, jannh@google.com, liam.howlett@oracle.com, shakeelb@google.com, luto@kernel.org, gthelen@google.com, ldufour@linux.ibm.com, surenb@google.com, vbabka@suse.cz, posk@google.com, lstoakes@gmail.com, peterjung1337@gmail.com, linuxppc-dev@lists.ozlabs.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, hannes@cmpxchg.org, tatashin@google.com, mgorman@techsingularity.net, rp
 pt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Due to the possibility of handle_userfault dropping mmap_lock, avoid fault
handling under VMA lock and retry holding mmap_lock. This can be handled
more gracefully in the future.

Signed-off-by: Suren Baghdasaryan <surenb@google.com>
Suggested-by: Peter Xu <peterx@redhat.com>
---
 mm/memory.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/mm/memory.c b/mm/memory.c
index 33ecc850d3cb..55582c6fa2fd 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -5256,6 +5256,15 @@ struct vm_area_struct *lock_vma_under_rcu(struct mm_struct *mm,
 	if (!vma_start_read(vma))
 		goto inval;
 
+	/*
+	 * Due to the possibility of userfault handler dropping mmap_lock, avoid
+	 * it for now and fall back to page fault handling under mmap_lock.
+	 */
+	if (userfaultfd_armed(vma)) {
+		vma_end_read(vma);
+		goto inval;
+	}
+
 	/* Check since vm_start/vm_end might change before we lock the VMA */
 	if (unlikely(address < vma->vm_start || address >= vma->vm_end)) {
 		vma_end_read(vma);
-- 
2.39.1

