Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0739CED8
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 14:16:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fyb8433rXz3dy7
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Jun 2021 22:16:20 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ozlabs.org (client-ip=2401:3900:2:1::2; helo=ozlabs.org;
 envelope-from=michael@ozlabs.org; receiver=<UNKNOWN>)
Received: from ozlabs.org (ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fyb3K2NQpz2yy9
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Jun 2021 22:12:13 +1000 (AEST)
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4Fyb3J41gsz9sRN; Sun,  6 Jun 2021 22:12:12 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1620903820-68213-1-git-send-email-jiapeng.chong@linux.alibaba.com>
References: <1620903820-68213-1-git-send-email-jiapeng.chong@linux.alibaba.com>
Subject: Re: [PATCH] selftests/powerpc: Fix duplicate included pthread.h
Message-Id: <162298131858.2353459.10654405461714592334.b4-ty@ellerman.id.au>
Date: Sun, 06 Jun 2021 22:08:38 +1000
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
 paulus@samba.org, linux-kselftest@vger.kernel.org, shuah@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 13 May 2021 19:03:40 +0800, Jiapeng Chong wrote:
> Clean up the following includecheck warning:
> 
> ./tools/testing/selftests/powerpc/tm/tm-vmx-unavail.c: pthread.h is
> included more than once.
> 
> No functional change.

Applied to powerpc/next.

[1/1] selftests/powerpc: Fix duplicate included pthread.h
      https://git.kernel.org/powerpc/c/c67454615cf95160cb806f7a471158a901eb261d

cheers
