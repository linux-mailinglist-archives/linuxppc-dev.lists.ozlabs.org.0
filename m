Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C32B5850BC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:19:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSmT0scQz3gk1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:19:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk02Gv4z3g9X
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSjz5lGhz4x1d;
	Fri, 29 Jul 2022 23:17:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Pali Rohár <pali@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, Nick Child <nick.child@ibm.com>, Cédric Le Goater <clg@kaod.org>, Bjorn Helgaas <helgaas@kernel.org>
In-Reply-To: <20220706104308.5390-1-pali@kernel.org>
References: <20220706104308.5390-1-pali@kernel.org>
Subject: Re: [PATCH 0/5] powerpc/pci: Cleanup unused code and enable 256 PCI buses
Message-Id: <165909974438.253830.7502072560439859031.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:24 +1000
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

On Wed, 6 Jul 2022 12:43:03 +0200, Pali Rohár wrote:
> This patch series cleanup unused code by eliminating it at compile time
> and then enable usage of all 256 PCI buses per every PCI domain as
> currently PCI bus numbers have to be unique across all PCI domains.
> So first bus number of each PCI domain would be zero and not the bus
> number of the previous domain plus one. As such bus assignment changes
> BDF address of every PCI device on multi-domain system, this new
> "feature" is configurable by config option to prevent regressions.
> 
> [...]

Applied to powerpc/next.

[1/5] powerpc/pci: Hide pci_device_from_OF_node() for non-powermac code
      https://git.kernel.org/powerpc/c/a2954a7e47b60bb8d8c51f1b4d55af7585a4108a
[2/5] powerpc/pci: Make pcibios_make_OF_bus_map() static
      https://git.kernel.org/powerpc/c/407a767182d3dc87176aabddd7c109b36a5727e9
[3/5] powerpc/pci: Hide pci_create_OF_bus_map() for non-chrp code
      https://git.kernel.org/powerpc/c/704544588735b2e1115212dbba1c210b3687ff7a
[4/5] powerpc/pci: Disable filling pci-OF-bus-map for non-chrp/powermac
      https://git.kernel.org/powerpc/c/7f102d61983275ab68b5ac2715afa35c5f4ffd86
[5/5] powerpc/pci: Add config option for using all 256 PCI buses
      https://git.kernel.org/powerpc/c/5663568130825458a2a8535ccef0db9a1bf7be82

cheers
