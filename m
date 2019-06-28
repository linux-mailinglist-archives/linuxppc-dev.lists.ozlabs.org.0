Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE43591C6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 04:58:44 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ZhKs3KwVzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Jun 2019 12:58:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::643; helo=mail-pl1-x643.google.com;
 envelope-from=huangfq.daxian@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="IhxJ2cyQ"; 
 dkim-atps=neutral
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Zh963mYdzDqQd
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Jun 2019 12:51:06 +1000 (AEST)
Received: by mail-pl1-x643.google.com with SMTP id bi6so2349282plb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2019 19:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=FR72I8Co0+MJGxYGED+5/dqb9dBV7h2vnmoy22KZs5Q=;
 b=IhxJ2cyQo1/nvunCFvFfS0lEbh/0091c04NKKkhNShMj9sWqyfADIGoFXQl05TpjYZ
 7j9A1FXpIIEdEwYze1FTKINBI27EiSaozaS7oQ9bNK1BFztQRxa22TtkmWEFmUKAQ+ZB
 Nzy0w3v1kP9zev1mkPZoA9lp3fLcgU4t6y3NmEjraSL8V+oHQ6LknVwFeNHupu+NLP73
 Q8YBHbhPZtOVyBiwviEQHq0703WzQ6nsqSlyYrcGslLgXO3uwcIsdDebNOqrEuhe0uPS
 29oPRFdsznFFLxhrSOb7M5UCeR5+K1sx5WNlxrRdHaRg5YW1mkMs3kIi/offf8HJ0AZ8
 ngdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=FR72I8Co0+MJGxYGED+5/dqb9dBV7h2vnmoy22KZs5Q=;
 b=RHMijB0eAtMFsgzu9tWxBJsgslWlixandB9zOmjFa7BER6APLohz0aK3kSiov8X3OM
 w3+Or+mZCnlPpdOC7D0A/FJBF9rLQYBODOb/lPhGvgkdaYAqovY5aHhErMsHwZrsKvu/
 codoZ847fRqp64w4UeD+0K++wchVXZUBWFhn8+9KWT4pesLo/kHMXtl2SmKPM4OXQg8d
 JOQJqi4fdxSj39M4azPDQ0CuKxzOiX4haX25TSQp8K17xwP/nMovIRav3k5FatqDSzih
 EZ9QkdDr4FsKGaJZeaQ1oOqucXkOqWQYFZGJTHG5XV48CONGYIp6Rb+Qhr4qsn79jAsC
 1yTQ==
X-Gm-Message-State: APjAAAWjHDV9wcZsnqOPtNQUUo35ox071Ios0PGor3wdldyiaS+3SZkq
 z3VoVvtJ2ZEaepnySzmV7As=
X-Google-Smtp-Source: APXvYqzL32mC6au/7C3TzD/kwMbOVnb1DJlzl+HtOU7wDCsXVoSrKw2C4o6YPmea15yYB/y61C1tKg==
X-Received: by 2002:a17:902:868f:: with SMTP id
 g15mr8558096plo.67.1561690262921; 
 Thu, 27 Jun 2019 19:51:02 -0700 (PDT)
Received: from hfq-skylake.ipads-lab.se.sjtu.edu.cn ([202.120.40.82])
 by smtp.googlemail.com with ESMTPSA id b1sm457294pfi.91.2019.06.27.19.50.59
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 27 Jun 2019 19:51:02 -0700 (PDT)
From: Fuqian Huang <huangfq.daxian@gmail.com>
To: 
Subject: [PATCH v2 27/27] sound: ppc: remove unneeded memset after
 dma_alloc_coherent
Date: Fri, 28 Jun 2019 10:50:54 +0800
Message-Id: <20190628025055.16242-1-huangfq.daxian@gmail.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Rob Herring <robh@kernel.org>, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Richard Fontana <rfontana@redhat.com>, Paul Mackerras <paulus@samba.org>,
 Fuqian Huang <huangfq.daxian@gmail.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In commit af7ddd8a627c
("Merge tag 'dma-mapping-4.21' of git://git.infradead.org/users/hch/dma-mapping"),
dma_alloc_coherent has already zeroed the memory.
So memset is not needed.

Signed-off-by: Fuqian Huang <huangfq.daxian@gmail.com>
---
 sound/ppc/pmac.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/ppc/pmac.c b/sound/ppc/pmac.c
index 1b11e53f6a62..1ab12f4f8631 100644
--- a/sound/ppc/pmac.c
+++ b/sound/ppc/pmac.c
@@ -56,7 +56,6 @@ static int snd_pmac_dbdma_alloc(struct snd_pmac *chip, struct pmac_dbdma *rec, i
 	if (rec->space == NULL)
 		return -ENOMEM;
 	rec->size = size;
-	memset(rec->space, 0, rsize);
 	rec->cmds = (void __iomem *)DBDMA_ALIGN(rec->space);
 	rec->addr = rec->dma_base + (unsigned long)((char *)rec->cmds - (char *)rec->space);
 
-- 
2.11.0

