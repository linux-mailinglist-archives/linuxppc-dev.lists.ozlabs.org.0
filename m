Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 722E35653F3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 13:43:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lc3q72n8Nz3gbF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jul 2022 21:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lc3fZ195vz3cFK
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jul 2022 21:36:22 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Lc3fY6fL5z4xw8;
	Mon,  4 Jul 2022 21:36:21 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220531065936.3674348-1-mpe@ellerman.id.au>
References: <20220531065936.3674348-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/64: Drop ppc_inst_as_str()
Message-Id: <165693442764.9954.8462797726293479330.b4-ty@ellerman.id.au>
Date: Mon, 04 Jul 2022 21:33:47 +1000
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
Cc: jniethe5@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 31 May 2022 16:59:36 +1000, Michael Ellerman wrote:
> The ppc_inst_as_str() macro tries to make printing variable length,
> aka "prefixed", instructions convenient. It mostly succeeds, but it does
> hide an on-stack buffer, which triggers stack protector.
> 
> More problematically it doesn't compile at all with GCC 12, due to the
> fact that it returns the char buffer declared inside the macro:
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/64: Drop ppc_inst_as_str()
      https://git.kernel.org/powerpc/c/2a83afe72a2b5760155c2dd840c776aee292dc90

cheers
