Return-Path: <linuxppc-dev+bounces-7194-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4938BA6833C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 03:41:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHXyV5SB4z2ydl;
	Wed, 19 Mar 2025 13:41:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742352066;
	cv=none; b=QXbHGnaAL81JiMVm/0+2+TjAXn7/8DegjvziROxljSHErI2L4pzEfMQTSBv+aoIRimxX0zrZrT9bfS2+U6WvSfV0zHQzgjXtgvQouaMuUfapiitOY2Z6AaC2h9eh2/7NmdBSfsuEl8Rp3r/9d3T4tO2ZoHyrCJM3BsDUK0xgQHwJtBbN4v1K421u5XUKu1rFXyVxTQ0RFx9u4EIwT840ySBOw1eY61GtKMHTYHy0p+ufRkL4QqPmzXKWEZdZcPF6FiqOUNgRMiXTJgzgDqkEJSqVEhFyZj8/SXX0l16kbVE8rsfraxY830Q/czrBcYRrYUSwXBag6z0JTYsWCiZWsg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742352066; c=relaxed/relaxed;
	bh=WeqBB++rcOx94nz1IuSE0ME1aOopqq+egTiTenlENkM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OScfQSQbaESVK81fGfRVsfp0t915QFR2bRieJON7YcORIz7YZAscffwgMMai0x+fTK4rzQZdJJQaPJlSZQxCMtQ0fcdPRwBIFmrfRiVQil/pNCtYo9riDsdbkLQ3hoqdO+aBQTRicl46107UUW3EtzZB0hKYCU9h0g9ejB1IqOqIB88LtjTI7BSO7zxd2bpZ3Vlwv9Pg7JAPsxdjpK0bb+oGIRoCOTcInrr2NGfwMZKZtimq63UCbonSxwBTjzmWxKvdEE9NwSTdOqb+wBS8cVIrEWPCYpq9QoqaGFCTE9igAYuv7IylCUj3Xh/oSKVZ0BZdABPA892n/EYpg0O0Dg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UuaskFPI; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=UuaskFPI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com; envelope-from=alexei.starovoitov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHXyP3863z2ySD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Mar 2025 13:41:00 +1100 (AEDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-390cf7458f5so5371702f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Mar 2025 19:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742352056; x=1742956856; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WeqBB++rcOx94nz1IuSE0ME1aOopqq+egTiTenlENkM=;
        b=UuaskFPIlwy3laJ+Q6DsnYjs5+MqEoRELupDTRevADaCzVpVrjn0Cx1fYQuuezBOTF
         vS6eDR0/B/UWyv9GKwOQNheAmUdzAeut3rVyCSVCJC6DHyc3xYzW4u7m/kgTXwGdrC/j
         lQPpL6cNgFRysqPILpcKegpu9pra0aKzZbmbhOkso6yCJzMe6SgC5W/UqUofkFPaN43t
         mOWnpdQ+We8DcCluP7HsVwqdU41w4Rd6wbkX1UPnH9GyQ1M3HAmUe6CG7sZsgr4UsGgW
         MpHDuEJWvHw5MtuiHwd3gZAIkbVCmSlI1vpkmrI/trJMv/Igxsn4iV5wnqlVr2ah24Rj
         jQLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742352056; x=1742956856;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WeqBB++rcOx94nz1IuSE0ME1aOopqq+egTiTenlENkM=;
        b=DcQ2D0gHF9LEX5n3qWhVncGHvlWSrCPbBIIFF5uV/p80F+F4pAW3jwcv4+dy/i5/sV
         sfHC4+YJbl2Ygz9x/xQfDODBMrgOHm7hcJrLJ/gF7atRjACReAc2xA1v/W+whYwIjfEW
         KqLDV/4z2HjWZQ8HXwy2uEee7W3u55IfwFmwE90oJB13fr0SVayPOz86sfyEPL0EdRYw
         TTt9PdxPZA1BiThyFQghNXtXucFWKkHnJSev6fEjCzN1OibnepY9lBGaSj+Dx+hf2OwO
         8ETy85ahA9rkhjo2xCBgKs2ifjbFsp2bhqDclwrGxsO4joKIDGkxJNlg4SwhFiiU97Iv
         HMnA==
X-Forwarded-Encrypted: i=1; AJvYcCWsnTUYtj2H69gqU1QNISammBY99L/ZQaQLKyYAJ+QFwvcxfUZHQ02WTmC+kzjaaZhrt9OdxXJrbCSprms=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yy6ny2WMcd6ISz1TlOShQo2ag3MqIGcnH/QZuU6csGNVvjxbKqV
	QzkSiY2LzEBqt/bE4vQW86y/yIQUcLvfP33P5ioaJyQ7fyEcLyUzmSx2E+RKJ5sp25J5Ii/Mgrl
	CI7VtdL+6ZW4Scwj+fnRFgPEhWQ8=
X-Gm-Gg: ASbGnctrAd7Xz2NrIevZZB2hIHyA1J+7pKmaBUEUrtEQjMQKG92/3BLY9PWZLRPq9Z8
	c7eglQElCUiL4ah0xyDLGf/hHQhkAxiwtFj8tGqcXkCzup5QVneeher5MbjqfQ6fYfkboVAynK4
	TgrOvPLA3Z8/qLDBSAUomCzRw8MOfsU69Gj7RDJeALF2C76W2WQd6c
X-Google-Smtp-Source: AGHT+IEq4Cvjw+V0zW8HacPzY7dpEsXkttELmIjzb3h1MDYt7G6p44IBkRudTjyMAKCZQZF68Vdm9Bd7RVSCNEeyHA4=
X-Received: by 2002:a05:6000:2a6:b0:391:2c0c:1247 with SMTP id
 ffacd0b85a97d-399739b7c7cmr810733f8f.1.1742352056133; Tue, 18 Mar 2025
 19:40:56 -0700 (PDT)
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
MIME-Version: 1.0
References: <20250313172127.1098195-1-luis.gerhorst@fau.de>
 <20250313175312.1120183-1-luis.gerhorst@fau.de> <20250313175312.1120183-2-luis.gerhorst@fau.de>
In-Reply-To: <20250313175312.1120183-2-luis.gerhorst@fau.de>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 18 Mar 2025 19:40:44 -0700
X-Gm-Features: AQ5f1Jql7yFmS7_MWNSMia475Ma-4TwbNZCE_S5_030qdEibYwvwxGNs5a0zSMA
Message-ID: <CAADnVQKL-NwxigMWM+U=n5ZXPG+xHYzSTEv0Rq8Y91m45eRJDw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 11/11] bpf: Fall back to nospec for spec path verification
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
	Henriette Herzog <henriette.herzog@rub.de>, Cupertino Miranda <cupertino.miranda@oracle.com>, 
	Matan Shachnai <m.shachnai@gmail.com>, Dimitar Kanaliev <dimitar.kanaliev@siteground.com>, 
	Shung-Hsi Yu <shung-hsi.yu@suse.com>, Daniel Xu <dxu@dxuuu.xyz>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, LKML <linux-kernel@vger.kernel.org>, 
	ppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, George Guo <guodongtai@kylinos.cn>, 
	WANG Xuerui <git@xen0n.name>, Tiezhu Yang <yangtiezhu@loongson.cn>, Maximilian Ott <ott@cs.fau.de>, 
	Milan Stephan <milan.stephan@fau.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Mar 13, 2025 at 10:57=E2=80=AFAM Luis Gerhorst <luis.gerhorst@fau.d=
e> wrote:
>
> This trades verification complexity for runtime overheads due to the
> nospec inserted because of the EINVAL.
>
> With increased limits this allows applying mitigations to large BPF
> progs such as the Parca Continuous Profiler's prog. However, this
> requires a jump-seq limit of 256k. In any case, the same principle
> should apply to smaller programs therefore include it even if the limit
> stays at 8k for now. Most programs in [1] only require a limit of 32k.

Do you mean that without this change the verifier needs 256k
jmp limit to load Parca's prog as unpriv due to speculative
path exploration with push_stack ?

And this change uses 4k as a trade-off between prog runtime
and verification time ?

But tracing progs use bpf_probe_read_kernel(), so they're never going
to be unpriv.

> @@ -2010,6 +2011,19 @@ static struct bpf_verifier_state *push_stack(struc=
t bpf_verifier_env *env,
>         struct bpf_verifier_stack_elem *elem;
>         int err;
>
> +       if (!env->bypass_spec_v1 &&
> +           cur->speculative &&

Should this be
(cur->speculative || speculative)
?

In general I'm not convinced that the approach is safe.

This recoverable EINVAL means that exploration under speculation
stops early, but there could be more branches and they won't be
sanitized with extra lfence.
So speculative execution can still happen at later insns.

Similar concern in patch 7:
+ if (state->speculative && cur_aux(env)->nospec)
+   goto process_bpf_exit;

One lfence at this insn doesn't stop speculation until the program end.
Only at this insn. The rest of the code is free to speculate.

The refactoring in patches 1-3 is nice.
Patches 4-5 are tricky and somewhat questionable, but make sense.
Patch 7 without early goto process_bpf_exit looks correct too,
Patch 8 is borderline. Feels like it's opening the door for
new vulnerabilities and space to explore for security researchers.
We disabled unpriv bpf by default and have no intentions to enable it.
Even if we land the whole thing the unpriv will stay disabled.
So trade offs don't appear favorable.

