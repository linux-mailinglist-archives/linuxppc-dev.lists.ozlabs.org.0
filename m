Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC53C58B41C
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 08:47:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M0Cgm4LS8z3f1s
	for <lists+linuxppc-dev@lfdr.de>; Sat,  6 Aug 2022 16:47:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M0CfF0x8nz3bc8
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Aug 2022 16:45:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4M0Cf815H4z4x1L;
	Sat,  6 Aug 2022 16:45:52 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220803063152.1249270-1-mpe@ellerman.id.au>
References: <20220803063152.1249270-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64e: Fix kexec build error
Message-Id: <165976833143.1752861.12281953818502049510.b4-ty@ellerman.id.au>
Date: Sat, 06 Aug 2022 16:45:31 +1000
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
Cc: aik@ozlabs.ru
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 3 Aug 2022 16:31:52 +1000, Michael Ellerman wrote:
> When building ppc64_book3e_allmodconfig the build fails with:
> 
>   arch/powerpc/kexec/file_load_64.c:1063:14: error: implicit declaration of function ‘firmware_has_feature’
>    1063 |         if (!firmware_has_feature(FW_FEATURE_LPAR))
>         |              ^~~~~~~~~~~~~~~~~~~~
> 
> Add a direct include of asm/firmware.h to fix the error.
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64e: Fix kexec build error
      https://git.kernel.org/powerpc/c/4cfa6ff24a9744ba484521c38bea613134fbfcb3

cheers
