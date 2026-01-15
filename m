Return-Path: <linuxppc-dev+bounces-15771-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92436D231DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Jan 2026 09:29:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dsGNv1MRBz2yFm;
	Thu, 15 Jan 2026 19:29:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768465759;
	cv=none; b=JlqsyBSl8spt0Bjswnqz+HyKUotGYT5P2EaWRsVbE26K56vYYFFnWcBIKYxJW9FXiSsc/oD7AF2I0MqkLPOhrS81jDev/DAtKUnnjwxAiFpsVw0pDNBAb1s09MTsvG7/4QA6AVLK5XWFUP4fcZ3j6YF36dINBdwgZ6CrNzti73ok9abHxe1hK/mx5kvpxFbGEyY5X07yo6gBQ5czTqOTDttLF5dmLMPwbpcEmuLGmLsg8lgT7Qqrwy/D2cA7XcfAy2ENY/hyZpMQ+64rQIqU3jhatxhzLj7t2MjTNm1tvCFswIxmN2EhvThVLH42MXcaw73mxXefCM0JIlufnuZhEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768465759; c=relaxed/relaxed;
	bh=5tox54NrdMRywUpRJiy/Yuqfiiccfx2lG1PHVIYEQGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=B8nXnEco4ZlI76IPGlZsrSN6Nq0JzatbkQFtyNnqHBflf+CEDNSX8wVl2bbUrUYxItpFGz+7R96PgG+CwKWL7bfOMxCXffhb3VDHa1hqXoVHKqJenlWHZ9xgcR+6OJ3cmjcWwMz4OHWqevIpqFfLDmv6BEcduSjrGAWsVoLGmpcVPWbmEQkXQ+TVI++E57QAVI47Z39vAKbsX+o2rfk4qns3WmvK2ZZRpUjtO5XCJrpH1Ombv3b0sy/BrsoTy3E6x3m1LOI0nxApXbhJrbdLhJh85wUFBSyK/vod4TVJqTJJzyrgr6pIg3KbSs5VVc8N1oQNdx//DSXf9HddZcxjrQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ayuJIOH0; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ayuJIOH0;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
X-Greylist: delayed 72084 seconds by postgrey-1.37 at boromir; Thu, 15 Jan 2026 19:29:18 AEDT
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dsGNt2Q9yz2xqj
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Jan 2026 19:29:17 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4145041A9B;
	Thu, 15 Jan 2026 08:29:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 113C8C19423;
	Thu, 15 Jan 2026 08:29:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768465756;
	bh=S7HCfIKFFGeY+CKuWgYtJmjmqfuD6022qSuM1DWTvnc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ayuJIOH08LJP9jBCA9D+qP6XHanepkz7rJN91tCFuJ39w3rIauqP/TYpFNDB5Fgyh
	 9dEae1j7KdrQrcE7qUgGouvdd4g5gNiDrEOhG3qmq3Z/DZqveVSNYOc23ejtV0VglA
	 JGq++rwmFRjjGO8C9u4t4G9phCIBr50fB6ARyhSS3lEN0TSBgjYJvg4d5XBnt5qFUL
	 Mp38kj1b3bvQ9RKHuLUdSaNBSiT+vMBm4WT+Vd9TTJZzb8lrxVLSgtiKQfo95yHH1Q
	 GV0Z5ZHP7nMGeU7Wgmb1eA1bE11tczFWkrPdIwyeAZAcAg+St3ltx8J5NIXP7TaiuP
	 +vG15luoN3kCg==
Message-ID: <2c0588cd-f71b-40e5-a2cd-269d27e35abc@kernel.org>
Date: Thu, 15 Jan 2026 09:29:06 +0100
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
Subject: Re: [PATCH v2 1/6] powerpc64/bpf: Move tail_call_cnt to bottom of
 stack frame
To: adubey@linux.ibm.com, bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: hbathini@linux.ibm.com, sachinpb@linux.ibm.com, venkat88@linux.ibm.com,
 andrii@kernel.org, eddyz87@gmail.com, mykolal@fb.com, ast@kernel.org,
 daniel@iogearbox.net, martin.lau@linux.dev, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, naveen@kernel.org,
 maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
 memxor@gmail.com, iii@linux.ibm.com, shuah@kernel.org
References: <20260114114450.30405-1-adubey@linux.ibm.com>
 <20260114114450.30405-2-adubey@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20260114114450.30405-2-adubey@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/01/2026 à 12:44, adubey@linux.ibm.com a écrit :
> From: Abhishek Dubey <adubey@linux.ibm.com>
> 
> In the conventional stack frame, the position of tail_call_cnt
> is after the NVR save area (BPF_PPC_STACK_SAVE). Whereas, the
> offset of tail_call_cnt in the trampoline frame is after the
> stack alignment padding. BPF JIT logic could become complex
> when dealing with frame-sensitive offset calculation of
> tail_call_cnt. Having the same offset in both frames is the
> desired objective.
> 
> The trampoline frame does not have a BPF_PPC_STACK_SAVE area.
> Introducing it leads to under-utilization of extra memory meant
> only for the offset alignment of tail_call_cnt.
> Another challenge is the variable alignment padding sitting at
> the bottom of the trampoline frame, which requires additional
> handling to compute tail_call_cnt offset.
> 
> This patch addresses the above issues by moving tail_call_cnt
> to the bottom of the stack frame at offset 0 for both types
> of frames. This saves additional bytes required by BPF_PPC_STACK_SAVE
> in trampoline frame, and a common offset computation for
> tail_call_cnt serves both frames.
> 
> The changes in this patch are required by the third patch in the
> series, where the 'reference to tail_call_info' of the main frame
> is copied into the trampoline frame from the previous frame.
> 
> Signed-off-by: Abhishek Dubey <adubey@linux.ibm.com>
> ---
>   arch/powerpc/net/bpf_jit.h        |  4 ++++
>   arch/powerpc/net/bpf_jit_comp64.c | 31 ++++++++++++++++++++-----------
>   2 files changed, 24 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/net/bpf_jit.h b/arch/powerpc/net/bpf_jit.h
> index 8334cd667bba..45d419c0ee73 100644
> --- a/arch/powerpc/net/bpf_jit.h
> +++ b/arch/powerpc/net/bpf_jit.h
> @@ -72,6 +72,10 @@
>   	} } while (0)
>   
>   #ifdef CONFIG_PPC64
> +
> +/* for tailcall counter */
> +#define BPF_PPC_TAILCALL        8

This needs to be defined outside of CONFIG_PPC64 ifdef because from 
patch 3 it is used in bpf_jit_comp.c which is also built on powerpc32.

> +
>   /* If dummy pass (!image), account for maximum possible instructions */
>   #define PPC_LI64(d, i)		do {					      \
>   	if (!image)							      \

