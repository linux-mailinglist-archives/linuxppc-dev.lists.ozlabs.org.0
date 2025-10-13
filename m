Return-Path: <linuxppc-dev+bounces-12798-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C72B9BD4132
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Oct 2025 17:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4clh1b5RYSz30P3;
	Tue, 14 Oct 2025 02:22:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::62b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1760368979;
	cv=none; b=GW7UfT8tahCEgFQqjcCyXaILhVrfMChs0sxEzi7OA2PuLFOzvvyuL9WsZmLQ6aKkABBRc/urwQp/VAAVoVu5Uz6PkITsVu8T2IgU0eRpN5zSFhwy3epw5VLirFl7X/cIkXLT5eNcN9ODPekpqV3/wkZ7HeRqaoRTUMUlVtvZ2sOUHnMg3S7rWXAHzVK4tG1+eDClHxhBfpUxsITQc5O65ArTcn6bt8xzRmrTfQrJ2GNiK/WGsuXRJKlHpxYWPH+2N/VgbMQ8RhuyYLygy+t7PF+vebblRKzaHsdQo83NVzlhW7kkNBPQGsHFjfrmD6YpTKngSLja+/sTnX58eIQ9jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1760368979; c=relaxed/relaxed;
	bh=+efmRN52iBY0si6W7g6Mnet2zmDpA8tsmPUXX/58V5I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VmHJ4x1qure/JF+PbrgoIPYlXlnlz7gu+Aq/LQTBorQXNUCSp3lAPo/Z/Ri8/PjfESLqI1Xmr0J+uiZGBoSFv8OD74asji9g92jfHnrcRFlwy9KjgfZo9T9ocKRctxVADvuYyLS6vWBUSSXrfwW8xtk+ymB2KdK62zLd4IaCVPESdrvrIGzdGkbSR62kg/MnvFjmurCwbwjhut+xOscszRsI0kBM9AajLhOtfGRKAUhheawfQnRlHxHf3K8pXY8LWQc6REDpiffnd6IRl6OIK7N31Vg8/ilY5cfOoQhXxUHbZVdXAMP9G8z9zBfCoY8FUFhTwO6tJMK1vERz5bu8/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=m9PCNZkX; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=m9PCNZkX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4clh1Z30VNz302l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Oct 2025 02:22:57 +1100 (AEDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-27d67abd215so431325ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Oct 2025 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760368975; x=1760973775; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+efmRN52iBY0si6W7g6Mnet2zmDpA8tsmPUXX/58V5I=;
        b=m9PCNZkX6iZBm1Uzu8D4Fhxs8ATd4g+M4yU3J87eTPFFVd9FczoIPqOwORd2R7ENIq
         aJXMcSZOFZrjoRFE9r4WDZOQcCmdjLJcX1Zn4TTDIVU8msQoTz2a97+WNVKxKRPPRt6e
         NwtCFYUSGCQY/bcjsPfcDR4kBvjFpIXvEkEjOoJTuT6gYMEx5e/yEIYheriiAIyzwJBg
         lrCAtFlE7rF/lQuEStE7Wb0pT/78k6yktgvvR5CZTjouqRywTa/yn3mLzrJ/dbsUULvH
         KG8uzGkVIGYabzon4CJ/xlbvTIdzwl11wF806zWxp2xF1HfGyoctQsZdA9tXKVtAeps2
         fIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760368975; x=1760973775;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+efmRN52iBY0si6W7g6Mnet2zmDpA8tsmPUXX/58V5I=;
        b=GBvmu9bnJwhJBJL30zcPj1v+fO7euZdygDLfz8J/xV7Jkz4dV3XHdxlDEd36ladNtz
         q/wmNSNbsHFfUuL8RJJzImmw7/53j/xCO3SEBZQbSMUi5fE5MuqBfaxaw0Y/AP4CumG3
         cLIVP+U6QYzL6swyX+TpKjJUw0E7vTfxxAeykmSLPnBLo70AG8domfvynKbwiGEfD50m
         P0tej5/Bq4VFBTLS/KIO4J4eHdwdw3QuVkH8HcIqHEKTS5Lu0M9fDpDuX5FNNCTZhM5w
         DVtQKPY/A0I/ju0D9blmJtUeMyK1kjYVlF+XURTWxy1optau7t6zxTc692HM8yvV5hkl
         i66A==
X-Forwarded-Encrypted: i=1; AJvYcCWARpJaWN7yxKrwZ1mI9LrE9/Y3oZJBmGDp6CTa/htj9kZXfq4SIoKfw5lPF0i0sH0t/fYEmKjd3RTImsg=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwvLgaCQuWcYgPC8bM9gepFGbVCg8VZyQuMxQ2BeOoCk4ntu4j+
	ponncVwB171qWhIbkYVn9h2eN3mqlRlBQfXqVPXiFVfYLgP79DvQR+qy+0z6HzfkMo5GTl//fj1
	EzGMtiTQPjhw0Zg5KrnEXlfEDb0nNLzYp006DfwRX
X-Gm-Gg: ASbGncsfKQ8CBxXj2KyY98qOhJFWnOuR+BMmc4u7F8TwdJHQMx4BbACTQjVtuRlwZ4G
	YbVp3hDXVRYSC0yCNSU3VY02aVBLFD1gzRIggRKJp7nU3G6PqlfQIj7AudA6537G8mDU/WGSb4a
	JYLrAAUCvfKahLClGEJJJ94tQJMu03tJqMfnVfcDzTF1W0AQmZ3/5iZjMiMfOaS09IPKzU8Vosa
	PImzifbhzLfItF2xGH5vz4zAzscFNrZnBkWJ+vz7GxC9kxFcoXLjAx18QP5x9iOy4jxZEbUbg==
X-Google-Smtp-Source: AGHT+IEdUAiSKFrmjYar3G9IgpPKXQygapAxfBI5r4itrM9lr/rPvWOGAsk6Rix2MCTP+i8IMM+7NAuwUGCcG9YIquE=
X-Received: by 2002:a17:902:d548:b0:25b:ce96:7109 with SMTP id
 d9443c01a7336-290275de5a5mr22172595ad.3.1760368974498; Mon, 13 Oct 2025
 08:22:54 -0700 (PDT)
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
References: <aMpRqlDXXOR5qYFd@mdev> <CAP-5=fV05++2Qvcxs=+tqhTdpGK8L9e5HzVu=y+xHxy9AqLMmg@mail.gmail.com>
 <CAD=FV=VNmjTVxcxgTQqjE7CTkK2NVGbRxFJSwv=yOHU8gj-urQ@mail.gmail.com>
 <CAP-5=fW64xHEW+4dKU_voNv7E67nUOFm27FFBuhtFii52NiQUQ@mail.gmail.com>
 <CAD=FV=U3ic707dLuUc+NfxtWF6-ZyRdE0OY2VA6TgvgWKCHUzg@mail.gmail.com>
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com>
 <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
 <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
 <CAD=FV=VuDYiu5nL5ZeZcY2b+YXOzZtSu2E4qBBHz9fWTW8gPhg@mail.gmail.com>
 <CAP-5=fX4=fV70N3GCdXgV6o-YoJynnSppxJp0MwdRrtsyDrs0w@mail.gmail.com>
 <aOdbRI3BaMCbyvtv@mdev> <CAP-5=fUAato=+jyNNESCX3SjWMEEJQ697VvWiBFCi5wKs_JQCA@mail.gmail.com>
 <a4c80b15-fed0-4ba5-acc1-240ceb7278e4@gmail.com>
In-Reply-To: <a4c80b15-fed0-4ba5-acc1-240ceb7278e4@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 13 Oct 2025 08:22:43 -0700
X-Gm-Features: AS18NWDlTWFT3HdpYqKdSgipTpAwpisZNXm-xTCknWJmQs9BUsH8yue1GTfzRbI
Message-ID: <CAP-5=fUECw2RLvzPrf+jvJ24+cJOecrm_FaB1_qUJ8y5Lr1p1w@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Jinchao Wang <wangjinchao600@gmail.com>
Cc: Doug Anderson <dianders@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Oct 10, 2025 at 5:54=E2=80=AFAM Jinchao Wang <wangjinchao600@gmail.=
com> wrote:
> Addressing the PMU assumption that all counters are available would
> resolve the issue. If perf managed reserved or pinned counters
> internally, other users would not need to be aware of that detail.
>
> Alternatively, perf could provide an interface to query whether a
> counter is pinned. Having the NMI watchdog supply that information
> creates coupling between otherwise independent subsystems.

There are lots of ways to redesign the perf event subsystem, counters,
etc. These things are being pushed upon. In general the API is trying
to hide details like the scheduling counters.

I'm in a loop, but the change here is bad because:
1) the use of nmi_watchdog in this way is misleading (outside of the
perf tool) because of the name;
2) it is bad because it is altering the way a kernel API has worked
for close to 10 years meaning old code doesn't work as intended;
3) it incurs extra overhead in tools.

Thanks,
Ian

