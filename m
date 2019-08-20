Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 816FF95495
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 04:49:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CFcN3RF3zDqgs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 12:49:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::444; helo=mail-pf1-x444.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.b="guJ49670"; 
 dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CFCG4klrzDqFs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 12:30:50 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id w2so2374713pfi.3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Aug 2019 19:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fiKGSFpRWRgnKAP7tnNkcpeYiVKaOAm4fQcF7gj4fr8=;
 b=guJ496705Q6aqBrwFoY5waliAhCh2UGjH4dxfgrzuoOYtOpqH07/OSTOY6HQaatAnS
 IyReUj8uXN2wslagN5SM2qTeVqjY0WjTPj3/UI8veaQvmBJuYEWn2oIuoIPtjGrSIF1m
 lASzMqI3biE7hjsnhp+uIzFHSN80nLstC6lyf6pnd94Ddy2kYm1JLSS7IC+eFhjPE91E
 w8Hd4xosauy2pCWyOUB5768fypG38QTiQmWersRc9duzdO8SsfDEKlWNwal4jZ/hh2JQ
 rcaQrNCgMnGyNFJUK/N2maCCHJ8WfDYV0cJ2aXG9R8od+OeQ1UKslcGIuWiP8LgSSBNt
 2oTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=fiKGSFpRWRgnKAP7tnNkcpeYiVKaOAm4fQcF7gj4fr8=;
 b=SgQI8oadUF13yQMaMaguw5jiYkKt8qRYlJc7qsjt3CtiD3a+9xn2xLaPFRMtyyBvhW
 bA7FLaBHfO0Q196zB/AYOgCYnhF/Hu4weLfjmbjf0duDvA9n8PudnoeEK48ak2AET2GH
 4RMeCo7bdK8PX5VRm9mXz3HZwbm4WwjJztT7q2M9mcbUSt69xnwKhb3ZtloskrsSfFmq
 e6E0Eta9B+WHi9dNr6ygqXtSY6it4V2iw45ZAvwn9bsKu80oIz2l93Uz5AxKCzHVpf0h
 rfaWjI+7wiJyYveOQ6iaYcRxhkORgYJiyjjVxWpNniVuFIwZDlIoqcybZOsdiN1nhgju
 EibA==
X-Gm-Message-State: APjAAAXw+viKRULnSzuGuDjtp366Im1tW27LRyOOlIdygpvVB7RcCIVb
 XBMOUf2eVruAMjiqQ7ybJad+6JCQe5E=
X-Google-Smtp-Source: APXvYqyFLmVvWVqE6oz6CPp+sfCpQ6n39sJpY/68UnFsdP/ErHw5efcMOQ0qmzSTDVKFSfnT0nwBew==
X-Received: by 2002:aa7:9524:: with SMTP id c4mr28235090pfp.225.1566268246640; 
 Mon, 19 Aug 2019 19:30:46 -0700 (PDT)
Received: from santosiv.in.ibm.com ([49.205.218.65])
 by smtp.gmail.com with ESMTPSA id j15sm17609220pfr.146.2019.08.19.19.30.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Aug 2019 19:30:45 -0700 (PDT)
From: Santosh Sivaraj <santosh@fossix.org>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 0/3] Add bad pmem bad blocks to bad range
Date: Tue, 20 Aug 2019 08:00:27 +0530
Message-Id: <20190820023030.18232-1-santosh@fossix.org>
X-Mailer: git-send-email 2.21.0
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
Cc: Chandan Rajendra <chandan@linux.ibm.com>,
 Oliver O'Halloran <oohall@gmail.com>, Mahesh Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series, which should be based on top of the still un-merged
"powerpc: implement machine check safe memcpy" series, adds support
to add the bad blocks which generated an MCE to the NVDIMM bad blocks.
The next access of the same memory will be blocked by the NVDIMM layer
itself.

---
Santosh Sivaraj (3):
  powerpc/mce: Add MCE notification chain
  of_pmem: Add memory ranges which took a mce to bad range
  papr/scm: Add bad memory ranges to nvdimm bad ranges

 arch/powerpc/include/asm/mce.h            |   3 +
 arch/powerpc/kernel/mce.c                 |  15 +++
 arch/powerpc/platforms/pseries/papr_scm.c |  86 +++++++++++-
 drivers/nvdimm/of_pmem.c                  | 151 +++++++++++++++++++---
 4 files changed, 234 insertions(+), 21 deletions(-)

-- 
2.21.0

