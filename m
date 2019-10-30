Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CFEEA4B8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 21:27:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 473KlB4LfnzF4BX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Oct 2019 07:27:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lca.pw
 (client-ip=2607:f8b0:4864:20::72e; helo=mail-qk1-x72e.google.com;
 envelope-from=cai@lca.pw; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lca.pw
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lca.pw header.i=@lca.pw header.b="FvKZArqV"; 
 dkim-atps=neutral
Received: from mail-qk1-x72e.google.com (mail-qk1-x72e.google.com
 [IPv6:2607:f8b0:4864:20::72e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 473Khn6fNjzF4lG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Oct 2019 07:25:42 +1100 (AEDT)
Received: by mail-qk1-x72e.google.com with SMTP id m16so3881512qki.11
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 13:25:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
 h=message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=KiFm2XT1/ex9pyBydKszuWy1JMFujhglMV+BmZKuRx8=;
 b=FvKZArqVg5c7lnvj3ny0bJF74EIWJqP3pvXLD4J3+mOSMFEBPxbo9BgJ+KEaSUBze4
 WQJCgxFBT+NqD4gA7Jq74eaTQ5WEKQBfdp2OIYdeB5ad3mh6DB++FjqUOvPK1R1le3Sp
 bkqMApjE3M/tR17+3EgezeNzv7rKXq9DgGfIIxLHN8cVAKKwBm14RymhMm699b0Xtdb5
 ngG/3T7cfsLqIv0E3igR3HK7Lk89z74QBgbw5yPcIXLmLo3lW2Z9KRq/nBUxsdY+AMhM
 EQsrgqvjpSs6pbIeek9OmD3IlDt/4+cU01ZLA5Mo54Rh9KqmlOt0ZJmBbV8KsqYTMu2V
 Ja0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
 :content-transfer-encoding;
 bh=KiFm2XT1/ex9pyBydKszuWy1JMFujhglMV+BmZKuRx8=;
 b=JUWmVrBuqN4nsGrs3CGlFx3YbA6AWIJzFc3XxosH/mxnQjRiR0n1zaDpeBkaRUB4+M
 3NhSiNF88aq5EWamsWf971ddodLMAJdNvl/P5wMdosG8xKlRBQhc5YI72NyBsUrD64M2
 1/K/KIRfksV01KED+8zO6o+OxaMZg/sX0OafBDEu6hujgbTmFYbik7kmrxEP5Qg2Awgp
 72RfsgXHTTi3LajmzwAuAOOsuI3p07L5ZsodPikciOna9QeHSVJAr8Ged2Uf1asxbpar
 7g9uBK1UjCqWFTdbjMvGeU68izi49ilCCKikwLw+wGssjV9BwtdI+TSrCos30JsdncYW
 RGgw==
X-Gm-Message-State: APjAAAV6FX2pj3z38ARzTqA46emmR9ZjI1zCkWUO99J1WwXpGgwmA0Um
 SpA+hL9zqHYF4M9GVcQVK0Zc4g==
X-Google-Smtp-Source: APXvYqyx0H3XsyanEpK1jniy58tWKZ3wda42vCC2p7wzRRQRjGWr6vlqi0Sn1CUS/nb0HAADenFj2Q==
X-Received: by 2002:ae9:f204:: with SMTP id m4mr1874942qkg.105.1572467139382; 
 Wed, 30 Oct 2019 13:25:39 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
 [66.187.233.206])
 by smtp.gmail.com with ESMTPSA id q7sm600893qkb.46.2019.10.30.13.25.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 13:25:38 -0700 (PDT)
Message-ID: <1572467136.5937.107.camel@lca.pw>
Subject: Section mismatch warnings on powerpc
From: Qian Cai <cai@lca.pw>
To: Michael Ellerman <mpe@ellerman.id.au>
Date: Wed, 30 Oct 2019 16:25:36 -0400
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Cc: Mauricio Faria de Oliveira <mauricfo@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Still see those,

WARNING: vmlinux.o(.text+0x2d04): Section mismatch in reference from the
variable __boot_from_prom to the function .init.text:prom_init()
The function __boot_from_prom() references
the function __init prom_init().
This is often because __boot_from_prom lacks a __init
annotation or the annotation of prom_init is wrong.

WARNING: vmlinux.o(.text+0x2ec8): Section mismatch in reference from the
variable start_here_common to the function .init.text:start_kernel()
The function start_here_common() references
the function __init start_kernel().
This is often because start_here_common lacks a __init
annotation or the annotation of start_kernel is wrong.

There is a patch around,

http://patchwork.ozlabs.org/patch/895442/

Does it still wait for Michael to come with some better names?
