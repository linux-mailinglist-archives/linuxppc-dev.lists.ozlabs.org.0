Return-Path: <linuxppc-dev+bounces-8479-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 055F2AB1C73
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 20:40:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvHqQ1Gcrz3blF;
	Sat, 10 May 2025 04:40:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=147.75.193.91
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746815999;
	cv=none; b=CEyRE79cS3hWRs/UGDBRjm+4B9css5NmxOA3Pln0bo5H5R9WZqWyn9hcs7AucTgB6MBS407OzVOqgtNnz1Ab6BhYBpHxKeMKTsmH+W75QeUyBcnYcZlJg7Uj/c5b1tXcFpT+Hqi4zMGQBdxowQ9T3jPkFtJtDUBeSC1fSygtQNDiEZhwSXxFaaqup5vFkkDj5jCa+jW+sDHZha0yrpz2zWjSFf0E289erbx8ppx/TwD9b58uhH9TC3KYrYy3zqdY6QhRQvw70+64MjtfVNvxsaNAXupK8Y3CqzlRLKqh2JwcdjexWdiZbV1WpNTmMsOsclI7jAAr/m11TilXZ7PDVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746815999; c=relaxed/relaxed;
	bh=t7YPFkKsM8XEdUC86jlkdQ4IF2PnbIQWQ0GDK0pNlj0=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=AJCcHThv44rVLr3SbXeQt5CUvLVyd3r3HvUDmS5DdZ3WFZhnT7C7OXgCe46+JrJaFqlsYfFR39J4DcMG1lXo98r0BOMlFWu5lZOOeCTBztLZFbhLvGn0DP0yrp+0rKhS6ugpx16iFef3HIP/o6JlXtFugvyRNYnzaJG56WN2ocT7vFNCPa/ZKq8QOUKxSOjIpwoM9/eBSyaHmDGXzbawvTEWdeCe4VBjkz3UcFkcOVRaqcZUEOEuOKZmg7Mq9qSbgQxRtdI91bX8GzpDYqzklJ44lJiOID5kdVA3j2OHt8dd2lTAptuLYeJq44Jt+TGtrJuYiVOQtvoi9fE1Kh0IlQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OubpBByX; dkim-atps=neutral; spf=pass (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=OubpBByX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=147.75.193.91; helo=nyc.source.kernel.org; envelope-from=patchwork-bot+netdevbpf@kernel.org; receiver=lists.ozlabs.org)
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvHqL0cpXz30Vn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 04:39:57 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 011D5A4C747;
	Fri,  9 May 2025 18:39:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A65C4CEE4;
	Fri,  9 May 2025 18:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746815991;
	bh=Wz4glreSt8DlgIrM5HvJHSb+qrAyVPEKF6wXqMPedMQ=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=OubpBByXk3rxJnekSB6DqSDgiFfKLhWsBxZh0t1IZ2Pfr50qJu2Nq3RMnlOgR3obn
	 T+tUkNTYQdvQn4il0XqegaKDa0YOAYslfjRz+fdINWnhDl/c6TP+bpquW/nIinjqvv
	 6nvWLogb/LAzmEdxv3+rCzk3z+vqyRiQpFwK7ewGA+9TBly/HIIMouhFsYiL+QsLbU
	 IMP8XwXoUyPisDHs1ZE67QVTv8OO3Np+b06XC1tNbqRBlqMltRKlQ6Vpgc55nf6En+
	 AwHPBoZZlLsuLktnkZy/zaPBr67dbDqQtru0wDZ7JeA3kh/wmGZmPhg1NusYS7MqrM
	 lnKxF1tllRmNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 34071380DBCB;
	Fri,  9 May 2025 18:40:31 +0000 (UTC)
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
Subject: Re: [PATCH bpf-next v3 00/11] bpf: Mitigate Spectre v1 using barriers
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <174681603001.3715348.12288999798860158953.git-patchwork-notify@kernel.org>
Date: Fri, 09 May 2025 18:40:30 +0000
References: <20250501073603.1402960-1-luis.gerhorst@fau.de>
In-Reply-To: <20250501073603.1402960-1-luis.gerhorst@fau.de>
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
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hello:

This series was applied to bpf/bpf-next.git (master)
by Alexei Starovoitov <ast@kernel.org>:

On Thu,  1 May 2025 09:35:51 +0200 you wrote:
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
  - [bpf-next,v3,01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
    https://git.kernel.org/bpf/bpf-next/c/cf15cdc0f0f3
  - [bpf-next,v3,02/11] bpf: Move insn if/else into do_check_insn()
    (no matching commit)
  - [bpf-next,v3,03/11] bpf: Return -EFAULT on misconfigurations
    (no matching commit)
  - [bpf-next,v3,04/11] bpf: Return -EFAULT on internal errors
    (no matching commit)
  - [bpf-next,v3,05/11] bpf, arm64, powerpc: Add bpf_jit_bypass_spec_v1/v4()
    (no matching commit)
  - [bpf-next,v3,06/11] bpf, arm64, powerpc: Change nospec to include v1 barrier
    (no matching commit)
  - [bpf-next,v3,07/11] bpf: Rename sanitize_stack_spill to nospec_result
    (no matching commit)
  - [bpf-next,v3,08/11] bpf: Fall back to nospec for Spectre v1
    (no matching commit)
  - [bpf-next,v3,09/11] selftests/bpf: Add test for Spectre v1 mitigation
    (no matching commit)
  - [bpf-next,v3,10/11] bpf: Allow nospec-protected var-offset stack access
    (no matching commit)
  - [bpf-next,v3,11/11] bpf: Fall back to nospec for sanitization-failures
    (no matching commit)

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html



