Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C45914C6C79
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 13:29:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K6fnR6y9Jz3bq6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Feb 2022 23:28:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=puET9FaE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62f;
 helo=mail-ej1-x62f.google.com; envelope-from=jakobkoschel@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=puET9FaE; dkim-atps=neutral
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K6fDJ2GrCz30MH;
 Mon, 28 Feb 2022 23:03:43 +1100 (AEDT)
Received: by mail-ej1-x62f.google.com with SMTP id d10so24250565eje.10;
 Mon, 28 Feb 2022 04:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=puET9FaE+iPLWSLHaH0Jc15P7LML3ILv/CtQc1xDRlDOvchBnePGr3CpZ8iNTFg26S
 MvdmzyKLao5C/5rXrSzR7jzTPZ0Yuj+7M+cqDE4eOMJCgAt9uraXgTEJwynFkzni1Fvy
 Vjo1HNa/jUOUFI/CmrkLVTegwpA5o7Cf0wR8qBn5y2xARegC4rz7JN5F70qSFE936vyK
 a6/WQ787WIaZ7lFx0I/tSaiXwe3z6FIrVBWdIQkzq0oVXXDZs7cCv56cl8qPmZ4RxzRI
 sP+DHiZk3rxPTft7o6PkfUdJMVZiSNaECaj+ljhYu978P5TkgTkfoRd54h/EuhklkuKS
 esTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=m/mYa1XqvvHLfnL3BOoOqYDa1ViNV7MB47waZKIycw0=;
 b=6AOR30azoeXogXn+ksKKQ3s4weOAlQayv+Ka/2tW77okP1Yqk7Cu70UMdvCrygwDx3
 MS8LYUk/UJT4FpzxfAVT47ss0O0+XaYC2Ha66YKs8zzA+OU7JuLq7zkSXD/PmbQUqymj
 jfoGf1Tqc3Grqyz0nr3HDr9lgnxRq3N1pTA8lnCRDQ26QZIRajoMmfg7AtmkntuPQAqm
 8uIQ/89nnN1qBYReB/e7OPtrrLKZdBQiJb7J1vEw+RuC4wwYoky+aD+4JS+RxAbpmCKf
 GVfuLpeN0cl5KKxQXxFXqmGfEWFJokZMWbV/LfXq8V6C83Z4FzqsX4xV1gvGYIK7N5Y+
 E5wg==
X-Gm-Message-State: AOAM531f7PosTt2sWiV1I4qdxSgQbCf14ljuUa1n4ybUmSgkGaqAjJ3l
 Y5hnsl8DxlKBG3SwyIKJq0M=
X-Google-Smtp-Source: ABdhPJyPihjoYwx+e9NKg98XvxKCbWi7t13guT1EBLKeJ6QGdK72cKHCeJpX8hRszpc83uJxZ+jQ9w==
X-Received: by 2002:a17:906:d14e:b0:6cd:8d7e:eec9 with SMTP id
 br14-20020a170906d14e00b006cd8d7eeec9mr14944415ejb.28.1646049820086; 
 Mon, 28 Feb 2022 04:03:40 -0800 (PST)
Received: from smtpclient.apple ([2a02:8109:9d80:3f6c:957a:1d13:c949:d1f3])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b006ce04bb8668sm4257528ejh.184.2022.02.28.04.03.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Feb 2022 04:03:39 -0800 (PST)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 15.0 \(3693.60.0.1.1\))
Subject: Re: [PATCH 1/6] drivers: usb: remove usage of list iterator past the
 loop body
From: Jakob Koschel <jakobkoschel@gmail.com>
In-Reply-To: <20220228112413.GA2812@kadam>
Date: Mon, 28 Feb 2022 13:03:36 +0100
Content-Transfer-Encoding: quoted-printable
Message-Id: <E31E215E-C409-40B8-8452-57E70C91484C@gmail.com>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-2-jakobkoschel@gmail.com>
 <20220228112413.GA2812@kadam>
To: Dan Carpenter <dan.carpenter@oracle.com>
X-Mailer: Apple Mail (2.3693.60.0.1.1)
X-Mailman-Approved-At: Mon, 28 Feb 2022 23:23:25 +1100
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
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 linux-media@vger.kernel.org, Kees Cook <keescook@chromium.org>,
 Arnd Bergman <arnd@arndb.de>, linux-pm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>, linux-block@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 Nathan Chancellor <nathan@kernel.org>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, tipc-discussion@lists.sourceforge.net,
 linux-crypto@vger.kernel.org, netdev@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



> On 28. Feb 2022, at 12:24, Dan Carpenter <dan.carpenter@oracle.com> =
wrote:
>=20
> On Mon, Feb 28, 2022 at 12:08:17PM +0100, Jakob Koschel wrote:
>> diff --git a/drivers/usb/gadget/udc/at91_udc.c =
b/drivers/usb/gadget/udc/at91_udc.c
>> index 9040a0561466..0fd0307bc07b 100644
>> --- a/drivers/usb/gadget/udc/at91_udc.c
>> +++ b/drivers/usb/gadget/udc/at91_udc.c
>> @@ -150,13 +150,14 @@ static void proc_ep_show(struct seq_file *s, =
struct at91_ep *ep)
>> 	if (list_empty (&ep->queue))
>> 		seq_printf(s, "\t(queue empty)\n");
>>=20
>> -	else list_for_each_entry (req, &ep->queue, queue) {
>> -		unsigned	length =3D req->req.actual;
>> +	else
>> +		list_for_each_entry(req, &ep->queue, queue) {
>> +			unsigned int	length =3D req->req.actual;
>>=20
>> -		seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> -				&req->req, length,
>> -				req->req.length, req->req.buf);
>> -	}
>> +			seq_printf(s, "\treq %p len %d/%d buf %p\n",
>> +					&req->req, length,
>> +					req->req.length, req->req.buf);
>> +		}
>=20
> Don't make unrelated white space changes.  It just makes the patch
> harder to review.  As you're writing the patch make note of any
> additional changes and do them later in a separate patch.
>=20
> Also a multi-line indent gets curly braces for readability even though
> it's not required by C.  And then both sides would get curly braces.
>=20
>> 	spin_unlock_irqrestore(&udc->lock, flags);
>> }
>>=20
>> @@ -226,7 +227,7 @@ static int proc_udc_show(struct seq_file *s, void =
*unused)
>>=20
>> 	if (udc->enabled && udc->vbus) {
>> 		proc_ep_show(s, &udc->ep[0]);
>> -		list_for_each_entry (ep, &udc->gadget.ep_list, =
ep.ep_list) {
>> +		list_for_each_entry(ep, &udc->gadget.ep_list, =
ep.ep_list) {
>=20
> Another unrelated change.
>=20
>> 			if (ep->ep.desc)
>> 				proc_ep_show(s, ep);
>> 		}
>=20
>=20
> [ snip ]

Thanks for pointing out, I'll remove the changes here and note them down
to send them separately.

>=20
>> diff --git a/drivers/usb/gadget/udc/net2272.c =
b/drivers/usb/gadget/udc/net2272.c
>> index 7c38057dcb4a..bb59200f1596 100644
>> --- a/drivers/usb/gadget/udc/net2272.c
>> +++ b/drivers/usb/gadget/udc/net2272.c
>> @@ -926,7 +926,8 @@ static int
>> net2272_dequeue(struct usb_ep *_ep, struct usb_request *_req)
>> {
>> 	struct net2272_ep *ep;
>> -	struct net2272_request *req;
>> +	struct net2272_request *req =3D NULL;
>> +	struct net2272_request *tmp;
>> 	unsigned long flags;
>> 	int stopped;
>>=20
>> @@ -939,11 +940,13 @@ net2272_dequeue(struct usb_ep *_ep, struct =
usb_request *_req)
>> 	ep->stopped =3D 1;
>>=20
>> 	/* make sure it's still queued on this endpoint */
>> -	list_for_each_entry(req, &ep->queue, queue) {
>> -		if (&req->req =3D=3D _req)
>> +	list_for_each_entry(tmp, &ep->queue, queue) {
>> +		if (&tmp->req =3D=3D _req) {
>> +			req =3D tmp;
>> 			break;
>> +		}
>> 	}
>> -	if (&req->req !=3D _req) {
>> +	if (!req) {
>> 		ep->stopped =3D stopped;
>> 		spin_unlock_irqrestore(&ep->dev->lock, flags);
>> 		return -EINVAL;
>> @@ -954,7 +957,6 @@ net2272_dequeue(struct usb_ep *_ep, struct =
usb_request *_req)
>> 		dev_dbg(ep->dev->dev, "unlink (%s) pio\n", _ep->name);
>> 		net2272_done(ep, req, -ECONNRESET);
>> 	}
>> -	req =3D NULL;
>=20
> Another unrelated change.  These are all good changes but send them as
> separate patches.

You are referring to the req =3D NULL, right?

I've changed the use of 'req' in the same function and assumed that I =
can
just remove the unnecessary statement. But if it's better to do =
separately
I'll do that.

>=20
>> 	ep->stopped =3D stopped;
>>=20
>> 	spin_unlock_irqrestore(&ep->dev->lock, flags);
>=20
> regards,
> dan carpenter

thanks,
Jakob Koschel

