Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31694366C20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:10:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQLX016BGz30Cy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 23:10:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQLVG5Bhlz3034
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 23:09:10 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4FQLVG0bD4z9vFD; Wed, 21 Apr 2021 23:09:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Shuah Khan <shuah@kernel.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Andrei Vagin <avagin@gmail.com>, Dmitry Safonov <dima@arista.com>
In-Reply-To: <469f37ab91984309eb68c0fb47e8438cdf5b6463.1617198956.git.christophe.leroy@csgroup.eu>
References: <469f37ab91984309eb68c0fb47e8438cdf5b6463.1617198956.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] selftests: timens: Fix gettime_perf to work on powerpc
Message-Id: <161901050320.1961279.8916640678733082942.b4-ty@ellerman.id.au>
Date: Wed, 21 Apr 2021 23:08:23 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 31 Mar 2021 13:59:17 +0000 (UTC), Christophe Leroy wrote:
> On powerpc:
> - VDSO library is named linux-vdso32.so.1 or linux-vdso64.so.1
> - clock_gettime is named __kernel_clock_gettime()
> 
> Ensure gettime_perf tries these names before giving up.

Applied to powerpc/next.

[1/1] selftests: timens: Fix gettime_perf to work on powerpc
      https://git.kernel.org/powerpc/c/f56607e85ee38f2a5bb7096e24e2d40f35d714f9

cheers
