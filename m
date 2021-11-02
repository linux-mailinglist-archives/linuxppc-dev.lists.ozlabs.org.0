Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D5442CF4
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:41:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7KG4sZVz3dwL
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:41:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Ff2V0jz2yPY
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:30 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Ff1ZQ4z4xcr;
 Tue,  2 Nov 2021 22:38:30 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <3cd40b682fb6f75bb40947b55ca0bac20cb3f995.1634136222.git.christophe.leroy@csgroup.eu>
References: <3cd40b682fb6f75bb40947b55ca0bac20cb3f995.1634136222.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Mark .opd section read-only
Message-Id: <163584789099.1845480.12874546703415674660.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:30 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 13 Oct 2021 16:43:54 +0200, Christophe Leroy wrote:
> .opd section contains function descriptors used to locate
> functions in the kernel. If someone is able to modify a
> function descriptor he will be able to run arbitrary
> kernel function instead of another.
> 
> To avoid that, move .opd section inside read-only memory.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Mark .opd section read-only
      https://git.kernel.org/powerpc/c/3091f5fc5f1df7741ddf326561384e0997eca2a1

cheers
