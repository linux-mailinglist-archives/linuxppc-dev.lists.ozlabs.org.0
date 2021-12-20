Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D219147A704
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 10:29:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JHZ715pCnz3ckb
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Dec 2021 20:29:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.57;
 helo=out30-57.freemail.mail.aliyun.com;
 envelope-from=tianjia.zhang@linux.alibaba.com; receiver=<UNKNOWN>)
Received: from out30-57.freemail.mail.aliyun.com
 (out30-57.freemail.mail.aliyun.com [115.124.30.57])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JHZ5m3hK2z2xB8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Dec 2021 20:28:43 +1100 (AEDT)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=tianjia.zhang@linux.alibaba.com; NM=1; PH=DS; RN=17; SR=0;
 TI=SMTPD_---0V.B9zbM_1639992199; 
Received: from localhost(mailfrom:tianjia.zhang@linux.alibaba.com
 fp:SMTPD_---0V.B9zbM_1639992199) by smtp.aliyun-inc.com(127.0.0.1);
 Mon, 20 Dec 2021 17:23:20 +0800
From: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
To: Herbert Xu <herbert@gondor.apana.org.au>,
 "David S. Miller" <davem@davemloft.net>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-crypto@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
 sparclinux@vger.kernel.org
Subject: [PATCH 0/5] Remove duplicate context init function for sha algorithm
Date: Mon, 20 Dec 2021 17:23:13 +0800
Message-Id: <20211220092318.5793-1-tianjia.zhang@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0
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
Cc: Tianjia Zhang <tianjia.zhang@linux.alibaba.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series of patches is mainly for repetitive code cleaning. The sha
algorithm has provided generic context initialization implementation.
The context initialization code in the optimized implementation of each
platform is a repetitive code and can be deleted. The sha*_base_init()
series of functions are used uniformly.

Tianjia Zhang (5):
  crypto: sha256 - remove duplicate generic hash init function
  crypto: mips/sha - remove duplicate hash init function
  crypto: powerpc/sha - remove duplicate hash init function
  crypto: sparc/sha - remove duplicate hash init function
  crypto: s390/sha512 - Use macros instead of direct IV numbers

 arch/mips/cavium-octeon/crypto/octeon-sha1.c  | 17 +-------
 .../mips/cavium-octeon/crypto/octeon-sha256.c | 39 ++-----------------
 .../mips/cavium-octeon/crypto/octeon-sha512.c | 39 ++-----------------
 arch/powerpc/crypto/sha1-spe-glue.c           | 17 +-------
 arch/powerpc/crypto/sha1.c                    | 14 +------
 arch/powerpc/crypto/sha256-spe-glue.c         | 39 ++-----------------
 arch/s390/crypto/sha512_s390.c                | 32 +++++++--------
 arch/sparc/crypto/sha1_glue.c                 | 14 +------
 arch/sparc/crypto/sha256_glue.c               | 37 ++----------------
 arch/sparc/crypto/sha512_glue.c               | 37 ++----------------
 crypto/sha256_generic.c                       | 16 +-------
 11 files changed, 41 insertions(+), 260 deletions(-)

-- 
2.32.0

