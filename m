Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 01880724719
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 16:59:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QbDBx5WZKz3dtM
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Jun 2023 00:59:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=N/F0UBoM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::729; helo=mail-qk1-x729.google.com; envelope-from=pinskia@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=N/F0UBoM;
	dkim-atps=neutral
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QbDB51Qpzz3c2j
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Jun 2023 00:58:20 +1000 (AEST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75ca95c4272so558475785a.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 06 Jun 2023 07:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686063496; x=1688655496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uZGd3CtyVRHniSRiKmrR9VngFl3/OkPZT5Aeljmfrbg=;
        b=N/F0UBoM9qWIuK7f0WIYxcvppNzs0Bsl/Uwe+w9zQfYvASOWisXfGSNPhE3W10kBGN
         Ir6+MwYFBSr4g+XoDhcwnzRq6taDPGCzhb1k7UveyVKAlEcsBKsrP0ppgUNUgF2Q/1g/
         4U/RzCLiB33GusPs223+n0HYCwPvOuZT9oaYHFdLJBnv+EkQEAWM3PQp2FwXNMOWH0sm
         j9f0sX9V9uyf7cFBP8itdZYe1bZy/vpVd6c0gNqDrePNaz4Eu3T0X6lWnpBoTiVfSlfO
         7sWrGl9NZbUPwVwVwyhxFriXH3gflnE+xLbsqyhYpD92KvKJW4ViPADMD0cqwFBcvr/h
         W5hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686063496; x=1688655496;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uZGd3CtyVRHniSRiKmrR9VngFl3/OkPZT5Aeljmfrbg=;
        b=N38Gbm8GldVH/d+569VcZ7vZogxFwXnIZ8GsCzJCXttlmSIajJzDn4wJj5+Duz5y3P
         DSxGHiKszEaWpDIOB/uHvK4ilvFSr9Yt9/nxPfq6pi0K0XwDui5y9GOFwADPj48pUPgH
         wr9BUNn1gGGH8uliTvyHpLBQhLJSbDypJdMqpT2hgbKXKg/qQIWfFa3pBm38scWS5qQW
         VwRgoNc51EkZ5nvUkp2VG4Tp/fY5Ui9mlM8Env/wOpvSrMKZWuMxhppk5shFN6sz/jFd
         CfhgkEYQmpUP7xd3b0X2y6wY1p9bBhcY1b9wDafPQIYHNZw4RApWqim8FNFNXNLfM5kP
         9j/Q==
X-Gm-Message-State: AC+VfDzX9Lk2MiVObqYwcnfbEZZ4dzqzk5Mwy2qnxoZlNQ5zen6kksNk
	JXIh4velYBlgHzKn13deURRqNqM9ZRDNsOQ7ANc=
X-Google-Smtp-Source: ACHHUZ5KXHC71e2qqBxlJfkddDxG1SLLg2jRxnm2hgEir990PF12el+u1G2qgn1fxyqFzSgaye3uiLVHkzDZZS+0JYM=
X-Received: by 2002:a05:620a:8b8b:b0:75b:23a1:8e76 with SMTP id
 qx11-20020a05620a8b8b00b0075b23a18e76mr1982369qkn.71.1686063496383; Tue, 06
 Jun 2023 07:58:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220524093828.505575-1-npiggin@gmail.com> <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
In-Reply-To: <CAGfacvTu_8tZnndLqbRJeU4UJrnq+tCchiZyFFqOE-hXM0=wCA@mail.gmail.com>
From: Andrew Pinski <pinskia@gmail.com>
Date: Tue, 6 Jun 2023 07:58:05 -0700
Message-ID: <CA+=Sn1=gt-nf4T3vfWDKQLRNKkuBXh98nLbTtiCGDSPhMxyRiQ@mail.gmail.com>
Subject: Re: Passing the complex args in the GPR's
To: Umesh Kalappa <umesh.kalappa0@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: gcc@gcc.gnu.org, libc-alpha@sourceware.org, Nicholas Piggin <npiggin@gmail.com>, Paul E Murphy <murphyp@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 6, 2023 at 7:50=E2=80=AFAM Umesh Kalappa via Libc-alpha
<libc-alpha@sourceware.org> wrote:
>
> Hi all ,
>
> For the test case https://godbolt.org/z/vjs1vfs5W ,we see the mismatch
> in the ABI b/w gcc and clang .
>
> Do we have any supporting documents that second the GCC behaviour over CL=
ANG ?
>
> EABI states like
>
> In the Power Architecture 64-Bit ELF V2 ABI Specification document
> (v1.1 from 16 July 2015)

You are looking at the wrong ABI document.
That is for the 64bit ABI.
The 32bit ABI document is located at:
http://refspecs.linux-foundation.org/elf/elfspec_ppc.pdf

Plus the 32bit ABI document does not document Complex argument passing
as it was written in 1995 and never updated.

https://www.nxp.com/docs/en/reference-manual/E500ABIUG.pdf does not
document it either.

Thanks,
Andrew Pinski

>
> Page 53:
>
> Map complex floating-point and complex integer types as if the
> argument was specified as separate real
> and imaginary parts.
>
> and in this case the double complexes are broken down with double real
> and double img and expected to pass in FPR not the GPR.
>
>
>
> Thank you
> ~Umesh
