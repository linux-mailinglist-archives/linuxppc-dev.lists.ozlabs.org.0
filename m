Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA74733D2
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 19:18:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JCVBk3l7jz2yPv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Dec 2021 05:18:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=G8llMkyq;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=l+gO/DX1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=G8llMkyq; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=l+gO/DX1; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JCVB30vYGz2yMs
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Dec 2021 05:18:18 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 9378921124;
 Mon, 13 Dec 2021 18:18:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1639419495; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtQ8d+/Axp3K9ITeu3xtcjul+fARTB+MWAgeAY7ES8g=;
 b=G8llMkyqtSY82FpwvCQhlAcn6w1eeAAzzCKiQLREiDT2DKkX36QGiKHbeCLl6yCnTKa74+
 4lQeQOCNZD5bqLp+6OIHyhhSwqsZXESV9Q9YVUccz5RJEvIQeiFzWTuARjxhMlXYuom92/
 v7Yz16k3di3NxyYQAscDXqh84O6payY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1639419495;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=NtQ8d+/Axp3K9ITeu3xtcjul+fARTB+MWAgeAY7ES8g=;
 b=l+gO/DX1Vu/uXhALY45OHtc0N8cE8PsYdcruiRw0rzhYjtSwLhfrkPFCn441EcotXQWX7y
 9OnYaR8zUFBuliCg==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id D3257A3B83;
 Mon, 13 Dec 2021 18:18:14 +0000 (UTC)
Date: Mon, 13 Dec 2021 19:18:13 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
Message-ID: <20211213181813.GV117207@kunlun.suse.cz>
References: <cover.1637862358.git.msuchanek@suse.de>
 <8b30a3c6a4e845eb77f276298424811897efdebf.1637862358.git.msuchanek@suse.de>
 <17153a1c-86c6-6ffd-35d6-5329829661df@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <17153a1c-86c6-6ffd-35d6-5329829661df@linux.vnet.ibm.com>
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
Cc: Mimi Zohar <zohar@linux.ibm.com>, David Howells <dhowells@redhat.com>,
 keyrings@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 Alexander Gordeev <agordeev@linux.ibm.com>, linux-s390@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 James Morris <jmorris@namei.org>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 "Serge E. Hallyn" <serge@hallyn.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Heiko Carstens <hca@linux.ibm.com>,
 linux-crypto@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>,
 Philipp Rudo <prudo@redhat.com>, Frank van der Linden <fllinden@amazon.com>,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 Luis Chamberlain <mcgrof@kernel.org>, Sven Schnelle <svens@linux.ibm.com>,
 linux-security-module@vger.kernel.org, Jessica Yu <jeyu@kernel.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>, buendgen@de.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Sun, Dec 12, 2021 at 07:46:53PM -0500, Nayna wrote:
> 
> On 11/25/21 13:02, Michal Suchanek wrote:
> > Copy the code from s390x
> > 
> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> >   arch/powerpc/Kconfig        | 11 +++++++++++
> >   arch/powerpc/kexec/elf_64.c | 36 ++++++++++++++++++++++++++++++++++++
> >   2 files changed, 47 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index ac0c515552fd..ecc1227a77f1 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -561,6 +561,17 @@ config KEXEC_FILE
> >   config ARCH_HAS_KEXEC_PURGATORY
> >   	def_bool KEXEC_FILE
> > 
> > +config KEXEC_SIG
> > +	bool "Verify kernel signature during kexec_file_load() syscall"
> > +	depends on KEXEC_FILE && MODULE_SIG_FORMAT
> > +	help
> > +	  This option makes kernel signature verification mandatory for
> > +	  the kexec_file_load() syscall.
> > +
> 
> Resending my last response as looks like it didn't go through mailing list
> because of some wrong formatting. My apologies to those who are receiving it
> twice.
> 
> Since powerpc also supports IMA_ARCH_POLICY for kernel image signature
> verification, please include the following:
> 
> "An alternative implementation for the powerpc arch is IMA_ARCH_POLICY. It
> verifies the appended kernel image signature and additionally includes both
> the signed and unsigned file hashes in the IMA measurement list, extends the
> IMA PCR in the TPM, and prevents blacklisted binary kernel images from being
> kexec'd."

It also does blacklist based on the file hash?

There is a downstream patch that adds the support for the module
signatures, and when the code is reused for KEXEC_SIG the blacklist
also applies to it.

Which kind of shows that people really want to use the IMA features but
with no support on some major architectures it's not going to work.

Thanks

Michal
