Return-Path: <linuxppc-dev+bounces-9558-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C85AE091C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Jun 2025 16:50:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNNnp1ZTkz2xck;
	Fri, 20 Jun 2025 00:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.236.30
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750344638;
	cv=none; b=NWJm6rLplCB3dl91ISEGnoDla9RWMxRmE25fp0anFQ3KQo8feePovqp+a4tJBVRkwn8aY+vTVXTBcoTfD1T2iXJcdWIhTOQJbQa4q2B4+AO7d0+L0GE9jikJ3LSQDZH2pYg+etk4JTnkHqZWngr9tssje+fnimXD19HCb+wySMyiyLXadQyIfn6nMwIewC1Qe9SdI37ev/y8nl/SkxEGy54EpFSIdxKlLIwIjNd6erHZuXDLmlV5PqZ0futl5Dx0NaPFKjeTf9aTpPGMGjTasdCTg89g63p2BUmuIwoevqsOJgAezw4ai0X7EYCTT2yY/PU7FzCBTcmJarY4Hh0XVg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750344638; c=relaxed/relaxed;
	bh=3tAxK+d14KVfk9zXyPCBUBnlG27HUqz14ux+9x9avWw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fi8SIBz/kZ0jOMyeWFq5uioqJaWf9hjVkaPFy8ZHTHxXE1xkEdgHm/Xidjkf9G12bXPw29Q4R5kRPxY66reQVUbh0DO7KfdqvSd6JsGHpLApgW+RHAoVoCdPy6W5q33McutX9ZB6WHMkF0zbiZ63CK05A5/htxaQaAdwKC1tloEMH5BVwbev7MiyOktKMdj5U/+Ka6rM6VSCNweDkr5SDERX+2ep9p7hi2eY/LaMERnwROhmXpCCt0+3Y2P0QnPEukXsRrc44FmNW23BV4WzhI8m5O67fLVATvksCFSdz96A/N7YQc2eR98ei/iTPCbedmNJbX83n91c+998HUTGSg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bNNnn2fHfz2xHZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 20 Jun 2025 00:50:36 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4bNNSQ43q2z9tMS;
	Thu, 19 Jun 2025 16:35:34 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jvK5WwOsEdLr; Thu, 19 Jun 2025 16:35:34 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4bNNSL6hPpz9tMd;
	Thu, 19 Jun 2025 16:35:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DC3A98B790;
	Thu, 19 Jun 2025 16:35:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6cuBk6pQxYZw; Thu, 19 Jun 2025 16:35:30 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 380198B78C;
	Thu, 19 Jun 2025 16:35:30 +0200 (CEST)
Message-ID: <f138b40e-095a-48f0-80b9-86685c640cd6@csgroup.eu>
Date: Thu, 19 Jun 2025 16:35:29 +0200
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next] powerpc/bpf: Fix warning for unused
 ori31_emitted
To: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov
 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau
 <martin.lau@linux.dev>, Eduard Zingerman <eddyz87@gmail.com>,
 Song Liu <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>,
 John Fastabend <john.fastabend@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
 Jiri Olsa <jolsa@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20250619142647.2157017-1-luis.gerhorst@fau.de>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20250619142647.2157017-1-luis.gerhorst@fau.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 19/06/2025 à 16:26, Luis Gerhorst a écrit :
> Without this, the compiler (clang21) might emit a warning under W=1
> because the variable ori31_emitted is set but never used if
> CONFIG_PPC_BOOK3S_64=n.
> 
> Without this patch:
> 
> $ make -j $(nproc) W=1 ARCH=powerpc SHELL=/bin/bash arch/powerpc/net
>    [...]
>    CC      arch/powerpc/net/bpf_jit_comp.o
>    CC      arch/powerpc/net/bpf_jit_comp64.o
> ../arch/powerpc/net/bpf_jit_comp64.c: In function 'bpf_jit_build_body':
> ../arch/powerpc/net/bpf_jit_comp64.c:417:28: warning: variable 'ori31_emitted' set but not used [-Wunused-but-set-variable]
>    417 |         bool sync_emitted, ori31_emitted;
>        |                            ^~~~~~~~~~~~~
>    AR      arch/powerpc/net/built-in.a
> 
> With this patch:
> 
>    [...]
>    CC      arch/powerpc/net/bpf_jit_comp.o
>    CC      arch/powerpc/net/bpf_jit_comp64.o
>    AR      arch/powerpc/net/built-in.a
> 
> Fixes: dff883d9e93a ("bpf, arm64, powerpc: Change nospec to include v1 barrier")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202506180402.uUXwVoSH-lkp@intel.com/
> Signed-off-by: Luis Gerhorst <luis.gerhorst@fau.de>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   arch/powerpc/net/bpf_jit_comp64.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit_comp64.c b/arch/powerpc/net/bpf_jit_comp64.c
> index 3665ff8bb4bc..a25a6ffe7d7c 100644
> --- a/arch/powerpc/net/bpf_jit_comp64.c
> +++ b/arch/powerpc/net/bpf_jit_comp64.c
> @@ -820,13 +820,12 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   		case BPF_ST | BPF_NOSPEC:
>   			sync_emitted = false;
>   			ori31_emitted = false;
> -#ifdef CONFIG_PPC_E500
> -			if (!bpf_jit_bypass_spec_v1()) {
> +			if (IS_ENABLED(CONFIG_PPC_E500) &&
> +			    !bpf_jit_bypass_spec_v1()) {
>   				EMIT(PPC_RAW_ISYNC());
>   				EMIT(PPC_RAW_SYNC());
>   				sync_emitted = true;
>   			}
> -#endif
>   			if (!bpf_jit_bypass_spec_v4()) {
>   				switch (stf_barrier) {
>   				case STF_BARRIER_EIEIO:
> @@ -849,10 +848,10 @@ int bpf_jit_build_body(struct bpf_prog *fp, u32 *image, u32 *fimage, struct code
>   					break;
>   				}
>   			}
> -#ifdef CONFIG_PPC_BOOK3S_64
> -			if (!bpf_jit_bypass_spec_v1() && !ori31_emitted)
> +			if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> +			    !bpf_jit_bypass_spec_v1() &&
> +			    !ori31_emitted)
>   				EMIT(PPC_RAW_ORI(_R31, _R31, 0));
> -#endif
>   			break;
>   
>   		/*
> 
> base-commit: cd7312a78f36e981939abe1cd1f21d355e083dfe


