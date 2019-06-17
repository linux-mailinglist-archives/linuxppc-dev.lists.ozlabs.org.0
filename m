Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C0547A9C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 09:18:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45S2cT4fBhzDqb0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Jun 2019 17:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::644; helo=mail-pl1-x644.google.com;
 envelope-from=sjitindarsingh@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="D3bbfMWi"; 
 dkim-atps=neutral
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45S2ZR3cZpzDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 17:16:30 +1000 (AEST)
Received: by mail-pl1-x644.google.com with SMTP id a93so3712257pla.7
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Jun 2019 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qcbh030EpOMi5S9ffPNcTh4Jaq49Rf+M0VqnYbSFotI=;
 b=D3bbfMWiGPFP7bKb5+lXDf0g1YLFwqfk8PqbcQrN3STXpU2WpewNplK/M2Kgn5Qpa+
 gVtYpBtwCgaegdD5DiqXB26Yyn4MTCpRSxzpMpsQfIGhqcbFMjxmxdBri4djXQa9Kr8b
 hTHsO5K3vHGCCSA6vjQzukgfDKJ4jXzcBYPyfsWDNjkBZCw+xppk/SO+01L6ka+o/N8D
 ZSOGwxfEnsN0OF9kbvXsDDc9G+PoRJ8Tdi9HeUfCYVO6yEMa009exubZGETLcN64d970
 H/N0iPeN50fqUQR26E2DNWDSYaD4lsgoUYfwnjsyvQI2xEM/9OOk3PL0odYaoXBypeuq
 SWGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qcbh030EpOMi5S9ffPNcTh4Jaq49Rf+M0VqnYbSFotI=;
 b=DZR7O2Lt7ZgTL2GACQF3ifr+gmkd+GYglbImJiOU/AutgPrxES1fHeDPGGcMVh7fto
 cq8NO0g9b24eDy36E+0RzeB+8URPxmoQ/w4uCKGOwDy11kvhF2DDpf4foynndU3JG24e
 q83gO8BYVN/HdgshWi3MN+B4zeMbbh0CirhLdM2mTYb3hwOVmofPamSARMCsu079bt/k
 l92fgZg07ojxF0IH6XEJZ78SSSs4GMqypEDZJK9y+sh9/hxDc70lVuCCEIvFlxY/63vs
 KFqFfNOUrrubuzYbCb/PKvTMJc8RcH6iNid8H9apkX12JmbZX0gYJPNZkegKr6ZIzSTR
 sSww==
X-Gm-Message-State: APjAAAW4ycRGh+y7RtaqOZpgTxiDHxyBUd5twp9NdfdFMKUCGUUSMVQa
 y9kzLe+tWlODLQPQgyY9dMrV+W+j
X-Google-Smtp-Source: APXvYqy1muiVzF5vR7MeLAJXjHGDW90kpA+BwS/7WrjDullcpND0mic9zA3C0unIc6g0RVmB2DIr2g==
X-Received: by 2002:a17:902:934a:: with SMTP id
 g10mr96528682plp.18.1560755788095; 
 Mon, 17 Jun 2019 00:16:28 -0700 (PDT)
Received: from surajjs2.ozlabs.ibm.com.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id m31sm22163663pjb.6.2019.06.17.00.16.25
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 17 Jun 2019 00:16:27 -0700 (PDT)
From: Suraj Jitindar Singh <sjitindarsingh@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] Fix handling of h_set_dawr
Date: Mon, 17 Jun 2019 17:16:17 +1000
Message-Id: <20190617071619.19360-1-sjitindarsingh@gmail.com>
X-Mailer: git-send-email 2.13.6
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
Cc: mikey@neuling.org, kvm-ppc@vger.kernel.org, clg@kaod.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Series contains 2 patches to fix the host in kernel handling of the hcall
h_set_dawr.

First patch from Michael Neuling is just a resend added here for clarity.

Michael Neuling (1):
  KVM: PPC: Book3S HV: Fix r3 corruption in h_set_dabr()

Suraj Jitindar Singh (1):
  KVM: PPC: Book3S HV: Only write DAWR[X] when handling h_set_dawr in
    real mode

 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

-- 
2.13.6

