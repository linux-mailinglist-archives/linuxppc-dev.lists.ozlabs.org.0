Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAA58379F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 05:36:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LtbsR4qMKz3dsq
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 13:36:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CqnwOOBE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62d; helo=mail-pl1-x62d.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=CqnwOOBE;
	dkim-atps=neutral
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LtbqR58zBz2xHL
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jul 2022 13:34:26 +1000 (AEST)
Received: by mail-pl1-x62d.google.com with SMTP id x7so683888pll.7
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jul 2022 20:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=FCyuMS+MYtaXjHcIxmL31JDLi03JrIO2qsiSj9P1Eho=;
        b=CqnwOOBEEvCpmhikYJ3JqR5kKGQKEcHIAFmX3WraUqqWfCHTg/3/ho7b2LG1xtN6MW
         SAxT0lRJ3uJhj3jneu/Bb5Rq+j8+masl2huLxdBwc1ZWItOLd3VHmBpiZ6+r337LYEsh
         VKMdCjVr+QKj09HmSOEQuIy0QwX8x4uU4ZK5L2h32arGX2BkcYJ8k3Pdarh/6HSxsxmS
         puUDL9HUL7zA4lHFxfhJQFmFxuGW27f/XBUT6tN3slrmNzg7IgHISrFG0oJA0BVXiOwL
         NZjSgXdw8mkvvdYhBwZAejxfv+tgU2Fg29/7c10O/Jr8vlAFk1JgnUvEU4Lw8WJ2u7Pf
         6MOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=FCyuMS+MYtaXjHcIxmL31JDLi03JrIO2qsiSj9P1Eho=;
        b=05o5jof508IqPjS9HDK1Sf0x0jx8EdjQ7ftaDeKSXOOGhBxVF4R3RLPoM3kXKxhSyG
         taYFh787dUY3lmq6NNuk05FbNS3JxdMp8aKW4NQ682Qo72pZ0COlvbh10KZ8Yepddd1r
         PjsgdKPaIMEV2fQ8V5UwO1ZCzEAwitW1HJgtnRL2s4z1ugu6axw5HTG3POl6o9jIgiuD
         xc44nrmwAo4ZNu6EJVEfVA3az7AzFThAadxcaMcNKFx312F2SHFTFk6zJRrx7pI+dx9j
         Yik44T22TvSr6332PfOSQwwzNnLI2FOcsXN0XjJBxb5hmZCiaOolWCi6C+IZ2c5hE7Bf
         TzYw==
X-Gm-Message-State: AJIora+Ojel+TPDaOEzFBV5RfNOT+xqBQK/2DnMzvxENEWagUtP9vumy
	01oSs23sjfatNMW+cw59juk=
X-Google-Smtp-Source: AGRyM1u09bL67UJ4D22OsPriM3aYVau9eNR+g2LJANdPbWk7JIFHDJdMAaRCIPQk8nM62BjKho6bVw==
X-Received: by 2002:a17:902:900c:b0:16a:4521:10fd with SMTP id a12-20020a170902900c00b0016a452110fdmr24586283plp.75.1658979262231;
        Wed, 27 Jul 2022 20:34:22 -0700 (PDT)
Received: from debian.me (subs28-116-206-12-54.three.co.id. [116.206.12.54])
        by smtp.gmail.com with ESMTPSA id j5-20020a17090a318500b001f035bfcc53sm2582722pjb.18.2022.07.27.20.34.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jul 2022 20:34:21 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 7AB39104A8D; Thu, 28 Jul 2022 10:34:16 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc-tw-discuss@lists.sourceforge.net
Subject: [PATCH 3/3] Documentation: powerpc: add elf_hwcaps to table of contents
Date: Thu, 28 Jul 2022 10:33:33 +0700
Message-Id: <20220728033332.27836-4-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220727220050.549db613@canb.auug.org.au>
References: <20220727220050.549db613@canb.auug.org.au>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Yanteng Si <siyanteng@loongson.cn>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Paul Mackerras <paulus@samba.org>, Bagas Sanjaya <bagasdotme@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Alex Shi <alexs@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

elf_hwcaps documentation is missing from table of contents at index.rst,
hence triggers Sphinx warning:

Documentation/powerpc/elf_hwcaps.rst: WARNING: document isn't included in any toctree

Add the documentation to the index to fix the warning.

Link: https://lore.kernel.org/linuxppc-dev/20220727220050.549db613@canb.auug.org.au/
Fixes: 3df1ff42e69e91 ("powerpc: add documentation for HWCAPs")
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/powerpc/index.rst b/Documentation/powerpc/index.rst
index 0f7d3c495693e0..85e80e30160bb6 100644
--- a/Documentation/powerpc/index.rst
+++ b/Documentation/powerpc/index.rst
@@ -17,6 +17,7 @@ powerpc
     dawr-power9
     dscr
     eeh-pci-error-recovery
+    elf_hwcaps
     elfnote
     firmware-assisted-dump
     hvcs
-- 
An old man doll... just what I always wanted! - Clara

