Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8701C6CA2FE
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 14:00:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlWc82RJ6z3cjN
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 23:00:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kQLEJlTw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=kQLEJlTw;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlWbC4lqwz3bhJ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 23:00:06 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id o6-20020a17090a9f8600b0023f32869993so11574595pjp.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 27 Mar 2023 05:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679918404;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2m/VPMZ9VUPe2DDK1+4k3UgKO74YBFNpfH20hjp6/9g=;
        b=kQLEJlTwUgj0W7F6oAbJoD+jugOc+3XWCTCPdZzUTUhUO6fOQB9y0bPtpaIKGl+r3z
         7Vpj+EnO3pjmerPeXJNSH+kqoMND18vStnO3ScBiC3GpQ1GUu1yPjWxkjXEfjBJvH86m
         9QsfVNRFMi1c3sJBVsFVbhhQHlFr4qtlZzsM7jZJdMA/fCUKd/QghNkryvmTy6FHwtsC
         djjhmjW0M4t2VNUrsCyHhAJTUP5Scgwzv4LJC37de+0nA81aTsh6CPN1GENiArTozLwv
         aixJT6EuzurjhZPdzSUg+z30VPbBx65/o5hiGADvNipx+1AIuuEToPYSqfbchP9uY8Xw
         GjFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679918404;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2m/VPMZ9VUPe2DDK1+4k3UgKO74YBFNpfH20hjp6/9g=;
        b=fBZ8PQC0MQbsj9PYQjMhUdqk/WBq2FS0tq6/+K9vaAbCw4aZ4/AOGtBqHIMCEphs+r
         qJ1jAAn1pRMfRIWpa7BoQjICfLeyxAvHCzKkz79cDUKvUbj6MTUnXvtNcvB/i5FivOVS
         FvpDFuDfD4ymoLyKAEZWhtUaML/Lr4ZBT3NC3a79u1YFWFROSki10dWNZ96Cl8MTctMr
         cZ806d/O3s0V4Z/T3uQhfUJPLDetJSXu6ZEQAmUMxqEmc98AMI4Nw2BBjGqY66mfCvGE
         ndDW2yRdeTrJNoRvuCj0HdbFdHDOueyBj7GURd5CVia0ptnIYoNvtncso1SLXWPNEYZ0
         EN4Q==
X-Gm-Message-State: AAQBX9d5oSG6RMWtUhVd6xHYmSc9TUYy76t9gLmNMkceP+fbqQZCeD55
	Jc9fco4pVzPuVYtOSEPCQOo=
X-Google-Smtp-Source: AKy350ZjljCoQLxO01Xg7ySmstFnt3j9gOxc7uScBfPzNsQ4S9SIY7prAnI9U+kM2Qz6tGqn229I1A==
X-Received: by 2002:a17:90b:4b0a:b0:23f:7625:49b6 with SMTP id lx10-20020a17090b4b0a00b0023f762549b6mr13059754pjb.37.1679918404438;
        Mon, 27 Mar 2023 05:00:04 -0700 (PDT)
Received: from localhost ([203.221.180.225])
        by smtp.gmail.com with ESMTPSA id jm2-20020a17090304c200b001a04d27ee92sm13968626plb.241.2023.03.27.05.00.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Mar 2023 05:00:03 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Mar 2023 21:59:59 +1000
Message-Id: <CRH5DEP0G8PU.3VNYL9SG2G0TF@bobo>
Subject: Re: [kvm-unit-tests v2 06/10] powerpc/sprs: Specify SPRs with data
 rather than code
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.13.0
References: <20230320070339.915172-1-npiggin@gmail.com>
 <20230320070339.915172-7-npiggin@gmail.com>
 <f03084cc-8ac6-b2cb-b2e8-39bc73843ab7@redhat.com>
In-Reply-To: <f03084cc-8ac6-b2cb-b2e8-39bc73843ab7@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Mar 23, 2023 at 10:36 PM AEST, Thomas Huth wrote:
> On 20/03/2023 08.03, Nicholas Piggin wrote:
> > +/* SPRs common denominator back to PowerPC Operating Environment Archi=
tecture */
> > +static const struct spr sprs_common[1024] =3D {
> > +  [1] =3D {"XER",		64,	RW,		SPR_HARNESS, }, /* Compiler */
> > +  [8] =3D {"LR", 		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr *=
/
> > +  [9] =3D {"CTR",		64,	RW,		SPR_HARNESS, }, /* Compiler, mfspr/mtspr *=
/
> > + [18] =3D {"DSISR",	32,	OS_RW,		SPR_INT, },
> > + [19] =3D {"DAR",		64,	OS_RW,		SPR_INT, },
> > + [26] =3D {"SRR0",	64,	OS_RW,		SPR_INT, },
> > + [27] =3D {"SRR1",	64,	OS_RW,		SPR_INT, },
> > +[268] =3D {"TB",		64,	RO	,	SPR_ASYNC, },
> > +[269] =3D {"TBU",		32,	RO,		SPR_ASYNC, },
> > +[272] =3D {"SPRG0",	64,	OS_RW,		SPR_HARNESS, }, /* Int stack */
> > +[273] =3D {"SPRG1",	64,	OS_RW,		SPR_HARNESS, }, /* Scratch */
> > +[274] =3D {"SPRG2",	64,	OS_RW, },
> > +[275] =3D {"SPRG3",	64,	OS_RW, },
> > +[287] =3D {"PVR",		32,	OS_RO, },
> > +};
>
> Using a size of 1024 for each of these arrays looks weird. Why don't you =
add=20
> a "nr" field to struct spr and specify the register number via that field=
=20
> instead of using the index into the array as register number?

Oh I meant to reply to this. I did try it that way at first. When it
came manipulating the arrays like merging them or adding and
subtracing some SPRs, it required a bit of code to search, sort, add,
remove, etc. This way takes almost nothing. It is a dumb data structure
but it works okay here.

Thanks,
Nick
