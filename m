Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB2A181CB04
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 14:57:38 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QmKF8t81;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxTQ842Mvz3cfQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Dec 2023 00:57:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QmKF8t81;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c29; helo=mail-oo1-xc29.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxTHg0hCyz3ccQ
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Dec 2023 00:51:58 +1100 (AEDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-58dd3528497so1101376eaf.3
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 05:51:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703253116; x=1703857916; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i1XkxTZ2p8Mr79CLZoHVshU8p4yh93A2s6s7Gh9L7a0=;
        b=QmKF8t81EaPw0P5SwIAERCEM0Y0lwfI0rqDdUGOnl3eWGi/wyVH4FtFEByHt7PE5vH
         /lKtjXeB/L0AZ+BRMyYUBaGP6nJtKlqpkzpnhnHKPPDsmitoeCDy79R8AUdf2KV+NQFN
         d/t2GASlXLkVAQrRcmojHM7xKNLQT+0fCvTMcsnB2v0dDGKbtMrxNYJCA+4zJN7u6mgT
         v9BPK25bbwBIi+cuPK3/cQYIn1YNDbexCqJwwaJHyeDAUez3jHzB8TPKIczObrU+MeMk
         lWaKboNQ997pH3QPQWcOhWDcF6kl2tpkOFsGMQpRPCB4AERR+DEQI4xxfUXb6fjHP6fk
         PJNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703253116; x=1703857916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i1XkxTZ2p8Mr79CLZoHVshU8p4yh93A2s6s7Gh9L7a0=;
        b=fQ8oDHrFTl483dwJeeYmdw2gJWuHfkCX1gTZ95Fb61mCFb+tyNAlMJjk6K5wvTl5OL
         4MsCwcZmoGH6oSv07nIwiYUjUALkJMEk51Marp5aO7KmA88+3hW4Lm9UaWKE9sGN9qQc
         k4qz0+cfGNvGBx4VnDd0whquhUl5b0Fkd+lp1/wYXvmclhll2hc3UlBu7nbEf2hpzD8V
         PYSrH7AOReeVXtH2VubG5YRpNH4J7JYVhMr0C/qnmxzorEieSPyHy711rC+wocXH+jG9
         zUoFdWoBQhaM8hoFVo56KYPBjdbAAlPg3vx0g2TkGP1gLURIm3dbl9gx1klU6XKi3s+w
         /HNw==
X-Gm-Message-State: AOJu0YyxKgtmcaQ+Y/WfS+siLoBCI5sdTAjm7lU+zl8tnXSJm2zBHVwl
	05pPYTD6a0QSTNcpXTZM05M=
X-Google-Smtp-Source: AGHT+IHprTJdNCxifUOv0AsH6VXtdtjc+g+uqqU9nBqDg7SkScil2ywB1uZtDvuMofooy7y5LD0ZIQ==
X-Received: by 2002:a05:6358:63a8:b0:174:b807:1208 with SMTP id k40-20020a05635863a800b00174b8071208mr1233165rwh.62.1703253116275;
        Fri, 22 Dec 2023 05:51:56 -0800 (PST)
Received: from wheely.local0.net ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id n12-20020a17090ac68c00b0028ae54d988esm3629280pjt.48.2023.12.22.05.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 05:51:55 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 7/9] migration: Add quiet migration support
Date: Fri, 22 Dec 2023 23:50:46 +1000
Message-ID: <20231222135048.1924672-8-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231222135048.1924672-1-npiggin@gmail.com>
References: <20231222135048.1924672-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Console output required to support migration becomes quite noisy
when doing lots of migrations. Provide a migrate_quiet() call that
suppresses console output and doesn't log.

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

