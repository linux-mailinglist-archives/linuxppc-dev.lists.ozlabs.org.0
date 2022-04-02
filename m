Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B634EFDCA
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 03:35:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KVfkD73TZz30Hf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 Apr 2022 12:35:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Fa13p9Gd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::f2d;
 helo=mail-qv1-xf2d.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=Fa13p9Gd; dkim-atps=neutral
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KVfjZ6ygPz2xt7
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 Apr 2022 12:34:57 +1100 (AEDT)
Received: by mail-qv1-xf2d.google.com with SMTP id kd21so3340064qvb.6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 01 Apr 2022 18:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VP9DZjk6ZczTz6Snvbre433wZ+Z/QMRd5nCRz0IXdXs=;
 b=Fa13p9GdwFU7opfjdPo5hVT2m/Oi0qEPLOLVA8J2h8VJD0ZYyOTrzv9oV4wWWUJvZi
 J7SVkUanyaefso8uRwdkUSi3rhSn5iXHhBK8YzeGv1ChVCCdHGuPDNbKBey6w4j6VR/z
 jG8YzY8YgCdJ4vE0HqNvrJB4o1kR/jJGsBztyyVjnNSFplV6FdbIbzlFkpglB920KhbZ
 2ey6o//f/Aj6q5bdYqa35n0IGWgCWJ61PgUijFclfMLez1yZkbHSgiiG2kpNYu28VSSH
 iBIEerppBSbHq0BZ7dtgTv/gBR4j+T/jCgX3eOQlbvCRlqVKmlNjgSi+ItC4kh/z4uTT
 /EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VP9DZjk6ZczTz6Snvbre433wZ+Z/QMRd5nCRz0IXdXs=;
 b=oV8hlc+ZvSBPtgyPJr7q4DMRpTnjxc4krf3Lc4/YaoFCfKL58qBtbNRIvNvuFkByaP
 HNVA1WZnFdbz9yJMe28ArwFM6zp/GeLuap+WQiMRsWW4TPduF0pvBklcwvqFg7qFkGoZ
 MJ9fAmc0IC6asddrulI0hL24RDt1vjto3UwVNIMwt+S0jN0GuuovJGrfmft21mfpIh5N
 ld2bPPkNXStAVaqlDCGWU5KFTIwLUbMHp03twpv50+xWnw5rv11Pvp2tNvZffsmP+xL+
 2E28GFvx8UO7sVHcvIRZ8TXJNxN6euY8HL2/rA/vy4D+Uu85l7X15otyiv2WrqvYNhID
 yxuA==
X-Gm-Message-State: AOAM532uzTfwO2yb+EbRnzewHpNlPoZVsRKbFZnrAr6gfuLZeh1P0+FF
 ootvFFnRbDz3kyH1U1Wp5gc=
X-Google-Smtp-Source: ABdhPJyqslw2b/47GfaBsU/fgUlm0J5pzcv80e22GxP6cCUtZ6UqVEPfqFaOwA07H4FlJQtQ2RJ9nQ==
X-Received: by 2002:a05:6214:cad:b0:441:4269:37ff with SMTP id
 s13-20020a0562140cad00b00441426937ffmr42562979qvs.128.1648863292699; 
 Fri, 01 Apr 2022 18:34:52 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id
 v12-20020a05622a130c00b002e1b3ccd9adsm2922207qtk.79.2022.04.01.18.34.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 18:34:52 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/sysdev: fix refcount leak in icp_opal_init()
Date: Sat,  2 Apr 2022 01:34:19 +0000
Message-Id: <20220402013419.2410298-1-lv.ruyi@zte.com.cn>
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
Cc: nick.child@ibm.com, lv.ruyi@zte.com.cn, linux-kernel@vger.kernel.org,
 paulus@samba.org, maz@kernel.org, linuxppc-dev@lists.ozlabs.org,
 Zeal Robot <zealci@zte.com.cn>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lv Ruyi <lv.ruyi@zte.com.cn>

The of_find_compatible_node() function returns a node pointer with
refcount incremented, use of_node_put() on it when done.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 arch/powerpc/sysdev/xics/icp-opal.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/powerpc/sysdev/xics/icp-opal.c b/arch/powerpc/sysdev/xics/icp-opal.c
index bda4c32582d9..4dae624b9f2f 100644
--- a/arch/powerpc/sysdev/xics/icp-opal.c
+++ b/arch/powerpc/sysdev/xics/icp-opal.c
@@ -196,6 +196,7 @@ int __init icp_opal_init(void)
 
 	printk("XICS: Using OPAL ICP fallbacks\n");
 
+	of_node_put(np);
 	return 0;
 }
 
-- 
2.25.1

