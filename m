Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B650DE940B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 01:18:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472pvM5KnFzF3hP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 11:18:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472psM6P0NzDrWy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 11:16:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.b="llcQOlMd"; dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 472psL36Cpz9sPf;
 Wed, 30 Oct 2019 11:16:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1572394583;
 bh=pBaC0E9LYlY/85OHfeGNEyHFZDoW+RSt2lY9wSrx+io=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=llcQOlMdkDElups34dq04jnjl2wvUAAqkBkrmQyp7Jgm9A5516SvjV7Z7nZvVXDXZ
 IS+l3zdcaE53fLM+7n7H8PMif/SnIZb0TPc9aynYj8l/L74QztinVgr4dwkZOuB/PH
 Xlf3q/xZXVIuW0UvBbF0NgCBbFvlimSBI5CxqzJvPm6kmwvQPVPwGh/gE+eJw52+82
 4CuJPkhN0AbTvqvVH+u2wePRGAQCzoHXvVK6Tmf+/FW8zk57Yz3PYZRkQmT8sEzw+E
 9GamddbrCZH/ZbTS+jTy5ff0VrgW3raDjn1siNem8Tq4xctRY4qQ54L89O2aKrPEAe
 R0LT01Rh4EsOw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Kees Cook <keescook@chromium.org>, Russell Currey <ruscur@russell.cc>
Subject: Re: [PATCH v4 0/4] Implement STRICT_MODULE_RWX for powerpc
In-Reply-To: <201910291601.F161FBBAB2@keescook>
References: <20191014051320.158682-1-ruscur@russell.cc>
 <201910291601.F161FBBAB2@keescook>
Date: Wed, 30 Oct 2019 11:16:22 +1100
Message-ID: <87zhhjf5pl.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: ajd@linux.ibm.com, kernel-hardening@lists.openwall.com, npiggin@gmail.com,
 joel@jms.id.au, linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Kees Cook <keescook@chromium.org> writes:
> On Mon, Oct 14, 2019 at 04:13:16PM +1100, Russell Currey wrote:
>> v3 cover letter here:
>> https://lists.ozlabs.org/pipermail/linuxppc-dev/2019-October/198023.html
>> 
>> Only minimal changes since then:
>> 
>> - patch 2/4 commit message update thanks to Andrew Donnellan
>> - patch 3/4 made neater thanks to Christophe Leroy
>> - patch 3/4 updated Kconfig description thanks to Daniel Axtens
>
> I continue to be excited about this work. :) Is there anything holding
> it back from landing in linux-next?

I had some concerns, which I stupidly posted in reply to v3:

  https://lore.kernel.org/linuxppc-dev/87pnio5fva.fsf@mpe.ellerman.id.au/

cheers
