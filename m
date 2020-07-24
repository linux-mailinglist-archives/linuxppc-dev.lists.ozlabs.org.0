Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC37222C960
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Jul 2020 17:43:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BCtl13bhqzF0gb
	for <lists+linuxppc-dev@lfdr.de>; Sat, 25 Jul 2020 01:43:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BCqh53bt7zDr48
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Jul 2020 23:25:25 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BCqgz4vYxz9sVV; Fri, 24 Jul 2020 23:25:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org,
 "wenxiong@linux.vnet.ibm.com" <wenxiong@linux.vnet.ibm.com>
In-Reply-To: <1594651173-32166-1-git-send-email-wenxiong@linux.vnet.ibm.com>
References: <1594651173-32166-1-git-send-email-wenxiong@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/1 V4] : PCIE PHB reset
Message-Id: <159559697210.1657499.10126628446984815351.b4-ty@ellerman.id.au>
Date: Fri, 24 Jul 2020 23:25:18 +1000 (AEST)
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
Cc: brking@linux.vnet.ibm.com, oohall@gmail.com, bobroff@linux.ibm.com,
 wenxiong@us.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 13 Jul 2020 09:39:33 -0500, wenxiong@linux.vnet.ibm.com wrote:
> Several device drivers hit EEH(Extended Error handling) when triggering
> kdump on Pseries PowerVM. This patch implemented a reset of the PHBs
> in pci general code when triggering kdump. PHB reset stop all PCI
> transactions from normal kernel. We have tested the patch in several
> enviroments:
> - direct slot adapters
> - adapters under the switch
> - a VF adapter in PowerVM
> - a VF adapter/adapter in KVM guest.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: PCIE PHB reset
      https://git.kernel.org/powerpc/c/5a090f7c363fdc09b99222eae679506a58e7cc68

cheers
