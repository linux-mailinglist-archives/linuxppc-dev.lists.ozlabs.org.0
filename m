Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5588B7274F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 07:27:36 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tkPc4GTpzDqK1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 15:27:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=nishkadg.linux@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="WGv9BUqp"; 
 dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tB2Y4bKqzDqS2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 18:09:09 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id i8so19007019pgm.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 01:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hCvOR3nb19zpkJHPKREgguJngLbu4r1vMJhi29PVQzI=;
 b=WGv9BUqpMfwzTXVXFcO2czrxzQklaLondrp+6XMGSfFFlkcRy7MjxJCfzSoZpMFA8G
 XQMalWq3JRuiciWayBIF7+PaNOH3VvLEOVXYIjg9WmcHNXA0iaKIMNoD6lo49VyrsNgL
 Lmh3H3/ixkSoU2zSFUjk4VfS8irLbDlpP3SValNI5+sS1MBAecYmpiTfqPo0WwZdHjUA
 ZldUZzyCaCYsdVq12bejOC0Q7KJZhMynV6N9wHjaKuTazQ2icYAq58PlK9n/kI5ooUcO
 tkwtew4eLjbBJ/h+APh60yuHS0/jg2i2roTlobw6U8QFASghE+n0HiK30xhwIY/oWfl2
 mnww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hCvOR3nb19zpkJHPKREgguJngLbu4r1vMJhi29PVQzI=;
 b=p1JrTnefCDRySTFaQmYJXXWUMauEwnrQQHJIDOOm9ZQPsuz8LO1qYIaAG0aIOCbOm+
 4Vw9CwnUUayQiiP0PO94HNtdJhncX/hI/sx2GnDgIlMis/HkFUA2/V2Snd3VnDWI7b1z
 qJgldEa0G40LulEb4/oSkL3CHGZQyGiAkKuaIsCj1TE1Bz7b5hWXU7trv4z1WTiCCQ0x
 jrmUJ4YKWpv7mb9bEiNGr171gdfjRQibl89azgpemtew9oRbIuw/43TXORkVcWg14IKX
 BbpZAfN/rTZVY8alltGoE3/sBfWkwv/KWmtkYQ5bMWwKWsJXvirc1bbO1LHkbToxMuhl
 C8oQ==
X-Gm-Message-State: APjAAAXD0WFkUHAN6uXz37NTkZb0W2CrCJYttzeKp1DzWkWmN5zL3rAD
 iTAcoOOUJAUAAflhQs1rZio=
X-Google-Smtp-Source: APXvYqxEYAuXO/sQuaFQMOeLEf/JsmUtSFxXIArrFjel5fHiRw0u8svDJL8+fPl+kPU/7EL/a++6XQ==
X-Received: by 2002:a17:90a:ac14:: with SMTP id
 o20mr82103517pjq.114.1563869344766; 
 Tue, 23 Jul 2019 01:09:04 -0700 (PDT)
Received: from localhost.localdomain ([122.163.0.39])
 by smtp.gmail.com with ESMTPSA id j12sm32646534pff.4.2019.07.23.01.09.01
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 23 Jul 2019 01:09:04 -0700 (PDT)
From: Nishka Dasgupta <nishkadg.linux@gmail.com>
To: haren@us.ibm.com, herbert@gondor.apana.org.au, davem@davemloft.net,
 benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] crypto: nx: nx-842-powernv: Add of_node_put() before return
Date: Tue, 23 Jul 2019 13:38:51 +0530
Message-Id: <20190723080851.7648-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 24 Jul 2019 15:25:10 +1000
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
Cc: Nishka Dasgupta <nishkadg.linux@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Each iteration of for_each_child_of_node puts the previous node, but
in the case of a return from the middle of the loop, there is no put,
thus causing a memory leak. Add an of_node_put before the return.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/crypto/nx/nx-842-powernv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/crypto/nx/nx-842-powernv.c b/drivers/crypto/nx/nx-842-powernv.c
index e78ff5c65ed6..c037a2403b82 100644
--- a/drivers/crypto/nx/nx-842-powernv.c
+++ b/drivers/crypto/nx/nx-842-powernv.c
@@ -1020,6 +1020,7 @@ static __init int nx842_powernv_init(void)
 		ret = nx842_powernv_probe_vas(dn);
 		if (ret) {
 			nx842_delete_coprocs();
+			of_node_put(dn);
 			return ret;
 		}
 	}
-- 
2.19.1

