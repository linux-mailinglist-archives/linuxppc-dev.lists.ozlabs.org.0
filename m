Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A06C4449EB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 21:58:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkzdB4Jbtz3bTS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 07:58:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=a3zMJ0D8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::536;
 helo=mail-pg1-x536.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=a3zMJ0D8; dkim-atps=neutral
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hkzbr5gqgz2xtj
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 07:57:12 +1100 (AEDT)
Received: by mail-pg1-x536.google.com with SMTP id t7so3437087pgl.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 13:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mECX+oRSHRb92wE0BJLiQDT7bINXd0Mx3xvZ2TAianQ=;
 b=a3zMJ0D8bBR20rg7rsxGuyOTYnQN37yYwmBwC3S+6aAW0QlVa7vPvgFG2bSlRyE3ix
 elmBQuwD0+9OLU0FRPq2i/CH/8YN2GJvZv6yjPKSu4EpZFIjAld18VXACn6B+kBBvgnf
 2L9uKL5q6wZ81IJaEa6Sg531mllVK78U7wuYbjyLf5w/rlGG2yhVn16rhFEv7kyt/pD2
 fsTMFuRsbWhqrWapbCNukGsQNb2+CLWZzoK6GQFF24Q5lQ5S+2TNQGz+7lLX5FyHvoN6
 DnOOuScPioxgv2oj9Q0+yZ8xc52rZqxKJ5eEKPVTkTXUcvFyMXnuk3rBZEBDCXfWKjZt
 W/2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mECX+oRSHRb92wE0BJLiQDT7bINXd0Mx3xvZ2TAianQ=;
 b=j0H+jXDwiaNGEDOZCiXBSVIdK0fx3RYlR6XkC2cKRRWcQSCG0Of/D4CuoaYYPHQVlK
 2ZiKxp0oiWY4W2ztVYJ+BZ+TRLNi9QQLcTf4zZSHSZAa2h/9NhcUq/3BprISo6zn6K9a
 CPNkRH9i1yFhwhGMzHWtRbKJu8MJUZ93WNO6pSsZtBMfadP4e68rEfH0SMLOsEW2T1fu
 pqZIr28Ur19d9UUjmle/YiPTICVy+o1bDfSpQvXbaib+hgH9N904LAshaif/q38yWTPD
 rib7joIkuOwipqrkgs8ts//BE4L2C6W9BzUCix2rKUm9yN8F1hxtXd6bereANOQe21HW
 9kbA==
X-Gm-Message-State: AOAM5301C4hu4E2Ng2V7QRWSCoCsGaOI/AeLhRFbI1UvuU3ApqnBQOAe
 S5kf0FLBrT59PEk+gM0LY7A=
X-Google-Smtp-Source: ABdhPJzj2664dHG+guPVVL2qUxpAjbN+Z5lTYlwZpUGV816hc1G3rRsEFzjX162YsDh52mFdzCX7zQ==
X-Received: by 2002:a63:311:: with SMTP id 17mr24881549pgd.367.1635973030309; 
 Wed, 03 Nov 2021 13:57:10 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id b18sm2554859pjo.31.2021.11.03.13.57.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:09 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH stable 4.14 0/2] zsmalloc MAX_POSSIBLE_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:02 -0700
Message-Id: <20211103205704.374734-1-f.fainelli@gmail.com>
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
Cc: "open list:MIPS" <linux-mips@linux-mips.org>,
 Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
 Stefan Agner <stefan@agner.ch>,
 "open list:ZSMALLOC COMPRESSED SLAB MEMORY ALLOCATOR" <linux-mm@kvack.org>,
 Paul Mackerras <paulus@samba.org>, Ralf Baechle <ralf@linux-mips.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Sasha Levin <sashal@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "maintainer:X86 ARCHITECTURE 32-BIT AND 64-BIT" <x86@kernel.org>,
 Russell King <linux@armlinux.org.uk>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nitin Gupta <ngupta@vflare.org>,
 "open list:GENERIC INCLUDE/ASM HEADER FILES" <linux-arch@vger.kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>,
 "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
 Minchan Kim <minchan@kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 "open list:LINUX FOR POWERPC 32-BIT AND 64-BIT"
 <linuxppc-dev@lists.ozlabs.org>,
 "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series is a back port necessary to address the problem
reported by Stefan Agner:

https://lore.kernel.org/linux-mm/bdfa44bf1c570b05d6c70898e2bbb0acf234ecdf.1604762181.git.stefan@agner.ch/

but which ended up being addressed by Arnd in a slightly different way
from Stefan's submission.

The first patch from Kirill is back ported in order to have
MAX_POSSIBLE_PHYSMEM_BITS be acted on my the zsmalloc.c code.

Arnd Bergmann (1):
  arch: pgtable: define MAX_POSSIBLE_PHYSMEM_BITS where needed

Kirill A. Shutemov (1):
  mm/zsmalloc: Prepare to variable MAX_PHYSMEM_BITS

 arch/arc/include/asm/pgtable.h              |  2 ++
 arch/arm/include/asm/pgtable-2level.h       |  2 ++
 arch/arm/include/asm/pgtable-3level.h       |  2 ++
 arch/mips/include/asm/pgtable-32.h          |  3 +++
 arch/powerpc/include/asm/pte-common.h       |  2 ++
 arch/x86/include/asm/pgtable-3level_types.h |  1 +
 arch/x86/include/asm/pgtable_64_types.h     |  2 ++
 include/asm-generic/pgtable.h               | 13 +++++++++++++
 mm/zsmalloc.c                               | 13 +++++++------
 9 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.25.1

