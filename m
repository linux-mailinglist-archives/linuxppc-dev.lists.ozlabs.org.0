Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 914F146E6DC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 11:44:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8rJ12vbPz3bY0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 21:44:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=J3fgveQO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430;
 helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=J3fgveQO; dkim-atps=neutral
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8rHL1Ht9z308v
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 21:43:41 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id k26so5022570pfp.10
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 02:43:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=2Qjk1kLBchBn6nu4RyDNGi/pft6RyBtffqzm5RXD6rQ=;
 b=J3fgveQOyktHd0Ho6etVh+aiABFsCMbits+i4+iiw3mPGq0uV+cwoX51PQxUyX1m/u
 guVf+Yy/AALjrRYousf5AWBJOSXjBdfIruQ+12bnfDkQtkrkGptAGDly7UT4e+Qf9/A6
 ZG6y06qVmUF8U/9C0WnBuCeYTnrQT0Ll4AxFXzvcHBUGOeALFrwANDwwkk2cSazA8fQT
 JitIEB2WLroaNlv5sDxN5F3yqb6MnIP+xPFJ28c694sFturpNEL5t5AEuTZTC5UTWqjO
 PVOfPEZ45ZkQYpmOLCeVh8/99r2cqZObZSVqnFBxaEuoX6PyxaJMyUWwq+JlrGlkQQCe
 lsag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=2Qjk1kLBchBn6nu4RyDNGi/pft6RyBtffqzm5RXD6rQ=;
 b=YH3foRUFnPzfHN2NuyGS6joRSoMUetz9BFaX4yKJ8kq4mbcIhyor9FrpoWm4AWNNPM
 EUGiNebSK2SkUiFo4tcV4y0lAsPgoH7J+pm6bIGszDZQIH+HrqUxG/DfFzh00XSPuDil
 Ch0rnE7RAjWja4Yf/d+Ys93r2MLEJ8iuMQYPeNsUFDGF20LG0hDeAMa5ho4RUK77omf9
 8dV41G5/sNZeedoBZl7kjZ+X4608iuehRtIGJc2x4+uJU8bl7tY852loVFMxzQjtIw2I
 ZZjvGumFqlbObc7RO4ZCUoKgtDQ4M8JAGR3PfCu4vjj68CM+0BsZNx7b9S0Bk9tCNd32
 +jSA==
X-Gm-Message-State: AOAM530RXPHmmaMcb649jVSUKlOZcF2wQdpI3+JBsC/EU/Ul5vPXvMX6
 rAOgmA4fSydKndX6F4lF2Fo=
X-Google-Smtp-Source: ABdhPJwHG5S78XCRdMnXjjsXRAdUoVQkNZBPVctW89B41UUPc1LLj2IYRqJKX0ugAkxryonyH8Gm6Q==
X-Received: by 2002:a63:b60e:: with SMTP id j14mr33497418pgf.554.1639046618557; 
 Thu, 09 Dec 2021 02:43:38 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id h8sm5230340pgj.26.2021.12.09.02.43.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:43:38 -0800 (PST)
Date: Thu, 09 Dec 2021 20:43:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
To: "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
 <1639044621.jeow25j0pr.astroid@bobo.none>
 <360e2a3e-63c6-3ce2-f481-695ad0ec4880@csgroup.eu>
In-Reply-To: <360e2a3e-63c6-3ce2-f481-695ad0ec4880@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639046542.qkwu4mjtew.astroid@bobo.none>
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
Cc: "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of December 9, 2021 8:22 pm:
>=20
>=20
> Le 09/12/2021 =C3=A0 11:15, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
>>> Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
>>> remove arch/powerpc/mm/mmap.c
>>>
>>> This change provides standard randomisation of mmaps.
>>>
>>> See commit 8b8addf891de ("x86/mm/32: Enable full randomization on i386
>>> and X86_32") for all the benefits of mmap randomisation.
>>=20
>> The justification seems pretty reasonable.
>>=20
>>>
>>> Comparison between powerpc implementation and the generic one:
>>> - mmap_is_legacy() is identical.
>>> - arch_mmap_rnd() does exactly the same allthough it's written
>>> slightly differently.
>>> - MIN_GAP and MAX_GAP are identical.
>>> - mmap_base() does the same but uses STACK_RND_MASK which provides
>>> the same values as stack_maxrandom_size().
>>> - arch_pick_mmap_layout() is almost identical. The only difference
>>> is that it also adds the random factor to mm->mmap_base in legacy mode.
>>>
>>> That last point is what provides the standard randomisation of mmaps.
>>=20
>> Thanks for describing it. Could you add random_factor to mmap_base for
>> the legacy path for powerpc as a 2-line change that adds the legacy
>> randomisation. And then this bigger patch would be closer to a no-op.
>>=20
>=20
> You mean you would like to see the following patch before doing the=20
> convert ?
>=20
> https://patchwork.ozlabs.org/project/linuxppc-dev/patch/7dabf1cbde67a346a=
187881d4f0bd17347e0334a.1533732583.git.christophe.leroy@c-s.fr/

Yes.

Thanks,
Nick
