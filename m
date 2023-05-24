Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B8B70EDA9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 08:12:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QR17D0nYTz3fLd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:12:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YVfR4h9r;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52e; helo=mail-pg1-x52e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=YVfR4h9r;
	dkim-atps=neutral
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com [IPv6:2607:f8b0:4864:20::52e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QR12x1Jvdz3f7v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 16:08:41 +1000 (AEST)
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5343c3daff0so427017a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 23:08:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684908518; x=1687500518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNILb4+cQ1eKYMAz1WBE8LcfWvbmXRGydxXui234anI=;
        b=YVfR4h9r61gNpNxdgsBp/tsaw5J1Yf+//AN5hJXt1uUxa/juzR5qD/miX2SLekqyBH
         NM1xrV7WiQRODbdSRn2K9rS45PRp2DZKBpzmN9okTD5y4gmUSLC4MiYJtc7Lxdey6hWQ
         D9vV339rLCSCTeLJmHSOxCIMEMX2thLLNdWPscRcDGMBa8DW/JSMJJHhDvb4jrAO1fhH
         YXk/5vgAA5zY6ilj8d/3cIzGRdqhdUThVZmydvgFFFD+o9Dh2SCPmLTCiT7lxpOYVigZ
         wyFfbOQLkdliFTFX0sDPoFZscenI5qRzY54sOAEUM9GAi1cAm7tUKUkW5ugzT+nvKeOB
         rfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684908518; x=1687500518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yNILb4+cQ1eKYMAz1WBE8LcfWvbmXRGydxXui234anI=;
        b=JGeg+PlTCTuUIuEV2lsqwqPzPxVmu4B56Zza1giRTB9qMrtlK+SPlRUij29FAUew+z
         9NqrXjzOVdw2730dBZj8JDdpTxbtQakpYdiK5HD0IaNQrnFE8haNmmfwtKCuFUOcNN6I
         J7aY0u1r2h9PVUvXE1eXh3DW8UQxmQ/5G24BRMwosPAeQ6mThLvf+xNOTbM0TEWjaRdO
         N6rsIqu6y5Du2YhUEESmJxjkx7JmO+J9EiVqjcaqZU85g04iyyr8fEeex0T4cQ0hLpIK
         Inj/CkDPgHjU4xCk/iHAmgyddQ6LS9qGYfcRM2X/6+IqyggclyV6eJ6v3m5g3bVd95XA
         egjg==
X-Gm-Message-State: AC+VfDyvpA+opBpD3bHnTerNSyTROTc1+VzmteeZF4FXwbbotAaIcF1y
	SFmquqM8AvPyPSGEzzQA4Ub3IP7w1iE=
X-Google-Smtp-Source: ACHHUZ6FZolKd8yFWy74Jr7IyAijTLR9yo33/Pbk7T39hY2GS0YtQQ3pD5PcY/Ct8Vr5fkbwXtpsJA==
X-Received: by 2002:a17:902:8d8a:b0:1ad:7bc5:b9ea with SMTP id v10-20020a1709028d8a00b001ad7bc5b9eamr13402174plo.60.1684908518594;
        Tue, 23 May 2023 23:08:38 -0700 (PDT)
Received: from wheely.local0.net ([220.240.241.243])
        by smtp.gmail.com with ESMTPSA id 9-20020a170902c14900b001aaecb74f82sm7793019plj.72.2023.05.23.23.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 23:08:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc/64s/radix: combine final TLB flush and lazy tlb mm shootdown IPIs
Date: Wed, 24 May 2023 16:08:21 +1000
Message-Id: <20230524060821.148015-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230524060821.148015-1-npiggin@gmail.com>
References: <20230524060821.148015-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This performs lazy tlb mm shootdown when doing the exit TLB flush when
all mm users go away and user mappings are removed, which avoids having
to do the lazy tlb mm shootdown IPIs on the final mmput when all kernel
references disappear.

powerpc/64s uses a broadcast TLBIE for the exit TLB flush if remote CPUs
need to be invalidated (unless TLBIE is disabled), so this doesn't
necessarily save IPIs but it does avoid a broadcast TLBIE which is quite
expensive.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/mm/book3s64/radix_tlb.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index 8160c1630c3d..e2aaee6df1f6 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1301,7 +1301,31 @@ void radix__tlb_flush(struct mmu_gather *tlb)
 	 * See the comment for radix in arch_exit_mmap().
 	 */
 	if (tlb->fullmm) {
-		__flush_all_mm(mm, true);
+		if (IS_ENABLED(CONFIG_MMU_LAZY_TLB_SHOOTDOWN)) {
+			/*
+			 * Shootdown based lazy tlb mm refcounting means we
+			 * have to IPI everyone in the mm_cpumask anyway soon
+			 * when the mm goes away, so might as well do it as
+			 * part of the final flush now.
+			 *
+			 * If lazy shootdown was improved to reduce IPIs (e.g.,
+			 * by batching), then it may end up being better to use
+			 * tlbies here instead.
+			 */
+			smp_mb(); /* see radix__flush_tlb_mm */
+			exit_flush_lazy_tlbs(mm);
+			_tlbiel_pid(mm->context.id, RIC_FLUSH_ALL);
+
+			/*
+			 * It should not be possible to have coprocessors still
+			 * attached here.
+			 */
+			if (WARN_ON_ONCE(atomic_read(&mm->context.copros) > 0))
+				__flush_all_mm(mm, true);
+		} else {
+			__flush_all_mm(mm, true);
+		}
+
 	} else if ( (psize = radix_get_mmu_psize(page_size)) == -1) {
 		if (!tlb->freed_tables)
 			radix__flush_tlb_mm(mm);
-- 
2.40.1

