Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9D919F3B8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 12:42:18 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48wnD65M0wzDqCG
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Apr 2020 20:42:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::d42;
 helo=mail-io1-xd42.google.com; envelope-from=hqjagain@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=hoYqHkBl; dkim-atps=neutral
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com
 [IPv6:2607:f8b0:4864:20::d42])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48wnBK3n3VzDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Apr 2020 20:40:41 +1000 (AEST)
Received: by mail-io1-xd42.google.com with SMTP id e79so5383913iof.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 Apr 2020 03:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+wHLle163nkPCKxLaEKL4MOVhBjBpBTiH90GC4QUefI=;
 b=hoYqHkBlAP3yzC6Ax41RDOjWG6bKsaXL4GZTad8hAvcE4NPCiWL49B6lzU4RIygC3c
 hO4AqNj/LR0OqrLfNL1lDb8ANa31FsuCaBSrfSxkxDV4cXX9DHTvOTAqqgVD7e7g7W6r
 MR9LS0yjNYjXCM3oHHLYK7OYdIHt6Be6gTjJUI6GzpTLalpnV2Vfhhujc3aFI0k6ql/N
 D0CtjAPulIY11QdXBktliVIrbQ7oaBT5YJ4gl7DjmsQ49PBZp8Uas6U7spvC5sobzN+n
 b2Mq4OUTj2RZ6yLKqVMCiuXnp1qPvP2wp2LdpiQ1EEmTBlfzwkLkdn577I7UAvB0Bw25
 g0yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+wHLle163nkPCKxLaEKL4MOVhBjBpBTiH90GC4QUefI=;
 b=A8DBkyxR9kiNX7o996NHaVjgFRKXO37tmL5JyFaqTbzr71BNdg0DQsd3UNQlVwXkSt
 GicU6strw+mrTCAppBU9ZnngoZpNaZiDNwMLIm9t7cAI4LQppnFsAgSiYuV6zlT/yblm
 K9ZwejQuq4nyH9ZbBaiPCEuWewfOxDuhLIQjekvcRw5cX45AmEj5+8f4eK0r0CLtT8zo
 e6awi/dFACa+MQ3LJuD2+6zwQGVEBhPv0+s6TOQudj7w8DuOxbjpCnCC+iY7vlnCS/wA
 GqdM7LEoWDTYwwQ6j7RyLbXolwGMscT5RCRtmBi2unk9uhUbSjvbjAe1APyTkHvxJeLC
 3dRg==
X-Gm-Message-State: AGi0PuaCKb9LqaObZkj48hp58Uy08yVeHFx4PvqrRvlKKrNQKD9OMEtn
 2V4ViLQUw6fFuMGjQ8YaT9SI2suhjDa+hnrg872f/1aJUWY=
X-Google-Smtp-Source: APiQypK+D0ZxNWKyr83bCZwm/3YZVNeBMXaEj+jDxkqWJWTDse5JQhfSnegHQy/MNeoNr/GFyb1ec4efKkthPaHSlho=
X-Received: by 2002:a02:a49a:: with SMTP id d26mr19822230jam.117.1586169639420; 
 Mon, 06 Apr 2020 03:40:39 -0700 (PDT)
MIME-Version: 1.0
References: <d4a96597-6704-3030-b936-6282f0994f09@web.de>
 <CAJRQjofnnhzOp4yis=sL85ESDvNApXHL3dpv6T1NJL-Wh0OOfA@mail.gmail.com>
 <CAOSf1CGLZ5H1cUsv6atZ7hNpQ+PDyyAjp6dzJjXMwC5XoUOVQQ@mail.gmail.com>
 <d8334f5d-403f-941f-abcc-2714d297082b@web.de>
In-Reply-To: <d8334f5d-403f-941f-abcc-2714d297082b@web.de>
From: Qiujun Huang <hqjagain@gmail.com>
Date: Mon, 6 Apr 2020 18:40:25 +0800
Message-ID: <CAJRQjocCfuT4k3fvMvzQ4Yf9RUaybggNGqwYdR9He+XEctcj6g@mail.gmail.com>
Subject: Re: [PATCH v3] powerpc/powernv: add NULL check after kzalloc in
 opal_add_one_export
To: Markus Elfring <Markus.Elfring@web.de>
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
Cc: LKML <linux-kernel@vger.kernel.org>, Oliver O'Halloran <oohall@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Apr 6, 2020 at 6:02 PM Markus Elfring <Markus.Elfring@web.de> wrote=
:
>
> >>>> Here needs a NULL check.
> >> quite obvious?
>
> I suggest to consider another fine-tuning for the wording also around
> such =E2=80=9Cobvious=E2=80=9D programming items.
>
>
> >>> I find this change description questionable
> >>> (despite of a reasonable patch subject).
>
> I got further development concerns.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=3Da10c9c710f9ecea87b9f4bbb83=
7467893b4bef01#n129
>
> * Were changes mixed for different issues according to the diff code?
>
> * I find it safer here to split specific changes into separate update ste=
ps
>   for a small patch series.
>
> * Will the addition of the desired null pointer check qualify for
>   the specification of the tag =E2=80=9CFixes=E2=80=9D?
>
>
> >>> Will a patch change log be helpful here?
> >> I realized I should write some change log, and the change log was mean=
ingless.
>
> Will any more adjustments happen for the discussed update suggestion
> after the third patch version?
>
>
> > The changelog is fine IMO. The point of a changelog is to tell a
> > reader doing git archeology why a change happened and this is
> > sufficent for that.
>
> We might stumble on a different understanding for the affected =E2=80=9Cc=
hange logs=E2=80=9D.
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/D=
ocumentation/process/submitting-patches.rst?id=3Da10c9c710f9ecea87b9f4bbb83=
7467893b4bef01#n751
>
> Would you like to follow the patch evolution a bit easier?
>
> Regards,
> Markus

Thanks for the reply.
I should study the documentation first.
BTW, happy new week
