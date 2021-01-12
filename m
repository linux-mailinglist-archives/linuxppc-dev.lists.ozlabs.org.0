Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 46FD42F3B9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Jan 2021 21:46:44 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DFjKs1DtnzDrRd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 07:46:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=mZYw9S7J; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DFjJ43dmHzDr6w
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 07:45:08 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3C5A322DFA;
 Tue, 12 Jan 2021 20:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610484304;
 bh=6EV3PSRRIdASeuowUAFkcXsesrpHli+gEefyPnm+dvY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mZYw9S7JwjZ2GBclKbnznUziE9VCzkI10RYictFpWWLU/3cq2mtd9VT3xq4Vt1gc+
 03JCn5nskTb5MZRwDY23aAA3rSoPcL7NO9YTWkYBDpNlgIdhwn2jyGKJTI0KmcG8Tw
 GcKqSLYybezYqcsz8tKmfEhowVjK0oiYepXsbxtoGvK92pbEVfqouw+uAbte3GOOnz
 ln5oFNLXa6RUEdYwcUCG6AZLWrWg+/IQeQQKM8o9rgMt9QWKaT/oKAtuzawGsnmVkR
 0uoX6l2fMbtrmpwxydD/60fX2moN8VupeYNQPJQF2slYF1EyTqJVZ6ZolFQ0I0N4VT
 HZNd5LXsIRvIQ==
Date: Tue, 12 Jan 2021 20:44:31 +0000
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Subject: Re: [PATCH] ASoC: imx-hdmi: Fix warning of the uninitialized
 variable ret
Message-ID: <20210112204431.GH4646@sirena.org.uk>
References: <1608115464-18710-1-git-send-email-shengjiu.wang@nxp.com>
 <20210112181949.GA3241630@ubuntu-m3-large-x86>
 <20210112184848.GG4646@sirena.org.uk>
 <20210112190921.GA3561911@ubuntu-m3-large-x86>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="cfJ13FhsvNR/yOpm"
Content-Disposition: inline
In-Reply-To: <20210112190921.GA3561911@ubuntu-m3-large-x86>
X-Cookie: Stay away from hurricanes for a while.
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>,
 tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com, festevam@gmail.com,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


--cfJ13FhsvNR/yOpm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jan 12, 2021 at 12:09:21PM -0700, Nathan Chancellor wrote:
> On Tue, Jan 12, 2021 at 06:48:48PM +0000, Mark Brown wrote:

> > This is a random warning fix, why would you expect it to be sent as a
> > bug fix?  This is the first indication I've seen that anyone is seeing
> > it in mainline, in general the people who report and fix warnings are
> > doing so based on -next and the patch seems to be from a month ago.  I
> > don't have this in my inbox so I assume it's applied already or needs to
> > be resubmitted anyway.

> Well, I consider compiler warnings bugs. I have had plenty of my
> compiler warning patches sent as bug fixes for an -rc. Furthermore, this
> patch was sent three times by different people, that should give you some
> indication that people are tripping over it.

I really don't have that good a recall of what warning fixes people are
sending, I might notice if I get two versions of the same thing that I
look at at roughly the same time but even with a few hours between it's
most likely that I'll have completely forgotten.  Warning fixes are in
general not memorable, it's not a good sign if they are.  The default
assumption for any warning fix that doesn't say anything else is going
to be that either the issue or the toolchain is very new.

For any kind of fix if you think that things are in some way urgent you
should say something promptly (or provide some indication of this in the
submission if you're sending the fix yourself, such as with a fixes
tag).  If nobody says anything then you should assume that nobody else
is going to be aware of any urgency and that this will affect handling.
Should it happen that things aren't flagged up then of course do so but
consider that this may well be the first time people will be aware
there's any urgency, don't assume that people will have been operating
with information they didn't have.

> The first version was sent on December 11th, it looks like your pull for
> 5.11 went on the December 14th, then the second version was applied on
> December 16th so I figured it might be destined for 5.11 but I could not
> tell (your for-next branch is a merge of your for-5.11 and for-5.12):

If it's on the for-5.11 branch then it will be for 5.11, which it must
be if it was applied then.  If it was and it was applied that long ago
it'll already be queued in Takashi's tree and I guess he didn't send it
on yet.

--cfJ13FhsvNR/yOpm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl/+Ci4ACgkQJNaLcl1U
h9AqTQf9Hd+NaLX8SdaivLSggl2+aq3vh152OKzmXnxVAeMvwXXPL5/73LMlierc
POZ+45qPlmd5XO5IXdmwjCgQ9TWEacSSYKvK66n9taQq2sExQqIOBFtEuC9P/brJ
GwIDJFjHSqdpLHOq9aiqH4/gPHR9bIDQbpXJiQrcib2EPKJzRnq43vSDH705EgUS
QZga5MEbDI3FimHW0j5Q7PMtwDHm0WnDDRqwFFYAABdal9ZQcLQdQnUpSEfLAa6t
Ai8DRIPPXe9JVllrS7TsG911f2XMK/EB/oiTSa+6jBCszuFJRd8wSLZeFIYdxqdV
74KXV6vlSh4JfXlHUbk/Mz4XeuUbuw==
=wfLB
-----END PGP SIGNATURE-----

--cfJ13FhsvNR/yOpm--
