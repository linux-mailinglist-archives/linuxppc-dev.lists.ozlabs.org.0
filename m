Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161F2324959
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 04:22:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DmJ4H0NVzz3dFh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Feb 2021 14:22:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=dP7rthrQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=dP7rthrQ; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DmJ3W4tqrz3d2F
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Feb 2021 14:21:27 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id e6so2871678pgk.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Feb 2021 19:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTjVpAMivgHzsLJrtwPgURH/1GRupUuSvOf9dkxh3TI=;
 b=dP7rthrQN9vuahpn2hIinXu/o42+I57tBnZuAvgYNtXEYzafQJ0gVmGpVmb3UnIrD+
 bfAkbj3YF93pB90u2DjuhvkYrMBjuiiYmHgHqhEZcF1MhZoEPcYwChT4Qvut1e3oBy0S
 eJid8ZXdngwn7IEwynDr42tzTZ/j4Jej74rKe6fwG0JQaoHjM6pYfCzbx3WeGXtYePLM
 lhnA+rtX++ZhwGJLSnRyWbmILCYdoScE4Yg92NnXDZJRZnjeDrjWhK7NicXPqCUFx752
 cVoa/a9V5nRGBaMArlxlrlvGZtynI7PoZ+n83DtvvLQ7RssZyjLnC1bMHHrT8D+/rMNl
 z7yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTjVpAMivgHzsLJrtwPgURH/1GRupUuSvOf9dkxh3TI=;
 b=XwyzsGuNexsiGvQ/iY4gK5q6CGenshZ8W+X3oaJFTCbCfbIEw1D/i2RhVnIogBc2af
 buOhVY46WzNBZ3UVRyHmlxQP/SOzbAXCvFa+HhsLnJclQTjybkDbBflZ6fyijWkcCG6k
 nCEb6/gKGNg4Rd/k8N9FI5aR6iW4m2IFhnU1yPz8t74Fgwpas6Y8/5FAWwFo+oCMeuuQ
 QUNx9CIADqwLfpbDuusEPM0KCtLv00Bn9Hs6xd/OxbL1f0VsYbej+xvN6ZSP46mksnBL
 O0akbnsrJONSgIGryjhLvTOTjVtaIQZ4GQNpi8b6AKvGefChSCOdzWRSH/3zZnsfqck6
 A18A==
X-Gm-Message-State: AOAM530pnasLKfKOWcUu7fRwCTKifj2yZrvBrBSj5Ou0G4NofapJViaL
 T/MnG7rZaeLf8VC0gQm4cIPc/fh2iIw=
X-Google-Smtp-Source: ABdhPJzBbcoMsrfXZJtHCPj1cMNOqJ262W5TMjo32kD+savqtOKiu8PYJyi26e38t4mYG9kUjhN8jg==
X-Received: by 2002:aa7:9e07:0:b029:1e2:6a31:66ee with SMTP id
 y7-20020aa79e070000b02901e26a3166eemr1117242pfq.67.1614223284210; 
 Wed, 24 Feb 2021 19:21:24 -0800 (PST)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id b62sm4097993pga.8.2021.02.24.19.21.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 19:21:23 -0800 (PST)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/3] selftests/powerpc: Suggest memtrace instead of /dev/mem
 for ci memory
Date: Thu, 25 Feb 2021 14:21:07 +1100
Message-Id: <20210225032108.1458352-2-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225032108.1458352-1-jniethe5@gmail.com>
References: <20210225032108.1458352-1-jniethe5@gmail.com>
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
Cc: Jordan Niethe <jniethe5@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The suggested alternative for getting cache-inhibited memory with 'mem='
and /dev/mem is pretty hacky. Also, PAPR guests do not allow system
memory to be mapped cache-inhibited so despite /dev/mem being available
this will not work which can cause confusion.  Instead recommend using
the memtrace buffers. memtrace is only available on powernv so there
will not be any chance of trying to do this in a guest.

Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 .../selftests/powerpc/alignment/alignment_handler.c   | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/tools/testing/selftests/powerpc/alignment/alignment_handler.c b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
index cb53a8b777e6..f5eb5b85a2cf 100644
--- a/tools/testing/selftests/powerpc/alignment/alignment_handler.c
+++ b/tools/testing/selftests/powerpc/alignment/alignment_handler.c
@@ -10,16 +10,7 @@
  *
  * We create two sets of source and destination buffers, one in regular memory,
  * the other cache-inhibited (by default we use /dev/fb0 for this, but an
- * alterative path for cache-inhibited memory may be provided).
- *
- * One way to get cache-inhibited memory is to use the "mem" kernel parameter
- * to limit the kernel to less memory than actually exists.  Addresses above
- * the limit may still be accessed but will be treated as cache-inhibited. For
- * example, if there is actually 4GB of memory and the parameter "mem=3GB" is
- * used, memory from address 0xC0000000 onwards is treated as cache-inhibited.
- * To access this region /dev/mem is used. The kernel should be configured
- * without CONFIG_STRICT_DEVMEM. In this case use:
- *         ./alignment_handler /dev/mem 0xc0000000
+ * alterative path for cache-inhibited memory may be provided, e.g. memtrace).
  *
  * We initialise the source buffers, then use whichever set of load/store
  * instructions is under test to copy bytes from the source buffers to the
-- 
2.25.1

