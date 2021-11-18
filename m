Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB953456215
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Nov 2021 19:12:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hw7FB0F4Jz3c9Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Nov 2021 05:12:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.167.172;
 helo=mail-oi1-f172.google.com; envelope-from=robherring2@gmail.com;
 receiver=<UNKNOWN>)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hw7Dg4Qsfz2yP3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Nov 2021 05:12:17 +1100 (AEDT)
Received: by mail-oi1-f172.google.com with SMTP id be32so15984808oib.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Nov 2021 10:12:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZWdr6e4SiKEwyVeW7jig9nB/OfdKCWQxGTViJArBtNk=;
 b=X3avFPaUNpA8XDWVNeZGoGUnLODN+ZBNmCrLLzH1N1MUNqy9f6uGKppEhAMAryLWQ6
 shKv1fT1mbrW24ilzHi9ppiawn4vfOguq52ogZzP9oXcwDmRKsET01NChPYYz1otYrLr
 dYDBCqfF7gDQXcVSAJfFZC7ipvpzCWpo65RKl3tMJrdIXJSnRK9ZKZXlMPVzoZesokFg
 6q4rUEabhcXqeDzHuPFFlH3lDUizHNfkgyD5exksXzM/h80twgHfunRwb3o1LDSnyDSX
 m1wzV8cezm6ojxvEgIdD5Nz06g0AMqPpUWlvMBmyb+q8K0UmMb5FpfcAkDKOF+zxOr/P
 yxNA==
X-Gm-Message-State: AOAM531i64my5pibrHi+aOMrP9Tqgp98s5LHQ+fq4F2BClrO5aj8cyaq
 iWR9LN3Z32zWJJXa0H/sLQ==
X-Google-Smtp-Source: ABdhPJyMTHkFTgzUFk6reybeEUonyuO0UVS3U62hmM+wu1p7V7zF8Vjh3UeI1rSTPyE7qMTSz5OFmg==
X-Received: by 2002:aca:7c3:: with SMTP id 186mr9614934oih.60.1637259134717;
 Thu, 18 Nov 2021 10:12:14 -0800 (PST)
Received: from xps15.herring.priv (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.googlemail.com with ESMTPSA id n20sm99339ooe.7.2021.11.18.10.12.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 10:12:14 -0800 (PST)
From: Rob Herring <robh@kernel.org>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Frank Rowand <frowand.list@gmail.com>, John Crispin <john@phrozen.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [PATCH 0/3] of/fdt: Rework early FDT scanning functions
Date: Thu, 18 Nov 2021 12:12:09 -0600
Message-Id: <20211118181213.1433346-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The early FDT scanning functions use of_scan_flat_dt() which implements 
its own node walking method. This function predates libfdt and is an 
unnecessary indirection. This series reworks 
early_init_dt_scan_chosen(), early_init_dt_scan_root(), and 
early_init_dt_scan_memory() to be called directly and use libfdt calls.

Ultimately, I want to remove of_scan_flat_dt(). Most of the remaining 
of_scan_flat_dt() users are in powerpc.

Rob


Rob Herring (3):
  of/fdt: Rework early_init_dt_scan_chosen() to call directly
  of/fdt: Rework early_init_dt_scan_root() to call directly
  of/fdt: Rework early_init_dt_scan_memory() to call directly

 arch/mips/ralink/of.c                |  16 +---
 arch/powerpc/kernel/prom.c           |  22 ++---
 arch/powerpc/mm/nohash/kaslr_booke.c |   4 +-
 drivers/of/fdt.c                     | 121 ++++++++++++++-------------
 include/linux/of_fdt.h               |   9 +-
 5 files changed, 79 insertions(+), 93 deletions(-)

-- 
2.32.0

