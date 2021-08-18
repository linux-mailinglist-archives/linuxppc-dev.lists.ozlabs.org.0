Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA563F0540
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 15:50:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GqTmj6cc6z3f6b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 23:50:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4GqTgr3wRWz3cVr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 23:45:59 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GqTgp5V1Vz9sjJ; Wed, 18 Aug 2021 23:45:58 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Cédric Le Goater <clg@kaod.org>
In-Reply-To: <20210701132750.1475580-1-clg@kaod.org>
References: <20210701132750.1475580-1-clg@kaod.org>
Subject: Re: [PATCH v2 00/32] powerpc: Add MSI IRQ domains to PCI drivers
Message-Id: <162929391519.3619265.14294647871604174456.b4-ty@ellerman.id.au>
Date: Wed, 18 Aug 2021 23:38:35 +1000
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 1 Jul 2021 15:27:18 +0200, Cédric Le Goater wrote:
> This series adds support for MSI IRQ domains on top of the XICS (P8)
> and XIVE (P9/P10) IRQ domains for the PowerNV (baremetal) and pSeries
> (VM) platforms. It should simplify and improve IRQ affinity of PCI
> MSIs under these PowerPC platforms, specially for drivers distributing
> multiple RX/TX queues on the different CPUs of the system.
> 
> Data locality can still be improved with an interrupt controller node
> per chip but this requires FW changes. It could be done under OPAL.
> 
> [...]

Patches 1-31 applied to powerpc/next.

[01/32] powerpc/pseries/pci: Introduce __find_pe_total_msi()
        https://git.kernel.org/powerpc/c/786e5b102a0007d81579822eac23cb5bfaa0b65f
[02/32] powerpc/pseries/pci: Introduce rtas_prepare_msi_irqs()
        https://git.kernel.org/powerpc/c/e81202007363bd694b711f307f02320b5f98edaa
[03/32] powerpc/xive: Add support for IRQ domain hierarchy
        https://git.kernel.org/powerpc/c/14be098c5387eb93b794f299f3c3e2ddf6038ec7
[04/32] powerpc/xive: Ease debugging of xive_irq_set_affinity()
        https://git.kernel.org/powerpc/c/6c2ab2a5d634d4e30445ee5d52d5d1469bf74aa2
[05/32] powerpc/pseries/pci: Add MSI domains
        https://git.kernel.org/powerpc/c/a5f3d2c17b07e69166b93209f34a5fb8271a6810
[06/32] powerpc/xive: Drop unmask of MSIs at startup
        https://git.kernel.org/powerpc/c/5690bcae186084a8544b1819f0d89399268bd0cf
[07/32] powerpc/xive: Remove irqd_is_started() check when setting the affinity
        https://git.kernel.org/powerpc/c/292145a6e598c1e6633b8f5f607706b46f552ab9
[08/32] powerpc/pseries/pci: Add a domain_free_irqs() handler
        https://git.kernel.org/powerpc/c/07817a578a7a79638537480b8847dc7a12f293c5
[09/32] powerpc/pseries/pci: Add a msi_free() handler to clear XIVE data
        https://git.kernel.org/powerpc/c/9a014f456881e947bf8cdd8c984a207097e6c096
[10/32] powerpc/pseries/pci: Add support of MSI domains to PHB hotplug
        https://git.kernel.org/powerpc/c/174db9e7f775ce06fc6949c9abbe758b3eb8171c
[11/32] powerpc/powernv/pci: Introduce __pnv_pci_ioda_msi_setup()
        https://git.kernel.org/powerpc/c/2c50d7e99e39eba92b93210e740f3f9e5a06ba54
[12/32] powerpc/powernv/pci: Add MSI domains
        https://git.kernel.org/powerpc/c/0fcfe2247e75070361af2b6845030cada92cdbf8
[13/32] KVM: PPC: Book3S HV: Use the new IRQ chip to detect passthrough interrupts
        https://git.kernel.org/powerpc/c/ba418a0278265ad65f2f9544e743b7dbff3b994b
[14/32] KVM: PPC: Book3S HV: XIVE: Change interface of passthrough interrupt routines
        https://git.kernel.org/powerpc/c/e5e78b15113a73d0294141d9796969fa7b10fa3c
[15/32] KVM: PPC: Book3S HV: XIVE: Fix mapping of passthrough interrupts
        https://git.kernel.org/powerpc/c/51be9e51a8000ffc6a33083ceca9da9303ed4dc5
[16/32] powerpc/xics: Remove ICS list
        https://git.kernel.org/powerpc/c/298f6f952885eeb1f25461f085c6c238bcd9fc5e
[17/32] powerpc/xics: Rename the map handler in a check handler
        https://git.kernel.org/powerpc/c/248af248a8f45461662fb633eca4adf24ae704ad
[18/32] powerpc/xics: Give a name to the default XICS IRQ domain
        https://git.kernel.org/powerpc/c/7d14f6c60b76fa7f3f89d81a95385576ca33b483
[19/32] powerpc/xics: Add debug logging to the set_irq_affinity handlers
        https://git.kernel.org/powerpc/c/53b34e8db73af98fa652641bf490384dc665d0f2
[20/32] powerpc/xics: Add support for IRQ domain hierarchy
        https://git.kernel.org/powerpc/c/e4f0aa3b4731430ad73fb4485e97f751c7500668
[21/32] powerpc/powernv/pci: Customize the MSI EOI handler to support PHB3
        https://git.kernel.org/powerpc/c/bbb25af8fbdba4acaf955e412a84eb2eea48697c
[22/32] powerpc/pci: Drop XIVE restriction on MSI domains
        https://git.kernel.org/powerpc/c/679e30b9536eeb93bc8c9a39c0ddc77dec536f6b
[23/32] powerpc/xics: Drop unmask of MSIs at startup
        https://git.kernel.org/powerpc/c/1e661f81a522eadfe4bc5bb1ec9fbae27c13f163
[24/32] powerpc/pseries/pci: Drop unused MSI code
        https://git.kernel.org/powerpc/c/3005123eea0daa18d98602ab64b2ce3ad087d849
[25/32] powerpc/powernv/pci: Drop unused MSI code
        https://git.kernel.org/powerpc/c/6d9ba6121b1cf453985d08c141970a1b44cd9cf1
[26/32] powerpc/powernv/pci: Adapt is_pnv_opal_msi() to detect passthrough interrupt
        https://git.kernel.org/powerpc/c/f1a377f86f51b381cfc30bf2270f8a5f81e35ee9
[27/32] powerpc/xics: Fix IRQ migration
        https://git.kernel.org/powerpc/c/c80198a21792ac59412871e4e6fad5041c9be8e4
[28/32] powerpc/powernv/pci: Set the IRQ chip data for P8/CXL devices
        https://git.kernel.org/powerpc/c/5cd69651ceeed15e021cf7d19f1b1be0a80c0c7a
[29/32] powerpc/powernv/pci: Rework pnv_opal_pci_msi_eoi()
        https://git.kernel.org/powerpc/c/c325712b5f85e561ea89bae2ba5d0104e797e42c
[30/32] KVM: PPC: Book3S HV: XICS: Fix mapping of passthrough interrupts
        https://git.kernel.org/powerpc/c/1753081f2d445f9157550692fcc4221cd3ff0958
[31/32] powerpc/xive: Use XIVE domain under xmon and debugfs
        https://git.kernel.org/powerpc/c/59b2bc18b1492b46d45b6b6828ba098f09b9ba67

cheers
