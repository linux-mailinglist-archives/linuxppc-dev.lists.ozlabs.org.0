Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6484F87F94C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:17:08 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T5Uh9x5B;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPhf196Jz3vlX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:17:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=T5Uh9x5B;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2a; helo=mail-oo1-xc2a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2a.google.com (mail-oo1-xc2a.google.com [IPv6:2607:f8b0:4864:20::c2a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPLF5c35z3vcT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 19:01:09 +1100 (AEDT)
Received: by mail-oo1-xc2a.google.com with SMTP id 006d021491bc7-5a21859a4b8so2348865eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 01:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835267; x=1711440067; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hLN2zrrkD0RDiFTSfzL8j8/r0UbtD91MkKEokRwP4k4=;
        b=T5Uh9x5Bobmg7sBuWa1EEFeUQ+giDtBkAEOqyKG9UX5KIgVVakeZTB/n8+k2XWkaK7
         7OYV58bMG1spENIlavXWJuJ+5OUSAHRsVqKs4C+U7IKN8zX/4BcFp/nwt3N3VqQoDvjz
         8Ac4mKYCTyPk9Ct8OEqpgqncvj7tMz3hkfy/Ssl0JgnzdpeLnqCdN/KsMMQx83Fn5Z+E
         lnzq8DNH21DBAWW53oldHZvuK86OPKNHjo5GwFGk+Qm+dVaUfV0XXaVItKb1iSseeiF/
         nNn0ylulwKvmXvf/D+qUEj7KftvHx5w4dM+2sNc5YhVio1Jj3orSXeoaovHMh6PlnlOQ
         LFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835267; x=1711440067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hLN2zrrkD0RDiFTSfzL8j8/r0UbtD91MkKEokRwP4k4=;
        b=vayew27yyWkOHAs7C6HKPcJqY57pt3ZTuTELXQzokmRr1600qKfscv13MDSwv4Ipi8
         djlF0H+VxQojvOdaz1ShQRqtFS+KRsu3X5DFgVZsLuWfza78vyX5HnK3e2vwIHUpTIAO
         s23BY9ELfV8MIUBKyUQgLABGRuMtlJbEvQ2Cg2DzhaVYs3teRXFZ6/BbxswRAt3cRv8d
         S5UuzsAqaZ8bUcjtKSPH5Zd5po37eZKgideLG5gz7r44Thk2DO6hBk6a1P9e7bsjzvrx
         YSH6fzGozuLErgblloSDVB4wi0YHu+phFzOzpuBujh6qbpGSO3UaVdm1y8buv3Ry6uqL
         yQlw==
X-Forwarded-Encrypted: i=1; AJvYcCXPyg02m10Xw1IBm8YXSOUSfrCdE8vChF/DzZjuKlCHMVgXPbuwzq2FkY6pcQvebjCvqXwgQDF49zMTt86I7+tNgkNHsNvfuMZuq1pCZw==
X-Gm-Message-State: AOJu0YyxXyF9n7MzZGu8//NRpMAXUhEkIVl4jaZThhIPUKVsLJkGRGTg
	bkafdLnk1Dxce4Ua2b51bUJ0CdyCsafjhjbwlz7obfbn3RVL+9SaoO3uHeBKkek=
X-Google-Smtp-Source: AGHT+IFeHmGB4ze6kUtSa/hewyRt16k7UnWrqRYoKu2IK3oRrizTCfSNflyjrRy8gEqvoy5Wcy9Hqw==
X-Received: by 2002:a4a:7614:0:b0:5a4:75f2:54d0 with SMTP id t20-20020a4a7614000000b005a475f254d0mr9007064ooc.9.1710835266777;
        Tue, 19 Mar 2024 01:01:06 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.01.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 01:01:05 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 23/35] powerpc: Permit ACCEL=tcg,thread=single
Date: Tue, 19 Mar 2024 17:59:14 +1000
Message-ID: <20240319075926.2422707-24-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240319075926.2422707-1-npiggin@gmail.com>
References: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Modify run script to permit single vs mttcg threading, add a
thread=single smp case to unittests.cfg.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/run           | 4 ++--
 powerpc/unittests.cfg | 6 ++++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/powerpc/run b/powerpc/run
index 172f32a46..27abf1ef6 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -36,8 +36,8 @@ if ! $qemu -machine '?' 2>&1 | grep $MACHINE > /dev/null; then
 	exit 2
 fi
 
+A="-accel $ACCEL$ACCEL_PROPS"
 M="-machine $MACHINE"
-M+=",accel=$ACCEL$ACCEL_PROPS"
 B=""
 D=""
 
@@ -54,7 +54,7 @@ if [[ "$MACHINE" == "powernv"* ]] ; then
 	D+="-device ipmi-bmc-sim,id=bmc0 -device isa-ipmi-bt,bmc=bmc0,irq=10"
 fi
 
-command="$qemu -nodefaults $M $B $D"
+command="$qemu -nodefaults $A $M $B $D"
 command+=" -display none -serial stdio -kernel"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
diff --git a/powerpc/unittests.cfg b/powerpc/unittests.cfg
index ddce409a8..71bfc935d 100644
--- a/powerpc/unittests.cfg
+++ b/powerpc/unittests.cfg
@@ -82,6 +82,12 @@ smp = 2
 file = smp.elf
 smp = 8,threads=4
 
+# mttcg is the default most places, so add a thread=single test
+[smp-thread-single]
+file = smp.elf
+smp = 8,threads=4
+accel = tcg,thread=single
+
 [h_cede_tm]
 file = tm.elf
 machine = pseries
-- 
2.42.0

