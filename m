Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D68CB1C24C8
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 13:41:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49DnJK1v8dzDqZb
	for <lists+linuxppc-dev@lfdr.de>; Sat,  2 May 2020 21:41:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tzO+XS0P; dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Dmqf0FrjzDr6y
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  2 May 2020 21:19:57 +1000 (AEST)
Received: by mail-pf1-x442.google.com with SMTP id r14so2899036pfg.2
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 02 May 2020 04:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmNc7DFWOtqgi/Q5+vF/0RpZsApQouB9cKkSuyIHVOU=;
 b=tzO+XS0P2WvMTNuRfoJ70APahE+3x9yu0VJ3DDyTLvdkHdBwbaazB/pTs7PGV3MSFz
 g3SI3yJQH6rYSb9JW/+dRDfEs2vqCS/XDIsX+oaTNvMccSO/2mWu77Tm2/rSp6QiAAjb
 ugrv1jJHd25N5vzdYzRXg5Xe+5mk8TrodlNvQXXVOHOWE2rmoUuoxvuwrVKwY94JsmXn
 c+60Ukes1qqm9NMgnkj4q+IMR/RuPSSeGUqsQFjWtewaOL2K3f6SJcDipkJgSjT9rTbt
 nycYvbF0imFQ//amLGT5+wSMia+IXcqTs5e3yQDurzhhsA9lN8wDMMX6pvULPFhbyGr1
 qkRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LmNc7DFWOtqgi/Q5+vF/0RpZsApQouB9cKkSuyIHVOU=;
 b=euAyPorw6RtycQw0U/1TYcS1VzfZlX+57cHypWMfeHxFy/ckAs/grh4fZ3ILLk6AwR
 qhErCPxxDI0B2QjI9Ov1tBdmQlFhSJSrg74thdnqi7SLmW69ghdlzbI/0i9KPN1iU4wb
 eOOUV9WousbCjD+XGtbNVbzHh0dTolCXmsX6OqdERUNndPyIGyD/hyo85QF1tINPVyHG
 SPM9W9wWB+EWmI8Z10ba2PEo4djvVvRFD8YV/x6ZQc/OWhTWTP3iYg5g2GDpkksfvd7m
 67FQElRw856vclsLBLSQSsZHbHbwceuCV/UvL8rp2RMkwl2qFAPrdY50ayG6P9h+1Peq
 FDqg==
X-Gm-Message-State: AGi0PuaYPS95S1LItLxt+bo7J9eYOERV6ueL80tTMUrkFaxX7aefNJNA
 1TVMsp/dNiPsOds/Avn5ht0Vzj9k
X-Google-Smtp-Source: APiQypL7PS8bTZOskcTO8BmrZgWgClVssrQ4CAYUBej5DQ+/3Rui5wQ93QoOLoiG8P8+2pwou2MIpg==
X-Received: by 2002:a63:ef05:: with SMTP id u5mr8031955pgh.237.1588418390624; 
 Sat, 02 May 2020 04:19:50 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com ([203.220.177.17])
 by smtp.gmail.com with ESMTPSA id q15sm3862790pgj.52.2020.05.02.04.19.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 May 2020 04:19:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [RFC PATCH 00/10] OPAL V4
Date: Sat,  2 May 2020 21:19:04 +1000
Message-Id: <20200502111914.166578-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"OPAL V4" is a proposed new approach to running and calling PowerNV
OPAL firmware.

OPAL calls use the caller's (kernel) stack, which vastly simplifies
re-entrancy concerns around doing things like idle and machine check
OPAL drivers.

The OS can get at symbol and assert metadata to help with debugging
firmware.

OPAL may be called (and will run in) virtual mode in its own address
space.

And the operating system provides some services to the firmware,
message logging, for example.

This fairly close to the point where we could run OPAL in user-mode
with a few services (scv could be used to call back to the OS) for
privileged instructions, we may yet do this, but one thing that's
stopped me is it would require a slower API. As it is now with LE
skiboot and LE Linux, the OPAL call is basically a shared-library
function call, which is fast enough that it's feasible to
implement a performant CPU idle driver, which is a significant
motivation.

Anyway this is up and running, coming together pretty well just needs
a bit of polishing and more documentation. I'll post the skiboot
patches on the skiboot list.

Nicholas Piggin (10):
  kallsyms: architecture specific symbol lookups
  powerpc/powernv: Wire up OPAL address lookups
  powerpc/powernv: Use OPAL_REPORT_TRAP to cope with trap interrupts
    from OPAL
  powerpc/powernv: avoid polling in opal_get_chars
  powerpc/powernv: Don't translate kernel addresses to real addresses
    for OPAL
  powerpc/powernv: opal use new opal call entry point if it exists
  powerpc/powernv: Add OPAL_FIND_VM_AREA API
  powerpc/powernv: Set up an mm context to call OPAL in
  powerpc/powernv: OPAL V4 OS services
  powerpc/powernv: OPAL V4 Implement vm_map/unmap service

 arch/powerpc/Kconfig                          |   1 +
 arch/powerpc/boot/opal.c                      |   5 +
 arch/powerpc/include/asm/opal-api.h           |  29 +-
 arch/powerpc/include/asm/opal.h               |   8 +
 arch/powerpc/kernel/traps.c                   |  39 ++-
 arch/powerpc/perf/imc-pmu.c                   |   4 +-
 arch/powerpc/platforms/powernv/npu-dma.c      |   2 +-
 arch/powerpc/platforms/powernv/opal-call.c    |  58 ++++
 arch/powerpc/platforms/powernv/opal-dump.c    |   2 +-
 arch/powerpc/platforms/powernv/opal-elog.c    |   4 +-
 arch/powerpc/platforms/powernv/opal-flash.c   |   6 +-
 arch/powerpc/platforms/powernv/opal-hmi.c     |   2 +-
 arch/powerpc/platforms/powernv/opal-nvram.c   |   4 +-
 .../powerpc/platforms/powernv/opal-powercap.c |   2 +-
 arch/powerpc/platforms/powernv/opal-psr.c     |   2 +-
 arch/powerpc/platforms/powernv/opal-xscom.c   |   2 +-
 arch/powerpc/platforms/powernv/opal.c         | 289 ++++++++++++++++--
 arch/powerpc/platforms/powernv/pci-ioda.c     |   2 +-
 arch/powerpc/sysdev/xive/native.c             |   2 +-
 drivers/char/powernv-op-panel.c               |   3 +-
 drivers/i2c/busses/i2c-opal.c                 |  12 +-
 drivers/mtd/devices/powernv_flash.c           |   4 +-
 include/linux/kallsyms.h                      |  20 ++
 kernel/kallsyms.c                             |  13 +-
 lib/Kconfig                                   |   3 +
 25 files changed, 461 insertions(+), 57 deletions(-)

-- 
2.23.0

