Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1688C7454F5
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 07:38:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QvZTF05YNz3dHT
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Jul 2023 15:38:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QvZP525pHz3bkD
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Jul 2023 15:34:33 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4QvZP50w9Cz4wxq;
	Mon,  3 Jul 2023 15:34:33 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Oliver O'Halloran <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org, Colin Ian King <colin.i.king@gmail.com>
In-Reply-To: <20230608095849.1147969-1-colin.i.king@gmail.com>
References: <20230608095849.1147969-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] powerpc/powernv/sriov: perform null check on iov before dereferencing iov
Message-Id: <168836201891.50010.6948846603017935484.b4-ty@ellerman.id.au>
Date: Mon, 03 Jul 2023 15:26:58 +1000
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 08 Jun 2023 10:58:49 +0100, Colin Ian King wrote:
> Currently pointer iov is being dereferenced before the null check of iov
> which can lead to null pointer dereference errors. Fix this by moving the
> iov null check before the dereferencing.
> 
> Detected using cppcheck static analysis:
> linux/arch/powerpc/platforms/powernv/pci-sriov.c:597:12: warning: Either
> the condition '!iov' is redundant or there is possible null pointer
> dereference: iov. [nullPointerRedundantCheck]
>  num_vfs = iov->num_vfs;
>            ^
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/powernv/sriov: perform null check on iov before dereferencing iov
      https://git.kernel.org/powerpc/c/f4f913c980bc6abe0ccfe88fe3909c125afe4a2d

cheers
