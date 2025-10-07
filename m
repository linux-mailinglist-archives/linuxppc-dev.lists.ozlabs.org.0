Return-Path: <linuxppc-dev+bounces-12700-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B8BBC2E81
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 00:58:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chBPr0k46z30V7;
	Wed,  8 Oct 2025 09:58:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::52d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759877903;
	cv=none; b=McM7/g3kt0JEZyqKKP/lH0k32aA/482uZ/i/Owa1iloJhZT3WFgSWce/AHevtQha7kuDOxIn1hgdhcxDs2BjKPcvGjgAbCk14OpWnt+kFZaQ+MaftvQ63xoZUbq61Z0NqLBTN76uKPR7y/uPoyrngZ3L5kKoJljMZ3dRgadpMpffEJfr+QFQz+OuAO1bnt2KenbB0HlmxBnPPNbzbPuKSjcqKg2AaPpJai/DgyddkIj8PnzGeXd6wxjzTDpvJ8SpRfmXSbTcjKAcvIsphKUfqvt0bBat+NzI8+r1yvmvO8cEz1ftHXo1koXqwOuZSwi00fdlq/PndD8mG4057LrhRw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759877903; c=relaxed/relaxed;
	bh=5+KQiXKaE6mhudMxCJikU0TpZUEaf78Hz+t9g+4OaC4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HG8kgcwyv2ED0ebVkHNkm7pvoHqnObnHtuZeZ1RQyTf19h3Oufuz0Ish377E7aVINO9JxPEDcrz0zBbZoBTlTtkdUtcfDW37Z0DRVx9mOehKW8FV45m41VtnLRx7+NZhfAGm04y9qcrUDG8/BEx1YtwgmoeeeSX9IJzpq33Hy7I9+5fyZqfCEOOJfGsVdPpy2/gdDczvNhRJ96LQv68DOwnCEr8ILDbiX7b85gMGR0GFVlMPrPG19n5hmQ2H27RX0TcbhS0Rt5pmgGQS7p6WTv2Hm9ahvz/seNtBGBclLmT79DkJURzrfotOPsx3WfZ7HvbO2b5ABVBrPfVKE1mk6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EsphwQO+; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=EsphwQO+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::52d; helo=mail-pg1-x52d.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chBPp6dl1z2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 09:58:21 +1100 (AEDT)
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-b632a6b9effso393508a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 15:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759877899; x=1760482699; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5+KQiXKaE6mhudMxCJikU0TpZUEaf78Hz+t9g+4OaC4=;
        b=EsphwQO+0RSUHb/jFo0LATSpsqzA9k69t8Be4V0xqVjdH0eLoNa0o4897YSTBrWb4t
         N3f5M351zK2f2J+fSFwX3QphEOFgr+9PiytvUbtx8skw6sLXi34OE6B5BRfR9KNGCchR
         JOh38rAaJWmAj5YU12mUrFGtlWokLSmWD6uhU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759877899; x=1760482699;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5+KQiXKaE6mhudMxCJikU0TpZUEaf78Hz+t9g+4OaC4=;
        b=NDXYnnpGUmgsfg0fN5Xke5wN0FPxg3qsnHedOcpb6W6v1SZXp711tMgnOYjcLVjrU4
         fRHy/vcP8C/nTsP/++LFb0wQQqPe/Rn5wIatiyKphlX3nnk8c7ubwgdRED30PPrKFdhM
         824G/7SHqYgkBBz/suj7p5NC2R0Gp0qAbxeDvVFtdQ2s+NUyycY/kNbKiE903FDG0J/c
         aYYOZiFwqFTbly/U7nBXmfzU9Dr7rZ9QT+gUc9k5BzF4VXaJ7N8CHoZ86Hy4PMd8f3+P
         IZv+ViwaWctFRGuEnd5jKxnQAEaox2HBrMQtlQJWYfvTchBRBqC8IirB8F+ZOoyUumxR
         9u0g==
X-Forwarded-Encrypted: i=1; AJvYcCWuhlMx8uUcBeSQc6P0qS9fM+hNKDesvLMCgil1VqHFea//a56Rn5PabjM+HaEVLCOJjJXRUNCnpa0jsEM=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxKCff9ZPfNzdlRNwRzmOeMJKZK5P0X9S2llnLQ1vUAO1TyRAYk
	9+jORM7t9EM/rqU1kYAoUP0ELFkVkLO0EVdQOTs89BIz61Ec589z4TijrVdLXWdlLBbXmQ+4pm0
	DMLw=
X-Gm-Gg: ASbGncuawWUws157t1rfZZOEhUb9hGiMrlFD4kMdO7U+e4IjJWZFt3FUX/B48uwaACw
	ZnSYUkNWgBCfbx0+H5FsGduhdKQFg45eKEAtVlNqoJ9ITI1ZLwPW5AcVQ/ATXFfCBehEX5KpzKC
	Qo8vbV2AHMU83ofXxqSo7fB7eDGlLsqBfN2s2VlBsDap5LKvN5POOW41wzi13i1pc+IP/buXF0K
	Uytd8DSb+BBLHl+FXV0R6EE3bIiTPMJVbZsvjfKMiUoqnfvz3fPSCCWaUEd9Rg7ol4lHqnEYXZa
	sw5GZ6tiBczQATZft6FbhViuW331CmY0z1WvLHf2Ox4kedwm2Tp49gRx1POWwLEVioiqDYy7tdj
	pe9pZT/Q0Ahhda6Uj8e+U4JkZsJG3UKHk2q6HYC+MZVY2NXqsQnbj+QNBPRDKEkRKddby1JCfHY
	lJeVRmdkIAOUFn3g==
X-Google-Smtp-Source: AGHT+IHdjsUrkb7OR0NT1VaWic2ZgbVBvJdSv/O9KPGGYJw9oi6m8z5F1I3snbH4xDnpaDwt//oUFQ==
X-Received: by 2002:a17:90b:3e82:b0:339:a4ef:c8b9 with SMTP id 98e67ed59e1d1-33b5127ac7fmr1493844a91.17.1759877899236;
        Tue, 07 Oct 2025 15:58:19 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b510ffd77sm889766a91.7.2025.10.07.15.58.18
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 15:58:19 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b632a6b9effso393501a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 15:58:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXDy51jLpxTY6uG0o+1wxRgafi2mc8stfi0Isn6Bg+zqj9BSDZ49IHVoTs0E0CKT4NQKbLSUt5+hEq7/KQ=@lists.ozlabs.org
X-Received: by 2002:a17:902:fc4b:b0:28e:7dd9:5c29 with SMTP id
 d9443c01a7336-290274024e3mr13055185ad.51.1759877898085; Tue, 07 Oct 2025
 15:58:18 -0700 (PDT)
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
References: <20250916145122.416128-1-wangjinchao600@gmail.com>
 <CAP-5=fWWOQ-6SWiNVBvb5mCofe0kZUURG_bm0PDsVFWqwDwrXg@mail.gmail.com>
 <aMoTOXIKBYVTj7PV@mdev> <CAP-5=fX7NJmBjd1v5y4xCa0Ce5rNZ8Dqg0LXd12gPrdEQCERVA@mail.gmail.com>
 <aMpIsqcgpOH1AObN@z2> <aMpRqlDXXOR5qYFd@mdev> <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
 <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com> <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
In-Reply-To: <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Oct 2025 15:58:06 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
X-Gm-Features: AS18NWCSxLhXMa6LWJavaPtuRN6XlQd4XglBJvkd9z7Rf77zdxFhI-J_rEr9-v8
Message-ID: <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Ian Rogers <irogers@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Namhyung Kim <namhyung@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, adrian.hunter@intel.com, kan.liang@linux.intel.com, 
	kees@kernel.org, masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com, 
	gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com, 
	arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com, 
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com, 
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org, 
	yury.norov@gmail.com, thorsten.blum@linux.dev, x86@kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linuxppc-dev@lists.ozlabs.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Tue, Oct 7, 2025 at 3:45=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> On Tue, Oct 7, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> ...
> > The buddy watchdog was pretty much following the conventions that were
> > already in the code: that the hardlockup detector (whether backed by
> > perf or not) was essentially called the "nmi watchdog". There were a
> > number of people that were involved in reviews and I don't believe
> > suggesting creating a whole different mechanism for enabling /
> > disabling the buddy watchdog was never suggested.
>
> I suspect they lacked the context that 1 in the nmi_watchdog is taken
> to mean there's a perf event in use by the kernel with implications on
> how group events behave. This behavior has been user
> visible/advertised for 9 years. I don't doubt that there were good
> intentions by PowerPC's watchdog and in the buddy watchdog patches in
> using the file, that use will lead to spurious warnings and behaviors
> by perf.
>
> My points remain:
> 1) using multiple files regresses perf's performance;
> 2) the file name by its meaning is wrong;
> 3) old perf tools on new kernels won't behave as expected wrt warnings
> and metrics because the meaning of the file has changed.
> Using a separate file for each watchdog resolves this. It seems that
> there wasn't enough critical mass for getting this right to have
> mattered before, but that doesn't mean we shouldn't get it right now.

Presumably your next steps then are to find someone to submit a patch
and try to convince others on the list that this is a good idea. The
issue with perf has been known for a while now and I haven't seen any
patches. As I've said, I won't stand in the way if everyone else
agrees, but given that I'm still not convinced I'm not going to author
any patches for this myself.

-Doug

