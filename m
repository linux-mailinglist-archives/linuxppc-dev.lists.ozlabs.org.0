Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9632384AE02
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 06:21:42 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f8ur7LCd;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TTWnc37YQz3cgf
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Feb 2024 16:21:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=f8ur7LCd;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::430; helo=mail-pf1-x430.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TTWmj2Gy6z30PH
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Feb 2024 16:20:52 +1100 (AEDT)
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e0518c83c6so689328b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 05 Feb 2024 21:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707196849; x=1707801649; darn=lists.ozlabs.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ujXxMm41r1DTz6hXgtYYr184Pjn4FDAt68mgLajJUg=;
        b=f8ur7LCdDAOzprStTNVjPFVUb3RKThl1Q21SQx5PqXzC9QcnrOZfjGec13bnIKMaCQ
         DW0+4mFkp9ufHIouoGjnzlW8KrNiPRd9klFA0uY8BTPbkmW8Xq+lW39+58dHAyrYgqzV
         vKqGC0al937bCevpNPhjJRUCmIfCd0VP7WpQv6RTtqvUXE+LZ0rolIx64WwMGbfRutdh
         yX4z+COOmei0ircwgutqTF4CaUyNJOhlQKRPpGvzuY2wmf7U4rFHf8jfUZICokICMAUl
         j44LJBvyePnTfgPjAMylIbUiJ23PJ7EruGeAJsCpEBIGHFOI73h/hZn0q4eDYqG8I6CC
         sbJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707196849; x=1707801649;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=6ujXxMm41r1DTz6hXgtYYr184Pjn4FDAt68mgLajJUg=;
        b=f2Y7D+gV3dTcDiuq7IzMrbAXn8pBZyppPDm1/1HmlGtNFGEJJnPV0dStOV1cUv1TUB
         yaSP0QUHsrNbmRSAYnWDi4qvAZC9lwAasETpiYA4o3CwhhSeSTFD5d+ixufRFXWbd5s6
         7IAVg9FekzZd6QJccvurHvzLTDqvJjc4u9FPihzkuJ0yL9ZVF8UbgL/+0j5yjRWiaLYR
         +k+yF8tnZ3cnJ34C2g270F5GkMz9iUuMeHgaWUpzZTSOtx/kodI2ZAqfCr+JfbKMJl83
         4L7mZWLmnP5BfZI63gYLqg9xKI/z3pWP2p0mjR2pH6ensD/A0Lmu/E6MyMGDbGQcvLNb
         t+Gg==
X-Gm-Message-State: AOJu0Ywvu9GtlbDZOgOcxWLYUA4h83cUYq/49rmgXaexoJKnMGmRWVmo
	Pqn2y39f+5nXYmP015G7Miq9rG+eZvkuRxwNZZKlSDE+c5MBXMnV
X-Google-Smtp-Source: AGHT+IGrC/r/fSLayc+2sKm4zT5ROnGWF0/akqOJQQ+ytoitx9LbhdLVzv/iUQiDN62FNk18zrb+oQ==
X-Received: by 2002:a05:6a20:1585:b0:19a:28c3:ee0d with SMTP id h5-20020a056a20158500b0019a28c3ee0dmr633416pzj.15.1707196848684;
        Mon, 05 Feb 2024 21:20:48 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCW18Usptg28HpXEBSe0coTZzST3WInoh7AzPcUDYZLKObsxXjGFfums519DdYypqLO/LRwtH87zuGBMa19V2aHodBMpHpIGAflAANNaysJmXcVvIOc9DTx/UVKQA/aoQ7Oe7tzqmEOuYyc14Zy37imoWAwt1LjfELNiQdFJHp0tnL/K7LbaIoxRZfTaNhHrA6yHV0o6bdyuNATTtTrhPGAoPm/nVh3TZ4MtaTZ2fDfQZO6qXuQ4n4Slo8zmtYh0F768tEb/iOmRyx9xEA40WasdNWE5hA08Wh5903uBFSBhSfcvh7muf1SRGe1EQr1jxbQD+I46Zh4b/Nzl/0j4inFDJUkZhYu5xZA4fRrSRciBWf56R43Aabd4gAQIUi7OkZgkrdVOa1Bhw8ILdcXk8ecS0GcwfJujRvqS+Be6BIBPIWdYfWWjyhqw9RbpOx8ArZx1jIqA/W6PpGe2upPJPkJPY1T+qch6S8t1qq2vMRSwBAkiKM8=
Received: from localhost ([1.146.47.2])
        by smtp.gmail.com with ESMTPSA id j6-20020a170902c3c600b001d965cf6a9bsm830428plj.252.2024.02.05.21.20.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Feb 2024 21:20:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 06 Feb 2024 15:20:15 +1000
Message-Id: <CYXQRHUSFZ71.LI2K63O2WRJG@wheely>
To: "Thomas Huth" <thuth@redhat.com>
Subject: Re: [kvm-unit-tests PATCH v2 3/9] arch-run: Clean up initrd cleanup
From: "Nicholas Piggin" <npiggin@gmail.com>
X-Mailer: aerc 0.15.2
References: <20240202065740.68643-1-npiggin@gmail.com>
 <20240202065740.68643-4-npiggin@gmail.com>
 <cc1b4733-9a6f-4bb6-b8e6-1a6a8807b317@redhat.com>
In-Reply-To: <cc1b4733-9a6f-4bb6-b8e6-1a6a8807b317@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linux-s390@vger.kernel.org, Nico Boehr <nrb@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>, linuxppc-dev@lists.ozlabs.org, Shaoqin
 Huang <shahuang@redhat.com>, Andrew Jones <andrew.jones@linux.dev>, Eric Auger <eric.auger@redhat.com>, Marc Hartmayer <mhartmay@linux.ibm.com>, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Claudio
 Imbrenda <imbrenda@linux.ibm.com>, Alexandru Elisei <alexandru.elisei@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Feb 5, 2024 at 10:04 PM AEST, Thomas Huth wrote:
> On 02/02/2024 07.57, Nicholas Piggin wrote:
> > Rather than put a big script into the trap handler, have it call
> > a function.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >   scripts/arch-run.bash | 12 +++++++++++-
> >   1 file changed, 11 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index f22ead6f..cc7da7c5 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -271,10 +271,20 @@ search_qemu_binary ()
> >   	export PATH=3D$save_path
> >   }
> >  =20
> > +initrd_cleanup ()
> > +{
> > +	if [ "$KVM_UNIT_TESTS_ENV_OLD" ]; then
> > +		export KVM_UNIT_TESTS_ENV=3D"$KVM_UNIT_TESTS_ENV_OLD"
> > +	else
> > +		unset KVM_UNIT_TESTS_ENV
> > +		unset KVM_UNIT_TESTS_ENV_OLD
> > +	fi
> > +}
> > +
> >   initrd_create ()
> >   {
> >   	if [ "$ENVIRON_DEFAULT" =3D "yes" ]; then
> > -		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; [ "$KVM_UNIT_TESTS_ENV_OL=
D" ] && export KVM_UNIT_TESTS_ENV=3D"$KVM_UNIT_TESTS_ENV_OLD" || unset KVM_=
UNIT_TESTS_ENV; unset KVM_UNIT_TESTS_ENV_OLD'
> > +		trap_exit_push 'rm -f $KVM_UNIT_TESTS_ENV; initrd_cleanup'
> >
>
> Why don't you move the 'rm -f $KVM_UNIT_TESTS_ENV' into the initrd_cleanu=
p()=20
> function, too? ... that would IMHO make more sense for a function that is=
=20
> called *_cleanup() ?

Yeah good point, will respin.

Thanks,
Nick
