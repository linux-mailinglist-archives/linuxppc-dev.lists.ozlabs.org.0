Return-Path: <linuxppc-dev+bounces-14297-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DC78C6951B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Nov 2025 13:16:27 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d9k9h5yBtz2yv9;
	Tue, 18 Nov 2025 23:16:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763468184;
	cv=none; b=UAj/wXV9woQesTj7hNQqm8nhKK0sxAyTB7nGR4AFDzSkDQw7BDBL7zJ7c66c0KjiTmL7OFetaBbhyTlAgE8GIOb7wCdY9jpX/BM6RjG3eSQSUushWf5YV66o7Nrio/wBFyaoI4VHnKc3Lk3ah/S/EriXe0m+XEV7YZM3DrmVaGudjyjLXxcQjjHBC8gl2FtLYBAdNAM8kDxqgBiVX8r1i528041e9Qz63XIiZYZfYByf5j0AHH/3fi5n7vbBPgBT2mqczbbEUqwPrGkyWsya0ojDDxUFbaK39swNlsy+G6cw55JIWmRZ75HA7XvKBD+nPvIVj5sTqQdhrrN0Ck5oHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763468184; c=relaxed/relaxed;
	bh=lVT6MctvUvtMoez5YracrZ6FhN51eBNlq0c8t/rOsFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=ccrsbfmPAtsYupOBypKM88jSfIUiTAzoyxzzMYiqldgO3G2pQJh1JGPC5ld9CgH6MOD/21hbZYHbR+fgJkxfAJ92+o57BtZzi2Hou3auCcZjLTUIn1t57qjGObjgIqLYLMlEFpU9FOgsbfxa2VHDqDCuZTGe6owdpmWfuidR3yk/wvyDLVz0BBlNENERscs8q7cwvlgUjWxnVqmP5dRvygrwlACzitJ5TaArQjVIj18lkmNbBhsuQ9vfqua/Cr8PAC+h+kcgkq8Sd2cDDm2CaTnSYRscVrZ2a4eq29iRe7ySrGUMnqcNCwj5I/UEgdFcboVLi4VynVtQG1gpE/pGIw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tZSI97HY; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=tZSI97HY;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=puranjay@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d9k9g5qNzz2yqP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Nov 2025 23:16:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DFE240052;
	Tue, 18 Nov 2025 12:16:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DFC3C2BC87;
	Tue, 18 Nov 2025 12:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763468181;
	bh=NDB8zwmWSTVU1id8kMQajfeIzzTo3lZzUCYfR5Bj2DU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=tZSI97HYHNPl3L5KUfMb0dR2U/wzbcuAVrIyCM+H/wCGCfA2wLZHJ4RGsLch320Po
	 2yoQr43fJVMkBUZxQxd3tLZbOO4CZ14+mPIxzGrDRo7lPxFUNPGuPAsVxYcgxLN+jI
	 cBSBDcmOPiFmzpSl7nX0M9/3boiGVlava4RfB0/6t9jpP9sNd1GSPtwpJLLSQ1HasJ
	 9dVgZOUGZLTkItL9p9rtPj05L7O6tmqq5K6X7rBZ4NDXSjcqBTamOJykSybjx76/+q
	 lC8FabexGv7q2NLxXGDWr1AaISDLUp/JGBxuiN5AYU4weEv7vJ7mg0YImxN0gbu2zH
	 MQoRvbG+okbAg==
From: Puranjay Mohan <puranjay@kernel.org>
To: Saket Kumar Bhaskar <skb99@linux.ibm.com>, bpf@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 christophe.leroy@csgroup.eu, naveen@kernel.org, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Inline helper in powerpc JIT
In-Reply-To: <cover.1762422548.git.skb99@linux.ibm.com>
References: <cover.1762422548.git.skb99@linux.ibm.com>
Date: Tue, 18 Nov 2025 12:16:16 +0000
Message-ID: <mb61pbjkzmt7z.fsf@kernel.org>
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
Content-Type: text/plain
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Saket Kumar Bhaskar <skb99@linux.ibm.com> writes:

> This series add support for internal only per-CPU instructions,
> inlines the bpf_get_smp_processor_id() and bpf_get_current_task()
> helper calls for powerpc BPF JIT.
>
> Changes since v1:
> * Addressed Christophe's comments.
> * Inlined bpf_get_current_task() as well.
>
> v1: https://lore.kernel.org/all/20250311160955.825647-1-skb99@linux.ibm.com/ 
>
> Saket Kumar Bhaskar (2):
>   powerpc64/bpf: Support internal-only MOV instruction to resolve
>     per-CPU addrs
>   powerpc64/bpf: Inline bpf_get_smp_processor_id() and
>     bpf_get_current_task()
>
>  arch/powerpc/net/bpf_jit_comp.c   | 16 ++++++++++++++++
>  arch/powerpc/net/bpf_jit_comp64.c | 19 +++++++++++++++++++
>  2 files changed, 35 insertions(+)

For both the patches:

Reviewed-by: Puranjay Mohan <puranjay@kernel.org>

