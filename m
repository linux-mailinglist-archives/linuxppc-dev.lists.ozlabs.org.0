Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BFECC1CBDA6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 07:13:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49JwMM5GrBzDqll
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 May 2020 15:13:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49JwBJ08NCzDr30
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 May 2020 15:05:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=ozlabs.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=ozlabs.org header.i=@ozlabs.org header.a=rsa-sha256
 header.s=201707 header.b=awm4grLC; dkim-atps=neutral
Received: by ozlabs.org (Postfix)
 id 49JwBH1w7Sz9sTC; Sat,  9 May 2020 15:05:27 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1003)
 id 49JwBH07bSz9sSg; Sat,  9 May 2020 15:05:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1589000727; bh=2RLlhhGaeasDfLb3fZBQy4a2iqXLcsXLFtSJuhb3m+E=;
 h=Date:From:To:Subject:From;
 b=awm4grLCjj6LV+VP49HcwJF024bKoDXh+yRQvQ/Hi7kxFXSjGSd5IX2bhW9D4rOUh
 ytCPar83aNcWuGnifp84r2+s9hDVIpIU1q5hudRLImPpx2zpjxwDzE447ME5PV8A/O
 Gwy03urS7JH/UBFeG93go6ETXbPsOcGeTEPXnXXNowVJlKkSPH5C+WivNaojcC/GJ8
 IDW+zvf36osoq+0p0OUkQOFI88F6Dl5+l++SJj9rHIbjmaY7jdO9aTMTq6QO/Amcad
 gM5xiQ5txxOFgFeTcvas4K+eKG+LO27SkD/KV5QOKRXR+jRs8Hn200S648CNd5dneG
 mBDfY4a62reGQ==
Date: Sat, 9 May 2020 15:01:03 +1000
From: Paul Mackerras <paulus@ozlabs.org>
To: linuxppc-dev@ozlabs.org, Benjamin Herrenschmidt <benh@ozlabs.org>,
 Michael Neuling <mikey@neuling.org>, Anton Blanchard <anton@ozlabs.org>
Subject: [PATCH RFC 0/4] Add support for Microwatt-based SoCs
Message-ID: <20200509050103.GA1464954@thinks.paulus.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This patch series adds support for running Linux on a Microwatt SoC
(system on chip) implementation on an FPGA.  Microwatt is a small
Power ISA implementation, targetted at FPGAs, aiming for PowerISA
v3.0B compliance.  It does not currently implement any floating-point
or vector instructions, hypervisor mode, big-endian mode, 32-bit mode,
or the HPT/SLB MMU facilities.  However, it does support enough to run
Linux (as of my "mmu" branch plus Ben's "litedram" branch").

Paul.
