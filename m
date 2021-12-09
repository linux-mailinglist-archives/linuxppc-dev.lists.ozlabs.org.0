Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4D946E672
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 11:16:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J8qgv2QJhz3cFX
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Dec 2021 21:16:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=NQ9+kg5K;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::530;
 helo=mail-pg1-x530.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=NQ9+kg5K; dkim-atps=neutral
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J8qgD4KRjz3053
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Dec 2021 21:15:51 +1100 (AEDT)
Received: by mail-pg1-x530.google.com with SMTP id s137so4655625pgs.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 02:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=uTtDFl4ylvWzOUxVw5Eo9EBEL+buH4qtkFmI+A3VVv0=;
 b=NQ9+kg5KOv5dp8pVp2G3I8lUbNXVG0gGlaVKBRUDptLxHDT3j6LoR5hi005x1rifX+
 uA6bfveQG0dx3f3Pz+tdXHOtl8NoklpAuoTEXZUr+NSdbKoqLQlXdLMULNoJ0k9Rq6ZK
 SSEUIuBrDVN8GOsU/W4YMnlWzJypWUzwT+skDvkedX8UYzrYQHgnOiqAMWnKd0cRvd41
 LM6mLgEdHygyZ72GDyz21c7VxxOdNMpIHcsRXabxpb4b5XhinlJaD+deOAZAo8o4HKKs
 KW2NnFS0VCtV+d/d3qC19MUMo6+woIuBgTEGVoOt7F/LCFRfUQLYO+GyaCpWHXIB2qEu
 Gbtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=uTtDFl4ylvWzOUxVw5Eo9EBEL+buH4qtkFmI+A3VVv0=;
 b=hb8TOrw/e1trwmKL+miruTMhqEw0jUUIX+Mh0kPxfZA0HOt7cXcreAhybGzvZXhHVL
 Hqngik5g/ina8DZ/BJJFwYDOp7/Jfqa4WyJM1jdgEBoMayAXq6rmI7S0JT03WeFtl+cL
 klhjMey4oKcPtGJEIcxVzHF5k41fs4ualHxVy4tdIoy/QHgZX9LZZzIE4zwWv26Y5BX5
 eOBn9/bt1c6/JQAuNs7zSEolAM3VZKnGW7kdJ9JiFRUUP/l5eSKpypYf2SpGzhLi0AVw
 q4EI6I/Kj7SFNEmU6HU+PbneNnJr1BKKX5yFw+ZVNTs1WMW01DRXkeeoATsAVlxuVTPF
 JUXA==
X-Gm-Message-State: AOAM532F/ROLo7i5lTy/WO6IkkrEkLkSu6GLMtUEVSYFTIJeeHI8A9Vq
 sxtME3gQyhF9f0ZNDfeYhpY=
X-Google-Smtp-Source: ABdhPJwjI9kxYeG3xjcWudWWgMKJYeADbcpgkvYJNmVIASIiiFf9HmZhYN59I+Cd0HwMP0j9lYkm/w==
X-Received: by 2002:a63:69c6:: with SMTP id
 e189mr32529626pgc.237.1639044949008; 
 Thu, 09 Dec 2021 02:15:49 -0800 (PST)
Received: from localhost (203-219-139-206.static.tpgi.com.au.
 [203.219.139.206])
 by smtp.gmail.com with ESMTPSA id n6sm6227193pfa.28.2021.12.09.02.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 02:15:48 -0800 (PST)
Date: Thu, 09 Dec 2021 20:15:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v4 09/10] powerpc/mm: Convert to default topdown mmap
 layout
To: "alex@ghiti.fr" <alex@ghiti.fr>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <cover.1638976228.git.christophe.leroy@csgroup.eu>
 <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
In-Reply-To: <d2d5510115cba2d56866fa01dab267655a20da71.1638976229.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1639044621.jeow25j0pr.astroid@bobo.none>
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

Excerpts from Christophe Leroy's message of December 9, 2021 3:18 am:
> Select CONFIG_ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT and
> remove arch/powerpc/mm/mmap.c
>=20
> This change provides standard randomisation of mmaps.
>=20
> See commit 8b8addf891de ("x86/mm/32: Enable full randomization on i386
> and X86_32") for all the benefits of mmap randomisation.

The justification seems pretty reasonable.

>=20
> Comparison between powerpc implementation and the generic one:
> - mmap_is_legacy() is identical.
> - arch_mmap_rnd() does exactly the same allthough it's written
> slightly differently.
> - MIN_GAP and MAX_GAP are identical.
> - mmap_base() does the same but uses STACK_RND_MASK which provides
> the same values as stack_maxrandom_size().
> - arch_pick_mmap_layout() is almost identical. The only difference
> is that it also adds the random factor to mm->mmap_base in legacy mode.
>=20
> That last point is what provides the standard randomisation of mmaps.

Thanks for describing it. Could you add random_factor to mmap_base for
the legacy path for powerpc as a 2-line change that adds the legacy
randomisation. And then this bigger patch would be closer to a no-op.

Thanks,
Nick

