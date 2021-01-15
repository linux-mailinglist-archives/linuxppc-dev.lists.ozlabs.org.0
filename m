Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 603072F864C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Jan 2021 21:11:14 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DHXPS390QzDvXP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Jan 2021 07:11:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::331;
 helo=mail-wm1-x331.google.com; envelope-from=lee.jones@linaro.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=NGmfFs6A; dkim-atps=neutral
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DHXMP00pszDvX3
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Jan 2021 07:09:19 +1100 (AEDT)
Received: by mail-wm1-x331.google.com with SMTP id g10so8645759wmh.2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Jan 2021 12:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+7DadD0dH9745VxT7RGgUcZc8wWMxigcxcfDKgHA0M=;
 b=NGmfFs6An4O5Z1bTOhZvumD/b4aFaBLo5GodZjrpzZAET9hm3fXvg9Nat+QCjYyvUd
 Cu51qhHS/zcfGaUQTdOBKgaBLX6K/BCwPlrksmeEtHwUoIUBY9nB42PNg0260erKlRlj
 2DUVbt/VkBrxXGJW9CIugFaL8RtaUt01KqIeKMDG289Vs46noZhkbpHesaP2CnwmRG2N
 iXVwbCu6GW+WxsV6056N191kIDEz/EmAxTeGZW8Zy7NCzdpFepH5NSB8fni7nBIYJ763
 fxfAEDkdKoVffdFqVIJMUAuFA2wHGu9xpBnfqJK/+at08FCDWczw/hm8ESWiPSMbuGdq
 zWRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c+7DadD0dH9745VxT7RGgUcZc8wWMxigcxcfDKgHA0M=;
 b=IkDE0Lg1AzlFNnNgXBrSr6pX33Q5AJdNmkICkTRk+8SmCIq8ZZSIGDVhy62muUZ89v
 sI8LAjUS9IBKCWXF8dpDk42ofKEukkkXpD8j6OpxgOT88Y0FAXMtwfpg96zFoM+op8y0
 gr7oQPtiG2r12623CUXnUEIjxxueSaOuc5PtkvoyK4vF/dl8NwynJ4A0Ab1aL5gq9+Ff
 OfvBkR1nTASfcsenjF3/fPImnYyd1zcTTAONS4AI8qGHaAVVnbSNZki2bfczjId1BBlB
 LgfOCp6ZOBdq/OiDbu7DieZa6NR2QBmw6R2CaVXKSBWWgW95klOspzE4mKQxnj8IweCo
 EFtg==
X-Gm-Message-State: AOAM532swirtM2wVxNAsBDmyOLjPyytZOlgKYl3iC+69lLdMtyi8tND+
 +a1z3pYND6JgsI5kML+Tz5/rDA==
X-Google-Smtp-Source: ABdhPJzRbd30yjZefst2rKry0v+qGXIk906iFx/zco+XZMf5YM39ujaWaXx9Rhy6Yqec4ppN1urxlA==
X-Received: by 2002:a1c:a707:: with SMTP id q7mr10222048wme.15.1610741354435; 
 Fri, 15 Jan 2021 12:09:14 -0800 (PST)
Received: from dell.default ([91.110.221.158])
 by smtp.gmail.com with ESMTPSA id d85sm9187863wmd.2.2021.01.15.12.09.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 12:09:13 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Subject: [RESEND v2 0/7] Rid W=1 warnings in Ethernet
Date: Fri, 15 Jan 2021 20:08:58 +0000
Message-Id: <20210115200905.3470941-1-lee.jones@linaro.org>
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

No changes since v2, just a rebase onto net-next.

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

