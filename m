Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 82D717D94CC
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:09:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FLndooOa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGz1632g0z3dBr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:09:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=FLndooOa;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzM0sn6z3bWH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:15 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
	id 4SGyzM0JMjz4xVb; Fri, 27 Oct 2023 21:08:15 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401295;
	bh=rouP6sw+8W5XSrbBGcfctIt7whzXGBCXOyfOKiyF3Vo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=FLndooOa+O6PYOh/pYDt33DEiBwE7/zbuEll86J3MnK6pkSpoXpgi3wWBYJYvxeC9
	 jNtf+ZQ7Uqztu3hstE5pX71GZl+972bQw0UWsOXtrV1ZOFZGtqxcV84D0UsY2cgs4F
	 ktCCd4aHEh/zPhWMjS6icGQ+iGZlhQT19kUXIC9+HlyirhKrswQkDGHg6+YeahYqvP
	 wG64geXioH1/z2/4Y8W660CFcrmorwvSuUZwo2m++8rLZDvpIZZNg74kV9wMIbJ4ry
	 U24SdpZfrGuKMkBg5XlmSdpAt0owIYuFMVNtpafra+Sla10vt7dKULlryRLmadISTQ
	 T9h/3WGqW8mdA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzL6cc3z4xVZ;
	Fri, 27 Oct 2023 21:08:14 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@ozlabs.org, Aditya Gupta <adityag@linux.ibm.com>
In-Reply-To: <20231023072612.50874-1-adityag@linux.ibm.com>
References: <20231023072612.50874-1-adityag@linux.ibm.com>
Subject: Re: [PATCH] ppc64: add mmu information to vmcoreinfo
Message-Id: <169840079688.2701453.15154354310571529574.b4-ty@ellerman.id.au>
Date: Fri, 27 Oct 2023 20:59:56 +1100
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
Cc: Hari Bathini <hbathini@linux.ibm.com>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Sachin Sant <sachinp@linux.ibm.com>, Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 23 Oct 2023 12:56:12 +0530, Aditya Gupta wrote:
> Since below commit, address mapping for vmemmap has changed for Radix
> MMU, where address mapping is stored in kernel page table itself,
> instead of earlier used 'vmemmap_list'.
> 
>     commit 368a0590d954 ("powerpc/book3s64/vmemmap: switch radix to use
>     a different vmemmap handling function")
> 
> [...]

Applied to powerpc/next.

[1/1] ppc64: add mmu information to vmcoreinfo
      https://git.kernel.org/powerpc/c/36e826b568e412f61d68fedc02a67b4d8b7583cc

cheers
