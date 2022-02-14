Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C82F84B5570
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Feb 2022 16:56:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jy82y2LfVz3cPv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Feb 2022 02:56:10 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=u2FyfK++;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=DZL+qohe;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.29; helo=smtp-out2.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=u2FyfK++; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=DZL+qohe; 
 dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jy82F1r0wz3bXR
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Feb 2022 02:55:32 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id A75051F38B;
 Mon, 14 Feb 2022 15:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644854129; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k9MmC9qkXYRWrTYfRcCJEivsJms60nX4tIrMOUzEtWM=;
 b=u2FyfK++GVdTzQOjqWcqZGLBUUzrDhYKtU57FNklJOt/e4NK7Ftz0UbOcIPXvf2tiz8yjC
 lOg4m1lH1HgqVUk5WhL9P0848EpI0TeXdVvzmIRoxnDQUtvmgcKuSfY1LwMOO9hOAfDpie
 JLjWKG8CZYhVYy8OF3M7nq+jfqPZ6Gw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644854129;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=k9MmC9qkXYRWrTYfRcCJEivsJms60nX4tIrMOUzEtWM=;
 b=DZL+qoheqv/LmFulfWwBj6ooEqSB1jfA3QUYZzmGmg+dkmwxT83ob8JmlxLvtLwJu6Pvpa
 ANP+ga/h5qpfxHCg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id E4E27A3B89;
 Mon, 14 Feb 2022 15:55:25 +0000 (UTC)
Date: Mon, 14 Feb 2022 16:55:24 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
Message-ID: <20220214155524.GN3113@kunlun.suse.cz>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
 <cff97dbe262919ff709a5ad2c4af6a702cc72a95.camel@linux.ibm.com>
 <a8d717a44e5e919676e9b1e197cac781db46da87.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8d717a44e5e919676e9b1e197cac781db46da87.camel@linux.ibm.com>
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Sven Schnelle <svens@linux.ibm.com>,
 David Howells <dhowells@redhat.com>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>,
 Baoquan He <bhe@redhat.com>, Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, linux-crypto@vger.kernel.org,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Mon, Feb 14, 2022 at 10:14:16AM -0500, Mimi Zohar wrote:
> Hi Michal,
> 
> On Sun, 2022-02-13 at 21:59 -0500, Mimi Zohar wrote:
> 
> > 
> > On Tue, 2022-01-11 at 12:37 +0100, Michal Suchanek wrote:
> > > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > > index dea74d7717c0..1cde9b6c5987 100644
> > > --- a/arch/powerpc/Kconfig
> > > +++ b/arch/powerpc/Kconfig
> > > @@ -560,6 +560,22 @@ config KEXEC_FILE
> > >  config ARCH_HAS_KEXEC_PURGATORY
> > >         def_bool KEXEC_FILE
> > >  
> > > +config KEXEC_SIG
> > > +       bool "Verify kernel signature during kexec_file_load() syscall"
> > > +       depends on KEXEC_FILE && MODULE_SIG_FORMAT
> > > +       help
> > > +         This option makes kernel signature verification mandatory for

This is actually wrong. KEXEC_SIG makes it mandatory that any signature
that is appended is valid and made by a key that is part of the platform
keyiring (which is also wrong, built-in keys should be also accepted).
KEXEC_SIG_FORCE or an IMA policy makes it mandatory that the signature
is present.

> > > +         the kexec_file_load() syscall.
> > 
> > When KEXEC_SIG is enabled on other architectures, IMA does not define a
> > kexec 'appraise' policy rule.  Refer to the policy rules in
> > security/ima/ima_efi.c.  Similarly the kexec 'appraise' policy rule in

I suppose you mean security/integrity/ima/ima_efi.c

I also think it's misguided because KEXEC_SIG in itself does not enforce
the signature. KEXEC_SIG_FORCE does.

> > arch/powerpc/kernel/ima_policy.c should not be defined.

I suppose you mean arch/powerpc/kernel/ima_arch.c - see above.


Thanks for taking the time to reseach and summarize the differences.

> The discussion shouldn't only be about IMA vs. KEXEC_SIG kernel image
> signature verification.  Let's try and reframe the problem a bit.
> 
> 1. Unify and simply the existing kexec signature verification so
> verifying the KEXEC kernel image signature works irrespective of
> signature type - PE, appended signature.
> 
> solution: enable KEXEC_SIG  (This patch set, with the above powerpc IMA
> policy changes.)
> 
> 2. Measure and include the kexec kernel image in a log for attestation,
> if desired.
> 
> solution: enable IMA_ARCH_POLICY 
> - Powerpc: requires trusted boot to be enabled.
> - EFI:   requires  secure boot to be enabled.  The IMA efi policy
> doesn't differentiate between secure and trusted boot.
> 
> 3. Carry the kexec kernel image measurement across kexec, if desired
> and supported on the architecture.
> 
> solution: enable IMA_KEXEC
> 
> Comparison: 
> - Are there any differences between IMA vs. KEXEC_SIG measuring the
> kexec kernel image?
> 
> One of the main differences is "what" is included in the measurement
> list differs.  In both cases, the 'd-ng' field of the IMA measurement
> list template (e.g. ima-ng, ima-sig, ima-modsig) is the full file hash
> including the appended signature.  With IMA and the 'ima-modsig'
> template, an additional hash without the appended signature is defined,
> as well as including the appended signature in the 'sig' field.
> 
> Including the file hash and appended signature in the measurement list
> allows an attestation server, for example, to verify the appended
> signature without having to know the file hash without the signature.

I don't understand this part. Isn't the hash *with* signature always
included, and the distinguishing part about IMA is the hash *without*
signature which is the same irrespective of signature type (PE, appended
xattr) and irrespective of the keyt used for signoing?

> Other differences are already included in the Kconfig KEXEC_SIG "Notes"
> section.

Which besides what is already described above would be blacklisting
specific binaries, which is much more effective if you have hashes of
binaries without signature.

Thanks

Michal
