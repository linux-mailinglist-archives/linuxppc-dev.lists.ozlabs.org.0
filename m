Return-Path: <linuxppc-dev+bounces-9236-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AE5AD2D4A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 07:30:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGcnJ3QtRz2ySY;
	Tue, 10 Jun 2025 15:30:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749533412;
	cv=none; b=XKSYHUFm2EWFSl8wZ+PipGYKs2g6plRO9o2ps3DM4gniTnbygV34kDSUDsncFuRx6hBz3Bq/urRh507bbhVq+4l1FlmPkI1Pl40VHYwq8j3meNVEJxkkoowtrEp98/Z61LjAAGfqRvGq8ZObGqXz4iVr6Sf24d6byGQyxLO1m0dDk59jhMRzUXu51HnDYtYxViWbSwzDvLRNULrzwBDQNsOTpbRzIwFax+u5fbVpxpW32gqfCPSMTZAyQZ6Gg0j70RHqr8Ptt1cH8kgcI9UEhQfZPQ8nSyoIxyi+l6OkkJ6vAGeqZteglsk1ES81JWBD2ut6qWx3i9flBegx5mUbJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749533412; c=relaxed/relaxed;
	bh=M8KcFLv4DqVEx9XwYGx3ar2NISVMl8LUhOOb7RrhJxY=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=BvSpwH7JGLDJ0+SpC1fTL/9nE5LFH+j2lE4Hu4sjBUZLs89kkgjMom+EEACySb9j8WeHtKVQHfmdL5R2fPxk41DGBnavtyLh9jVADZ9OLcpNhtyyPt9yIKl9trQF0lipF2KxmTDQiKTQj9NDaTG2wf4b+iP/AHGK7nKA3FeyYj0EtksxRNEjG38e9xaKHS4gyTJU6STdZvVAdAbLbvSQQatxuMGeBmA/Nu2EnvjtZij5Lr6LqswyWwdIzP8TEpkRYmlb7v/J0UZVvhPV2jZj+K1GfWbUeK/YtZyTPrJtO5Cc/7pDDaJjoi1yanaruhGG2Zhd76WfdkGeP09y+0oLHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVrYpges; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KVrYpges;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGcnH4Nkdz2yGQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 15:30:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10BF2614E0;
	Tue, 10 Jun 2025 05:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CF0C4CEEF;
	Tue, 10 Jun 2025 05:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749533408;
	bh=AirqLxaAn1XDcww7YIT/2rzH+IYyH+8RkAxc6uGReYs=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=KVrYpgesvClwcE62Y4eoV7SPMtyy0KeY1N9kYJS6gk6L+ykyW0g4V/rmMlRwsHekm
	 e5b/s6tAKzy+VIsxLBLkGQDD6LY1mkeIUKS9+BKAOVk1QV5Iu9Xl8/ymgkykmhyiIi
	 qCF8YFGPF3nAqDWaBMaSQmhtnCIlJT1fZ6h7VLeMUv9/GR3IQL13mRFA8cv1/skCSI
	 v1ObDw7MhTmaj9QOP+rsMT8ne4vhAbSuSm9bE2EYkO0jwY5H4lS+68vnt9mThfMih0
	 AsujfctxEEua0TUSrPFraj3Ycg0QWLUnMJAMP896nShsL1RmqIy95R7nJ42gITAAHS
	 T2NuytqPyee7A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 70C0C3822D49;
	Tue, 10 Jun 2025 05:30:40 +0000 (UTC)
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
Subject: Re: [PATCH bpf-next v4 0/9] bpf: Mitigate Spectre v1 using barriers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174953343925.1751142.14175959764771904757.git-patchwork-notify@kernel.org>
Date: Tue, 10 Jun 2025 05:30:39 +0000
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 xukuohai@huaweicloud.com, catalin.marinas@arm.com, will@kernel.org,
 hbathini@linux.ibm.com, christophe.leroy@csgroup.eu, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, mykolal@fb.com,
 shuah@kernel.org, henriette.herzog@rub.de, skb99@linux.ibm.com,
 cupertino.miranda@oracle.com, mrpre@163.com, m.shachnai@gmail.com,
 dimitar.kanaliev@siteground.com, shung-hsi.yu@suse.com, dxu@dxuuu.xyz,
 bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Tue,  3 Jun 2025 22:57:51 +0200 you wrote:
> This improves the expressiveness of unprivileged BPF by inserting
> speculation barriers instead of rejecting the programs.
> 
> The approach was previously presented at LPC'24 [1] and RAID'24 [2].
> 
> To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> potentially-dangerous unprivileged BPF programs as of
> commit 9183671af6db ("bpf: Fix leakage under speculation on mispredicted
> branches"). In [2], we have analyzed 364 object files from open source
> projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> programs.
> 
> [...]

Here is the summary with links:
  - [bpf-next,v4,1/9] bpf: Move insn if/else into do_check_insn()
    https://git.kernel.org/bpf/bpf-next/c/8b7df50fd40d
  - [bpf-next,v4,2/9] bpf: Return -EFAULT on misconfigurations
    https://git.kernel.org/bpf/bpf-next/c/fd508bde5d64
  - [bpf-next,v4,3/9] bpf: Return -EFAULT on internal errors
    https://git.kernel.org/bpf/bpf-next/c/6b84d7895d78
  - [bpf-next,v4,4/9] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
    https://git.kernel.org/bpf/bpf-next/c/03c68a0f8c68
  - [bpf-next,v4,5/9] bpf, arm64, powerpc: Change nospec to include v1 barrier
    https://git.kernel.org/bpf/bpf-next/c/dff883d9e93a
  - [bpf-next,v4,6/9] bpf: Rename sanitize_stack_spill to nospec_result
    https://git.kernel.org/bpf/bpf-next/c/9124a4508007
  - [bpf-next,v4,7/9] bpf: Fall back to nospec for Spectre v1
    https://git.kernel.org/bpf/bpf-next/c/d6f1c85f2253
  - [bpf-next,v4,8/9] selftests/bpf: Add test for Spectre v1 mitigation
    https://git.kernel.org/bpf/bpf-next/c/4a8765d9a527
  - [bpf-next,v4,9/9] bpf: Fall back to nospec for sanitization-failures
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



