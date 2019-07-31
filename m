Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3309C7D1AE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 01:09:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zTdz4jylzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 09:09:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::441; helo=mail-pf1-x441.google.com;
 envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="H7B8fYCB"; 
 dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zTbf6z1xzDqmX
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 Aug 2019 09:07:40 +1000 (AEST)
Received: by mail-pf1-x441.google.com with SMTP id u14so32710702pfn.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jul 2019 16:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :user-agent:message-id:content-transfer-encoding;
 bh=5xkYYWFUJIGhYM2fFqk+xJx9QlaJV4qyP7MvDXs3VJM=;
 b=H7B8fYCBMlcSaq3TS6JFo6g6OuYJCB0xVAwCo3RnbdPMLxnz57bHxot5y8qLSjXSCT
 LbtZfFaFTldYeMipVcZ6E6TMg2H03ojXz6EocNmhL7y1bwzqGTKCpcQe11onclyt7AUu
 YbYCp9KQ/HbBCKpzv6wzA9TceVkR4jWbhOXUWFL+UhNXQzYTgDVZI1gCXZ7Sqzekp1p+
 mw8DHrrsV/GtZQw/UKzQ/3bfmlYyVjk2ghlGyYQJZrAGqVnF2XKI21V1m+T6DsKOz0Je
 zYpZSq+z+d6bSXa+sd74Xx4MdGGXaCcFkK9wOUi+IyzOVN9UIo6Kwgg5ZDjGzCvECGIT
 9Gpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:user-agent:message-id:content-transfer-encoding;
 bh=5xkYYWFUJIGhYM2fFqk+xJx9QlaJV4qyP7MvDXs3VJM=;
 b=DhwM1RQZlPfo5rJ8geV9SIPusXbT+qvU63ECLLo2aPhEF3k1hG2cThwGq16jaJ6OGD
 ey+5C9rp1Sn/FCwhnM1MrMIPBA5r6FbF87xN0bDs2gl2ACsM7uv/cjAlCG9JJiV23kw2
 y2xsbCpqee56OeS2J0un3ftoojZSME97JGR19iZObArDIW9ycjXdlZMlzNa1PAuKOp2C
 u+Bnln3wscAlVsq0OGyD8t/utG0567iIrRM9UnzhJnwoVXZM331YOLYL2ZOGnhC6I5d+
 eReNOUQxZIyEuR4NB+zpjKSQEMs0CaHYbT8epXB1OotniNZSmimDf3ENYAx2nZYHh+k3
 289Q==
X-Gm-Message-State: APjAAAW1TIUAL8TliDBEB0psK9m3PSQtmttdo5GqT1feSfL/1GWbpkdE
 yElN6QryaLeZSvgw8c6hDBY=
X-Google-Smtp-Source: APXvYqxTtXhMznTnaW549CxpKCl6nL/8QkUHFO3fOBv1rVGdANcxuDKxOgtKIhoU2PxcraqK4+aSkg==
X-Received: by 2002:a17:90a:fa07:: with SMTP id
 cm7mr5065190pjb.138.1564614456719; 
 Wed, 31 Jul 2019 16:07:36 -0700 (PDT)
Received: from localhost ([61.69.185.217])
 by smtp.gmail.com with ESMTPSA id i3sm75438531pfo.138.2019.07.31.16.07.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 31 Jul 2019 16:07:36 -0700 (PDT)
Date: Thu, 01 Aug 2019 09:05:51 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [RFC PATCH] powerpc/64s/radix: introduce option to disable
 broadcast tlbie
To: Christophe Leroy <christophe.leroy@c-s.fr>, linuxppc-dev@lists.ozlabs.org
References: <20190731123203.6370-1-npiggin@gmail.com>
 <188d2d1d-a254-d00c-eee4-dd71e01b443f@c-s.fr>
In-Reply-To: <188d2d1d-a254-d00c-eee4-dd71e01b443f@c-s.fr>
MIME-Version: 1.0
User-Agent: astroid/0.15.0 (https://github.com/astroidmail/astroid)
Message-Id: <1564613600.hm3hrx4s31.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8
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
Cc: "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Paul Mackerras <paulus@samba.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy's on July 31, 2019 11:56 pm:
>=20
>=20
> Le 31/07/2019 =C3=A0 14:32, Nicholas Piggin a =C3=A9crit=C2=A0:
>> This is an initial hack of a quick option to disable use of the tlbie
>> instruction. This takes the simplest possible initial pass of just
>> replacing low level tlbie functions with IPIs. This means it's not as
>> performant as it could be if we spend some time optmizing it, but on
>> the other hand having a 1:1 replacement of tlbie is simple and can be
>> useful for comparisons so I think it's the right initial approach.
>=20
> Can you explain why we want to optionnaly disable use of tlbie ?

It's something we've wanted to have more control of for a while.

One is for testing performance, especially on large systems it is not
always best to use tlbie. For example if you have threaded apps that
only run on a few CPUs (e.g., process * thread hybrid process model
server).

There is also concern about coherent accelerators may have high
latency to respond to tlbie, which can block the resource for others.

And we did have a hardware errata with early POWER9 it would have
been nice to disable it until the kernel could be updated with the
workaround.

Thanks,
Nick
=
