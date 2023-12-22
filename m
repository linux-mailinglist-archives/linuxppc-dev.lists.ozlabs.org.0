Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A75D81C79B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 10:52:06 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VxmDC3ef;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SxMyq6dzwz3cWr
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Dec 2023 20:52:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=VxmDC3ef;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2d; helo=mail-oo1-xc2d.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SxMy16Hy0z3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 20:51:21 +1100 (AEDT)
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-59431ecabb0so643037eaf.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Dec 2023 01:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703238675; x=1703843475; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p4YI5mRve5b7UFT1Vit4+6CH1n36vTPiU2vKButTctA=;
        b=VxmDC3efz3OodwI36iF/McLRevqMyd1XbhKUcIDU6+vNYkK9I0JD69UWTNkVve5O66
         b0Wr4cxmppO6/v8KcPZyQERYiAk82r720u/92K8OnnandCAfMzv556dZt8EKZt0EIKfw
         FTLAd3MCgjq+ZvdR+RdMa6yXTJXtRKGwSAxzTMMl1TtV2o9dkeEhprQrfi1EAzSShUdh
         f+IEjjR5+np4u+7fs3LJMb9ZbnGbsriKZfiJchAv5/yocS4zlfj6VNxiE2xViWONfTYj
         8Qfg9iF5MeX5NCFuaOL8+LsbOfAa0EdeTejaazWXZkgQAlSBvQKM8IomFiiBs/hRtUjV
         /wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703238675; x=1703843475;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p4YI5mRve5b7UFT1Vit4+6CH1n36vTPiU2vKButTctA=;
        b=trOcX8JionXz8VKS9UryIlOqnmZ8YUTfvohZABYE6CkrzhUwCRGhSf2gY8+bHjvGLA
         mfQ5N+0S9mGoU9wk4ELRmXdD9z9OVKJqmCdKTJi5yI+DEILVW6qNOUaOMfVwlBnhqb6t
         fNncDfAvzm0lID8WEeO4UUzCNl9xT/SWT76vLlR+YhtWhyRSnkXYzEnrbT2WgGty13OP
         gV4ZuDQruuF0HZzmnn+HXzhu6vrnKovVasMAzOzqDQ2HBoR/KHgM/m5f5rxHcT4l1Nct
         7jF2EBu6GuHimTqprHbQ2jG/SENHKNWN0vdB/nv/M10ALA7YzHpxm06X7v8/Nl1JPpn2
         pa0g==
X-Gm-Message-State: AOJu0Yzf4fGzrtc5ponD9NIwd0xu1QoCEhYdduiY0bN6TLKrFn1gKSQg
	wDMe6AruPof4mZLqOBE5Ng8=
X-Google-Smtp-Source: AGHT+IHG6OAPhLmKdJyuxRxSs98+wvwcYe2giZb8jFHhi+9eJXd/lJmK2C1FgP+tbG2sIIza/S3pYw==
X-Received: by 2002:a05:6359:209:b0:172:e164:93f9 with SMTP id ej9-20020a056359020900b00172e16493f9mr841223rwb.31.1703238675349;
        Fri, 22 Dec 2023 01:51:15 -0800 (PST)
Received: from localhost ([203.220.145.68])
        by smtp.gmail.com with ESMTPSA id z2-20020a62d102000000b006d9762f2725sm2650927pfg.45.2023.12.22.01.51.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Dec 2023 01:51:14 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 22 Dec 2023 19:51:09 +1000
Message-Id: <CXURPUMH8EKD.3GZ7EISK22JLA@wheely>
Subject: Re: [kvm-unit-tests PATCH v5 12/29] powerpc/sprs: Avoid taking
 async interrupts caused by register fuzzing
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>, <kvm@vger.kernel.org>
X-Mailer: aerc 0.15.2
References: <20231216134257.1743345-1-npiggin@gmail.com>
 <20231216134257.1743345-13-npiggin@gmail.com>
 <c06b1cec-8a39-41ff-91e6-ad7bb99b3341@redhat.com>
In-Reply-To: <c06b1cec-8a39-41ff-91e6-ad7bb99b3341@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Dec 19, 2023 at 9:47 PM AEST, Thomas Huth wrote:
> On 16/12/2023 14.42, Nicholas Piggin wrote:
> > Storing certain values in some registers can cause asynchronous
> > interrupts that can crash the test case, for example decrementer
> > or PMU interrupts.
> >=20
> > Change the msleep to mdelay which does not enable MSR[EE] and so
> > avoids the problem. This allows removing some of the SPR special
> > casing.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/sprs.c | 14 ++------------
> >   1 file changed, 2 insertions(+), 12 deletions(-)
> >=20
> > diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> > index 01041912..313698e0 100644
> > --- a/powerpc/sprs.c
> > +++ b/powerpc/sprs.c
> > @@ -481,12 +481,7 @@ static void set_sprs(uint64_t val)
> >   			continue;
> >   		if (sprs[i].type & SPR_HARNESS)
> >   			continue;
> > -		if (!strcmp(sprs[i].name, "MMCR0")) {
> > -			/* XXX: could use a comment or better abstraction! */
> > -			__mtspr(i, (val & 0xfffffffffbab3fffULL) | 0xfa0b2070);
> > -		} else {
> > -			__mtspr(i, val);
> > -		}
> > +		__mtspr(i, val);
> >   	}
> >   }
> >  =20
> > @@ -536,12 +531,7 @@ int main(int argc, char **argv)
> >   	if (pause) {
> >   		migrate_once();
> >   	} else {
> > -		msleep(2000);
> > -
> > -		/* Taking a dec updates SRR0, SRR1, SPRG1, so don't fail. */
> > -		sprs[26].type |=3D SPR_ASYNC;
> > -		sprs[27].type |=3D SPR_ASYNC;
> > -		sprs[273].type |=3D SPR_ASYNC;
> > +		mdelay(2000);
> >   	}
>
> IIRC I used the H_CEDE stuff here on purpose to increase the possibility=
=20
> that the guest gets rescheduled onto another CPU core on the host, and th=
us=20
> that it uncovers sprs that are not saved and restored on the host more=20
> easily. So I'd rather keep the msleep() here.

Ah. Not a bad idea. I'll see about making it deal with H_CEDE
instead.

I wonder if there would be a way to stress host CPU migration
in the test harness. Instead of waiting for QEMU to exit, the
script could run taskset in a loop to bounce it around.
Conceptually easy, probably fiddly to wire things up nicely.

I may try to take a look at adding that... but after this
series so it doesn't get any bigger :/

Thanks,
Nick
