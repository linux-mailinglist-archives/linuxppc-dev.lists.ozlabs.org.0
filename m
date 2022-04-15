Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C068C502F21
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:10:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5WB4sPPz3cBy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:10:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Uy7wm2db;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org;
 envelope-from=helgaas@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Uy7wm2db; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TL5rWsz3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:38 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75E9CB82E94;
 Fri, 15 Apr 2022 19:08:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7BFFC385A4;
 Fri, 15 Apr 2022 19:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049712;
 bh=nreQfjm+N9qOhwr5Z/uFXcKNU+5eXomO6oZib8laKZg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Uy7wm2dbW0KsrkPVWxh3QI7TRGnVyhSSco7+9aVi5fskwyqNsDWtS+q/SXS0bNcDO
 CYltjjk3xL9ZG6NwBehx/ojBF5VY7YIGy3NLngmpDUfuDXDgriKqzMRePSTVMnGAdD
 R+rqHc1skZ92pOdAFuoa4otdVxaZew8vigWMLMntEk6IdaYxNKGjrYB8+Mfk1d5bD5
 WiKK6lwF3+vqPJl7B0VQDyrm5GpW3KJLj91M175TJmwtb2bQWMafnrh0awZTyXc+yi
 n1+OadUZmi73lelEAcmJo9wdqSiDxF2HbLYakkwcJVG5pomoGx33bln+IKhygSvfk/
 n/ZpSUlcUTW0Q==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 1/7] net: wan: atp: remove unused eeprom_delay()
Date: Fri, 15 Apr 2022 14:08:11 -0500
Message-Id: <20220415190817.842864-2-helgaas@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220415190817.842864-1-helgaas@kernel.org>
References: <20220415190817.842864-1-helgaas@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

atp.h is included only by atp.c, which does not use eeprom_delay().  Remove
the unused definition.

Signed-off-by: Bjorn Helgaas <bhelgaas@google.com>
---
 drivers/net/ethernet/realtek/atp.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/net/ethernet/realtek/atp.h b/drivers/net/ethernet/realtek/atp.h
index 63f0d2d0e87b..b202184eddd4 100644
--- a/drivers/net/ethernet/realtek/atp.h
+++ b/drivers/net/ethernet/realtek/atp.h
@@ -255,10 +255,6 @@ static inline void write_word_mode0(short ioaddr, unsigned short value)
 #define EE_DATA_WRITE	0x01	/* EEPROM chip data in. */
 #define EE_DATA_READ	0x08	/* EEPROM chip data out. */
 
-/* Delay between EEPROM clock transitions. */
-#define eeprom_delay(ticks) \
-do { int _i = 40; while (--_i > 0) { __SLOW_DOWN_IO; } } while (0)
-
 /* The EEPROM commands include the alway-set leading bit. */
 #define EE_WRITE_CMD(offset)	(((5 << 6) + (offset)) << 17)
 #define EE_READ(offset)		(((6 << 6) + (offset)) << 17)
-- 
2.25.1

