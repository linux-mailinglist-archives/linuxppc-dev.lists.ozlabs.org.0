Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 911328BBB5D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:32:44 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NHFjD0FP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnBL1ZQHz3dJk
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:32:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=NHFjD0FP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn6D2kfJz30VD
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:29:08 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f44881ad9eso418451b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:29:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825747; x=1715430547; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nbmc3N7ayQQTSkTEYRPQXziyE3JeoYhuY3oQWrhsIyA=;
        b=NHFjD0FPv0/FKXfnxpkP2+6MB8kJgsAYFzUdQwDxsS/Ll2kbMtxvcDPGwQ8gb/zIcz
         9iK3+QSKcPUO91Y7ayxMuXlaRlHam0Qc5lH1TrR9yMniBNgGi+ZFUXlsIRU1B0xXYABS
         l3CEewpW3y/Rofsn1MoWyn+eQV/en04m7eUDC7jtC6awPjd4OrMLx3atC9BDu8rCDPtG
         gt+QrAwn+bReDVO5SNkACMVfEeuY2tTWiMeiRrR/TsK/FSW7OiC9oiALdgj2CPAfLO7I
         n+583/u905+1mrE7p/rFRp94xPrhQNRuTGOr2j8TNDAzi61rZ7qYQteYl7EEVF9jYRer
         uX9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825747; x=1715430547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nbmc3N7ayQQTSkTEYRPQXziyE3JeoYhuY3oQWrhsIyA=;
        b=BUI0aev45AxSS7VkkM4FRsYoTB1Pt2jaRjkkKu1UBIzdhJNSdPhVdyQK7BO3h7rgZ3
         FMMkzJH6rbdG8Ef2FEkZsZotOXaglOeyIpBvQxEXoPvjmRPsWfId+rs3vDxhXYfS1GyY
         998Oqt7pxetKpo7ozSaQlIET6hoAqsRPLi1QfNdO7mgNvF84zTNc6EAmAcGx9YpfqP0W
         Zow1LYBAmYyWFOMNjAr412f4UArweJtc5TIA8vHfvhTZOpePwB6IrdPK/PGBt9/EYlqG
         Q2vQEoQ/kObnrPHR9GlCDF+J/zbWyskzL0IofKUVCGk5uHTrDcksbiug9OL86srgPUMR
         Joww==
X-Forwarded-Encrypted: i=1; AJvYcCWjfemsrS23txqFvDziw9SxtAVyPdo5HaZjSppmg+ynDG8mnOJqBJd+FPd9/k/pIFzqA6EsUiiYxVxS1CqaCe0cNxCmDzAdXzvmSM5g2A==
X-Gm-Message-State: AOJu0YynMO3zMRxtC5q1kkHVYTF2ubCoLVunkvJK1f7bVML3ha2WzOH9
	wUqIzByrTXPA8+21Q2VS19p066QqRfr4ekPUgHvHzYKWMaVKhcBA
X-Google-Smtp-Source: AGHT+IEZFDAiDCpXRWqjZJD9ozdG8fcKWo3qQoDgM90MYAfLLB66dy82b1Qj+GOfJf6+77IQHdV5SA==
X-Received: by 2002:a05:6a00:4f83:b0:6ee:1c9d:b471 with SMTP id ld3-20020a056a004f8300b006ee1c9db471mr5947858pfb.25.1714825746767;
        Sat, 04 May 2024 05:29:06 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.29.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:29:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 04/31] powerpc: Update unittests for latest QEMU version
Date: Sat,  4 May 2024 22:28:10 +1000
Message-ID: <20240504122841.1177683-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The latest QEMU fixes some known bugs in migration which allow
some migration tests to be re-enabled on tcg.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/unittests.cfg | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index 432c81d58..699736926 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -20,9 +20,6 @@ groups = selftest
 [selftest-migration]
 file = selftest-migration.elf
 groups = selftest migration
-# TODO: Remove accel=kvm once the following TCG migration fix has been merged:
-# https://lore.kernel.org/qemu-devel/20240219061731.232570-1-npiggin@gmail.com/
-accel = kvm
 
 [selftest-migration-skip]
 file = selftest-migration.elf
@@ -30,10 +27,8 @@ machine = pseries
 groups = selftest migration
 extra_params = -append "skip"
 
-# This fails due to a QEMU TCG bug so KVM-only until QEMU is fixed upstream
 [migration-memory]
 file = memory-verify.elf
-accel = kvm
 machine = pseries
 groups = migration
 
-- 
2.43.0

