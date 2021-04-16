Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 161CC3629E4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 23:03:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMTG26tMvz3cNJ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 07:03:38 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=O/uzxfMJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729;
 helo=mail-qk1-x729.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=O/uzxfMJ; dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com
 [IPv6:2607:f8b0:4864:20::729])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMTDm5sGdz3bw1
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 07:02:32 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id e13so20467009qkl.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 14:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bVeFYCnTaVSUp8Xv0RaV/4GEYDHU9zY3yyiCFqqEjEI=;
 b=O/uzxfMJzaKGXgQ3E7rqfClnCq0iW3cVafeo30Sk1FDrtCwnfLEfdqTLfwTz4diagL
 /Hb9acIfMphpe10Mp50uZJiMBoxlHbSHF3RhJwFBeaKiSn7KPrhJ7X7EaPV58rtWJ+lx
 VuYanEpCArypNbGDzEtznvcVlzFicRAbcKiZh8jRNUepMEC4Ym6hKSwysP+uFAQdypv1
 PZ3wCGxosLv8YM3y2y0wFAZgZIhQCVyZzywkYKjQe3vHG2Sx7aFjFpZsBB//wfES3+hA
 0Ujm3k3Vg5gKV21Yp471DZAD/l3x3qK5FUTVsSLmks8nt3gU7u7faeigmGMldFM5fCE6
 N8wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bVeFYCnTaVSUp8Xv0RaV/4GEYDHU9zY3yyiCFqqEjEI=;
 b=LRtcCAak7JHtWgIs/maiDx3UWUDo2jaKUvfvgRdhJdmKFt+/jQ/aDwaEfm2ytslOLl
 4Xwu60oPAP22Y6cNSfnuXQcFop1fGr8j6JiR60sxDRiGGiHob5/zC8/j2AoMElWkeiz3
 Qmr6b8Bu7Smd5W7MTh1Qqu+tQtp/Y9oPjZB7P877yr5XJVicappvbQEHASDfg6ZBmKI7
 dDBJV3g+6/6NFsqBRFy+/5boozGKsnFvE/BZAsTcMCBJvjaY5o16PMD1ZlCQbnwqt7YX
 tqj4LcHEaX4fv4RQf5WFgd7Id7uUNXJHcwnNGZVIo3EBeZGslstbV1nAuxWz/GYH8Gr2
 PyUQ==
X-Gm-Message-State: AOAM530JE1YztUv3xAkwyzQFy0MxWh0htM+oQekwp9ZUylBC4MQ2i9z8
 9VbHItxKnJEELxZDJRW9TMlvQ2e2lk0xYuVwLpY=
X-Google-Smtp-Source: ABdhPJwNOEUxKP49WfvvKI6CmXfSsdg+jCIk8bkPOD0/HknbqzgLMGV99tdz09D0HEUyXa9cELuG9Q==
X-Received: by 2002:a05:620a:1181:: with SMTP id
 b1mr1195887qkk.81.1618606949835; 
 Fri, 16 Apr 2021 14:02:29 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8811:45c7:4abc:f19a:be81])
 by smtp.gmail.com with ESMTPSA id y6sm5020671qkd.106.2021.04.16.14.02.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 14:02:29 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] hotplug-cpu.c: set UNISOLATE on dlpar_cpu_remove() failure
Date: Fri, 16 Apr 2021 18:02:16 -0300
Message-Id: <20210416210216.380291-3-danielhb413@gmail.com>
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

The RTAS set-indicator call, when attempting to UNISOLATE a DRC that is
already UNISOLATED or CONFIGURED, returns RTAS_OK and does nothing else
for both QEMU and phyp. This gives us an opportunity to use this
behavior to signal the hypervisor layer when an error during device
removal happens, allowing it to do a proper error handling, while not
breaking QEMU/phyp implementations that don't have this support.

This patch introduces this idea by unisolating all CPU DRCs that failed
to be removed by dlpar_cpu_remove_by_index(), when handling the
PSERIES_HP_ELOG_ID_DRC_INDEX event. This is being done for this event
only because its the only CPU removal event QEMU uses, and there's no
need at this moment to add this mechanism for phyp only code.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 12cbffd3c2e3..ed66895c2f51 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -802,8 +802,15 @@ int dlpar_cpu(struct pseries_hp_errorlog *hp_elog)
 	case PSERIES_HP_ELOG_ACTION_REMOVE:
 		if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_COUNT)
 			rc = dlpar_cpu_remove_by_count(count);
-		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX)
+		else if (hp_elog->id_type == PSERIES_HP_ELOG_ID_DRC_INDEX) {
 			rc = dlpar_cpu_remove_by_index(drc_index);
+			/* Setting the isolation state of an UNISOLATED/CONFIGURED
+			 * device to UNISOLATE is a no-op, but the hypervison can
+			 * use it as a hint that the cpu removal failed.
+			 */
+			if (rc)
+				dlpar_unisolate_drc(drc_index);
+		}
 		else
 			rc = -EINVAL;
 		break;
-- 
2.30.2

