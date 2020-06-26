Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D080420ABB0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 07:06:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tPxh2cq5zDr3Y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 15:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tPTp3KKDzDqZx
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:46:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 49tPTk46GLz9sT6; Fri, 26 Jun 2020 14:46:01 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 Murilo Opsfelder Araujo <muriloo@linux.ibm.com>
In-Reply-To: <20200610215114.167544-1-muriloo@linux.ibm.com>
References: <20200610215114.167544-1-muriloo@linux.ibm.com>
Subject: Re: [PATCH 0/3] powerpc/dt_cpu_ftrs: Make use of ISA_V3_* macros
Message-Id: <159314672575.1150869.4769012042408741773.b4-ty@ellerman.id.au>
Date: Fri, 26 Jun 2020 14:46:01 +1000 (AEST)
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
Cc: Alistair Popple <alistair@popple.id.au>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Murilo Opsfelder Araujo <mopsfelder@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Jordan Niethe <jniethe5@gmail.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 10 Jun 2020 18:51:11 -0300, Murilo Opsfelder Araujo wrote:
> The first patch removes unused macro ISA_V2_07B.  The second and third
> patches make use of macros ISA_V3_0B and ISA_V3_1, respectively,
> instead their corresponding literals.
> 
> Murilo Opsfelder Araujo (3):
>   powerpc/dt_cpu_ftrs: Remove unused macro ISA_V2_07B
>   powerpc/dt_cpu_ftrs: Make use of macro ISA_V3_0B
>   powerpc/dt_cpu_ftrs: Make use of macro ISA_V3_1
> 
> [...]

Applied to powerpc/next.

[1/3] powerpc/dt_cpu_ftrs: Remove unused macro ISA_V2_07B
      https://git.kernel.org/powerpc/c/f39eb5d8ac707fd59029a06c3f985f29b1aaa26b
[2/3] powerpc/dt_cpu_ftrs: Make use of macro ISA_V3_0B
      https://git.kernel.org/powerpc/c/e781f12a60a7bddb50909d42478cca8724c8b113
[3/3] powerpc/dt_cpu_ftrs: Make use of macro ISA_V3_1
      https://git.kernel.org/powerpc/c/7714394706c0309b3f3fc474b390463d60eb6cb1

cheers
