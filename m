Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0773426B9E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 15:25:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQppM4cR2z2xZm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 00:25:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQpnV5yMsz2yKB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 00:24:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQpnV1lT6z4xbT;
 Sat,  9 Oct 2021 00:24:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Cédric Le Goater <clg@kaod.org>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210930102535.1047230-1-clg@kaod.org>
References: <20210930102535.1047230-1-clg@kaod.org>
Subject: Re: [PATCH] powerpc/pseries/msi: Add an empty irq_write_msi_msg()
 handler
Message-Id: <163369938268.3568929.18146693870031768535.b4-ty@ellerman.id.au>
Date: Sat, 09 Oct 2021 00:23:02 +1100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
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
Cc: Brian King <brking@linux.vnet.ibm.com>,
 Wen Xiong <wenxiong@linux.vnet.ibm.com>,
 Douglas Miller <dougmill@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 30 Sep 2021 12:25:35 +0200, Cédric Le Goater wrote:
> The IPR drivers tests for MSI support at probe time with MSI vector 0
> and when done, frees the IRQ with free_irq(). This test was introduced
> by 95fecd90397e ("ipr: add test for MSI interrupt support") as an
> improvement of commit 5a9ef25b14d3 ("[SCSI] ipr: add MSI support")
> because a boot failure was reported on a Bimini PowerPC system :
> 
>   https://x-lore.kernel.org/all/1242926159.3007.5.camel@localhost.localdomain/
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/pseries/msi: Add an empty irq_write_msi_msg() handler
      https://git.kernel.org/powerpc/c/5a4b0320783a19f877dd595813569b3c25f4ff81

cheers
