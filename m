Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C69DF53C9D4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 14:18:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LF23b5ZPzz3bwQ
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jun 2022 22:18:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lj+0p3fX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536; helo=mail-pg1-x536.google.com; envelope-from=linmq006@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Lj+0p3fX;
	dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LF2310xKzz307n
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jun 2022 22:18:04 +1000 (AEST)
Received: by mail-pg1-x536.google.com with SMTP id d129so7078843pgc.9
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Jun 2022 05:18:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l0xmT1KYSsFWSUGQw0bMdsHxE24gxAW166il/DMtpOQ=;
        b=Lj+0p3fXY2rF4JNEMIrj2XsKFvMXBJJ7ifsbXSrRrnSWqbwl7lzXtdkA+Ddz1Q/WFZ
         J48VdeLwvRH+1emzi+4wof4yF2kP2v3z0P/hFnhzy98V31yLWBH+5EzI45VTSBH2zf0O
         natUWEpkedu7hsQf2QU//Ek0/mgKjjJNTOb8/5jCgQ2SfFf4yiprV1ms1zgd6lo9sJi5
         5VCa0NiPORYnHtLOUiNBw/A76AoV/vcwTmfguv0nCIP8gwW8o0AGRuRYSSCzAUMu7Qh0
         sC5+7Jn0eHQ6+NOhao0UgWFnxBknSNXOycgHeKyNgOMSAoo+wFIsojrC6B7QebDUWQG4
         DDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=l0xmT1KYSsFWSUGQw0bMdsHxE24gxAW166il/DMtpOQ=;
        b=VZjJbOyPYlLIhbYXeFL2QOfp0XK1k6DzLQUIbBEemOFohvANI0x1u32CKqA6wH0bei
         cbYPHMUxelX51wg3gxukdKrFIBvpimJCAi7lQeAjkyWXqJaRgUeG/Yh8+LuYLXMkZ7GS
         cF8uWkvQdJZXHMWf+ZpXr4gIIR+5xCckzOUrKBSzp+fv8NrwEekNB5R9csnZng5qSJ+M
         952w652/fV8sEy6ocEJTcI4GijPyFAFS1WKYOfjbtAn4oCLubO7p0YH4zLC32BtJvRiP
         7QmBOGp7iqIWz5/LyYqy0omoyz4i669FR68h9aFU77hsPmTZ7HIucv5K6O67enbVb6hC
         Oe9A==
X-Gm-Message-State: AOAM532LeXHaw/UwtGRbVixw6HDZE0H9ao6VpKidZYgL0DNXTocjPU7I
	pXrD07M2ghejDKrMBqWglVY=
X-Google-Smtp-Source: ABdhPJwamKF+KKY2QuxjUXQr7kEVbBv816373+3AZawbSrH0MiN5TSY945N6BoB3zx8KxS1tgnuDtA==
X-Received: by 2002:a05:6a00:8ce:b0:510:9298:ea26 with SMTP id s14-20020a056a0008ce00b005109298ea26mr10088434pfu.55.1654258682051;
        Fri, 03 Jun 2022 05:18:02 -0700 (PDT)
Received: from localhost.localdomain ([202.120.234.246])
        by smtp.googlemail.com with ESMTPSA id w20-20020a627b14000000b0051853e6617fsm5301708pfc.89.2022.06.03.05.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jun 2022 05:18:01 -0700 (PDT)
From: Miaoqian Lin <linmq006@gmail.com>
To: Scott Wood <oss@buserror.net>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Miaoqian Lin <linmq006@gmail.com>,
	Nick Child <nick.child@ibm.com>,
	Nate Case <ncase@xes-inc.com>,
	Kumar Gala <galak@kernel.crashing.org>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] powerpc/85xx: Fix reference leak in xes_mpc85xx_setup_arch
Date: Fri,  3 Jun 2022 16:17:50 +0400
Message-Id: <20220603121752.23548-1-linmq006@gmail.com>
X-Mailer: git-send-email 2.25.1
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

of_find_node_by_path() returns remote device nodepointer with
refcount incremented, we should use of_node_put() on it when done.
Add missing of_node_put() to avoid refcount leak.

Fixes: 3038acf9091f ("powerpc/85xx: Add platform support for X-ES MPC85xx boards")
Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
---
changes in v2:
- update Fixes tag.
v1 Link: https://lore.kernel.org/all/20220603120907.19999-1-linmq006@gmail.com
---
 arch/powerpc/platforms/85xx/xes_mpc85xx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/powerpc/platforms/85xx/xes_mpc85xx.c b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
index 5836e4ecb7a0..93f67b430714 100644
--- a/arch/powerpc/platforms/85xx/xes_mpc85xx.c
+++ b/arch/powerpc/platforms/85xx/xes_mpc85xx.c
@@ -130,6 +130,8 @@ static void __init xes_mpc85xx_setup_arch(void)
 	mpc85xx_smp_init();
 
 	fsl_pci_assign_primary();
+
+	of_node_put(root);
 }
 
 machine_arch_initcall(xes_mpc8572, mpc85xx_common_publish_devices);
-- 
2.25.1

