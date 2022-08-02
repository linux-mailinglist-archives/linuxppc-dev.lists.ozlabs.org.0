Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44531587B52
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 13:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxsZs1RVwz3fS3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Aug 2022 21:04:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxsYs5HSmz3dsK
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Aug 2022 21:04:01 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LxsYs4hg6z4x1b;
	Tue,  2 Aug 2022 21:04:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <20220801113746.802046-1-mpe@ellerman.id.au>
References: <20220801113746.802046-1-mpe@ellerman.id.au>
Subject: Re: [PATCH] selftests/powerpc: Avoid GCC 12 uninitialised variable warning
Message-Id: <165943822568.1063641.15205694140286178744.b4-ty@ellerman.id.au>
Date: Tue, 02 Aug 2022 21:03:45 +1000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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

On Mon, 1 Aug 2022 21:37:46 +1000, Michael Ellerman wrote:
> GCC 12 thinks that `actual` might be used uninitialised. It's not, the
> use is guarded by `bad_mmcr2` which is only set to true at the same
> point where `actual` is initialised.
> 
>   cycles_with_mmcr2_test.c: In function ‘cycles_with_mmcr2’:
>   cycles_with_mmcr2_test.c:81:17: error: ‘actual’ may be used uninitialized [-Werror=maybe-uninitialized]
>      81 |                 printf("Bad MMCR2 value seen is 0x%lx\n", actual);
> 
> [...]

Applied to powerpc/next.

[1/1] selftests/powerpc: Avoid GCC 12 uninitialised variable warning
      https://git.kernel.org/powerpc/c/ff446cd76854d47f451a84c26bb70934ae2ec5a7

cheers
