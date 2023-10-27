Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3915F7D9515
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 12:20:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oD1JpfRz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SGzFN0vLFz3vvc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Oct 2023 21:20:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=oD1JpfRz;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SGyzX0nzMz3cM7
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Oct 2023 21:08:24 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1698401303;
	bh=2ZGbLi68/rAJuyNV2CP2OlA2a3F2vQEQ4DG8ABrxgYg=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=oD1JpfRzyLlGvXEaSFWKJhXEtxQB8dN3aEzkgBclZxXTkUlpZOS1NTnIBFvcQb9if
	 N24KggAq2+/uU0DO8rbEbpV6RLEUDAkXNmZI36gzgOEO+eKWEOrd9mAUSCZ1DWVUYr
	 bhjJvs6vvS+ZvniClKWQqF6aYPYa/Quj0An3dZFMdrf/ImZxZ2RjFlf0ZLBDGqm0ch
	 7dTzM+r/ApE9S2oONNNXMO3mAK0r8R2WAXI5eZ5mbLvlIT5h8d4rjYF2Vh/EyrvRP2
	 PrvRlV2ftNG4DjLFRQaxcGVhcUtJrhF5qROVlGFuEKkN903XAZQQwxbFr5k6hg99qp
	 lhf7NskODrEcA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4SGyzV6cqvz4xXc;
	Fri, 27 Oct 2023 21:08:22 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Naveen N Rao <naveen@kernel.org>
In-Reply-To: <20230614085926.2176641-1-naveen@kernel.org>
References: <20230614085926.2176641-1-naveen@kernel.org>
Subject: Re: [PATCH] powerpc/trace: Add support for HAVE_FUNCTION_ARG_ACCESS_API
Message-Id: <169840079682.2701453.11906055016931828978.b4-ty@ellerman.id.au>
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
Cc: Masami Hiramatsu <mhiramat@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 14 Jun 2023 14:29:26 +0530, Naveen N Rao wrote:
> When creating a kprobe on function entry through tracefs, enable
> arguments to be recorded to be specified using $argN syntax.
> 
> 

Applied to powerpc/next.

[1/1] powerpc/trace: Add support for HAVE_FUNCTION_ARG_ACCESS_API
      https://git.kernel.org/powerpc/c/f01b0edd562ef5a05bae31fe3a296721f89af7d9

cheers
