Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D015850C1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:21:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSp61yjsz3h1K
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk25mlXz3fCm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:46 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSk24PfHz4xG3;
	Fri, 29 Jul 2022 23:17:46 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Pali Rohár <pali@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
In-Reply-To: <20220706101043.4867-1-pali@kernel.org>
References: <20220706101043.4867-1-pali@kernel.org>
Subject: Re: [PATCH] powerpc/fsl-pci: Fix Class Code of PCIe Root Port
Message-Id: <165909973844.253830.2407063568858087726.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:18 +1000
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
Cc: linux-pci@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 6 Jul 2022 12:10:43 +0200, Pali Rohár wrote:
> By default old pre-3.0 Freescale PCIe controllers reports invalid PCI Class
> Code 0x0b20 for PCIe Root Port. It can be seen by lspci -b output on P2020
> board which has this pre-3.0 controller:
> 
>   $ lspci -bvnn
>   00:00.0 Power PC [0b20]: Freescale Semiconductor Inc P2020E [1957:0070] (rev 21)
>           !!! Invalid class 0b20 for header type 01
>           Capabilities: [4c] Express Root Port (Slot-), MSI 00
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/fsl-pci: Fix Class Code of PCIe Root Port
      https://git.kernel.org/powerpc/c/0c551abfa004ce154d487d91777bf221c808a64f

cheers
