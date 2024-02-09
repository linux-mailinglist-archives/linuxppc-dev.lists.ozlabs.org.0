Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5480E84F09E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 08:07:02 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PF5PhQLL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TWPzm1Nzsz3dRW
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 Feb 2024 18:07:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=PF5PhQLL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TWPtw0cCyz3cRd
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  9 Feb 2024 18:02:48 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d958e0d73dso5126735ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Feb 2024 23:02:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707462166; x=1708066966; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qsb66D3Bdnju/B4wMjZRE5sQcB0Os6ZjxNoeFhHSgYI=;
        b=PF5PhQLLJqP/bNrf0GWTgN6EfskygIUPMsNZYreCGSuu3plTQ0YwQOXz6jXadc6Uot
         yCDfQM3aGJG4i52oBFyh0TLjyUmAu56CXRnrLBH/xspjGWHbOEIrwBIDee8Pt2/IglvD
         JScIK0oy3sGtwpU7gsupbx0c1nmhlbwkUPyYi0b24YBVKcPg3qCZH4RiLh52AL8vKs3D
         iC5jA+w5bsCUFh155L0ttOOAiW+I8mk2Vzn08J7EsCJnMr712xDN5yZuTGgqwMbiztIh
         Nril8UeHeRaBh5Fb6sEv9eKU6NU43qrzUNdL/3i5iyY4yXs3w/YH0/KcAXxLh9pEnBUE
         9giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707462166; x=1708066966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qsb66D3Bdnju/B4wMjZRE5sQcB0Os6ZjxNoeFhHSgYI=;
        b=wlIsCH5DhMhtkT72GARfmoOOhI4ElGWvcFL84ShEmaoOnzOc58yvgcMpKxyEqTVGyt
         xrZxI9XdH/v/Od2PUbhas28ukIIOkAl32dTvkLTpteVfNnlzwZg2cbF+NJmC3i+y8EIM
         zNMGeDk6xHhPaUQ3KxkqOr2K1ofTq/xHJFMVLME7KAQEjNNLTjXn/JfYibtQZ4u2A5Pr
         MS46zceRFiNhR00Ek4tmki6toR2+RN+iyV4+wYv/w1OFJuK6bAXrfIU5loB7ANSVd8Cq
         Jlg8rS1+IAH+JOG9TFKAbxcXTS7brIDq0lctPQFEu+hCD9+9KzeyAMCSiUzYZ41d6bvt
         TA8w==
X-Forwarded-Encrypted: i=1; AJvYcCW889AXyfQ7zn6jzRbSF4xI4GWCLyXeG5Krnf1AERgLSIxNUcx78LVXeoWtsgOCNCopcwasRz4H5NDkKYNAVVJEM9PZ/Hsp2qHMCG7ffg==
X-Gm-Message-State: AOJu0YylDxnHr4Sgbc/Vkxn5OV5rDbl5Gsr2ZkQOQrbxT0rChKXm97Ei
	HDd7wKQ8FaumPoij7F1DS9lHPy5PAOvLlOf87bJ9WtIvUB9b+cOM
X-Google-Smtp-Source: AGHT+IHU0yLvmoVA6RKCQ6uyd2pMX3xvxjI2eIt3+EkdLZ4rFtP2o0Kv2c+t5MKAEvXWGxoEJoqkhA==
X-Received: by 2002:a17:902:dac4:b0:1d8:ff72:eef8 with SMTP id q4-20020a170902dac400b001d8ff72eef8mr252746plx.18.1707462166439;
        Thu, 08 Feb 2024 23:02:46 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUS07VqJtp8QffWN3zhicRM8LYt8elB5iTOnmCfZ9yy015fREDprJMZMviRnS98UcXQ/VxQw5ldSNprvJDhbVvdZ2iTvfcBiAjIzZfqX58zO6C8/i7isMINudyqNMaFxktdnnzLNazq6uh+2kKcYxmW4vZDXt8HbVI8+QYEcbcIRlCYgMvivyCqBZ6LkfiVKkaqRVhOnH1HSaJkFlOP64LphaRgHUHEniYyVPhgJ2cftwYq3LZ8hQtH3X4i94sQ1NmT12Uu39pJiWkIUij9SP4kCLNt41SD0xaEIECmybtiFoq1h7Fkr3ziDK8J0m7NyoAcZ9UwSVZivUHtCuYCt6i6nZMHfN2FIL+UC4mt/7Vt9FQ4OftEaUD4g0Uj75ilOzRkKQiRzXv2CJAB7cV7goDUn40aKB6FotefYlzCEHOwttpUYJdMEU+iksnfmeV0C1WAhxVF6EOkXiv/2qUsbmlWT/TJBT5tupgBrXLQc4X/zjmDQsWKW/5uB/n2l1aRYc2ChurcIcQZOSF9H1AL/ldjQ168IPS9m45kha/V5LyIKKwVJYZc17j
Received: from wheely.local0.net ([1.146.102.26])
        by smtp.gmail.com with ESMTPSA id r10-20020a170903410a00b001d7284b9461sm839285pld.128.2024.02.08.23.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 23:02:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v3 6/8] migration: Add quiet migration support
Date: Fri,  9 Feb 2024 17:01:39 +1000
Message-ID: <20240209070141.421569-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240209070141.421569-1-npiggin@gmail.com>
References: <20240209070141.421569-1-npiggin@gmail.com>
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
index 0b45eb61..29cf9b0c 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -152,7 +152,7 @@ run_migration ()
 		-chardev socket,id=mon,path=${src_qmp},server=on,wait=off \
 		-mon chardev=mon,mode=control > ${src_outfifo} &
 	live_pid=$!
-	cat ${src_outfifo} | tee ${src_out} &
+	cat ${src_outfifo} | tee ${src_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# The test must prompt the user to migrate, so wait for the "migrate"
 	# keyword
@@ -200,7 +200,7 @@ do_migration ()
 		-mon chardev=mon,mode=control -incoming unix:${dst_incoming} \
 		< <(cat ${dst_infifo}) > ${dst_outfifo} &
 	incoming_pid=$!
-	cat ${dst_outfifo} | tee ${dst_out} &
+	cat ${dst_outfifo} | tee ${dst_out} | grep -v "Now migrate the VM (quiet)" &
 
 	# The test must prompt the user to migrate, so wait for the "migrate" keyword
 	while ! grep -q -i "Now migrate the VM" < ${src_out} ; do
-- 
2.42.0

