Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF03A3AC24C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 06:27:35 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G5m9f3HVJz3fJr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Jun 2021 14:27:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G5m4G3pv5z3bxP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Jun 2021 14:22:54 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4G5m4F2rwbz9sfG; Fri, 18 Jun 2021 14:22:53 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Paul Mackerras <paulus@samba.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Shuah Khan <shuah@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>
In-Reply-To: <0ad62673d3e063f848e7c99d719bb966efd433e8.1622809833.git.christophe.leroy@csgroup.eu>
References: <0ad62673d3e063f848e7c99d719bb966efd433e8.1622809833.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/selftests: Use gettid() instead of getppid() for
 null_syscall
Message-Id: <162398829644.1363949.13696130535208062444.b4-ty@ellerman.id.au>
Date: Fri, 18 Jun 2021 13:51:36 +1000
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

On Fri, 4 Jun 2021 12:31:09 +0000 (UTC), Christophe Leroy wrote:
> gettid() is 10% lighter than getppid(), use it for null_syscall selftest.

Applied to powerpc/next.

[1/1] powerpc/selftests: Use gettid() instead of getppid() for null_syscall
      https://git.kernel.org/powerpc/c/a1ea0ca8a6f17d7b79bbc4d05dd4e6ca162d8f15

cheers
