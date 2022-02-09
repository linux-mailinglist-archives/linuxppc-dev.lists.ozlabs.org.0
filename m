Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 880034AF093
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 13:02:45 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jtz5t6dJ5z3cB2
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 23:02:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=sdbcAuWy;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Oo2ysnH3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=sdbcAuWy; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Oo2ysnH3; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jtz566Mdsz2xKJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 23:02:02 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 2A13E210F6;
 Wed,  9 Feb 2022 12:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1644408118; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbZCw5rIaTc581CofTm5RKNj168VfrUKC3PEf3yNJXc=;
 b=sdbcAuWyyIEpleCPbc7tCM4hFhjFye2d5v7LQDJSFpzC0JLPIccPCsBmkoLPWG8MAi7d77
 AOIur6RdFgAGxcXsRILphY4x1DVcn6X+GljqJZv4lN7zTIDpbrEDowthCl8BWuQKkr14+c
 z+6eeJ/LhcwOQSJsQYYg+/ynfNTSqdo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1644408118;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BbZCw5rIaTc581CofTm5RKNj168VfrUKC3PEf3yNJXc=;
 b=Oo2ysnH3fNpE75SF4n4C4mpY2I+2zEnqyGx6eFv7xvIpxOb7pIZimrVVFgfInowC+MlQjL
 1bRbxBqEkgC+AJCQ==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 58DF0A3B88;
 Wed,  9 Feb 2022 12:01:55 +0000 (UTC)
Date: Wed, 9 Feb 2022 13:01:54 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Subject: Re: [PATCH v5 2/6] powerpc/kexec_file: Add KEXEC_SIG support.
Message-ID: <20220209120154.GC3113@kunlun.suse.cz>
References: <cover.1641900831.git.msuchanek@suse.de>
 <d95f7c6865bcad5ee37dcbec240e79aa742f5e1d.1641900831.git.msuchanek@suse.de>
 <b56fe3a2-b145-9d4e-acf2-4991204b3102@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b56fe3a2-b145-9d4e-acf2-4991204b3102@molgen.mpg.de>
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
 Herbert Xu <herbert@gondor.apana.org.au>, Baoquan He <bhe@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
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

On Wed, Feb 09, 2022 at 07:44:15AM +0100, Paul Menzel wrote:
> Dear Michal,
> 
> 
> Thank you for the patch.
> 
> 
> Am 11.01.22 um 12:37 schrieb Michal Suchanek:
> 
> Could you please remove the dot/period at the end of the git commit message
> summary?

Sure

> > Copy the code from s390x
> > 
> > Both powerpc and s390x use appended signature format (as opposed to EFI
> > based patforms using PE format).
> 
> patforms → platforms

Thanks for noticing

> How can this be tested?

Apparently KEXEC_SIG_FORCE is x86 only although the use of the option is
arch neutral:

arch/x86/Kconfig:config KEXEC_SIG_FORCE
kernel/kexec_file.c:            if (IS_ENABLED(CONFIG_KEXEC_SIG_FORCE))
{

Maybe it should be moved?

I used a patched kernel that enables lockdown in secure boot, and then
verified that signed kernel can be loaded by kexec and unsigned not,
with KEXEC_SIG enabled and IMA_KEXEC disabled.

The lockdown support can be enabled on any platform, and although I
can't find it documented anywhere there appears to be code in kexec_file
to take it into account:
kernel/kexec.c: result = security_locked_down(LOCKDOWN_KEXEC);
kernel/kexec_file.c:                security_locked_down(LOCKDOWN_KEXEC))
kernel/module.c:        return security_locked_down(LOCKDOWN_MODULE_SIGNATURE);
kernel/params.c:            security_locked_down(LOCKDOWN_MODULE_PARAMETERS))
and lockdown can be enabled with a buildtime option, a kernel parameter, or a
debugfs file.

Still for testing lifting KEXEC_SIG_FORCE to some arch-neutral Kconfig file is
probably the simplest option.

kexec -s option should be used to select kexec_file rather than the old
style kexec which would either fail always or succeed always regardelss
of signature.

> > Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> > ---
> > v3: - Philipp Rudo <prudo@redhat.com>: Update the comit message with
> >        explanation why the s390 code is usable on powerpc.
> >      - Include correct header for mod_check_sig
> >      - Nayna <nayna@linux.vnet.ibm.com>: Mention additional IMA features
> >        in kconfig text
> > ---
> >   arch/powerpc/Kconfig        | 16 ++++++++++++++++
> >   arch/powerpc/kexec/elf_64.c | 36 ++++++++++++++++++++++++++++++++++++
> >   2 files changed, 52 insertions(+)
> > 
> > diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> > index dea74d7717c0..1cde9b6c5987 100644
> > --- a/arch/powerpc/Kconfig
> > +++ b/arch/powerpc/Kconfig
> > @@ -560,6 +560,22 @@ config KEXEC_FILE
> >   config ARCH_HAS_KEXEC_PURGATORY
> >   	def_bool KEXEC_FILE
> > +config KEXEC_SIG
> > +	bool "Verify kernel signature during kexec_file_load() syscall"
> > +	depends on KEXEC_FILE && MODULE_SIG_FORMAT
> > +	help
> > +	  This option makes kernel signature verification mandatory for
> > +	  the kexec_file_load() syscall.
> > +
> > +	  In addition to that option, you need to enable signature
> > +	  verification for the corresponding kernel image type being
> > +	  loaded in order for this to work.
> > +
> > +	  Note: on powerpc IMA_ARCH_POLICY also implements kexec'ed kernel
> > +	  verification. In addition IMA adds kernel hashes to the measurement
> > +	  list, extends IMA PCR in the TPM, and implements kernel image
> > +	  blacklist by hash.
> 
> So, what is the takeaway for the user? IMA_ARCH_POLICY is preferred? What is
> the disadvantage, and two implementations(?) needed then? More overhead?

IMA_KEXEC does more than KEXEC_SIG. The overhead is probably not big
unless you are trying to really minimize the kernel code size.

Arguably the simpler implementation hass less potential for bugs, too.
Both in code and in user configuration required to enable the feature.

Interestingly IMA_ARCH_POLICY depends on KEXEC_SIG rather than
IMA_KEXEC. Just mind-boggling.

The main problem with IMA_KEXEC from my point of view is it is not portable.
To record the measurements TPM support is requireed which is not available on
all platforms. It does not support PE so it cannot be used on platforms
that use PE kernel signature format.

> 
> > +
> >   config RELOCATABLE
> >   	bool "Build a relocatable kernel"
> >   	depends on PPC64 || (FLATMEM && (44x || FSL_BOOKE))
> > diff --git a/arch/powerpc/kexec/elf_64.c b/arch/powerpc/kexec/elf_64.c
> > index eeb258002d1e..98d1cb5135b4 100644
> > --- a/arch/powerpc/kexec/elf_64.c
> > +++ b/arch/powerpc/kexec/elf_64.c
> > @@ -23,6 +23,7 @@
> >   #include <linux/of_fdt.h>
> >   #include <linux/slab.h>
> >   #include <linux/types.h>
> > +#include <linux/module_signature.h>
> >   static void *elf64_load(struct kimage *image, char *kernel_buf,
> >   			unsigned long kernel_len, char *initrd,
> > @@ -151,7 +152,42 @@ static void *elf64_load(struct kimage *image, char *kernel_buf,
> >   	return ret ? ERR_PTR(ret) : NULL;
> >   }
> > +#ifdef CONFIG_KEXEC_SIG
> > +int elf64_verify_sig(const char *kernel, unsigned long kernel_len)
> > +{
> > +	const unsigned long marker_len = sizeof(MODULE_SIG_STRING) - 1;
> > +	struct module_signature *ms;
> > +	unsigned long sig_len;
> 
> Use size_t to match the signature of `verify_pkcs7_signature()`?

Nope. struct module_signature uses unsigned long, and this needs to be
matched to avoid type errors on 32bit.

Technically using size_t for in-memory buffers is misguided because
AFAICT no memory buffer can be bigger than ULONG_MAX, and size_t is
non-native type on 32bit.

Sure, the situation with ssize_t/int is different but that's not what we
are dealing with here.

Thanks

Michal
