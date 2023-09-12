Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8B079D99E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 21:33:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gdzfXuTr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlYfM10Pnz3dWL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Sep 2023 05:33:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=gdzfXuTr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=jarkko@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlYdS55pxz3dTZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Sep 2023 05:32:44 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 9B7BCB81EB2;
	Tue, 12 Sep 2023 19:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD06C433C8;
	Tue, 12 Sep 2023 19:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694547159;
	bh=P84+DgXq81q28j/r5vXJ6K5cI51s58582oXvBjgtG9Y=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=gdzfXuTrCyG1C1XvFcXKjUu09PKYJXWJBN8dT9qYdaD/XX0vm5BykPdYS53gEC7l0
	 pk1jqwC6nIzie2vNlOqx6IgHUHYVRBli9r/HxadWFFLwXYcuIxPfkc38J3AioRDdrX
	 XrPoB9Y5qHb/FUuIV+51Ew9LKsgy8uggD8rxL+DsPBY7sGf+8l+EQIWG9ysSiaMNGM
	 ZkfAgMuHPCWO1a0yNGFCESBr2lvXXCNJcMEM+/ZPgGdltMFgvWoky/XYDpbPIPcn8I
	 wtlCDgc7hX6Z2P1WOD0jGeddpPw24brArpcoMYzXjtKwhkkQuhH4jOqzt5LRla41Qc
	 kgsDMy3ab8BNQ==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 12 Sep 2023 22:32:34 +0300
Message-Id: <CVH6U03GHUXW.3V31YS67OXMQS@suppilovahvero>
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Mimi Zohar" <zohar@linux.ibm.com>, =?utf-8?q?Michal_Such=C3=A1nek?=
 <msuchanek@suse.de>, "Nayna" <nayna@linux.vnet.ibm.com>
X-Mailer: aerc 0.14.0
References: <20230907165224.32256-1-msuchanek@suse.de>
 <20230907173232.GD8826@kitsune.suse.cz>
 <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
 <20230912074116.GL8826@kitsune.suse.cz>
 <CVGUFUEQVCHS.37OA20PNG9EVB@suppilovahvero>
 <afba92bc2961c758d34ab340de207beb0a3b84b0.camel@linux.ibm.com>
In-Reply-To: <afba92bc2961c758d34ab340de207beb0a3b84b0.camel@linux.ibm.com>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James
 Morris <jmorris@namei.org>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue Sep 12, 2023 at 10:22 PM EEST, Mimi Zohar wrote:
> On Tue, 2023-09-12 at 12:49 +0300, Jarkko Sakkinen wrote:
> > On Tue Sep 12, 2023 at 10:41 AM EEST, Michal Such=C3=A1nek wrote:
> > > On Mon, Sep 11, 2023 at 11:39:38PM -0400, Nayna wrote:
> > > >=20
> > > > On 9/7/23 13:32, Michal Such=C3=A1nek wrote:
> > > > > Adding more CC's from the original patch, looks like get_maintain=
ers is
> > > > > not that great for this file.
> > > > >=20
> > > > > On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> > > > > > No other platform needs CA_MACHINE_KEYRING, either.
> > > > > >=20
> > > > > > This is policy that should be decided by the administrator, not=
 Kconfig
> > > > > > dependencies.
> > > >=20
> > > > We certainly agree that flexibility is important. However, in this =
case,
> > > > this also implies that we are expecting system admins to be securit=
y
> > > > experts. As per our understanding, CA based infrastructure(PKI) is =
the
> > > > standard to be followed and not the policy decision. And we can onl=
y speak
> > > > for Power.
> > > >=20
> > > > INTEGRITY_CA_MACHINE_KEYRING ensures that we always have CA signed =
leaf
> > > > certs.
> > >
> > > And that's the problem.
> > >
> > > From a distribution point of view there are two types of leaf certs:
> > >
> > >  - leaf certs signed by the distribution CA which need not be importe=
d
> > >    because the distribution CA cert is enrolled one way or another
> > >  - user generated ad-hoc certificates that are not signed in any way,
> > >    and enrolled by the user
> > >
> > > The latter are vouched for by the user by enrolling the certificate, =
and
> > > confirming that they really want to trust this certificate. Enrolling
> > > user certificates is vital for usability or secure boot. Adding extra
> > > step of creating a CA certificate stored on the same system only
> > > complicates things with no added benefit.
> >=20
> > This all comes down to the generic fact that kernel should not
> > proactively define what it *expects* sysadmins.
> >=20
> > CA based infrastructure like anything is a policy decision not
> > a decision to be enforced by kernel.
>
> Secure boot requires a signature chain of trust.  IMA extends the
> secure and trusted boot concepts to the kernel. Missing from that
> signature chain of trust is the ability of allowing the end
> machine/system owner to load other certificates without recompiling the
> kernel. The introduction of the machine keyring was to address this.
>
> I'm not questioning the end user's intent on loading local or third
> party keys via the normal mechanisms. If the existing mechanism(s) for
> loading local or third party keys were full-proof, then loading a
> single certificate, self-signed or not, would be fine. However, that
> isn't the reality.  The security of the two-stage approach is simply
> not equivalent to loading a single certificate.  Documentation could
> help the end user/system owner to safely create (and manage) separate
> certificate signing and code signing certs.
>
> Unlike UEFI based systems, PowerVM defines two variables trustedcadb
> and moduledb, for storing certificate signing and code signing
> certificates respectively.  First the certs on the trustedcadb are
> loaded and then the ones on moduledb are loaded.

There's pragmatic reasons to make things more open than they should be
in production. As a hardware example I still possess Raspberry Pi 3B for
test workloads because it has a broken TZ implementation. The world is
really bigger than production workloads.

It would be better to document what you said rather than enforce the
right choice IMHO (e.g. extend Kconfig documentation).

BR, Jarkko
