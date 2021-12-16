Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7846E47696A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 06:20:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JF0nH1zq8z3cPm
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Dec 2021 16:20:35 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=fR1h5KV8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JF0mc41VBz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Dec 2021 16:20:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=fR1h5KV8; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JF0mX3yRdz4xhj;
 Thu, 16 Dec 2021 16:19:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1639631998;
 bh=89BoGkjv1/HzkkQE/bALGUK22iLzNs4QmxP+8+6F9lQ=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fR1h5KV87GTW7GjPfIVIyQIG9Hug7SXkcc/qxR5eFG4yTs67E+JDDpf78OTHurZrV
 8XIvepCjiX6jKw/iZg6f9fWShGbP1iICRp5DCm6aNV0npZKQRBTHMiT6VQ0AwKHBU8
 wFqfgvkpGvjDoe12fZ1xG3s5G1Hlf3bAlR4LDAoUHAFUtNBtjHCxWJ9T04w9U/tW7t
 m96KyolUOhTyi9nUPd8ag4mV9MGbn1TUaeR6PPD15bNskmc50vUGk32nI4Ba8/zlGw
 scCMQo6dIgepMohRRxw8WyC4KopzFw012GHOQxR+zls4bhxCWsL/VRZgDjjZKe1/d4
 f02UJxh1tADTw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Rob Herring <robh@kernel.org>, John Crispin <john@phrozen.org>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Frank
 Rowand <frowand.list@gmail.com>
Subject: Re: [PATCH v4] of/fdt: Rework early_init_dt_scan_memory() to call
 directly
In-Reply-To: <20211215150102.1303588-1-robh@kernel.org>
References: <20211215150102.1303588-1-robh@kernel.org>
Date: Thu, 16 Dec 2021 16:19:56 +1100
Message-ID: <87r1adktxf.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: devicetree@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, Frank Rowand <frank.rowand@sony.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Rob Herring <robh@kernel.org> writes:
> Use of the of_scan_flat_dt() function predates libfdt and is discouraged
> as libfdt provides a nicer set of APIs. Rework
> early_init_dt_scan_memory() to be called directly and use libfdt.
>
> Cc: John Crispin <john@phrozen.org>
> Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: linux-mips@vger.kernel.org
> Cc: linuxppc-dev@lists.ozlabs.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Frank Rowand <frank.rowand@sony.com>
> Link: https://lore.kernel.org/r/20211208155839.4084795-1-robh@kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v4:
>  - Revert the changes to search for memory nodes at any level which were
>    accidentally committed.

Sorry for the mix up, this version works for me.

Tested-by: Michael Ellerman <mpe@ellerman.id.au>

cheers
