Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 589546CBDCF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 13:33:27 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pm6xx21bmz3fWJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 22:33:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AMpWTwQ2;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pm6x263rHz2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 22:32:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=AMpWTwQ2;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pm6x1521Lz4xFW;
	Tue, 28 Mar 2023 22:32:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1680003157;
	bh=g372AUSYfnay8EGETnHTvUJW5p9CXx9A6ULuph62ckc=;
	h=From:To:Subject:In-Reply-To:References:Date:From;
	b=AMpWTwQ2QLoAJs9gTwNfc9vqTMryykrPnsJ5Zx+AosUyWmihI8sKIT260sayJHydL
	 npFqwYK82sMcFdaffPRj5CcC80VIiEFudEjBWC/PygAPe9yuyORMbl7Ubz3qR+BodI
	 h4x7VQfROWnrJdwHq3I4FGoWRQKYNe2lPzbDIZTeTF09lHTbO3Ovk0yCSB+i8L//l3
	 uzK/4/QcxLCFto3CTtpteUsVgC+DMrrYLo8yLh02m9XRXiI04gL0YuABgJYv9auAt9
	 vLaQvhjIxBhRhuZHjQHU6OM2Ad91qCz8G6nMHrxkfwp3WamJGrsMX/HItAOf+u87rh
	 xK2GfEJi2rXtQ==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Jens Axboe <axboe@kernel.dk>, "linuxppc-dev@lists.ozlabs.org"
 <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PATCH] powerpc: don't try to copy ppc for task with NULL pt_regs
In-Reply-To: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
References: <d9f63344-fe7c-56ae-b420-4a1a04a2ae4c@kernel.dk>
Date: Tue, 28 Mar 2023 22:32:34 +1100
Message-ID: <87lejhcdrh.fsf@mpe.ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Jens Axboe <axboe@kernel.dk> writes:
> Powerpc sets up PF_KTHREAD and PF_IO_WORKER with a NULL pt_regs, which
> from my (arguably very short) checking is not commonly done for other
> archs. This is fine, except when PF_IO_WORKER's have been created and
> the task does something that causes a coredump to be generated.

Do kthread's ever core dump? I didn't think they did, but I can't find
any logic to prevent it.

Maybe it's always been possible but just never happened due to luck.

As Nick said we should probably have a non-NULL regs for PF_IO_WORKERS,
but I'll still take this as a nice backportable fix for the immediate
crash.

I tagged it as Fixes: pointing back at the commit that added ppr_get(),
even though I don't know for sure the bug was triggerable back then
(v4.8).

cheers
