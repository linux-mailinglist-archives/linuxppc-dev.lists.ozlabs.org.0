Return-Path: <linuxppc-dev+bounces-3385-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5739D03B7
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Nov 2024 13:27:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XrqjH3SLBz3bpL;
	Sun, 17 Nov 2024 23:25:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2404:9400:2221:ea00::3"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731846339;
	cv=none; b=aNtrjFVPzr2tSm5sFMLuWhRjrYKqiH/QmfO6nA8dlwTSHmrKMyh4FkBi505cDjEXh9UktmPaD9ji7xx6Wg9d+qxL424IqeYET2w1fVmQaH/Fpxw8YDTa674wWTzJOWNSpk3iOl5ZPDHi/mhLFhooR5FvxLoCxpavX8+0F6E330ED8DICsmPS1BqT0SWxkN2Zo2zivAZK9cCmzrtG1KuxOp/+rSFFWMambDDPLP9OmI820GRJ8aM9hp6ORuLmyjao6oE/zmFXW89Yz2n95kNANQp1D0V1IioEMZQ7WmGYW0dzSPPK9emj42IAdRsFfMTeGiVutj3AmYVqXsn1gXl1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731846339; c=relaxed/relaxed;
	bh=lnPr1gxISBwEUZN23AJ5943nhoG6g13BacvcbTslP1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=gvUDDYmf1ImQmKkjS/LZvw1W4lOiJHYNLJJwUmg/KJDErQ/GWr4WEe1+gQ+P39L4sEOuTSgB84wizKCohAZnYmotPUWC1Lh67v7dyAkUnoEyHwTU6niBLOYuEHoL6ckHsr+v685YMtaredunSFy7Xo/jjLQWVC7tyQTUhJfGncEAsSL7bBT+zTWX5YbTWU6ztA6qHspflK//HowF+SEKkPZG8ao4FRx7BdC0ccVL8xzecoliXMUjVlDfEq5oJ/cwXRUTlaALHlMaTGvhcAbyxj4c9fMRnBwqR2caMNQyKkLcT0wS/cMnFUd4NAuqz0E0iYJKIu3ncEEJPhuJEI2sRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au; dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gW/hKWPh; dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=gW/hKWPh;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XrqjG1YqQz3br5
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Nov 2024 23:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1731846335;
	bh=lnPr1gxISBwEUZN23AJ5943nhoG6g13BacvcbTslP1Y=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=gW/hKWPhHry/Zusk66iROtpVWKhPKwFNTJncapCHs2oTrLTCts23RyYuiLV97optV
	 qRlA6qdKxSqBSWTt2uRZ5mncVMSmkZErKRslHbnJbHEAspqUJPomPHeENWvLxfKkP9
	 FkA9vb6GfB69HEdLi299L8aW2647RmRJYFu3hcRHQQRjAqd9B8FRJlpjrc0jNhCQWn
	 OmUnYsYu+YTMBLj4dghcgsnh4inU+RlOn08w9atRj39hwlRGXx/14bSspgiVXi640g
	 daRTjYtdFTEQWGuOdKbTvrNkQIiNHYZ+qqs69k0qFYcxwsFzMmJjNePijiWo+6QK0l
	 qTxnIWPBqgwSA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4XrqjC1Zbyz4xff;
	Sun, 17 Nov 2024 23:25:35 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
In-Reply-To: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
References: <20241113-vdso-powerpc-asm-offsets-v1-1-3f7e589f090d@linutronix.de>
Subject: Re: [PATCH] powerpc/vdso: Remove unused clockmode asm offsets
Message-Id: <173184539749.890800.8297350541963703609.b4-ty@ellerman.id.au>
Date: Sun, 17 Nov 2024 23:09:57 +1100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, 13 Nov 2024 09:06:58 +0100, Thomas Weißschuh wrote:
> These offsets are not used anymore, delete them.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/vdso: Remove unused clockmode asm offsets
      https://git.kernel.org/powerpc/c/d7a82238cb8c77d4ed8cc97cd556c5f3e64bc749

cheers

