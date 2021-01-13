Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D1A2F5044
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 17:45:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGCws4J5pzDrWY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 03:45:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::433;
 helo=mail-wr1-x433.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=mgWrFTRd; dkim-atps=neutral
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DGCrg2vXrzDrVT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 03:41:32 +1100 (AEDT)
Received: by mail-wr1-x433.google.com with SMTP id c5so2816474wrp.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 08:41:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VH2FQtV9QAPgHDpG8J2TH6UYciFbrGSHFdOWafzf8L0=;
 b=mgWrFTRdLTo53CvivpWWpGvsnBy/sDUJBspvULY4feH6SbFZS7E8cSPYam9a5jpklb
 kqxz5+5Hc26gNe3UcOqgusUkt7Ziejsa7lie23otmOkvPtir46B1POMr13XSd0a8IEW7
 tFqivez7ig+l/Yu5jKTarybJkbTcy3RgaqCPmtjRg2u0TqPP5qmgVy1b3ErpV0pBVHmI
 5TtapSlZlEosS6jB5aYIPr45RihABmY9w53n2+ZOI6kXcfhjxDFk0/jx0MSjQWIaWGxJ
 kfUHXACCiKmAWR/WOIPTsUaSGUcx1Tvs4u5jbxrAqqHl3wPj/+iimviABCXYtr63aizN
 y4tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VH2FQtV9QAPgHDpG8J2TH6UYciFbrGSHFdOWafzf8L0=;
 b=MIl/IUWvmnjOXcqT2gGoq40JMjelTNJHEY+CrJbI9j3Dlc+DGPuM1na/ZM0gS7zxEH
 bYk1X+lVgHLx+KbhCsvCSosj9QnW6g9h52DhBqAFmT6vKb1pC/4AiFWp3Hh7FP8ufAtk
 1UgbJLj+J/OIkPuyws+P5PkASJcc/JiRz5Qh9x1Q3PXzReqRnx/a3MR1e+7I+PRIaWc9
 fsKsDf1boRzlF6S52uHRQO/HRc+Ne4Zn8RxnLxArzj8Xv41lWFMyQx5lsuICzC0K4MsO
 PIDDROAIeC7g9NtuhDKJe21MlTiraCDgDLjD8+5kQfMv+BxwI5ml6yJ3Nq2uDi99m0BP
 X6zA==
X-Gm-Message-State: AOAM533gfKSUdulLzF8s2LlZPcGlhoHAzO3+38Ru5WawC4dvKkynpOhG
 reBehH837g8AO5J4JRejaNkyjw==
X-Google-Smtp-Source: ABdhPJxhdh6nQ0ZeDfEEeSe5MD+NUFjp0Ab5CLvQ9W4maua5nayIueG0xrQYYgqoBCc5WqlU293mGw==
X-Received: by 2002:adf:82c8:: with SMTP id 66mr3473402wrc.420.1610556087746; 
 Wed, 13 Jan 2021 08:41:27 -0800 (PST)
Received: from dell.default ([91.110.221.229])
 by smtp.gmail.com with ESMTPSA id t16sm3836510wmi.3.2021.01.13.08.41.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Jan 2021 08:41:26 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [PATCH v2 0/7] Rid W=1 warnings in Ethernet 
Date: Wed, 13 Jan 2021 16:41:16 +0000
Message-Id: <20210113164123.1334116-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
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
Cc: Paul Durrant <paul@xen.org>, Kurt Kanzenbach <kurt@linutronix.de>,
 Alexei Starovoitov <ast@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, Peter Cammaert <pc@denkart.be>,
 Paul Mackerras <paulus@samba.org>, Sukadev Bhattiprolu <sukadev@linux.ibm.com>,
 Wei Liu <wei.liu@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 John Fastabend <john.fastabend@gmail.com>,
 Santiago Leon <santi_leon@yahoo.com>, Jakub Kicinski <kuba@kernel.org>,
 Grygorii Strashko <grygorii.strashko@ti.com>,
 Thomas Falcon <tlfalcon@linux.vnet.ibm.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Jens Osterkamp <Jens.Osterkamp@de.ibm.com>,
 Rusty Russell <rusty@rustcorp.com.au>, Daris A Nevil <dnevil@snmc.com>,
 Lijun Pan <ljp@linux.ibm.com>, xen-devel@lists.xenproject.org,
 Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>, Nicolas Pitre <nico@fluxnic.net>,
 Geoff Levand <geoff@infradead.org>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Erik Stahlman <erik@vt.edu>,
 John Allen <jallen@linux.vnet.ibm.com>, Utz Bacher <utz.bacher@de.ibm.com>,
 Dany Madden <drt@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Russell King <rmk@arm.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Resending the stragglers again.                                                                                  

This set is part of a larger effort attempting to clean-up W=1                                                   
kernel builds, which are currently overwhelmingly riddled with                                                   
niggly little warnings.                                                                                          
                                                                                                                 
v2:                                                                                                              
 - Squashed IBM patches                                                                                      
 - Fixed real issue in SMSC
 - Added Andrew's Reviewed-by tags on remainder

Lee Jones (7):
  net: ethernet: smsc: smc91x: Fix function name in kernel-doc header
  net: xen-netback: xenbus: Demote nonconformant kernel-doc headers
  net: ethernet: ti: am65-cpsw-qos: Demote non-conformant function
    header
  net: ethernet: ti: am65-cpts: Document am65_cpts_rx_enable()'s 'en'
    parameter
  net: ethernet: ibm: ibmvnic: Fix some kernel-doc misdemeanours
  net: ethernet: toshiba: ps3_gelic_net: Fix some kernel-doc
    misdemeanours
  net: ethernet: toshiba: spider_net: Document a whole bunch of function
    parameters

 drivers/net/ethernet/ibm/ibmvnic.c           | 27 ++++++++++----------
 drivers/net/ethernet/smsc/smc91x.c           |  2 +-
 drivers/net/ethernet/ti/am65-cpsw-qos.c      |  2 +-
 drivers/net/ethernet/ti/am65-cpts.c          |  2 +-
 drivers/net/ethernet/toshiba/ps3_gelic_net.c |  8 +++---
 drivers/net/ethernet/toshiba/spider_net.c    | 18 ++++++++-----
 drivers/net/xen-netback/xenbus.c             |  4 +--
 drivers/net/xen-netfront.c                   |  6 ++---
 8 files changed, 37 insertions(+), 32 deletions(-)

Cc: Alexei Starovoitov <ast@kernel.org>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: bpf@vger.kernel.org
Cc: Daniel Borkmann <daniel@iogearbox.net>
Cc: Dany Madden <drt@linux.ibm.com>
Cc: Daris A Nevil <dnevil@snmc.com>
Cc: "David S. Miller" <davem@davemloft.net>
Cc: Erik Stahlman <erik@vt.edu>
Cc: Geoff Levand <geoff@infradead.org>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Ishizaki Kou <kou.ishizaki@toshiba.co.jp>
Cc: Ivan Khoronzhuk <ivan.khoronzhuk@linaro.org>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Jens Osterkamp <Jens.Osterkamp@de.ibm.com>
Cc: Jesper Dangaard Brouer <hawk@kernel.org>
Cc: John Allen <jallen@linux.vnet.ibm.com>
Cc: John Fastabend <john.fastabend@gmail.com>
Cc: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Lijun Pan <ljp@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: netdev@vger.kernel.org
Cc: Nicolas Pitre <nico@fluxnic.net>
Cc: Paul Durrant <paul@xen.org>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Cammaert <pc@denkart.be>
Cc: Russell King <rmk@arm.linux.org.uk>
Cc: Rusty Russell <rusty@rustcorp.com.au>
Cc: Santiago Leon <santi_leon@yahoo.com>
Cc: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
Cc: Thomas Falcon <tlfalcon@linux.vnet.ibm.com>
Cc: Utz Bacher <utz.bacher@de.ibm.com>
Cc: Wei Liu <wei.liu@kernel.org>
Cc: xen-devel@lists.xenproject.org
-- 
2.25.1

