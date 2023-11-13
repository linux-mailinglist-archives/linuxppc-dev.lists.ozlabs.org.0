Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A83A87E9950
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 10:46:27 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QggBEpo+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STPhK4cN2z3cLl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 20:46:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=QggBEpo+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::22f; helo=mail-oi1-x22f.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STPgS6rnjz2xFn
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 20:45:40 +1100 (AEDT)
Received: by mail-oi1-x22f.google.com with SMTP id 5614622812f47-3b2f28caab9so2652928b6e.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 01:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699868735; x=1700473535; darn=lists.ozlabs.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DH0+6wLGxWwjy472SttpQ7v+g/1+3nWfcjmEcwBuwzw=;
        b=QggBEpo+TFOrN+1x6VLPDKa44iDayqfl/kUdXCJgASCHPZx1Ha6S9AwqA0NP3VJvj5
         Z02Lqc0Yr+xYtXTzYOK9A90ByWq5Ms9UJIna9sbjtvagwE4FmF0vN2qBvHtZYSbEHMJM
         /c1c0idHBa3J8Z+KjKGNKh4DM0Uuk2z811xSlouGxszlqVdhoTbaPpuqO33izaPi+xyI
         cUIjBjhxylqrqF9+sCcHIxUIofDovy2P/6S48a5PR08Q5e5QAO8xsvXNWpFYJah4gmxQ
         3kCq9Va/LPPK8sh2P49wi0OYYjkXKScGWoyA+O/gvQxK+MNbZuCBDeco0be4Gcm47lWc
         f6Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699868735; x=1700473535;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DH0+6wLGxWwjy472SttpQ7v+g/1+3nWfcjmEcwBuwzw=;
        b=n888fTnnlyhhdQCawZJ03+PI+1uOjdYWE7Y69OVwqlSNBtjHf9JxDBFTkJX29MjmZQ
         LcmLX5KpElVLNmO8Gk1JTp4ZHQAfBmIs/BOSBF2CLMPq0ZRvauMVelMMV4aHFN+4+Gns
         ZT1Y7mD+FriNNx2YuU0QyMPMz7JyERYOsy0jDYtTuzFIDrKnHrFGeBCE5WiCWaHtJ1Gi
         AATKU0B8XOVAvTWP2PjhQPNIVZuPllHTWoPrp1POYlPc3QYn68c+VVJWEeGysz/SGRti
         k7IVdypR31wKDsYieRWcsnoz8OEbTtYcLnMqwGeNkTPrUxoDj+tZy0aVSPj30WNBiLlh
         qlNA==
X-Gm-Message-State: AOJu0YzSnO1pgXb4KpIZAQYeIXM1VxWeyHGCoti00lTZUTJzHrimZZ6u
	+ETZMoQXvbntuOhXzPzJ1gg=
X-Google-Smtp-Source: AGHT+IHOUOR//3wC59eMz6lgRIfMMJu55sBtkT65NSJmHTGq2jczN/Y6uSp9M3V/RXvztWc5sOVOLw==
X-Received: by 2002:a05:6808:1a18:b0:3ab:74a2:ab2b with SMTP id bk24-20020a0568081a1800b003ab74a2ab2bmr9435372oib.48.1699868734521;
        Mon, 13 Nov 2023 01:45:34 -0800 (PST)
Received: from localhost (121-44-82-40.tpgi.com.au. [121.44.82.40])
        by smtp.gmail.com with ESMTPSA id fh8-20020a056a00390800b006c03fa6300dsm3523184pfb.117.2023.11.13.01.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 01:45:33 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 19:45:27 +1000
Message-Id: <CWXL68T68A18.BZ8WHB15ZU2Y@wheely>
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Jiri Slaby" <jirislaby@kernel.org>
Subject: Re: [PATCH 1/2] tty: hvc: Make hvc_remove() return no value
X-Mailer: aerc 0.15.2
References: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
 <20231105214406.3765906-5-u.kleine-koenig@pengutronix.de>
In-Reply-To: <20231105214406.3765906-5-u.kleine-koenig@pengutronix.de>
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
Cc: linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, linux-serial@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 6, 2023 at 7:44 AM AEST, Uwe Kleine-K=C3=B6nig wrote:
> The function hvc_remove() returns zero unconditionally. Make it return
> void instead to make it obvious that the caller doesn't need to do any
> error handling. Accordingly drop the error handling from
> hvc_opal_remove().
>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>

IIUC these are functionally no change, just tidying and removing
dead code? Unless I'm mistaken, then

Reviewed-by: Nicholas Piggin <npiggin@gmail.com>

> ---
>  drivers/tty/hvc/hvc_console.c |  3 +--
>  drivers/tty/hvc/hvc_console.h |  2 +-
>  drivers/tty/hvc/hvc_opal.c    | 15 +++++++--------
>  3 files changed, 9 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/tty/hvc/hvc_console.c b/drivers/tty/hvc/hvc_console.=
c
> index 959fae54ca39..57f5c37125e6 100644
> --- a/drivers/tty/hvc/hvc_console.c
> +++ b/drivers/tty/hvc/hvc_console.c
> @@ -976,7 +976,7 @@ struct hvc_struct *hvc_alloc(uint32_t vtermno, int da=
ta,
>  }
>  EXPORT_SYMBOL_GPL(hvc_alloc);
> =20
> -int hvc_remove(struct hvc_struct *hp)
> +void hvc_remove(struct hvc_struct *hp)
>  {
>  	unsigned long flags;
>  	struct tty_struct *tty;
> @@ -1010,7 +1010,6 @@ int hvc_remove(struct hvc_struct *hp)
>  		tty_vhangup(tty);
>  		tty_kref_put(tty);
>  	}
> -	return 0;
>  }
>  EXPORT_SYMBOL_GPL(hvc_remove);
> =20
> diff --git a/drivers/tty/hvc/hvc_console.h b/drivers/tty/hvc/hvc_console.=
h
> index 9668f821db01..78f7543511f1 100644
> --- a/drivers/tty/hvc/hvc_console.h
> +++ b/drivers/tty/hvc/hvc_console.h
> @@ -77,7 +77,7 @@ extern int hvc_instantiate(uint32_t vtermno, int index,
>  extern struct hvc_struct * hvc_alloc(uint32_t vtermno, int data,
>  				     const struct hv_ops *ops, int outbuf_size);
>  /* remove a vterm from hvc tty operation (module_exit or hotplug remove)=
 */
> -extern int hvc_remove(struct hvc_struct *hp);
> +extern void hvc_remove(struct hvc_struct *hp);
> =20
>  /* data available */
>  int hvc_poll(struct hvc_struct *hp);
> diff --git a/drivers/tty/hvc/hvc_opal.c b/drivers/tty/hvc/hvc_opal.c
> index 992e199e0ea8..8995b253cf90 100644
> --- a/drivers/tty/hvc/hvc_opal.c
> +++ b/drivers/tty/hvc/hvc_opal.c
> @@ -235,16 +235,15 @@ static int hvc_opal_probe(struct platform_device *d=
ev)
>  static int hvc_opal_remove(struct platform_device *dev)
>  {
>  	struct hvc_struct *hp =3D dev_get_drvdata(&dev->dev);
> -	int rc, termno;
> +	int termno;
> =20
>  	termno =3D hp->vtermno;
> -	rc =3D hvc_remove(hp);
> -	if (rc =3D=3D 0) {
> -		if (hvc_opal_privs[termno] !=3D &hvc_opal_boot_priv)
> -			kfree(hvc_opal_privs[termno]);
> -		hvc_opal_privs[termno] =3D NULL;
> -	}
> -	return rc;
> +	hvc_remove(hp);
> +	if (hvc_opal_privs[termno] !=3D &hvc_opal_boot_priv)
> +		kfree(hvc_opal_privs[termno]);
> +	hvc_opal_privs[termno] =3D NULL;
> +
> +	return 0;
>  }
> =20
>  static struct platform_driver hvc_opal_driver =3D {

