Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DA8474F37
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 01:28:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JDGLL6wk3z3dfh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Dec 2021 11:28:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JDGJk4GwRz2ywm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Dec 2021 11:26:46 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JDGJj61hvz4xhm;
 Wed, 15 Dec 2021 11:26:45 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Paul Mackerras <paulus@samba.org>
In-Reply-To: <2c7e421874e21b2fb87813d768cf662f630c2ad4.1638984999.git.christophe.leroy@csgroup.eu>
References: <2c7e421874e21b2fb87813d768cf662f630c2ad4.1638984999.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/powermac: Add additional missing
 lockdep_register_key()
Message-Id: <163952788299.919625.3266210464453181174.b4-ty@ellerman.id.au>
Date: Wed, 15 Dec 2021 11:24:42 +1100
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
Cc: Erhard Furtner <erhard_f@mailbox.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 8 Dec 2021 17:36:52 +0000, Christophe Leroy wrote:
> Commit df1f679d19ed ("powerpc/powermac: Add missing
> lockdep_register_key()") fixed a problem that was causing a WARNING.
> 
> There are two other places in the same file with the same problem
> originating from commit 9e607f72748d ("i2c_powermac: shut up lockdep
> warning").
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powermac: Add additional missing lockdep_register_key()
      https://git.kernel.org/powerpc/c/b149d5d45ac9171ed699a256f026c8ebef901112

cheers
