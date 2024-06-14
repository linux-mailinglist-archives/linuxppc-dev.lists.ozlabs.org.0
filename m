Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E679908058
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 02:56:49 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aW4lGpBM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0gpQ0nnYz3clY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 10:56:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=aW4lGpBM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0gnk4DM2z30Wl
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 10:56:09 +1000 (AEST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-705c739b878so1639538b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jun 2024 17:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718326568; x=1718931368; darn=lists.ozlabs.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=13BylizCRYc6Xcl35+0sm0bp1dbpJApZtVGohrWhPfM=;
        b=aW4lGpBMtEKOTfuo8xzoK119csUSVEhX4L3oFpc0sr5/LD681tkHJcSHOhyPQaimpR
         UamfqnGe8+In0GxFV1/RzSXdbQ9byM6L28W2OaR0qXrzl1lOjgbCBq2HfXHJoMusAQh3
         ZOVe2ySTDyFIOnuZADFRhFWO0CTL+NUHQ718oV0O634t8S0TdeRz8WukF2KDHSe9xFdf
         4xu0ARIT6pUqrQXwNISjRq1Fa88VN6lYjg9VnBsNwomkAKju2VYM7hE9ehJt5lldvT67
         GmEEj2pvUqL4atf+WdExRyMgUWoFtr9LmL8aRmL48lY5cVVOK/VupYgAr/Pkdrf7Pzp3
         VXiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718326568; x=1718931368;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=13BylizCRYc6Xcl35+0sm0bp1dbpJApZtVGohrWhPfM=;
        b=RmEFkYtVuSX6+Q3a/qEbO6EQ8umKmxdHSUrS5d3FeBy46jUkW5pYIC0YiLKGX5b8BY
         6yAB52f7mfjnKOn+D09WiSIT1et9HoqqZR39YBQ0d/80BiZIhCktxdwOetR2jIxBCSoi
         FA84XvSybyO8swcor7X4BHNMtjJF+CDJAUhph3qs5Equle6Kz7wq6JUE2vAoO6pVtx5e
         7aF2uXmwy9htAPOTPjnL8Y9RdIrbxaF6tOZsUHi//88mxdDZB0RC0Cu7VoN8HCkqVYHD
         j1LGW+YMAhyfNkzTdxXsTov4DzcYEqqL2+DzdQT4wAYcUX2nZaknd6ZM0UICX+u8bylu
         N/qg==
X-Forwarded-Encrypted: i=1; AJvYcCXngjGpkKhEAHXxw0BGOKs3mc9oL0K6Gux5feKWJJ0EJmxPjT2uR9vOxDC0vmcDAK00LFvfeInBGjIwzj7bFM2IcYKCy+Vg0fzzx3Rfbw==
X-Gm-Message-State: AOJu0Yz0OIfJOI7pmVgsKBtvnV+QCMDgK8Ub4HOu2M9HieSrIzN+okRz
	XIz3bjb4sf9gTBMQAaEKnxiFsGXuWKSPY7hltRNOXIlgn5SLWr3q
X-Google-Smtp-Source: AGHT+IHVjVqM9SRwWFeUNQo97OxW6rjAwjoczj1H61metQ/sd7wrR3wNOsFSzjKa/AWIug8jJaCQwg==
X-Received: by 2002:a05:6a21:99a0:b0:1b8:13fd:c00f with SMTP id adf61e73a8af0-1bae7f948c2mr1998463637.22.1718326567830;
        Thu, 13 Jun 2024 17:56:07 -0700 (PDT)
Received: from localhost (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705cc91e0fbsm1961562b3a.9.2024.06.13.17.56.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jun 2024 17:56:07 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 14 Jun 2024 10:56:02 +1000
Message-Id: <D1ZBXH42OY9O.3N6I0DBO4UF3J@gmail.com>
Subject: Re: [kvm-unit-tests PATCH v10 12/15] scripts/arch-run.bash: Fix
 run_panic() success exit status
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Andrew Jones" <andrew.jones@linux.dev>
X-Mailer: aerc 0.17.0
References: <20240612052322.218726-1-npiggin@gmail.com>
 <20240612052322.218726-13-npiggin@gmail.com>
 <20240612-eef98a649a0764215ea0d91f@orel>
In-Reply-To: <20240612-eef98a649a0764215ea0d91f@orel>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed Jun 12, 2024 at 5:26 PM AEST, Andrew Jones wrote:
> On Wed, Jun 12, 2024 at 03:23:17PM GMT, Nicholas Piggin wrote:
> > run_qemu_status() looks for "EXIT: STATUS=3D%d" if the harness command
> > returned 1, to determine the final status of the test. In the case of
> > panic tests, QEMU should terminate before successful exit status is
> > known, so the run_panic() command must produce the "EXIT: STATUS" line.
> >=20
> > With this change, running a panic test returns 0 on success (panic),
> > and the run_test.sh unit test correctly displays it as PASS rather than
> > FAIL.
> >=20
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> > ---
> >  scripts/arch-run.bash | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
> > index 8643bab3b..9bf2f0bbd 100644
> > --- a/scripts/arch-run.bash
> > +++ b/scripts/arch-run.bash
> > @@ -378,6 +378,7 @@ run_panic ()
> >  	else
> >  		# some QEMU versions report multiple panic events
> >  		echo "PASS: guest panicked"
> > +		echo "EXIT: STATUS=3D1"
> >  		ret=3D1
> >  	fi
> > =20
> > --=20
> > 2.45.1
> >
>
> Do we also need an 'echo "EXIT: STATUS=3D3"' in the if-arm of this if-els=
e?

In that case we don't need it because run_panic() returns 3 in that
case. run_qemu_status() only checks guest status if harness said
QEMU ran successfully.

Arguably this is a bit hacky because "EXIT: STATUS" should really be
a guest-printed status, and we would have a different success code
for expected-QEMU-crash type of tests where guest can't provide status.
I can do that incrementally after this if you like, but it's a bit
more code.

Thanks,
Nick
