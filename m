Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AC7F2630CE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 17:44:53 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmmYD71ZrzDqC0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Sep 2020 01:44:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bmjkd0XjzzDqFh
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 23:37:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Received: by ozlabs.org (Postfix, from userid 1034)
 id 4BmjkY6Y9Xz9sVZ; Wed,  9 Sep 2020 23:37:41 +1000 (AEST)
From: Michael Ellerman <patch-notifications@ellerman.id.au>
To: mpe@ellerman.id.au, zhengbin <zhengbin13@huawei.com>,
 linuxppc-dev@lists.ozlabs.org, benh@kernel.crashing.org, paulus@samba.org
In-Reply-To: <1574144074-142032-1-git-send-email-zhengbin13@huawei.com>
References: <1574144074-142032-1-git-send-email-zhengbin13@huawei.com>
Subject: Re: [PATCH 0/5] powerpc: Remove five unused variables
Message-Id: <159965824298.811679.9055020425603694906.b4-ty@ellerman.id.au>
Date: Wed,  9 Sep 2020 23:37:41 +1000 (AEST)
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 19 Nov 2019 14:14:29 +0800, zhengbin wrote:
> zhengbin (5):
>   powerpc/fadump: Remove set but not used variable 'elf'
>   powerpc/perf: Remove set but not used variable 'target'
>   powerpc/powernv: Remove set but not used variable 'total_vfs'
>   powerpc/powernv: Remove set but not used variable 'pdn'
>   powerpc/powernv: Remove set but not used variable 'parent'
> 
> [...]

Patches 1, 2 & 5 applied to powerpc/next.

[1/5] powerpc/fadump: Remove set but not used variable 'elf'
      https://git.kernel.org/powerpc/c/738e6cad0ace88edec8f4ffa082749ad5df26409
[2/5] powerpc/perf: Remove set but not used variable 'target'
      https://git.kernel.org/powerpc/c/ef23cf9a89a7aec19a29d548d1e219d436b23b6e
[5/5] powerpc/powernv: Remove set but not used variable 'parent'
      https://git.kernel.org/powerpc/c/18102e4bcc47f5b5ac70e2e4461d022c1ee6df24

cheers
