Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B07C1346A75
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 21:51:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F4k7W4znZz3byk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 07:51:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=Is2BkyDL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::731;
 helo=mail-qk1-x731.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Is2BkyDL; dkim-atps=neutral
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com
 [IPv6:2607:f8b0:4864:20::731])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F4k6l1cYzz30N0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 07:51:10 +1100 (AEDT)
Received: by mail-qk1-x731.google.com with SMTP id y5so14352677qkl.9
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 13:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5NdUAyMq4arX/v/TJOXJDpeKgjAfjtYaInNcRVAPA00=;
 b=Is2BkyDL+LCiZV3cTum5NQqfQElss18nU0R2BdF8TthAPw3tciuSSazpQYxo6d1MmB
 C7zdKYT8mbWU0h+5t4D9mGc6YOMwCkh5RjAv56WUSduXwvOgGTr4I6glXz5yt18Ngxks
 mCon1gC9tB5OAXcBugJres9gwlwCpiLHdZX52vjJ178gjNLbVjI7dtOZhQ1Jm0DglI6T
 bEK2yDaTWhYGst8sjEFPtLFdTDegYEprMoDYXxG/asTK/q6D5G+5yrfDEn09VruMNiiJ
 ll+bpZ77Hi9VzxDO+wnnaCZZ+qDs2+cgHJkLVQ3ytIoaKZsRzu4b4Vfg1jf5Ax2//0IE
 vvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5NdUAyMq4arX/v/TJOXJDpeKgjAfjtYaInNcRVAPA00=;
 b=mBk75Fko4BSZ44TfYjTOSjHuQ5nGqFTGcsDgYyPjSQBktLFzgxTvYCgwlzYG/yHmz7
 PVcsLeaEFt+ih1dSKDI3730dhftM+8VGEDkJgu7t2ueaewgcM0g+Pp5eJN4c/wbpGsSr
 comPQ4ZgCag+aALclIBhz0hgT1VugInSuOkoC9k+38ZewliE7pConBgCVYkPyDriKNFh
 /Me8hue+sBRLOl/Ek6xu1N+4D2A+4qrS5FaGy1qFyaOuTwReLgXZyRfOW74TuIvi+5F8
 PNBAyzP6mPRsczmMbVVlIpiG/B1kgEs61vcZScOaINFrQhZjCmtkiEagJqyTklBX4DHp
 hjBw==
X-Gm-Message-State: AOAM533POkYWycyjy23djXwDmDK+bkBW0h0m1YQglTAs3FpP2/+uUKu0
 TTKMU+cauiPyeYu54hCLozsM0kjG4XA=
X-Google-Smtp-Source: ABdhPJwuur49eLhNUalxwR+Eko1NCU9QKTy2CLumL2wwbck15/Q+sn16bZG8XZFh/vxxNLhmaohC3Q==
X-Received: by 2002:a37:66cd:: with SMTP id a196mr7729953qkc.374.1616532667303; 
 Tue, 23 Mar 2021 13:51:07 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id i93sm55418qtd.48.2021.03.23.13.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Mar 2021 13:51:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_offline()
Date: Tue, 23 Mar 2021 17:50:56 -0300
Message-Id: <20210323205056.52768-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210323205056.52768-1-danielhb413@gmail.com>
References: <20210323205056.52768-1-danielhb413@gmail.com>
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

One of the reasons that dlpar_cpu_offline can fail is when attempting to
offline the last online CPU of the kernel. This can be observed in a
pseries QEMU guest that has hotplugged CPUs. If the user offlines all
other CPUs of the guest, and a hotplugged CPU is now the last online
CPU, trying to reclaim it will fail. See [1] for an example.

The current error message in this situation returns rc with -EBUSY and a
generic explanation, e.g.:

pseries-hotplug-cpu: Failed to offline CPU PowerPC,POWER9, rc: -16

EBUSY can be caused by other conditions, such as cpu_hotplug_disable
being true. Throwing a more specific error message for this case,
instead of just "Failed to offline CPU", makes it clearer that the error
is in fact a known error situation instead of other generic/unknown
cause.

This patch adds a 'last online' check in dlpar_cpu_offline() to catch
the 'last online CPU' offline error, eturning a more informative error
message:

pseries-hotplug-cpu: Unable to remove last online CPU PowerPC,POWER9

[1] https://bugzilla.redhat.com/1911414

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 12cbffd3c2e3..3ac7e904385c 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -271,6 +271,18 @@ static int dlpar_offline_cpu(struct device_node *dn)
 			if (!cpu_online(cpu))
 				break;
 
+			/* device_offline() will return -EBUSY (via cpu_down())
+			 * if there is only one CPU left. Check it here to fail
+			 * earlier and with a more informative error message,
+			 * while also retaining the cpu_add_remove_lock to be sure
+			 * that no CPUs are being online/offlined during this
+			 * check. */
+			if (num_online_cpus() == 1) {
+				pr_warn("Unable to remove last online CPU %pOFn\n", dn);
+				rc = -EBUSY;
+				goto out_unlock;
+			}
+
 			cpu_maps_update_done();
 			rc = device_offline(get_cpu_device(cpu));
 			if (rc)
@@ -283,6 +295,7 @@ static int dlpar_offline_cpu(struct device_node *dn)
 				thread);
 		}
 	}
+out_unlock:
 	cpu_maps_update_done();
 
 out:
-- 
2.30.2

