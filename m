Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 510F475B07B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 15:53:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R6DgN1tPgz3cnJ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Jul 2023 23:53:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R6DdN35p8z3bTf
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Jul 2023 23:52:08 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4R6DdJ0CNPz4wyB;
	Thu, 20 Jul 2023 23:52:04 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Andrew Donnellan <ajd@linux.ibm.com>
In-Reply-To: <20230719071821.320594-1-ajd@linux.ibm.com>
References: <20230719071821.320594-1-ajd@linux.ibm.com>
Subject: Re: [PATCH] Revert "powerpc/64s: Remove support for ELFv1 little endian userspace"
Message-Id: <168986105081.1117384.2660879957630127014.b4-ty@ellerman.id.au>
Date: Thu, 20 Jul 2023 23:50:50 +1000
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
Cc: Adam Borowski <kilobyte@angband.pl>, Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 19 Jul 2023 17:18:21 +1000, Andrew Donnellan wrote:
> This reverts commit 606787fed7268feb256957872586370b56af697a.
> 
> ELFv1 with LE has never been a thing, and people who try to make ELFv1 LE
> binaries are maniacs who need to be stopped, but unfortunately there are
> ELFv1 LE binaries out there in the wild.
> 
> One such binary is the ppc64el (as Debian calls it) helper for
> arch-test[0], a tool for detecting architectures that can be executed on a
> given machine by means of attempting to execute helper binaries compiled
> for each architecture and seeing which binaries succeed and fail. The
> helpers are small snippets of assembly, and the ppc64el assembly doesn't
> include the right directives to generate an ELFv2 binary.
> 
> [...]

Applied to powerpc/fixes.

[1/1] Revert "powerpc/64s: Remove support for ELFv1 little endian userspace"
      https://git.kernel.org/powerpc/c/106ea7ffd56b0f9454cd4f625474967f12ac4dbd

cheers
