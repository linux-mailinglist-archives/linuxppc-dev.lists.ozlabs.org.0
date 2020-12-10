Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 512052D594E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 12:36:22 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsBh21sLKzDqTj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 22:36:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with UTF8SMTPS id 4CsBXD354JzDqc4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:29:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXC5jV5z9sWC; Thu, 10 Dec 2020 22:29:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201122073828.15446-1-aik@ozlabs.ru>
References: <20201122073828.15446-1-aik@ozlabs.ru>
Subject: Re: [PATCH kernel v2] powerpc/powernv/npu: Do not attempt NPU2 setup
 on POWER8NVL NPU
Message-Id: <160756607231.1313423.446788704280173276.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:29:31 +1100 (AEDT)
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
Cc: Leonardo Augusto Guimarães Garcia <lagarcia@br.ibm.com>, kvm-ppc@vger.kernel.org, stable@vger.kernel.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, 22 Nov 2020 18:38:28 +1100, Alexey Kardashevskiy wrote:
> We execute certain NPU2 setup code (such as mapping an LPID to a device
> in NPU2) unconditionally if an Nvlink bridge is detected. However this
> cannot succeed on POWER8NVL machines and errors appear in dmesg. This is
> harmless as skiboot returns an error and the only place we check it is
> vfio-pci but that code does not get called on P8+ either.
> 
> This adds a check if pnv_npu2_xxx helpers are called on a machine with
> NPU2 which initializes pnv_phb::npu in pnv_npu2_init();
> pnv_phb::npu==NULL on POWER8/NVL (Naples).
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/npu: Do not attempt NPU2 setup on POWER8NVL NPU
      https://git.kernel.org/powerpc/c/b1198a88230f2ce50c271e22b82a8b8610b2eea9

cheers
