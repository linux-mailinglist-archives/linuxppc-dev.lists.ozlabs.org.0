Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E3861355D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 13:08:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N1Bks5Bwvz3cLW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Oct 2022 23:08:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e6AKxCHl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=e6AKxCHl;
	dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N1Bjy0XPMz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 23:07:48 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id 17so6245219pfv.4
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Oct 2022 05:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9ycr17+a55rcYsBYWxTRCsT0UwX9F6ZU7pqXcExPQpA=;
        b=e6AKxCHlIXguyd0DBGSrdtlsWiPuLJCk1tTKXNQXcbS8wLYhsnWI5wH2DXUjfgctnY
         s3Xw7aFQYHk1aWnhQDrpCclFlMXQPqNCQg1pxX/FyIeOZGqfGcwhEXXiYhGCUx8pQ7ai
         QKVFrteK2c50upMP2JwjizDLwBqOelJiuldIqHstFSyASX9MwJzaTox/cIKW6sENjkCA
         /t3mBSG9A9HM+hxfB6uSSNCXytzTbvdmXyK0Wvtn6xSRecvRHS8GGWVzg+1Qr+VS07VC
         o2mmqED/9YlCBpwEnqW9aKYuBEb+ooRiKPM4oluTnjTZFAMqHVkz5og2g4A6bgf3oanj
         UNdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9ycr17+a55rcYsBYWxTRCsT0UwX9F6ZU7pqXcExPQpA=;
        b=RnkAZi/XHjc6RAwxh3ttq0ViMPyI5i0cTrPutJrv6E6S4IlZwwWPAzX8jAnE58v0H9
         X9p0ZQfPei5LzlgYLKIAG/JBh1SChGfJfS6wAHVBm2d12KGmBcz1tOmpLpXxqIfUIx7m
         goDRyJA3oiPSiE0CxvgQHygGqPHS1baIlX58dVIYq7vZbaTOUe3gbIzyKON25JwTh+aK
         sf64OHPOoc4w6FZC4GanZIdJTAynU9Oh0ikh/iwkJZH6UmAff7GCs6LHcJaVWKL5WFEn
         ve/1EssIXguhS5cOTanRChOIP3XIy3HuD1ulViybwvats0OiWA0bm9p2t0Jzv8MYFwQN
         +aaA==
X-Gm-Message-State: ACrzQf2fHWD43h7r7JI+8MUJXrLJUktgnCYhH3NMgMbwsINbCeU/IA+B
	+iKZuWMd31CN5Cl91/9jBgs=
X-Google-Smtp-Source: AMsMyM4OCqXbCf7YDIh96WINBqKgwpacyC98n48oqJJh7nspIBEC6uppEwjykQuzVx+u4na3LYt9AQ==
X-Received: by 2002:a63:8942:0:b0:46e:c02e:2eb5 with SMTP id v63-20020a638942000000b0046ec02e2eb5mr12434406pgd.141.1667218065126;
        Mon, 31 Oct 2022 05:07:45 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-106-251.tpgi.com.au. [193.116.106.251])
        by smtp.gmail.com with ESMTPSA id p17-20020a170902e75100b0017e64da44c5sm1595134plf.203.2022.10.31.05.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 05:07:44 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linux-modules@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 0/2] powerpc module arch checks
Date: Mon, 31 Oct 2022 22:07:31 +1000
Message-Id: <20221031120733.3956781-1-npiggin@gmail.com>
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

These slipped through the cracks. Picking them up again...

The story so far is that Jessica gave us the new scheme in patch 1,
now slightly rebased. Patch 2 implements the additional check
that powerpc wants which originally came from Michael, and has been
updated to the new approach.

This was previously attached to the ELFv2 build option for big-endian
kernels, but it can go ahead of that option.

Just checking everybody is still okay with the code and their SOBs,
and Luis if you would be okay for patch 1 to be merged via powerpc or
prefer to take it in the module tree (or maybe you object to the
code in the first place).

Thanks,
Nick

Nicholas Piggin (2):
  module: add module_elf_check_arch for module-specific checks
  powerpc/64: Add module check for ELF ABI version

 arch/powerpc/kernel/module.c | 17 +++++++++++++++++
 include/linux/moduleloader.h |  3 +++
 kernel/module/main.c         | 10 ++++++++++
 3 files changed, 30 insertions(+)

-- 
2.37.2

