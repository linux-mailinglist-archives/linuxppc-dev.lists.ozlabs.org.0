Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD6028563DD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Feb 2024 14:01:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TbFYr4plMz3vnL
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Feb 2024 00:01:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TbFX46Yfgz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Feb 2024 23:59:48 +1100 (AEDT)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4TbFX04KqWz4wcl;
	Thu, 15 Feb 2024 23:59:44 +1100 (AEDT)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Arnd Bergmann <arnd@kernel.org>
In-Reply-To: <20240123125148.2004648-1-arnd@kernel.org>
References: <20240123125148.2004648-1-arnd@kernel.org>
Subject: Re: [PATCH 1/2] powerpc: udbg_memcons: mark functions static
Message-Id: <170800185782.599237.10144713450060322836.b4-ty@ellerman.id.au>
Date: Thu, 15 Feb 2024 23:57:37 +1100
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 23 Jan 2024 13:51:41 +0100, Arnd Bergmann wrote:
> ppc64_book3e_allmodconfig has one more driver that triggeres a
> few missing-prototypes warnings:
> 
> arch/powerpc/sysdev/udbg_memcons.c:44:6: error: no previous prototype for 'memcons_putc' [-Werror=missing-prototypes]
> arch/powerpc/sysdev/udbg_memcons.c:57:5: error: no previous prototype for 'memcons_getc_poll' [-Werror=missing-prototypes]
> arch/powerpc/sysdev/udbg_memcons.c:80:5: error: no previous prototype for 'memcons_getc' [-Werror=missing-prototypes]
> 
> [...]

Applied to powerpc/fixes.

[1/2] powerpc: udbg_memcons: mark functions static
      https://git.kernel.org/powerpc/c/5c84bc8b617bf90e722cc57d447abd9a468d3a52
[2/2] powerpc: 85xx: mark local functions static
      https://git.kernel.org/powerpc/c/1c57b9f63ab34f01b8c73731cc0efacb5a9a2f16

cheers
