Return-Path: <linuxppc-dev+bounces-9153-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CE7AACE258
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Jun 2025 18:41:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bCCyd5XyGz2xk5;
	Thu,  5 Jun 2025 02:41:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=195.135.223.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1749055289;
	cv=none; b=mYUktwW2y4DftPXeAGNZaMGa6oUNxHeN+UzMWUq9Kv+Ky/mbV9455zaqCxgmTyN9OYhoi1TLdNKgVbUJMBjeleSkU1jUZUARub4AH6J4BFlieomL6BDnXDEDfMieufdSILKIvYoMfGnCGIXR3J9x5iL5fxJ9NhJwEYCi9de+bnIN+fOcQg2nQFYM1PwzTF94DcQZxkyBtYnKzg7kkVIhvJxowWOAOTHnQtosO91pLOdHK9dJpSM1YaGMt0SeT3ohYt6+u7UdALCRclX3Slysdc6tUfCXj7RU9JysOixrmXcvSPYnBniMID9Uf4aqpcs8Q0Vusnkf8XN/2n4zdZFkWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1749055289; c=relaxed/relaxed;
	bh=0egcYhcf51j/LkwCnpKG56NS3g4NQU4yYCzICMwTCgg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MTVT9Q38fQNvw60Btle//H1d6Nbvf0JXKa10l5Dq6co9JjcQvUPp1L5VWuw3/xzmm/uXSd/68iSAng2UGSXTWesJf5PSFgxtT8d2nP44VLowXa3w5NEqHzjhINKrU1we2RSJPDlnMBdAifGwD9tyqIjFpPgtmBvMMhhGp23txb3fNgb572T+aKsHnc8fL1KAZ2jT7asQZNbG+sraQ7XCmLbQzWgTvfGwG6gfS0F217+uL+cWtvUGJWPUFiKyxYDUdamHjqvlpdiRg0k0tMbG628Nj6oKxqJ9wK1pMGsKTffSG8ak9SrE+Bs8rcBWVVzFgwfpqThtKnhS43qLLP/hJg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de; dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EIgnawx2; dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UQ1Fgfvm; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EIgnawx2; dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UQ1Fgfvm; dkim-atps=neutral; spf=pass (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org) smtp.mailfrom=suse.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EIgnawx2;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UQ1Fgfvm;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EIgnawx2;
	dkim=neutral header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UQ1Fgfvm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.de (client-ip=195.135.223.131; helo=smtp-out2.suse.de; envelope-from=msuchanek@suse.de; receiver=lists.ozlabs.org)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bCCyc3Ycgz2xGv
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Jun 2025 02:41:28 +1000 (AEST)
Received: from kitsune.suse.cz (unknown [10.100.12.127])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 1D29D20209;
	Wed,  4 Jun 2025 16:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749055281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0egcYhcf51j/LkwCnpKG56NS3g4NQU4yYCzICMwTCgg=;
	b=EIgnawx2HdMThsgyIJTmhuAupLMZsQV2hpSmN8+0vIcjkFS+sEX/wVBd/yQTM9nx5q6Cjl
	mjC3YPfSJyh6BUNTSNZgBEBhKfNRGOX07PhVuc83T9ow+oINElJQ9+mwJMajWSv4F4sXdZ
	x4jigFchjBMHOBMaFZqjOV3AucYoJYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749055281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0egcYhcf51j/LkwCnpKG56NS3g4NQU4yYCzICMwTCgg=;
	b=UQ1Fgfvmbzl2TK9I3IIA/dGIvUjazWn+4niLAhZ7JSAPh/POMnL7L4Ob0ovDX27ctzdNIX
	iSkkLJPVBdWXf8DA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1749055281; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0egcYhcf51j/LkwCnpKG56NS3g4NQU4yYCzICMwTCgg=;
	b=EIgnawx2HdMThsgyIJTmhuAupLMZsQV2hpSmN8+0vIcjkFS+sEX/wVBd/yQTM9nx5q6Cjl
	mjC3YPfSJyh6BUNTSNZgBEBhKfNRGOX07PhVuc83T9ow+oINElJQ9+mwJMajWSv4F4sXdZ
	x4jigFchjBMHOBMaFZqjOV3AucYoJYI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1749055281;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0egcYhcf51j/LkwCnpKG56NS3g4NQU4yYCzICMwTCgg=;
	b=UQ1Fgfvmbzl2TK9I3IIA/dGIvUjazWn+4niLAhZ7JSAPh/POMnL7L4Ob0ovDX27ctzdNIX
	iSkkLJPVBdWXf8DA==
Date: Wed, 4 Jun 2025 18:41:20 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Srish Srinivasan <ssrish@linux.ibm.com>
Cc: linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
	christophe.leroy@csgroup.eu, naveen@kernel.org, ajd@linux.ibm.com,
	zohar@linux.ibm.com, nayna@linux.ibm.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] powerpc/secvar: Expose secvars relevant to the
 key management mode
Message-ID: <aEB3MPAYeAaFVpTc@kitsune.suse.cz>
References: <20250521105759.8408-1-ssrish@linux.ibm.com>
 <20250521105759.8408-3-ssrish@linux.ibm.com>
 <aDATahmPIsOmiFAK@kitsune.suse.cz>
 <7dcd0f77-852b-4f4c-9842-f1d96e1d8b65@linux.ibm.com>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7dcd0f77-852b-4f4c-9842-f1d96e1d8b65@linux.ibm.com>
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-0.993];
	MIME_GOOD(-0.10)[text/plain];
	MIME_TRACE(0.00)[0:+];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.ozlabs.org,linux.ibm.com,ellerman.id.au,gmail.com,csgroup.eu,kernel.org];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[]
X-Spam-Level: 
X-Spam-Score: -4.30
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, May 29, 2025 at 10:39:58PM +0530, Srish Srinivasan wrote:
> 
> On 5/23/25 11:49 AM, Michal Suchánek wrote:
> > Hello,
> > 
> > On Wed, May 21, 2025 at 04:27:58PM +0530, Srish Srinivasan wrote:
> > > The PLPKS enabled PowerVM LPAR sysfs exposes all of the secure boot
> > > secvars irrespective of the key management mode.
> > > 
> > > The PowerVM LPAR supports static and dynamic key management for secure
> > > boot. The key management option can be updated in the management
> > > console. Only in the dynamic key mode can the user modify the secure
> > > boot secvars db, dbx, grubdb, grubdbx, and sbat, which are exposed via
> > > the sysfs interface. But the sysfs interface exposes these secvars even
> > > in the static key mode. This could lead to errors when reading them or
> > > writing to them in the static key mode.
> > would it cause an error when reading these variables or only when
> > writing them?
> > 
> > Thanks
> > 
> > Michal
> 
> Hi Michal,
> Thanks for taking a look.
> 
> 
> Yes, when PKS is enabled without enabling dynamic key secure boot, the
> secvars
> are NOT yet initialized with the default keys built into the binaries, and
> therefore
> reading them will result in an error.

That suggests that 'cannot be written' as said in the documentation and
commit message, which would imply readonly, is misleading. The value is
not accessible at all.

> Now, while in static key management mode with PKS enabled, if one tries to
> populate secvars that are relevant to dynamic key management, the write does
> not fail as long as the "Platform KeyStore Signed Update Infrastructure"
> flag on
> the HMC is enabled and the signed updates are authorized by valid PK/KEK
> keys.

Which suggests that some variables can if fact be written

> However, secvars like db and grubdb populated while in static key management
> mode are not used by the Partition Firmware or grub as SB_VERSION is not
> present,

but are not used until the key management is switched to dynamic

> i.e dynamic key secure boot has not been enabled yet. In this case, when
> there is a
> transition from static key management to dynamic key management, secvars
> with
> the signed update policy bit set will not be overwritten by the hypervisor
> with the
> default keys. Now, if the keys written into these secvars were not the ones
> that were
> used to sign the grub and kernel, it would fail to verify them.

Which is the case even for the case the system is already in dynamic key
mode, unless the variables are append-only.

Thanks

Michal

> These are the reasons behind the decision to expose only those secvars that
> are
> relevant to the key management mode.
> 
> > 
> > 
> > > Expose only PK, trustedcadb, and moduledb in the static key mode to
> > > enable loading of signed third-party kernel modules.
> > > 
> > > Co-developed-by: Souradeep <soura@imap.linux.ibm.com>
> > > Signed-off-by: Souradeep <soura@imap.linux.ibm.com>
> > > Signed-off-by: Srish Srinivasan <ssrish@linux.ibm.com>
> > > Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> > > Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> > > Reviewed-by: Nayna Jain <nayna@linux.ibm.com>
> > > Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>
> > > ---
> > >   Documentation/ABI/testing/sysfs-secvar        |  6 ++++
> > >   arch/powerpc/platforms/pseries/plpks-secvar.c | 28 ++++++++++++++++---
> > >   2 files changed, 30 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/Documentation/ABI/testing/sysfs-secvar b/Documentation/ABI/testing/sysfs-secvar
> > > index 45281888e520..948df3446a03 100644
> > > --- a/Documentation/ABI/testing/sysfs-secvar
> > > +++ b/Documentation/ABI/testing/sysfs-secvar
> > > @@ -37,6 +37,12 @@ Description:	Each secure variable is represented as a directory named as
> > >   		representation. The data and size can be determined by reading
> > >   		their respective attribute files.
> > > +		Only secvars relevant to the key management mode are exposed.
> > > +		Only in the dynamic key mode can the user modify the secure boot
> > > +		secvars db, dbx, grubdb, grubdbx, and sbat. PK, trustedcadb and
> > > +		moduledb are the secvars common to both static and dynamic key
> > > +		management modes.
> > > +
> > >   What:		/sys/firmware/secvar/vars/<variable_name>/size
> > >   Date:		August 2019
> > >   Contact:	Nayna Jain <nayna@linux.ibm.com>
> > > diff --git a/arch/powerpc/platforms/pseries/plpks-secvar.c b/arch/powerpc/platforms/pseries/plpks-secvar.c
> > > index 767e5e8c6990..f9e9cc40c9d0 100644
> > > --- a/arch/powerpc/platforms/pseries/plpks-secvar.c
> > > +++ b/arch/powerpc/platforms/pseries/plpks-secvar.c
> > > @@ -59,7 +59,14 @@ static u32 get_policy(const char *name)
> > >   		return PLPKS_SIGNEDUPDATE;
> > >   }
> > > -static const char * const plpks_var_names[] = {
> > > +static const char * const plpks_var_names_static[] = {
> > > +	"PK",
> > > +	"moduledb",
> > > +	"trustedcadb",
> > > +	NULL,
> > > +};
> > > +
> > > +static const char * const plpks_var_names_dynamic[] = {
> > >   	"PK",
> > >   	"KEK",
> > >   	"db",
> > > @@ -213,21 +220,34 @@ static int plpks_max_size(u64 *max_size)
> > >   	return 0;
> > >   }
> > > +static const struct secvar_operations plpks_secvar_ops_static = {
> > > +	.get = plpks_get_variable,
> > > +	.set = plpks_set_variable,
> > > +	.format = plpks_secvar_format,
> > > +	.max_size = plpks_max_size,
> > > +	.config_attrs = config_attrs,
> > > +	.var_names = plpks_var_names_static,
> > > +};
> > > -static const struct secvar_operations plpks_secvar_ops = {
> > > +static const struct secvar_operations plpks_secvar_ops_dynamic = {
> > >   	.get = plpks_get_variable,
> > >   	.set = plpks_set_variable,
> > >   	.format = plpks_secvar_format,
> > >   	.max_size = plpks_max_size,
> > >   	.config_attrs = config_attrs,
> > > -	.var_names = plpks_var_names,
> > > +	.var_names = plpks_var_names_dynamic,
> > >   };
> > >   static int plpks_secvar_init(void)
> > >   {
> > > +	u8 mode;
> > > +
> > >   	if (!plpks_is_available())
> > >   		return -ENODEV;
> > > -	return set_secvar_ops(&plpks_secvar_ops);
> > > +	mode = plpks_get_sb_keymgmt_mode();
> > > +	if (mode)
> > > +		return set_secvar_ops(&plpks_secvar_ops_dynamic);
> > > +	return set_secvar_ops(&plpks_secvar_ops_static);
> > >   }
> > >   machine_device_initcall(pseries, plpks_secvar_init);
> > > -- 
> > > 2.47.1
> > > 
> > > 
> 

