Return-Path: <linuxppc-dev+bounces-8480-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F2AB1C86
	for <lists+linuxppc-dev@lfdr.de>; Fri,  9 May 2025 20:43:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZvHvC2gVZz30Vy;
	Sat, 10 May 2025 04:43:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746816198;
	cv=none; b=fPvcIyE/3ji1JBfXyWnCxZOQaznZpLrrTi24yn7nur4cSeEAyo1WDl+yQQ5su8nCdVu/JjVGoiGWDUOO6o/62i+TfuN9e9/DDLB5ixC+yRXUz/cDQJTF68EYo7P0gnXIooSGolncQ5AystRq2f/bBaEvcsw12kkA3OtvrP6NJcnVcJEfatLp3joEMwiavDTyhy4LqljyBj99h+rs61z94BQZ4n4ESpyRwQ5DAWKR/3DaP/daPT76wqUnSBt85Gvy8MvX+I6rLT6eOzjuuVWT7wSLysoZ6dSWIBmlgPRrytFXX5/Ch8osvXxL3/CMQDfn7p09GQ6d1Kgz5+pTLEPxpA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746816198; c=relaxed/relaxed;
	bh=3ndxIwpqni0a6tDVrjZprOorINLiqY/weaUCp02laXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AByg8I8+dHN8l5XuQFtKJD6hNY309UPr9mquRbiH5vAoCpDzCLtz3hLNgdHjcr2EZB63fVMTpCtIsBJIMaI1abKAdfUlIZVoXxac9xbnMFb0qQbWqSP4pcYeRYxJ9NvxElJXxQilAO8ce1vae0IaVmUcYGtLc08r4bD05NeB1s3sPRA1+oWzqpa1WgpPGRxoadCT0UFXFX1LVbU4u6rRF2inRdYDjrZqIxU6ZgI44XMsF5bKc5RPWdaebEti2C3Zti9UmpYOIHhIhwiT9LRKD5xQZqnQp0AkmD66D3q4ySiBaaGAEwIFsoR8mIB3ZmjhGVKAbn66KNxpCyMXfpLgbw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UGTqhrsM; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UGTqhrsM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZvHv84kSNz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 10 May 2025 04:43:16 +1000 (AEST)
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a1f9791a4dso514501f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 09 May 2025 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746816192; x=1747420992; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ndxIwpqni0a6tDVrjZprOorINLiqY/weaUCp02laXM=;
        b=UGTqhrsMR7SsPOJQCzrPxWdZs7VUksmemrkxt/3eS0RP0pjr4aoarVWUbeCsAzbtxO
         rrLQF2w5a3IpzhXqnrc6asoefQ8gKBvt6cIKgRzZo+Fzk/4gZ7Eh5EIqxTt1jeTKxmpW
         gxCnHoKF6JTritUirTTOf5P+aKaitzm6wVgrEQ/AROBE55yRrI4bLh83VhmOTFxe8UZB
         eRkQsagufKIYlakFBhPjyNtGZbeX9w4dhyrFjbO3n6AaB+P7f8taTMYukA9d0tbEF4F/
         LIkFAUMGeL7oV+It0WKdg9TrEKzVIlq5IeQvYhYSvwTBMaTTLootIB3YQawVnwSZIYpj
         UBcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746816192; x=1747420992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ndxIwpqni0a6tDVrjZprOorINLiqY/weaUCp02laXM=;
        b=hNbCp4V9VC6vvNPTZaXK59x8ZoKe0p/ocUyk90CDvN+yrAsNK7lokeEZ5at4m4Vq5n
         KK1WGiOgD29vUe02BRqI5x5o0F/8Mg8jqiNMnDMGmvMkupqyJMLDI7k/K4hwpdmPTFWV
         kkCX0mJL4mCPQkiv5DLN/GnJG1RNgrAQX3Ppu+V4vwT1fZnyhNcaNjIYZa0PUp1cahrw
         nUALE+m/j1kjzNtvECP2GcHSDPw1j/nOqSe02PB5uGNQaXgaLszWtJ/gc43/L6C7BwHL
         IwX4yta3sdZOdqzcV6UkPjyh+r1X4bKquvhq7RTaaVt+0BXiMDPNTorH0Hqjt3DhBwh6
         uMSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqzoiYdx5FaKG21Lv5v2k9LNtcawHzySvEwM9s2seyyomUvE1Xj/IDREV+PwN3fUiVOxwkE/g3bKAikaU=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzsn0hLUegDv3ad5a45FEt05lNeP/Dkw1WGfaE/a5wt9Q8Lq38D
	XQeaK4gX9Ycom3F+pUog+jPSnIbViJtwzQeXz76DzxA0psO4gL/XERQU3QHwqhN+WMy6YJObf/M
	LglpwcUfPbgjQB4FiGtjBj1hvfAo=
X-Gm-Gg: ASbGnctsrhkYb7zcVbuJnOm6tkLXVJZOeBcXmVSRvu/1NqNbDI7muV+I7/OJn8talot
	uUb/0yVOEfTCZzEa6ZcHsgilTGv8lHphHLiUo7oa1tWyhKklMb9nCbc/b8AMj/sPEKgZLDP1HDf
	vQci8T+w/LYeHrHw2/P2dj8lGR/9NaDpcp4p26B4OlkCP2gQuW
X-Google-Smtp-Source: AGHT+IFYnZD9y+hjO9CRH7JbZRqwYwFvCe82Ke5Lt/BeQLTVkbi1WQsCzGbxCZtrM0Gj1TEWNbFMvXBqV8FmzAVdtuA=
X-Received: by 2002:a05:6000:2506:b0:391:22a9:4408 with SMTP id
 ffacd0b85a97d-3a1f64386eemr3845245f8f.16.1746816191780; Fri, 09 May 2025
 11:43:11 -0700 (PDT)
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
References: <20250501073603.1402960-1-luis.gerhorst@fau.de> <174681603001.3715348.12288999798860158953.git-patchwork-notify@kernel.org>
In-Reply-To: <174681603001.3715348.12288999798860158953.git-patchwork-notify@kernel.org>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Fri, 9 May 2025 11:43:00 -0700
X-Gm-Features: AX0GCFvLVth5qvdC1z-BgTiCYbsMNaP7ne4n5tL7wLi4uocO_ruonz0SxGJeZGA
Message-ID: <CAADnVQJ+=Tip0ocob2aWe4G0BTs4F7veMtM-DD7f-zGKncAa_g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 00/11] bpf: Mitigate Spectre v1 using barriers
To: patchwork-bot+netdevbpf@kernel.org
Cc: Luis Gerhorst <luis.gerhorst@fau.de>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Puranjay Mohan <puranjay@kernel.org>, 
	Xu Kuohai <xukuohai@huaweicloud.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen@kernel.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Mykola Lysenko <mykolal@fb.com>, Shuah Khan <shuah@kernel.org>, 
	Henriette Herzog <henriette.herzog@rub.de>, Saket Kumar Bhaskar <skb99@linux.ibm.com>, 
	Cupertino Miranda <cupertino.miranda@oracle.com>, Jiayuan Chen <mrpre@163.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, May 9, 2025 at 11:39=E2=80=AFAM <patchwork-bot+netdevbpf@kernel.org=
> wrote:
>
> Hello:
>
> This series was applied to bpf/bpf-next.git (master)
> by Alexei Starovoitov <ast@kernel.org>:
>
> On Thu,  1 May 2025 09:35:51 +0200 you wrote:
> > This improves the expressiveness of unprivileged BPF by inserting
> > speculation barriers instead of rejecting the programs.
> >
> > The approach was previously presented at LPC'24 [1] and RAID'24 [2].
> >
> > To mitigate the Spectre v1 (PHT) vulnerability, the kernel rejects
> > potentially-dangerous unprivileged BPF programs as of
> > commit 9183671af6db ("bpf: Fix leakage under speculation on mispredicte=
d
> > branches"). In [2], we have analyzed 364 object files from open source
> > projects (Linux Samples and Selftests, BCC, Loxilb, Cilium, libbpf
> > Examples, Parca, and Prevail) and found that this affects 31% to 54% of
> > programs.
> >
> > [...]
>
> Here is the summary with links:
>   - [bpf-next,v3,01/11] selftests/bpf: Fix caps for __xlated/jited_unpriv
>     https://git.kernel.org/bpf/bpf-next/c/cf15cdc0f0f3
>   - [bpf-next,v3,02/11] bpf: Move insn if/else into do_check_insn()
>     (no matching commit)

Applied the first patch only.
Waiting for respin of the rest.

