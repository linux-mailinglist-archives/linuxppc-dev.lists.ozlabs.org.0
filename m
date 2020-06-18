Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DF57F1FF23D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 14:47:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49nhXv6TLczDqFG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jun 2020 22:47:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49nhK76QQQzDq7h
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jun 2020 22:37:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix)
 id 49nhK64BLQz9sTL; Thu, 18 Jun 2020 22:37:14 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49nhK55kyHz9sSF; Thu, 18 Jun 2020 22:37:13 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
In-Reply-To: <20200616135617.2937252-1-mpe@ellerman.id.au>
References: <20200616135617.2937252-1-mpe@ellerman.id.au>
Subject: Re: [PATCH 1/2] powerpc/syscalls: Use the number when building SPU
 syscall table
Message-Id: <159248379723.3471720.7761730589256580141.b4-ty@ellerman.id.au>
Date: Thu, 18 Jun 2020 22:37:13 +1000 (AEST)
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
Cc: linux-arch@ozlabs.org, linux-kernel@vger.kernel.org, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 16 Jun 2020 23:56:16 +1000, Michael Ellerman wrote:
> Currently the macro that inserts entries into the SPU syscall table
> doesn't actually use the "nr" (syscall number) parameter.
> 
> This does work, but it relies on the exact right number of syscall
> entries being emitted in order for the syscal numbers to line up with
> the array entries. If for example we had two entries with the same
> syscall number we wouldn't get an error, it would just cause all
> subsequent syscalls to be off by one in the spu_syscall_table.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc/syscalls: Use the number when building SPU syscall table
      https://git.kernel.org/powerpc/c/1497eea68624f6076bf3eaf66baec3771ea04045
[2/2] powerpc/syscalls: Split SPU-ness out of ABI
      https://git.kernel.org/powerpc/c/35e32a6cb5f694fda54a5f391917e4ceefa0fece

cheers
