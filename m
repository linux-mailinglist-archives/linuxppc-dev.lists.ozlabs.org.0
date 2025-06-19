Return-Path: <linuxppc-dev+bounces-9559-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5492FAE0B98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 18:59:50 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNRfn1RRDz2xck;
	Fri, 20 Jun 2025 02:59:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750352385;
	cv=none; b=V6xGWJ2Y5WzmeXFoJrGRRVpIPFPehVFoVaIRBJWH4XwPh/92wQYqRw2I1SUAKE+aWx/229v9QeSd3UPHGFm3jk8NxMF4cxg9U3Ry9bG9wrmPfRLE0cXEKSCa6hlyWOxNeYUJ7Pzqj4Y8qC9GPrHpA1mgoJfsMd1mPF7UUFgvviGpBycJ9SV4zrowfaeg0uAn3+BUtU96YbymPIwFqu0e9y/pa06laEDEdhiUxUNf+lywZrEBMPd0ddZ1wIwt9zoxxoQtGKpvQMGPnbe63D1LsxSzoAzjFLUqXxTKfcez/gELeQbod7nQT9OuPzGuY+RDMexIb6A7bl2oGLHGwS4xLA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750352385; c=relaxed/relaxed;
	bh=8R0Vd2pPsa4rgEdjQ0FBu+6EOwuUq1suw/LdXfwqqmc=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=ewaGItbNn1sAGngW2Ch5t/7Cz0n6Qv+uwwjmECtJq3uSCXH48s8jhBmewnTEcM3FkH2Q9JRUzH1ZeTv8WkCLPgKylmiju/2PirfJLsEcaQBMFAQS1v01nHQ2sEuKbs8fqZNwnZTvHHbGX/et5qVTd/uxjFmthaLSuxfwvpB7wrjSMjy7OGWrnbxtx3ouXRoHxDDHIsw1YVxC+21DQx7jnBYmPHPUdjYHK/lptxscczT9vleQKnMYxByWVHQQwKAZaE63PuxUI9ZcQDpcjyK4IED8kjP+DocpZ5WvdfoidelTgKGEgz9CzTcyoNU3wrfiDaohqlTYmgXTGG8vnxmsow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pXeDNCIK; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pXeDNCIK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bNRfl5h7kz2xRs
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 02:59:43 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7791F5C56B2;
	Thu, 19 Jun 2025 16:57:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C3DC4CEED;
	Thu, 19 Jun 2025 16:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750352380;
	bh=3sefG8/vtnmM4Y1Up4QxPE41PMrinJ5aNw+R4DyddVM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=pXeDNCIKdx455YyLs3gYFYaPJ/ebRE3aH4+hSK1Y8PR3bJBKpjEWfap7jTsepnA7G
	 1WJrbtv2Qgs4tol2mUApEgP04KwWwKyR2jMkk90L+eE7KjoLjvsUqOwoAOHz/jtVix
	 Oi3emfUa4mM9HCxVoodwPFU65o9K+5oC14/Pw/GvodcDokSaYMBnH6doiP/ynAReQY
	 MeDMaidaA4caD/v3ThpXW2lTkwlck8vpyeoYOL18Q9w+81yDbZf+3i/T9g8h0QlFHf
	 tPKhSOpvRHnFVv9UWtf8kbfvMb4emRoxI4A+GNoZzE7Kva5tlWO0ES+iVp8E3g09Sj
	 8fSa9JkCx1BjQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id EAF5138111DD;
	Thu, 19 Jun 2025 17:00:09 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH bpf-next] powerpc/bpf: Fix warning for unused
 ori31_emitted
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <175035240860.927642.9498689393888953478.git-patchwork-notify@kernel.org>
Date: Thu, 19 Jun 2025 17:00:08 +0000
References: <20250619142647.2157017-1-luis.gerhorst@fau.de>
In-Reply-To: <20250619142647.2157017-1-luis.gerhorst@fau.de>
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, hbathini@linux.ibm.com,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, lkp@intel.com
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This patch was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu, 19 Jun 2025 16:26:47 +0200 you wrote:
> Without this, the compiler (clang21) might emit a warning under W=1
> because the variable ori31_emitted is set but never used if
> CONFIG_PPC_BOOK3S_64=n.
> 
> Without this patch:
> 
> $ make -j $(nproc) W=1 ARCH=powerpc SHELL=/bin/bash arch/powerpc/net
>   [...]
>   CC      arch/powerpc/net/bpf_jit_comp.o
>   CC      arch/powerpc/net/bpf_jit_comp64.o
> ../arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
> ../arch/powerpc/net/bpf_jit_comp64.c:417:28: warning: variable 'ori31_emitted' set but not used [-Wunused-but-set-variable]
>   417 |         bool sync_emitted, ori31_emitted;
>       |                            ^~~~~~~~~~~~~
>   AR      arch/powerpc/net/built-in.a
> 
> [...]

Here is the summary with links:
  - [bpf-next] powerpc/bpf: Fix warning for unused ori31_emitted
    https://git.kernel.org/bpf/bpf-next/c/e30329b8a647

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



