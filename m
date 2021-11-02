Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BE8442D0E
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:45:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Pk1V77z3ddr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:45:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fs17Hnz2yPj
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:41 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fr6kfZz4xdF;
 Tue,  2 Nov 2021 22:38:40 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Haren Myneni <haren@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <20211015050345.GA1161918@embeddedor>
References: <20211015050345.GA1161918@embeddedor>
Subject: Re: [PATCH][next] powerpc/vas: Fix potential NULL pointer dereference
Message-Id: <163584790218.1845480.3122470991665187851.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:42 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-hardening@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 15 Oct 2021 00:03:45 -0500, Gustavo A. R. Silva wrote:
> (!ptr && !ptr->foo) strikes again. :)
> 
> The expression (!ptr && !ptr->foo) is bogus and in case ptr is NULL,
> it leads to a NULL pointer dereference: ptr->foo.
> 
> Fix this by converting && to ||
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/vas: Fix potential NULL pointer dereference
      https://git.kernel.org/powerpc/c/61cb9ac66b30374c7fd8a8b2a3c4f8f432c72e36

cheers
