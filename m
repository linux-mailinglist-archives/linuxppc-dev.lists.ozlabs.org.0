Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7207544E33D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 09:31:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HrBdX16vPz3c8t
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Nov 2021 19:31:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=EqAF3455;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=UcES9wR1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=EqAF3455; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=UcES9wR1; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HrBck4Xzvz2yXv
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Nov 2021 19:31:02 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id D49AF21B29;
 Fri, 12 Nov 2021 08:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1636705856; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtLj3iNwCrDsRfTbqCOC7KizGzeolFrA/oblDB2HR6M=;
 b=EqAF3455zC/KRKcNebZ+JmobShL1pKdzZJSTjddFuTEgjasrmJAuMwVnITg7Hg1Kx7SFHi
 4njht0Qdge/PimHhcx/YMBqy+O+r4fM0lVGx9ubDdEOhbqMhOliqM6hU7BciKZ/zWtHPI8
 dmlhKh/P8vxU868YKB8AjJIBe2Jirto=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1636705856;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CtLj3iNwCrDsRfTbqCOC7KizGzeolFrA/oblDB2HR6M=;
 b=UcES9wR1gopMpSYFFC0aHrMvAaIA88hW/HepzePD7xDe7jxEfxxT89WeVu/XkyVMma68Hj
 BakvkkGH35WvjDDw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 76E1BA3B95;
 Fri, 12 Nov 2021 08:30:56 +0000 (UTC)
Date: Fri, 12 Nov 2021 09:30:55 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Nayna <nayna@linux.vnet.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211112083055.GA34414@kunlun.suse.cz>
References: <cover.1635948742.git.msuchanek@suse.de>
 <87czneeurr.fsf@dja-thinkpad.axtens.net>
 <20211105131401.GL11195@kunlun.suse.cz>
 <87a6ifehin.fsf@dja-thinkpad.axtens.net>
 <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hello,

On Thu, Nov 11, 2021 at 05:26:41PM -0500, Nayna wrote:
> 
> On 11/8/21 07:05, Michal Suchánek wrote:
> > Hello,
> > 
> > On Mon, Nov 08, 2021 at 09:18:56AM +1100, Daniel Axtens wrote:
> > > Michal Suchánek <msuchanek@suse.de> writes:
> > > 
> > > > On Fri, Nov 05, 2021 at 09:55:52PM +1100, Daniel Axtens wrote:
> > > > > Michal Suchanek <msuchanek@suse.de> writes:
> > > > > 
> > > > > > S390 uses appended signature for kernel but implements the check
> > > > > > separately from module loader.
> > > > > > 
> > > > > > Support for secure boot on powerpc with appended signature is planned -
> > > > > > grub patches submitted upstream but not yet merged.
> > > > > Power Non-Virtualised / OpenPower already supports secure boot via kexec
> > > > > with signature verification via IMA. I think you have now sent a
> > > > > follow-up series that merges some of the IMA implementation, I just
> > > > > wanted to make sure it was clear that we actually already have support
> > > > So is IMA_KEXEC and KEXEC_SIG redundant?
> > > > 
> > > > I see some architectures have both. I also see there is a lot of overlap
> > > > between the IMA framework and the KEXEC_SIG and MODULE_SIg.
> > > 
> > > Mimi would be much better placed than me to answer this.
> > > 
> > > The limits of my knowledge are basically that signature verification for
> > > modules and kexec kernels can be enforced by IMA policies.
> > > 
> > > For example a secure booted powerpc kernel with module support will have
> > > the following IMA policy set at the arch level:
> > > 
> > > "appraise func=KEXEC_KERNEL_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig",
> > > (in arch/powerpc/kernel/ima_arch.c)
> > > 
> > > Module signature enforcement can be set with either IMA (policy like
> > > "appraise func=MODULE_CHECK appraise_flag=check_blacklist appraise_type=imasig|modsig" )
> > > or with CONFIG_MODULE_SIG_FORCE/module.sig_enforce=1.
> > > 
> > > Sometimes this leads to arguably unexpected interactions - for example
> > > commit fa4f3f56ccd2 ("powerpc/ima: Fix secure boot rules in ima arch
> > > policy"), so it might be interesting to see if we can make things easier
> > > to understand.
> > I suspect that is the root of the problem here. Until distributions pick
> > up IMA and properly document step by step in detail how to implement,
> > enable, and debug it the _SIG options are required for users to be able
> > to make use of signatures.
> 
> For secureboot, IMA appraisal policies are configured in kernel at boot time
> based on secureboot state of the system, refer
> arch/powerpc/kernel/ima_arch.c and security/integrity/ima/ima_efi.c. This
> doesn't require any user configuration. Yes, I agree it would be helpful to
> update kernel documentation specifying steps to sign the kernel image using
> sign-file.
> 
> > 
> > The other part is that distributions apply 'lockdown' patches that change
> > the security policy depending on secure boot status which were rejected
> > by upstream which only hook into the _SIG options, and not into the IMA_
> > options. Of course, I expect this to change when the IMA options are
> > universally available across architectures and the support picked up by
> > distributions.
> > 
> > Which brings the third point: IMA features vary across architectures,
> > and KEXEC_SIG is more common than IMA_KEXEC.
> > 
> > config/arm64/default:CONFIG_HAVE_IMA_KEXEC=y
> > config/ppc64le/default:CONFIG_HAVE_IMA_KEXEC=y
> > 
> > config/arm64/default:CONFIG_KEXEC_SIG=y
> > config/s390x/default:CONFIG_KEXEC_SIG=y
> > config/x86_64/default:CONFIG_KEXEC_SIG=y
> > 
> > KEXEC_SIG makes it much easier to get uniform features across
> > architectures.
> 
> Architectures use KEXEC_SIG vs IMA_KEXEC based on their requirement.
> IMA_KEXEC is for the kernel images signed using sign-file (appended
> signatures, not PECOFF), provides measurement along with verification, and

That's certainly not the case. S390 uses appended signatures with
KEXEC_SIG, arm64 uses PECOFF with both KEXEC_SIG and IMA_KEXEC.

> is tied to secureboot state of the system at boot time.

In distrubutions it's also the case with KEXEC_SIG, it's only upstream
where this is different. I don't know why Linux upstream has rejected
this support for KEXEC_SIG.

Anyway, sounds like the difference is that IMA provides measurement but
if you don't use it it does not makes any difference except more comlex
code.

Thanks

Michal
