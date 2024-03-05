Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9B3871354
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:09:49 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lslur7lD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfCH1lzpz3dTG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:09:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=Lslur7lD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a; helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfBX5fnkz3brm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:09:07 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1d944e8f367so35193145ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709604545; x=1710209345; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gb/s+EbPr52ZFvc8KNwg6PBWDcyap/fx9BaAcLDTpTY=;
        b=Lslur7lDGA8+YAZaRwCIEIJ4LQ5aPFNoje5yv50n3F0MKKEdDFXP3M36YpeRoLDmiZ
         CqzXBhLXlwTGJHVW8Hs0uLNj4nYDBcCH57N06eaCLARgBicwk5tdgRt3imR4yfuE0XGK
         FsF56G3FR+vnrK+TUdVvh1PG+QiKwdpm21szccZfi74Cb6+3DCJcayGA+xL/tln3+iXd
         CbN1gn05WsrmetzI7QXDPvV+6p4iTf3yAzSNbeuzNyLPXeTQR2ZX7dX7seeKgsvA3O3f
         yNbdpRI50kIwKOJ9wlHjP4tXcI4YSiBkhVp1JouLeLWug24NjF50G6Dqnfw9+DVKMHhW
         hkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604545; x=1710209345;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gb/s+EbPr52ZFvc8KNwg6PBWDcyap/fx9BaAcLDTpTY=;
        b=uu4YYWhowsUZJkZ4W5AEgs1okaiUuqAwRaXZbygybeELFLa4uV+6GitJyuYcEDKTap
         DB2egkWjHLl24g79WvOYlwQLkQFEz9ay1PtphLd6FBjMSWReivycQyW4zri6791lprsc
         fDNdzDIkbR7pqDkTpR/PCkxlBAbH13x/D5Wf5MpA0hl3g/IXHd7hXPxvDjhZqGP/q8q7
         lA9pM1ArJmlKUKejfKRMf/Rw2zWYrJomavd+Y57KZNGMThww78C5h9agLDhd+f8bJEDu
         Lg2qV60vSlHsEXEZgWtgL1P6eHlcMJI4a5I0/usuFdVP13ecD6w32pFWFvB6KXXFIR5w
         MJug==
X-Forwarded-Encrypted: i=1; AJvYcCWn2VVFjJO+cuo1KeGPMHY1IDpQXv7deG/qXwtS9NOoNNUlr0jFGQ4mYXeE3jifgSm3W1rrw/fS/0rXVxGnfcvlkcTDYW8KnRFO0nQfBw==
X-Gm-Message-State: AOJu0Yz65guO34g8Re5rfnxhfqyq0ZImqsFilQ2zp7/MClkSpbzX0RYL
	ukAJg5PvBoSZw1a7/qs47D1qmdvW88ZhvLHedZ5MUloCgJTXqVHV+2PUBSb9
X-Google-Smtp-Source: AGHT+IHTIQNIkLXInj+5GmudtJWsuuyfm9Ahv96PQZFdTUkLMLlqcwSGFsIPfxt0y8vWKbogHL4PuA==
X-Received: by 2002:a17:90b:282:b0:29b:1f71:957c with SMTP id az2-20020a17090b028200b0029b1f71957cmr8333068pjb.14.1709604544979;
        Mon, 04 Mar 2024 18:09:04 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id mf12-20020a17090b184c00b002904cba0ffbsm10666321pjb.32.2024.03.04.18.09.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:09:04 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:08:58 +1000
Message-Id: <CZLG8AT5RBK6.3G95C3Q1URS9V@wheely>
Subject: Re: [kvm-unit-tests PATCH 03/32] powerpc: Fix stack backtrace
 termination
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-4-npiggin@gmail.com>
 <94491aab-b252-4590-b2a7-7a581297606f@redhat.com>
 <f659964b-da95-4339-9d4f-c7b6a72fbac0@redhat.com>
In-Reply-To: <f659964b-da95-4339-9d4f-c7b6a72fbac0@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 1, 2024 at 7:45 PM AEST, Thomas Huth wrote:
> On 27/02/2024 09.50, Thomas Huth wrote:
> > On 26/02/2024 11.11, Nicholas Piggin wrote:
> >> The backtrace handler terminates when it sees a NULL caller address,
> >> but the powerpc stack setup does not keep such a NULL caller frame
> >> at the start of the stack.
> >>
> >> This happens to work on pseries because the memory at 0 is mapped and
> >> it contains 0 at the location of the return address pointer if it
> >> were a stack frame. But this is fragile, and does not work with powern=
v
> >> where address 0 contains firmware instructions.
> >>
> >> Use the existing dummy frame on stack as the NULL caller, and create a
> >> new frame on stack for the entry code.
> >>
> >> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> >> ---
> >> =C2=A0 powerpc/cstart64.S | 12 ++++++++++--
> >> =C2=A0 1 file changed, 10 insertions(+), 2 deletions(-)
> >=20
> > Thanks for tackling this! ... however, not doing powerpc work since yea=
rs=20
> > anymore, I have some ignorant questions below...
> >=20
> >> diff --git a/powerpc/cstart64.S b/powerpc/cstart64.S
> >> index e18ae9a22..14ab0c6c8 100644
> >> --- a/powerpc/cstart64.S
> >> +++ b/powerpc/cstart64.S
> >> @@ -46,8 +46,16 @@ start:
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 r1, r1, r31
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 add=C2=A0=C2=A0=C2=A0 r2, r2, r31
> >> +=C2=A0=C2=A0=C2=A0 /* Zero backpointers in initial stack frame so bac=
ktrace() stops */
> >> +=C2=A0=C2=A0=C2=A0 li=C2=A0=C2=A0=C2=A0 r0,0
> >> +=C2=A0=C2=A0=C2=A0 std=C2=A0=C2=A0=C2=A0 r0,0(r1)
> >=20
> > 0(r1) is the back chain pointer ...
> >=20
> >> +=C2=A0=C2=A0=C2=A0 std=C2=A0=C2=A0=C2=A0 r0,16(r1)
> >=20
> > ... but what is 16(r1) ? I suppose that should be the "LR save word" ? =
But=20
> > isn't that at 8(r1) instead?? (not sure whether I'm looking at the righ=
t ELF=20
> > abi spec right now...)
>
> Ok, I was looking at the wrong ELF spec, indeed (it was an ancient 32-bit=
=20
> spec, not the 64-bit ABI). Sorry for the confusion. Having a proper #defi=
ne=20
> or a comment for the 16 here would still be helpful, though.

Thanks for the deailed reviews as always. I've been a little busy with
QEMU so may not get another series out for a bit. I'll probably wait for
Andrew's stack backtrace changes to land too before resend.

But, yes a comment makes sense. I'll add.

Thanks,
Nick
