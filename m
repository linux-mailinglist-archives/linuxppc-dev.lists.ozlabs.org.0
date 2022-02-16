Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A9E4B87C0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 13:33:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JzHSY1dc3z3fPk
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Feb 2022 23:33:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org
 [IPv6:2404:9400:2221:ea00::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JzHNS3sgQz3cSg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Feb 2022 23:30:16 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JzHNS5lqJz4xv1;
 Wed, 16 Feb 2022 23:30:16 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
In-Reply-To: <cover.1630667612.git.christophe.leroy@csgroup.eu>
References: <cover.1630667612.git.christophe.leroy@csgroup.eu>
Subject: Re: [RFC PATCH v1 00/11] powerpc/machdep: Remove dust and convert to
 static calls
Message-Id: <164501434429.521186.17328213393681621470.b4-ty@ellerman.id.au>
Date: Wed, 16 Feb 2022 23:25:44 +1100
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

On Fri, 3 Sep 2021 11:18:34 +0000 (UTC), Christophe Leroy wrote:
> The purpose of this series is to convert machine dependent
> functions in structure ppc_md into static calls.
> 
> First part of the series remove some dust in and around machdep.h
> 
> Then some helpers are defined to abstract the access to ppc_md. structure.
> 
> [...]

Patches 3, 5, 7 and 8 applied to powerpc/next.

[03/11] powerpc/machdep: Remove CONFIG_PPC_HAS_FEATURE_CALLS
        https://git.kernel.org/powerpc/c/d6a6c725a20467f52a41270bdaad9565c66f3b7a
[05/11] powerpc/machdep: Move sys_ctrler_t definition into pmac.h
        https://git.kernel.org/powerpc/c/e6d03ac156db84422519aa8628efc210d24bf889
[07/11] powerpc/mpc86xx_hpcn: Remove obsolete statement
        https://git.kernel.org/powerpc/c/fae65a9ac8fd2221dbf034019fa18d72b2b0c8e9
[08/11] powerpc/corenet: Change criteria to set MPIC_ENABLE_COREINT
        https://git.kernel.org/powerpc/c/66ada2907864cafa4578b92926cb8bc0a4bc8c9c

cheers
