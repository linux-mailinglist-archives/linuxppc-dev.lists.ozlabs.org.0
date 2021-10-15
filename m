Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8973F42E8B2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 08:12:20 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HVwsZ0x46z3c8C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 15 Oct 2021 17:12:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gieWljbK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1035;
 helo=mail-pj1-x1035.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gieWljbK; dkim-atps=neutral
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HVwrt6QMSz2xg3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Oct 2021 17:11:40 +1100 (AEDT)
Received: by mail-pj1-x1035.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6526599pjb.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Oct 2021 23:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=plfcm4CfcUE1WiY9y7riQIhpNSbgCl5IoHQbTDcGsFg=;
 b=gieWljbKJwM9dQX6FOXQV2SpCe//Ev5ww9pOhDg5EdDrNtR5Lx0ZAL812Gu332zPKR
 UI7yMIUPu2HyloFVswy9HgPPvtbyrdczGYvnoHYakywHAaViHzL5uqFUKrFbnusGE78p
 FR7XkKvoEOhCvlYUoeVZCxWBtLpfk7zmIJS58MkCHqCV+yC9MSjQFbhk5uVvUNGtWoP6
 NrG607qHVb55hKbFALyOZNpJTTziAS3sgyN27QNIhMeIclv5SsR4MDwB3hEMWWp7mZzz
 voySiAUFzvMaQB1oVslqz1NbLZ/onJvkQWpytWvGSHGyROoBeqZyXvFF/H15Cw767WGu
 2/dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=plfcm4CfcUE1WiY9y7riQIhpNSbgCl5IoHQbTDcGsFg=;
 b=dxDdxxjf0z+Er4mOVnihpe6TQXoOj0m1bl0Qcbh6PX8evZevG4CdS33E+cTYKRsb/5
 utPPxQr6OsUn0jPXL8q+Ne/tZXrPgBszfGcaDIpS4CAaUWsU7OmAaaMcAzs1S5wyResu
 /Kok6YG9MLimqe9S1uOYpVZ0Z3lrgBmOHfBe3o3egzUx3851QmI7+c7UCdD7qMmzIycF
 viVBobhp/StGd7B0mSSDTi2dsNdkvbuVxcVnB5A5g8dtBvgA9XOZzFRLNJsWAKZBSPVE
 ZuQWqR5Kcu0vcv9LwJaXHyKJtQXEYKbZueyc0ORtj/hl+YYFR+vpYtbbNKMRY61Wgzfc
 s7Ng==
X-Gm-Message-State: AOAM5303W64JAd9Xl3elDqMiaV3X8jpCxMsQjJapM67IXRF5JqEGDblp
 Bi5yPM9h5awl9x9KbmBKhF0=
X-Google-Smtp-Source: ABdhPJw1NnFiRHA+uTmys9crR/a3G0Uc+wC/8h4OyGNNK2GxtvT1XWJX/yFt1VyNaMubShrCkR00uw==
X-Received: by 2002:a17:902:6f01:b0:138:9aca:efda with SMTP id
 w1-20020a1709026f0100b001389acaefdamr9600787plk.19.1634278297562; 
 Thu, 14 Oct 2021 23:11:37 -0700 (PDT)
Received: from localhost (14-203-144-177.static.tpgi.com.au. [14.203.144.177])
 by smtp.gmail.com with ESMTPSA id
 s22sm4032847pfe.76.2021.10.14.23.11.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 23:11:37 -0700 (PDT)
Date: Fri, 15 Oct 2021 16:11:32 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2 03/13] powerpc: Remove func_descr_t
To: Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, Helge Deller <deller@gmx.de>, Daniel Axtens
 <dja@axtens.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Kees Cook
 <keescook@chromium.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Paul Mackerras <paulus@samba.org>
References: <cover.1634190022.git.christophe.leroy@csgroup.eu>
 <16eef6afbf7322d0c07760ebf827b8f9f50f7c6e.1634190022.git.christophe.leroy@csgroup.eu>
 <874k9j45fm.fsf@dja-thinkpad.axtens.net>
 <b02d5211-2f00-b303-766b-d612c1bd4402@csgroup.eu>
In-Reply-To: <b02d5211-2f00-b303-766b-d612c1bd4402@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1634277766.29y8aqzatr.astroid@bobo.none>
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
Cc: linux-arch@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of October 15, 2021 3:19 pm:
>=20
>=20
> Le 15/10/2021 =C3=A0 00:17, Daniel Axtens a =C3=A9crit=C2=A0:
>> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
>>=20
>>> 'func_descr_t' is redundant with 'struct ppc64_opd_entry'
>>=20
>> So, if I understand the overall direction of the series, you're
>> consolidating powerpc around one single type for function descriptors,
>> and then you're creating a generic typedef so that generic code can
>> always do ((func_desc_t)x)->addr to get the address of a function out of
>> a function descriptor regardless of arch. (And regardless of whether the
>> arch uses function descriptors or not.)
>=20
> An architecture not using function descriptors won't do much with=20
> ((func_desc_t *)x)->addr. This is just done to allow building stuff=20
> regardless.
>=20
> I prefer something like
>=20
> 	if (have_function_descriptors())
> 		addr =3D (func_desc_t *)ptr)->addr;
> 	else
> 		addr =3D ptr;

If you make a generic data type for architectures without function=20
descriptors as such

typedef struct func_desc {
    char addr[0];
} func_desc_t;

Then you can do that with no if. The downside is your addr has to be=20
char * and it's maybe not helpful to be so "clever".

>>   - why pick ppc64_opd_entry over func_descr_t?
>=20
> Good question. At the begining it was because it was in UAPI headers,=20
> and also because it was the one used in our=20
> dereference_function_descriptor().
>=20
> But at the end maybe that's not the more logical choice. I need to look=20
> a bit more.

I would prefer the func_descr_t (with 'toc' and 'env') if you're going=20
to change it.

Thanks,
Nick
