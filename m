Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2010B5F6986
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 16:24:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mjtwc5ZGsz3dq4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Oct 2022 01:24:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=axHrlA7q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102c; helo=mail-pj1-x102c.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=axHrlA7q;
	dkim-atps=neutral
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mjtvf646zz3bmK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Oct 2022 01:23:09 +1100 (AEDT)
Received: by mail-pj1-x102c.google.com with SMTP id e11-20020a17090a77cb00b00205edbfd646so4492113pjs.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Oct 2022 07:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=Eg8w3VoXqVXz9suAlvPS6eGOA//rotF+hkFTUmZByG4=;
        b=axHrlA7qY8u3vZZ+Ntan4EA2SJ+d2MQmwJMERx1sNboQ5q0JGksjzMnt71PZdkr/Fp
         HTL/3q3EMT+cXzbCBkvFYkOE46JwO8R+gLWiaEJswnyoCCpyxVr2sVL444e9H1r7IpdZ
         PiNn4X/ErTPGK1bQ7DVzH6bn72zJifRH1JAioesNqMth28XGdbBEwcLbO2Sk9ZY1gBYe
         jS043zRVTFqOb47OsjsPYhFdLaYcuM4TCUZOIy3awClKejaV9ux+u/gVduaWeEFYYfEy
         5pPUf2p7KumSAP6rVQ+Y7CJQyzkgikLmjpoxBQMc8bTUdW1+0kWs1O8ySbDh0v0UV+Qe
         lkaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=Eg8w3VoXqVXz9suAlvPS6eGOA//rotF+hkFTUmZByG4=;
        b=kOmjxyBFGTRuneV+RRxf92oYPPpib0BoeoZJA/AC89ocDarC52BBMzVt4ZmJIa8jhY
         XLfvdScJ8rmDn99c2poocxl7OFOHodymMx1u5djKEs/w+GlZ/sG2gtZ/PqT1H21/J4zg
         NcNpMXNaNmgeR5njq7q5EXkirpOC96rHwOzMB6DHvZVSROhYNtnZ0OF6B6Hlnppl/Xzz
         DPPNOMTLMVdaWK1fSqOMsA7ePOSE3jC0nE3xhzywhxi/G08dwYFrx/rqSeiOWaEoe8BH
         z/d07Yv8YtBO6Wxcv0YDk/abiWYejxwtpXPbOWEKK+6ieSH1scYzHktC0huSHSjMrZA+
         RikQ==
X-Gm-Message-State: ACrzQf1g1H7d90KgbajzIjsUqBMYhIiYcd6DvwD28Pu14+aOHVRoiI6Q
	zAt54WKgkryyd1Lgak+Pjh7AJ1/iHCQ=
X-Google-Smtp-Source: AMsMyM7e2YfaboP1w85221Pa9LvnX3ybRmqbyWntX7VfMYmq6BUoPuZUhBMUOtFP954KC2PbrMPZFA==
X-Received: by 2002:a17:902:cccc:b0:178:a9b3:43e6 with SMTP id z12-20020a170902cccc00b00178a9b343e6mr183858ple.92.1665066187613;
        Thu, 06 Oct 2022 07:23:07 -0700 (PDT)
Received: from bobo.ibm.com ([118.208.156.99])
        by smtp.gmail.com with ESMTPSA id k6-20020a170902c40600b0017f8094a52asm3004784plk.29.2022.10.06.07.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 07:23:06 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/2] powerpc/32: nohz full support
Date: Fri,  7 Oct 2022 00:22:58 +1000
Message-Id: <20221006142300.128189-1-npiggin@gmail.com>
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

On top of the previous fix to prevent KVM being selected with
context tracking on 32-bit, this should be good to go.

Since RFC:
- Improved code sharing in interrupt.h
- Minimal patch for VIRT_CPU_ACCOUNTING_GEN support

Thanks,
Nick

Nicholas Piggin (2):
  powerpc/32: implement HAVE_CONTEXT_TRACKING_USER support
  powerpc/32: select HAVE_VIRT_CPU_ACCOUNTING_GEN

 arch/powerpc/Kconfig                 |  3 ++-
 arch/powerpc/include/asm/interrupt.h | 35 +++++++---------------------
 2 files changed, 10 insertions(+), 28 deletions(-)

-- 
2.37.2

