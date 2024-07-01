Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9A791EB4B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 01:19:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=AHmdnpuj;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WChnq0xxRz3dDJ
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2024 09:19:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=iki.fi header.i=@iki.fi header.a=rsa-sha256 header.s=lahtoruutu header.b=AHmdnpuj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=iki.fi (client-ip=2a0b:5c81:1c1::37; helo=lahtoruutu.iki.fi; envelope-from=jarkko.sakkinen@iki.fi; receiver=lists.ozlabs.org)
X-Greylist: delayed 526 seconds by postgrey-1.37 at boromir; Tue, 02 Jul 2024 05:10:08 AEST
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WCbG80kdhz3cB2
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2024 05:10:08 +1000 (AEST)
Received: from localhost (83-245-197-232.elisa-laajakaista.fi [83.245.197.232])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sakkinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4WCb3m67tPz49Px4;
	Mon,  1 Jul 2024 22:01:08 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1719860469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFdKNGhm4fd8mnyMx9lxPsPdnIHGKCX9D2T3jRpMtYE=;
	b=AHmdnpuj8lmOtNhL3gAT8QJLEvyjQEUuoZBoVBkA4WgW73DHusAH5w0OqP80s1n02VXeQ1
	1gMFlEptPp2M4kmowJwlJmRmVO9Pr5O+GIkWJaGhigJrQblMRu+TfIEl07Uh5Z0BfQO45Z
	B9nRUF5zjNHmgcgw2qHn6kvmyrB2kyPdX18ivLNxmUbPJjFr5XtxKxhp865UwMcwFASO7H
	6bldFr63vqXWH5eAOsZ6F19UgGrxqZLIXYM8yzu6dfy17zTNaBHTMSMyCSg14NbDe6B7rG
	92tyiypkuA/I/4MW8CPtmRIszhFCh4nurRpWdAaWLfumOxZaIlITcnsyPsyIiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1719860469;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UFdKNGhm4fd8mnyMx9lxPsPdnIHGKCX9D2T3jRpMtYE=;
	b=FXdDSELbvygc9gHUh3yf7nk6ZqCnWoTOduv/JYdx14r4rIQpOSbBgwj9kZZjoMZJH8oo8p
	tYRATjKIjl/NO94nEqnaeWl46O9371lewkx8amRioASmUvsR0AHDDzeYqeXVkcWR/x7xOD
	Utg5WzlhNU6L8sKJJeT9N/Yf2MXnDlefQWwiziUH/qBY4iOO0voenBz4TFn275tstwJq+N
	jpnLzaYEEtUXs132EDCdQctWTtZWn/3Jfq4VljE0omm4d/1OhujvA3HEQZphFz2ERPuwIX
	/VEX33vlp+DhZEpegPyPqzThzk/r1GQcO2HDMzRgUl1MnjFAwpVEw6nEa+F0ZA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sakkinen smtp.mailfrom=jarkko.sakkinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1719860469; a=rsa-sha256;
	cv=none;
	b=euy5uRNFCw3n+A+4ytH7y3KTDtLNi1T7vNWTo/z60oI1vmplp8hKBnCkGRixS1wjyxySjX
	Vv04H+Qd3uxY++tIFJAmF7JrkVXTd9/hi2LsICWY8WmCn78DhF8wck/nN5xCnJsc2Xp77P
	MffjvI4nGyxs2TSiAaJCSIFm2rIKm6H+AjXe8v65ukQoXRFD/GtyfnJbSlvhOuvD0y3ekl
	I1xgux0IZdV9KQY/0AA8rK47eG5R1V2/j9MifSGwYw6ztI8tCWFhrtYVonddJ5cOKQa0Yq
	JerJCbJPwh6JnYmZd0c9evU+PURs3m/2Po6JojHOETtFXvmcLLdO2e5SgY9IYw==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Jul 2024 19:01:08 +0000
Message-Id: <D2EFNJTR80JS.1RW91OVY1UH1N@iki.fi>
From: "Jarkko Sakkinen" <jarkko.sakkinen@iki.fi>
To: "Stefan Berger" <stefanb@linux.ibm.com>, "Jarkko Sakkinen"
 <jarkko@kernel.org>, "Linux regressions mailing list"
 <regressions@lists.linux.dev>
Subject: Re: [PATCH] tpm: ibmvtpm: Call tpm2_sessions_init() to initialize
 session support
X-Mailer: aerc 0.17.0
References: <20240617193408.1234365-1-stefanb@linux.ibm.com>
 <9e167f3e-cd81-45ab-bd34-939f516b05a4@linux.ibm.com>
 <55e8331d-4682-40df-9a1b-8a08dc5f6409@leemhuis.info>
 <9f86a167074d9b522311715c567f1c19b88e3ad4.camel@kernel.org>
 <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
In-Reply-To: <53d96a8b-26ef-46a3-9b68-3d791613e47c@linux.ibm.com>
X-Mailman-Approved-At: Tue, 02 Jul 2024 09:18:48 +1000
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
Cc: naveen.n.rao@linux.ibm.com, linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon Jul 1, 2024 at 6:29 PM UTC, Stefan Berger wrote:
>
>
> On 7/1/24 11:22, Jarkko Sakkinen wrote:
> > On Fri, 2024-06-28 at 17:00 +0200, Linux regression tracking (Thorsten =
Leemhuis) wrote:
> >> [CCing the regression list]
> >>
> >> On 20.06.24 00:34, Stefan Berger wrote:
> >>> Jarkko,
> >>>  =C2=A0 are you ok with this patch?
> >>
> >> Hmmm, hope I did not miss anythng, but looks like nothing happened for
> >> about 10 days here. Hence:
> >>
> >> Jarkko, looks like some feedback from your side really would help to
> >> find a path to get this regression resolved before 6.10 is released.
> >>
> >> Ciao, Thorsten (wearing his 'the Linux kernel's regression tracker' ha=
t)
> >=20
> > Sorry for latency, and except a bit more slow phase also during
> > July because I'm most of this month on Holiday, except taking care
> > 6.11 release.
> >=20
> > This really is a bug in the HMAC code not in the IBM driver as
> > it should not break because of a new feature, i.e. this is only
> > correct conclusions, give the "no regressions" rule.
> >=20
> > Since HMAC is by default only for x86_64 and it does not break
> > defconfig's, we should take time and fix the actual issue.
>
> It was enabled it on my ppc64 system after a git pull -- at least I did=
=20
> not enable it explicitly. Besides that others can enable it on any arch=
=20
> unless you now change the 'default x86_64' to a 'depends x86_64' iiuc=20
> otherwise the usage of a Fixes: , as I used in my patch, would be justifi=
ed.
>
> config TCG_TPM2_HMAC
> 	bool "Use HMAC and encrypted transactions on the TPM bus"
> 	default X86_64
> 	select CRYPTO_ECDH
> 	select CRYPTO_LIB_AESCFB
> 	select CRYPTO_LIB_SHA256
>
> https://elixir.bootlin.com/linux/v6.10-rc6/source/drivers/char/tpm/Kconfi=
g

Yep, it is still a bug, and unmodified IBM vtpm driver must be expected
to work. I was merely saying that there is some window to  fix it properly
instead of duct tape since it is not yet widely enable feature.

I was shocked to see that the implementation has absolutely no checks
whether chip->auth was allocated. I mean anything that would cause
tpm2_sessions_init() not called could trigger null dereference.

So can you test this and see how your test hardware behaves:

https://lore.kernel.org/linux-integrity/20240701170735.109583-1-jarkko@kern=
el.org/T/#u

I'll modify it accrodingly if problems persist. Please put your feedback
over there. I cannot anything but compile test so it could be that
I've ignored something.

BR, Jarkko
