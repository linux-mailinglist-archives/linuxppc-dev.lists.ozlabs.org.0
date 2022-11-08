Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A359620CE9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 11:10:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N63l368ztz3cLJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Nov 2022 21:10:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EUZyFouv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::52a; helo=mail-pg1-x52a.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=EUZyFouv;
	dkim-atps=neutral
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N63k94rwfz2xYy
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Nov 2022 21:09:52 +1100 (AEDT)
Received: by mail-pg1-x52a.google.com with SMTP id 130so601670pgc.5
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Nov 2022 02:09:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wvphYTFCgOsgZAlbKOONe9/A9pZLaBvVSjy3jvONxbQ=;
        b=EUZyFouvmlVtjbDs95zXRD5ThP2SQwa9jbnRhF4xiFDjPSzDAYpAzc0WTGbB6vmVnV
         tNfuvYbA9/WL2TRfuQCu7Au9w7FSy1PI2lEyxEgj4NgSGxG3hKNukTVSMUUNI8WagxDI
         vLW3i1ZwGLMNHGcSvsn9vBMUPm64UKQBU6hFNSvMvuNqvTTSX7JlSZYlnBKqFgg2nlie
         NYgwQAnmWR7MM8hnS+LuvaqSqDfagwz7PaGyzYiKhTFxT2aCp96zPjo6/EsiptRtBHe+
         1KhKcQWf2CzxX6f8oa+bv30ZG5x5FXV8EsIGV3ylnWqwfEB0TJmsyU3NU8Tm0HL6dYNT
         htKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wvphYTFCgOsgZAlbKOONe9/A9pZLaBvVSjy3jvONxbQ=;
        b=NBmuJ1QxqvsbCDf9mod2yPlb6mSkfJEun/FkIKlWzTPXhWG4sOaIf0empDGLpylqNr
         KpCxRj5/2UQeRMC8wzUygENosHJCOJ+mQi7p5pzuF0ytF2lYAL+KiR+LNXBcKeYjn+xZ
         EcePs0kjLZtFXal+ZK0UQv43IzCsUR/hm1+ybklkTCctzhhbq0lZsPRVyhJs4V8Cb+nB
         iXWg9gJm+WBn1aIh/rDbsEsqjoSXU4rHWAkyGg64pBiOIbGlFYNlf9TJukfSlNBja2iX
         Dk1Mqq/vI7tQlrr8ELJ7FtwIFPMTrSSSUqgTLpXgaoIrpd5fdFmnh2N0Ke3OI0xsHSLe
         Otxw==
X-Gm-Message-State: ACrzQf3CqyCDsddJMyarb70d0FuTgv/OrqhCm7/ltwtqUR+v2aDjqwU1
	iNcNXzkMH6zV6evdu5TdWJFT8+QZIGM=
X-Google-Smtp-Source: AMsMyM7oCY4Zh6DMPpNUjms+XdXHdxTtuxFV2rLeS/KCWHhZDsji/ccY2Lsf53R9FiC2qvIClX4/jw==
X-Received: by 2002:aa7:8c59:0:b0:56e:aa67:4fc1 with SMTP id e25-20020aa78c59000000b0056eaa674fc1mr20405733pfd.56.1667902189798;
        Tue, 08 Nov 2022 02:09:49 -0800 (PST)
Received: from localhost (203-221-202-134.tpgi.com.au. [203.221.202.134])
        by smtp.gmail.com with ESMTPSA id c27-20020aa7953b000000b0056c04dee930sm6022098pfp.120.2022.11.08.02.09.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Nov 2022 02:09:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 08 Nov 2022 20:09:44 +1000
Message-Id: <CO6TZ9SSOWP7.1PSIBLSSBCAY3@bobo>
Subject: Re: [PATCH v2 1/4] powerpc/64: Add INTERRUPT_SANITIZE_REGISTERS
 Kconfig
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Segher Boessenkool" <segher@kernel.crashing.org>, "Rohan McLure"
 <rmclure@linux.ibm.com>
X-Mailer: aerc 0.11.0
References: <20221107033202.1375238-1-rmclure@linux.ibm.com>
 <20221107163923.GO25951@gate.crashing.org>
In-Reply-To: <20221107163923.GO25951@gate.crashing.org>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Nov 8, 2022 at 2:39 AM AEST, Segher Boessenkool wrote:
> Hi!
>
> On Mon, Nov 07, 2022 at 02:31:59PM +1100, Rohan McLure wrote:
> > Add Kconfig option for enabling clearing of registers on arrival in an
> > interrupt handler. This reduces the speculation influence of registers
> > on kernel internals.
>
> Assuming you are talking about existing PowerPC CPUs from the last 30
> years:
>
> There is no data speculation.  At all.  Ever.
>
> There is branch prediction, but that is not influenced by register
> contents, either (for any current CPUs at least).  (Except when you get
> a flush because of a mispredict, but if this zeroing changes anything,
> we will have used wild (but user controlled) values in the old
> non-zeroing situation, and that is a much bigger problem itself already,
> also for security!  This can be an unlikely kernel bug, or a very
> unlikely compiler bug.)

This is not about data speculation, it is about speculative execution
in kernel mode that uses architected value that were set by user, and
that value being used to influence a speculative gadget that can expose
data to user via a side channel.

> All GPRs are renamed, always.  If you zero all GPRs on interrupt entry
> (which is context synchronising, importantly), this will guarantee there
> can be no timing influence from the GPRs, because all of the physical
> registers depend on nothing that happened before. So that is good, at
> least it can give some peace of mind.  Except that this makes 30 new
> registers in just a few cycles, which *itself* can cause stalls, if the
> renaming things are still busy.

It will have some pipeline effect like any instruction I suppose. At
least in latest processors, zeroing idiom should release registers
AFAIK.

> Context synchronising does not
> necessarily help there, the renaming machinery can do stuff *after* an
> insn completes.

Possibly context synchronization does not push everything prior to
completion, certainly it does not drain prior stores from store queues
even if they had previously completed, so there can be things going on
there. Software does not really have the ability to do anything about
that though, so that's more of a hardware problem if that exposes a
security issue IMO. Or at least a separate issue if there is some
architecture that could deal with it.

Thanks,
Nick
