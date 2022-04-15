Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB8F502EF4
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Apr 2022 21:09:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Kg5Tt4l7Sz3bd4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Apr 2022 05:09:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kMa8vmzs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1;
 helo=dfw.source.kernel.org; envelope-from=helgaas@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=kMa8vmzs; 
 dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Kg5TF6Hn7z3bVd
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Apr 2022 05:08:33 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60C9A619C9;
 Fri, 15 Apr 2022 19:08:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE88C385A4;
 Fri, 15 Apr 2022 19:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650049709;
 bh=wLptQ9KcXl6+N9MX+ZuwkhOcFMiubmc8uGIxEhPIVsw=;
 h=From:To:Cc:Subject:Date:From;
 b=kMa8vmzsEoLHqqj8o162lzFyicETqjQXbHfr5ImL1Ae9T92XhA7/J/OYE3IcbnXN4
 7ePmsefcNu2rBwzhNnaUtZBSIDPSaoyxmLo8pk+i5VdMOtmG3GkUY0lrEa73lTW/2V
 Ug7UMduqMNaG9m5kk1lDbtepjruMyB//l/sFbAUflo5h2fSiSQOtJtlTGb/ZjBrZDX
 w/IKNd1N+X/c6BltEErY9wMWJZ965YEp++XzySEwiQDwnEYl3OyhGebrjR9Ll6lBhN
 Pw1g6o9wyrUeuiUPT7mgq7WrcLLHXyKlny2f9f7eZFXgVeaocS+n1eFAK11luqBP6s
 uuqYoPhSC5y/g==
From: Bjorn Helgaas <helgaas@kernel.org>
To: Richard Henderson <rth@twiddle.net>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Chas Williams <3chas3@gmail.com>, "David S . Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH 0/7] Remove unused SLOW_DOWN_IO
Date: Fri, 15 Apr 2022 14:08:10 -0500
Message-Id: <20220415190817.842864-1-helgaas@kernel.org>
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
Cc: linux-ia64@vger.kernel.org, linux-sh@vger.kernel.org,
 netdev@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Bjorn Helgaas <bhelgaas@google.com>

Only alpha, ia64, powerpc, and sh define SLOW_DOWN_IO, and there are no
actual uses of it.  The few references to it are in situations that are
themselves unused.  Remove them all.

It should be safe to apply these independently and in any order.  The only
place SLOW_DOWN_IO is used at all is the lmc_var.h definition of DELAY,
which is itself never used.

Bjorn Helgaas (7):
  net: wan: atp: remove unused eeprom_delay()
  net: wan: lmc: remove unused DELAY()
  net: remove comments that mention obsolete __SLOW_DOWN_IO
  sh: remove unused SLOW_DOWN_IO
  powerpc: Remove unused SLOW_DOWN_IO definition
  ia64: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions
  alpha: remove unused __SLOW_DOWN_IO and SLOW_DOWN_IO definitions

 arch/alpha/include/asm/io.h                  |  4 ----
 arch/ia64/include/asm/io.h                   |  4 ----
 arch/powerpc/include/asm/io.h                |  2 --
 arch/sh/include/asm/io.h                     | 17 ++---------------
 drivers/atm/nicstarmac.c                     |  5 -----
 drivers/net/ethernet/dec/tulip/winbond-840.c |  2 --
 drivers/net/ethernet/natsemi/natsemi.c       |  2 --
 drivers/net/ethernet/realtek/atp.h           |  4 ----
 drivers/net/wan/lmc/lmc_main.c               |  8 --------
 drivers/net/wan/lmc/lmc_var.h                |  8 --------
 10 files changed, 2 insertions(+), 54 deletions(-)

-- 
2.25.1

