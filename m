Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 767F570B7A3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 10:30:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QPrH70SG8z3f6Q
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 May 2023 18:30:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZU2Luicl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::240; helo=mslow1.mail.gandi.net; envelope-from=herve.codina@bootlin.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=ZU2Luicl;
	dkim-atps=neutral
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [IPv6:2001:4b98:dc4:8::240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QPrFH1Nxrz3cBK
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 18:28:34 +1000 (AEST)
Received: from relay7-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::227])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id DF6A0C0B31
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 May 2023 08:21:17 +0000 (UTC)
Received: (Authenticated sender: herve.codina@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPA id 992D120011;
	Mon, 22 May 2023 08:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1684743663;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ka1Fl6OswEMhixEbbi0TzCh7AW+Ii5FCal5DmvLTqf0=;
	b=ZU2Luicl+fq4CWB6b6hl6ciqLNk6pTs/nZ8rxMxAmEw2HL6m9VAR54gwKKTMoqd5TrfpIh
	Hvs8HzalYqJVpl10Y0QTmTMnuXmntSm58H7x3m4QWJJ6XF7XqrMAdQqdJOqp3Wa4TVnMyI
	OSB/8fXPwhDRb6H6SwVdVt2u4sfhpN3TsRKhGFGJM8fOp0iRvtpm+2KRMAOwoZc4ea32Uo
	rIWh1NvuOANtys1leoaXB4lUAVmnoXJH1iaVCeW41+5JGIrmwW4ZUiGUFFSf0J8L3SRF9n
	q4a5vzRljWR+bMlaliCwjhlKyaSdByfx6yIj3mAkaxGch59Zb/RlEjdiw0GauA==
From: Herve Codina <herve.codina@bootlin.com>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Li Yang <leoyang.li@nxp.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Subject: [PATCH 0/2] Fix COMPILE_TEST dependencies for CPM uart, TSA and QMC
Date: Mon, 22 May 2023 10:20:46 +0200
Message-Id: <20230522082048.21216-1-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes issues raised by the kernel test robot
  https://lore.kernel.org/oe-kbuild-all/202305160221.9XgweObz-lkp@intel.com/

In COMPILE_TEST configurations, TSA and QMC need CONFIG_CPM to be set in
order to compile and CPM uart needs CONFIG_CPM2.

Best regards,
Hervé

Herve Codina (2):
  soc: fsl: cpm1: Fix TSA and QMC dependencies in case of COMPILE_TEST
  serial: cpm_uart: Fix a COMPILE_TEST dependency

 drivers/soc/fsl/qe/Kconfig | 4 ++--
 drivers/tty/serial/Kconfig | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.40.1

