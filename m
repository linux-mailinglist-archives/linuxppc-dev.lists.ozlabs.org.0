Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B506E969B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 16:06:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2KFm5hD9z3f52
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 00:06:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SLVHkBGh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2KDw1JjQz3cLB
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 00:05:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=SLVHkBGh;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q2KDt6K41z4x1N;
	Fri, 21 Apr 2023 00:05:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1681999534;
	bh=0NX+HySVKG9RzPLDm7csn/HMBcenSt9vaesjVYx28NM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=SLVHkBGhfh/tauw63mD4CJtBXh2KpgRdJW5/HiBrH6uUCy/iU67jw4RkPycZRP4Dp
	 LW0nKW7FsnXGxLyqVr+oWzCzX7ezbb260E4AhuvE3AhgCxON16DV8xunhwrgsvIN7V
	 g1QL/38iRZwj5d3dtKt2UzO/U47PsVmLXrveylcJmC6i3gR6HUMlZEbP3S67kJ3hEH
	 4Duh5GYRNlK8WqjZTjnG8PQYClxQcD9B9wPp/lMjdXz1CKUN54bQ8HE66cJgz2GlWx
	 8e/KKImw/8X4z3PCmBI50qzV2OzVPwTQe+MuZ+4gKsCB0mHz09AHxhMU+qHyS2sgGI
	 afxChOW/ljArA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] KVM: PPC: Update MAINTAINERS
In-Reply-To: <20230408042839.869361-1-npiggin@gmail.com>
References: <20230408042839.869361-1-npiggin@gmail.com>
Date: Fri, 21 Apr 2023 00:05:33 +1000
Message-ID: <87jzy64pjm.fsf@mail.concordia>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Michael is maintaining KVM PPC with the powerpc tree at the moment,
> just doesn't necessarily have time to be across all of KVM. But I
> think that's okay, from mechanics of how patches flow upstream he is
> maintainer. And it probably makes a bit more sense to people who need
> to look at the MAINTAINERS file if we have some contacts there.
>
> So add mpe as KVM PPC maintainer and I am a reviewer. Split out the
> subarchs that don't get much attention.

Yeah I guess this is better than what we have now.

Can you send a non-RFC and SOB'ed version, and maybe Cc the KVM list
as well?

cheers
