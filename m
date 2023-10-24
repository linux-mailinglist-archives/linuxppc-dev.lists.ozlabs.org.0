Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 287BA7D480C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 09:10:43 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Iq4nMqJF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GrXfpeE3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF39r6WMtz3cSv
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 18:10:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=Iq4nMqJF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=GrXfpeE3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.28; helo=out4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF38v3bvRz2y1l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 18:09:50 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9C7A65C021E;
	Tue, 24 Oct 2023 03:09:47 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 24 Oct 2023 03:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698131387; x=1698217787; bh=VA
	PNQYkTt0iwP9E8BmBBBQ+AGuWLrzjahGWfYfAXDTU=; b=Iq4nMqJFt+QLEijmKe
	DhAWakAxAABCKSDqfnaR7YZKp4C6NkJZ7ND4rULfLCcWRIEj58zanM9wGS2zfa9Y
	zigc9N6twVfBtoHb/7q4T963hfjST3MCVZ69hA4FycedX/nr9jIzsex4nucM165b
	8S8lq3MNfxN8fNi8+2PM3PuPa6UGG93xLRMvbARixKI5IKAQRtgmx3clr8nTEZSt
	+g1ZXJDAC6vM+1+xWssNnwtYQ6mtYd/Chgcy92evrvdUNiEnzAkCM50GbexM/Zyf
	X+w5MwhnYlmccfEa/uRh05Yi8KNQhavZRGBkeCTeru9JfgYC3qFr4kJkJzvnsDXD
	BRyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698131387; x=1698217787; bh=VAPNQYkTt0iwP
	9E8BmBBBQ+AGuWLrzjahGWfYfAXDTU=; b=GrXfpeE3r3mgoKD0ZLFpG4MFcGkPs
	64U5UZhK0ca0Gplz9Bo7SHqhv+yZmBg+COuY1I1hzcwBcVJ/jeWSVRTdCHCPzh29
	Kf/ZA6fC4x18y/S770OfsOykJYvIHKs348pkPCngIVeSm+SxUEDlFqXWvmPKzfPr
	19nTjJuvTXn2bftghg3s2Br7hXIAZlt3TGJDuL+Nj+kgVCpLaTtCWjaNDShU+YBP
	SFyHmxcYrpUUGVEcf5ijCNaA2AE2zpUSLSeaiQUURwLVEtCLsUeltQzwAFp3jhBR
	MJQCUQUBSM+v/yfA32pWu79lRI9MEuCNPnLIOA0EbWWMz1KsiIL/sN9uA==
X-ME-Sender: <xms:um03ZWPcUaARydLqvs68I6lWKmGM1lbzSfWN9_Lu9NVM9N2EJ_ZYLQ>
    <xme:um03ZU_kFRyvhhqgqIPu6p9yGytDuavIAk75-G3JSaDMBvupJxjGRMXhgGgr0AFpv
    c3RSw_wD2oszbOt7r4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkeejgdduudefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:um03ZdSHpZIMBHo6YJ0_yJY7RCmTPHB9QDYVFmh_XfY1vkLCmcXWMQ>
    <xmx:um03ZWu51nw9UtGXRtOtrGUEjeKyLRGpza2YE-MJX8GsFuL-HgwbYg>
    <xmx:um03ZefY6gYyhDw_MtxykWTZxyR5xK8QSZlz4O1_b9SxIPPOQV6z3g>
    <xmx:u203ZYFkf9pGyGvQPIRJAR1V8T0paAznFA4dDWl74L2MPtnR-nhSGw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id DE6A7B60089; Tue, 24 Oct 2023 03:09:45 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <b771991b-46fe-4eab-bcad-2325acf90d80@app.fastmail.com>
In-Reply-To: <ZTdDy8ScUPxJOBHs@MiWiFi-R3L-srv>
References: <20231023110308.1202042-1-arnd@kernel.org>
 <20231023110308.1202042-2-arnd@kernel.org> <ZTdALtO2rN4FaneC@MiWiFi-R3L-srv>
 <ZTdDy8ScUPxJOBHs@MiWiFi-R3L-srv>
Date: Tue, 24 Oct 2023 09:09:25 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Baoquan He" <bhe@redhat.com>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 2/2] kexec: select CRYPTO from KEXEC_FILE instead of depending on
 it
Content-Type: text/plain
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
Cc: Peter Zijlstra <peterz@infradead.org>, Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Eric DeVolder <eric.devolder@oracle.com>, Ard Biesheuvel <ardb@kernel.org>, Costa Shulyupin <costa.shul@redhat.com>, linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Vivek Goyal <vgoyal@redhat.com>, Sven Schnelle <svens@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Hari Bathini <hbathini@linux.ibm.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, linux-crypto@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-de
 v@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 24, 2023, at 06:10, Baoquan He wrote:
> On 10/24/23 at 11:55am, Baoquan He wrote:
>> On 10/23/23 at 01:01pm, Arnd Bergmann wrote:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> > 
>> > All other users of crypto code use 'select' instead of 'depends on',
>> > so do the same thing with KEXEC_FILE for consistency.
>> > 
>> > In practice this makes very little difference as kernels with kexec
>> > support are very likely to also include some other feature that already
>> > selects both crypto and crypto_sha256, but being consistent here helps
>> > for usability as well as to avoid potential circular dependencies.
>> > 
>> > This reverts the dependency back to what it was originally before commit
>> > 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for
>> > new syscall"), which changed changed it with the comment "This should
>>                        ~~~~~~~~~~~~~~ typo
>> > be safer as "select" is not recursive", but that appears to have been
>> > done in error, as "select" is indeed recursive, and there are no other
>> > dependencies that prevent CRYPTO_SHA256 from being selected here.
>> > 
>> > Fixes: 74ca317c26a3f ("kexec: create a new config option CONFIG_KEXEC_FILE for new syscall")
>> > Cc: Herbert Xu <herbert@gondor.apana.org.au>
>> > Cc: "David S. Miller" <davem@davemloft.net>
>> > Cc: linux-crypto@vger.kernel.org
>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> > ---
>> >  kernel/Kconfig.kexec | 3 ++-
>> >  1 file changed, 2 insertions(+), 1 deletion(-)
>> 
>> LGTM,
>> 
>> Acked-by: Baoquan He <bhe@redhat.com>
>
> Sorry, the patch 1/2 is not sent to me and kexec mailing list, so I
> didn't get the intention of the entire patchset. I need hold the ack
> until I read the patch 1. I have some concerns about patch 1 if I didn't
> misunderstand it. Will come back later when patch 1 reviewing is
> finished.

Sorry about missing you on Cc. If anyone else is looking for the
patch, it's archived at
https://lore.kernel.org/lkml/20231023110308.1202042-1-arnd@kernel.org/

The idea of patch 1 was only to address the build regression on
x86, so I was hoping that part would be uncontroversial. I split
out patch 2/2 since that is intended to actually change the behavior,
hopefully for the better.

I introduced a new regression on riscv that Conor Dooley found, and
that should already be fixed now. It looks like we may need a similar
change on s390

--- a/arch/s390/Kbuild
+++ b/arch/s390/Kbuild
@@ -7,7 +7,7 @@ obj-$(CONFIG_S390_HYPFS)        += hypfs/
 obj-$(CONFIG_APPLDATA_BASE)    += appldata/
 obj-y                          += net/
 obj-$(CONFIG_PCI)              += pci/
-obj-$(CONFIG_ARCH_SUPPORTS_KEXEC_PURGATORY) += purgatory/
+obj-$(CONFIG_KEXEC_FILE)       += purgatory/
 
 # for cleaning
 subdir- += boot tools

but I haven't tested that, and I'll wait for your reply then.

    Arnd
