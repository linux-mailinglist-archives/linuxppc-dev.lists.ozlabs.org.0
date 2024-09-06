Return-Path: <linuxppc-dev+bounces-1135-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A580D96FC6C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2024 21:57:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X0n7s2Jnsz2yD8;
	Sat,  7 Sep 2024 05:57:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::52c"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725652649;
	cv=none; b=cF96kxJ3DJLsxSKDhesxK1gmMjH+5oLegx9f0SmJuApFOdQcctUK/+/zkT4FaHUJXlkeP+KQbXNe/WBbmvUxIMUD9J/gQzL6npBNZEsqc2puNHvAoVWA8Cpok9NHRvWh2lrSrMJxA+aUMzAy1p9xZy8fz9mevYV5zSqh3iN7wlyvoQKxziwQsapeiqsJ1ujLPoqHjMzXcK98pBZtmQVHQvob2Ar/Og7GFSmpoNMiXPXXYo8J/nWcp1depXp9erJUNySSxPvJUsrbOB8HL9bnXWmBiOC4+eMFuo1Ad/J+jJ2GzDKleuNY2jM5fJYi9SrC1er1447whAmIogKU9F5k7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725652649; c=relaxed/relaxed;
	bh=iWQmjvgGehAkfMiXMASjrzXv69auHMxCkzvxZZ2Yp7U=;
	h=DKIM-Signature:MIME-Version:References:In-Reply-To:From:Date:
	 Message-ID:Subject:To:Cc:Content-Type; b=eHTLh+i9POCvtfoZimfYGdgI8Npi5l6P7V/MykAcACHCZ4vR8UpoSM63i/chC9rFipC26vjNFHAto9aKq3zIAON8DJDIasTU+ZP4m9T3xXzs6OWZRqtgkwGhOYIULdrpeuvytDUerH8lCfuY0F69cPuF7+Nwa1OL9XdSzrW9/GTsv/6h5csjzYsyN7JgWzPYB0ygjLGAP9P+1T6AekFvexIekCH1L/VxFa8p7SOHRzja8/PYvTsqKxdq6ztFOgfXdLh0zLn5RFUqfl4rbo4VmA3L72qkkrP8LsBTN5pJOmvgXs3etyJNk8ynQp0b8ja+CubQuLyStTjfD6+wiGdR3Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NDBPgVtJ; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org) smtp.mailfrom=linuxfoundation.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=NDBPgVtJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linuxfoundation.org (client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com; envelope-from=torvalds@linuxfoundation.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X0n7r0gmnz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Sep 2024 05:57:26 +1000 (AEST)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5c3c34e3c39so3535801a12.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2024 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1725652640; x=1726257440; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=iWQmjvgGehAkfMiXMASjrzXv69auHMxCkzvxZZ2Yp7U=;
        b=NDBPgVtJIO2FpQHhdVSK09Uo9B1O1XdE7Akv2hfK14Rm9pqNSSU/vkmqxgI2lbqfEF
         rvDa22s1W7hvZPQMlpD23tZg5Xf+ewmajHXFYFECOszz2g/vzhGEoU0GoafZGCI7z5UK
         63Ua4M1upwJ6wG0rAu4FHGkuMTAo02gA7aeek=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725652640; x=1726257440;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iWQmjvgGehAkfMiXMASjrzXv69auHMxCkzvxZZ2Yp7U=;
        b=OjDdi+Wl5v/XpgzP1VSuySbFEkTFMEnvEXAs5XGNQInERoJ7cjjQI54NL1fevnQoLB
         i0wHnC2xZ/uUOzVGl8DVK/er8Vs6oSRW9p/dD3vDUJbqHNjdClCDWH5dhV/781k52cP2
         ZGqGalzQX16TE+e2zvTezB+Vy8qk5SWNLScO1UO/7VQwpmQymgYNiRVKLhyOJ6Ycy4lP
         dPfJRGnI3FYrThmLWFC1bEUutbWl09xCYXNFWiery0B65BUgcGyyGdHE0hy3J29rbNxC
         NRO+7OUv676lRQMyB9MPkTcLvJVUDL64I7X/2M2vha3ww35xQml9vJrLmWJSL4vjnT1C
         Qy8g==
X-Forwarded-Encrypted: i=1; AJvYcCUlGICD7bwLdITvkfztzQnWz+VS4K1LvOjwrETJ/HrWECHtcLv45oY2kJz4n62OqK5us8SV0v5Nd4LYX7g=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwOI2AFeCrYD6Cp5qnzts8m39GM+EBqPC9oQNv5H/T9aDVqFNIg
	s6hpHiUinWY46dfeOcgE2bwYL/JFi5mP7V2yD/Hk+edUJudKZYYGnsTf2Q7D7zd6nRz7cJgQ/tZ
	g0cq0eA==
X-Google-Smtp-Source: AGHT+IF6TmmMX9MucNQC1AAmYVq7SDV2jhW5QZnufvu32vzuc/spEmmaYnLFJQzfmOAtl9vg0hpoNg==
X-Received: by 2002:a05:6402:5411:b0:5be:e01c:6b5e with SMTP id 4fb4d7f45d1cf-5c3dc7ca1e3mr2258363a12.35.1725652639033;
        Fri, 06 Sep 2024 12:57:19 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc56d686sm2755496a12.56.2024.09.06.12.57.18
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Sep 2024 12:57:18 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a8d13b83511so44830066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Sep 2024 12:57:18 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXgiTr84QoWqIFpBwS6VfGgLzofygbrr/1aiXA0avJ3wtI6nais7YoQ/q4ppzh/sN93fNq7yYn2ee4fJhY=@lists.ozlabs.org
X-Received: by 2002:a17:906:eec7:b0:a7a:9ca6:527 with SMTP id
 a640c23a62f3a-a8a885bfd06mr276682266b.8.1725652638201; Fri, 06 Sep 2024
 12:57:18 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <87ttet3rz9.fsf@mail.lhotse>
In-Reply-To: <87ttet3rz9.fsf@mail.lhotse>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 6 Sep 2024 12:57:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj6L6Qb10jVk+eHH2D3oHFathTc2nnZRpKKbqKuO3Rkow@mail.gmail.com>
Message-ID: <CAHk-=wj6L6Qb10jVk+eHH2D3oHFathTc2nnZRpKKbqKuO3Rkow@mail.gmail.com>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.11-3 tag
To: Michael Ellerman <mpe@ellerman.id.au>
Cc: christophe.leroy@csgroup.eu, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, nysal@linux.ibm.com
Content-Type: text/plain; charset="UTF-8"

On Fri, 6 Sept 2024 at 05:08, Michael Ellerman <mpe@ellerman.id.au> wrote:
>
> Please pull some more powerpc fixes for 6.11:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git tags/powerpc-6.11-3

Hmm. New pgp key? Please don't take me by surprise like this.

The key looks fine, I see the signature by Stephen Rothwell, but I get
worried when I suddenly see a new signature with no notice and then
have to go looking around for it.

                   Linus

