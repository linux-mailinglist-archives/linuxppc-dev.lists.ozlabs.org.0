Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C5132F178
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 18:39:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DsZjp3T1gz3dNj
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Mar 2021 04:39:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=PTASdIV3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72e;
 helo=mail-qk1-x72e.google.com; envelope-from=danielhb413@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=PTASdIV3; dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DsZjP5qN5z3dCp
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Mar 2021 04:39:04 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id 130so2727357qkh.11
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Mar 2021 09:39:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wc5ZmhWUyz/XUSCqoDCX+rbrmL53g5ewWx/K3NSgkdQ=;
 b=PTASdIV3EQ2Qi8JASd5c+o1d++Wd/H6y3oooZIxhnkOo3HChFnpeg3DF2GEvG59bLF
 356YlE7DFaQhXP8hDfEKlYu9PGLSzX2p2KALWRknNr3V5NJZFJEImlOmhF9gnJ4lhc1U
 P34WPkN9/BT1WchCLSIMz2U/q6Zdg/L76f5QDOXNEqgChRSCWJV7lNN9TJGNi3pTGbTn
 KjYxRGmcuKQ2zYsovfE8dDVll0IQTb1oD83e8ZgkCFaahh4CbE9V4wAG9LVENL807ZQi
 pisb68HzzQ4JtjQBDbzasyIepWygI4i5U/dkWOF1g7R4vSA3ANfyVuHR7Yf7KSnmsnhz
 KpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wc5ZmhWUyz/XUSCqoDCX+rbrmL53g5ewWx/K3NSgkdQ=;
 b=Gm+9/XpXTmXMVOEWA1LmhwJiZXzHt6WjnGITfuFgXEsuYGf1z8r2n97938+rzrx6tL
 sb64PUJkE32S6kNT8WOIsYM2CFRH6bxnqhY6TW5RWfRyrlEpNe0ltSt2fIYsB+JFFrJZ
 cdlckZPvbJUsu9vWePzIEdveEeOHwCZW95yJOiS07ALaqWVTG8gvqqKi2jJHHk0qVvja
 7RUGIqANpM6n+r5TMTTrgTCxdApaJCbaT39uCPKpFafW5xa/uyZAldRO5wYQeae7QlNZ
 7ISkolhFgH7iRkAwZu7WODibNU9ixNzh7GDneOSKi4zHFhD21FEYzWLks0e/QdHXlihu
 Mb4w==
X-Gm-Message-State: AOAM533dKMLXurMcbxVo/4DGV4AB1zetkHJlGomkLks5xNvpFOu4sSXr
 fj2Z4xr723URRlTVkqAQ2Goy0WYvwMU=
X-Google-Smtp-Source: ABdhPJxCZKtNSM5Kk+L9qRw7RIJuVZZLKGSkgPxwSg99jtwnkAB5ghUD2aDh/03dEV2Ng0sAEy45YQ==
X-Received: by 2002:a05:620a:16ad:: with SMTP id
 s13mr10228252qkj.68.1614965939808; 
 Fri, 05 Mar 2021 09:38:59 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:1670:7849:4614:f4b6:4112])
 by smtp.gmail.com with ESMTPSA id a2sm1574009qtj.76.2021.03.05.09.38.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 09:38:59 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/1] hotplug-cpu.c: show 'last online CPU' error in
 dlpar_cpu_remove()
Date: Fri,  5 Mar 2021 14:38:45 -0300
Message-Id: <20210305173845.451158-1-danielhb413@gmail.com>
X-Mailer: git-send-email 2.29.2
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

Of all the reasons that dlpar_cpu_remove() can fail, the 'last online
CPU' is one that can be caused directly by the user offlining CPUs
in a partition/virtual machine that has hotplugged CPUs. Trying to
reclaim a hotplugged CPU can fail if the CPU is now the last online in
the system. This is easily reproduced using QEMU [1].

Throwing a more specific error message for this case, instead of just
"Failed to offline CPU", makes it clearer that the error is in fact a
known error situation instead of other generic/unknown cause.

[1] https://bugzilla.redhat.com/1911414

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 arch/powerpc/platforms/pseries/hotplug-cpu.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/hotplug-cpu.c b/arch/powerpc/platforms/pseries/hotplug-cpu.c
index 12cbffd3c2e3..134f393f09e1 100644
--- a/arch/powerpc/platforms/pseries/hotplug-cpu.c
+++ b/arch/powerpc/platforms/pseries/hotplug-cpu.c
@@ -514,7 +514,17 @@ static ssize_t dlpar_cpu_remove(struct device_node *dn, u32 drc_index)
 
 	rc = dlpar_offline_cpu(dn);
 	if (rc) {
-		pr_warn("Failed to offline CPU %pOFn, rc: %d\n", dn, rc);
+		/* dlpar_offline_cpu will return -EBUSY from cpu_down() (via
+		 * device_offline()) in 2 cases: cpu_hotplug_disable is true or
+		 * there is only one CPU left. Warn the user about the second
+		 * since this can happen with user offlining CPUs and then
+		 * attempting hotunplugs.
+		 */
+		if (rc == -EBUSY && num_online_cpus() == 1)
+			pr_warn("Unable to remove last online CPU %pOFn\n", dn);
+		else
+			pr_warn("Failed to offline CPU %pOFn, rc: %d\n", dn, rc);
+
 		return -EINVAL;
 	}
 
-- 
2.29.2

