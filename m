Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 969E119F638
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 14:58:11 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wrDx00mlzDr44
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 22:58:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Lz+aE0Lh; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wr6y4lLnzDqRY
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 22:52:55 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id c23so7513465pgj.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=hIs0vpkpzouRXrFo61lBnYWJ5AeDbk1pbRG9DTvewns=;
 b=Lz+aE0LhkC0d3ydNGLXJ0dfJRBOjmAUllDjkNIRMCoMG3zXNDs31Q5R/5yTPqn13RS
 U2QX7TZ5cUXsuvOdIcZwpwbGBW8jf4d0fhi93cQC+UyQiUOR8NDd1EuHAhcHc0cyimIB
 oZ4V2JRqSMUNH7YrNdv56LIneI3X3yhT2lNSrP8jgWjHs4hrCPD1DL2EpvQf/BnkAAnd
 xRSeV1E1XMSG+9tzMFRvn02OH4reuTWwjz8GoKlcps+UHPBwNoc/A8HBOYBj4sadHHbZ
 RrJbNP/ugVDrSI3b63yQswROCXVbEhPyBorBTjLiPZWhqeHw2DYcOGchtEfLDrxRbYIF
 owpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=hIs0vpkpzouRXrFo61lBnYWJ5AeDbk1pbRG9DTvewns=;
 b=CGB40wGMEt1GYfAxdb5NgEfZVIVylgOXa/Hm/bFevEyem8J4995ylNqesGW1JbB6uk
 uCM35tCPSk6yVzVJAtqRxfmhjqROrDODp2XNBm+La5h+mNL86V2nF+sZpiLhUzvWbPHB
 3SCcs1tNhl+IHp9bgCqE0bUi1909ijuioV142Imhn9RlXqkMwaKrmbuc0M1OvD57tG7N
 0ZzE7DbSZufPKHKbdvtBbOP2ikf2yh5RKMpnDVf7GNzJNjNeeRf59zx6GpWG9fVHD6rb
 9WyypmOFkP1EIp1C2j2B6d8Juv6N1oPA/BtNSSgcJzvHOqQt2KjqWwIQL9T4HKcZyvvD
 +OrA==
X-Gm-Message-State: AGi0PuZ/odgZjLzDKD3Ty75+XXOg4WlhhliPi53jiOP4pyNJJuC3Ap9Q
 tpJw6mzvXrlj5o4fGMb+wt4=
X-Google-Smtp-Source: APiQypIQoYolWCbtfisdnAEX/P8gggsuL45FV+q3guCMPla/n3qEQLfA7AYa+k2CllZU7kpCJf7Rtw==
X-Received: by 2002:a62:1757:: with SMTP id 84mr20760636pfx.107.1586177572336; 
 Mon, 06 Apr 2020 05:52:52 -0700 (PDT)
Received: from localhost (n112120135125.netvigator.com. [112.120.135.125])
 by smtp.gmail.com with ESMTPSA id v42sm10938536pgn.6.2020.04.06.05.52.51
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 Apr 2020 05:52:51 -0700 (PDT)
From: Qiujun Huang <hqjagain@gmail.com>
To: benh@kernel.crashing.org, paulus@samba.org, mpe@ellerman.id.au,
 oohall@gmail.com
Subject: [PATCH v5 0/2] Fix opal_add_one_export
Date: Mon,  6 Apr 2020 20:52:40 +0800
Message-Id: <20200406125242.4973-1-hqjagain@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: linux-kernel@vger.kernel.org, Markus.Elfring@web.de, tglx@linutronix.de,
 linuxppc-dev@lists.ozlabs.org, Qiujun Huang <hqjagain@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We should check the return value of kzalloc, as kzalloc may fail returning NULL.

---
v4->v5:
	Separate the patch into two.
v3->v4:
	Added the information about coccinelle script.
	Added change log.
	Added Oliver's Reviewed-by.
v2->v3:
	Removed redundant assignment to 'attr' and 'name'.
v1->v2:
	Just return -ENOMEM if attr is NULL.

Qiujun Huang (2):
  powerpc/powernv: Remove redundant assignments to attr and name
  powerpc/powernv: Add NULL check after kzalloc in opal_add_one_export

 arch/powerpc/platforms/powernv/opal.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

-- 
2.17.1

