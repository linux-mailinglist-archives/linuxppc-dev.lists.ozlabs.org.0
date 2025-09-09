Return-Path: <linuxppc-dev+bounces-11977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8233FB508E5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 00:33:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cLz9S1vl6z2yhD;
	Wed, 10 Sep 2025 08:33:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52f"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757457180;
	cv=none; b=VPun33CyaCiTsx/ItIBVtvPKGxtOhRYUTQ8C0OG6D9LesrwM/ms+7YIIY3Aftgy9SfYtczs9pdVPF71I/tMN9JZ0BECeClA22f9JNHg3iMZJdfq7DC4jpDHczJu4mdFHyHKAs9BdlVyAi6fo4fms5mxxBYxiwVPqgBxFLFWKTHWHCrLVuatpC+CqDACJ3h2UG4hv10OsOW2AGoteibViwibyALBPNaykZjKSos1GzlOC52vlrTLn1IWJmJ5zYwzfaylcfsUnqk5ohE5LFBs8ZZm2U06DJAX6Zwn3GgsYaK4a1y9RxKA3B7pkHFRFy+jcRYnhYCZYCoGMVHOvsIOUKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757457180; c=relaxed/relaxed;
	bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AFbcSgsilNQvfktQKMOITLoNZM7f6dCwN7KYIZ2qOramsMfJtuHQQAF/PjH5Nc99uMLQXgTYqxm5PWyDWE25adJUPYAzvLM7exMlnFB9etCCt8NeewAlgnbu34BYQxO7rVooB1z0vxQs6+WQN3qqUqXWYMbV/DPihm0gElQHf5DVBOcbEPKWz3swa6znSan/zwVWqDpSJmDC4ynkMHgqqI1nJpOoj5E0+2jHe0OB2sOTRBf1Vi8WBWdTNQRCKIP0u9JWO5EZotzvtZ5W2m/zyQHhqofaqLFjqmKDrYb3uyDTqx+kwWkSevx2EWB6jMmIGkKNyuEhsUy2kiNR+1npVQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HBQCsqpS; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=HBQCsqpS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cLz9Q11Zrz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Sep 2025 08:32:57 +1000 (AEST)
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-61d7b2ec241so7496248a12.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 15:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1757457172; x=1758061972; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=HBQCsqpSzsN4kVhLXKe8zvR3Mqe98Q4EDiQOO+2KIZhKxbaakds+CKPgPboTAsZ5Am
         Y9tOw9g3Y3lT7WHalgu1orTMhswCyKiguFr4n8plva/LUWOB0WGtb2q1HhrBsbhLwxFK
         PC/0JNRghCKK3yva6XiA7COaandCIp/qxU6v0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757457172; x=1758061972;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fEQiOQ22rYAZhHJ5F5hChKykmBsdSQ9Mr5OeL3gCArg=;
        b=jkuBk/+u1Dv5dCZVvY7M7k0H0sWYGyp0X+dsl43Ik/tfKnhr5Ga3A8nRu4taMBjMEP
         DFpMUD2IZP6hAiXsdW5i/RoCORg4jrES/ueu8B3+M3rTSr62T3ZEbb/C4FdI1F3mjtd4
         CvqIRtSMpKnJAXUDV9ORQMu2R9ToMnkPPEUMOWSo4bOuvWkgNyUSYoiY7eVa/pKMmz8K
         8D+ZpO2WkUJ+H3IEQBldFtbaNHvH4p9nRc1KBmIPGxa3DDmlM/fFIC6LDiL54pdkAwun
         XxRY+1k7odzDUuacvy6J3qgFXIV7f81KBsloLLHOL3TQK2jUm5fP0vgh8I9RKrzWfLKi
         UKkg==
X-Forwarded-Encrypted: i=1; AJvYcCVmluDJMWvCoBbJnv5INzd8k6QoHzFQAPzut0fdZxvlJb1oCXAMWqQuTCOoYG9PWIJi+KgK8w1xZsZbEZQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Yzjp0x51tS0ffI/J1b6hYTSQtTH8cQQb04lAwDtYbAfFvgOkeyB
	x2wKTzZ4XjXNKfcJPzd9jY3Mse4698xXXKPu9dXWvr243DX0syAWq7t9SO9s05b2TDBLpiLa8x8
	UxBN9TlfV4A==
X-Gm-Gg: ASbGncv2Zn9+4TIBHZf3HXqK5h7lNTDScqpwQLvzplDsnTDeHbRPLGggdl2QEw6LreV
	2qVh3vzp5/ifsvfYqIWD7ZWjcx77WsgLlWUUsOqYrFm2vfZlA+KtFQkYFzBcLjYl1KenmkdA86x
	pyFB5/Of00t6C8yOAFB8S/9TiW2a1SaP5frfTGiwbRAI01hyRK7HndlsTk7G2fykYDe0Kpyr8rk
	kMs/xtkhVnjHiABGdCo4qCwiG3xJNrKQ6yfBKErvKCjesynmpd5Z3YKEnh3M59HhVOBQFwobbXd
	NAPEwpfnvN0Trzyc7fOrfOVPtABk6nOZcQeI015wR+TnrGaHDnoCwRkBZQf+lSjFXBrsmf0/iLU
	2LYispxzOssydgU7mToJ8rtu5TL3UMDub7AV1zRaFx2KoP+UMctyVwDp2XQZw+p30yO5twmUf5v
	5JIF0/01k=
X-Google-Smtp-Source: AGHT+IGEUx340a2SP9B+wiI1eimFQvKhmpuK5eVlXZ686g3s4BKmVaVmOwFNWLwo90RmG2J5b/RI5Q==
X-Received: by 2002:a05:6402:42d2:b0:627:8d60:ca57 with SMTP id 4fb4d7f45d1cf-6278d60ccebmr8898309a12.33.1757457172584;
        Tue, 09 Sep 2025 15:32:52 -0700 (PDT)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com. [209.85.128.53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-62bfef68629sm2165028a12.15.2025.09.09.15.32.52
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 15:32:52 -0700 (PDT)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45cb6428c46so57024015e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Sep 2025 15:32:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXoH65kpuqQyFLP4NHNqlLHx0M30JHHxNN0sxR08PXTbofMgwfd/6i1Vj39mTKrHU3gmjTTj48ZyvEjWWU=@lists.ozlabs.org
X-Received: by 2002:a05:6402:4412:b0:61e:a13a:27b8 with SMTP id
 4fb4d7f45d1cf-623729cb58cmr11071027a12.1.1757456686093; Tue, 09 Sep 2025
 15:24:46 -0700 (PDT)
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
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com> <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
In-Reply-To: <C85C32F4-BD58-460B-ACCF-F0569ED0941A@zytor.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 9 Sep 2025 15:24:29 -0700
X-Gmail-Original-Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
X-Gm-Features: Ac12FXyoXbbHUJtrfKhAFeDlVJsB9IiUaRxuYQBQJQyqpHDKK1GQ8JtkX5zx-HA
Message-ID: <CAHk-=wg0bp-_kqmfaDYQLRJO30LYxEsMu3EKi65sKoi83EUZ3Q@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, ksummit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, Richard Weinberger <richard@nod.at>, 
	Lucas Stach <l.stach@pengutronix.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Ankur Arora <ankur.a.arora@oracle.com>, 
	David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Suren Baghdasaryan <surenb@google.com>, Ira Weiny <ira.weiny@intel.com>, 
	Nishanth Menon <nm@ti.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	"Chester A. Unal" <chester.a.unal@arinc9.com>, 
	Sergio Paracuellos <sergio.paracuellos@gmail.com>, Andreas Larsson <andreas@gaisler.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Tue, 9 Sept 2025 at 14:39, H. Peter Anvin <hpa@zytor.com> wrote:
>
> 1 GB systems used highmem too, sadly. And 1 GB was the norm for a big chuck of the late 32-bit era.

Well, while on x86 1GB systems did use highmem, they'd typically not
use very much of it.

IOW, they'd have about 900MB as lowmem (ok, I think it was 896MB to be
exact), with something like 120MB highmem.

So they'd either lose a bit of memory, or they'd use the 2G:2G split.

Or - and I think this is the main point - they'd stay on old kernels
like the ancient museum pieces they are.

I'm not convinced it makes sense to have a modern kernel on a museum piece.

         Linus

