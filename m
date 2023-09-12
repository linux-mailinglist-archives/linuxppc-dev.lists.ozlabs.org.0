Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5977979CC62
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 11:50:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ueMO6ien;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlJk11Tmtz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 19:50:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=ueMO6ien;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlJj56yGyz3c3q
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 19:50:01 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 813C3616B6;
	Tue, 12 Sep 2023 09:49:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229BCC43395;
	Tue, 12 Sep 2023 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694512196;
	bh=iIW7ciGWybIARozzfiRHtOz95Ez3pQ72Bb9zv5s25O4=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ueMO6ienw+FxLK4joCzSYY6ODFNbmyw2ZVZS4SLV+q0gdsvP13kQPbNMeRxiYaIex
	 R1tbQO6X4qyb1TOHjTIu8mC1/LYRzfJSV1/FnKongdVWOUbVgrEVumBuw7jiIHfVm4
	 5ajfx+/abCKX3IW0w2UHNVUWFp9+InyfR8w/j5CLy0I0B87ZRTqmBlcIGaq/ZIyMAD
	 PyzPRwlIvc1DMQnL4u5vC4j9RnME2dZ7+U1vTsMJYyff3UHoUjKCB7ESPG6T8yPDa4
	 5IMFWYvqr9Yvxt5YO5BW5Xoj2OgibYec9P7rt77g3nUUlfiMgAHEHs0rUY5eKiM48Y
	 W5WCiv25FzynQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Sep 2023 12:49:52 +0300
Message-Id: <CVGUFUEQVCHS.37OA20PNG9EVB@suppilovahvero>
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: =?utf-8?q?Michal_Such=C3=A1nek?= <msuchanek@suse.de>, "Nayna"
 <nayna@linux.vnet.ibm.com>
X-Mailer: aerc 0.14.0
References: <20230907165224.32256-1-msuchanek@suse.de>
 <20230907173232.GD8826@kitsune.suse.cz>
 <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
 <20230912074116.GL8826@kitsune.suse.cz>
In-Reply-To: <20230912074116.GL8826@kitsune.suse.cz>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E.
 Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 12, 2023 at 10:41 AM EEST, Michal Such=C3=A1nek wrote:
> On Mon, Sep 11, 2023 at 11:39:38PM -0400, Nayna wrote:
> >=20
> > On 9/7/23 13:32, Michal Such=C3=A1nek wrote:
> > > Adding more CC's from the original patch, looks like get_maintainers =
is
> > > not that great for this file.
> > >=20
> > > On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> > > > No other platform needs CA_MACHINE_KEYRING, either.
> > > >=20
> > > > This is policy that should be decided by the administrator, not Kco=
nfig
> > > > dependencies.
> >=20
> > We certainly agree that flexibility is important. However, in this case=
,
> > this also implies that we are expecting system admins to be security
> > experts. As per our understanding, CA based infrastructure(PKI) is the
> > standard to be followed and not the policy decision. And we can only sp=
eak
> > for Power.
> >=20
> > INTEGRITY_CA_MACHINE_KEYRING ensures that we always have CA signed leaf
> > certs.
>
> And that's the problem.
>
> From a distribution point of view there are two types of leaf certs:
>
>  - leaf certs signed by the distribution CA which need not be imported
>    because the distribution CA cert is enrolled one way or another
>  - user generated ad-hoc certificates that are not signed in any way,
>    and enrolled by the user
>
> The latter are vouched for by the user by enrolling the certificate, and
> confirming that they really want to trust this certificate. Enrolling
> user certificates is vital for usability or secure boot. Adding extra
> step of creating a CA certificate stored on the same system only
> complicates things with no added benefit.

This all comes down to the generic fact that kernel should not
proactively define what it *expects* sysadmins.

CA based infrastructure like anything is a policy decision not
a decision to be enforced by kernel.

BR, Jarkko
