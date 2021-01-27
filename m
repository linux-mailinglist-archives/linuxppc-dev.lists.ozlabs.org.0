Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5878330684B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 00:52:06 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DR0kq3F0VzDr5R
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jan 2021 10:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a;
 helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fGLqz9Us; dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DR0hv62rMzDqD1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Jan 2021 10:50:22 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id o16so2896313pgg.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Jan 2021 15:50:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=XsErl/cimO7wftOceCRiamL1P72e2kHrMeV9MFjW27g=;
 b=fGLqz9UsgK9Cr9me5mJkGUUHZ/ke2usuBxuSHXBCSgMAeh8tHZ4FMurwWB5rlSQeDo
 bemL1e/oAsER36IcSonYKQfzwXrATmHWRNnVyLXNVunMnwmQ/6UkWKx24BjgWPbcs+Sz
 PRCJ5rJ8HRVTkKeKmnYynuL7P0Z9wyQg0yKdq4ezgecbXb5C18uMVENT0iSAOVQ8DT5e
 7sZTGp9nvfjpfwxGqQZbfXbzQLm68F0h7BpVi1d4byqSVDCCP9ahAQXe/AJ7YibeAlkz
 fhmRVpGnoTfaFtXnX3r7ZaMuY2o56WzZTKzZ3XZOvcNFf1MP+q4xLghbJpi5QIHQfGvS
 uzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=XsErl/cimO7wftOceCRiamL1P72e2kHrMeV9MFjW27g=;
 b=OdNBmYbTFnyJsQ4Hobd89fNn4VEvoZGS7zCc88e4RJf8Q+8J/U3Qk/SQ01XNBXxXpk
 LzQu3Us8AuBn/yEM1qfCln1TcKAgu7GjBoH9vugl1nn6DuA53gKZC41Y8PFfKJjtfz6i
 KkPojCI4xWfsR7PnJGabfdWYDxeKray2xSFavjPne/sOrt71R1cuI2XZ+t+puwSdPbJu
 BvZ1bvYu0FACPF5RnMR9vGqVPCVt+vvD7qsyPup53RYjXKDWA9fEj/J9qxZ496NkOzu8
 bjcg3e+6Fi7IgFV0no8KaiDzHiU6/La6juex3nBBdQ+RDhJ/W+21W8Q0/IUaMolLkuKR
 42GQ==
X-Gm-Message-State: AOAM533rvwwS42s7T3yFJPmD2Bo5oeKUCSQWX/JNcU8sA3M721oVNQrs
 d7XWK5En3HqsOnKzW/Ba48Q=
X-Google-Smtp-Source: ABdhPJzPxvfNcOGRxVoxGRJhNJzeeR6LVj1ni1YjcQZl5ymQxjDeLCfX6QUO6JSQd/lT4PTM1qPt3g==
X-Received: by 2002:a63:4764:: with SMTP id w36mr13533232pgk.127.1611791419066; 
 Wed, 27 Jan 2021 15:50:19 -0800 (PST)
Received: from localhost
 (192.156.221.203.dial.dynamic.acc50-nort-cbr.comindico.com.au.
 [203.221.156.192])
 by smtp.gmail.com with ESMTPSA id g22sm3455973pfu.200.2021.01.27.15.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jan 2021 15:50:18 -0800 (PST)
Date: Thu, 28 Jan 2021 09:50:12 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: RE: [PATCH v4 11/23] powerpc/syscall: Rename syscall_64.c into
 syscall.c
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>, Christophe Leroy
 <christophe.leroy@csgroup.eu>, David Laight <David.Laight@ACULAB.COM>,
 Michael Ellerman <mpe@ellerman.id.au>, "msuchanek@suse.de"
 <msuchanek@suse.de>, Paul Mackerras <paulus@samba.org>
References: <cover.1611585031.git.christophe.leroy@csgroup.eu>
 <ff9dd4accdc897013594768833d54444e4823bf9.1611585031.git.christophe.leroy@csgroup.eu>
 <1611656343.yaxha7r2q4.astroid@bobo.none>
 <d9993f034db848d1afeffa322373b811@AcuMS.aculab.com>
In-Reply-To: <d9993f034db848d1afeffa322373b811@AcuMS.aculab.com>
MIME-Version: 1.0
Message-Id: <1611791083.sqnnh21vv0.astroid@bobo.none>
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
Cc: "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from David Laight's message of January 26, 2021 8:28 pm:
> From: Nicholas Piggin
>> Sent: 26 January 2021 10:21
>>=20
>> Excerpts from Christophe Leroy's message of January 26, 2021 12:48 am:
>> > syscall_64.c will be reused almost as is for PPC32.
>> >
>> > Rename it syscall.c
>>=20
>> Could you rename it to interrupt.c instead? A system call is an
>> interrupt, and the file now also has code to return from other
>> interrupts as well, and it matches the new asm/interrupt.h from
>> the interrupts series.
>=20
> Hmmm....
>=20
> That might make it harder for someone looking for the system call
> entry code to find it.

It's very grep'able.

> In some sense interrupts are the simpler case.
>=20
> Especially when comparing with other architectures which have
> special instructions for syscall entry.

powerpc does have a special instruction for syscall, and it causes a
system call interrupt.

I'm not sure about other architectures, but for powerpc its more=20
sensible to call it interrupt.c than syscall.c.

Thanks,
Nick
