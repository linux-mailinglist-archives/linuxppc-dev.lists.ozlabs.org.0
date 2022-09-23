Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA12A5E793A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 13:15:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYqMC3xD6z3fGq
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 21:15:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYqLp0WlWz3f8M
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 21:15:14 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYqLn6M8Lz4xFv;
	Fri, 23 Sep 2022 21:15:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20220906010313.1296714-1-mpe@ellerman.id.au>
References: <20220906010313.1296714-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pasemi: Use of_root in pas_pci_init()
Message-Id: <166393170145.499516.14147367798894411501.b4-ty@ellerman.id.au>
Date: Fri, 23 Sep 2022 21:15:01 +1000
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 6 Sep 2022 11:03:13 +1000, Michael Ellerman wrote:
> Currently in pas_pci_init() a reference to the root node is leaked due
> to a missing of_node_put(). Instead just use of_root directly.
> 
> Note that converting to of_find_compatible_node(NULL, ...) would
> not be entirely equivalent, because that would check the compatible
> property of the root node, whereas using of_root skips checking the root
> node and start the search at the first child of the root.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pasemi: Use of_root in pas_pci_init()
      https://git.kernel.org/powerpc/c/c28c2d4abdf95655001992c4f52dc243ba00cac3

cheers
