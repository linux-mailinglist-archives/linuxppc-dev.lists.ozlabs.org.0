Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 84AEB344E28
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 19:11:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F42dD3gMYz30L7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 05:11:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=rz7CCuMt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031;
 helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rz7CCuMt; dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F42cp4H2vz2xfQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 05:11:21 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id ha17so8926444pjb.2
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Mar 2021 11:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:references:in-reply-to:mime-version:message-id
 :content-transfer-encoding;
 bh=zWbl7Z6oFpkvYVLeeOJEXl8wtDXfc9VDYkETWAbTl2g=;
 b=rz7CCuMtOJVjsBo73llqGr6OuZNBaKJfH2nENBJ/YxDCxUwkIOUBv/aNBCsjZz6gjY
 LMGYpyF0yVbC4RbvSrIIFD+cJTqcwaF4JtOUAkVlOEG5LL5IUvBJSpaRGMT1mT1zsZNu
 KzlQXdGgbL/c8B0V8VFRaEioupshIHbwKez19YB+M6y2tPk51rkXjjcCNcWMoJiTxLbg
 Wv9Du8hJgz7A+AH49hd5XDl4lkt3C7BUxuAkrf/MmvmxUB6lfGQNcnaXsDOl1KSMh6hR
 56U4EfEZMyToMyrBEWlcefsFuCjBhG/zKbgxeFkI4s/+E+s26Jv55eS918ndQsnBM7Ep
 8KQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=zWbl7Z6oFpkvYVLeeOJEXl8wtDXfc9VDYkETWAbTl2g=;
 b=tEE7wNC6si21QRdRk491RWwK0Hfq6oIknzQGt0drCd5yjojcLXwRqwhAztf5twwwZt
 PZTynGqS67tdwHHfd6szCGQ72HHHLBhDpf+ovepxDbhrxpoc7QlR5fCLH8RQhrhFMSFz
 OsgCeAXyndcsDeDLImU6DUhMux43e0QlrJdCXYTqL51AuKFCT35ixwchuN9b0zckh49h
 okjdjF8uHwdpauTSfEjcAOROVthyZzABdmEnp1/rdMTl0Nfo9YDuJfQeL0Brswv1TffB
 7rq2cN1edhjXPUsz3N7qvKwGwz5/zFxdxxOe70gXbuOvIKIx49A8/M6LaTbt0BwabNk9
 h4wQ==
X-Gm-Message-State: AOAM532sfP0+W1a3y1g9jXk59aDWDHznJuxcxQieFDrP9Ve0Y6Qh5ty0
 WZyAayJiUhbnmiW9vmCPKIg=
X-Google-Smtp-Source: ABdhPJzSY/JLE1N5EOjPslqrl1ooL9SzbYMQFIg8THWR3LjdIxKCqLWxHULCMtzZXhjYzPCJvZLRNw==
X-Received: by 2002:a17:90a:13c5:: with SMTP id s5mr319351pjf.31.1616436677565; 
 Mon, 22 Mar 2021 11:11:17 -0700 (PDT)
Received: from localhost ([58.84.78.96])
 by smtp.gmail.com with ESMTPSA id 80sm2874378pgg.8.2021.03.22.11.11.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Mar 2021 11:11:16 -0700 (PDT)
Date: Tue, 23 Mar 2021 04:11:10 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH 6/8] powerpc/mm/book3s64/hash: drop pre 2.06 tlbiel
 for clang
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Daniel Axtens
 <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org,
 llvmlinux@lists.linuxfoundation.org
References: <20210225031006.1204774-1-dja@axtens.net>
 <20210225031006.1204774-7-dja@axtens.net>
 <1616118111.i881ydq4h2.astroid@bobo.none>
 <7f7cafb5-e6c4-5015-5285-9f9ca25e52fb@csgroup.eu>
In-Reply-To: <7f7cafb5-e6c4-5015-5285-9f9ca25e52fb@csgroup.eu>
MIME-Version: 1.0
Message-Id: <1616436133.s8792026fh.astroid@bobo.none>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Christophe Leroy's message of March 23, 2021 2:49 am:
>=20
>=20
> Le 19/03/2021 =C3=A0 03:01, Nicholas Piggin a =C3=A9crit=C2=A0:
>> Excerpts from Daniel Axtens's message of February 25, 2021 1:10 pm:
>>> The llvm integrated assembler does not recognise the ISA 2.05 tlbiel
>>> version. Eventually do this more smartly.
>>=20
>> The whole thing with TLBIE and TLBIEL in this file seems a bit too
>> clever. We should have PPC_TLBIE* macros for all of them.
>=20
> I was expecting to drop PPC_* macros as much as possible taking into acco=
unt the later binutils=20
> support most of them (https://github.com/linuxppc/issues/issues/350). Was=
 not expecting to go the=20
> other direction.

The problem in this file is we generate 3 different tlbie and tlbiel
instructions with the same mnemonic corresponding to different ISA
versions.

This might actually be the one good place to use .machine to make sure=20
the assembler generates the right thing. I'm not entirely sure it is
foolproof because some of the times the instruction variant is inferred
by the number of arguments it has yet arguments can be implicit. PPC_
define would be exactly explicit.

But if it can be made reasonably robust with .machine then I'd be okay
with that too.

Thanks,
Nick
