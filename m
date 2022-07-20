Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A750557B3CD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 11:29:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lnr4P4Bfpz3cjK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Jul 2022 19:29:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mohAGQxW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102e; helo=mail-pj1-x102e.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=mohAGQxW;
	dkim-atps=neutral
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lnr3l4GHnz2xkX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 19:28:34 +1000 (AEST)
Received: by mail-pj1-x102e.google.com with SMTP id x24-20020a17090ab01800b001f21556cf48so1476857pjq.4
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Jul 2022 02:28:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:subject:to:cc:references:in-reply-to:mime-version
         :message-id:content-transfer-encoding;
        bh=rb9P/bz3magoPBz9rSV9YQ0nw+tPZ+BpcmY2cUSPaWs=;
        b=mohAGQxW89e/Qfqm9PpQ1gi6GShET7vt65lDuLjgx6lHD85o3mH5mHR27D9GmU4X5g
         0aNPsfjBMl+FSSrmkfSqoldLtoqYEFIkKynyDZR/8ls++dIZQcVmLbjgyZJvaIlHP2U5
         QMj6nQWZbfIErF9jmb/My0N3w1Uw/Z+xwd3nyogBPbHv4xMKuFwzoQH93NKboh46Wad7
         UkeqvC4uorHA1HHuSyOmqDvFOdrnNlTt8RM3kNmQTCXEgfBHujyQ9LmuMKbiegMq4Ht+
         akcb09HTy2OTsG02U4Gr4FL9KcmkmQVIbB9i92pJdkKTwQff1sQeKsJJpOCZCDUXmOQP
         /FDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
         :mime-version:message-id:content-transfer-encoding;
        bh=rb9P/bz3magoPBz9rSV9YQ0nw+tPZ+BpcmY2cUSPaWs=;
        b=hXXBaCHE/ufDKyHLe3on8fOD1eJRJcoF2xdgCmxU0frJaSxyxlUYBv1YwyWOB4ftNP
         8a93Fpc+HEALz3pb4qM294OtL9AS8JGfYYoPa0esyK8U8OpDZ2uyktLFBu4tPfY9ZyxK
         JxLfNBGeOfiJv9MCuAOz5b/Az6pIkSXxkaDVQgC8yDYbP93fEkKi5SHDCbkKbhn9rfol
         MHbct9ixeONJHXqyluzbsHT0dyWn1DHmm7x1qCNc7amYztSRF34oIM3u2LOBc9z92I3M
         I/jXlekWSuV5ycVbdfOu0GIg6jSz/9ZA4mkzl3SVMeiPRymaBu7hIyUnjjyH/oTF6+g2
         wFdg==
X-Gm-Message-State: AJIora8Qd2BMkhmLSzSjxBVAxDPd9sp5Nqwz7r8GAisBUDku2qJWOJAn
	9lpa9p/APcG54tPMGqm+lJ8=
X-Google-Smtp-Source: AGRyM1so+H7RaaVYtfVQHQZKH5ID2oM1J0FRQGgfQutBk9v3MO/kJSnvyPn/w0D27FyvWtNljGKs5g==
X-Received: by 2002:a17:902:b488:b0:16a:7013:69f0 with SMTP id y8-20020a170902b48800b0016a701369f0mr38109772plr.118.1658309309808;
        Wed, 20 Jul 2022 02:28:29 -0700 (PDT)
Received: from localhost (27-33-251-27.static.tpgi.com.au. [27.33.251.27])
        by smtp.gmail.com with ESMTPSA id z16-20020aa79490000000b0052512fdaa43sm13045456pfk.163.2022.07.20.02.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 02:28:29 -0700 (PDT)
Date: Wed, 20 Jul 2022 19:28:23 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v2] powerpc: add documentation for HWCAPs
To: Segher Boessenkool <segher@kernel.crashing.org>,
	Tulio Magno Quites Machado Filho <tuliom@ascii.art.br>
References: <20220715012636.165948-1-npiggin@gmail.com>
	<877d4euskv.fsf@linux.ibm.com> <20220715195951.GA25951@gate.crashing.org>
	<874jziuo49.fsf@linux.ibm.com>
In-Reply-To: <874jziuo49.fsf@linux.ibm.com>
MIME-Version: 1.0
Message-Id: <1658309165.qvjv58f7ui.astroid@bobo.none>
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
Cc: Florian Weimer <fweimer@redhat.com>, gcc@gcc.gnu.org, libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org, Paul E Murphy <murphyp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Tulio Magno Quites Machado Filho's message of July 16, 2022 6=
:17 am:
> Segher Boessenkool <segher@kernel.crashing.org> writes:
>=20
>> That is a usability problem.  Can it be fixed, or will that create its
>> own compatibility problems?  In practice I mean.  If it is, the C
>> libraries could fix it up, for new programs, and then after a while the
>> kernel can do the sane thing?
>>
>> How big is the problem, anyway?  Is it only 2.05, or also 2.04, 2.03?
>=20
> PPC_FEATURE_ARCH_2_05 is the first bit referring to an ISA level.
> Before that, AT_HWCAP used to have bits for specific processors, e.g.
> PPC_FEATURE_CELL and PPC_FEATURE_POWER4.
>=20
> Notice that glibc creates its own hwcap-based information that is used by
> __builtin_cpu_supports().  In this case bits PPC_FEATURE_ARCH_2_05,
> PPC_FEATURE_POWER5_PLUS, PPC_FEATURE_POWER5 and PPC_FEATURE_POWER4 are en=
abled
> whenever if the processor is compatible with the features provided by any=
 of
> the previous processors [1].
> AT_HWCAP and AT_HWCAP2 are kept intact, though.
>=20
> [1] https://sourceware.org/git/?p=3Dglibc.git;a=3Dblob;f=3Dsysdeps/powerp=
c/hwcapinfo.c;h=3Dafde05f86382413ce1f0c38e33c9bdd38d6b7e9d;hb=3DHEAD#l45

Hmm, this doesn't seem very nice. That said, before possibly changing=20
that in the kernel, documenting existing unexpected behaviour is=20
probably a good idea. Good catch, I obviously wasn't careful enough
reviewing these bits.

I'll send out a final patch with this adjustment in a week or so in
case any more comments come in the meantime.

Thanks,
Nick
