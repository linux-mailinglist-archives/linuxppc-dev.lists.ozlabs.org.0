Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E016942138E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Oct 2021 18:04:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HNQWw5BxKz2yyj
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Oct 2021 03:04:28 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ppT4rhgi;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=ppT4rhgi; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HNQSC66N7z2ym7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Oct 2021 03:01:15 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id s75so6102539pgs.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Oct 2021 09:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hMnfSI9yoYDLSGnaeQ8njs+W5jZFdB15MADSAiJvUEw=;
 b=ppT4rhgi7tPQR7SsM3YfqL0KOJuWrKrQIQq4bPVblWzLiWoU6a5KgtfI+83w7lMmOJ
 0ZIDs7yUqSUYm1VePY8xY9LyBvV5MlnUEeCVyKuFc2xsK5iPQkFoAWc27QQReluVGnsH
 sp9Chm5oeI1JjqJfWD7IqDgTOND2W2OP71rFxeHtQLv6m44NtBl34uaJeCJ5z3n/GYDQ
 6uqeh+P8N06eOsogFVjBKKnyja0OFayl76vqjygyFpdOunQ/hIvQcf+1Ud5gREGY6hxf
 ZpEW/I6zmXxUdY8UHu1FGGmMdtXkQdZ012Skp2nl2ZdtFSW82t49YUW7LjCr7Z1gc6ni
 VeVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hMnfSI9yoYDLSGnaeQ8njs+W5jZFdB15MADSAiJvUEw=;
 b=3b/O1uPguYUmA8zuq5e8k9cfohGEpxLMGtV4XSaZORp419IOTmiy1TQAq7a69fFneI
 8gElw9ZtP0fJZo6MAFwDO/ojRARhD5UQGHGdgAyMefC1uFCZkh3SKp5yX7upuF7B08yo
 6MEeSm2pPUhdN5TvTwzDvR8pKwBOIYakcBCUBePf+3tEC6CqGyl7Fw4a17fJM3TjqVe3
 obNAmiWlbl2tZGnEItPsYZbuYwzMTfG9QpDgNxmUeuEcA1p9spfljMDWIF9AUYSTGa2k
 IdQoFjzAtgNj20J2uC8MgeH3FzWtlF7epNAs7+tPfTnzFBbgZUD96VqR+YcgeqJ+VwVz
 0I1g==
X-Gm-Message-State: AOAM530FXqvqYjqmA1KFqS/6fPMrmmYom3XenZ6GkhcEQd3Uo1Zp4mpd
 Fcb5jHm9KRdUceTuaHR8a/s=
X-Google-Smtp-Source: ABdhPJwBEERy2/Zuis0y01OsZytQQuADMZSXP9p0pINGWMFGJT+ZQ3gK+36xzer61qzfNvLJPYZGug==
X-Received: by 2002:a63:131f:: with SMTP id i31mr11631459pgl.207.1633363273842; 
 Mon, 04 Oct 2021 09:01:13 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (115-64-153-41.tpgi.com.au. [115.64.153.41])
 by smtp.gmail.com with ESMTPSA id 130sm15557223pfz.77.2021.10.04.09.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Oct 2021 09:01:13 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 05/52] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Tue,  5 Oct 2021 02:00:02 +1000
Message-Id: <20211004160049.1338837-6-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20211004160049.1338837-1-npiggin@gmail.com>
References: <20211004160049.1338837-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
this could help reduce needless guest exits due to leftover exceptions on
entering the guest.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h       | 2 ++
 arch/powerpc/kernel/time.c            | 1 +
 arch/powerpc/kvm/book3s_hv_p9_entry.c | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index fd09b4797fd7..69b6be617772 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -18,6 +18,8 @@
 #include <asm/vdso/timebase.h>
 
 /* time.c */
+extern u64 decrementer_max;
+
 extern unsigned long tb_ticks_per_jiffy;
 extern unsigned long tb_ticks_per_usec;
 extern unsigned long tb_ticks_per_sec;
diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
index e84a087223ce..6ce40d2ac201 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -88,6 +88,7 @@ static struct clocksource clocksource_timebase = {
 
 #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
 u64 decrementer_max = DECREMENTER_DEFAULT_MAX;
+EXPORT_SYMBOL_GPL(decrementer_max); /* for KVM HDEC */
 
 static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev);
diff --git a/arch/powerpc/kvm/book3s_hv_p9_entry.c b/arch/powerpc/kvm/book3s_hv_p9_entry.c
index 961b3d70483c..0ff9ddb5e7ca 100644
--- a/arch/powerpc/kvm/book3s_hv_p9_entry.c
+++ b/arch/powerpc/kvm/book3s_hv_p9_entry.c
@@ -504,7 +504,8 @@ int kvmhv_vcpu_entry_p9(struct kvm_vcpu *vcpu, u64 time_limit, unsigned long lpc
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	save_clear_guest_mmu(kvm, vcpu);
 	switch_mmu_to_host(kvm, host_pidr);
-- 
2.23.0

