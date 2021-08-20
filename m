Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2623F24F7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 04:50:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GrR2102Dmz3cWM
	for <lists+linuxppc-dev@lfdr.de>; Fri, 20 Aug 2021 12:50:01 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=ZyOVOXdd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::82b;
 helo=mail-qt1-x82b.google.com; envelope-from=cgel.zte@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ZyOVOXdd; dkim-atps=neutral
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com
 [IPv6:2607:f8b0:4864:20::82b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GrR1J2TGLz3035
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Aug 2021 12:49:23 +1000 (AEST)
Received: by mail-qt1-x82b.google.com with SMTP id y9so6386504qtv.7
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Aug 2021 19:49:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LavvvFG+/VWmsfKchesDD9nAqBZFVJWxsg7nQ7rHqRM=;
 b=ZyOVOXddVzS20gMkSzEofQ+rakCMaCmpjv3y1E2c/rjfVyBBDfLFFvvhNAUx6clEh2
 8eUvn3CpIgc5de/kt5srn5ndVr+21VoMGhl2KLnV2uGyFTPICxWbL01yjJ4n5Azyol9j
 uSAvYaEZv0aK+w0VTIavWPlImW11ivpcI/A65/aamjudKnp3FJavC6VPMNv8BD2XHfsS
 w5rBsdOC8ziKyzTtr3Mik8f7W5GFmbAH6sPNoQob/flpc8+azELGygdPM7gt9PcA6+HL
 +r+7rk4fo6ghtbe0js/f4ZbgUizWTCckaIQivLJfmENei94/mN0ZHXtwouXYdk4hG2Ss
 7E4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LavvvFG+/VWmsfKchesDD9nAqBZFVJWxsg7nQ7rHqRM=;
 b=ueoLvyI6S6xDDVwINFU9rUcjtK0N0S8D154zSK3N5vk2URpzTCpAglcfGx0JDi1s5k
 4NgUgL328lTXzk0Rvz0sDHcf+yKplYvZ+ZDBOrZDzgTxiBwB8sSsuXxhlCHhT34jT100
 Bvk5nH+UqprfBwDQndvB914utSdNgp1Z74dQybpqwU9lYn4A3WYkp5te8Pg/NVvRw4Gy
 MwCPwsDcfuaa5qsqhKrj0lMT9iLtoJZyW9YEEC6XCvP5PdjSBXEKY1K7QuVSnG2RRaMz
 lLfTSIZwUzj4W9pTH1em/vX/SaseMtsOAuBjmsGBWt4L3p/7cTQuWR2D0Me0C5VZb8Rh
 dWyA==
X-Gm-Message-State: AOAM530HRacjd09qbPZqMImXcjpMugmLEwClO0KVY3VOgcLPNr8ADReV
 Gci8aqAASzdDzS/kZD7CnKQ=
X-Google-Smtp-Source: ABdhPJzzzprAAUL+AN13Sa5wgzLdwdedt+qOOHoPCRfYFoAiJJJ0SfKXNdDpTO9EG+HI2HuAefm2/A==
X-Received: by 2002:ac8:53d6:: with SMTP id c22mr8870860qtq.38.1629427760206; 
 Thu, 19 Aug 2021 19:49:20 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
 by smtp.gmail.com with ESMTPSA id 75sm2505262qko.100.2021.08.19.19.49.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Aug 2021 19:49:19 -0700 (PDT)
From: jing yangyang <cgel.zte@gmail.com>
X-Google-Original-From: jing yangyang <jing.yangyang@zte.com.cn>
To: Geoff Levand <geoff@infradead.org>
Subject: [PATCH linux-next] ps3: remove unneeded semicolon
Date: Thu, 19 Aug 2021 19:49:01 -0700
Message-Id: <01647102607ce9640c9f27786d976109a3c4ea7e.1629197153.git.jing.yangyang@zte.com.cn>
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
Cc: jing yangyang <jing.yangyang@zte.com.cn>, Zeal Robot <zealci@zte.com.cn>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Eliminate the following coccicheck warning:

./arch/powerpc/platforms/ps3/system-bus.c:606:2-3: Unneeded semicolon
./arch/powerpc/platforms/ps3/system-bus.c:765:2-3: Unneeded semicolon

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: jing yangyang <jing.yangyang@zte.com.cn>
---
 arch/powerpc/platforms/ps3/system-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index c8b50fe..b637bf2 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -603,7 +603,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
 	default:
 		/* not happned */
 		BUG();
-	};
+	}
 	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
 			     &bus_addr, iopte_flag);
 
@@ -762,7 +762,7 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
 		break;
 	default:
 		BUG();
-	};
+	}
 
 	dev->core.of_node = NULL;
 	set_dev_node(&dev->core, 0);
-- 
1.8.3.1


