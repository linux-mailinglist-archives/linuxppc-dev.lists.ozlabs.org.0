Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A4CA3F9A4B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 15:35:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gx10z3dbhz3ghW
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 23:34:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ellerman.id.au; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gx0qS5nMQz3f0D
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 23:26:44 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Gx0qQ66mqz9s1l;
 Fri, 27 Aug 2021 23:26:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nathan Chancellor <nathan@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20210816185711.21563-1-nathan@kernel.org>
References: <20210816185711.21563-1-nathan@kernel.org>
Subject: Re: [PATCH] powerpc/xive: Do not mark xive_request_ipi() as __init
Message-Id: <163007069928.56462.2139354750294195638.b4-ty@ellerman.id.au>
Date: Fri, 27 Aug 2021 23:24:59 +1000
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 clang-built-linux@googlegroups.com, Paul Mackerras <paulus@samba.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 16 Aug 2021 11:57:11 -0700, Nathan Chancellor wrote:
> Compiling ppc64le_defconfig with clang-14 shows a modpost warning:
> 
> WARNING: modpost: vmlinux.o(.text+0xa74e0): Section mismatch in
> reference from the function xive_setup_cpu_ipi() to the function
> .init.text:xive_request_ipi()
> The function xive_setup_cpu_ipi() references
> the function __init xive_request_ipi().
> This is often because xive_setup_cpu_ipi lacks a __init
> annotation or the annotation of xive_request_ipi is wrong.
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc/xive: Do not mark xive_request_ipi() as __init
      https://git.kernel.org/powerpc/c/3f78c90f9eb2e228f44ecc8f4377753f0e11dbab

cheers
