Return-Path: <linuxppc-dev+bounces-12581-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE77BA0985
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Sep 2025 18:27:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cXfJb0WXLz2yql;
	Fri, 26 Sep 2025 02:27:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758817662;
	cv=none; b=jK4P83hy3iqectP4H2jqUf1IuqYWW+dKsylIEfoiemWLtEasFW0jGTE9TJfQtxWHi4KNq/F5bgjj5JS/XJTj53E2+ZRL61j209nnb+TcCwzcRu4yrHbZVzFCdEGjayRxSKT99kkHWB9tXUjd+RvL63REqq3Jy7k1UAgIJZkVoTM4IGw/1PvpAJS+t6+W5eclabqbW7mbEQzABBWfJlAwqLlBQOhKUrKsY2YXTtZc+OuEwwMhRnvgdbaDRUt1RdnvdkJBJos5uSSwnjITSc0uo/fX24JPM5ad+e3oZpBNrtLLbM7zss8wDIdwVNhgNzatdJqjykJszRNBvVHHP+Owrw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758817662; c=relaxed/relaxed;
	bh=DOt8SCNPqNoEq/gynRl5Nvsh98Fum4P4iOo41lrBivY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=B0ufNMNHh4ohBc+qMRk3V7u6n36i4z47tBdiczscoDQiD3XZLi+OxBrs1BkpB9DihgzpxP9L94FMZ0tOgU3gegHqatBFAYo5ZJU3AmTy6eQxFhloi+oOmAg6S9j7Pxe147G0YA+lAni6wd581mH00bA+BnUbAOYTDXehQmQdlvjI0W+8C/H0xQWw0Dc52R4pomSox7sbBKCnFELi/pajx5GS6Q7Qu3UFSZ3xN/qxHy+RhTMylS5IySLZK56wTLqJ9/JHaUXK6F0mW9zbPxT8j8EYH+i2BQUWwSB+YiZjZEb8AyodeVgbWGYUcEcxaPanzETTVTBDFbdCT376lbnZ3w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JGPGlD2E; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=arnaldo.melo@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=JGPGlD2E;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com; envelope-from=arnaldo.melo@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cXfJY2G2rz2ySm
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Sep 2025 02:27:40 +1000 (AEST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-46e2e363118so11935835e9.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Sep 2025 09:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817657; x=1759422457; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=DOt8SCNPqNoEq/gynRl5Nvsh98Fum4P4iOo41lrBivY=;
        b=JGPGlD2EcMBoElx6D5QXZSfy+fsYhWNdBJbCnWXtZFWPcXZQhBZxgXJY9Kl9x8yLbX
         gHoN7vbKmasrDFIGviO2PHqmr0SZJnpUARBhgbI32VdDlMG+yR3sIi81MJM5PgQq6Vup
         BUtAWSBV17LDX86PZTCjPpMAA7BB9Bw2ofM8z+DNgWwMaXgkwvtVQ9YoPFmtuHuptvOv
         I3MLQoWAhyH6QXRJKcjzVBVEVw0TY/fHhwg/cf6IlHBdDyG9+3HSPfHbWQXcoXdUp6WT
         XGe9x/ZrLzTu8wxym4FBz3d+LA5TZEBE9AO0yv0p4pfb5rjRPcgEC/Yg3zuMkUw7KVeP
         rdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817657; x=1759422457;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DOt8SCNPqNoEq/gynRl5Nvsh98Fum4P4iOo41lrBivY=;
        b=cBpYevmMmtjBVMYnJ74e14WrIVJlIwg27n0ad5ooLhmT2Y4TafU9bKwsvks7QwCVW2
         O8+8bkcYdZ0e9+WaZYJjI9fbj2/RERGxyHipH9ahGwRTKHE5cE+kvjrob+UzE47lxpUY
         NCL8vRDtC3YlmCtmNfI7T+JPjOTjGaoIZ0nFgmjL6DCsKQcIMwT+o+LwkU1uKy+B56K4
         yFSxyz2WsCWMc1RPLQKUzOhqXPoCXwxmpHrhzf/4F57d2aQlDGI2vfINDOXTVuDPre6y
         56Jg4ln+b5rstNhlHkw/r+hs5Zn/T6jBGP/C2samVLDatb3SJ3oMWIqyI1aVHXG//AH0
         aQww==
X-Forwarded-Encrypted: i=1; AJvYcCUZus2sG24vV0PWx2SHV1SEGuhb6MutekA8X8rtJxz4jgXB2xgW9gGs4kWyRdE5qPpTxd1KYcCZoBJRWK8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzd3YX4K2uhSwRStWioWCFng2VTaGhEb/qW+iJHUCjXc5thkXD1
	qE7o79zsxpp7SbhmHN59TcO+jVUDy3lmWxyeJQlOQmhP1ZnRKOanPX2G
X-Gm-Gg: ASbGncubU+EdqmQr4fH2xhO4LkyaFyrrkG+yIyHFzXqCHbuIxLopZnHvUVl4XpEOOMK
	0MuSwwUIjAuzDQFG84EUO3gcoCSlT54QitH3TG2d1fZlPx9GjlbfvW08s6DEarBApNjlEu+p1UZ
	DWdb2PDgzylyw+QeqItNlCct/1xfTtYyLuUsnBCXtE87XYm9Y6lGhZ+pibPo0+rjo00J1Nt8ixB
	P3SBTDWQYyCwc86Cb/uImY4JcIvg6BWC4LSqdDvRvjMv2Co016Mt5LpPMF3I+g0awzfAoEAAZPM
	7qSNu8Ipu1lo8wlCo/oDIeoX0mlj2IOxaBZZW+pn9AOlPls2nuci9y0n3MZYYEqQ+etfah6uYM8
	U97lqkmG10qSKiZz9dQW9rC4JDt8A9sC25p8dbHz1ghyWxrs=
X-Google-Smtp-Source: AGHT+IEFKHBHubn1cTGjy+ZH0sSlW55oT61o1prZ3rjWvLnj0iZRejAZ/4vk8KwWhanKzHuomILbiw==
X-Received: by 2002:a05:600c:8b58:b0:45d:e326:96fb with SMTP id 5b1f17b1804b1-46e32a17d2bmr48722145e9.30.1758817656742;
        Thu, 25 Sep 2025 09:27:36 -0700 (PDT)
Received: from ehlo.thunderbird.net ([185.255.128.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-40fb89fb2fcsm3932799f8f.22.2025.09.25.09.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Sep 2025 09:27:35 -0700 (PDT)
Date: Thu, 25 Sep 2025 18:27:27 +0200
From: Arnaldo Carvalho de Melo <arnaldo.melo@gmail.com>
To: Athira Rajeev <atrajeev@linux.ibm.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Ian Rogers <irogers@google.com>,
 Namhyung Kim <namhyung@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: Jiri Olsa <jolsa@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 "open list:PERFORMANCE EVENTS SUBSYSTEM" <linux-perf-users@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Aboorva Devarajan <aboorvad@linux.ibm.com>,
 Shrikanth Hegde <sshegde@linux.ibm.com>, hbathini@linux.vnet.ibm.com,
 Aditya Bodkhe <Aditya.Bodkhe1@ibm.com>,
 Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
 Tejas Manhas <Tejas.Manhas1@ibm.com>
Subject: Re: [PATCH V3 0/6] perf/tools: Add interface to expose vpa dtl
User-Agent: Thunderbird for Android
In-Reply-To: <6BB167B7-6479-44E7-9175-E67E500DB9E2@linux.ibm.com>
References: <20250916052536.93911-1-atrajeev@linux.ibm.com> <ac85151f-21e0-4a98-96e6-8153d0159915@intel.com> <6BB167B7-6479-44E7-9175-E67E500DB9E2@linux.ibm.com>
Message-ID: <7EE7DD5B-6550-436B-A799-2B1DF293121E@gmail.com>
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
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On September 25, 2025 6:21:19 PM GMT+02:00, Athira Rajeev <atrajeev@linux=
=2Eibm=2Ecom> wrote:
>
>
>> On 17 Sep 2025, at 11:28=E2=80=AFAM, Adrian Hunter <adrian=2Ehunter@int=
el=2Ecom> wrote:
>>=20
>> On 16/09/2025 08:25, Athira Rajeev wrote:
>>> The pseries Shared Processor Logical Partition(SPLPAR) machines can
>>> retrieve a log of dispatch and preempt events from the hypervisor
>>> using data from Disptach Trace Log(DTL) buffer=2E With this informatio=
n,
>>> user can retrieve when and why each dispatch & preempt has occurred=2E
>>> The vpa-dtl PMU exposes the Virtual Processor Area(VPA) DTL counters
>>> via perf=2E
>>>=20
>>> - Patch 1 to 6 is perf tools side code changes to enable perf
>>>  report/script on perf=2Edata file
>>=20
>> For all patches 1 to 6:
>>=20
>> Reviewed-by: Adrian Hunter <adrian=2Ehunter@intel=2Ecom>
>
>Hi All,
>
>Looking for further comments if any on this patchset=2E
>The kernel side patches for this feature which was sent as separate serie=
s is pulled to powerpc tree by Maddy
>
>If the tools side changes looks good, can we have this merged to perf too=
ls tree ?


Sure, I'll look at it soon now that the kernel part is merged=2E

- Arnaldo
>
>Thanks
>Athira
>
>>=20
>

- Arnaldo 

