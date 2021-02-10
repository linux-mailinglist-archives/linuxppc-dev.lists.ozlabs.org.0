Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 52249315CB5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 02:59:16 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Db2xX6nrNzDsc1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Feb 2021 12:59:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1030;
 helo=mail-pj1-x1030.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=QcB3JRfz; dkim-atps=neutral
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Db2td61NWzDqTy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Feb 2021 12:56:39 +1100 (AEDT)
Received: by mail-pj1-x1030.google.com with SMTP id my11so2170855pjb.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Feb 2021 17:56:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=cujEpEkxco6B8FhFOweauGZMK6zlCmv92EUaCj1tfZU=;
 b=QcB3JRfzVYnUQKD4IJqERWsSeLYwfEHpJ5NGQfTXsDT2iBtVBJrKBYZB/3BvissB96
 b81RVHnG94ZBmU2/7MkhzEwUuW3SfpukAisiI8EgrpVB4muQPHBJRlX5YYayteadex4n
 l0Q65zSqJKetfa2EuqteJV/vKyOu6CIO49lBRssfiOAI7ztW9wosy93mgL9/1whL+rkm
 xbc+T8P+zRK/mNvcXK1fNTgIJsTwFpf4vH3VSGfAzCTjKbbCRLPjAsspCpzquYoAUCNz
 AWZjdDR7fOIOp9gBMZXNUaEuaGlWydZUXv/P2rGGcx6x5Y+Uz659BM7RKu18uTZQUEEV
 pThA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=cujEpEkxco6B8FhFOweauGZMK6zlCmv92EUaCj1tfZU=;
 b=UvSZM34ce+Whz6fVTelgsSzxurOFShrZ+enNDbZ7ugXpBb+RtugJZ1cLZTjnEuUPnx
 DGkbh0CPdpvZb5bAqLicY510EaFDTwMlRH2nQLgod9HhVYLp/HtLcjf9lSpLopmEI4IL
 CH50Pit+7m0f29tbh9wl6e2fN8TmzAc0Aap8L+XjkpMmwbeKWh6aRqpIsPpWVokS+pC/
 bB8JxR/4oRf3AQDXRrFzoicsNkXNHoQ+4Z4mpvMdzjg/fUf4vQgQQXXCkijJRAvPK71P
 XYa3RjIOeCjCvl2uTwSlCrhWFknNJbL8C+UiVZt9RRtTeqTZULY2TR7pUgTNmlMMprLN
 KIWA==
X-Gm-Message-State: AOAM533n5okQPlOIlc5N8DNLahVhDqX8VCRoEwf00d+jf2a8FCX4lGfG
 cMK7uP4RPtESQacOlLDln/s=
X-Google-Smtp-Source: ABdhPJzdG85BEtQNWf1RRd3yZaTPVEmX/rJLwzoukFhBukSeHLFyF5kK9HUhgm9mwpbTrI97H94B9A==
X-Received: by 2002:a17:90a:5601:: with SMTP id
 r1mr761643pjf.236.1612922195487; 
 Tue, 09 Feb 2021 17:56:35 -0800 (PST)
Received: from localhost (14-201-150-91.tpgi.com.au. [14.201.150.91])
 by smtp.gmail.com with ESMTPSA id bk12sm279994pjb.1.2021.02.09.17.56.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 17:56:34 -0800 (PST)
Date: Wed, 10 Feb 2021 11:56:28 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v5 16/22] powerpc/syscall: Avoid stack frame in likely
 part of system_call_exception()
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Michael Ellerman <mpe@ellerman.id.au>,
 msuchanek@suse.de, Paul Mackerras <paulus@samba.org>
References: <cover.1612796617.git.christophe.leroy@csgroup.eu>
 <981edfd50d4c980634b74c4bb76b765c499a87ec.1612796617.git.christophe.leroy@csgroup.eu>
 <1612834634.qle1lc7n6y.astroid@bobo.none>
 <f2b17529-e1b6-3d2c-a38b-51e91841e438@csgroup.eu>
In-Reply-To: <f2b17529-e1b6-3d2c-a38b-51e91841e438@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1612921956.st2b8xlrew.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of February 10, 2021 2:13 am:
>=20
>=20
> Le 09/02/2021 =C3=A0 02:55, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Christophe Leroy's message of February 9, 2021 1:10 am:
>>> When r3 is not modified, reload it from regs->orig_r3 to free
>>> volatile registers. This avoids a stack frame for the likely part
>>> of system_call_exception()
>>=20
>> This doesn't on my 64s build, but it does reduce one non volatile
>> register save/restore. With quite a bit more register pressure
>> reduction 64s can avoid the stack frame as well.
>=20
> The stack frame is not due to the registers because on PPC64 you have the=
 redzone that you don't=20
> have on PPC32.
>=20
> As far as I can see, this is due to a call to .arch_local_irq_restore().
>=20
> On ppc32 arch_local_irq_restore() is just a write to MSR.

Oh you're right there. We can actually inline fast paths of that I have=20
a patch somewhere, but not sure if it's worthwhile.

>> It's a cool trick but quite code and compiler specific so I don't know
>> how worthwhile it is to keep considering we're calling out into random
>> kernel C code after this.
>>=20
>> Maybe just keep it PPC32 specific for the moment, will have to do more
>> tuning for 64 and we have other stuff to do there first.
>>=20
>> If you are happy to make it 32-bit only then
>=20
> I think we can leave without this, that's only one or two cycles won.

Okay for this round let's drop it for now.

Thanks,
Nick
