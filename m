Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2D6899839
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:42:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XIR2ycMd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sRr6l4Rz3vfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:42:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=XIR2ycMd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::32c; helo=mail-ot1-x32c.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sK32zpyz3vY9
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:36:23 +1100 (AEDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6e89bdd4e3fso1018854a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306180; x=1712910980; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=30fh0yQBw6PorNxnoqOiIeKlx1L7d0w5kZn3MakUxVY=;
        b=XIR2ycMd2dIKtqAtgxeTsl8IdkJzjZSs/UsGM73ysdne1B6Rx/4lMadDmSBa7KkJXG
         WGCHBxDMMnJU079jC/yyLcexE9wrNzvLoOWBN1OxaN1I+j8OYSLCbyF4syigUmlsvMJx
         RUKrxMmjIcK+tKiJ9yHaVvT89+B7mYaUfxwFaQv2bP5IuKYtNSEnN7CiHPfXYmg9Wwt0
         u0ULV2BXIfEpkBY5MEuVa7A1VGk4yhR/vKiZzTZAXsA6JLhTFlynAS/5W+ZXQ6jsz2H8
         g++zG+S/E3okZv+xcH9nO85HeDW4/XXHI1HvFVVGt5NmtdegH9ljB7YdATfkR2acrCLH
         Rkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306180; x=1712910980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30fh0yQBw6PorNxnoqOiIeKlx1L7d0w5kZn3MakUxVY=;
        b=Hu9+1uKboVXSTyNVngDyj6i9tioDTShJ+fHe1w4PL/HpV+LietAhjXYmqTnDPMZUel
         1wpGA/Rw825hBbnLpoAQ2ZJfZsGxUzmI1SeJHYtiNorQh+o4eIURvm9aRTnoA2KWHWtw
         4OeGz1pqfdrTqu2OKM3ifeEgMknmkPzbofWpjwRyYb4d8qXygqIgrjnfdvMO0uUWVWaV
         0gLzSDp+drDxgZwLsMm3RJs75dMfJ1HXUUMeuc91c17jjb5NQSoPIasMuxgUl1Y8YQ5W
         AgE6yzGc9GXOJvK0Y7byczLjyirRSYp6HvijVKuDzE3yXkG/T6MZDHVkfoPMqkBvXfaz
         bMdA==
X-Forwarded-Encrypted: i=1; AJvYcCWXOGXd6pLPV+9tGa2tIdDkFdU0Fe2MQ1+GNf8qxecoDtqrI/WNhruMbOc70JCqYCDWzwbK7bIZdJgYir1oieeuov6SiGD+G6UgYxVacQ==
X-Gm-Message-State: AOJu0Yyd/qwC9Jnk1SfNc030++xhzcIT0mFSDdTYRHnNtV4MOjcadyIt
	nrWR7mZOL1TU5OkbWr+dfLrY23onE456dzoJ02nFiAOmVNDoAaWn
X-Google-Smtp-Source: AGHT+IEwX93vy9dusFaTBUm3Gcf/pVzsUgPfOt6akJEEck/mPBQYY9e4koetiEicEH6zUiyf1R+O7A==
X-Received: by 2002:a9d:674b:0:b0:6e6:ce61:3ee3 with SMTP id w11-20020a9d674b000000b006e6ce613ee3mr736377otm.18.1712306180480;
        Fri, 05 Apr 2024 01:36:20 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.36.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:36:20 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 08/35] powerpc: Fix KVM caps on POWER9 hosts
Date: Fri,  5 Apr 2024 18:35:09 +1000
Message-ID: <20240405083539.374995-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240405083539.374995-1-npiggin@gmail.com>
References: <20240405083539.374995-1-npiggin@gmail.com>
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

KVM does not like to run on POWER9 hosts without cap-ccf-assist=off.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 powerpc/run | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/powerpc/run b/powerpc/run
index e469f1eb3..5cdb94194 100755
--- a/powerpc/run
+++ b/powerpc/run
@@ -24,6 +24,8 @@ M+=",accel=$ACCEL$ACCEL_PROPS"
 
 if [[ "$ACCEL" == "tcg" ]] ; then
 	M+=",cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off"
+elif [[ "$ACCEL" == "kvm" ]] ; then
+	M+=",cap-ccf-assist=off"
 fi
 
 command="$qemu -nodefaults $M -bios $FIRMWARE"
-- 
2.43.0

