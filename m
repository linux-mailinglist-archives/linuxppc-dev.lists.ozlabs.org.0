Return-Path: <linuxppc-dev+bounces-11876-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C6BAB48850
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Sep 2025 11:25:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cL1lX24pLz2yPS;
	Mon,  8 Sep 2025 19:25:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f9:3051:3f93::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757323544;
	cv=none; b=PLtjqcaIXPEOCyEEETuC1JC3DC74TYYJRYJ46WcNPtkJlxgveVNWyD+6Nc0GCO4Vd+6xw2j/7x58x4d5ULwLsFpYeU7f1xfUoKu9DRzuFbPIrv/AotMFTJXRdxMDUXM/1oLbqHBgInaasmVP0bCLeYZ9TeMXOXsALrIAL2QqOxL5Z7/Z9Px46oQz38Ld12PZNT1QZ7bBOrmCtNzyb8Tg9OGJJNC0p2kZdBPOZSQbURR4C5d3UbBD/wNyM2lbVTDfX/WJyAxhoBzL4ofV/Cig14nj/AMYSZvx0CXddom2va9YSUoqgzBTaZmQDAYuPBgcGPYxfjHRnFN2aCinbhJjPw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757323544; c=relaxed/relaxed;
	bh=pTFYiTI8ePoaDuW+Jzm5Ukr7hndBQDJeeMFL6xd+vjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JnoaUoqliRlRC0XUNyb0Ai0woxvbiPaVQDyXa5sSqJ47OjPVHoc83QXg8TmHOqo8sAecow+1CfCGXULBH7t7s1Je2L6AIs4D9ozoticXW94g+BS9B4sTrgT30kNQZxr98YEhddUa7mj59kwFueWwUBOgSG6jJej3kjOZYutJ0HJTxcO0smjr4SONMAd3Ah9g54WfqGG4FBlH8sWziIvBwqPTUUZ9NreZ8HmM7gxEltIJ0aHOQaHVjNuwRZghJ6NJOWe9LOPz/BNl7JT6glG8VJZySbrcGRR3YF7SGzrHekvMNc/DMNRKmKwk/iKcFHm0XLJyAwH+ozK90t4X/x3Rbg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de; dkim=fail (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Z1nkeBvp reason="signature verification failed"; dkim-atps=neutral; spf=pass (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org) smtp.mailfrom=alien8.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (4096-bit key; unprotected) header.d=alien8.de header.i=@alien8.de header.a=rsa-sha256 header.s=alien8 header.b=Z1nkeBvp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=alien8.de (client-ip=2a01:4f9:3051:3f93::2; helo=mail.alien8.de; envelope-from=bp@alien8.de; receiver=lists.ozlabs.org)
Received: from mail.alien8.de (mail.alien8.de [IPv6:2a01:4f9:3051:3f93::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cL1lS5mvCz2xQ6
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Sep 2025 19:25:36 +1000 (AEST)
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5A4A540E01A5;
	Mon,  8 Sep 2025 09:25:28 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=fail (4096-bit key)
	reason="fail (body has been altered)" header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 7s5Yx-duyol7; Mon,  8 Sep 2025 09:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1757323514; bh=u4qtBOrEcvr/i1pRga+z9xPfqiyhYrJPtEKHxUcFniQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1nkeBvpkTu/gPHOzI97EwwiHRI7x3O51S+p47ynJaKa/2OfHrSM5QWYiW2UiVAIt
	 wd/I/t7Wh1HKSVqq1gCC6DP0E9GzPK3sUY45wa9dYIEeydLxr+69khpMfelB2Dtaiz
	 hayVfNfCmR36yqf3bFCdT9cqwEvt0tqnh8pqElC6k8buRuuLlsYWd3L/Vg/RRhZibs
	 fvACbsKvnsrnG/nQHyQ6AT6YgVvv2eRhd2BM5efqUoe98v8j+k+JfC6eGToUEFh26m
	 CC3oPbeXihbUlL94uWW64uf6AmahwU7tVVBMsFuElETGqadl3V0S7SlOfOBNKdVTem
	 sYO7HTRFc5UE637PQOylo33PzUweaKlEyjFpspvqqN28cxVUbHk3Kj1qWIHjqiekVu
	 oO+Kr0+RjtVcpJLM0K9136+LsA0njAwUueUvEuWDULVLo334z8BqmTwTNLzcTGLKJB
	 3+qxsYjOtKUut0NL1dbW+e6HVSMGUgCQACDXeWflbQTMEVzrc2L+knWE/QA6U4TexK
	 qpMeHMwbGxxuIOiL2QL7y31nAnoyA5HTNx6Ei2IQYVJAybBVhOdC4P2d/JfRNBSY2d
	 R4NTEihlGI7QqgtMDXc4MPyrWVmvQruflOcWHSp4JrTZP03/f8MdouGoxRzw25AyVK
	 VeW1t/QnT4N790FqN/m5Jg/M=
Received: from zn.tnic (p5de8ed27.dip0.t-ipconnect.de [93.232.237.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 4182740E01A3;
	Mon,  8 Sep 2025 09:24:27 +0000 (UTC)
Date: Mon, 8 Sep 2025 11:24:24 +0200
From: Borislav Petkov <bp@alien8.de>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Eduardo Valentin <edubezval@gmail.com>, Keerthy <j-keerthy@ti.com>,
	Ben Horgan <ben.horgan@arm.com>,
	zhenglifeng <zhenglifeng1@huawei.com>,
	Zhang Rui <rui.zhang@intel.com>, Len Brown <lenb@kernel.org>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Beata Michalska <beata.michalska@arm.com>,
	Fabio Estevam <festevam@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Yicong Yang <yangyicong@hisilicon.com>, linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/6] cpufreq: use __free() for all cpufreq_cpu_get()
 references
Message-ID: <20250908092424.GEaL6gyNdH8oa_oTyq@fat_crate.local>
References: <20250905132413.1376220-1-zhangzihuan@kylinos.cn>
 <20250905174928.GFaLsiqKV36JDowX94@fat_crate.local>
 <a968c6da-265a-405c-8f79-cf0474c80bc5@kylinos.cn>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <a968c6da-265a-405c-8f79-cf0474c80bc5@kylinos.cn>
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.2 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 08, 2025 at 05:12:37PM +0800, Zihuan Zhang wrote:
> > From: Documentation/process/submitting-patches.rst
> >=20
> > Don't get discouraged - or impatient
> > ------------------------------------
> >=20
> > After you have submitted your change, be patient and wait.  Reviewers=
 are
> > busy people and may not get to your patch right away.
> >=20
> > Once upon a time, patches used to disappear into the void without com=
ment,
> > but the development process works more smoothly than that now.  You s=
hould
> > receive comments within a week or so; if that does not happen, make s=
ure
> > that you have sent your patches to the right place.  Wait for a minim=
um of
> > one week before resubmitting or pinging reviewers - possibly longer d=
uring
> > busy times like merge windows.
> Sorry for the noise. I=E2=80=99ll split the patchset and avoid CC=E2=80=
=99ing unnecessary
> people in the future.

I don't think you read what I sent you. Lemme spell it out: you're suppos=
ed to
*wait* to gather review feedback, at least a week. While waiting,
*incorporate* or *address* all that feedback and *then* send a new set.

If you keep spamming people like that, you'll accomplish the opposite of =
what
you're trying to do.

And while waiting you can read our documentation on the community process=
 so
that you know what to do in the future.

--=20
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette

