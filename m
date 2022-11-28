Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98F9263A06E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 05:16:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NLBxL30Nmz3f3K
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Nov 2022 15:16:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j7194bFE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=j7194bFE;
	dkim-atps=neutral
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NLBwR39dsz3c7t
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Nov 2022 15:15:49 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id q12so5199529pfn.10
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 27 Nov 2022 20:15:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sRpFw3OeO/vLJZ1WJwARqXVTUFA41mm8ZoGpWsgy6+4=;
        b=j7194bFEJymcnVuCEAb9JHO9sWsAmKDXSSn49w/YyLTwA9zol2Fsrd4PbERyxgJ8Bt
         hQwt3jYEx6mbcuJxEROUs1QzjHECBMiPwbuzODjIjDJmqceTxoTkdawWUuyqsYydIHSe
         xdDrMVx0BjWY+w8IAt0LY0LKmr52y817Xlszj+Dj1EFPs38wSo6KEL7m162C3AClYJ42
         3rXjT/W47+HyW1lgEBUU8pZ92NOC4MhWA7YA/P6GsE4NxFKdQAmoLu3qYKMOXZwEeXMF
         irE/uOE9HiinBzIWaHSkqYtuT9B8R9hNGUR7CyDogzhdlehkYRvvLpqFO9k1PaqmRaLh
         SHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sRpFw3OeO/vLJZ1WJwARqXVTUFA41mm8ZoGpWsgy6+4=;
        b=orPwIZC3XFn4ESoJ83kuCO3OSOaaS13UEEQO3S7DhzbUBOoMmGn9ty199JgEjPPDH0
         0ULu0+maJVAqEdfFLX9IVwW9U+56jnnwE2hy7zDhYqhjQWp19CFn1aBbA53mgby0NbW4
         QVfcpGJO7diH11lGFsF+zGYiloE6kTKXm8NGjGGd+6GJ/Nm8er9F/ZuZe9i7iI9SRxSC
         TODaWJjmcdGPqd/+ECg/R+af/MN96JEzEfy+zy1uc06YMHAUudj5XP7ARBvjSnMdEkBN
         p2QsdRp4+kEVYqs49j9LEr2u7LIHKLdp3fxIqTbFwZvgM+j6AoGG51+mzJyakhuXF+yI
         v6SA==
X-Gm-Message-State: ANoB5plbv9Bq7/Xmy33Af5f+/H3SZI+xf7fZ4Z3aAkd+0Ur+KSgf7xCq
	x7PUHkgn4YYHaJQ6wSIry/2G5FuKFq4=
X-Google-Smtp-Source: AA0mqf5kzwhKEJVu0MS/vrry2sAH0s4dpHAvcCdTCLY0+xjAhf4Zg+5aZitELbCml1vhTAYut1i/dw==
X-Received: by 2002:a63:f962:0:b0:477:1bb8:bbf4 with SMTP id q34-20020a63f962000000b004771bb8bbf4mr26140270pgk.19.1669608946909;
        Sun, 27 Nov 2022 20:15:46 -0800 (PST)
Received: from bobo.ozlabs.ibm.com ([220.240.231.60])
        by smtp.gmail.com with ESMTPSA id y28-20020aa79afc000000b0057489a78979sm6905670pfp.21.2022.11.27.20.15.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 20:15:46 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 0/4] Option to build big-endian with ELFv2 ABI
Date: Mon, 28 Nov 2022 14:15:35 +1000
Message-Id: <20221128041539.1742489-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Luis Chamberlain <mcgrof@kernel.org>, =?UTF-8?q?Michal=20Such=C3=A1nek?= <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is hopefully the final attempt. Luis was happy for the module
patch to go via the powerpc tree, so I've put the the ELFv2 for big
endian build patches into the series. Hopefully we can deprecate
the ELFv1 ABI 

Since v5, I cleaned up patch 2 as per Christophe's review. And patch
4 I removed the EXPERT depends so it's easier to test. It's marked as
experimental, but we should soon make it default and try to deprecate
the v1 ABI so we can eventually remove it.

Thanks,
Nick

Nicholas Piggin (4):
  module: add module_elf_check_arch for module-specific checks
  powerpc/64: Add module check for ELF ABI version
  powerpc/64: Add big-endian ELFv2 flavour to crypto VMX asm generation
  powerpc/64: Option to build big-endian with ELFv2 ABI

 arch/powerpc/Kconfig                   | 21 +++++++++++++++++++++
 arch/powerpc/kernel/module_64.c        | 10 ++++++++++
 arch/powerpc/platforms/Kconfig.cputype |  4 ++--
 drivers/crypto/vmx/Makefile            | 12 +++++++++++-
 drivers/crypto/vmx/ppc-xlate.pl        | 10 ++++++----
 include/linux/moduleloader.h           |  3 +++
 kernel/module/main.c                   | 10 ++++++++++
 7 files changed, 63 insertions(+), 7 deletions(-)

-- 
2.37.2

