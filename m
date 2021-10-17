Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0150C4308B4
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 14:34:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HXKF23jcMz3cVf
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Oct 2021 23:33:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HXKCn6JrGz2yYd
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Oct 2021 23:32:53 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HXKCn0Cs3z4xqS;
 Sun, 17 Oct 2021 23:32:53 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <77d99037782ac4b3c3b0124fc4ae80ce7b760b05.1634035228.git.christophe.leroy@csgroup.eu>
References: <77d99037782ac4b3c3b0124fc4ae80ce7b760b05.1634035228.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc: Set max_mapnr correctly
Message-Id: <163447392455.1159469.4550193906855122845.b4-ty@ellerman.id.au>
Date: Sun, 17 Oct 2021 23:32:04 +1100
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

On Tue, 12 Oct 2021 12:40:37 +0200, Christophe Leroy wrote:
> max_mapnr is used by virt_addr_valid() to check if a linear
> address is valid.
> 
> It must only include lowmem PFNs, like other architectures.
> 
> Problem detected on a system with 1G mem (Only 768M are mapped), with
> CONFIG_DEBUG_VIRTUAL and CONFIG_TEST_DEBUG_VIRTUAL, it didn't report
> virt_to_phys(VMALLOC_START), VMALLOC_START being 0xf1000000.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc: Set max_mapnr correctly
      https://git.kernel.org/powerpc/c/602946ec2f90d5bd965857753880db29d2d9a1e9

cheers
