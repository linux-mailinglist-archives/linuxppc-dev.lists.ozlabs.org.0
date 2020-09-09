Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DDB262F73
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 16:03:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmkJR4StGzDqWT
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 00:03:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjW32gRjzDqJK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjW30SVKz9sVW; Wed,  9 Sep 2020 23:27:43 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20200824131231.14008-1-jniethe5@gmail.com>
References: <20200824131231.14008-1-jniethe5@gmail.com>
Subject: Re: [PATCH] selftests/powerpc: Fix prefixes in alignment_handler
 signal handler
Message-Id: <159965717372.808686.5267488105604195724.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:43 +1000 (AEST)
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 24 Aug 2020 23:12:31 +1000, Jordan Niethe wrote:
> The signal handler in the alignment handler self test has the ability to
> jump over the instruction that triggered the signal. It does this by
> incrementing the PT_NIP in the user context by 4. If it were a prefixed
> instruction this will mean that the suffix is then executed which is
> incorrect. Instead check if the major opcode indicates a prefixed
> instruction (e.g. it is 1) and if so increment PT_NIP by 8.
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix prefixes in alignment_handler signal handler
      https://git.kernel.org/powerpc/c/db96221a683342fd4775fd820a4d5376cd2f2ed0

cheers
