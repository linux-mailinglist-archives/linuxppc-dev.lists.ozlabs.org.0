Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A89C6BE977
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 13:39:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PdNx71q5Bz3fCk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Mar 2023 23:39:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EWpbQwx8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a; helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EWpbQwx8;
	dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PdNt711r7z3c38
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 23:36:45 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id j3-20020a17090adc8300b0023d09aea4a6so8932223pjv.5
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Mar 2023 05:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679056599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=E5PF3sqkFmxXngJQJQHQ0RIO725f9lA9+mqcaHUiq3c=;
        b=EWpbQwx8Widt3BIdhrfMY5Nauao90WBf7m5d8GzkIFKqrtUuGdiWQETekCYtaXmZLc
         D5aHQ/9oQEJ70RzfGExhknVfs+KZJIB6Br0QZz/NfIaLTHVa9IPWnQChoYwSHQbLbnRV
         bBXet7j8G54dojD3aSSaxv2q3H2T1G7xE4oXlTZi/EfDxfkBAXDgCrAVi0pWqrui/KCp
         JNR6SWAM4b27n3pWPQmuGzqQqjkoMXShUFFfrbf5yJ79tY0/KhmYKqBG5c/PCnYchBBd
         AMGVxsdx06Mdxd3mOv+qikfYvjj8uufD39LKZMVCDbkQhhY8nvarPCJzYVeYVWA+qFRB
         wNIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679056599;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E5PF3sqkFmxXngJQJQHQ0RIO725f9lA9+mqcaHUiq3c=;
        b=djtHHx6CLO3kkDCPX5DifvhE37OtyxmFYwrWO65p7P2gxC6D6nXiunJk9JGJ0TDL+L
         FcABJZho6ERiyjyZnzhyfOUhYkD7HjxJPPVyZtyyilMnmDLua99lImvNiztNJRAMt4/Q
         Y98sXrPu5JT2rBdama01FVL3sSYOL5L+eR4PkfgNeZMC2ZZDxWIU8JPBpkMAz2v745q8
         EBUI8v3WCIzzgBIcIT9gozMlfTtWczX5XjWRCKm7aV4mo1c0Gx3uWY8tb7R095h4vwXe
         9g43oF5ATblHFrkp1DLslpe07rqDea+w3XUcqR17qjPOZsGgFfHrYXqW3edTcd7niCYi
         BAsg==
X-Gm-Message-State: AO0yUKVdJPLC5WqVwmH9kHQuhHK/hXNkWVGG35xBqrgyu0/bxw0i2wI2
	lsh8YUeZK0poIZQTK/F1ZTo=
X-Google-Smtp-Source: AK7set/r/9tsLIqaVCwWrJ+ljYodip91oYy0rj6NR5ublKD7VENvXuoiFu7Ci7CtZmpPRDXWdlYjNg==
X-Received: by 2002:a17:902:fa8b:b0:19d:14c:e590 with SMTP id lc11-20020a170902fa8b00b0019d014ce590mr5864922plb.9.1679056599077;
        Fri, 17 Mar 2023 05:36:39 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (121-44-69-75.tpgi.com.au. [121.44.69.75])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902b28400b001a19d4592e1sm1430990plr.282.2023.03.17.05.36.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:36:38 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH 1/7] MAINTAINERS: Update powerpc list
Date: Fri, 17 Mar 2023 22:36:08 +1000
Message-Id: <20230317123614.3687163-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

KVM development on powerpc has moved to the Linux on Power mailing list,
as per linux.git commit 19b27f37ca97d ("MAINTAINERS: Update powerpc KVM
entry").

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 649de50..b545a45 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -79,7 +79,7 @@ M: Laurent Vivier <lvivier@redhat.com>
 M: Thomas Huth <thuth@redhat.com>
 S: Maintained
 L: kvm@vger.kernel.org
-L: kvm-ppc@vger.kernel.org
+L: linuxppc-dev@lists.ozlabs.org
 F: powerpc/
 F: lib/powerpc/
 F: lib/ppc64/
-- 
2.37.2

