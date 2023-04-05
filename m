Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E9A796D738A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 06:54:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Prsjs6JGYz3cDG
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 14:54:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RqoT6vjC;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102b; helo=mail-pj1-x102b.google.com; envelope-from=joel.stan@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=RqoT6vjC;
	dkim-atps=neutral
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Prsj01Tn0z3bNj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Apr 2023 14:53:38 +1000 (AEST)
Received: by mail-pj1-x102b.google.com with SMTP id x15so32783864pjk.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 Apr 2023 21:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680670414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=xWE1BdjjONbSdvZOnpSK61k+ESjWxs05enNGucW95n4=;
        b=RqoT6vjCQR1qdSGF2iuUSsuPO0sWrRE4MWl5gPRef0/dNL92YQB6piemjZSmqDweEd
         bolTZ7aSSG22HOxanbfceXyAqPa2mhVKdqCVptC0AWxFGh3BSnro81mNEjjhI1Q30Yug
         vpEBP1xvK1Yo2ptMZ1qc2szlZATlPkPTVtdHfNXoHEl2pkR6avu2lOgnv0oSZ3LgHB+1
         SYvWhxnyXFNMQ6jLsl+LjFjz/5r03c9pNMi2wLTDZQlh6IoaIUV1dPN7my2Pau9Sveiu
         Qw4CblGveahZPZqk3yVZY3u5z9XzpQDf88/p31kvGI7XgGwbbjwc+TdsAeoR6X8GTRpd
         U3Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680670414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xWE1BdjjONbSdvZOnpSK61k+ESjWxs05enNGucW95n4=;
        b=oDslgQ3LCtmj1hyRWKCPxMQdoQVfDFCQ5w5Vz28z3lKxzFqbleFM/n43SThN9OpSjv
         Rehwrf6+bFKs5j89Izvn5UsM62cTccIGjRCKYKKILopBgkjfFh7k9A4YBXkrWNa1yvVN
         2n6NvhPhsqUTT98mi0ePStZio2VYiOkDBrD/rx1CdoZ3zydeOa2yvqObxnVh95JrKuxL
         7J3yl4dJwE/5PdzqrfTlMvbTviMzJlQVg6zrZSjj7qtXQH4FJ2CNuvp+IVA/8Fnl1vwJ
         FLudWAdT4NFilIdzpB+nFLAo5mi8AzTZMpSdAPUocpcKQQ4hvakahaDXv1eFztUdfdhF
         jM0g==
X-Gm-Message-State: AAQBX9clVmTSfPREKC/x0AldyjnvX2w6S6xunSpJ0OfYTv3XOuxA8m0R
	eQcpaugoEYvKwQBbzUTjxiri+quyMaQ=
X-Google-Smtp-Source: AKy350bO1dDnCaiZ6Qp2vAmME2Tx9T6tsrd8UbiKj6KMjmCx7KOqLE1S8ZzclkApSP7K9VfedkY5zg==
X-Received: by 2002:a17:902:f541:b0:1a2:8940:6dbd with SMTP id h1-20020a170902f54100b001a289406dbdmr6043956plf.45.1680670414116;
        Tue, 04 Apr 2023 21:53:34 -0700 (PDT)
Received: from localhost.localdomain ([45.124.203.18])
        by smtp.gmail.com with ESMTPSA id h4-20020a170902704400b0019a593e45f1sm9122900plt.261.2023.04.04.21.53.32
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 21:53:33 -0700 (PDT)
From: Joel Stanley <joel@jms.id.au>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Remove duplicate SPRN_HSRR definitions
Date: Wed,  5 Apr 2023 14:23:16 +0930
Message-Id: <20230405045316.95003-1-joel@jms.id.au>
X-Mailer: git-send-email 2.39.2
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

There are two copies of these defines. Keep the older ones as they have
associated bit definitions.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
Today I learnt that if you have two copies of the define, but they are
the same value, the compiler won't warn.

 arch/powerpc/include/asm/reg.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index 1e8b2e04e626..0bf4c506a1eb 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -382,8 +382,6 @@
 #define SPRN_HIOR	0x137	/* 970 Hypervisor interrupt offset */
 #define SPRN_RMOR	0x138	/* Real mode offset register */
 #define SPRN_HRMOR	0x139	/* Real mode offset register */
-#define SPRN_HSRR0	0x13A	/* Hypervisor Save/Restore 0 */
-#define SPRN_HSRR1	0x13B	/* Hypervisor Save/Restore 1 */
 #define SPRN_ASDR	0x330	/* Access segment descriptor register */
 #define SPRN_IC		0x350	/* Virtual Instruction Count */
 #define SPRN_VTB	0x351	/* Virtual Time Base */
-- 
2.39.2

