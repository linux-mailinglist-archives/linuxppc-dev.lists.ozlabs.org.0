Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 196F131976F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 01:27:25 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DcDpf2zKyzDwwk
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 11:27:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DcDf21k5KzDwl6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 11:19:54 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4DcDf14nxLz9sCD; Fri, 12 Feb 2021 11:19:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 broonie@kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <99bf008e2970de7f8ed3225cda69a6d06ae1a644.1612866360.git.christophe.leroy@csgroup.eu>
References: <99bf008e2970de7f8ed3225cda69a6d06ae1a644.1612866360.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] spi: mpc52xx: Avoid using get_tbl()
Message-Id: <161308904751.3606979.3399981869225283560.b4-ty@ellerman.id.au>
Date: Fri, 12 Feb 2021 11:19:53 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 9 Feb 2021 10:26:21 +0000 (UTC), Christophe Leroy wrote:
> get_tbl() is confusing as it returns the content TBL register
> on PPC32 but the concatenation of TBL and TBU on PPC64.
> 
> Use mftb() instead.
> 
> This will allow the removal of get_tbl() in a following patch.

Applied to powerpc/next.

[1/3] spi: mpc52xx: Avoid using get_tbl()
      https://git.kernel.org/powerpc/c/e10656114d32c659768e7ca8aebaaa6ac6e959ab
[2/3] powerpc/time: Avoid using get_tbl()
      https://git.kernel.org/powerpc/c/55d68df623eb679cc91f61137f14751e7f369662
[3/3] powerpc/time: Remove get_tbl()
      https://git.kernel.org/powerpc/c/132f94f133961d18af615cb3503368e59529e9a8

cheers
