Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C6DF44158E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 09:44:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HjRRc6fNZz2ywg
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Nov 2021 19:44:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=LVJdpokN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::72d;
 helo=mail-qk1-x72d.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=LVJdpokN; dkim-atps=neutral
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HjRQv4Q3xz2xRp
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Nov 2021 19:44:05 +1100 (AEDT)
Received: by mail-qk1-x72d.google.com with SMTP id bq14so4362389qkb.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Nov 2021 01:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/X9QXRNDdyclz1/TInEobZseXLFJXvPreNFjueMyvDs=;
 b=LVJdpokNnRoyqlzV500kI7epNfT+ZTRSPnqh2RG08cdynB9em9+fLjbhewLxVncCXa
 ZxThLfsSxKkyGlpAhIBtR7fHzkAZ1XgIsSeBtwRnYKVsWx7A4yu+PKqhwu77EkL7vRHr
 rvrJo9ByPY8jxrvD7KXJlUJB9HAN6ercpVNtS4CljZO1eR7QZG6pfbzWtw39t+OE8nKH
 Ooq7HW5kwSZdfPmOreIM9UWun7+5IAdcxkac2nvoE7iK7GGh+05GoTUNHjc9sgCczbNN
 1XS+gomUNJ2Pfwb9ToBdl7VjJO4hqJpQqoxFG0vYQY5p+n35ZWM8OVryUmYHM/WXdDWF
 DTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=/X9QXRNDdyclz1/TInEobZseXLFJXvPreNFjueMyvDs=;
 b=YjmhKdfEUKQwOcEb2fxBkY+Zy4h68OrvrBcdarKmY9D01gpvQMZcfM9QL6jL8fDu6Z
 ZSiwvoT5dRKfvVC+t0EVTLQn/dflv1bIme7NqObx7SA0a566jbYYNT59Xllo5ipR1/rI
 bjhygSZpfMIu+7krJEibXnq7V3zd/iamDYYfX0E8qc7puLvP4Lbg0u+0BZy8GieZLyg9
 gPmfpKTXBrlCzNi0d7SPkNgzls6Vdl70JvJXFBXmAOCXSZoLr60zUkZtpVaD1Wcx+jAb
 +EtBrzQoEdmWyOCTDAu027mW3JQILA3j+8yn84xQZxW0+1SlTtkB8VclaIVlFZ75KsGQ
 Oa1A==
X-Gm-Message-State: AOAM5332ICJl3eC2E/6Qn2yXzwjB/ey7hObo65KFafkRmtm62l7HL9mf
 BJ1QoqAYbwE4gswHLuZ63W4=
X-Google-Smtp-Source: ABdhPJzfwMH4NpzJkAlxoVClXk6GTAcN/YIOmZFUoKwcRn0alRR1BvRk6kbt41YFQ6BKBnYbYINKKA==
X-Received: by 2002:a37:6104:: with SMTP id v4mr94819qkb.201.1635756241852;
 Mon, 01 Nov 2021 01:44:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id br17sm9758248qkb.10.2021.11.01.01.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 01:44:01 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/xmon: replace DEFINE_SIMPLE_ATTRIBUTE with
 DEFINE_DEBUGFS_ATTRIBUTE
Date: Mon,  1 Nov 2021 08:43:52 +0000
Message-Id: <20211101084352.36641-1-deng.changcheng@zte.com.cn>
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
Cc: pmladek@suse.com, arnd@arndb.de, john.ogness@linutronix.de,
 sxwjean@gmail.com, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Changcheng Deng <deng.changcheng@zte.com.cn>, paulus@samba.org,
 naveen.n.rao@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org, clg@kaod.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Fix the following coccicheck warning:

./arch/powerpc/xmon/xmon.c: 4064: 0-23: WARNING: xmon_dbgfs_ops should
be defined with DEFINE_DEBUGFS_ATTRIBUTE

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 arch/powerpc/xmon/xmon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index dd8241c009e5..875241bd216b 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -4062,7 +4062,7 @@ static int xmon_dbgfs_get(void *data, u64 *val)
 	return 0;
 }
 
-DEFINE_SIMPLE_ATTRIBUTE(xmon_dbgfs_ops, xmon_dbgfs_get,
+DEFINE_DEBUGFS_ATTRIBUTE(xmon_dbgfs_ops, xmon_dbgfs_get,
 			xmon_dbgfs_set, "%llu\n");
 
 static int __init setup_xmon_dbgfs(void)
-- 
2.25.1

