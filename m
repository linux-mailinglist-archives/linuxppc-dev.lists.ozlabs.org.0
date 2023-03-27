Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CA80B6C9AE4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 07:37:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlM6F55Zcz3fBf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 16:37:57 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kqNkyOSY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1031; helo=mail-pj1-x1031.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kqNkyOSY;
	dkim-atps=neutral
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlM5L2S21z3c3w
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 16:37:09 +1100 (AEDT)
Received: by mail-pj1-x1031.google.com with SMTP id q102so6593403pjq.3
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 26 Mar 2023 22:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679895426;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=17Q/a21Os9cWbwFfTki+6MWnuazyiTsoGrnUzugftcM=;
        b=kqNkyOSYtZsQHUhi1pt/Z4KNbxb3vB9SHFzZfpp5ePq/Ub35SEI8QIxzHLyeT8482v
         oQLYlEf73bHN6MKar+RzYF19mokBCVxIKD4SEfiSB/IqTZKbXv2HCMnk4KZ0D5G20fce
         1U/66F+kRH/eQJxEtVtGUcXL7rO6HIJv5jRP4PMn0oBN+OtJAe9hytHoCX2vrZvFJdz9
         /lC/PX1bit6UQRoFHXdSe3dcG++UyDupmzRPViHbSeEbPp35uDAR9FKp62IwaSf0r+rF
         OCKnTTD7DY4LiqjqHJIREyXUYkmKNApNXUSNN5A4hasNaCUd+QL1jxyNU7Nyb/eSKMHD
         4SsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679895426;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=17Q/a21Os9cWbwFfTki+6MWnuazyiTsoGrnUzugftcM=;
        b=IB6GtXLX17YniKyMBreu8crCXJOsERgNuuerQkUnEdXvHRLHi0eZnUkRzSyEROAwcI
         aqBdqrUN+fIiG9Bk/O0iPNJ0L/pd3d+0jmdlTZbSDCH8zu9C79PZ385HXpW7X6j7bUbW
         tVyqEL122zNDIa3IlksMdRXpebRQwGwD83XAhZS08+bbw9fNpst4PvOEq6eEAjGdClWc
         otwaQGHvRY2W+7Wx+izgysZURvgRr8NRGhI7QfQHIX2yvhDskXCFzUsByBrk+e2kBInZ
         ZxZRarGiM5PS18/AwlkiLEdk6o8dUmip98Nvdtjkqsry8ws8suCKliFANo59I577/XlY
         QB0Q==
X-Gm-Message-State: AAQBX9cRcaMITSFjfGZIEVq7Zqd/ba83DxDtyEDM45ULme77VNGUd50M
	KJg6lWjsV5yVR4bOZW0YdhE=
X-Google-Smtp-Source: AKy350Z6qEGELiKG+AyJP6kIcW+nh20RYN/4nrLns4ecVRm0Rw4pe5XPau2d4P+tCuf3230odCSb9w==
X-Received: by 2002:a17:902:f389:b0:19d:7a4:4063 with SMTP id f9-20020a170902f38900b0019d07a44063mr8547082ple.46.1679895426138;
        Sun, 26 Mar 2023 22:37:06 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id jf20-20020a170903269400b0019f1264c7d7sm18220275plb.103.2023.03.26.22.37.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Mar 2023 22:37:05 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 15:37:00 +1000
Message-Id: <CRGX867PJCBF.1MV46YLYXMBYZ@bobo>
Subject: Re: [PATCH 0/2] KVM: PPC: support kvm selftests
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Sean Christopherson" <seanjc@google.com>, "Michael Ellerman"
 <mpe@ellerman.id.au>
X-Mailer: aerc 0.13.0
References: <20230316031732.3591455-1-npiggin@gmail.com>
 <87ilf0nc95.fsf@mpe.ellerman.id.au> <ZBs9tGkI5OQqtIqs@google.com>
In-Reply-To: <ZBs9tGkI5OQqtIqs@google.com>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, linux-kselftest@vger.kernel.org, Shuah Khan <shuah@kernel.org>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Mar 23, 2023 at 3:41 AM AEST, Sean Christopherson wrote:
> On Thu, Mar 16, 2023, Michael Ellerman wrote:
> > Nicholas Piggin <npiggin@gmail.com> writes:
> > > Hi,
> > >
> > > This series adds initial KVM selftests support for powerpc
> > > (64-bit, BookS).
> >=20
> > Awesome.
> > =20
> > > It spans 3 maintainers but it does not really
> > > affect arch/powerpc, and it is well contained in selftests
> > > code, just touches some makefiles and a tiny bit headers so
> > > conflicts should be unlikely and trivial.
> > >
> > > I guess Paolo is the best point to merge these, if no comments
> > > or objections?
> >=20
> > Yeah. If it helps:
> >=20
> > Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
>
> What is the long term plan for KVM PPC maintenance?  I was under the impr=
ession
> that KVM PPC was trending toward "bug fixes only", but the addition of se=
lftests
> support suggests otherwise.

We plan to continue maintaining it. New support and features has been a
bit low in the past couple of years, hopefully that will pick up a bit
though.

> I ask primarily because routing KVM PPC patches through the PPC tree is g=
oing to
> be problematic if KVM PPC sees signficiant development.  The current situ=
ation is
> ok because the volume of patches is low and KVM PPC isn't trying to drive=
 anything
> substantial into common KVM code, but if that changes...=20

Michael has done KVM topic branches to pull from a few times when such
conflicts came up (at smaller scale). If we end up with larger changes
or regular conflicts we might start up a kvm-ppc tree again I guess.

> My other concern is that for selftests specifically, us KVM folks are tak=
ing on
> more maintenance burden by supporting PPC.  AFAIK, none of the people tha=
t focus
> on KVM selftests in any meaningful capacity have access to PPC hardware, =
let alone
> know enough about the architecture to make intelligent code changes.
>
> Don't get me wrong, I'm very much in favor of more testing, I just don't =
want KVM
> to get left holding the bag.

Understood. I'll be happy to maintain powerpc part of kvm selftests and
do any fixes that are needed for core code changes.If support fell away
you could leave it broken (or rm -rf it if you prefer) -- I wouldn't ask
anybody to work on archs they don't know or aren't paid to.

Not sure if anything more can be done to help your process or ease your
mind. It (KVM and kvm-selftests) can run in QEMU at least.

Thanks,
Nick
