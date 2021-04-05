Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 211C3353AD4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 03:31:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FDCm40FTgz3fxQ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  5 Apr 2021 11:31:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=d+yzFvdJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c;
 helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=d+yzFvdJ; dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FDCY36NZDz3c9D
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  5 Apr 2021 11:21:27 +1000 (AEST)
Received: by mail-pj1-x102c.google.com with SMTP id ha17so5269372pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 04 Apr 2021 18:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eg/LONsL/v52XjsVvWJ/gHvuI8LKJE3Kwm8pO3cmUh0=;
 b=d+yzFvdJsE6Udw/oxnGd3ktn5ac7k831rkFpUl8FtxS001A2LxpL5O7ag2EL8uzCX3
 oNP9V76IiCg8Yt/mREBeiXENpwdVugAk1mYOOibYGRzjwfY4z35OqXiOQtQqTlzO6FKE
 SyjYiAygNkZNZNDg8mNnXq6bVYFkWPvmDrRnrp0pyRHGaDY+X2np7tMi+8n2E9Ybjujs
 hIOCTF6iS1bPz3WidEreQ2IbdV5terOn84aWpepT/gHuJF+7tHTPjDSA6XM2crwJwiAb
 KM5wrSLH/b4XtULkAs2qwB1XjUZO87BJ1zfrGzvLV24U11X42SLmEYC7Efj3q0cGu9rg
 CoCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eg/LONsL/v52XjsVvWJ/gHvuI8LKJE3Kwm8pO3cmUh0=;
 b=kTDHfdSgWKNfhCTVMmDa8m8GDKArDpldzvZSfk1xJFsMe5Of4MXZrd5Z700B9V4If2
 nvtsyMzqYKQ8igdg/n/5t+wHVP9jiPzSNlc288oJoEo854+l7zFdzLbxZkc4ZgsAVXUp
 wep8hj5l5Ah7uiUnOJw7mNAE1A0AGW97qvzooiOUNQlqZp5pNErluNYLMbOqcLaDfrH8
 hvv7JNs1wzsmWYJBGEPB3F/FV+iSNdC1FoH5emWJXB21BJ/vcXoFYpb5i57YYYXOSAu1
 8ZMKzLNwvo94tB9PgbFnu+bqMwdiIWFMENBkLNVsSkJaN2q09GBVdNaFxk4FYpWVzm7X
 PqSg==
X-Gm-Message-State: AOAM533HSoxizeKZdkqByDJ/rGFqSZ7uD6Q3FkO9SfkRyML7keFvIAc7
 xFsZaOxdhq9MBm6v0fSNzq4=
X-Google-Smtp-Source: ABdhPJwuC5NMjyPrlIoyrCpfwlN5Tc7wQeInmrVcBhfZFtuqGaK5f1sraFyGvnd4fEdyS7KGbpZQpw==
X-Received: by 2002:a17:902:780c:b029:e6:9193:56e2 with SMTP id
 p12-20020a170902780cb02900e6919356e2mr21811789pll.39.1617585686267; 
 Sun, 04 Apr 2021 18:21:26 -0700 (PDT)
Received: from bobo.ibm.com ([1.132.215.134])
 by smtp.gmail.com with ESMTPSA id e3sm14062536pfm.43.2021.04.04.18.21.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Apr 2021 18:21:26 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v6 24/48] KVM: PPC: Book3S HV P9: Use large decrementer for
 HDEC
Date: Mon,  5 Apr 2021 11:19:24 +1000
Message-Id: <20210405011948.675354-25-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210405011948.675354-1-npiggin@gmail.com>
References: <20210405011948.675354-1-npiggin@gmail.com>
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On processors that don't suppress the HDEC exceptions when LPCR[HDICE]=0,
this could help reduce needless guest exits due to leftover exceptions on
entering the guest.

Reviewed-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/include/asm/time.h | 2 ++
 arch/powerpc/kernel/time.c      | 1 +
 arch/powerpc/kvm/book3s_hv.c    | 3 ++-
 3 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 8dd3cdb25338..68d94711811e 100644
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
index b67d93a609a2..fc42594c8223 100644
--- a/arch/powerpc/kernel/time.c
+++ b/arch/powerpc/kernel/time.c
@@ -89,6 +89,7 @@ static struct clocksource clocksource_timebase = {
 
 #define DECREMENTER_DEFAULT_MAX 0x7FFFFFFF
 u64 decrementer_max = DECREMENTER_DEFAULT_MAX;
+EXPORT_SYMBOL_GPL(decrementer_max); /* for KVM HDEC */
 
 static int decrementer_set_next_event(unsigned long evt,
 				      struct clock_event_device *dev);
diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
index f2aefd478d8c..3029ffb4b792 100644
--- a/arch/powerpc/kvm/book3s_hv.c
+++ b/arch/powerpc/kvm/book3s_hv.c
@@ -3675,7 +3675,8 @@ static int kvmhv_load_hv_regs_and_go(struct kvm_vcpu *vcpu, u64 time_limit,
 		vc->tb_offset_applied = 0;
 	}
 
-	mtspr(SPRN_HDEC, 0x7fffffff);
+	/* HDEC must be at least as large as DEC, so decrementer_max fits */
+	mtspr(SPRN_HDEC, decrementer_max);
 
 	switch_mmu_to_host_radix(kvm, host_pidr);
 
-- 
2.23.0

