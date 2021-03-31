Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C97A34F623
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 03:19:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F97lC4Xq4z3ddK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 12:19:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F97Xm499jz3cCf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Mar 2021 12:10:32 +1100 (AEDT)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4F97Xm1ZNmz9sjD; Wed, 31 Mar 2021 12:10:31 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>,
 Nathan Chancellor <nathan@kernel.org>
In-Reply-To: <20210302195013.2626335-1-nathan@kernel.org>
References: <20210302195013.2626335-1-nathan@kernel.org>
Subject: Re: [PATCH] powerpc/fadump: Mark fadump_calculate_reserve_size as
 __init
Message-Id: <161715296549.226945.14575193524004441168.b4-ty@ellerman.id.au>
Date: Wed, 31 Mar 2021 12:09:25 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2 Mar 2021 12:50:14 -0700, Nathan Chancellor wrote:
> If fadump_calculate_reserve_size() is not inlined, there is a modpost
> warning:
> 
> WARNING: modpost: vmlinux.o(.text+0x5196c): Section mismatch in
> reference from the function fadump_calculate_reserve_size() to the
> function .init.text:parse_crashkernel()
> The function fadump_calculate_reserve_size() references
> the function __init parse_crashkernel().
> This is often because fadump_calculate_reserve_size lacks a __init
> annotation or the annotation of parse_crashkernel is wrong.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/fadump: Mark fadump_calculate_reserve_size as __init
      https://git.kernel.org/powerpc/c/fbced1546eaaab57a32e56c974ea8acf10c6abd8

cheers
