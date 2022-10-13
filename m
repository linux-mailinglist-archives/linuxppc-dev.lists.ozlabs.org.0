Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7375FD42C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 07:18:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnyVC2sTLz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Oct 2022 16:18:43 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ap67t8eB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102d; helo=mail-pj1-x102d.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=Ap67t8eB;
	dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnyTF3jFNz2yP8
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Oct 2022 16:17:53 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id x31-20020a17090a38a200b0020d2afec803so986136pjb.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 22:17:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgmqesKftHWSE00KVINL+qar8kr975tlk3Np4LjyX8Q=;
        b=Ap67t8eBPka2yMd7er9LDEs53x9v8JVEDtBdMR14a5SlrrytCuZCiyXjVhUVmZeCOE
         Y+P8ejPt2qamBIN0SlFvfbWOfI1+7X/fsyDYM++cnobTCDK3e5M142w4mRYlA8lCSSd1
         NxAAsJbOaZ+NHaii/y2O2oK7LdXxvmrjDHGwVROe+OklbH7ywWZyDesmK8fsFT2ZJeN2
         rUdJwKU4hY32fcKMCix/GVwYKw6z6Ge30bLaKQkYjUc/aTKiCN2b9ZtFbtzONnx8TMmj
         jGppR2hoMipONWwNwyacr2pI07px6dIozZPD+zawdGUpwc9raHrn4jVntGsgkhllI6wp
         7jMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mgmqesKftHWSE00KVINL+qar8kr975tlk3Np4LjyX8Q=;
        b=vWl0d2sEA0SAIpahuBS5jNrcINPOKok8/64JocD0GoTKpK8sIqgLGTC1+xk+bwmFbo
         25jWzSWOnE/XzN7cH5D6Dna6z9wQBlQb9wMx+mFcH/2XZdpQk7cp6i7dNQzSXjg5rKXF
         K0syDYrgmZPfvRePTTN4GAUhx8doKLHwyCURCYJEEqKMOfgX6+NbOrgkxAy9OgvSrEPe
         2R4t84DCQ8LCmB2sezRFzkVf/+kznw23oDiBUi9K38ozm3nb1bUxGwB6r9W5V5y8VIOb
         /oG3AZxqM70e6DKLZihCaGQGgHgGT+T7+eZP/Jv/ePY2iBaVh0bY+8tIazW2HAcvzhO1
         vvyA==
X-Gm-Message-State: ACrzQf2SXJ8rZwKb8hQpGuumKGtjWi74zs6u5ArasLBTZnGLEQroizHA
	KP5NFY2DcRLOYYEraM5OHqE=
X-Google-Smtp-Source: AMsMyM7jUL85MKl03w4acrGr8UP5tMKsHerd1QVIEu6aZ/7f6V3fHuV49DgjCHZWgFyNZtXTFja00w==
X-Received: by 2002:a17:902:e552:b0:179:e795:71c5 with SMTP id n18-20020a170902e55200b00179e79571c5mr32627906plf.57.1665638271270;
        Wed, 12 Oct 2022 22:17:51 -0700 (PDT)
Received: from localhost ([202.173.165.98])
        by smtp.gmail.com with ESMTPSA id e17-20020a17090301d100b00172e19c2fa9sm11720893plh.9.2022.10.12.22.17.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Oct 2022 22:17:50 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 13 Oct 2022 15:17:37 +1000
Message-Id: <CNKJHFYTRLX9.1OXK4PSAZ6J28@bobo>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>, "Guenter Roeck"
 <linux@roeck-us.net>
Subject: Re: [GIT PULL] Please pull powerpc/linux.git powerpc-6.1-1 tag
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.11.0
References: <87edvhntv0.fsf@mpe.ellerman.id.au>
 <20221012141827.GA2405914@roeck-us.net> <Y0biBtCUtc2mowbQ@zx2c4.com>
 <20221012164452.GA2990467@roeck-us.net> <Y0b3ZsTRHWG6jGK8@zx2c4.com>
 <20221012174826.GB2995920@roeck-us.net> <Y0cJfoPLGeuzm/gQ@zx2c4.com>
In-Reply-To: <Y0cJfoPLGeuzm/gQ@zx2c4.com>
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
Cc: david@redhat.com, linux-kernel@vger.kernel.org, wsa+renesas@sang-engineering.com, nicholas@linux.ibm.com, windhl@126.com, cuigaosheng1@huawei.com, mikey@neuling.org, paul@paul-moore.com, haren@linux.ibm.com, joel@jms.id.au, lukas.bulwahn@gmail.com, nathanl@linux.ibm.com, ajd@linux.ibm.com, ye.xingchen@zte.com.cn, nathan@kernel.org, rmclure@linux.ibm.com, hbathini@linux.ibm.com, atrajeev@linux.vnet.ibm.com, yuanjilin@cdjrlc.com, pali@kernel.org, farosas@linux.ibm.com, geoff@infradead.org, Linus Torvalds <torvalds@linux-foundation.org>, gustavoars@kernel.org, lihuafei1@huawei.com, aneesh.kumar@linux.ibm.com, zhengyongjun3@huawei.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu Oct 13, 2022 at 4:37 AM AEST, Jason A. Donenfeld wrote:
> On Wed, Oct 12, 2022 at 10:48:26AM -0700, Guenter Roeck wrote:
> > > I've also managed to not hit this bug a few times. When it triggers,
> > > after "kprobes: kprobe jump-optimization is enabled. All kprobes are
> > > optimized if possible.", there's a long hang - tens seconds before it
> > > continues. When it doesn't trigger, there's no hang at that point in =
the
> > > boot process.
> > >=20
> >=20
> > That probably explains why my attempts to bisect the problem were
> > unsuccessful.
>
> So I just did this:
>
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index 2fe28eeb2f38..2d70bc09db7e 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -1212,6 +1212,7 @@ static void __cold try_to_generate_entropy(void)
>         struct entropy_timer_state stack;
>         unsigned int i, num_different =3D 0;
>         unsigned long last =3D random_get_entropy();
> +       return;
>
>         for (i =3D 0; i < NUM_TRIAL_SAMPLES - 1; ++i) {
>                 stack.entropy =3D random_get_entropy();
>
> And then ran it, and now we get the lockup from the idle process:

Yep that rules out the random code. And really if it was calling
schedule() it shouldn't be getting a softlockup anyway.

Thanks,
Nick
