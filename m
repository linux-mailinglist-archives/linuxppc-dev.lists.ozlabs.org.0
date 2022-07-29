Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A0F225850C2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 15:21:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LvSpW4ljmz3h6Q
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 23:21:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LvSk352Zhz3gDC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 23:17:47 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LvSk31xBBz4x1P;
	Fri, 29 Jul 2022 23:17:47 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>, Tyrel Datwyler <tyreld@linux.ibm.com>, Pali Rohár <pali@kernel.org>, Guowen Shan <gshan@redhat.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Bjorn Helgaas <helgaas@kernel.org>
In-Reply-To: <20220706102148.5060-1-pali@kernel.org>
References: <20220706102148.5060-1-pali@kernel.org>
Subject: Re: [PATCH v2 1/2] powerpc/pci: Add config option for using OF 'reg' for PCI domain
Message-Id: <165909977663.253830.17432035953486470333.b4-ty@ellerman.id.au>
Date: Fri, 29 Jul 2022 23:02:56 +1000
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

On Wed, 6 Jul 2022 12:21:47 +0200, Pali Rohár wrote:
> Since commit 63a72284b159 ("powerpc/pci: Assign fixed PHB number based on
> device-tree properties"), powerpc kernel always fallback to PCI domain
> assignment from OF / Device Tree 'reg' property of the PCI controller.
> 
> In most cases 'reg' property is not zero and therefore there it cause that
> PCI domain zero is not present in system anymore.
> 
> [...]

Patch 2 applied to powerpc/next.

[2/2] powerpc/pci: Prefer PCI domain assignment via DT 'linux,pci-domain' and alias
      https://git.kernel.org/powerpc/c/0fe1e96fef0a5c53b4c0d1500d356f3906000f81

cheers
