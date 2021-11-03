Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A2E444A07
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Nov 2021 22:00:25 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HkzgV4QfXz3cY3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Nov 2021 08:00:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=fhZKtKSt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=f.fainelli@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=fhZKtKSt; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hkzc22hjvz2yKF
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Nov 2021 07:57:22 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id s24so3686642plp.0
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 03 Nov 2021 13:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgkJjFPSZ0RIiVDPTncldaM4JyePze+OY2e9ObDrx7w=;
 b=fhZKtKStcdupgiOxcNB95yd9Vzfj7Wn5bRHFRNaH41aSZXHw/MYS8vuFYdDSVjGm4K
 Vk9elSX27N4++k6VjEXfy2sIVKLOxMxyB6oZKk3s9tV6tV4W5vnlyNkwQh8tLs+DepJr
 kfiJxkG++oyS7MlANxu+lvPLpZ4m3PKexHbnKEBpncSvuKt/7z0IXrdLVXNiaT9CXsWk
 kG+L0bmKvi8tAwUj7vnT2ysLIq5XuorFEASFx40pKnz1z2YG015WrdXWJpBoqgBBnz6z
 y3r88+9sR4bR58ymsxwC8ERtvqTmJ34BmFAo9Lxvk5u1EwU+Vj1hwuHgqoFhrXqlTWm0
 FUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KgkJjFPSZ0RIiVDPTncldaM4JyePze+OY2e9ObDrx7w=;
 b=egFyVKSBf4zECk/k9b5TgE08ymapicbOVTPHl3l3gzWEAynODZdaRTQDG9i2p8JEDC
 OQP9xpRE5RVMRm6RqMecOzVDnHwFv340i+a2DkR9Ebq25uCRXcurYzYvwVRR0vSTzhvk
 0reqWNnZMhN+V1BMK/t7UAu+xAQ9HL1sbB+PJP8N/MIR7Jw2J7xK66B6LUdn0i90p/Rj
 4ot/zZ1Z0dcxv/HUcZSAxjQntknHta1yrlJ+BlClRhsh17mRuao2XmtRxOgh/WZv7X8T
 updfubhRk4MveRGxRRp4WvEBRKO35+IK/+qKlXpcPWeVATWJo48n8AMU24UsJp2B7qox
 eBaA==
X-Gm-Message-State: AOAM5336UCDsrJaGwv101lw7Ee6N3kldQSsbdy/BDt0xRv8Hlr88V5bw
 PfTDtJpy8j4PDLTFxv2P3LI=
X-Google-Smtp-Source: ABdhPJycXucVgZmu6nLmid4Wm8D7owELy7xzF4D/w2z6jkZdhxTfGUfl//WngJBDuQUwCAYMBVYNdA==
X-Received: by 2002:a17:90b:3144:: with SMTP id
 ip4mr17617348pjb.153.1635973039942; 
 Wed, 03 Nov 2021 13:57:19 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id n14sm2512073pgd.68.2021.11.03.13.57.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 13:57:18 -0700 (PDT)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH stable 4.9 0/2] zsmalloc MAX_POSSIBLE_PHYSMEM_BITS
Date: Wed,  3 Nov 2021 13:57:12 -0700
Message-Id: <20211103205714.374801-1-f.fainelli@gmail.com>
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
 include/asm-generic/pgtable.h               | 13 +++++++++++++
 mm/zsmalloc.c                               | 13 +++++++------
 8 files changed, 32 insertions(+), 6 deletions(-)

-- 
2.25.1

