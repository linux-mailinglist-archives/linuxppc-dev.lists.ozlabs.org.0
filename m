Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDEB683345
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Jan 2023 18:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P5rwq4zwfz3fV3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Feb 2023 04:03:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZAbdo6JO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=ZAbdo6JO;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P5rm41Gyjz3cdD
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Feb 2023 03:56:03 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id m11so14794069pji.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Jan 2023 08:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NfzygFx2ypzeNsLPbQ7CYH7PUz0kl+onmnyCFvwRex8=;
        b=ZAbdo6JO83vYybM+fkSkOZ1DVNi4KNRirYIqk+jq9SPqls4ncFwzh3nMH8t9FyVyU3
         wiJu5SKFEN6iUrJGMFoh2fXULx2BbxffHAZO5zNty08FB3wN8xgFHKNZdLOsDTh6jhCN
         KmX4I0A096s6RCcCAeu0EoPGY4mzS2Py1FxpIeV2SUi9bi0EVp3r9VjWKj+1lrZr74Ct
         vkbvZ22QgUkbz3bN1XIH5++buT7JL8PJ2AyjvvIls1EVeUIfgTVnX8PZofwv9kOWqWzH
         52cdPKLAbDmtQvEcUTXIIdK9mYtBmThAvfP4Vm0+qDj/fDN2cn2YuFHqK6mt03feI5wv
         mjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NfzygFx2ypzeNsLPbQ7CYH7PUz0kl+onmnyCFvwRex8=;
        b=himWNXbHu1Hifusjw/Dm13qj67lp+NdPvkoO54hc/iY0uZJL25Q3/1KC3aV4BIhMlJ
         D/PBgDq6IMRznL52NwaKu87b9q31G4Vz6vAPW4vaBPUqMxIDr5crSerPn9gS2PLv4kam
         HUmx3Pheet+h0eDNzYwzi1aWPI7l810eVk1gwxjMtfT6duDRkNJE+UkGbkO0mZsCKpTT
         OZr5NhIExBlLmJqRD9zUV7TEH12IReJVrkBREtdX/VeUsUQhn1snLgPj5NxA61UTm/jy
         y+foU7oenZF04C+q+hcKgRgcSqRUf81fDafAg1QGOp4hztJTtKKypBWVJnCAXffBdKSA
         4PmQ==
X-Gm-Message-State: AFqh2koJQoJnARtzZQFl5aRgsqWVdVnlGaTx71KQG4NSSZ6Jk4gTt8D3
	NU04sz1ckuPjZ3tYgV9jIu9pRE+GTWY=
X-Google-Smtp-Source: AMrXdXu5MqXUl57vUjghnnf1AkqdLZBiJ2TTnGp3rmECNqHIQH1q15f4RSq7zG6lkOaRAbxERg/jqA==
X-Received: by 2002:a17:90a:3cc4:b0:225:d450:2ccc with SMTP id k4-20020a17090a3cc400b00225d4502cccmr56078257pjd.30.1675184161555;
        Tue, 31 Jan 2023 08:56:01 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([203.194.37.234])
        by smtp.gmail.com with ESMTPSA id bk7-20020a17090b080700b00223f495dc28sm9029371pjb.14.2023.01.31.08.55.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:56:00 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 8/8] powerpc: copy_thread don't set ppr in user interrupt frame regs
Date: Wed,  1 Feb 2023 02:55:34 +1000
Message-Id: <20230131165534.601490-9-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230131165534.601490-1-npiggin@gmail.com>
References: <20230131165534.601490-1-npiggin@gmail.com>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

syscalls do not set the PPR field in their interrupt frame and return
from syscall always sets the default PPR for userspace, so setting the
value in the ret_from_fork frame is not necessary and mildly
inconsistent. Remove it.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 arch/powerpc/kernel/process.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
index e67597fd998f..3685a74a9041 100644
--- a/arch/powerpc/kernel/process.c
+++ b/arch/powerpc/kernel/process.c
@@ -1814,11 +1814,6 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 				f = ret_from_fork;
 		}
 
-#ifdef CONFIG_PPC64
-		if (cpu_has_feature(CPU_FTR_HAS_PPR))
-			childregs->ppr = DEFAULT_PPR;
-#endif
-
 		childregs->msr &= ~(MSR_FP|MSR_VEC|MSR_VSX);
 		p->thread.regs = childregs;
 	}
-- 
2.37.2

