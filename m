Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DFA693B4E3E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 12:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GBrDS5SyLz3dL8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 26 Jun 2021 20:47:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GBrD80cKMz2yWy
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 26 Jun 2021 20:47:20 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4GBrD7041Bz9srZ; Sat, 26 Jun 2021 20:47:18 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
In-Reply-To: <20210625045337.3197833-1-mpe@ellerman.id.au>
References: <20210625045337.3197833-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/pseries/vas: Include irqdomain.h
Message-Id: <162470439681.3596556.4017554069440967202.b4-ty@ellerman.id.au>
Date: Sat, 26 Jun 2021 20:46:36 +1000
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
Cc: sfr@canb.auug.org.au
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 25 Jun 2021 14:53:37 +1000, Michael Ellerman wrote:
> There are patches in flight to break the dependency between asm/irq.h
> and linux/irqdomain.h, which would break compilation of vas.c because it
> needs the declaration of irq_create_mapping() etc.
> 
> So add an explicit include of irqdomain.h to avoid that becoming a
> problem in future.

Applied to powerpc/next.

[1/1] powerpc/pseries/vas: Include irqdomain.h
      https://git.kernel.org/powerpc/c/c736fb97051c39c74bf5d4684bdac1766d43e175

cheers
