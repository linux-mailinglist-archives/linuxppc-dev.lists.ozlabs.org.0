Return-Path: <linuxppc-dev+bounces-12699-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 533BEBC2E3F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 08 Oct 2025 00:45:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4chB6p5pBVz30V7;
	Wed,  8 Oct 2025 09:45:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::632"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1759877122;
	cv=none; b=lRsl+UrET8c6mmxj4tVaswAJng+tVla2fDR4KyX3loEEg12a2AQfguTACUn579aFNlQlAt/ryCujyPyLR/sd0iOvG/JyksG+BqUEBDpBtzcozbBN/QUPKXGlkI6H/DWGngiESroxrstSyCP+6ixHleCNs5qiob4X3/HCx40e3+kezEYiLALw8JKYnph1FINkEvzaHoEen1x6rDtq2oPpiPszE65XOUAu5fWMJl8qWN8/Mcs/jHiXBTVg1mt+0ewjLT+j8DpXrwj0SEgdVbVTIc2EJsw2Ja2qNdAoxVi2xPIBatIs/AipnK7MV0ndGE+3Xg/br1ShCSoXlPIIfOzKdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1759877122; c=relaxed/relaxed;
	bh=acoKweiE9t+Y6LeZfG/5kZSShYTLMPG+aiKwdlW1U+s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RKzKFyWikRFbhsjJwEsDRpWABdbzO31EeQG/Wy20pG/3O8NqVZOBDKfNs12p2RzIWFOjr9tMMm4SYKtdpA0xcrLWUFW1HqpjRG8+SNz4GZFxijBw1xdRoWOOPGgKqyo5r3nwMTF9YHnrN0KFkjG8VGnP+NEbHkIC37sDS6/zGQu/n3PSn+PwE9wKY0X6X5ryhr7bjeQn22N8T5bl4IYFCeXhCN+L/5EFjOlw0pJaRC1dh0UtxBV7EZSWWT6NcLDJoaERDXg7cLHLS/ZNzMzjvukKrawo0W2BxzYip2yw6SjmFQ9TKc0C4dB3zRGD9x4Ps52U6D69LOwgYg4LE+NlUg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wEpCniM4; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=wEpCniM4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::632; helo=mail-pl1-x632.google.com; envelope-from=irogers@google.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4chB6n2Ndjz2xcB
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Oct 2025 09:45:20 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-27eeafd4882so97975ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Oct 2025 15:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759877119; x=1760481919; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acoKweiE9t+Y6LeZfG/5kZSShYTLMPG+aiKwdlW1U+s=;
        b=wEpCniM4Zne8uQnQoBf0mlC19yV3jFUr0cXirxZWhAm/53yKrlMyFKVBu8nPW/jxP0
         SEaseOv+JEv6XmgR54/Is045u0YiO+kWCdYLA/iFsRyb/GiYQtp3zK8eUQ6g9O/bsNu2
         oLOH3eeNqoUUpxAiw8imAfIA2uqHjIadtg3XGnc9EADiXc9HjgjAd7YNqjbraNo0PmON
         GCajVT694q4DgjXWedgF2qyfGPaeLI54TXTAVx2KMM2qVEauOG/rciJZ0YUA6CWo7b1c
         GotYr+C2tnQOMrID5RyyX1lZnRu/jpKHODKS4rFI5aint3OIPclXwhzyZou7PXLhaLRH
         XQ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759877119; x=1760481919;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=acoKweiE9t+Y6LeZfG/5kZSShYTLMPG+aiKwdlW1U+s=;
        b=lXxeaCwKq7o1fh3kPUd7AYEGSqnsbUU3nZyIs6CVi6xHs2KLGvarIeg70ncTJNcofV
         FOfLW2vvc3C1k4L4U1KzuS7wyqJc+QGxK9eAOTguv/Ne+kvUKWXtepu/SqnK2yw4U9eu
         K6+EWjRe91T47oAiUIOnlPIuoqNFkp8MgyVTY60ClnO9p0358yuTYIP7uAWjITd5T6Od
         aFD0/1bCIPxnWSXL2BQ/ee6vEra83fu8KYIkGUMZ4Mm5E14wn1n4hwTO9dyeSjnDIx+A
         k76ypu0mcDO9miWSJwm2+ZGx78yfcBGR6OnR9nf9vhSzthllUpjFJe6Jy0vqTAkwZa1K
         04Ew==
X-Forwarded-Encrypted: i=1; AJvYcCWiGKgBmP7cdvzjJPoxJ9PIXsVR32K0rTftdWdWxV7DswS9K+ZJc/TqNRrbxO11N7N+5MZ5vPAtc+fxfn8=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxH5AUGOKmXQyZXN/c4T4nMQ6hro+BENLovI1zfjfV7Eeh1H0/b
	tqvUpptIqGycnseyCn0Dbrml5fbF0ClQ8PLbVMhH8Vdjt9BijP7qF4Qyf9RQwMYvJWv72o66G3D
	8QX3vBZoouDNWC11BSjYOqGOT1n2lZCBhnbHEdJti
X-Gm-Gg: ASbGnct3xsnltGf1f4yhNYWKGql7t/B4a0C6mCA6UPqZKILs46UrKLKmxvJQMd/4Faz
	bO6bmZ1/CHKHjM0zh/mNPReWtkpL+RtPg+andU4heU/Z3CHcvaghf/YMrgycBAYJ7bTWm0E38SH
	Pa9rmh9P5b/c0SkXfhQP7mny9gnGy97MGOGz1tQ+OncVaHxk0soKI+LspVraWp1yr2EgCP1No11
	FyQs1IBkSm7VCYr5KqJNKiBo/WuW7egiNHcNl5ClxVIPGJ+wVVFSvBmGOztuZYlLlPKEr0q9BqL
	QM0=
X-Google-Smtp-Source: AGHT+IG7Au5xPNQ1Q+npLDoAk2/XxZWd9r/KEIJLvu4AItG4Zo6pTEhdDaHg6C23wmFiAa88C9hgJIStIMVh69InehM=
X-Received: by 2002:a17:903:1b47:b0:25b:d970:fe45 with SMTP id
 d9443c01a7336-29027603504mr2664305ad.1.1759877118666; Tue, 07 Oct 2025
 15:45:18 -0700 (PDT)
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
 <CAP-5=fVkw6TLjVuR3UCNs+X1cwVmYk7UFABio4oDOwfshqoP_g@mail.gmail.com> <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
In-Reply-To: <CAD=FV=UWkZx8xQD=jBkOO6h2f5tw_KCoqhHciw5hkEOYU=GM8A@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 7 Oct 2025 15:45:07 -0700
X-Gm-Features: AS18NWBRXn9S9wdPvMnsRPvu-pwDN6eIzlJlkT1nNcYocjJ91PnSFj4cTdTBrps
Message-ID: <CAP-5=fXTFHcCE8pf5qgEf1AVODs2+r+_nDUOiWgdQeEgUBHzfA@mail.gmail.com>
Subject: Re: [RFC PATCH V1] watchdog: Add boot-time selection for hard lockup detector
To: Doug Anderson <dianders@chromium.org>
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
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, Oct 7, 2025 at 2:43=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
...
> The buddy watchdog was pretty much following the conventions that were
> already in the code: that the hardlockup detector (whether backed by
> perf or not) was essentially called the "nmi watchdog". There were a
> number of people that were involved in reviews and I don't believe
> suggesting creating a whole different mechanism for enabling /
> disabling the buddy watchdog was never suggested.

I suspect they lacked the context that 1 in the nmi_watchdog is taken
to mean there's a perf event in use by the kernel with implications on
how group events behave. This behavior has been user
visible/advertised for 9 years. I don't doubt that there were good
intentions by PowerPC's watchdog and in the buddy watchdog patches in
using the file, that use will lead to spurious warnings and behaviors
by perf.

My points remain:
1) using multiple files regresses perf's performance;
2) the file name by its meaning is wrong;
3) old perf tools on new kernels won't behave as expected wrt warnings
and metrics because the meaning of the file has changed.
Using a separate file for each watchdog resolves this. It seems that
there wasn't enough critical mass for getting this right to have
mattered before, but that doesn't mean we shouldn't get it right now.

Thanks,
Ian

