Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B16145D78A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 10:47:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J0Cj83VKfz3c6k
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 20:47:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J0Chn6pLPz2yQG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 20:47:21 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4J0Chm5pk4z4xbs;
 Thu, 25 Nov 2021 20:47:20 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <bc683d499a411730504b132a924de0ccc2ef1f79.1636971137.git.christophe.leroy@csgroup.eu>
References: <bc683d499a411730504b132a924de0ccc2ef1f79.1636971137.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v3] powerpc/code-patching: Improve verification of
 patchability
Message-Id: <163783299124.1228879.4298818921531087489.b4-ty@ellerman.id.au>
Date: Thu, 25 Nov 2021 20:36:31 +1100
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
Cc: Michael Neuling <mikey@neuling.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 15 Nov 2021 11:12:22 +0100, Christophe Leroy wrote:
> Today, patch_instruction() assumes that it is called exclusively on
> valid addresses, and only checks that it is not called on an init
> address after init section has been freed.
> 
> Improve verification by calling kernel_text_address() instead.
> 
> kernel_text_address() already includes a verification of
> initmem release.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/code-patching: Improve verification of patchability
      https://git.kernel.org/powerpc/c/8b8a8f0ab3f5519e45c526f826a655817486c5bb

cheers
