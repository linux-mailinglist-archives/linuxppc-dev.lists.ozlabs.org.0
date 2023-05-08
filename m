Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 217C66FB0B1
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 14:59:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFLvr00xYz3fHW
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 May 2023 22:59:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K0XZq6Eo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com; envelope-from=bagasdotme@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=K0XZq6Eo;
	dkim-atps=neutral
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFLtt6cGyz30Lt
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 May 2023 22:58:14 +1000 (AEST)
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-64115eef620so34193351b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 08 May 2023 05:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683550691; x=1686142691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gvfV9+PCzsvkjwntJF8d+j7w4e2sZC/L2Vk5lbbZ8yc=;
        b=K0XZq6EoperWmzBR1Hz+pq8+x1s6xcIye3EBGQsu/sv/XZET6xhhL+Ns9Di+eoJHXK
         ygg8ytnL3o9fToMGhFlezakX8m1tT6JZGr0tkB8QaGsjMd3B1sGCpxrtJUlRZC9IrogY
         s80BCP0DSC3K4HmgdHxMoEyve/hXY47jY0FEqZLjPVYOXGP0OwOcwc8TAfU06sOM16kb
         dfAE0IKtOOQ/5lfCk1vPN3UpskGg6pxstVoIcwCs7KqhKy/ZxlV2RLWKy01AAO9lEy1f
         ffrKxVik7a97JC5nUHxRzFMtEcHGTRKjyn1MR/1Dj2DTl4j1kvvsu2xFskQG8cV9jsBG
         qrrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683550691; x=1686142691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gvfV9+PCzsvkjwntJF8d+j7w4e2sZC/L2Vk5lbbZ8yc=;
        b=SMW9ZVbXFbNPwLgoNGNMIGPKAVNxyRmpLfTRG5xa/9Q0cMB5ic23r0Sw6ASZrVQKHy
         TpW5Stx2sHV5UOQl+D8uLPMyUFH1Agr6WfIhjGkOYgoPDrsFUmYNIZyJa6l1vxYgeWmt
         MkFcZX6RMx+mlq+zg0XCYkFzd0nTqk1NnEHkHc6okQStLjaAh/ZMSSIXMY8QNyKTTPue
         6Tpg3O7Jjwr7MzAJMaWAwhN39BUhrB270BHMjYTTeq/VKf/X9ZVx4Lc5sPJJnr2/FJvO
         m6MMS/NTa580DNGErzyXt8Awf3SqvIu1Cn3zf8lybqBm+lc4XBPfsFWB/S7LUDSZMZ9A
         F8mw==
X-Gm-Message-State: AC+VfDx0mEp/ZatcVpLS62y8p4OzM4bSehqBnXihRrhCDMlAE+SatayK
	8kBF7j9c8i3ILrCQdbNfsKI=
X-Google-Smtp-Source: ACHHUZ7tvcZUwhmWYK1KL8fvJvl/gWOTCK0hnFrNrGP2zfguq0vBDTk0YwoABqhe+nORAwMFU1llWA==
X-Received: by 2002:a17:903:1208:b0:1aa:d235:6dd4 with SMTP id l8-20020a170903120800b001aad2356dd4mr18399382plh.19.1683550690873;
        Mon, 08 May 2023 05:58:10 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-47.three.co.id. [116.206.28.47])
        by smtp.gmail.com with ESMTPSA id h12-20020a170902eecc00b001a0742b0806sm7153503plb.108.2023.05.08.05.58.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 05:58:10 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
	id 5626810629F; Mon,  8 May 2023 19:58:07 +0700 (WIB)
Date: Mon, 8 May 2023 19:58:07 +0700
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux regressions mailing list <regressions@lists.linux.dev>,
	Christian Zigotzky <chzigotzky@xenosoft.de>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: Re: [PASEMI NEMO] Boot issue with the PowerPC updates 6.4-1
Message-ID: <ZFjx31Rw79GF+E7p@debian.me>
References: <301595ad-0edf-2113-b55f-f5b8051ed24c@xenosoft.de>
 <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NH6qK9uLFuUReiH4"
Content-Disposition: inline
In-Reply-To: <71f580c7-0890-b622-62c9-f58fa9537a90@leemhuis.info>
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
Cc: Olof Johansson <olof@lixom.net>, Rob Herring <robh@kernel.org>, Darren Stevens <darren@stevens-zone.net>, "R.T.Dickinson" <rtd2@xtra.co.nz>, Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--NH6qK9uLFuUReiH4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 08, 2023 at 01:29:22PM +0200, Linux regression tracking #adding=
 (Thorsten Leemhuis) wrote:
> [CCing the regression list, as it should be in the loop for regressions:
> https://docs.kernel.org/admin-guide/reporting-regressions.html]
>=20
> [TLDR: I'm adding this report to the list of tracked Linux kernel
> regressions; the text you find below is based on a few templates
> paragraphs you might have encountered already in similar form.
> See link in footer if these mails annoy you.]
>=20
> On 02.05.23 04:22, Christian Zigotzky wrote:
> > Hello,
> >=20
> > Our PASEMI Nemo board [1] doesn't boot with the PowerPC updates 6.4-1 [=
2].
> >=20
> > The kernel hangs right after the booting Linux via __start() @
> > 0x0000000000000000 ...
> >=20
> > I was able to revert the PowerPC updates 6.4-1 [2] with the following
> > command: git revert 70cc1b5307e8ee3076fdf2ecbeb89eb973aa0ff7 -m 1
> >=20
> <snipped> ...=20
> Thanks for the report. To be sure the issue doesn't fall through the
> cracks unnoticed, I'm adding it to regzbot, the Linux kernel regression
> tracking bot:
>=20
> #regzbot ^introduced e4ab08be5b4902e5

Hi Thorsten,

Why and how can you conclude that the culprit is e4ab08be5b4902 ("powerpc/i=
sa-bridge:
Remove open coded "ranges" parsing") rather than powerpc PR merge commit
70cc1b5307e8ee ("Merge tag 'powerpc-6.4-1' of
git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux")?=20

Thanks.

--=20
An old man doll... just what I always wanted! - Clara

--NH6qK9uLFuUReiH4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZFjx2wAKCRD2uYlJVVFO
o4xEAQDcf1cLJer4o/CrYHWbWulSD8sBhiGfD7yHvrFxA9OMnAD/WihMJ1YuvPap
N4TzwlUdqHowFwnhkI1hKVr7LWF8gAk=
=slin
-----END PGP SIGNATURE-----

--NH6qK9uLFuUReiH4--
