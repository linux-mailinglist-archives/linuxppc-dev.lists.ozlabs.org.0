Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FCB79C865
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 09:42:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qfpMKXaj;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QkoiDsZl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RlFsj1Skvz3dDw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Sep 2023 17:42:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=qfpMKXaj;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=QkoiDsZl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RlFrp2tXpz3c1M
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Sep 2023 17:41:29 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 3842C215EE;
	Tue, 12 Sep 2023 07:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1694504479; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTICBUf7E+hE+S8045VvIlps+lXGngZTeEQFyd8jt4g=;
	b=qfpMKXajaRD3rIzXEgIGHFvpTNknPjk3p1OXq8hRp7wJsIRjJLDaj53OAHIS5UWF+W4BT5
	J2Wpk5acv0uq49e9ergvHEUjC03/hUMpQT/VueImfd5evSwEf7O45WI2NoKmaPSzLPwZQm
	sSrtfETIYlq2qV6PSB11hDDhvwWMSU4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1694504479;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dTICBUf7E+hE+S8045VvIlps+lXGngZTeEQFyd8jt4g=;
	b=QkoiDsZlT/iyfgcS7nwVRil93cjCF/rjF8cIJyvj/thDtj8fOsw6TrzU+WwKN7S6IecVtx
	LTxSAHn7h7gp6CBQ==
Received: from kitsune.suse.cz (kitsune.suse.cz [10.100.12.127])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 23F502C142;
	Tue, 12 Sep 2023 07:41:17 +0000 (UTC)
Date: Tue, 12 Sep 2023 09:41:16 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH] integrity: powerpc: Do not select CA_MACHINE_KEYRING
Message-ID: <20230912074116.GL8826@kitsune.suse.cz>
References: <20230907165224.32256-1-msuchanek@suse.de>
 <20230907173232.GD8826@kitsune.suse.cz>
 <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <92e23f29-1a16-54da-48d1-59186158e923@linux.vnet.ibm.com>
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
Cc: Eric Snowberg <eric.snowberg@oracle.com>, Paul Moore <paul@paul-moore.com>, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, Nayna Jain <nayna@linux.ibm.com>, James Morris <jmorris@namei.org>, Mimi Zohar <zohar@linux.ibm.com>, linux-kernel@vger.kernel.org, joeyli <jlee@suse.com>, linux-security-module@vger.kernel.org, Jarkko Sakkinen <jarkko@kernel.org>, linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 11, 2023 at 11:39:38PM -0400, Nayna wrote:
> 
> On 9/7/23 13:32, Michal Suchánek wrote:
> > Adding more CC's from the original patch, looks like get_maintainers is
> > not that great for this file.
> > 
> > On Thu, Sep 07, 2023 at 06:52:19PM +0200, Michal Suchanek wrote:
> > > No other platform needs CA_MACHINE_KEYRING, either.
> > > 
> > > This is policy that should be decided by the administrator, not Kconfig
> > > dependencies.
> 
> We certainly agree that flexibility is important. However, in this case,
> this also implies that we are expecting system admins to be security
> experts. As per our understanding, CA based infrastructure(PKI) is the
> standard to be followed and not the policy decision. And we can only speak
> for Power.
> 
> INTEGRITY_CA_MACHINE_KEYRING ensures that we always have CA signed leaf
> certs.

And that's the problem.

From a distribution point of view there are two types of leaf certs:

 - leaf certs signed by the distribution CA which need not be imported
   because the distribution CA cert is enrolled one way or another
 - user generated ad-hoc certificates that are not signed in any way,
   and enrolled by the user

The latter are vouched for by the user by enrolling the certificate, and
confirming that they really want to trust this certificate. Enrolling
user certificates is vital for usability or secure boot. Adding extra
step of creating a CA certificate stored on the same system only
complicates things with no added benefit.

> INTEGRITY_CA_MACHINE_KEYRING_MAX ensures that CA is only allowed to do key
> signing and not code signing.
> 
> Having CA signed certs also permits easy revocation of all leaf certs.

Revocation can be also done be removing the certificate from the keyring.

If the user can add it they should also be able to remove it.

> Loading certificates is completely new for Power Systems. We would like to
> make it as clean as possible from the start. We want to enforce CA signed
> leaf certificates(INTEGRITY_CA_MACHINE_KEYRING). As per
> keyUsage(INTEGRITY_CA_MACHINE_KEYRING_MAX), if we want more flexibility,
> probably a boot time override can be considered.

If boot time override can exist it can as well be made permanent with a
Kconfig option.

I think that a boot time override is even more problematic for security
than a Kconfig option - the kernel arguments are rarely signed.

Thanks

Michal

> 
> Thanks & Regards,
> 
>     - Nayna
> 
> 
> > > 
> > > cc: joeyli <jlee@suse.com>
> > > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > > ---
> > >   security/integrity/Kconfig | 2 --
> > >   1 file changed, 2 deletions(-)
> > > 
> > > diff --git a/security/integrity/Kconfig b/security/integrity/Kconfig
> > > index 232191ee09e3..b6e074ac0227 100644
> > > --- a/security/integrity/Kconfig
> > > +++ b/security/integrity/Kconfig
> > > @@ -68,8 +68,6 @@ config INTEGRITY_MACHINE_KEYRING
> > >   	depends on INTEGRITY_ASYMMETRIC_KEYS
> > >   	depends on SYSTEM_BLACKLIST_KEYRING
> > >   	depends on LOAD_UEFI_KEYS || LOAD_PPC_KEYS
> > > -	select INTEGRITY_CA_MACHINE_KEYRING if LOAD_PPC_KEYS
> > > -	select INTEGRITY_CA_MACHINE_KEYRING_MAX if LOAD_PPC_KEYS
> > >   	help
> > >   	 If set, provide a keyring to which Machine Owner Keys (MOK) may
> > >   	 be added. This keyring shall contain just MOK keys.  Unlike keys
> > > -- 
> > > 2.41.0
> > > 
