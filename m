Return-Path: <linuxppc-dev+bounces-9235-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5E9AD2C0D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jun 2025 05:03:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bGYWs5lB9z2xHX;
	Tue, 10 Jun 2025 13:03:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::541"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749524601;
	cv=none; b=QMd6hnryPW8mWcJ7Co1B16yISwcsZQMaKdUfCG0wxC2jwBi3fotHX65X474QLWXs3W4mxx+ylgi7tL6ZdIJLm1JiBic+Ny/+Yp2J2Zj4DX9uDDvUWZvZJKYaZzBNise+JuWNFs5k0bo9rRUDoNWAC/YWnl05jFAcQwAdTPR+kK++6auWoBQ+/yTcZuS0S6m9X6SZO2q3gaIcdwPYdREeiRre8VynEsgMNbYtgr7xe3AnzXhzhj/hNW1zgRgqRXTT2YYJutixJDyfWlZknlT40xe4tW6AAZOHinunNghVV+RLFgaY/yZu0XN5OLfGuzQEbBGUhWvVrvoSMv69CcLe+w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749524601; c=relaxed/relaxed;
	bh=iIEKtN06Lki2LXMwWPqlBYVbjTpO1FFusGuijePViww=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OmWOuQb61uJUsmogojr4pNwcwyKmcAneQ6pwi+G+Y5cEZuPGtOLnDHSJNwcrzLgkCmvw7opNq1QVwd94aouj4OLrBrPOZcbHrKMonn3cuzs7U4lbYjPpl6L0R9n979Kbaz/9lS0Rymef4asYovtLNzCEoNV6x5YdlXnIgE4yH8mrmD8Et7lfyYYMuMwwK+GkvxrxtMye7xlpOoFDSFFuVVQcoX4Ha+FnYzIqr1OIJ8pO9xPgSGFggIiKMwND+5FxpPh4X6Isg4Nr1HUdHppHrnPE0I92M1td2vV4Pf0sD1CgrnUf/QbVOyMA+yv6k+Ie1FNaYVd42+yAir4i8aMu9A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7GnU7Ew; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=P7GnU7Ew;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::541; helo=mail-ed1-x541.google.com; envelope-from=memxor@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bGYWq3w9qz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jun 2025 13:03:18 +1000 (AEST)
Received: by mail-ed1-x541.google.com with SMTP id 4fb4d7f45d1cf-601dfef6a8dso8730365a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Jun 2025 20:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749524593; x=1750129393; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iIEKtN06Lki2LXMwWPqlBYVbjTpO1FFusGuijePViww=;
        b=P7GnU7Ew6Sa/bbbMD5Wujb5MNUCr/jBZNA1ci65Q+jC38JfqkYBNkWhnMjvmilhZsw
         Tg0X1y+gwLn1JT2G/0bOLwGnRHzpSBrejD2yBX0oknoVdGoKjHhIjG75TOIdMKmKTVq1
         e455T5yHJ47qfMow7/Cc/N9kUNFc/Fq2+1FWfiR8VRf+K9MZyZ09X7wZbLAQlcV1WXer
         t6ncglceewOAuIsFREVQ+jo1adqAAsLNeSPLcZrios6SCv/W+B1U0s2k0fCgTfI6CBjW
         9mFzZPJr9mMScuMsv7EPmDaNTn5qqQi9cgYpDSRWtmp7gz25I9yxEIAhVqigSQNjUTbw
         2oRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749524593; x=1750129393;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iIEKtN06Lki2LXMwWPqlBYVbjTpO1FFusGuijePViww=;
        b=CpxSeaX7/38CYEBRN9y6CON3nCzBIWvA/sgZPLFZ/1oiqX6lNNJOGWLAMDn3aO8W1/
         M6cYyZiPAVWtCsUJOUCFF6DNcFUaALCcu3fkvuY4Q5O24dHcxu2jXGe+a+WGF4WrqR5n
         9xZ7Umq6xbyQj2AGYozbthWuu7A/PBYK3MMwAlTgpdBbU1aDjTNis/SUm3VUFAlVpsu8
         WcbH05d/DptzjzErBahIRzmBS5sylofdVsZeNLlwRKKvOwAKT50unp586kqFBFHKZNir
         m1QqIbyjtZmjYNgdYmLVD4hBsPENu0GYKhDqbbRZN+r0UlFdHOx9KAVlfWF0kbQQrrvF
         hgdg==
X-Forwarded-Encrypted: i=1; AJvYcCXPYF7bdtEDlo6PyFbh0PqutUi/bQ5rgvIK2ir5i8JC1ZPticcHA7vbKA9LZrcMuzJu6/auFEhfNhHxzig=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxvGKVoS+LCn8ETUxj4oD8sYNdOkSpWJdtPJZeqM4QXMjB6yt/U
	Lv3eNQr77bI11ESBNqPM2D9Rq6n8GXT/JB5N1ffME5ncQVZ0sXryoYzpMi/U4knPQMUkWdVYqN1
	MMPgLzUv6zERvceBULmyerRBsgAsvcpI=
X-Gm-Gg: ASbGncvvKdQAKU3GEdsbJVtdJXb2dmGt4IMCEjtfIDsD6ilqJ4iRaKo8sD/DMMR5vrw
	L8R1BMywWLtjXAMhDEF1885kycoGBnltBFP+csLtyh/wGSvLFKag9sNznOAwMvcv5VkILoPvp98
	y7uSOh0I5ZDzKw39WiZGD5sWij4qbH0MmauSt/GKzw4s2KnyeYZKxVanAxlOU5QeORO8atkj5Bs
	Lm8jzj1wq8r47mx
X-Google-Smtp-Source: AGHT+IGSVrkhyZq9vvvsVr44VoqUZGF3wcQ/tPIjHH2PKLhYYyk/OK3JkxJPJ6OOCePVO2GT4bNI9XVsW4Z5WF4Rz1o=
X-Received: by 2002:a17:906:6a0e:b0:ad5:72d4:85f9 with SMTP id
 a640c23a62f3a-ade1a9c7cd2mr1539157966b.40.1749524592671; Mon, 09 Jun 2025
 20:03:12 -0700 (PDT)
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
References: <20250603205800.334980-1-luis.gerhorst@fau.de>
In-Reply-To: <20250603205800.334980-1-luis.gerhorst@fau.de>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Tue, 10 Jun 2025 05:02:36 +0200
X-Gm-Features: AX0GCFsg0jFdSRfQwjdMDtUT5JBYaZq4q7ARo5V7e_WrDdDiMUVd3IyUlXozaCc
Message-ID: <CAP01T76BFe57wUaqsQYFu0vk-ST1kSSk1MghDAUhS3n2F892AQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v4 0/9] bpf: Mitigate Spectre v1 using barriers
To: Luis Gerhorst <luis.gerhorst@fau.de>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 3 Jun 2025 at 23:04, Luis Gerhorst <luis.gerhorst@fau.de> wrote:
>
> This improves the expressiveness of unprivileged BPF by inserting
> speculation barriers instead of rejecting the programs.
>
> The approach was previously presented at LPC'24 [1] and RAID'24 [2].
>
> To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> potentially-dangerous unprivileged BPF programs as of
> commit 9183671af6db ("bpf: Fix leakage under speculation on mispredicted
> branches"). In [2], we have analyzed 364 object files from open source
> projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> programs.
>
> To resolve this in the majority of cases this patchset adds a fall-back
> for mitigating Spectre v1 using speculation barriers. The kernel still
> optimistically attempts to verify all speculative paths but uses
> speculation barriers against v1 when unsafe behavior is detected. This
> allows for more programs to be accepted without disabling the BPF
> Spectre mitigations (e.g., by setting cpu_mitigations_off()).
>
> For this, it relies on the fact that speculation barriers generally
> prevent all later instructions from executing if the speculation was not
> correct (not only loads). See patch 7 ("bpf: Fall back to nospec for
> Spectre v1") for a detailed description and references to the relevant
> vendor documentation (AMD and Intel x86-64, ARM64, and PowerPC).
>
> In [1] we have measured the overhead of this approach relative to having
> mitigations off and including the upstream Spectre v4 mitigations. For
> event tracing and stack-sampling profilers, we found that mitigations
> increase BPF program execution time by 0% to 62%. For the Loxilb network
> load balancer, we have measured a 14% slowdown in SCTP performance but
> no significant slowdown for TCP. This overhead only applies to programs
> that were previously rejected.
>
> I reran the expressiveness-evaluation with v6.14 and made sure the main
> results still match those from [1] and [2] (which used v6.5).
>
> Main design decisions are:
>
> * Do not use separate bytecode insns for v1 and v4 barriers (inspired by
>   Daniel Borkmann's question at LPC). This simplifies the verifier
>   significantly and has the only downside that performance on PowerPC is
>   not as high as it could be.
>
> * Allow archs to still disable v1/v4 mitigations separately by setting
>   bpf_jit_bypass_spec_v1/v4(). This has the benefit that archs can
>   benefit from improved BPF expressiveness / performance if they are not
>   vulnerable (e.g., ARM64 for v4 in the kernel).
>
> * Do not remove the empty BPF_NOSPEC implementation for backends for
>   which it is unknown whether they are vulnerable to Spectre v1.
>
> [1] https://lpc.events/event/18/contributions/1954/ ("Mitigating
>     Spectre-PHT using Speculation Barriers in Linux eBPF")
> [2] https://arxiv.org/pdf/2405.00078 ("VeriFence: Lightweight and
>     Precise Spectre Defenses for Untrusted Linux Kernel Extensions")
>
> Changes:
>
> * v3 -> v4:
>   - Remove insn parameter from do_check_insn() and extract
>     process_bpf_exit_full as a function as requested by Eduard
>   - Investigate apparent sanitize_check_bounds() bug reported by
>     Kartikeya (does appear to not be a bug but only confusing code),
>     sent separate patch to document it and add an assert
>   - Remove already-merged commit 1 ("selftests/bpf: Fix caps for
>     __xlated/jited_unpriv")
>   - Drop former commit 10 ("bpf: Allow nospec-protected var-offset stack
>     access") as it did not include a test and there are other places
>     where var-off is rejected. Also, none of the tested real-world
>     programs used var-off in the paper. Therefore keep the old behavior
>     for now and potentially prepare a patch that converts all cases
>     later if required.
>   - Add link to AMD lfence and PowerPC speculation barrier (ori 31,31,0)
>     documentation
>   - Move detailed barrier documentation to commit 7 ("bpf: Fall back to
>     nospec for Spectre v1")
>   - Link to v3: https://lore.kernel.org/all/20250501073603.1402960-1-luis.gerhorst@fau.de/
>

LGTM. For the set,

Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>

> [...]
>

