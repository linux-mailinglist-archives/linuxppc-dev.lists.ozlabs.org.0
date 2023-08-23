Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 741E67857C5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 14:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RW4w82qhLz3hh8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Aug 2023 22:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RW4d561B6z3cK4
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Aug 2023 22:04:09 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4RW4d44K0Pz4x2L;
	Wed, 23 Aug 2023 22:04:08 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20230806150954.394189-1-masahiroy@kernel.org>
References: <20230806150954.394189-1-masahiroy@kernel.org>
Subject: Re: [PATCH 1/3] powerpc: remove unneeded #include <asm/export.h>
Message-Id: <169279175566.797584.2539796704506520702.b4-ty@ellerman.id.au>
Date: Wed, 23 Aug 2023 21:55:55 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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
Cc: linux-arch@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 07 Aug 2023 00:09:52 +0900, Masahiro Yamada wrote:
> There is no EXPORT_SYMBOL line there, hence #include <asm/export.h>
> is unneeded.
> 
> 

Applied to powerpc/next.

[1/3] powerpc: remove unneeded #include <asm/export.h>
      https://git.kernel.org/powerpc/c/3eb3f168e83aa7a7b8477507cf4b08b9515b4b13
[2/3] powerpc: replace #include <asm/export.h> with #include <linux/export.h>
      https://git.kernel.org/powerpc/c/393261828740c3ed95fc810c3f4c1018b86af7e5
[3/3] powerpc: remove <asm/export.h>
      https://git.kernel.org/powerpc/c/efa1f85019537ce44832cf73a6db18611e3e41cd

cheers
