Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 26CCB442CFF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 12:43:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hk7M70c8Vz3fDy
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Nov 2021 22:43:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hk7Fh5w7cz2ymv
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Nov 2021 22:38:32 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Hk7Fh55K6z4xd9;
 Tue,  2 Nov 2021 22:38:32 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>
In-Reply-To: <fb324f1c8f2ddb57cf6aad1cea26329558f1c1c0.1631887021.git.christophe.leroy@csgroup.eu>
References: <fb324f1c8f2ddb57cf6aad1cea26329558f1c1c0.1631887021.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH v2] powerpc/8xx: Simplify TLB handling
Message-Id: <163584791161.1845480.3784540326503366028.b4-ty@ellerman.id.au>
Date: Tue, 02 Nov 2021 21:11:51 +1100
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

On Fri, 17 Sep 2021 15:57:12 +0200, Christophe Leroy wrote:
> In the old days, TLB handling for 8xx was using tlbie and tlbia
> instructions directly as much as possible.
> 
> But commit f048aace29e0 ("powerpc/mm: Add SMP support to no-hash
> TLB handling") broke that by introducing out-of-line unnecessary
> complex functions for booke/smp which don't have tlbie/tlbia
> instructions and require more complex handling.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/8xx: Simplify TLB handling
      https://git.kernel.org/powerpc/c/63f501e07a8557bc8ab79d17ef76ae21df1e395d

cheers
