Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A071B6BCEC6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 12:54:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pclzf4bBNz3cj5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Mar 2023 22:54:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qIzjIba+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pclyj1mS7z3bvH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Mar 2023 22:53:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qIzjIba+;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Pclyg6cyLz4x7s;
	Thu, 16 Mar 2023 22:53:31 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1678967612;
	bh=b/pQ2wE5S7nHv3es7WZVEfLm9S28WgiyyZ+VQ07K+Ks=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=qIzjIba+mLcN086XIllglaE3vpNgjSbNqfTWiHDhkQI/yDg9IRVyGDcDRkvLrgBm9
	 w686YLSGO77RfMqR0D0LaJKZBKz0cMIEkBLpasaVnjoC2N/CMSCm/T3V2wZFufdsAh
	 +ag39Zz2ywZP5NTmBUZQ2cTXvvSG1H1GxsylB3DiO9IYE4Hdc+ZhYPRyataH7ZvVy8
	 Z84sTgzD3Ooomk2dJ+phz1hOWkWILTW6fJrz5zPhB19Bvc/G21W+5nfZawGNyvx1xH
	 5/wSSVYKPsa9Y78wVDOWkf3lYWaolMNfklGMxMCMdRMpzuevSkuMJtYYmIFWGhb4SX
	 o6YTUUoRp+XAw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 0/2] KVM: PPC: support kvm selftests
In-Reply-To: <20230316031732.3591455-1-npiggin@gmail.com>
References: <20230316031732.3591455-1-npiggin@gmail.com>
Date: Thu, 16 Mar 2023 22:53:26 +1100
Message-ID: <87ilf0nc95.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> Hi,
>
> This series adds initial KVM selftests support for powerpc
> (64-bit, BookS).

Awesome.
 
> It spans 3 maintainers but it does not really
> affect arch/powerpc, and it is well contained in selftests
> code, just touches some makefiles and a tiny bit headers so
> conflicts should be unlikely and trivial.
>
> I guess Paolo is the best point to merge these, if no comments
> or objections?

Yeah. If it helps:

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
