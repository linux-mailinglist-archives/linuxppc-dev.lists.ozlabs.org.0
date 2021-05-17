Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0485738240E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 08:17:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fk87R6mgTz30Cs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:17:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=QtnFV2m4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=jniethe5@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QtnFV2m4; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fk86y6XXQz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 16:17:12 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id b13so494035pfv.4
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 16 May 2021 23:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=inRzRq0tMKJzh8xzCmSsJ83WVgsv/G8dc36x+7UlspM=;
 b=QtnFV2m4+pkjkJZTTM9tj/kF7oYzpMITaPTbIBDaX/jCzhCDuEcvu4iiurj5KSGfML
 mkfhzDQ5KTK5FA7tI0RfHxDNq3P9y0l5Sx5t4Q2CP05KYEPZ2ypz3v1tvu/hWX4Z+pOG
 YVlt2QqbyV6UQ8HtN66VTmw5KOwi4W7E2blqG0asJEHqbKtqRTUXWlayfSX7mWPK2VTi
 A3uOwutQjhbwtdnvNyH7mQy6s8hDhoT/zbl46P88LveaCfE9IejDK/jpFnM/unLJx34Q
 nkKYBCs2jsfUm2+PDZPHOwjxQ1vumBaFuxrgHnLs2HvzMZUM2V6tHiOeDkA27+/XRsXu
 sqnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=inRzRq0tMKJzh8xzCmSsJ83WVgsv/G8dc36x+7UlspM=;
 b=E59NW21Zlm5TvN+bsYYVjoEDZtdvw1KYL9xyCZq+ZiCFy3Y28qV3KDvfBx1wMz6BJP
 yyo53pCTRxq7N2tL9dy1HRfoPHj71OhnUs6L+HRXW65nkfwTQm5rFzJTCW+N5a8xD14Y
 yUO7qkYZZ10hdldnJBZL9oU+0g6Hg6M/7OnC/evnTtYGG5r50UIIiQY7N5TNS1M8Yl4z
 MB+fNObvagwwFZ3kx3ZHzF+ZhiHynMEsR53hTjli/fKUIrDB3RzogNgDF0Z8Xs+XRCaY
 Klujg6JiRKKhb++Y+tpj23kNGQvea5PVI5+1MqCITOBeGW5gW37oZt6p7HiYYOpNt1LT
 RzGQ==
X-Gm-Message-State: AOAM5336BdbVX9v1iePyy7T9bOTZrFCzFwdPSu4kXUhFwd/Vqd8/4sc8
 HJkNIymIpBsYCyQd0RqvRuptrbuCcvA=
X-Google-Smtp-Source: ABdhPJwmU4ZsrihWZQknAzXYO4irwX1FQ5SXD1PYI7Vjw9Nke9mzsi0k1zn0fLD3S7kP7n9ONfGJzg==
X-Received: by 2002:a63:5b20:: with SMTP id p32mr58505551pgb.173.1621232228727; 
 Sun, 16 May 2021 23:17:08 -0700 (PDT)
Received: from tee480.ibm.com (159-196-117-139.9fc475.syd.nbn.aussiebb.net.
 [159.196.117.139])
 by smtp.gmail.com with ESMTPSA id gg2sm1505327pjb.45.2021.05.16.23.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 May 2021 23:17:08 -0700 (PDT)
From: Jordan Niethe <jniethe5@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 0/4] powerpc/64s: Enable KFENCE
Date: Mon, 17 May 2021 16:16:54 +1000
Message-Id: <20210517061658.194708-1-jniethe5@gmail.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Jordan Niethe <jniethe5@gmail.com>, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds support for radix to Christophe's series that enabled KFENCE on
powerpc/64s/hash:
https://lore.kernel.org/linuxppc-dev/8dfe1bd2abde26337c1d8c1ad0acfcc82185e0d5.1614868445.git.christophe.leroy@csgroup.eu/

First implement DEBUG_PAGEALLOC for radix so KFENCE can reuse the same
infrastructure. 

This requires the "powerpc: Further Strict RWX support" series:
https://lore.kernel.org/linuxppc-dev/20210517032810.129949-1-jniethe5@gmail.com/ 

Christophe Leroy (3):
  powerpc/64s: Remove unneeded #ifdef CONFIG_DEBUG_PAGEALLOC in
    hash_utils
  powerpc/64s: Allow double call of kernel_[un]map_linear_page()
  powerpc: Enable KFENCE on BOOK3S/64

Jordan Niethe (1):
  powerpc/64s: Add DEBUG_PAGEALLOC for radix

 arch/powerpc/Kconfig                         |  2 +-
 arch/powerpc/include/asm/book3s/32/pgtable.h | 10 +++++++
 arch/powerpc/include/asm/book3s/64/hash.h    |  2 ++
 arch/powerpc/include/asm/book3s/64/pgtable.h | 19 ++++++++++++
 arch/powerpc/include/asm/book3s/64/radix.h   |  2 ++
 arch/powerpc/include/asm/kfence.h            | 19 ++++++++++++
 arch/powerpc/include/asm/nohash/pgtable.h    | 10 +++++++
 arch/powerpc/include/asm/set_memory.h        |  2 ++
 arch/powerpc/mm/book3s64/hash_utils.c        | 31 ++++++++++----------
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 28 ++++++++++++++++--
 arch/powerpc/mm/pageattr.c                   |  6 ++++
 11 files changed, 113 insertions(+), 18 deletions(-)

-- 
2.25.1

