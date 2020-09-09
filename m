Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 77E12262F6D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 15:59:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmkD85H0czDqDW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 23:59:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BmjW30W46zDqFZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:27:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjW24T3xz9sVf; Wed,  9 Sep 2020 23:27:42 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Jordan Niethe <jniethe5@gmail.com>
In-Reply-To: <20200825035147.3239-1-jniethe5@gmail.com>
References: <20200825035147.3239-1-jniethe5@gmail.com>
Subject: Re: [PATCH] powerpc/boot: Update Makefile comment for 64bit wrapper
Message-Id: <159965717353.808686.15546373771362314671.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:27:42 +1000 (AEST)
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

On Tue, 25 Aug 2020 13:51:47 +1000, Jordan Niethe wrote:
> As of commit 147c05168fc8 ("powerpc/boot: Add support for 64bit little
> endian wrapper") the comment in the Makefile is misleading. The wrapper
> packaging 64bit kernel may built as a 32 or 64 bit elf. Update the
> comment to reflect this.

Applied to powerpc/next.

[1/1] powerpc/boot: Update Makefile comment for 64bit wrapper
      https://git.kernel.org/powerpc/c/364b236a0b6e86439b9025d961da8602db23d5bf

cheers
