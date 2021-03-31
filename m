Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 641653507A2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Mar 2021 21:51:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F9cQS1qZzz3bvk
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Apr 2021 06:51:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256 header.s=20201203 header.b=fUGiKxNL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=lwn.net
 (client-ip=45.79.88.28; helo=ms.lwn.net; envelope-from=corbet@lwn.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=lwn.net header.i=@lwn.net header.a=rsa-sha256
 header.s=20201203 header.b=fUGiKxNL; dkim-atps=neutral
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F9cQ33jJqz303F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Apr 2021 06:51:23 +1100 (AEDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ms.lwn.net (Postfix) with ESMTPSA id 1D1199B1;
 Wed, 31 Mar 2021 19:51:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1D1199B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
 t=1617220275; bh=EEHjSy38eDkmBHhG9hxDYKTsPRe7jW1nMUaESQgRSZ4=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=fUGiKxNLoWOp9UgcEzIj2nD17PVe/e5M1wKm1NO/65qhkBtSsnSCOSttgx0hCtlax
 uiZqOiAFjz6RxkZdXBgp+Sf376WP3boJ4oxRPYSTn8fHN/4XrbRm8IPi4/3Le36uTU
 QKFDjOhOtc8lZ95U286rbce6XWiKDyIKSfRLg/B3sRkkt2ge8CPyAAyJ3qryiRpYRv
 LHXZzykKfixxlvFakMoo/rBtRWC6ECIgslWeE9HOc5c7jbOOtuEFB939L2wlEeTsfH
 xEJ84PVovuJ+8BSjOXuUrIy2MCvCgQOh4ONH6fdIsK/luWJUCA7FhNNql//WAym8G/
 45RQ3DmZ2mZ3Q==
From: Jonathan Corbet <corbet@lwn.net>
To: He Ying <heying24@huawei.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org, ruscur@russell.cc,
 oohall@gmail.com, heying24@huawei.com
Subject: Re: [PATCH] docs: powerpc: Fix misspellings and grammar errors
In-Reply-To: <20210326100853.173586-1-heying24@huawei.com>
References: <20210326100853.173586-1-heying24@huawei.com>
Date: Wed, 31 Mar 2021 13:51:14 -0600
Message-ID: <878s63ksp9.fsf@meer.lwn.net>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

He Ying <heying24@huawei.com> writes:

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: He Ying <heying24@huawei.com>
> ---
>  Documentation/powerpc/booting.rst                | 2 +-
>  Documentation/powerpc/dawr-power9.rst            | 2 +-
>  Documentation/powerpc/eeh-pci-error-recovery.rst | 2 +-
>  Documentation/powerpc/elfnote.rst                | 2 +-
>  Documentation/powerpc/firmware-assisted-dump.rst | 2 +-
>  Documentation/powerpc/kaslr-booke32.rst          | 2 +-
>  Documentation/powerpc/mpc52xx.rst                | 2 +-
>  Documentation/powerpc/papr_hcalls.rst            | 4 ++--
>  Documentation/powerpc/transactional_memory.rst   | 4 ++--
>  9 files changed, 11 insertions(+), 11 deletions(-)

Applied, thanks.

jon
