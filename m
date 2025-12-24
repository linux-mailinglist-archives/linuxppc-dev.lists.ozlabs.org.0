Return-Path: <linuxppc-dev+bounces-14991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F9BCDC0A8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 11:46:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbpSy09lTz2yFd;
	Wed, 24 Dec 2025 21:46:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=209.85.167.43
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766565176;
	cv=none; b=bBS8g8sT7GqQMBDZiR3ZAjKr5kxE+DeeQebnrarZ3CnZlZ+UDYlNEXIt1AShqmsl2sfXlNRRXJoYAhOy1J0ytIfcUkK+jmHF7CmJQtY3BDWMytNGEhcf5MeQyBP4OFTuQXqc03khz7cSWwNUHolIcMTyfhMF9y6Z9WZCD1qJP4l73JHONLWyBbVjLele4iSe7hrP5nkebpJ8lDyvk2fdZHdyBn3o9jU5vtdZOo3PYCulkdQJb/Qtfuc+eQx+fgm3+iN5EnaeTG/E4XH6o2UiG/ySNHHOgg3SPQBeG+4kmy8QGEDy23HTKo7JRPIbqgdEOSy25Hv/44ICrcZTZHcMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766565176; c=relaxed/relaxed;
	bh=+/LcCQ8zwUe0fNhrJKNtlDY5MwEEJ1f2PC3vtSyv8ek=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QIkcWfsNQKqXvj27OgHao4m1HelgJ9JgQAHS1G9A4km1sB6/EK70unylnXG/TVsVM5hjcyYdAyNYtZvvVlBnqlyhksWBJ/ehtaWoTUh75mnS5Br8nvWZS7iTjBY4m9hQRbT8v7DI1OZUBzOtMO35QrNwLQPp7leNqTvaCLHLmVO8g5ZIxSTCR9KXn1fdRtWb8plUIcJcNSlrfpAe3AWnFLQKjd1PJB55MsLPTZxXqai8CEuMm9tbOCyNmr7C7RwY8fRc4a9XlN6HjsQQ5lh3VqSK0myuy7SR0Cr3MzH7LubSljrPfRUa0ZBklzIZOn7kkgVbAomNnohMKMXj3VH1sw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OLhtW+z0; dkim-atps=neutral; spf=pass (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com; envelope-from=alperyasinak1@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=OLhtW+z0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.167.43; helo=mail-lf1-f43.google.com; envelope-from=alperyasinak1@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dblWB3DGtz2xnl
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 19:32:53 +1100 (AEDT)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-597d57d8bb3so4711816e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 00:32:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766565109; x=1767169909; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+/LcCQ8zwUe0fNhrJKNtlDY5MwEEJ1f2PC3vtSyv8ek=;
        b=OLhtW+z01QXzqlwW+dc0/7Jiy6XtmBye4swTSfBhuew+b7FO7Bo+jdEdjOgJ2tB1BE
         GEkBv9S3L++LoH6fvsOBDA2ZZv9VTx4zD/gyNXsIOGHdarZPdMey2Env5/70mHEWd80C
         Jm5SHwHaXBzDBFVYt58yLS/96d5TOUN9P/uGtCVUcvBU9Fg38E+NQRAX8rCywvb7Hx7w
         FLd3Pro8rm3vnwXY4z0Tyd/rb9q8A13HjkuRsyCzp4GREd3leWZ+ojWdE6zDBs4dUzTx
         WWT6uVC8lS0EpjNsF8gi+uvKxdWm7D6mSyaN+qCgKDLqq/5W9SAtWPrh9t1dYFAm5zpC
         EXyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766565109; x=1767169909;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+/LcCQ8zwUe0fNhrJKNtlDY5MwEEJ1f2PC3vtSyv8ek=;
        b=pdSL7az49CsiokWjyCmsPd6gzENhbtXItbfKZXxAxP97lsH3vm21Y9VX9IdAHJ1Sgh
         JQHnYeK/C1XiABi3LJcC6Dfml5Ubo276bN4GvIPNoV0i/C7janq251jRONe1bDUK9Pus
         pT25BfdsBUvXCEvjFyIK9/7o760M8ivg7IiHERnBoISKnkYikoXoro86/EDR3qRsn0Ei
         wzdOOVk0u/PkvVNZJxPe5mZc36BCuarVNPT8XD+XwWjcwcZ+bR+aKLuebLz8YEi2QRXN
         HsnTWmc8SukrUGoD1dlwxdENGW6cYDr7rrR9f7LxpSUYM4fJg7C+mP/INiXC80DJ6X53
         /WIA==
X-Gm-Message-State: AOJu0Ywb9bjVdddChsE8LN5eSaZHsCsVfMFkVd3rXUrD+jN4MhEQ5WNJ
	KGmRn47tUZrHXmS/i3EN+Yb8ZrCNgYjVj5gH3ZM10wCORgDG2QKBBsiPV2jTdA==
X-Gm-Gg: AY/fxX7pmHhhTCr585eoBa7rYn2HEX6Won3JJaxiDiQ18eQHflxseEGp2wrRai7fvUD
	OyMQ0NXF2D7PyeqtJ7ZHQe8+tGUmrLFO0+rEmJWTZkkXSFVtdLSs8BkTS8LcZ48sjXkEZgOvmFV
	2voWItEEMbjSw3VnYR/Xrc4ZrjHf4rwrK9NkwxLXAtuwQ5ZSRa0WC73a56ugbs/myDgYLTCsfwA
	4QHQbB3Td9sNljBq+xS1PJLyNg0jeY0q+Wr17P/dfXKtwK0RupA9Z2EeUUE/NpGYZP6ExGa9QXS
	/YbIfmzTm4Y5x7caIVg9lGCBIT9lDF9/oKBhEQ0IaJmsNigo2S/7LVfWsVOr4QjHZUXcYdmTBZr
	j6mtDtcSnWqXCLHtTVz3QYS1pSTKpAKAnamoTjRTCWjDIn0RLX65XDz0M/974J8QBaoH70K+5/O
	HNq9JpQiepoBNDfGVsgr/zTvqlysvPFXwZrnyO
X-Google-Smtp-Source: AGHT+IFCz7bMbVaeEuQih1+/noaVnIb7zWc7m1Mkp0VhdGZcHzCbI7zekNH/mtwDeTp7rjb0PQcouQ==
X-Received: by 2002:a05:6512:158b:b0:598:f369:68fb with SMTP id 2adb3069b0e04-59a17cff37bmr5090223e87.10.1766565108668;
        Wed, 24 Dec 2025 00:31:48 -0800 (PST)
Received: from localhost.localdomain ([176.33.67.19])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59a185d6002sm4689077e87.9.2025.12.24.00.31.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:31:46 -0800 (PST)
From: Alper Ak <alperyasinak1@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Cc: Alper Ak <alperyasinak1@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Dan Carpenter <error27@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Tyrel Datwyler <tyreld@linux.ibm.com>,
	Mahesh Salgaonkar <mahesh@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Christian Brauner <brauner@kernel.org>
Subject: [PATCH] powerpc/pseries: papr-hvpipe: Return -EFAULT on copy_to_user() failure
Date: Wed, 24 Dec 2025 11:31:10 +0300
Message-ID: <20251224083116.23904-1-alperyasinak1@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

copy_to_user() returns the number of bytes that could not be copied,
not an error code. Currently, hvpipe_rtas_recv_msg() and
papr_hvpipe_handle_read() return this positive value directly on
failure, which userspace interprets as a successful read of that
many bytes.

Return -EFAULT when copy_to_user() fails.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Closes: https://lore.kernel.org/r/202512240028.EKDG3Wu6-lkp@intel.com/
Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
---
 arch/powerpc/platforms/pseries/papr-hvpipe.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/papr-hvpipe.c b/arch/powerpc/platforms/pseries/papr-hvpipe.c
index dd7b668799d9..0dee94c7c887 100644
--- a/arch/powerpc/platforms/pseries/papr-hvpipe.c
+++ b/arch/powerpc/platforms/pseries/papr-hvpipe.c
@@ -209,7 +209,9 @@ static int hvpipe_rtas_recv_msg(char __user *buf, int size)
 			ret = copy_to_user(buf,
 					rtas_work_area_raw_buf(work_area),
 					bytes_written);
-			if (!ret)
+			if (ret)
+				ret = -EFAULT;
+			else
 				ret = bytes_written;
 		}
 	} else {
@@ -376,7 +378,7 @@ static ssize_t papr_hvpipe_handle_read(struct file *file,
 
 	ret = copy_to_user(buf, &hdr, HVPIPE_HDR_LEN);
 	if (ret)
-		return ret;
+		return -EFAULT;
 
 	/*
 	 * Message event has payload, so get the payload with
-- 
2.43.0


