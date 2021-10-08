Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9DE426B9D
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Oct 2021 15:24:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HQpny0nWLz3c6l
	for <lists+linuxppc-dev@lfdr.de>; Sat,  9 Oct 2021 00:24:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HQpnV21vwz2yKB
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  9 Oct 2021 00:24:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HQpnT0cp5z4xbR;
 Sat,  9 Oct 2021 00:24:29 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <0d0c4d0f050a637052287c09ba521bad960a2790.1631715131.git.christophe.leroy@csgroup.eu>
References: <0d0c4d0f050a637052287c09ba521bad960a2790.1631715131.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/32s: Fix kuap_kernel_restore()
Message-Id: <163369938390.3568929.9026666512859787724.b4-ty@ellerman.id.au>
Date: Sat, 09 Oct 2021 00:23:03 +1100
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
Cc: Stan Johnson <userm57@yahoo.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Finn Thain <fthain@linux-m68k.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 15 Sep 2021 16:12:24 +0200, Christophe Leroy wrote:
> At interrupt exit, kuap_kernel_restore() calls kuap_unclok() with the
> value contained in regs->kuap. However, when regs->kuap contains
> 0xffffffff it means that KUAP was not unlocked so calling
> kuap_unlock() is unrelevant and results in jeopardising the contents
> of kernel space segment registers.
> 
> So check that regs->kuap doesn't contain KUAP_NONE before calling
> kuap_unlock(). In the meantime it also means that if KUAP has not
> been correcly locked back at interrupt exit, it must be locked
> before continuing. This is done by checking the content of
> current->thread.kuap which was returned by kuap_get_and_assert_locked()
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/32s: Fix kuap_kernel_restore()
      https://git.kernel.org/powerpc/c/d93f9e23744b7bf11a98b2ddb091d129482ae179

cheers
