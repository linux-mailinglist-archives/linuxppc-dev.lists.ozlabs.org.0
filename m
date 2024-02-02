Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42DB68468EC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 08:04:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iua6HXZ7;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TR6FX1PRMz3vhX
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Feb 2024 18:04:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iua6HXZ7;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TR67r68b3z3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Feb 2024 17:59:04 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d7431e702dso15603995ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 01 Feb 2024 22:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706857142; x=1707461942; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AcbZ3b72z5JTsiEYQiD8/BwtKqeQBzzGW/MZj7+sxQo=;
        b=iua6HXZ7LGickyeg93gc6+2jm37X16ds1qA7x3ge6CA3oerwYr2t+lQEdYA+MoDyRB
         mR196lMeEclWwhZuwWAS2P9XVDpX5q+8FqVnAfJSlMz8fBPpzISQMwImj0zaBM8dsQ4u
         iIK+O9wnRg4CzORAMa7Gn2M2J66GfCfl2bklJv7OnX6IBHJbjTXukG1heweAWhC5bVzn
         riZjSqXUiE9rl4uxOvB9gBCNcHEvHFwOUZbEKbcWH7kAi8QN0rA2gJnWuVd3o20dh+tM
         0fGQMVVZgIhQhq2bfaC4nkjjb03OdcMGkt0lYLB7gY04hgjZMVC5i5Qs5E26YYsAof1a
         idKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706857142; x=1707461942;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AcbZ3b72z5JTsiEYQiD8/BwtKqeQBzzGW/MZj7+sxQo=;
        b=B7QWTUpvp0qZfag4+yqkLVcQySwNr+G/x2OdLRqnYJZlMPjt6HOeymTmsiIihQOYLl
         Q1GJGgwuSh8z+ikHuqPW0zWldaVCC/xTguxhKgV0M3gvwDzl/oNkzuMsN24HsowC9X/C
         Z5Aevv7IHpGhmwizERUSp6qfDz+yY3TA6VJrmpU4fXmea3DCyHn0oQRB4zdL3rIIePmF
         8DXgQn6MmmN350sJvFgpzY0bh3B0Lp+7y6zHgUaQE9jtKfSy6eqnIcrEnyXunYWIwN9i
         zTsZOMIh/WfxBbtZjHVJH/mKzzTd77lkI9e3k+lD43BcslPjIUrpFlkZJ7qK2JOqxV02
         Gbtg==
X-Gm-Message-State: AOJu0YwOzq0/nYpgX8wrJBefsftglmVIVedbAT6m+vs905ZYoy8RvvFG
	a7F+SdemChNIkC01tybrk9+B+BfL+CPYVgfC1V0DpLmxnKT1GId3
X-Google-Smtp-Source: AGHT+IFs+IN8kqrNAOK7L1kdhKg2x+fFZzGf5XMf2+FBY9Nbg8lXWJKa6GZTbVG9lE7J4tad2sbYug==
X-Received: by 2002:a17:902:ce8c:b0:1d9:7412:834 with SMTP id f12-20020a170902ce8c00b001d974120834mr719999plg.8.1706857141947;
        Thu, 01 Feb 2024 22:59:01 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCWSPDjupVheTRpWjNG3qQOcVOPZJWHEhIlPhxS7xEOECZT/j+hA5vA7EhckWrkOUVp1YN/gMV83pWB6BlPQnN464jm5KGO0FaR/AV/72oUiwHzfmmMXB6AfWsXAYGreRlgFfBq4q4v6indtcbkufNSdGjsgqswIjC9s7nUFqPjexotrw7C85wdEReHZ4i4Hc+8/N4m44m9fAMAT3yAWTKAuRw+HxNNdwwHUbfL06hssswrFRRGhvZqesWG9HRgrSFM5+hbwwelX/CD22eTA4iFEQsrzWQ1WCRHt1Rl3QDWgENNcYBjqIAfOAr+7Nw+VVm+kmHyXa61hG/SGbSzt47XfF81ZEZIU4/dt0kycXB3YA5i/hltb8mlyQhIfojSw8EiSEAX/hczMK1BJxR1JblUApaYd1Yu1trsAUfTu5Efg2L8YNp3UnHiMD9WXpZJcE6f79A5grOoZGB/t1Fq41wpCqsWUsrcSembgQLmQNRqA2UZytjtZI/hxLRLhl13CTJQgHhr2cqx8R6E=
Received: from wheely.local0.net ([1.146.53.155])
        by smtp.gmail.com with ESMTPSA id d18-20020a170903209200b001d948adc19fsm905734plc.46.2024.02.01.22.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:59:01 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v2 7/9] migration: Add quiet migration support
Date: Fri,  2 Feb 2024 16:57:38 +1000
Message-ID: <20240202065740.68643-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240202065740.68643-1-npiggin@gmail.com>
References: <20240202065740.68643-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Console output required to support migration becomes quite noisy
when doing lots of migrations. Provide a migrate_quiet() call that
suppresses console output and doesn't log a message.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/migrate.c         | 12 ++++++++++++
 lib/migrate.h         |  1 +
 scripts/arch-run.bash |  4 ++--
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/lib/migrate.c b/lib/migrate.c
index b7721659..4e0ab516 100644
--- a/lib/migrate.c
+++ b/lib/migrate.c
@@ -18,6 +18,18 @@ void migrate(void)
 	report_info("Migration complete");
 }
 
+/*
+ * Like migrate() but supporess output and logs, useful for intensive
+ * migration stress testing without polluting logs. Test cases should
+ * provide relevant information about migration in failure reports.
+ */
+void migrate_quiet(void)
+{
+	puts("Now migrate the VM (quiet)\n");
+	(void)getchar();
+}
+
+
 /*
  * Initiate migration and wait for it to complete.
  * If this function is called more than once, it is a no-op.
diff --git a/lib/migrate.h b/lib/migrate.h
index 2af06a72..95b9102b 100644
--- a/lib/migrate.h
+++ b/lib/migrate.h
@@ -7,4 +7,5 @@
  */
 
 void migrate(void);
+void migrate_quiet(void);
 void migrate_once(void);
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 0feaa190..5810f9a1 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -154,7 +154,7 @@ run_migration ()
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control > ${src_outfifo} &
 	live_pid=$!
-	cat ${src_outfifo} | tee ${src_out} &
+	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# The test must prompt the user to migrate, so wait for the "migrate"
 	# keyword
@@ -202,7 +202,7 @@ do_migration ()
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
 		< <(cat ${dst_infifo}) > ${dst_outfifo} &
 	incoming_pid=$!
-	cat ${dst_outfifo} | tee ${dst_out} &
+	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# The test must prompt the user to migrate, so wait for the "migrate" keyword
 	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do
-- 
2.42.0

