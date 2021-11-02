Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B8442CD7
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:38:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7Fw06tTz2yPP
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:38:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7FX1VJWz2xDM
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:24 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7FW1t9Jz4xbs;
 Tue,  2 Nov 2021 22:38:23 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
References: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH 1/3] powerpc/nohash: Fix __ptep_set_access_flags() and
 ptep_set_wrprotect()
Message-Id: <163584791973.1845480.6138102753649053681.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:59 +1100
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

On Tue, 26 Oct 2021 07:39:24 +0200, Christophe Leroy wrote:
> Commit 26973fa5ac0e ("powerpc/mm: use pte helpers in generic code")
> changed those two functions to use pte helpers to determine which
> bits to clear and which bits to set.
> 
> This change was based on the assumption that bits to be set/cleared
> are always the same and can be determined by applying the pte
> manipulation helpers on __pte(0).
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/nohash: Fix __ptep_set_access_flags() and ptep_set_wrprotect()
      https://git.kernel.org/powerpc/c/b1b93cb7e794e914787bf7d9936b57a149cdee4f
[2/3] powerpc/book3e: Fix set_memory_x() and set_memory_nx()
      https://git.kernel.org/powerpc/c/b6cb20fdc2735f8b2e082937066c33fe376c2ee2
[3/3] powerpc/fsl_booke: Fix setting of exec flag when setting TLBCAMs
      https://git.kernel.org/powerpc/c/44c14509b0dabb909ad1ec28800893ea71762732

cheers
