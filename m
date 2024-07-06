Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A3E9295CE
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 01:14:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WGmRF5pRmz3fQl
	for <lists+linuxppc-dev@lfdr.de>; Sun,  7 Jul 2024 09:14:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Received: from mail.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WGmQ14Ny1z3cPl
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  7 Jul 2024 09:12:57 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4WGmQ12mM1z4wnx;
	Sun,  7 Jul 2024 09:12:57 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240520062647.688667-1-mpe@ellerman.id.au>
References: <20240520062647.688667-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/sigaltstack: Fix ppc64 GCC build
Message-Id: <172030740415.964765.1736992644165546721.b4-ty@ellerman.id.au>
Date: Sun, 07 Jul 2024 09:10:04 +1000
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
Cc: ndesaulniers@google.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 20 May 2024 16:26:47 +1000, Michael Ellerman wrote:
> Building the sigaltstack test with GCC on 64-bit powerpc errors with:
> 
>   gcc -Wall     sas.c  -o /home/michael/linux/.build/kselftest/sigaltstack/sas
>   In file included from sas.c:23:
>   current_stack_pointer.h:22:2: error: #error "implement current_stack_pointer equivalent"
>      22 | #error "implement current_stack_pointer equivalent"
>         |  ^~~~~
>   sas.c: In function ‘my_usr1’:
>   sas.c:50:13: error: ‘sp’ undeclared (first use in this function); did you mean ‘p’?
>      50 |         if (sp < (unsigned long)sstack ||
>         |             ^~
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/sigaltstack: Fix ppc64 GCC build
      https://git.kernel.org/powerpc/c/17c743b9da9e0d073ff19fd5313f521744514939

cheers
