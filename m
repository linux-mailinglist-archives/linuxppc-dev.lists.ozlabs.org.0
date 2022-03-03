Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 799A54CC8D4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Mar 2022 23:25:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K8ltl42bWz3bsH
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Mar 2022 09:25:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lel/0NQb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::431;
 helo=mail-wr1-x431.google.com; envelope-from=kernel.noureddine@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Lel/0NQb; dkim-atps=neutral
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K8YR90ftDz2yZc
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Mar 2022 01:34:44 +1100 (AEDT)
Received: by mail-wr1-x431.google.com with SMTP id m6so8146702wrr.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 03 Mar 2022 06:34:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxN8h7L2LXnHB8VpVtq2yQnoP4VfiQvLPMhymszGuv4=;
 b=Lel/0NQb4buqvKc+9T/sn4AIpQy82QTeubDPa/IAXmzmeMn6SZBELOCSaycLRNXTHD
 9EmNscSIAej+JsMIpuFm8q0McIYxSxIxq1dWfHZFhHMBXXHXoGA0ApciSWdVR//P+587
 QJEuJsFwTYSjN2ZedMJepqp/KFz5PnAo827XBdTWJi+QTPBQz2ttPXkNzG3hiB6o0rns
 nLnkK/8DdMNQVjT91fcEK3RHdiAH18eNc/GqH8sGl348Zs6lqBV2mH8d+lLOAc4khhL8
 Xt942lE3fo4yEq1lah7IKQAiSxhKTleaE/Wt7UtuLxIF1NZY15ay5Drddl3rQ7WtR9cw
 sZng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=GxN8h7L2LXnHB8VpVtq2yQnoP4VfiQvLPMhymszGuv4=;
 b=oXhqjphPXeZo6e0IqmVLXCqpdkfAcWxM8ZYapyftjmmARtiWNrOaafU9AW022YCmQ8
 VItJxNeUO0KXwQAa1BbQBineJOBss4nGClofJBzBa5DrnhDHnQV5C3EGi+Zt/JcVpwY7
 jzoa6N+LpWGa6VR1PlULiGgroEX+vIIRXB8xOyPABgzJDnDsXAvNQTePfJtyF+wc8Cde
 Ajdq7cwH/P85yzQno3GFKicHdEU5lOGKaCMuyM6M1+86x1+SDKmDWv6fHogHe/cVotTX
 k85Nz953Xr0gK+NJ/1P0Dzk6r//ltXdoxsDPuqKAxxUOKcsRdDhDIquSGoiYKS6Lwf/O
 xugQ==
X-Gm-Message-State: AOAM530dKWyJllYVYDW4DxvKKLy4wgcsqBMNIbUbADHQ6Wn2CQn0K9P+
 9UlhwSMhpxc32XbMINLktsU=
X-Google-Smtp-Source: ABdhPJwycauQBU16hXmq8/RdYtzLbTamgVEta0wBzuUfMQAZDc/8XT6dWw5g2Xq6AzEupFOT02hmjg==
X-Received: by 2002:adf:f94a:0:b0:1ef:9485:e43d with SMTP id
 q10-20020adff94a000000b001ef9485e43dmr17061994wrr.552.1646318081857; 
 Thu, 03 Mar 2022 06:34:41 -0800 (PST)
Received: from localhost.localdomain ([105.66.7.237])
 by smtp.gmail.com with ESMTPSA id
 f8-20020a05600c4e8800b00380ee4a78fdsm3018255wmq.4.2022.03.03.06.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 06:34:41 -0800 (PST)
From: Nour-eddine Taleb <kernel.noureddine@gmail.com>
To: christophe.leroy@csgroup.eu, paulus@ozlabs.org, mpe@ellerman.id.au,
 benh@kernel.crashing.org
Subject: [PATCH] arch:powerpc:kvm: remove unnecessary type castings
Date: Thu,  3 Mar 2022 15:34:16 +0100
Message-Id: <20220303143416.201851-1-kernel.noureddine@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 04 Mar 2022 09:25:18 +1100
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
Cc: Nour-eddine Taleb <kernel.noureddine@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kvm-ppc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

remove unnecessary castings, from "void *" to "struct kvmppc_xics *"

Signed-off-by: Nour-eddine Taleb <kernel.noureddine@gmail.com>
---
 arch/powerpc/kvm/book3s_xics.c        | 2 +-
 arch/powerpc/kvm/book3s_xive.c        | 2 +-
 arch/powerpc/kvm/book3s_xive_native.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_xics.c b/arch/powerpc/kvm/book3s_xics.c
index ebd5d920de8c..ec208d0c8d13 100644
--- a/arch/powerpc/kvm/book3s_xics.c
+++ b/arch/powerpc/kvm/book3s_xics.c
@@ -1440,7 +1440,7 @@ static int kvmppc_xics_create(struct kvm_device *dev, u32 type)
 
 static void kvmppc_xics_init(struct kvm_device *dev)
 {
-	struct kvmppc_xics *xics = (struct kvmppc_xics *)dev->private;
+	struct kvmppc_xics *xics = dev->private;
 
 	xics_debugfs_init(xics);
 }
diff --git a/arch/powerpc/kvm/book3s_xive.c b/arch/powerpc/kvm/book3s_xive.c
index 225008882958..0c1f4819884c 100644
--- a/arch/powerpc/kvm/book3s_xive.c
+++ b/arch/powerpc/kvm/book3s_xive.c
@@ -2368,7 +2368,7 @@ static void xive_debugfs_init(struct kvmppc_xive *xive)
 
 static void kvmppc_xive_init(struct kvm_device *dev)
 {
-	struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
+	struct kvmppc_xive *xive = dev->private;
 
 	/* Register some debug interfaces */
 	xive_debugfs_init(xive);
diff --git a/arch/powerpc/kvm/book3s_xive_native.c b/arch/powerpc/kvm/book3s_xive_native.c
index 99db9ac49901..1405b3f4e94e 100644
--- a/arch/powerpc/kvm/book3s_xive_native.c
+++ b/arch/powerpc/kvm/book3s_xive_native.c
@@ -1276,7 +1276,7 @@ static void xive_native_debugfs_init(struct kvmppc_xive *xive)
 
 static void kvmppc_xive_native_init(struct kvm_device *dev)
 {
-	struct kvmppc_xive *xive = (struct kvmppc_xive *)dev->private;
+	struct kvmppc_xive *xive = dev->private;
 
 	/* Register some debug interfaces */
 	xive_native_debugfs_init(xive);
-- 
2.33.1

