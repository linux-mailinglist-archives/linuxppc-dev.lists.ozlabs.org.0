Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A796D8C98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 03:14:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsNnJ2x24z3fRM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 11:14:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsNjr67Nyz3bT7
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 11:11:12 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4PsNjn5SJJz4xFL;
	Thu,  6 Apr 2023 11:11:09 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <99ca1da2e5a6cf82a8abf4bc034918e500e31781.1677513277.git.christophe.leroy@csgroup.eu>
References: <99ca1da2e5a6cf82a8abf4bc034918e500e31781.1677513277.git.christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/perf: Properly detect mpc7450 family
Message-Id: <168074339918.3678997.525922814661699693.b4-ty@ellerman.id.au>
Date: Thu, 06 Apr 2023 11:09:59 +1000
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dan Carpenter <error27@gmail.com>, kernel test robot <lkp@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 27 Feb 2023 16:54:45 +0100, Christophe Leroy wrote:
> Unlike PVR_POWER8, etc ...., PVR_7450 represents a full PVR
> value and not a family value.
> 
> To avoid confusion, do like E500 family and define the relevant
> PVR_VER_xxxx values for the 7450 family:
>   0x8000 ==> 7450
>   0x8001 ==> 7455
>   0x8002 ==> 7447
>   0x8003 ==> 7447A
>   0x8004 ==> 7448
> 
> [...]

Applied to powerpc/next.

[1/1] powerpc/perf: Properly detect mpc7450 family
      https://git.kernel.org/powerpc/c/e7299f961fe5e4496db0bfaa9e819f5e97f3846b

cheers
