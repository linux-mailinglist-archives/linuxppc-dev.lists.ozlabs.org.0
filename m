Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1FD896A4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 07:13:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 466PBK2GPrzDqXL
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Aug 2019 15:13:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 466P4J3Rc6zDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Aug 2019 15:08:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.b="oDvVG3Fs"; 
 dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 466P4H6g4jz9sPV; Mon, 12 Aug 2019 15:07:59 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 466P4H5sBqz9sPL; Mon, 12 Aug 2019 15:07:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1565586479; bh=CU/IVBOZY4ovRPGfmMIyzlhYIcx/FjkhGpipSlv0MnU=;
 h=Date:From:To:Cc:Subject:From;
 b=oDvVG3FsOHrDwZDr66JuqL1WwKGgQFW6D2OqL5M32C4J4kpnKhiw0P0bXns46W2s6
 xRO15mubH/r6hBVcJpWjZg/eO8235otESO3Mjc5kZMuDrYA/cn2ZPzj/yZxbNtlxMi
 +jhb4XRyGNz1w4+8kvE9eoG8t3iwKZx5jSxL71pEVi9OKs5XsZdlhx7BuLT5lSd7Cl
 d3meypCKZclN+RxAIA6zmZc1Cysfp8qPDq6w3XEpL6UdCNIMMN0hN7pnAbTT3YYoOm
 jPYflPall27X7CLD6pt3f6cCPHW2FrB+NTKy60ronObIPyrEIIeluKXwe8nvN/ITfM
 b8KaranTZVs0w==
Date: Mon, 12 Aug 2019 15:06:23 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, kvm@vger.kernel.org
Subject: [PATCH 0/2] powerpc/xive: Fix race condition leading to host crashes
 and hangs
Message-ID: <20190812050623.ltla46gh5futsqv4@oak.ozlabs.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: kvm-ppc@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series fixes a race condition that has been observed in testing
on POWER9 machines running KVM guests.  An interrupt being freed by
free_irq() can have an instance present in a XIVE interrupt queue,
which can then be presented to the generic interrupt code after the
data structures for it have been freed, leading to a variety of
crashes and hangs.

This series is based on current upstream kernel source plus Cédric Le
Goater's patch "KVM: PPC: Book3S HV: XIVE: Free escalation interrupts
before disabling the VP", which is a pre-requisite for this series.
As it touches both KVM and generic PPC code, this series will probably
go in via Michael Ellerman's powerpc tree.

Paul.

 arch/powerpc/include/asm/xive.h         |  8 +++
 arch/powerpc/kvm/book3s_hv_rmhandlers.S | 23 ++++++---
 arch/powerpc/kvm/book3s_xive.c          | 31 ++++++++++++
 arch/powerpc/sysdev/xive/common.c       | 87 ++++++++++++++++++++++++---------
 4 files changed, 119 insertions(+), 30 deletions(-)
