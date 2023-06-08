Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B6C1727521
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 04:46:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qc7rG1LyJz3f08
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 12:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JyKG9gVI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::732; helo=mail-qk1-x732.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=JyKG9gVI;
	dkim-atps=neutral
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qc7qP5h5jz3cBL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 12:45:19 +1000 (AEST)
Received: by mail-qk1-x732.google.com with SMTP id af79cd13be357-75d44cb20a2so8365585a.3
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jun 2023 19:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686192312; x=1688784312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=teN9p0t9Py9PEukUc7/cqagMxz/5d+anLF3de3OjgMs=;
        b=JyKG9gVIrKRNvg08FK0kze79jE+HPGg14Ppzb0B87BxKnQTHTcgU05NSJw/u+1OiNC
         qNs9ope2ux+R/3VumkcD5W8q0tVfR3vowKfKXIyOfN7+0itWGFz82ba8wHsl43SpfsgA
         WrSVxEvKOcTcsLLrIUSy9kXaMRg/QAzVS7xzU560e9WoflWDJmcgi9T6IbkfFldbM5Sy
         VIor5qle13B3gjcYydJ+71yiJYAk+0J0QSBpH2P20IdOg9F5EiJBQgWIhTahq4KIybQq
         unrLP2gYRdX9Ix3VYpjQsg7X0wyHaMqescICLJvWTkw4/Va/RAlPoR33hrl0KVfE3qH6
         SfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686192312; x=1688784312;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teN9p0t9Py9PEukUc7/cqagMxz/5d+anLF3de3OjgMs=;
        b=j+KrBR9j38OCiqHvVD8vjlez+MjYTBxm6eY8j+uHyPQK5Dv2V1IiCeSsOw1rSYj3hZ
         pXBhc/gjCIZWwSTH/5IP+kgprifHvDj9NmTVgsfx0jIdE07lBs1Vn/JIVj+1L4+a+yF+
         nu5bl2HR0a8z/NKxAOdtXfZhckGMUl+WEN5QNRNmCutX5C6/OCwrWIxClBdZnQkvdEvd
         IbGPlk9X/MBqxHi17MLFLWg2c7w7iZzbV0yvFJkW52rFyY/1W9oBBZYh/Y6aMLbQ9mqg
         bfFAOqXYiTDw/WnNBbTZrIbw4jEi+qOymfz7yRtKihhaCKFi+4Rlg7mJ3sdfgO0PEzLj
         DKRA==
X-Gm-Message-State: AC+VfDwVl5UFXoeqO8N3WIDnurg2YmySYrO4dVOmfiL+syeiTsYRkXgP
	lfuP5nnbcDgbajsabrZc+hY/5K+wsio=
X-Google-Smtp-Source: ACHHUZ5U53tkB/Ijo7k2JmytjfmtxBzc/YSVbJKsamc7Fx4I05POeWa4lQTTG1qRKoS80xXM2zYKRQ==
X-Received: by 2002:a05:620a:4690:b0:75d:5321:fa40 with SMTP id bq16-20020a05620a469000b0075d5321fa40mr4207972qkb.51.1686192311907;
        Wed, 07 Jun 2023 19:45:11 -0700 (PDT)
Received: from wheely.local0.net (58-6-224-112.tpgi.com.au. [58.6.224.112])
        by smtp.gmail.com with ESMTPSA id gt1-20020a17090af2c100b002591b957641sm173870pjb.41.2023.06.07.19.45.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:45:11 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] KVM: PPC: Update MAINTAINERS
Date: Thu,  8 Jun 2023 12:45:04 +1000
Message-Id: <20230608024504.58189-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.40.1
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
Cc: kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Michael is merging KVM PPC patches via the powerpc tree and KVM topic
branches. He doesn't necessarily have time to be across all of KVM so
is reluctant to call himself maintainer, but for the mechanics of how
patches flow upstream, it is maintained and does make sense to have
some contact people in MAINTAINERS.

So add Michael Ellerman as KVM PPC maintainer and myself as reviewer.
Split out the subarchs that don't get so much attention.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0dab9737ec16..44417acd2936 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11379,7 +11379,13 @@ F:	arch/mips/include/uapi/asm/kvm*
 F:	arch/mips/kvm/
 
 KERNEL VIRTUAL MACHINE FOR POWERPC (KVM/powerpc)
+M:	Michael Ellerman <mpe@ellerman.id.au>
+R:	Nicholas Piggin <npiggin@gmail.com>
 L:	linuxppc-dev@lists.ozlabs.org
+L:	kvm@vger.kernel.org
+S:	Maintained (Book3S 64-bit HV)
+S:	Odd fixes (Book3S 64-bit PR)
+S:	Orphan (Book3E and 32-bit)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
 F:	arch/powerpc/include/asm/kvm*
 F:	arch/powerpc/include/uapi/asm/kvm*
-- 
2.40.1

