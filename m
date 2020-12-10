Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 20E782D5B8F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 14:25:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsF5t6BmczDqpp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 00:25:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsBXr4ZqZzDqv5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 22:30:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4CsBXp6mfBz9sXX; Thu, 10 Dec 2020 22:30:02 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20201201144344.1228421-1-dja@axtens.net>
References: <20201201144344.1228421-1-dja@axtens.net>
Subject: Re: [PATCH] powerpc/feature-fixups: use a semicolon rather than a
 comma
Message-Id: <160756606037.1313423.3830244200970844785.b4-ty@ellerman.id.au>
Date: Thu, 10 Dec 2020 22:30:02 +1100 (AEDT)
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
Cc: Nick Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2 Dec 2020 01:43:44 +1100, Daniel Axtens wrote:
> In a bunch of our security flushes, we use a comma rather than
> a semicolon to 'terminate' an assignment. Nothing breaks, but
> checkpatch picks it up if you copy it into another flush.
> 
> Switch to semicolons for ending statements.

Applied to powerpc/next.

[1/1] powerpc/feature-fixups: use a semicolon rather than a comma
      https://git.kernel.org/powerpc/c/1fc0c27b14b93b2506953ef59e965d98ccc78122

cheers
