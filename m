Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 515B029CC79
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Oct 2020 23:57:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CLRtj5dhNzDqMC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Oct 2020 09:57:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1;
 helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256
 header.s=2020 header.b=wYJh8Tec; 
 dkim=pass header.d=linutronix.de header.i=@linutronix.de
 header.a=ed25519-sha256 header.s=2020e header.b=aMRfL0Ja; 
 dkim-atps=neutral
Received: from galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CLRr844JJzDqM9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Oct 2020 09:55:36 +1100 (AEDT)
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1603839322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+/ecoziKoJodJKTT7o/UwwiCBG7QroeEJmAgktvLhzY=;
 b=wYJh8TecCJUTXhZuSrSp5ylLddMcQOB6uBNJosQiQqu0AWxStl2sXOqoDZFSV4lopKMudj
 9ev6+9/8clVjjHH1qop1zpaReraf2pNwpeOgP6Ubhfnv3Ij+7CUQNqRPLdqwtRS1XFon98
 EFCHR5L8sO0qa9fv7bnt56kNL19WdB/td7ELFaxACijIqUZMTDyC4lRwYo++4+uUH3tJhZ
 lw9n8opRptHRVprVn9vIjuFD0wqAe3hkoBvBgmrrlQAOPt/prP81EM9YfSb8d+UGUaoliz
 PpzElBLfVgBYOhW/Z/iwSkna+VELswNnxRCWPMDr0Bc8ZPqaPW3Kwc4KQTLuPw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1603839322;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+/ecoziKoJodJKTT7o/UwwiCBG7QroeEJmAgktvLhzY=;
 b=aMRfL0JaulAb81YMhS3JkaJjxQnZy5Lb7ytie9xAlSd4X7i+x4QHc1shdAMexXN3aU+Eq2
 iLwAP6V0gwgGNaBA==
To: netdev@vger.kernel.org
Subject: [PATCH net-next 00/15] in_interrupt() cleanup, part 2
Date: Tue, 27 Oct 2020 23:54:39 +0100
Message-Id: <20201027225454.3492351-1-bigeasy@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Aymen Sghaier <aymen.sghaier@nxp.com>,
 Madalin Bucur <madalin.bucur@nxp.com>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Zhu Yanjun <zyjzyj2000@gmail.com>, Samuel Chessman <chessman@tux.org>,
 Ping-Ke Shih <pkshih@realtek.com>, Herbert Xu <herbert@gondor.apana.org.au>,
 =?UTF-8?q?Horia=20Geant=C4=83?= <horia.geanta@nxp.com>,
 linux-rdma@vger.kernel.org, Rain River <rain.1986.08.12@gmail.com>,
 Kalle Valo <kvalo@codeaurora.org>, Ulrich Kunitz <kune@deine-taler.de>,
 Jouni Malinen <j@w1.fi>, Daniel Drake <dsd@gentoo.org>,
 Jakub Kicinski <kuba@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, Leon Romanovsky <leon@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-wireless@vger.kernel.org,
 Li Yang <leoyang.li@nxp.com>, linux-crypto@vger.kernel.org,
 Jon Mason <jdmason@kudzu.us>, Saeed Mahameed <saeedm@nvidia.com>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Folks,

in the discussion about preempt count consistency across kernel configurati=
ons:

  https://lore.kernel.org/r/20200914204209.256266093@linutronix.de/

Linus clearly requested that code in drivers and libraries which changes
behaviour based on execution context should either be split up so that
e.g. task context invocations and BH invocations have different interfaces
or if that's not possible the context information has to be provided by the
caller which knows in which context it is executing.

This includes conditional locking, allocation mode (GFP_*) decisions and
avoidance of code paths which might sleep.

In the long run, usage of 'preemptible, in_*irq etc.' should be banned from
driver code completely.

This is part two addressing remaining drivers except for orinoco-usb.

Sebastian
