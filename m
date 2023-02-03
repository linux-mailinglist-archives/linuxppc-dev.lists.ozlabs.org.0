Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 492C46897E6
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 12:40:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P7Yby0hZLz3f6m
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Feb 2023 22:39:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DbSDQUGp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DbSDQUGp;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P7Yb16PTxz3bjc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Feb 2023 22:39:09 +1100 (AEDT)
Received: by mail-pj1-x1034.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so8575419pjq.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Feb 2023 03:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Kuw3B4MIe9TWknK78apLyMDSnKknMlGoOOX6tJiYXXs=;
        b=DbSDQUGpiJeLz12kSZKHtDbEXZDn9u0poy+C04KYuPb5OUin8XqVJQ7tsQRIfKRJmu
         JZJoVp7M+BKxSwjhQK0wEZidH5DYfEQFecfAoK5Vu0BChv/rb8Ax9CiCKhD+zuWCiZCE
         o6DJy0lxLi2HSDt4VIr5lIeUgRqlc7WgbOrCUX9SZcS+q9J1NHAA5ah9P2ikGdlampSU
         ghEDpR3MW5zQx4nWocG6850qPDMhSY3cvHpouBbs5CZMwnlzLlM9YbdcpDCniNRHKgy4
         CQnmyDwGZ75UjJna4RYmVe8PN6NQSzTUmoF5PY1ss9SEjaB8eac7JL3RI2LLwjKXIVg3
         vxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Kuw3B4MIe9TWknK78apLyMDSnKknMlGoOOX6tJiYXXs=;
        b=dc5dASnZAxjns+8l4h3T6V6ygrDuD3dv/kpHII4lBAJ9/N1TY0w9wPptMK93E94n7i
         vW+eTS9kDR+mtNxrqzv1l4igaTgrghWXHQWvFEp6tKY4jiit7eJps3JjqnMY7Eq2yx9A
         yJOMpopyRX9ZsnRL7gaC32S+VYErUHMA2+0naCBIx/ZvUws3VhQXqZEcIeiB7RLgcH21
         9TFViZacD7/xGGVbk4hFKWwP3EXR5AuVsKKLgL3dX4+5d71k/CNhS7JZKN04C4LLweA4
         7hLX0qB2y49zo3LD6MjWy3ki4TBWTjb2awfP5764F/pfYuJIZShKZyCoC0+SDOWHpGUC
         D1Pw==
X-Gm-Message-State: AO0yUKUHO+jdJdyE1p6pJ0GxVPk4pxbH7vIkZD/rjEXH2jo2mqgk38mV
	zqj/Jteu6NnlLQ6zuBlHQrqyzuYL3r4=
X-Google-Smtp-Source: AK7set+v/Bn8DLGEPkL4snDylify9T2hIRJ+7jg1ZdjlzOvVVOsIMMCSHLv7tOFf6q7o7mf/2JOP+A==
X-Received: by 2002:a17:90b:4d10:b0:225:c65f:3550 with SMTP id mw16-20020a17090b4d1000b00225c65f3550mr10224425pjb.9.1675424345776;
        Fri, 03 Feb 2023 03:39:05 -0800 (PST)
Received: from bobo.ozlabs.ibm.com (193-116-117-77.tpgi.com.au. [193.116.117.77])
        by smtp.gmail.com with ESMTPSA id k92-20020a17090a4ce500b0022bf4d0f912sm4792964pjh.22.2023.02.03.03.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 03:39:05 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/3] powerpc: prepare for pcrel addressing patches
Date: Fri,  3 Feb 2023 21:38:55 +1000
Message-Id: <20230203113858.1152093-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Here's a few of the easier preparation patches from the pcrel
addressing series.

Thanks,
Nick

Nicholas Piggin (3):
  crypto: powerpc - Use address generation helper for asm
  powerpc/64s: Refactor initialisation after prom
  powerpc/64e: Simplify address calculation in secondary hold loop

 arch/powerpc/crypto/crc32-vpmsum_core.S | 13 ++-----
 arch/powerpc/kernel/head_64.S           | 50 +++++++++++++------------
 2 files changed, 30 insertions(+), 33 deletions(-)

-- 
2.37.2

