Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6EE544FC2
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jun 2022 16:47:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LJn4l3Cnbz3f3f
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Jun 2022 00:47:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LJn2J0HDCz3bmQ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Jun 2022 00:45:28 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4LJn2D62bSz4xZ0;
	Fri, 10 Jun 2022 00:45:24 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, Michael Ellerman <mpe@ellerman.id.au>, Masahiro Yamada <masahiroy@kernel.org>
In-Reply-To: <20220604085050.4078927-1-masahiroy@kernel.org>
References: <20220604085050.4078927-1-masahiroy@kernel.org>
Subject: Re: [PATCH] powerpc: get rid of #include <generated/compile.h>
Message-Id: <165478587541.589231.1462511723617855253.b4-ty@ellerman.id.au>
Date: Fri, 10 Jun 2022 00:44:35 +1000
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
Cc: Rob Herring <robh@kernel.org>, Jason Yan <yanaijie@huawei.com>, linux-kernel@vger.kernel.org, Scott Wood <oss@buserror.net>, Paul Mackerras <paulus@samba.org>, Frank Rowand <frank.rowand@sony.com>, Diana Craciun <diana.craciun@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 4 Jun 2022 17:50:50 +0900, Masahiro Yamada wrote:
> You cannot include <generated/compile.h> here because it is generated
> in init/Makefile but there is no guarantee that it happens before
> arch/powerpc/mm/nohash/kaslr_booke.c is compiled for parallel builds.
> 
> The places where you can reliably include <generated/compile.h> are:
> 
>   - init/          (because init/Makefile can specify the dependency)
>   - arch/*/boot/   (because it is compiled after vmlinux)
> 
> [...]

Applied to powerpc/fixes.

[1/1] powerpc: get rid of #include <generated/compile.h>
      https://git.kernel.org/powerpc/c/7ad4bd887d27c6b6ffbef216f19c19f8fe2b8f52

cheers
