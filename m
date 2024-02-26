Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E44C866EF7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 10:44:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GjX1sKpr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tjwg20mJCz3vml
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 20:43:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=GjX1sKpr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1033; helo=mail-pj1-x1033.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjwYq3QPfz3dH8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 20:39:27 +1100 (AEDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2998950e951so1820234a91.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 01:39:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708940366; x=1709545166; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir8XVGfbEwUzyyUuS20ld9G5VKQJor6iBkETXZzZgso=;
        b=GjX1sKprcGpIG8BChj5gNt0IyAkYncp4Q9IwSHqHs3yk4og26eybJ2MfsOhE/S9oqj
         zVQXWypVvCBnNMNBAemjCDIdJnd9PpJydlwJIN+V1vs197uQ6DOKRi+81uuO9qV3kh4J
         ocAEEBG/s5PnbugwQ1F3payfC96dph01M3ugytFKjZEeyVNejB5H9SikFtHhQqm7MCPN
         rWSZ5CJP3rCefYwB/3SP79srDqQqgG/05HjRArqJd27CZSrJBm9WPl2DZZperS+0WqXB
         6+eHIO8buLvEXtPG79qCQAaSgPbi0KqyaGZJC5rr3M+MDeCw6CqRhUaRzv5CEph1AjYF
         tsSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708940366; x=1709545166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ir8XVGfbEwUzyyUuS20ld9G5VKQJor6iBkETXZzZgso=;
        b=TNorT2XzBNQDDO9kOgjQ4wiTlD76KPWvOTm1Azg0lW8csRyJgEtFVZ1KIcg+cpiyif
         LWIjv7kTHyCTIBFMfxpGkK8v9WGUghEH2lAq9GsgHnWprnuYqDPDRBjc3P3byOgUavL5
         HRbOo3RtGmcpCgMVGx5TBwOq8Lwo0Fu7pwGIxouSqvUZ/nI6+ap7e5fjNfl2u92nPRew
         LOiPt0vAzdH5Ori6KqRyitDKxSedZoyZinLkLbeeZszYzvfUQC7xUiVkmuwh4JdnwzXu
         zjFRb3XMPpj7+vZ0wBPpdIsQulFO5qE630MCMQXAT02rCFCjOPKim2WmXc7jBq4WIYGr
         FRQw==
X-Forwarded-Encrypted: i=1; AJvYcCVviFKU7r1V+OAbbjnLOLvVxCxJi2AriURYwsSap6L2SKQE1S/egP6qctDb7DRZg1im7694AM90IsRdhiigd3i/YH5mYuJMg14B1QXsmg==
X-Gm-Message-State: AOJu0YywwUuhJhl9X67TVD38+D0TnGoZQtV6jpOu1zMCUfJUwWqNvl6g
	DSeM4xIv+ATe+T6JfjW8XZaHfYnia5nzDD3w3C+4CqL5lP4kTT59
X-Google-Smtp-Source: AGHT+IGmvHjEHV9FtxS/iLLwhsoB6LA76JI/2S+B5fHnmu7Hgj2BYmypa1uOlQi8la9CdsvyNQ+YiA==
X-Received: by 2002:a17:90a:1117:b0:299:14c9:94f0 with SMTP id d23-20020a17090a111700b0029914c994f0mr4250349pja.11.1708940365783;
        Mon, 26 Feb 2024 01:39:25 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id pa3-20020a17090b264300b0029929ec25fesm6036782pjb.27.2024.02.26.01.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 01:39:25 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 6/7] gitlab-ci: Run migration selftest on s390x and powerpc
Date: Mon, 26 Feb 2024 19:38:31 +1000
Message-ID: <20240226093832.1468383-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240226093832.1468383-1-npiggin@gmail.com>
References: <20240226093832.1468383-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The migration harness is complicated and easy to break so CI will
be helpful.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 .gitlab-ci.yml | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 71d986e98..61f196d5d 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -64,26 +64,28 @@ build-arm:
 build-ppc64be:
  extends: .outoftree_template
  script:
- - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
+ - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - mkdir build
  - cd build
  - ../configure --arch=ppc64 --endian=big --cross-prefix=powerpc64-linux-gnu-
  - make -j2
  - ACCEL=tcg ./run_tests.sh
-     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
-     rtas-set-time-of-day emulator
+     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
+     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
+     emulator
      | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
 build-ppc64le:
  extends: .intree_template
  script:
- - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu
+ - dnf install -y qemu-system-ppc gcc-powerpc64-linux-gnu nmap-ncat
  - ./configure --arch=ppc64 --endian=little --cross-prefix=powerpc64-linux-gnu-
  - make -j2
  - ACCEL=tcg ./run_tests.sh
-     selftest-setup spapr_hcall rtas-get-time-of-day rtas-get-time-of-day-base
-     rtas-set-time-of-day emulator
+     selftest-setup selftest-migration selftest-migration-skip spapr_hcall
+     rtas-get-time-of-day rtas-get-time-of-day-base rtas-set-time-of-day
+     emulator
      | tee results.txt
  - if grep -q FAIL results.txt ; then exit 1 ; fi
 
@@ -107,7 +109,7 @@ build-riscv64:
 build-s390x:
  extends: .outoftree_template
  script:
- - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu
+ - dnf install -y qemu-system-s390x gcc-s390x-linux-gnu nmap-ncat
  - mkdir build
  - cd build
  - ../configure --arch=s390x --cross-prefix=s390x-linux-gnu-
@@ -133,6 +135,8 @@ build-s390x:
       sclp-1g
       sclp-3g
       selftest-setup
+      selftest-migration
+      selftest-migration-skip
       sieve
       smp
       stsi
-- 
2.42.0

