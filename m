Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BA5A5B537
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 08:42:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cd8g4mMFzDqKD
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:42:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="jt7i+Ah0"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cd6r1BtKzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 16:40:51 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id c13so5520408pgg.3
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2019 23:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dcNOnkZ3QNA3naQZL2QsN8O60WJ6liuss/shdVWzI/w=;
 b=jt7i+Ah0OIALx3FcRZ1UZkdX1H4ILpm/ltZc9KwQYbH8WrH3GEdinTHq+ex7/HsTed
 Q/DFlt5PofGsqai1Az11oYNvC8+cxbsQJXJx40MYtNrrkVLO3bvbYJT8wLGxeNRtOg+o
 57Hf/eY+JfZUT3NpcNl6/8Uk+X1AO8MWtOT3zpnCnacQdmAqcwOrmxUTuqxdZ7RhEzqK
 Am48lIIHnwHV8AfSk/jpE+HgXctcEK5PWZhSQXmtFvkQPkQZ3BwTSuM3AfroF++KSYjC
 9/BpKeJlEHYoI/ciZKoAF3S3Fc7bM+QF/p7hCLb11IzbCjyKkltoxPZepQ/YfMGX1jkD
 GVlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dcNOnkZ3QNA3naQZL2QsN8O60WJ6liuss/shdVWzI/w=;
 b=ruFqYFvbHMAxN7nl+cgZ2AHwGExXXXRa7Lj8z/Mn/beRAVTkoNqAb+pFbY/hoIwWv1
 rqAmx5uExhfvwkTfQCqSXDCA6DkNyJ90BTpzbuOgsXJ5LJXkioUBp4Co9999CH5Zc7Fo
 WGDG701XiVqMD5mPFbdJrqL+1ClY1YFJLrkULu9vAyeJvkMg1Pm0ORE3UgclZ0c6+ifr
 hJNwb8s6ZBV6bl/Y4aQPbhsUTBRHtnMXsVHDQpBMDXy/b+aUUrgoZo4fUXdzupxwDkSd
 FbmT35TCMG5ElDv1LqPmqEIhoFPoADN8y+kKWWMEa0Nb5bk9M7EHvw4nPSRc8bKJXWpc
 2fGw==
X-Gm-Message-State: APjAAAXZlckokLsSyeiweNICEidLpj5PUc2YN6+iCbKsfjA6vctTO6Ps
 IuE6IhQxXiPKmcuRaf1jsJE=
X-Google-Smtp-Source: APXvYqyhm6G/Dxj/LNC8ofHNrlWkegS32az/Q37ZJ9wniqzmJWd0cS85z1rpS5JiVW3uLe2ZPBrYNQ==
X-Received: by 2002:a65:5248:: with SMTP id q8mr14304334pgp.259.1561963249300; 
 Sun, 30 Jun 2019 23:40:49 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([122.99.82.10])
 by smtp.gmail.com with ESMTPSA id x128sm24238285pfd.17.2019.06.30.23.40.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 30 Jun 2019 23:40:48 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: "linux-mm @ kvack . org" <linux-mm@kvack.org>
Subject: [PATCH v2 0/3] fix vmalloc_to_page for huge vmap mappings
Date: Mon,  1 Jul 2019 16:40:23 +1000
Message-Id: <20190701064026.970-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.20.1
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Nicholas Piggin <npiggin@gmail.com>, Andrew Morton <akpm@linux-foundation.org>,
 "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel @ lists . infradead . org"
 <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a change broken out from the huge vmap vmalloc series as
requested. There is a little bit of dependency juggling across
trees, but patches are pretty trivial. Ideally if Andrew accepts
this patch and queues it up for next, then the arch patches would
be merged through those trees then patch 3 gets sent by Andrew.

I've tested this with other powerpc and vmalloc patches, with code
that explicitly tests vmalloc_to_page on vmalloced memory and
results look fine.

v2: change the order of testing pxx_large and pxx_bad, to avoid issues
    with arm64

Thanks,
Nick

Nicholas Piggin (3):
  arm64: mm: Add p?d_large() definitions
  powerpc/64s: Add p?d_large definitions
  mm/vmalloc: fix vmalloc_to_page for huge vmap mappings

 arch/arm64/include/asm/pgtable.h             |  2 ++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 24 ++++++++-----
 include/asm-generic/4level-fixup.h           |  1 +
 include/asm-generic/5level-fixup.h           |  1 +
 mm/vmalloc.c                                 | 37 +++++++++++++-------
 5 files changed, 43 insertions(+), 22 deletions(-)

-- 
2.20.1

