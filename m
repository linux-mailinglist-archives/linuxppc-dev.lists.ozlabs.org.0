Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C40F73C3C19
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 14:00:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GN57z3zSFz2ymN
	for <lists+linuxppc-dev@lfdr.de>; Sun, 11 Jul 2021 22:00:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=kUFy5PzJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633;
 helo=mail-pl1-x633.google.com; envelope-from=dwaipayanray1@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=kUFy5PzJ; dkim-atps=neutral
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GN0q74gH1z2yNv
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 18:45:54 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d1so2201306plg.0
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 11 Jul 2021 01:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOD01bDapMoHs0kjtThMN4wey/sA+HYWQBSL1w7djts=;
 b=kUFy5PzJLP5o2Lfv8+0HrQm47CiII/qtVAjxcsbr4dc1u5Id4wFOnB/u0L2V6cjalM
 Ej6/9CZ5AjUHxwXJxIGYFiZ0HjMfkAvNJXzXLbwbM1yFbNF/7hRCUgNhzuGKUEr9nxxB
 CGbeDoNxfVkNF0EN7cK4m3Oj6EfyaWMnjvku6Yg2ABOYWLCA8pZy2CY2piM7WEU7QddU
 mEtSrHX8+jrk8LHtymJ5GbOJCT7aiYnnET+nt6KsK2X5spzWYWHD+WxL39dhuICiofZv
 Wbd3o2TpQEbf4GOHp5Q4VVeRMDNGAhHxSrMvfm+1PyH3sZK23YDQ34h7xhwMYqll9+PY
 DDyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IOD01bDapMoHs0kjtThMN4wey/sA+HYWQBSL1w7djts=;
 b=duhLFfTEpm6CYHNG9yMPWlZFmnVdRpIaM8vogBsjZJRZckirngAvqrVW1NeOvRPGb2
 inzsR8GL5Q0n4EC2agAH56mjatQgl0Yv5dAgEYKX6bS+g+64bzlJ6AjkjVFtUfYMX9Qy
 6SmQ8IjXjapHL+USLJ8TkCAbSu0neabYVKknrYg/57CD6W+2vFsen5B6TOOIVEEAiPdj
 QvxKOHAA1RJ6nq/CvAEfu8oyc3mCpFW+XAN2ACn2cdqgS3aEmM8kgMAomaQsz6IKLEeS
 wKxALt9QktlR5aLsYpkZltxDo7lod2h83ZZZAp/1BaJ4ypQAWvhvbHqQnFkFHFpPqnKu
 waZQ==
X-Gm-Message-State: AOAM530dYSKZJxmsH82Y3FNymXj8SKzVDdqkCsGGMcnziCnhkHXJHHAR
 KEkCMWOzcXmXxAnZ9JMnqkA=
X-Google-Smtp-Source: ABdhPJyCAuNiPmfuGbeOtJsa7jM2AN9jr+M1bzmq0RMzzPmmvJspQGy1EyQySlSXk+rmjYtxxNnkng==
X-Received: by 2002:a17:903:244f:b029:12a:f0f9:19a3 with SMTP id
 l15-20020a170903244fb029012af0f919a3mr5365973pls.42.1625993150306; 
 Sun, 11 Jul 2021 01:45:50 -0700 (PDT)
Received: from localhost.localdomain ([49.37.51.242])
 by smtp.gmail.com with ESMTPSA id k9sm11663601pfu.100.2021.07.11.01.45.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 01:45:49 -0700 (PDT)
From: Dwaipayan Ray <dwaipayanray1@gmail.com>
To: mpe@ellerman.id.au,
	benh@kernel.crashing.org,
	paulus@samba.org
Subject: [PATCH] arch:powerpc:mm: cleanup __FUNCTION__ usage
Date: Sun, 11 Jul 2021 14:15:36 +0530
Message-Id: <20210711084536.95394-1-dwaipayanray1@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 11 Jul 2021 22:00:25 +1000
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
Cc: lukas.bulwahn@gmail.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Dwaipayan Ray <dwaipayanray1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

__FUNCTION__ exists only for backwards compatibility reasons
with old gcc versions. Replace it with __func__.

Signed-off-by: Dwaipayan Ray <dwaipayanray1@gmail.com>
---
 arch/powerpc/mm/numa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/mm/numa.c b/arch/powerpc/mm/numa.c
index f2bf98bdcea2..3d3f570c925c 100644
--- a/arch/powerpc/mm/numa.c
+++ b/arch/powerpc/mm/numa.c
@@ -1236,7 +1236,7 @@ int find_and_online_cpu_nid(int cpu)
 #endif
 	}
 
-	pr_debug("%s:%d cpu %d nid %d\n", __FUNCTION__, __LINE__,
+	pr_debug("%s:%d cpu %d nid %d\n", __func__, __LINE__,
 		cpu, new_nid);
 	return new_nid;
 }
-- 
2.28.0

