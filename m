Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D8ECE152601
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 06:29:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48C99B2bxCzDqRD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Feb 2020 16:29:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48C97c5YYNzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Feb 2020 16:27:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=NEJfQNyk; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48C97c0xQ7z9sSR;
 Wed,  5 Feb 2020 16:27:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1580880476;
 bh=fDcXTa4erO0JmEY8maPRVXIJtal56B9tg1k6mw1Wulk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=NEJfQNykW0bZ/CzXUz0B/Zb/z7lL6+OZ7QAOOlRLFFkqS4t/l13kit/VPOhu1KqTK
 FQIHp54tQrEnhK79k54EyPTOjHDdJO+nOgJtd5xXmuS8EoAU1t6fUraUMfwJsTGsu7
 y6RaUPQrshDAeTxNeu0oqWRh53ekoYwmtFtCQOL5PunGVBxceM+oxQ72peM/FFolwE
 /CUV/5ZTeilx3bJ1sjOPYKisy766en/uR0b/071SEu/JMMHom7e8DLkEMMl8suXGRu
 QywS0J4PO0Y+Z1tKN98+2V2ngGsqJXr2DjRLlE+FDOGeBk4PdlU+GwnmvUyBy9FkrG
 KK17H11ZKyIsw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gustavo Luiz Duarte <gustavold@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 2/3] selftests/powerpc: Add tm-signal-pagefault test
In-Reply-To: <20200203160906.24482-2-gustavold@linux.ibm.com>
References: <20200203160906.24482-1-gustavold@linux.ibm.com>
 <20200203160906.24482-2-gustavold@linux.ibm.com>
Date: Wed, 05 Feb 2020 16:27:52 +1100
Message-ID: <8736bp38o7.fsf@mpe.ellerman.id.au>
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
Cc: mikey@neuling.org, gromero@linux.ibm.com,
 Gustavo Luiz Duarte <gustavold@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gustavo Luiz Duarte <gustavold@linux.ibm.com> writes:
> This test triggers a TM Bad Thing by raising a signal in transactional state
> and forcing a pagefault to happen in kernelspace when the kernel signal
> handling code first touches the user signal stack.
>
> This is inspired by the test tm-signal-context-force-tm but uses userfaultfd to
> make the test deterministic. While this test always triggers the bug in one
> run, I had to execute tm-signal-context-force-tm several times (the test runs
> 5000 times each execution) to trigger the same bug.

Using userfaultfd is a very nice touch. But it's not always enabled,
which leads to eg:

  root@mpe-ubuntu-le:~# /home/michael/tm-signal-pagefault 
  test: tm_signal_pagefault
  tags: git_version:v5.5-9354-gc1e346e7fc44
  userfaultfd() failed: Function not implemented
  failure: tm_signal_pagefault

It would be nice if that resulted in a skip, not a failure.

It looks like it shouldn't be too hard to skip if the userfaultfd call
returns ENOSYS.

cheers
