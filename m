Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DA5E871370
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 03:14:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AXFtavNM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TpfK72gQyz3dWW
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 Mar 2024 13:14:51 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=AXFtavNM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62e; helo=mail-pl1-x62e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TpfJN09Wwz2ytg
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 Mar 2024 13:14:10 +1100 (AEDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1dc0e5b223eso44335835ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 04 Mar 2024 18:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709604849; x=1710209649; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kIaItcpq60SwRZMvgghKHJmefoIzj4K3zJYvKv5MwnU=;
        b=AXFtavNM4k0854E8vhUrB3W/dG7mD8xRP9uBgE1FQHpZSPA1lF0ozEMn7pO6SVoi3C
         4I6fZUAegtGaqMcph554gm5IZX8NFknIVfQq3fKwuTzVVepbKF91FVSCelafetlSTVqu
         GbXerB+kA9R+v3RmFyFry+DcONXpJ7lpwbaFHCZ1vWj5P+uSr/X122b6gRa5Cwaf65N7
         1PxO6/6ZbBdJoxgO5lkSal0cOVuXIs6DN5RDAtwp95KVG8Y6jBpOFt6CATGfthuTYiq1
         pCQ/yUN5Vpx2B3K9Tq2wxDS5HS701x1hYRCZCgHq+zCFaU4Ies3XzVksrufevAm5dx5S
         PIBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709604849; x=1710209649;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kIaItcpq60SwRZMvgghKHJmefoIzj4K3zJYvKv5MwnU=;
        b=My2nPO5oc/+ctU8LwHAHLgUY076gq9XlEuxAvDoCQDSk+M8iqo917mQeIegp/F8jlg
         WzkVWTGVVlil4hKvNB5VrWOgNrJhFO+xNqotP3sa2TKLRwqWfJoBAG9f71xqwACvpFEP
         NJf46Yonl9pjZObmkn53OzNWKrkwKkU/SOnWjmgvwJ4i6HJmZsFTx1D/0nabZFH4IrTG
         oAhiFkBkq8hSpYZ/0TxbhJuxoJ1Ojv8xHtgGl/48mZgj4JBCWGUan0KPLxnkm6a4TBN3
         mYHp7QvbgLKM8gmVRFkJc89pu8i3xCBj9OA/eJA08NFzTvRNE/SdeZuaADPn3Z1tpb+E
         N0Qw==
X-Forwarded-Encrypted: i=1; AJvYcCXWzo0b/F4T4NZC6RQdy2D1vEtK2EvYeCNoKRsdTwETWN+PBVDVtHeOIdpyWztS054NmtpIw7RDvqEaw2T2woi/42h5PgnyW6ccePuLfA==
X-Gm-Message-State: AOJu0YzdZEu1n09xkKDvwZPQrDCsRbsclKyecAnMr+XPrMpep85SuPgl
	DUJwFNWajRJIyZWqsP+hNT26q5y1uzKnG/WYNdo6hpP68m7rWxEL
X-Google-Smtp-Source: AGHT+IG0V/GYWcPSWzwDoq0twoJCNiOyb5mCYu5x71ATX4Oxr438p6feAW+dsfRoTqy5fVI//PezDw==
X-Received: by 2002:a17:902:eec3:b0:1db:f389:2deb with SMTP id h3-20020a170902eec300b001dbf3892debmr511078plb.17.1709604849064;
        Mon, 04 Mar 2024 18:14:09 -0800 (PST)
Received: from localhost (220-235-220-130.tpgi.com.au. [220.235.220.130])
        by smtp.gmail.com with ESMTPSA id mq12-20020a170902fd4c00b001dc8f1e06eesm9213195plb.291.2024.03.04.18.14.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Mar 2024 18:14:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Mar 2024 12:14:03 +1000
Message-Id: <CZLGC6S6YUQU.3FJKWH2MQ0NO5@wheely>
Subject: Re: [kvm-unit-tests PATCH 07/32] powerpc/sprs: Don't fail changed
 SPRs that are used by the test harness
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Thomas Huth" <thuth@redhat.com>
X-Mailer: aerc 0.15.2
References: <20240226101218.1472843-1-npiggin@gmail.com>
 <20240226101218.1472843-8-npiggin@gmail.com>
 <04e976cc-0239-4ee9-b0d2-cfdebbc4c3d9@redhat.com>
In-Reply-To: <04e976cc-0239-4ee9-b0d2-cfdebbc4c3d9@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Andrew Jones <andrew.jones@linux.dev>, Joel
 Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri Mar 1, 2024 at 9:15 PM AEST, Thomas Huth wrote:
> On 26/02/2024 11.11, Nicholas Piggin wrote:
> > SPRs annotated with SPR_HARNESS can change between consecutive reads
> > because the test harness code has changed them. Avoid failing the
> > test in this case.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   powerpc/sprs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/powerpc/sprs.c b/powerpc/sprs.c
> > index 8253ea971..44edd0d7b 100644
> > --- a/powerpc/sprs.c
> > +++ b/powerpc/sprs.c
> > @@ -563,7 +563,7 @@ int main(int argc, char **argv)
> >   			if (before[i] >> 32)
> >   				pass =3D false;
> >   		}
> > -		if (!(sprs[i].type & SPR_ASYNC) && (before[i] !=3D after[i]))
> > +		if (!(sprs[i].type & (SPR_HARNESS|SPR_ASYNC)) && (before[i] !=3D aft=
er[i]))
> >   			pass =3D false;
> >  =20
> >   		if (sprs[i].width =3D=3D 32 && !(before[i] >> 32) && !(after[i] >> =
32))
>
> I guess you could also squash this into the previous patch (to avoid=20
> problems with bisecting later?) ...

Yeah, I guess it doesn't make much sense to split out since lots of
other stuff changes in the previous patch too.

>
> Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Thanks,
Nick
