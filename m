Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7636747BF8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 13:16:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JJFnL3BRGz3dcK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Dec 2021 23:16:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JJFlb10Gpz2xXV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Dec 2021 23:15:23 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JJFlX2Q1nz4xmx;
 Tue, 21 Dec 2021 23:15:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>
In-Reply-To: <20211126052133.1664375-1-npiggin@gmail.com>
References: <20211126052133.1664375-1-npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
Message-Id: <164008885069.2078648.8332268823209782371.b4-ty@ellerman.id.au>
Date: Tue, 21 Dec 2021 23:14:10 +1100
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
Cc: Haren Myneni <haren@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 26 Nov 2021 15:21:33 +1000, Nicholas Piggin wrote:
> KVM does not support VAS so guests always print a useless error on boot
> 
>     vas: HCALL(398) error -2, query_type 0, result buffer 0x57f2000
> 
> Change this to only print the message if the error is not H_FUNCTION.
> 
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/pseries/vas: Don't print an error when VAS is unavailable
      https://git.kernel.org/powerpc/c/0a006ace634dcaf1bbf9125fb8089a4a50bf33d6

cheers
