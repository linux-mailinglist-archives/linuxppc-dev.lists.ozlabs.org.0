Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E46255BA59C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 06:08:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MTLCr54gPz3bnY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Sep 2022 14:08:40 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dctbbhVb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1034; helo=mail-pj1-x1034.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=dctbbhVb;
	dkim-atps=neutral
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MTLCH2S7Sz2yWK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Sep 2022 14:08:10 +1000 (AEST)
Received: by mail-pj1-x1034.google.com with SMTP id fs14so19783535pjb.5
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Sep 2022 21:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=mofUXfkq8uUu2Cs4ZRulREnAQ2t8KhZaBx/2w9pvk6A=;
        b=dctbbhVbDfbHauM0rioSIabO4qmQowPklFtyGdJhVqdrT9I9pejmYOItsb3pA/zf1+
         EhE9ee5wTc82Vb+DmXTlvMwvetjcGBbuYY+LTBNIP8vk1z+IWHmgmDVjBau5BqW/XV0i
         Hy6ABMl+YR+/Iwo1Sin4zuIHoDDBzlk9Fp3N/uNh53s3E5NkU7K93JuOH7WpFJb0C29B
         15YxRQqxXZ27zCFS5Y/mYzNyZ9pG4Yb9Lt+Sie55TRjfvRvWVK9l7LN7bMjd0qJcWwFi
         /aW4pC2JKoa98mLuaRqwvVA+o/TtffkONIUrdYrueAgdB4HCw9jCRr2laz6BbO1TaKR/
         2+hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=mofUXfkq8uUu2Cs4ZRulREnAQ2t8KhZaBx/2w9pvk6A=;
        b=pVRkuy8n6sP2BVyV6mNgWaWuXjb7ucS2dCj0d64Jinh46wbkcadnMmWsV0c1mVYKEe
         4Fw3p83DrEZoHSDuSrr75S5SqEYyUZ2GbG3K8i0qkxh7Lrpfoy0ZJtciNmZksiFaMqoB
         290l3/b02WTGpnWuY4kddkyMdQ/zlnw6KaMwHoukLKDfgf4on5ZXnimFasksMti78x5v
         yIbEJIfs7Htpxh33ruZL+NZ7XjjVAwnrqiU1UfT7rPJMpwBwA9osr/7unm78Wt5i6fVF
         OFX2NPdudCUoqmX8YPYI3FvWEeKVkWjEr1wqKJGTKFvf2CD1mTdFF5YbTq5WTMwK1FAT
         dLCw==
X-Gm-Message-State: ACrzQf0MEkUHbXc1kGPNrwF7wL1mf/IDyAzpDkWxETXb5ddcKsLGozTP
	vXl/2TAwNHsl9lJ18K8umVzBdXUusBw=
X-Google-Smtp-Source: AMsMyM4XoCI+Xosu0YTXVIXoLgzhh3SV3XY8kQ/nVlg/z/SZY4gnbjKXtwt39EO/IWYe339ytuGyQw==
X-Received: by 2002:a17:90a:8906:b0:202:d763:72ab with SMTP id u6-20020a17090a890600b00202d76372abmr3343104pjn.56.1663301285140;
        Thu, 15 Sep 2022 21:08:05 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-127-167.tpgi.com.au. [193.116.127.167])
        by smtp.gmail.com with ESMTPSA id t6-20020a1709027fc600b0017534ffd491sm13696816plb.163.2022.09.15.21.08.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 21:08:04 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org,
	Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 0/7] powerpc: build / linker improvements
Date: Fri, 16 Sep 2022 14:07:48 +1000
Message-Id: <20220916040755.2398112-1-npiggin@gmail.com>
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

This series is mainly about moving more things out of writable and
executable memory, and slightly moving the linker script in the
direction of the binutils ld internal linker script as we do.

Thanks,
Nick

Since v1:
- Move sys_call_table data.rel.ro patch to the end.
- And fix the changelog in that patch, the relocations were a red herring.
- Update the changelog in the __end_rodata patch.
- Align __end_rodata to strict align size.

Nicholas Piggin (7):
  powerpc: move __end_rodata to cover arch read-only sections
  powerpc/32/build: move got1/got2 sections out of text
  powerpc/build: move got, toc, plt, branch_lt sections to read-only
  powerpc/build: move .data.rel.ro, .sdata2 to read-only
  powerpc/64/build: only include .opd with ELFv1
  powerpc/64/build: merge .got and .toc input sections
  powerpc/build: put sys_call_table in .data.rel.ro if RELOCATABLE

 arch/powerpc/kernel/systbl.S             |  4 ++
 arch/powerpc/kernel/vmlinux.lds.S        | 85 +++++++++++++++---------
 arch/powerpc/mm/book3s32/mmu.c           |  2 +-
 arch/powerpc/mm/book3s64/hash_pgtable.c  |  2 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c |  6 +-
 arch/powerpc/mm/pgtable_32.c             |  7 +-
 6 files changed, 66 insertions(+), 40 deletions(-)

-- 
2.37.2

