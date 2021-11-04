Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C2654456ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 17:11:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HlTD56LLtz2ymc
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Nov 2021 03:11:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=h83oQ76h;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::636;
 helo=mail-pl1-x636.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=h83oQ76h; dkim-atps=neutral
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HlTCJ59NYz2xtK
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Nov 2021 03:11:07 +1100 (AEDT)
Received: by mail-pl1-x636.google.com with SMTP id s24so8089760plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Nov 2021 09:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A7bJVqgjUotrWu0YnnFfUthOJyDUdzOLjcjKpzkzQqM=;
 b=h83oQ76hndYjmGIKxYdW7xwVYiPpTIV6XnpoRSn0PFk7hCo7v3SfGnkGgaex77LycR
 ZCSMeg8qvrSEphhq30QD8z0x9xaTWze8HNNR6h+wypEgu0GL4bN95+5SuxdtqGMgZW+Q
 mksLRPM7XcGpZUlfla7gK4eLCJKDYhxkDmxPLC2Q7cR9HZLeTbLQWYaJotd9GTx5S7xY
 QXFy1EpCMVYvR2IzCXUnl2d3k9HVHrz6Mu9IXad4kLxrIQ/H8MbBo6iycB+U3QkdO92r
 XrzHKQPQpwK7TPCB/w5RLkzEKQZp0f/jQIEA8ZApGtYPiQMdyWMfdk35ZWnTyc5ShJn+
 LZuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=A7bJVqgjUotrWu0YnnFfUthOJyDUdzOLjcjKpzkzQqM=;
 b=PzwsZ34SntYq9EVM1O1Fq17aM2TdbzE9uQpCzNaoSzaBd/JciqJ1oaEHRS9Xb1qoNg
 sshtxp3pDlnpHPudMCtXC2aafsTEockHnOFd3OoYhqaV1V6fp9GPWswQznMq4AT6ucJN
 1yd/6l5TpCHxN80coEflyqCMoOBJjQpICfbmAbawEQGvUri9NYldk7sYnrv/XZCeEpWl
 XcmqgwS938/HsO0hNVFhnvT+/jXyYO4BHvtXzorwMRIzfrWU+G+lgkKMoSMJIPi1JGo7
 ht/ICdyl228Kz/4yfCie3FQy/qav6dDbV/33+9sA8KHhDTHC+XjnzEe3NQy5IGtFU4iz
 sBQQ==
X-Gm-Message-State: AOAM533kHgA4jW65Tc69VvLwDC1Qj7VLCKD84dRX+wQL81oOBZVgO7ZP
 61EfOzKk4wNbInw2l5iB7WBOZwfW10U=
X-Google-Smtp-Source: ABdhPJw2SVQoE21B9SY5H+783S4ydGRTcwlF/KS72mzLyI7Klc8Supw+WKdXfPB9ri7QuP6wICUHxw==
X-Received: by 2002:a17:902:b70f:b0:141:c3e9:a7e3 with SMTP id
 d15-20020a170902b70f00b00141c3e9a7e3mr33936187pls.25.1636042263148; 
 Thu, 04 Nov 2021 09:11:03 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (60-241-46-56.tpgi.com.au. [60.241.46.56])
 by smtp.gmail.com with ESMTPSA id
 h3sm5897890pfi.207.2021.11.04.09.11.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:11:02 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 0/5] powerpc: watchdog fixes
Date: Fri,  5 Nov 2021 02:10:52 +1000
Message-Id: <20211104161057.1255659-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Cc: Laurent Dufour <ldufour@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These are some watchdog fixes and improvements.

This has taken a while to post out because upstream printk code seems
to have a problem with indefinitely delaying NMI context printk while
the CPU remains stuck, so that confounded testing a bit. That might
require another watchdog change after I discuss the issue with upstream
printk maintainers.

Since v1:
- Fixes noticed by Laurent in v1.
- Correct the description of the ABBA deadlock I wrote incorrectly in
  v1.
- Made several other improvements (patches 2,4,5).

Thanks,
Nick

Nicholas Piggin (5):
  powerpc/watchdog: Fix missed watchdog reset due to memory ordering
    race
  powerpc/watchdog: Tighten non-atomic read-modify-write access
  powerpc/watchdog: Avoid holding wd_smp_lock over printk and
    smp_send_nmi_ipi
  powerpc/watchdog: Read TB close to where it is used
  powerpc/watchdog: Remove backtrace print from unstuck message

 arch/powerpc/kernel/watchdog.c | 183 +++++++++++++++++++++++++--------
 1 file changed, 142 insertions(+), 41 deletions(-)

-- 
2.23.0

