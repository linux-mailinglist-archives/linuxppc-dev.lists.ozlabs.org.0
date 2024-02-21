Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4841785CECB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 04:33:31 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iIJ7IIiR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tfhgs1LC8z3vh2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Feb 2024 14:33:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=iIJ7IIiR;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636; helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TfhZp4nf8z3dHV
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Feb 2024 14:29:06 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc1ff58fe4so9192055ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Feb 2024 19:29:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708486144; x=1709090944; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IIo+YCQIpcqZZQl5SQPpBtKwaaGVQawpmU1ARg6aVZc=;
        b=iIJ7IIiRxY/4rJ9dN0EtoMM+cYedYPTtPxX9OR8snohsVtuTV5buLaiVqHHX3kJZu4
         /V1KsAu0ryES3vPbC8uf1qXYhKp+tZRsofuBzmRMrtPhpinjNwvArpPLJ6/8WfkWNo6k
         ObSoSG9wIjGwemUi7IJitSNUl2CflnbLY+Xr9IZFTrTr+d5MIBR3QdASN+rX+X61K3/w
         U96RIJwIOyVnwD01+aDs8q0mFEifcFDzI57nLpEMMB9WRIEACoDcNaUJattHrrEAzSjY
         IYkkoKCfNa8s+M906ElQly/hg7h6BJyG5Hx8JG/91lYpFBfl49+bS+csPpkFSdHW7hHz
         YT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708486144; x=1709090944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IIo+YCQIpcqZZQl5SQPpBtKwaaGVQawpmU1ARg6aVZc=;
        b=wgHJP/MH4qnaHwP/uatUabAnfX6yVc9qP9svmBbJZ8iv6jqxbUU1Ds4KpQfMRcqyq9
         21JF1MwF0+N4FDfkBWeGL2Z4/qRqlhpE3EdJaRh9D0+1FlGLmw829DQ/W1CsMyDUTD+P
         Uau1vPyHNbKg5P1UpWu1gMOQu88KxIohPqN15/cSDZ+OOHKZqCuQCGm89SYKkvCsaOq4
         N0fJHDcBNxu7h+dRfQRYCwoDhR2njtN1xEA5MzIfVjqwfXMstyC78z6913pl0ZQcBjWv
         dbvDnvwKOKhxGqgWhoRn/Lyt4q7DPDfKDS0VlFWS9BlGnULdjgUdCHaITprLrJtV/mUi
         hzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBmCGtNNVYbZppnlObthRxDKHlwBU1nRVybJwZs+tYiW1EzmEdodklLivJukBtV/UFK1/4nvi08pM4IhmJG0J4A5sYDpPQXXc10j91UQ==
X-Gm-Message-State: AOJu0YzgDMw/n/x0CNurX9L1/M0RTe3PlEXm6sQcfxTsTXFIHepzjE+n
	SFGeWjOdX60mtsz6eyfv20S0eo9usTKw22fT7SxpG6R26V6i4hL1OjkUTOCx
X-Google-Smtp-Source: AGHT+IGkE2tXMoP+uu2dMPF9yafXmDF1WYeLW14EiA+DBNvKy9Jy7TtJJX6AdHjI0vAVunFoMBALqg==
X-Received: by 2002:a17:903:1211:b0:1d9:a609:dd7e with SMTP id l17-20020a170903121100b001d9a609dd7emr19873074plh.55.1708486143769;
        Tue, 20 Feb 2024 19:29:03 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902b10700b001dc214f7353sm1246457plr.249.2024.02.20.19.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Feb 2024 19:29:03 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v5 6/8] migration: Add quiet migration support
Date: Wed, 21 Feb 2024 13:27:55 +1000
Message-ID: <20240221032757.454524-7-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240221032757.454524-1-npiggin@gmail.com>
References: <20240221032757.454524-1-npiggin@gmail.com>
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

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 lib/migrate.c         | 11 +++++++++++
 lib/migrate.h         |  1 +
 scripts/arch-run.bash |  4 ++--
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/lib/migrate.c b/lib/migrate.c
index b77216594..92d1d957d 100644
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
index 2af06a72d..95b9102b0 100644
--- a/lib/migrate.h
+++ b/lib/migrate.h
@@ -7,4 +7,5 @@
  */
 
 void migrate(void);
+void migrate_quiet(void);
 void migrate_once(void);
diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index c98429e8c..0a98e5127 100644
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

