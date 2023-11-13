Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D97087E9A3B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 11:25:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CezAmwFP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4STQYT5Zk8z3cXr
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Nov 2023 21:25:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=CezAmwFP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::635; helo=mail-pl1-x635.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4STQXV6wQyz3clB
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 21:24:42 +1100 (AEDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1cc5b7057d5so37738485ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Nov 2023 02:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699871080; x=1700475880; darn=lists.ozlabs.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvhfRiEn/JQ/sTat9S9kUx90eeVH90Jeof4YpqlmPq4=;
        b=CezAmwFP/qM2uiWpRSsD9h0SJRYjtJhBL+4LVRfKrnmcsjpk/8xB576mQl9mLqvVnj
         n8NF3iSLcFKr3xFpiFmAAl8RV5NeDKVwhJh/YGr1GBdDawCVM0yFUiHtBjDoq5GN+GaT
         RIux+9cRca6ETBhWFHWBu/mvIP/OLtJtPXWsC+h3FPZcDPcsdQWRhfn88n6vGPHUiASs
         9W2h+FFPC6DkdnSqtKrILUbc9sCb07iidU9T+CXMCFjrkDIzQvpgwdbk7E7bVD/g5ULp
         mcsqyasaxNqARthnrkHQp+fgPdtjIOVQ6GxLEKSXg6rnDExD+xSPI04+2d09xfiDU7hT
         /0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699871080; x=1700475880;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RvhfRiEn/JQ/sTat9S9kUx90eeVH90Jeof4YpqlmPq4=;
        b=GPajvs4diOO88wOVcYkm9BbgiVeElyby6SLw8vK8D+ChxcMFei80/C6MA3K/DiLJJg
         LyFbSxhvOKnuTNou20tLUjhzrE8TerEnCtObeSDZq3ywLcql1S3P4EwWyP6+GDIHyrpO
         tGqabBrJIltjI8KA7tHqVDACzHfoxd8l4gUk//m0TVjek41QguhtnqlI0dLwHUL/dTRK
         XwV7arS+reESjJu/5HHO9eWfMHZo3fIpvZ3Xi+mvJwLid1HMc/iTcNnqMSrbzqYvQNfF
         w+IIRkE94lo0zFnbldZIffpHUZ0Mrs3uinqI1/BlzsHsKXAP3Cz8Sm++CixTBl4OBywh
         CZpg==
X-Gm-Message-State: AOJu0Yy4VNye2pW/4aTdl+Ht3/WOP6WsYWQ3oHK9H1JSlTBk1IH0WNjU
	fEZYp1ELlKlTTOjYz4X9qh8=
X-Google-Smtp-Source: AGHT+IFp3r/37Ybm8YpWjR6uPwy9Lo4Fr6duvRL/bVO2gkJqKbaaFPXEH9CwZdCEYm7+w5ZQDYLT1A==
X-Received: by 2002:a17:903:234a:b0:1cc:ab06:e6c8 with SMTP id c10-20020a170903234a00b001ccab06e6c8mr10155712plh.19.1699871079839;
        Mon, 13 Nov 2023 02:24:39 -0800 (PST)
Received: from localhost (121-44-82-40.tpgi.com.au. [121.44.82.40])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902694900b001cc0e3a29a8sm3744725plt.89.2023.11.13.02.24.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Nov 2023 02:24:39 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Nov 2023 20:24:33 +1000
Message-Id: <CWXM06PV1CIJ.1DG4SJH21CJXP@wheely>
Subject: Re: [PATCH 1/2] tty: hvc: Make hvc_remove() return no value
From: "Nicholas Piggin" <npiggin@gmail.com>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
X-Mailer: aerc 0.15.2
References: <20231105214406.3765906-4-u.kleine-koenig@pengutronix.de>
 <20231105214406.3765906-5-u.kleine-koenig@pengutronix.de>
 <CWXL68T68A18.BZ8WHB15ZU2Y@wheely>
 <20231113095730.uein5ix7eduqvboq@pengutronix.de>
In-Reply-To: <20231113095730.uein5ix7eduqvboq@pengutronix.de>
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
Cc: linux-serial@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Nov 13, 2023 at 7:57 PM AEST, Uwe Kleine-K=C3=B6nig wrote:
> On Mon, Nov 13, 2023 at 07:45:27PM +1000, Nicholas Piggin wrote:
> > On Mon Nov 6, 2023 at 7:44 AM AEST, Uwe Kleine-K=C3=B6nig wrote:
> > > The function hvc_remove() returns zero unconditionally. Make it retur=
n
> > > void instead to make it obvious that the caller doesn't need to do an=
y
> > > error handling. Accordingly drop the error handling from
> > > hvc_opal_remove().
> > >
> > > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > IIUC these are functionally no change, just tidying and removing
> > dead code?
>
> In case this isn't only a rethorical question: There is indeed no
> change in behaviour.

Thanks, it wasn't. Your changelog and code seemed to be quite clear,
I just wanted to confirm I didn't misread or misunderstand it.

Thanks,
Nick

> hvc_remove() returned always zero, so
>
> 	rc =3D hvc_remove(hp);
> 	if (rc =3D=3D 0) {
> 		... some code not changing rc ...
> 	}
> 	... some more code not changing rc ...
> 	return rc
>
> can be simplified to
>
> 	hvc_remove(hp);
> 	... some code not changing rc ...
> 	... some more code not changing rc ...
> 	return 0;
>
> Best regards
> Uwe

