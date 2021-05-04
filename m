Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35CC83727F0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 11:17:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZDkc1Gr4z304X
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 19:17:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=jC4W0jtx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=jC4W0jtx; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZDkB1WC5z2y0J
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  4 May 2021 19:16:49 +1000 (AEST)
Received: by mail-pf1-x42f.google.com with SMTP id k19so3839322pfu.5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 04 May 2021 02:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=7b9XieOLKOJyF/uBT/Ov2mFmHkd3aZXuNAt6k73jsU4=;
 b=jC4W0jtxXd1hyD/jgdcCoVMiBHKSJu3EcYjav25KcKcGIZ6pzR5SM7Lyh1HLXmeFaT
 QTpuO3qxlDSlCmCjz4V3KFomGMKtYyvfAzutYF4/ra8Fn+5iE0qHWbX7847PyWOHijyT
 Ayu2JXWZ/IR55RBQNjusyrsyuuIegxKFI/TGDmTmFz7B8DIHQQD6TmxMYyYUUd9ARZ5o
 sO6z1C91aXJgoHrUiYHrNlQi5BqQEMljHXquLRTAZsRdJbKGGm2ZqtKTbjGwRTL6hdU4
 U3C2HSsYFrrO5lm77IFDSpwp1SVK7OYRL7QEQSfZNCMnpB10FfOyPYeveiGALhNAjjV4
 0WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=7b9XieOLKOJyF/uBT/Ov2mFmHkd3aZXuNAt6k73jsU4=;
 b=I/CoTWWNaQhRb/+glI5inPi362DZ5PSe5m94NmGlCmnmNnyWPUjM5xdwdwlRXeN6bk
 SngDxH7KMc7r9zcQjb1wKWfU28K1Us3D5vWjFVLia7c/6jUGLXnjwEdS8hQdbddsL34P
 atsV00NCxW+be3yI48pvTOp/phOnsDUFyTXzDVUFc8vJ7dvGbIuh78n2LQTDHmJpK2JN
 1epkcaxwFpNDoKX7L/f4ZTikuq7KqRE7z3JkboYWRsAoiHO8DlRgmZ/pFtdKbR5iIJmh
 s19GY2hBkb986JzuqeDHVkQTHPiHBGmrrXyQHA2gBdtlg61ZySW0xP20gIdX7edMpYvw
 6fxg==
X-Gm-Message-State: AOAM531N3vkGBg4wcIFj8rZJCRbefliTIqwrbfJ2yodXNnuS/KFItx+x
 4SP5h7eSGKGd56UFrRRuwqUNkYJpqt8=
X-Google-Smtp-Source: ABdhPJzg5B6Rz4lzHmRa8i6rjoZOqyfDyP6tGHslNs+E3XgMkEwvD+1+tfGYVf0uRCTU7UP7tmCUdA==
X-Received: by 2002:a63:5249:: with SMTP id s9mr22146259pgl.192.1620119807942; 
 Tue, 04 May 2021 02:16:47 -0700 (PDT)
Received: from localhost ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id s32sm11586857pfw.2.2021.05.04.02.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 02:16:47 -0700 (PDT)
Date: Tue, 04 May 2021 19:16:42 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 4/4] powerpc/powernv: Remove POWER9 PVR version check for
 entry and uaccess flushes
To: Joel Stanley <joel@jms.id.au>
References: <20210503130243.891868-1-npiggin@gmail.com>
 <20210503130243.891868-5-npiggin@gmail.com>
 <CACPK8XekEXgqA1bML6A+NbsshzsLe+pLTzGJzRLdC+QKrV5T9Q@mail.gmail.com>
In-Reply-To: <CACPK8XekEXgqA1bML6A+NbsshzsLe+pLTzGJzRLdC+QKrV5T9Q@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1620119643.r94ggot8r7.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Joel Stanley's message of May 4, 2021 10:51 am:
> On Mon, 3 May 2021 at 13:04, Nicholas Piggin <npiggin@gmail.com> wrote:
>>
>> These aren't necessarily POWER9 only, and it's not to say some new
>> vulnerability may not get discovered on other processors for which
>> we would like the flexibility of having the workaround enabled by
>> firmware.
>>
>> Remove the restriction that they only apply to POWER9.
>=20
> I was wondering how these worked which led me to reviewing your patch.
> From what I could see, these are enabled by default (SEC_FTR_DEFAULT
> in arch/powerpc/include/asm/security_features.h), so unless all
> non-POWER9 machines have set the "please don't" bit in their firmware
> this patch will enable the feature for those machines. Is that what
> you wanted?

Yes. POWER7/8 should be affected (it's similar mechanism that requires
the meltdown RFI flush, which those processors need).

POWER10 we haven't released a bare metal firmware with the right bits
yet. Not urgent at the moment but wouldn't hurt to specify them and
add the Linux code for them.

Thanks,
Nick

>=20
>>
>> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
>> ---
>>  arch/powerpc/platforms/powernv/setup.c | 9 ---------
>>  1 file changed, 9 deletions(-)
>>
>> diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platf=
orms/powernv/setup.c
>> index a8db3f153063..6ec67223f8c7 100644
>> --- a/arch/powerpc/platforms/powernv/setup.c
>> +++ b/arch/powerpc/platforms/powernv/setup.c
>> @@ -122,15 +122,6 @@ static void pnv_setup_security_mitigations(void)
>>                         type =3D L1D_FLUSH_ORI;
>>         }
>>
>> -       /*
>> -        * If we are non-Power9 bare metal, we don't need to flush on ke=
rnel
>> -        * entry or after user access: they fix a P9 specific vulnerabil=
ity.
>> -        */
>> -       if (!pvr_version_is(PVR_POWER9)) {
>> -               security_ftr_clear(SEC_FTR_L1D_FLUSH_ENTRY);
>> -               security_ftr_clear(SEC_FTR_L1D_FLUSH_UACCESS);
>> -       }
>> -
>>         enable =3D security_ftr_enabled(SEC_FTR_FAVOUR_SECURITY) && \
>>                  (security_ftr_enabled(SEC_FTR_L1D_FLUSH_PR)   || \
>>                   security_ftr_enabled(SEC_FTR_L1D_FLUSH_HV));
>> --
>> 2.23.0
>>
>=20
