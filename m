Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E5C13697C2E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:48:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyY063gYz3ftg
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 23:48:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyRN1YFDz3cjG
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 23:43:12 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PGyRN0Pj8z4x87;
	Wed, 15 Feb 2023 23:43:12 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20230206113902.1857123-1-mpe@ellerman.id.au>
References: <20230206113902.1857123-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v3] powerpc/pci: Add option for using pci_to_OF_bus_map
Message-Id: <167646482323.1421441.4084042305298979287.b4-ty@ellerman.id.au>
Date: Wed, 15 Feb 2023 23:40:23 +1100
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
Cc: pali@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 6 Feb 2023 22:39:02 +1100, Michael Ellerman wrote:
> From: Pali Rohár <pali@kernel.org>
> 
> The "pci-OF-bus-map" property was declared deprecated in 2006 [1] and to
> the best of everyone's knowledge is not used by anything anymore [2].
> 
> The creation of the property was disabled on powermac (arch/powerpc) in
> 2005 by commit 35499c0195e4 ("powerpc: Merge in 64-bit powermac
> support."). But it is still created by default on CHRP.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pci: Add option for using pci_to_OF_bus_map
      https://git.kernel.org/powerpc/c/5d2eb73aa0fd57844938a22bddc59f7bc8183924

cheers
