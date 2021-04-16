Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A4F3629E3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 23:03:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMTFb3cSVz3cC3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 07:03:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=TwXaHD1T;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82d;
 helo=mail-qt1-x82d.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TwXaHD1T; dkim-atps=neutral
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMTDk4GD4z30NG
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 07:02:30 +1000 (AEST)
Received: by mail-qt1-x82d.google.com with SMTP id z15so13741027qtj.7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:02:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yB+vSX1HdaS4xSQZ0Xj8cvvQKIrRD52dBzK1NC0kJXc=;
 b=TwXaHD1TxdYXn1ZkXBYQS9f6NeXHz7GIXjcfu1AVYsXcJqd1plTwPjQspNyzOGPt4i
 jp1ghutMRfOT2cPhkb2DAWK4RbdS6+2GdZ4p2vtyEW2/pR03+rvMOl5m5++EmCK0j7Z1
 JGWo60gprGmhiAORO0TOv4y2YtRYgb8cnkybfF9dRKaVFaBqaAPOr1TvUpD5bVKy71b0
 miQ9PW4erYJsGIIe9oqZt5bfm2QvoL75j85oBM1uo0XvDdss1k23fKUAS1q9idHNpMt5
 D6tbeDV2SlNd6HjXZGQMhN1UKzjuPxZ+edd3+pjqgNYqvzSEEHigjBESPdxI9qoVjnH7
 WsNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yB+vSX1HdaS4xSQZ0Xj8cvvQKIrRD52dBzK1NC0kJXc=;
 b=RrXlXLecepk2fxe1/yGAxPYYijFvr1BVJqY8oAZG88LPj++8/BHb5dPcghjTzFr506
 Rp6WAz5ecnbbh9Jw42SCcS2DUJsqHdhlOJo8yllC1Cxrf5REUCFC95YGSh5cX2IkTF7H
 +4b7UqkjHXCMEMi86Rhb+g/U6azHXzrxirXjuguhBslJnbwA57s9idZRqghJRCmAr0Iy
 9HpWoxRyq6jCBjJJQ8npl55ysdlx2WaiJflraj2Yj6AU2BTD42oX/X1EMckIwjIMvt9G
 HC94PI2ztWXt47g4iz93zom6vXPweSEHqgoSlVLMJq+MZ9qOKeo06F+hC8/bTHJQhQ4A
 Mbvw==
X-Gm-Message-State: AOAM531l1oJS6GVyDdoyMIGDXTSsZNPoIZyB2Dnh7rNQPRCBgWqgMMsH
 ghmj0FAf47uZlnAR+orFxKGKF8i9V4D4Dv0FHcc=
X-Google-Smtp-Source: ABdhPJyTWTmQnOTQciIFxi/5IdsKa5Xt5scVLMxbqPvIkfK9AvmqxCZRkaaciBuRFJANQhIkRzyc1Q==
X-Received: by 2002:ac8:7451:: with SMTP id h17mr992648qtr.193.1618606947955; 
 Fri, 16 Apr 2021 14:02:27 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id y6sm5020671qkd.106.2021.04.16.14.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/2] dlpar.c: introduce dlpar_unisolate_drc()
Date: Fri, 16 Apr 2021 18:02:15 -0300
Message-Id: <20210416210216.380291-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210416210216.380291-1-danielhb413@gmail.com>
References: <20210416210216.380291-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 david@gibson.dropbear.id.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Next patch will execute a set-indicator call in hotplug-cpu.c.

Create a dlpar_unisolate_drc() helper to avoid spreading more
rtas_set_indicator() calls outside of dlpar.c.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/dlpar.c   | 14 ++++++++++++++
 arch/powerpc/platforms/pseries/pseries.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 233503fcf8f0..3ac70790ec7a 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -329,6 +329,20 @@ int dlpar_release_drc(u32 drc_index)
 	return 0;
 }
 
+int dlpar_unisolate_drc(u32 drc_index)
+{
+	int dr_status, rc;
+
+	rc = rtas_call(rtas_token("get-sensor-state"), 2, 2, &dr_status,
+				DR_ENTITY_SENSE, drc_index);
+	if (rc || dr_status != DR_ENTITY_PRESENT)
+		return -1;
+
+	rtas_set_indicator(ISOLATION_STATE, drc_index, UNISOLATE);
+
+	return 0;
+}
+
 int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_elog)
 {
 	int rc;
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index 4fe48c04c6c2..4ea12037c920 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -55,6 +55,7 @@ extern int dlpar_attach_node(struct device_node *, struct device_node *);
 extern int dlpar_detach_node(struct device_node *);
 extern int dlpar_acquire_drc(u32 drc_index);
 extern int dlpar_release_drc(u32 drc_index);
+extern int dlpar_unisolate_drc(u32 drc_index);
 
 void queue_hotplug_event(struct pseries_hp_errorlog *hp_errlog);
 int handle_dlpar_errorlog(struct pseries_hp_errorlog *hp_errlog);
-- 
2.30.2

