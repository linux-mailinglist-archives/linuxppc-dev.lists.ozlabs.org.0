Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 661A71C0CFF
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 06:03:07 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49CzB044JxzDrMv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 May 2020 14:03:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Ge5AvY7v; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Cynv6pxZzDrHj
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 May 2020 13:45:39 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id y25so1067201pfn.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Apr 2020 20:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fh86nuu96NXb/S0f8GHq7uv4IK3kP+PreTpnEo2bL4g=;
 b=Ge5AvY7v+RC7++zXneOQHNasHrL+d0GvuNx5P01koRD0Y/NMVjXjHNVFiXc1lS2hsH
 FmDbUqjGl6E4lpE+I38FnTLNUzX4iBbpC957O5ADHSaOjSA4CyKZNGGRVWu4ozmaHSB3
 TEP0y75rPU+C0yL6Xd2z9V4YoS7/ss6r9EO7CBw43gp9DHViUjFq0eHL+jXG5ldz+Ixz
 VnPaANgBw4AiLMkHKnBrPQT+1PeBJwLClvu3NW21r4zQgmDxC7n2RD8gty7Vvpc1gkth
 p4mv/6JxwxJpvU7T8IozV/RQrAX7a0DD2esUjdeYja/biW9gwYueKpuZF9jrGJlRSYtM
 dIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fh86nuu96NXb/S0f8GHq7uv4IK3kP+PreTpnEo2bL4g=;
 b=IfDs/cQp0IbIN/Q1fucTPjOkFa5YZYTpZBqh4DiR2tDtdrs4EUlt+azGkgXC7ucVHc
 3u0mh+bn2VIrA8bJgaPJ9Y/fx9a7APKAnRv9NMVDbxZuMRMvJb8P9n1fsCF3+0pPScS4
 bUdXj1Ww0r9rF5f1n7vtzGPnOHm5ws7afudwjBjpFZYKsF5kAJoIJ8WBU/j1Miwy7zoh
 4VpInMovdlHuRAVKNNdvwa1g9AlOXp7kF+Q1fmqs2IK6IiZHGJiTRyBi2vHku+1Zlxwy
 calK8eTaG5cpAz5zH11Ts4m0cR7Z1olXmNWSOiw+v8tD4w1yMoNUuzu5v3lXkk4/E778
 1q/g==
X-Gm-Message-State: AGi0PuZeyxtOWCY1eWT6DbiFGsYZRGd9X+R+2FTj3iuZ14KJ91TIxqJ/
 POejBiMt4yuTKFo3ad/FVK2KwWQEUGehiw==
X-Google-Smtp-Source: APiQypJs511RfSQE3H8bOymxXNHLAP7XBI290viyEtWTmck50pSBUr0HiTAQ2PR8PyMohZHx0yGoSw==
X-Received: by 2002:a63:da10:: with SMTP id c16mr2292389pgh.208.1588304736926; 
 Thu, 30 Apr 2020 20:45:36 -0700 (PDT)
Received: from localhost.localdomain
 (180-150-65-4.b49641.syd.nbn.aussiebb.net. [180.150.65.4])
 by smtp.gmail.com with ESMTPSA id w28sm940082pgc.26.2020.04.30.20.45.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 20:45:36 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 09/28] powerpc: Use a function for byte swapping
 instructions
Date: Fri,  1 May 2020 13:42:01 +1000
Message-Id: <20200501034220.8982-10-jniethe5@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200501034220.8982-1-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
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
Cc: alistair@popple.id.au, npiggin@gmail.com, bala24@linux.ibm.com,
 naveen.n.rao@linux.vnet.ibm.com, Jordan Niethe <jniethe5@gmail.com>,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use a function for byte swapping instructions in preparation of a more
complicated instruction type.

Reviewed-by: Balamuruhan S <bala24@linux.ibm.com>
Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
---
 arch/powerpc/include/asm/inst.h | 5 +++++
 arch/powerpc/kernel/align.c     | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/inst.h b/arch/powerpc/include/asm/inst.h
index 442a95f20de7..23fd57a86b03 100644
--- a/arch/powerpc/include/asm/inst.h
+++ b/arch/powerpc/include/asm/inst.h
@@ -18,4 +18,9 @@ static inline int ppc_inst_primary_opcode(u32 x)
 	return ppc_inst_val(x) >> 26;
 }
 
+static inline u32 ppc_inst_swab(u32 x)
+{
+	return ppc_inst(swab32(ppc_inst_val(x)));
+}
+
 #endif /* _ASM_INST_H */
diff --git a/arch/powerpc/kernel/align.c b/arch/powerpc/kernel/align.c
index 47dbba81a227..a63216da8cf1 100644
--- a/arch/powerpc/kernel/align.c
+++ b/arch/powerpc/kernel/align.c
@@ -310,7 +310,7 @@ int fix_alignment(struct pt_regs *regs)
 		/* We don't handle PPC little-endian any more... */
 		if (cpu_has_feature(CPU_FTR_PPC_LE))
 			return -EIO;
-		instr = swab32(instr);
+		instr = ppc_inst_swab(instr);
 	}
 
 #ifdef CONFIG_SPE
-- 
2.17.1

