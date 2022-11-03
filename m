Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CFD87617A0E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 10:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N2zCz5G9Nz3cG7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Nov 2022 20:36:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lh9fwvI4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N2zC16QX9z3bxp
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Nov 2022 20:35:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=lh9fwvI4;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4N2zBx69SBz4xHV;
	Thu,  3 Nov 2022 20:35:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1667468137;
	bh=3UpxhbKKGBzORlH6T6FFqXj4UhETFfNxDFVHQGuz6uA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=lh9fwvI4+lWUEUlvEm/teesbaj94J+t5ewaa3653xAPHMKlYT0c5/AdjzB4Ul229h
	 bUMRYtctuYZE3cm+3CVc48UfH0swBHkyZntXUhqc3ClN0aiQlOgSUwr8aui9j2opwL
	 XluAaKjg5U1JSsnSZ7yQ6bn0olfo5czaBYVQRoUWxZ6cSB7MMTaBvKmL6VTfUixvgz
	 7xeE+uGLlLAjGKmxE4WCbSfgxybtgmpS6nK5TPr/wymDoHqnKIb1FcoJoArWyAm6RY
	 Kd3/AzbIgF9XivVDa/d0S2g/J1mPzCeiygOH+z/FGzpPF3aF37x/xuREaGg1EkWuos
	 dCo5IBpJCYyfQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Luis Chamberlain <mcgrof@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 0/2] powerpc module arch checks
In-Reply-To: <Y2MEw6BruH3FnYL/@bombadil.infradead.org>
References: <20221031120733.3956781-1-npiggin@gmail.com>
 <Y2MEw6BruH3FnYL/@bombadil.infradead.org>
Date: Thu, 03 Nov 2022 20:35:32 +1100
Message-ID: <87leoss7mj.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, Jessica Yu <jeyu@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Luis Chamberlain <mcgrof@kernel.org> writes:
> On Mon, Oct 31, 2022 at 10:07:31PM +1000, Nicholas Piggin wrote:
>> Luis if you would be okay for patch 1 to be merged via powerpc or
>> prefer to take it in the module tree (or maybe you object to the
>> code in the first place).
>
> Looks good to me, and nothing on my radar which would cause a conflict
> so happy for you to take it via powerpc or I can take it and apply it
> right away to tricke / get tested on linux-next by tomorrow.
>
> Let me know.

Thanks. I guess it's mostly a nop on other architectures, so probably
makes sense for me to take it.

cheers
