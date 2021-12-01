Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA6B464D4F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 12:49:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3y6q4vVdz305t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Dec 2021 22:49:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=HoFAEUtd;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=lFf3wqoL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=HoFAEUtd; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=lFf3wqoL; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3y651GnBz2yNT
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Dec 2021 22:48:44 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id E8C3D212C2;
 Wed,  1 Dec 2021 11:48:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1638359319; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WrpXoBK/4LwwvZ609Va7mvqZYMz7+OB0m9N/bzmDziw=;
 b=HoFAEUtdm1wIBQkZ8wytWV68qtGZn5Zx5grFcSya42VQirGgSCl6A+DC2vIcZ5TdyxdbTr
 W2NAmwDLCRrnNBybHxojCOdjDjD70hWsiQ6QiXdF+k7JVvpls0tm3Ngx0XWYwG/B7neevV
 w/0YAfAcfrGr1j1OEHqZd2YRZeXZFvw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1638359319;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WrpXoBK/4LwwvZ609Va7mvqZYMz7+OB0m9N/bzmDziw=;
 b=lFf3wqoLPgzv6s+15hy2N/O1nDrvid9mKt3tQRAPUvx23YZo+486dPM+tI4vMosa0+voxm
 ihq/i/mlKzqbKOBA==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 3A7ECA3B81;
 Wed,  1 Dec 2021 11:48:37 +0000 (UTC)
Date: Wed, 1 Dec 2021 12:48:36 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 0/6] KEXEC_SIG with appended signature
Message-ID: <20211201114836.GD117207@kunlun.suse.cz>
References: <cover.1637862358.git.msuchanek@suse.de>
 <20211201023747.GN21646@MiWiFi-R3L-srv>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211201023747.GN21646@MiWiFi-R3L-srv>
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
Cc: Nayna <nayna@linux.vnet.ibm.com>, Mimi Zohar <zohar@linux.ibm.com>,
 Sven Schnelle <svens@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Herbert Xu <herbert@gondor.apana.org.au>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 Jessica Yu <jeyu@kernel.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>, Philipp Rudo <prudo@redhat.com>,
 Frank van der Linden <fllinden@amazon.com>, kexec@lists.infradead.org,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-crypto@vger.kernel.org, linux-security-module@vger.kernel.org,
 Dmitry Kasatkin <dmitry.kasatkin@gmail.com>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Wed, Dec 01, 2021 at 10:37:47AM +0800, Baoquan He wrote:
> Hi,
> 
> On 11/25/21 at 07:02pm, Michal Suchanek wrote:
> > Hello,
> > 
> > This is resend of the KEXEC_SIG patchset.
> > 
> > The first patch is new because it'a a cleanup that does not require any
> > change to the module verification code.
> > 
> > The second patch is the only one that is intended to change any
> > functionality.
> > 
> > The rest only deduplicates code but I did not receive any review on that
> > part so I don't know if it's desirable as implemented.
> 
> Do you have the link of your 1st version?

This is the previous version:
https://lore.kernel.org/lkml/cover.1635948742.git.msuchanek@suse.de/

Thanks

Michal

> And after going through the whole series, it doesn't tell what this
> patch series intends to do in cover-letter or patch log.
> 
> Thanks
> Baoquan
> 
> > 
> > The first two patches can be applied separately without the rest.
> > 
> > Thanks
> > 
> > Michal
> > 
> > Michal Suchanek (6):
> >   s390/kexec_file: Don't opencode appended signature check.
> >   powerpc/kexec_file: Add KEXEC_SIG support.
> >   kexec_file: Don't opencode appended signature verification.
> >   module: strip the signature marker in the verification function.
> >   module: Use key_being_used_for for log messages in
> >     verify_appended_signature
> >   module: Move duplicate mod_check_sig users code to mod_parse_sig
> > 
> >  arch/powerpc/Kconfig                     | 11 +++++
> >  arch/powerpc/kexec/elf_64.c              | 14 ++++++
> >  arch/s390/kernel/machine_kexec_file.c    | 42 ++----------------
> >  crypto/asymmetric_keys/asymmetric_type.c |  1 +
> >  include/linux/module_signature.h         |  1 +
> >  include/linux/verification.h             |  4 ++
> >  kernel/module-internal.h                 |  2 -
> >  kernel/module.c                          | 12 +++--
> >  kernel/module_signature.c                | 56 +++++++++++++++++++++++-
> >  kernel/module_signing.c                  | 33 +++++++-------
> >  security/integrity/ima/ima_modsig.c      | 22 ++--------
> >  11 files changed, 113 insertions(+), 85 deletions(-)
> > 
> > -- 
> > 2.31.1
> > 
> > 
> > _______________________________________________
> > kexec mailing list
> > kexec@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/kexec
> > 
> 
