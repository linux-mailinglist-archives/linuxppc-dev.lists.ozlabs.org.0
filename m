Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B24D3293BE7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 14:39:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CFtVZ1yvVzDqQT
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Oct 2020 23:39:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CFt8Y2g9tzDqRG
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Oct 2020 23:23:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CFt8T0NzBz9sSn; Tue, 20 Oct 2020 23:23:52 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Neuling <mikey@neuling.org>, mpe@ellerman.id.au
In-Reply-To: <20201013043741.743413-1-mikey@neuling.org>
References: <20201013043741.743413-1-mikey@neuling.org>
Subject: Re: [PATCH 1/2] powerpc: Fix user data corruption with P9N DD2.1 VSX
 CI load workaround emulation
Message-Id: <160319651092.2348169.1397044759676064722.b4-ty@ellerman.id.au>
Date: Tue, 20 Oct 2020 23:23:52 +1100 (AEDT)
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 13 Oct 2020 15:37:40 +1100, Michael Neuling wrote:
> __get_user_atomic_128_aligned() stores to kaddr using stvx which is a
> VMX store instruction, hence kaddr must be 16 byte aligned otherwise
> the store won't occur as expected.
> 
> Unfortunately when we call __get_user_atomic_128_aligned() in
> p9_hmi_special_emu(), the buffer we pass as kaddr (ie. vbuf) isn't
> guaranteed to be 16B aligned. This means that the write to vbuf in
> __get_user_atomic_128_aligned() has the bottom bits of the address
> truncated. This results in other local variables being
> overwritten. Also vbuf will not contain the correct data which results
> in the userspace emulation being wrong and hence user data corruption.
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc: Fix undetected data corruption with P9N DD2.1 VSX CI load emulation
      https://git.kernel.org/powerpc/c/1da4a0272c5469169f78cd76cf175ff984f52f06
[2/2] selftests/powerpc: Make alignment handler test P9N DD2.1 vector CI load workaround
      https://git.kernel.org/powerpc/c/d1781f23704707d350b8c9006e2bdf5394bf91b2

cheers
