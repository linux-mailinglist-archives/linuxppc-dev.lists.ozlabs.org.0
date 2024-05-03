Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BA3C08BAAF7
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 12:45:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VW6sP2mXJz3wGh
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2024 20:45:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VW6ng0sq8z3cTN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2024 20:42:31 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4VW6ng00rBz4x0C;
	Fri,  3 May 2024 20:42:30 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20240422133453.1793988-1-mpe@ellerman.id.au>
References: <20240422133453.1793988-1-mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/2] selftests/powerpc: Convert pmu Makefile to for loop style
Message-Id: <171473286290.451432.6519963116892693691.b4-ty@ellerman.id.au>
Date: Fri, 03 May 2024 20:41:02 +1000
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
Cc: spoorthy@linux.ibm.com, maddy@linux.ibm.com, linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 22 Apr 2024 23:34:52 +1000, Michael Ellerman wrote:
> The pmu Makefile has grown more sub directories over the years. Rather
> than open coding the rules for each subdir, use for loops.
> 
> 

Applied to powerpc/next.

[1/2] selftests/powerpc: Convert pmu Makefile to for loop style
      https://git.kernel.org/powerpc/c/822a04957cc5e675570645f506270797a1cf2865
[2/2] selftests/powerpc: Install tests in sub-directories
      https://git.kernel.org/powerpc/c/dda32e37d397f5937cc24a6e98b71d3645f51afa

cheers
