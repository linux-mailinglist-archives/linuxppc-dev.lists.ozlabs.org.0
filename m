Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42F75858D9D
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 08:20:58 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MCGruIJh;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TcKw72yKjz3vZK
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Feb 2024 18:20:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=MCGruIJh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62f; helo=mail-pl1-x62f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TcKvK2PNXz3btl
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Feb 2024 18:20:11 +1100 (AEDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1dba94f9201so12305505ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Feb 2024 23:20:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708154403; x=1708759203; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfIxsLt7/ArIHKSH0XLbtdtiRdY5BKjg0yAd6fCtPMY=;
        b=MCGruIJhbFK8ZXsB6XdQbfzGEE9b3LIhACnUsE0cVhQZYncdT8gDgSWVrRrF2uyx9Y
         sMwYNZvoKsnz5Dg55kg/kJqqr96m3hYYGgVK44aq+nRmNBWDana+DtHmi8I64xrjzOGY
         sb/Z3wmHwfKiMCL7/zelA6dSJumDoXeslv3vj/39YIgbhsg/by2fdaSYLeHWmKNvXCAw
         46roedb9Md0hHx4iQlzwZA2q5sgL3n7TDPq6weMqp8schN8+DaVFFCTTYqrPAUR92sYV
         MR8Lj6vHgwXL+ilg7TeGDCWXhcaAVD+8EBBEZG7rgPwk4u2dwZOBh+u5csnZD8jWX/cg
         u7fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708154403; x=1708759203;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WfIxsLt7/ArIHKSH0XLbtdtiRdY5BKjg0yAd6fCtPMY=;
        b=SpUl2IDYPL1BVNzFtOnR9cavn+4uKpPvg3FDqBG8zvdSuk5/As8hP2DQGFsNEd9hro
         WAXI2cZgS1LjDrEflUhAIRZpXzH10mqe+CMmNaPaIoD6hLVIFnaZ0ANo6OqUh6KK7wuj
         3yfrnUbrkwTFQ2t+PdTAP65KxtkcEK1DRonAQozc1ulh4i2z1XyZO6NeITjfJ8ZNcLEg
         WiL3II8yyVH8+EocVmekPFDoVrvWKpUrSEglrHvuNBXQpaJqHAjZEK3TceJZSgX/7Bzh
         5mepR87akc9nqrdWn0ncvls0utY63ejFL1Yh72A4+s94UXbvELkyAVlQP3twa5vc1a4f
         DCKQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnOTd+3KhtcMW2hStffTrsvhCXDDC2lHR7xDKnuyt8wvTjWHWNhhlkvk4Yj2RrdBjzzOksEE5tdRLBJGie6cNZjUhmBU0SFfmL74388w==
X-Gm-Message-State: AOJu0YypGcQG6ERU9CKxrXOkuly+3ss0XEkowmVPKKP9pGumbFWhkB3Y
	KnQLBmkrTd6CXTkt3sMeMauNhYjHGygx36Hn67ql0DAk1mzGdx7o
X-Google-Smtp-Source: AGHT+IHeuo0k9fAN0txniwLyphYby2uu9UX6Hw/WFiRGnP8mxfVbUdCFutgfkGyqtdVbG1X9PA0DNg==
X-Received: by 2002:a17:902:dad1:b0:1db:4df0:a31f with SMTP id q17-20020a170902dad100b001db4df0a31fmr8038401plx.6.1708154403370;
        Fri, 16 Feb 2024 23:20:03 -0800 (PST)
Received: from localhost (123-243-155-241.static.tpgi.com.au. [123.243.155.241])
        by smtp.gmail.com with ESMTPSA id w3-20020a170903310300b001db4f25b168sm868865plc.255.2024.02.16.23.19.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Feb 2024 23:20:02 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Feb 2024 17:19:54 +1000
Message-Id: <CZ7673PUQ853.DB10GSBEZ65Z@wheely>
Subject: Re: [kvm-unit-tests PATCH v4 8/8] migration: add a migration
 selftest
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240209091134.600228-1-npiggin@gmail.com>
 <20240209091134.600228-9-npiggin@gmail.com>
 <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
In-Reply-To: <abbcbb47-1ae7-4793-a918-dede8dcaf07f@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvm-riscv@lists.infradead.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Feb 16, 2024 at 9:15 PM AEST, Thomas Huth wrote:
> On 09/02/2024 10.11, Nicholas Piggin wrote:
> > Add a selftest for migration support in  guest library and test harness
> > code. It performs migrations in a tight loop to irritate races and bugs
> > in the test harness code.
> >=20
> > Include the test in arm, s390, powerpc.
> >=20
> > Acked-by: Claudio Imbrenda <imbrenda@linux.ibm.com> (s390x)
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   arm/Makefile.common          |  1 +
> >   arm/selftest-migration.c     |  1 +
> >   arm/unittests.cfg            |  6 ++++++
>
>   Hi Nicholas,
>
> I just gave the patches a try, but the arm test seems to fail for me: Onl=
y=20
> the first getchar() seems to wait for a character, all the subsequent one=
s=20
> don't wait anymore and just continue immediately ... is this working for=
=20
> you? Or do I need another patch on top?

Hey sorry missed this comment....

It does seem to work for me, I've mostly tested pseries but I did test
others too (that's how I saw the arm getchar limit).

How are you observing it not waiting for migration? I put some sleeps in
the migration script before echo'ing to the console input and it seems
to be doing the right thing. Admittedly the test contains no way to
programaticaly verify the machine was migrated the expected number of
times, it would be nice to try to match that up somehow.

Thanks,
Nick
