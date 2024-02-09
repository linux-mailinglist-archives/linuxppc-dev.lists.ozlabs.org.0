Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D125E84F21C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 10:17:00 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nfCa/s6L;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWSsk5LXhz3vjc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 20:16:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=nfCa/s6L;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWSmb6XXLz3cDN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 20:12:31 +1100 (AEDT)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-6e06725a08dso511709b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 Feb 2024 01:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707469949; x=1708074749; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+sqr3M98Kde9sdnxslUPSokF3Ng1Usn2pZLKUoX5aU=;
        b=nfCa/s6LjHbJAxmgZf95UiOxDJ+lbyfqF+vyIPMOCbmIQKmoCOTLgQqc34X8WZreCL
         Sc6Ofomm9Kxvzbf8S2wzCNujvktGsmKx6mYmWy/ialccOFglksXHJd8XT53HC/c70BLt
         3jjVDQ0KlqDDioIdr5MI4jOjNOykQmzuxVyNZHdRH5CR2cV2lYwdiVS1C7VBRHdQEZ7O
         Ay4D6QfNgOLKf/Z47PWNqCNDVqzeg8qRUJrioCZc0q4WzPb0F2FxAXy0Bp3fxFZmAa3o
         NIlZmahkvn4ZwfM6ZPt3pIAAFTCZjQjdGdpi2pKIjv7ZErnzrz9tYo71GPHoS2Eu5oCm
         mDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707469949; x=1708074749;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+sqr3M98Kde9sdnxslUPSokF3Ng1Usn2pZLKUoX5aU=;
        b=W2eUjqlYs0dfVzI5TF2zsE2YcpsApRDJorSKPwTcXcWmCVW4hvQx8iEmMyaITIM63/
         T+m2QPb7ivxO1pgZMaN/JRuL+t2Fvg6pfFYjV+kyAHrggLSnikyuknXunZcS4tcPdkkJ
         t2pCu7OktKNIBw8dR48RDp6PTCETozeTsICyVV8tKJFTwNBwkack2wm4IXup42r3yQuY
         sZ4gyoyLktR0WZBabXdyM/bkN/c8HOzGEoBXLfJOuzuHBB8HbiAciz6NARjH5H8T/ymh
         aC01srZ+fQ9Ek1hHsTi4+ODuRmTxnHZfZ1J8jY9LltuwZwkjjSnzXXUFo5FCdsGlzj+/
         kjVA==
X-Forwarded-Encrypted: i=1; AJvYcCVEWQ/77tnL+f6NXlycbGzHzjv45itpIzX8anluP0D/+0qWzfwwdLMZKC9RaPk2uJ9/UO3K4r6fCGwTFBREx2yXx06mDvE+MjddYKZAtA==
X-Gm-Message-State: AOJu0YwfYXMc0V00i8cYayd7k+GRkrgMCuV8j4yMaQtL9/8TbZN3rYlU
	7WEbbBp2X2L2p84R5BrEE+VDsbSCKNfD5IkMC/6yPlhEqGqe6cut
X-Google-Smtp-Source: AGHT+IGZiCLeAGHQEeXZBPf6iULKQpILOZ0yiXZFxdekf6snAicAqOXMJ5tAAJqWOoJoPAenpSfyfA==
X-Received: by 2002:a05:6a20:9e47:b0:19e:3a9f:f925 with SMTP id mt7-20020a056a209e4700b0019e3a9ff925mr1379427pzb.14.1707469949311;
        Fri, 09 Feb 2024 01:12:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVzluO77dA063QfZWhHREA8V27IxpTe9fFgjzHmlT7bplmWFF152odg1GY/Slh6d8UPJTMANFSrITjUQ0ZsVqx+spgRQEVJ+SXxTdj5OfvWG+QyNpKU9ojdeobZTJuurl6QEnqzJRn8ypfSc7USux7m6h7xZIg7cohLhOljnsjBWtwgpByMWvWzkO0mdnEY3SWfG3gwAL4H+xgDUxWM8QW45cQdlEv09vFEnxijUHiMTGFLxivLp13tBWO76S87z7kfj5i5flJj7daI57LyoDUeCGACU0VoFibaf5To0doTdDkoHOHRoXm4+EJWraVJ4Ds7QDbk+DbyQtdPgekRLpc8g2sjQ1pg9DWaX3y0a0r4zsA/Yd1bs+KTkH9jh/ruwgLzmm+RqM9n+MKClAnuNel5pMLNrqL7lJTegkrgd0nxN30CMzv8ZF62Kmvmcaj5ENlPByFuO4bgJYcuJFcH0GKBZP7EqW6fsS7i0hLhK9gNM0eIdKi1J+4btINqVsA1oz8hCafDKYNlQZ3riVPWLHUfmS1tJdMfZfjOWB6XLSjgK2AJ2HR/qIXT
Received: from wheely.local0.net ([118.208.150.76])
        by smtp.gmail.com with ESMTPSA id cb1-20020a056a02070100b005c1ce3c960bsm1101742pgb.50.2024.02.09.01.12.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Feb 2024 01:12:29 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v4 6/8] migration: Add quiet migration support
Date: Fri,  9 Feb 2024 19:11:32 +1000
Message-ID: <20240209091134.600228-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209091134.600228-1-npiggin@gmail.com>
References: <20240209091134.600228-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Console output required to support migration becomes quite noisy
when doing lots of migrations. Provide a migrate_quiet() call that
suppresses console output and doesn't log a message.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/migrate.c         | 11 +++++++++++
 lib/migrate.h         |  1 +
 scripts/arch-run.bash |  4 ++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/migrate.c b/lib/migrate.c
index b7721659..92d1d957 100644
--- a/lib/migrate.c
+++ b/lib/migrate.c
@@ -18,6 +18,17 @@ void migrate(void)
 	report_info("Migration complete");
 }
 
+/*
+ * Like migrate() but suppress output and logs, useful for intensive
+ * migration stress testing without polluting logs. Test cases should
+ * provide relevant information about migration in failure reports.
+ */
+void migrate_quiet(void)
+{
+	puts("Now migrate the VM (quiet)\n");
+	(void)getchar();
+}
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
index c98429e8..0a98e512 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -152,7 +152,7 @@ run_migration ()
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control > ${src_outfifo} &
 	live_pid=$!
-	cat ${src_outfifo} | tee ${src_out} &
+	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# Start the first destination QEMU machine in advance of the test
 	# reaching the migration point, since we expect at least one migration.
@@ -190,7 +190,7 @@ do_migration ()
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
 		< <(cat ${dst_infifo}) > ${dst_outfifo} &
 	incoming_pid=$!
-	cat ${dst_outfifo} | tee ${dst_out} &
+	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# The test must prompt the user to migrate, so wait for the
 	# "Now migrate VM" console message.
-- 
2.42.0

