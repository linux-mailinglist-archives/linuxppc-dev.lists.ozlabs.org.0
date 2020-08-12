Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 363842426A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 10:20:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRN1q0spnzDqLF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 18:20:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::444;
 helo=mail-pf1-x444.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=eDg4DOyG; dkim-atps=neutral
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRMqF3LdTzDqXw
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 18:11:36 +1000 (AEST)
Received: by mail-pf1-x444.google.com with SMTP id d188so633755pfd.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 01:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=Gqk0IHazkAbnd1TceTY1ZmQMSGqDC0SOsCEO7z8wdv4=;
 b=eDg4DOyGlwZXAxfvrAWm2bCGM35Xhc/MB9AlQ5a1VVdBg214Fqq5NUhxfeckALVZVq
 wshSpJhFV1UCo2gBcr2GGbD55UBFts6DFhFkvmTXBF0lBdloY7tgosoqUiST7/3+f4Wy
 m3UjaCLNjlrWpvYZYHC5+klYfXP17VtghaLl7pRWaAMR1WBENVLQYlEANV+cZudg+7PM
 KSCK/45JABfmQvheqKAbLQdbOnlT99QuAvOj6/AID7IafCM387DZA3oBUkeCAl910hCa
 Kmo6hG6oIwJngdWFZ2hs+X4wZZ/80PKxgjTW96HR0Zh6X+gJwR38Uq7MueTEyFISYi1X
 O91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=Gqk0IHazkAbnd1TceTY1ZmQMSGqDC0SOsCEO7z8wdv4=;
 b=YIvdSCfLCyqVYfTkzEI5kh/D29SdeTqb0UZwfzUyzSbapJBuFZoJ7MuynAyHv7D6Tq
 a9jmBBR2Ccjr3R8jTxPmmLzeBQClUg0ol5NoTaEGcQXuei8eVpRuuXpRAD+hqjpa/6f5
 moVxmEWKdFPUe0n0OUKtAeJBbMMRIWjJ4qhujcSEOsZKn64np6b/H7CJlkNkctishHMS
 ze3y2WnSkbzxt2XDsXzO+RQi6+KoFrnUpsCWEq2LVTMtwi1RPMN5Qvqzpf/QzaLnH4Iy
 bWuJQnq8TRA03gZsOjWKn0g2sKW6NqjQXlE9Xpa036zNjy+5IV/ymPMnTp+ZIFKyJQPW
 CYfg==
X-Gm-Message-State: AOAM530QdS3/9B9YqKVpDL+OPOUOXI6GIgLrtJEEJGdiaTXYfbpd4lk2
 hc1FEjg/20e4J7tkSzu3nZw=
X-Google-Smtp-Source: ABdhPJyqkUbovHh5ka3/XaSTC8ODlUDFJft07FCaI95cZAdpIni7GZOC8/CuFKmKXdXYaPrreAj/Bw==
X-Received: by 2002:a05:6a00:787:: with SMTP id
 g7mr9620510pfu.290.1597219892350; 
 Wed, 12 Aug 2020 01:11:32 -0700 (PDT)
Received: from localhost (193-116-193-175.tpgi.com.au. [193.116.193.175])
 by smtp.gmail.com with ESMTPSA id w82sm1547171pff.7.2020.08.12.01.11.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Aug 2020 01:11:31 -0700 (PDT)
Date: Wed, 12 Aug 2020 18:11:25 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v3 0/8] huge vmalloc mappings
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Zefan Li
 <lizefan@huawei.com>
References: <20200810022732.1150009-1-npiggin@gmail.com>
 <20200811173217.0000161e@huawei.com>
 <d457aabc-9f58-f47e-f5fa-9539618b2759@huawei.com>
In-Reply-To: <d457aabc-9f58-f47e-f5fa-9539618b2759@huawei.com>
MIME-Version: 1.0
Message-Id: <1597219299.b5noer1k93.astroid@bobo.none>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Will Deacon <will@kernel.org>,
 =?iso-8859-1?q?Catalin=0A?= Marinas <catalin.marinas@arm.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Zefan Li's message of August 12, 2020 11:07 am:
> On 2020/8/12 0:32, Jonathan Cameron wrote:
>> On Mon, 10 Aug 2020 12:27:24 +1000
>> Nicholas Piggin <npiggin@gmail.com> wrote:
>>=20
>>> Not tested on x86 or arm64, would appreciate a quick test there so I ca=
n
>>> ask Andrew to put it in -mm. Other option is I can disable huge vmalloc=
s
>>> for them for the time being.
>>=20
>> Hi Nicholas,
>>=20
>> For arm64 testing with a Kunpeng920.
>>=20
>> I ran a quick sanity test with this series on top of mainline (yes mid m=
erge window
>> so who knows what state is...).  Could I be missing some dependency?
>>=20
>> Without them it boots, with them it doesn't.  Any immediate guesses?
>>=20
>=20
> I've already reported this bug in v2, and yeah I also tested it on arm64
> (not Kunpeng though), so looks like it still hasn't been fixed.

Huh, I thought I did fix it but seems not. vmap stacks shouldn't be=20
big enough to use huge pages though, so I don't know what's going on
there. I'll dig around a bit more.

>=20
> ...
>>>
>>> Since v2:
>>> - Rebased on vmalloc cleanups, split series into simpler pieces.
>>> - Fixed several compile errors and warnings
>>> - Keep the page array and accounting in small page units because
>>>   struct vm_struct is an interface (this should fix x86 vmap stack debu=
g
>>>   assert). [Thanks Zefan]
>=20
> though the changelog says it's fixed for x86.

Yes, my mistake that was supposed to say arm64.

Thanks,
Nick

