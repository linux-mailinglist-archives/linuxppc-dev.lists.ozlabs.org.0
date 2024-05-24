Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTP id A4F9E8CE1A7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 09:41:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MFCDufiR;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VlxZ10Ny0z87dT
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2024 17:31:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=MFCDufiR;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VlxYG397Dz87l3
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2024 17:31:14 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1716535874;
	bh=9aZfG+NzEiFZAsHD0h4w2IWim6Z6lzrXt347upX65NQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=MFCDufiRQVNPhjxqSk1BjmddKX1HfxsLZ5ZUFULQ9FM80/EwH+kEo33Rgh7H14zav
	 Rksh2PPvGO23CTdN5CexXlCadOet6yLf/EC4FxB4oqpqQywAFmXdCwKhY1NfPi1tHV
	 PH3jmzFqdZ/sgt/DgNfxVYaQK0wpNe9Mfl0mUa+x7hUFhtdwMjUI3hbkKUo6W2fbbP
	 fUia07Lun7uUscPJVq3lPwqA/WtJKF3AgLfGSZ0XNcEEhq064oyNR9JtXVqiYXBt8u
	 ZJ66m6kPGSLgE25WyWJUoV8WzPENmpiOBYOa3cIQh9jQbp5fZvNpClQ8k6VDLQIscL
	 sh0w5cnoXAxDA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VlxYG2367z4wcg;
	Fri, 24 May 2024 17:31:14 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Andrew Morton
 <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>, Peter Xu
 <peterx@redhat.com>, Oscar Salvador <osalvador@suse.de>, Nicholas Piggin
 <npiggin@gmail.com>
Subject: Re: [RFC PATCH v2 12/20] powerpc/64e: Remove unneeded #ifdef
 CONFIG_PPC_E500
In-Reply-To: <f70e5249b9e6a9a06e6575aa0efbaf8ba93c3659.1715971869.git.christophe.leroy@csgroup.eu>
References: <cover.1715971869.git.christophe.leroy@csgroup.eu>
 <f70e5249b9e6a9a06e6575aa0efbaf8ba93c3659.1715971869.git.christophe.leroy@csgroup.eu>
Date: Fri, 24 May 2024 17:31:13 +1000
Message-ID: <87a5kf4qf2.fsf@mail.lhotse>
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
Cc: linux-mm@kvack.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> When it is a nohash/64 it can't be anything else than
> CONFIG_PPC_E500 so remove the #ifdef as they are always true.

I have a series doing some similar cleanups, I'll post it. We can decide
whether to merge it before your series or combine them or whatever.

cheers
