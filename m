Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4143649DBDD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 08:47:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jkt3w1hhLz3cbr
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jan 2022 18:47:56 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=DL8Mh5ty;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62a;
 helo=mail-pl1-x62a.google.com; envelope-from=npiggin@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=DL8Mh5ty; dkim-atps=neutral
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jkt3H0xX3z2xs4
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jan 2022 18:47:22 +1100 (AEDT)
Received: by mail-pl1-x62a.google.com with SMTP id u11so1753451plh.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jan 2022 23:47:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:subject:to:cc:references:in-reply-to:mime-version
 :message-id:content-transfer-encoding;
 bh=ccbbHyPa2zNHaY1DTEmYbekClrFWWB6tGVPD92+73A4=;
 b=DL8Mh5tykZhwRpRlx6PJFlY4l+TJ1nDbLWtCJWqUPgUufRJcQlc87OeuQ/NuEY9Q5G
 Zks30HfjIunhbY2mjzrWf6Nxj0xs3OONqSulWD+5zL2qAELSaD+6fb/DvceJcL5XKa1A
 zbuCDk6/v8MpDP/hVjbsTdxUaj3N9Yb0wbwJ3bQbRdR368uKmm88twG0rjmWVbcXCm5a
 nKkTqGxMLxYv4KUXT0HgPwE8X1b89pNZ7/wZvH9OCJuWwPd6CZLrTc6mpFkb9Y/R3Nq8
 tSK9xz5SeD89C7w6LBVKHLv7n8i9dmvkmVkBzGI+LptF5O6i6ryaX+0DoFTZTcI9jDaM
 Hg3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:subject:to:cc:references:in-reply-to
 :mime-version:message-id:content-transfer-encoding;
 bh=ccbbHyPa2zNHaY1DTEmYbekClrFWWB6tGVPD92+73A4=;
 b=kcBuJvM77QRwucWth3obFWwtHazd6cCuW0hMky9tnkKNHzdRTV34+D4JNiD00CN8nb
 fOBJNlwssDRSZryCL1+A1UsNM9wUlCfrqNxtUrrBxl7RA4cSJCZL4XkZtRnYPCPOf9va
 H4rn+5CG54gBF39jQr74pQt8CxFJr9/wznwsdnHmXuf2g8hPpqznDDMI+yelMqUriO4K
 0c0aMjvUQjMd0nBjaYRB9U1D7abDZU0mKjAGrFoMiIJo4P2SmeyihMvhlJfkfsziXQr3
 ywYY9Ra+GwxiiJ/p9cxqQP2aEgOMk02mbJE8/Wl1loihycU99igWb0ElRCvXbZjjb8/N
 1oIA==
X-Gm-Message-State: AOAM533wCgAaUrYxbt60ISNk/ufEX39Mkv85dQ6FfQRgcjgh7Myx5yq0
 1MduBzono2q7Zgd5OZ1qJcQ=
X-Google-Smtp-Source: ABdhPJzTdfAMHZgt09EJywuiYpaTjuAUSIUWYp3MJHgXqIFFyR1hxS2GInBjux6BQyeantrGUFUIXw==
X-Received: by 2002:a17:90a:b90b:: with SMTP id
 p11mr2900928pjr.189.1643269640138; 
 Wed, 26 Jan 2022 23:47:20 -0800 (PST)
Received: from localhost (193-116-82-75.tpgi.com.au. [193.116.82.75])
 by smtp.gmail.com with ESMTPSA id y16sm4521122pfl.128.2022.01.26.23.47.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 23:47:19 -0800 (PST)
Date: Thu, 27 Jan 2022 17:47:14 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: ppc: hard lockup / hang in v5.17-rc1 under QEMU
To: =?iso-8859-1?q?C=E9dric?= Le Goater <clg@kaod.org>, Miguel Ojeda
 <miguel.ojeda.sandonis@gmail.com>
References: <CANiq72n_FmDx=r-o9J8gYc6LpwRL5EGmhM6Xzwv27Xc7h1TNDw@mail.gmail.com>
 <cf6ac499-4190-cbe5-255c-f9edf07a4786@kaod.org>
 <CANiq72mV3AzmBDVJM+tQriEoDu_9LFBrK_vR6GC4qEmLw0UepQ@mail.gmail.com>
In-Reply-To: <CANiq72mV3AzmBDVJM+tQriEoDu_9LFBrK_vR6GC4qEmLw0UepQ@mail.gmail.com>
MIME-Version: 1.0
Message-Id: <1643269597.wkij0f82dr.astroid@bobo.none>
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
Cc: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Excerpts from Miguel Ojeda's message of January 27, 2022 4:57 am:
> On Wed, Jan 26, 2022 at 4:03 PM C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> Indeed. I could reproduce.
>=20
> Thanks for the quick confirmation!
>=20
>> Could you please send the QEMU command line and the full dmesg ? and
>> possibly open an issue on :
>>
>>    https://gitlab.com/qemu-project/qemu/-/issues/
>>
>> I guess it's a QEMU modeling issue.
>=20
> Of course -- done (details there):
>=20
>     https://gitlab.com/qemu-project/qemu/-/issues/842

That sounds like my fault actually.

https://lists.ozlabs.org/pipermail/linuxppc-dev/2022-January/239178.html

Thanks,
Nick
