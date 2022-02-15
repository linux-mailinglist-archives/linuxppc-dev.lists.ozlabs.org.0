Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53E014B62F0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 06:37:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JyVGz5ymvz3fMD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 16:37:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JyV6N5ndlz3cYn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 16:30:20 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4JyV6P0VShz4y4n;
 Tue, 15 Feb 2022 16:30:21 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Wedson Almeida Filho <wedsonaf@google.com>
In-Reply-To: <20220202055123.2144842-1-wedsonaf@google.com>
References: <20220202055123.2144842-1-wedsonaf@google.com>
Subject: Re: [PATCH] powerpc/module_64: use module_init_section instead of
 patching names
Message-Id: <164490279930.270256.11789081622461037215.b4-ty@ellerman.id.au>
Date: Tue, 15 Feb 2022 16:26:39 +1100
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 paulus@samba.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Feb 2022 05:51:23 +0000, Wedson Almeida Filho wrote:
> Without this patch, module init sections are disabled by patching their
> names in arch-specific code when they're loaded (which prevents code in
> layout_sections from finding init sections). This patch uses the new
> arch-specific module_init_section instead.
> 
> This allows modules that have .init_array sections to have the
> initialisers properly called (on load, before init). Without this patch,
> the initialisers are not called because .init_array is renamed to
> _init_array, and thus isn't found by code in find_module_sections().
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/module_64: use module_init_section instead of patching names
      https://git.kernel.org/powerpc/c/d4be60fe66b7380530868ceebe549f8eebccacc5

cheers
