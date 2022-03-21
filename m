Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D8B4E1FC0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 06:07:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KMN0J3wjkz3bkk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Mar 2022 16:07:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KMMzY5v6Nz306r
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Mar 2022 16:06:49 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KMMzR5z0Xz4xPv;
 Mon, 21 Mar 2022 16:06:43 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220318034219.1188008-1-mpe@ellerman.id.au>
References: <20220318034219.1188008-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries: Fix use after free in
 remove_phb_dynamic()
Message-Id: <164783915556.1783931.7161083625338009804.b4-ty@ellerman.id.au>
Date: Mon, 21 Mar 2022 16:05:55 +1100
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
Cc: zdai@linux.ibm.com, sachinp@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 18 Mar 2022 14:42:19 +1100, Michael Ellerman wrote:
> In remove_phb_dynamic() we use &phb->io_resource, after we've called
> device_unregister(&host_bridge->dev). But the unregister may have freed
> phb, because pcibios_free_controller_deferred() is the release function
> for the host_bridge.
> 
> If there are no outstanding references when we call device_unregister()
> then phb will be freed out from under us.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries: Fix use after free in remove_phb_dynamic()
      https://git.kernel.org/powerpc/c/fe2640bd7a62f1f7c3f55fbda31084085075bc30

cheers
