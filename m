Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6797643D99E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 05:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hfr272MySz3c6N
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Oct 2021 14:02:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=AeGIXUGw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::102a;
 helo=mail-pj1-x102a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=AeGIXUGw; dkim-atps=neutral
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [IPv6:2607:f8b0:4864:20::102a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hfr1Y5KlPz2xXD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Oct 2021 14:01:35 +1100 (AEDT)
Received: by mail-pj1-x102a.google.com with SMTP id v10so3006345pjr.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 20:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=IGv+MeBuCnq8G6v+2GUvGt6iWZH+HN78+ayRIKdS9G0=;
 b=AeGIXUGwuX1rT8el/Fd0kkjlahZ0JX+ZaMwGmjwrTUH+EcObDGenKAy2LvjdNvGyWV
 +SfPwpjwVICBWI+MfFhFcxEw/tnq3Z9Rw6nWHJt5hSz9Wlc9AgV/4UZi+GqALHJAzWsy
 3CjUuHTYq52kubMyChnuX/RIeXMeKA0beKO+MlPSwqyH6NIjTYRt8R2AOq9H7LKK9VwV
 oXvW+psuxxWp8LJeQbS6KDgqLdED1auIyveF6Y5LiewWSdVk/wZ27nvWI49QUkwWWOJv
 zA7IDo4Wd6gdv5m3t1dYJa4b7WCnz1zYMpfOgjWAwYBii6aUaIKVEUtle51MBhXtQcIE
 8hug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=IGv+MeBuCnq8G6v+2GUvGt6iWZH+HN78+ayRIKdS9G0=;
 b=yLhC3iIgngb9K89hKCyeE2lx1DWktj8jJ6qPGlYOVKERlLJm6fxdnga5hAjLVsuc40
 /zYHa1JWDw+W1AMF9nhDpZE/t4z0IUxQxBrFbcuPdn3wviiex6qbxz6oTrJmLxunCJ8E
 DtJAWudE5gEQp/51uM8eK4S7oe438Vh8bUtsqR+D2r8dTO0PJP2vQEdJ0TZB8gBQpbcH
 k9+6TEzR5acj8HovHW9QUo0rgWfOSctuxjPS1F00d9u7BS3ZruiWbQYoaIc4bJNR/f1V
 8PzGiLQOHDSjX6sb60y14LeEoGKjzz8fSHxqErwHyRU7eHaKJA7c9PunW2l4Lt2wtzeX
 KLOQ==
X-Gm-Message-State: AOAM530lgzi82o05qTCIKgjkSiRYw+kpFZ8WilAn3mjxskX3IlwqzX53
 wrrTjAkwcvRPlNgLUsgbUdI=
X-Google-Smtp-Source: ABdhPJzN88H7qw012JR2oUKmHlv0iqCzpRL9O72cKgh47JHoWaxQbtdW5NkEiZoOovT0U5RB5cppcQ==
X-Received: by 2002:a17:90a:5d01:: with SMTP id
 s1mr9325305pji.194.1635390093463; 
 Wed, 27 Oct 2021 20:01:33 -0700 (PDT)
Received: from localhost ([118.208.159.180])
 by smtp.gmail.com with ESMTPSA id x5sm1322015pfh.153.2021.10.27.20.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 20:01:33 -0700 (PDT)
Date: Thu, 28 Oct 2021 13:01:27 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: instruction storage exception handling
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Jacques de Laval
 <jacques.delaval@protonmail.com>
References: <uqZVxyE3l9oalZp_hyXFJvdH-ADNTvpOuQeoNGyqrUcoNgh9afea1-FzfZKMgiaF5WxY4kdMQlJYzmjvdQ2E2joF86-mEcaxdifht9z8NA0=@protonmail.com>
 <1635306738.0z8wt7619v.astroid@bobo.none>
 <1f5c24de-6bba-d6c0-5b8e-3522f25158f6@csgroup.eu>
 <1635312278.p87nvl11rv.astroid@bobo.none>
 <4ee635f5-7a67-bac5-2ad2-616c1aaa95b6@csgroup.eu>
 <1635318932.od1ierwsis.astroid@bobo.none>
 <f5824237-4fd4-ca87-afe7-620a23d84824@csgroup.eu>
 <V0kJsLgxvO-1SWRhS-9Nbx1E6oXO6IAJDAYBUA_kieAbf5J8MOnrRzdAiCSl2KoRjztnI3LitFLsJstAOVnWZ-4PBzWmrpTiqIYnU7TRXyo=@protonmail.com>
In-Reply-To: <V0kJsLgxvO-1SWRhS-9Nbx1E6oXO6IAJDAYBUA_kieAbf5J8MOnrRzdAiCSl2KoRjztnI3LitFLsJstAOVnWZ-4PBzWmrpTiqIYnU7TRXyo=@protonmail.com>
MIME-Version: 1.0
Message-Id: <1635389034.knz9p2g41k.astroid@bobo.none>
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
Cc: Scott Wood <oss@buserror.net>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Jacques de Laval's message of October 27, 2021 10:03 pm:
> On Wednesday, October 27th, 2021 at 9:52 AM, Christophe Leroy <christophe=
.leroy@csgroup.eu> wrote:
>=20
>> Le 27/10/2021 =C3=A0 09:47, Nicholas Piggin a =C3=A9crit=C2=A0:
>>
>> > You're right. In that case it shouldn't change anything unless there
>> >
>> > was a BO fault. I'm not sure what the problem is then. Guessing based
>> >
>> > on the NIP and instructions, it looks like it's probably got the corre=
ct
>> >
>> > user address that it's storing into vmf on the stack, so it has got pa=
st
>> >
>> > the access checks so my theory would be wrong anyway.
>> >
>> > Must be something simple but I can't see it yet.
>>
>> Anyway, I think it is still worth doing the check with setting 0 in
>>
>> _ESR(r11), maybe the Reference Manual is wrong.
>>
>> So Jacques, please do the test anyway if you can.
>>
>> Thanks
>>
>> Christophe
>=20
> I tested with the last patch from Nicholas, and with that I can not
> reproduce the issue, so it seems like that solves it for my case and setu=
p
> at least.
>=20
> Big thanks Christophe and Nicholas for looking in to this!

Thanks for reporting and testing. We can certainly send this patch=20
upstream to fix the regression, but I'm still not exactly sure what is=20
going on. If it is an errata or part of specification we missed that=20
could explain it but it would be good to understand and comment it.

If you have time to test again with only the following patch applied,
it might give a better clue. This patch should keep running but it
would print some dmesg output.

Thanks,
Nick

diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
index a8d0ce85d39a..cf56f23ff90a 100644
--- a/arch/powerpc/mm/fault.c
+++ b/arch/powerpc/mm/fault.c
@@ -548,6 +548,12 @@ static __always_inline void __do_page_fault(struct pt_=
regs *regs)
=20
 DEFINE_INTERRUPT_HANDLER(do_page_fault)
 {
+	if (TRAP(regs) =3D=3D INTERRUPT_INST_STORAGE) {
+		if (regs->dsisr !=3D 0) {
+			printk("ISI pc:%lx msr:%lx dsisr:%lx ESR:%lx\n", regs->nip, regs->msr, =
regs->dsisr, mfspr(SPRN_ESR));
+			regs->dsisr =3D 0; // fix?
+		}
+	}
 	__do_page_fault(regs);
 }
=20
