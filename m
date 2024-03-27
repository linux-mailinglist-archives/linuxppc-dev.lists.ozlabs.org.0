Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB5588EB16
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 17:23:50 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=P+vdkTPh;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qzE8tHKH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4X6W62D5z3vZn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 03:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=P+vdkTPh;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=qzE8tHKH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.146; helo=fout3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout3-smtp.messagingengine.com (fout3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4X5g0xvdz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:23:02 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.nyi.internal (Postfix) with ESMTP id A1ACF1380097;
	Wed, 27 Mar 2024 12:22:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 27 Mar 2024 12:22:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1711556578; x=1711642978; bh=04/bv9qv/f
	J7b6lD5xQpNrs8Wx7z7kkFDtCrZ28H1cg=; b=P+vdkTPhYaNxsDmytF+YVstKTK
	Pti/rLi9wS8kERhdO3lnq7EGjv2SkvPIoxmsWJMJhLHwEXuzxfpkEd0zo9zuCXe9
	U+wEG++UW/9ffuDwZQeKjwN2Pdnj3K1fq/uIr+zRKUmmGX2VZikefQZiAdW9+LI+
	tFc1D5WNqUSuF5nsWnIjQhgKI7iSeKP4j2I+zuHk7DUhCDXwgbx+WVXCooU21c1p
	i4qEUnq3VWG4y1tvWsJeR3Te+90gCWzNDjx4gK7NRhFzTjJSEaYw6+mIFtvhGc6J
	uTb8spKcVwxI8gDizZzGDrJfP2J9keJmj5W0iRW5udWe55/wCuskxMEvsLQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1711556578; x=1711642978; bh=04/bv9qv/fJ7b6lD5xQpNrs8Wx7z
	7kkFDtCrZ28H1cg=; b=qzE8tHKHnXdh4+H3pRQ/ZQ7HlCMNYT5iwoUelyrNrOO8
	rHZzjLjTcU1e8WjZdJgpfc5jLq/fS7QujczfIn/RZo9w2sHMwghfmx0B/Pt6ciyY
	mZLXkBewR4JEfqGSBYoEcrLAYEywprCzg8zl4EfCw/eu0cB+xjol8cRcx4RY2S6G
	yqYw6EB6oSHbw1fde2y2fpaO35fwy1+1v0G+H5DJwtNWdudg4JulUGwKOMqWw9Fz
	Sc8MgrZE9ndJY9TQXAX4zlMqZDxTH7TDiDq8JGVK2pWe/jyKZ0+UU4SnTFh/QrUy
	6QbhllOJ146SyrMw77vTVADthM+W645OaIDvsQniTA==
X-ME-Sender: <xms:4kcEZiU97SGN7Z_w79poK1nb4N_1GpgTvPhi0lpBpmvTGvWyR8sg2w>
    <xme:4kcEZuliBFO5zPrdua67vIRl9xLyspg4F5Bc-HYsOxZ4V_RjSuVPQ5Fes-xLTZdBt
    JRp7P5hoNKuZuOrkdM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudduiedgieefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4kcEZmbL533qBSNpSxrdX4q5ILP7r7kzKKmlSnDstDRjLbf5N8vcEQ>
    <xmx:4kcEZpWqWhcavi76Zt4HKiuB6gYaszYGDCTgfWOAAr_Q77vH-hFE1g>
    <xmx:4kcEZslDfBqUDssPqA0QxV_r5lXOighpBxK0ZhIx_za5D5YM44lNmA>
    <xmx:4kcEZucOAjhkok5D1ywWCVr9FlOuqT3l6-wCX7uvVOa5-_-KGobtlw>
    <xmx:4kcEZisfEnJnEcHuvnu41r2ISp1fJRG4dePekVw2WfvYtWEHKQhabQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id EE9E9B60092; Wed, 27 Mar 2024 12:22:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-328-gc998c829b7-fm-20240325.002-gc998c829
MIME-Version: 1.0
Message-Id: <dc1433ea-4e59-4ab7-83fb-23b393020980@app.fastmail.com>
In-Reply-To: <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
References: <20240327130538.680256-1-david@redhat.com> <ZgQ5hNltQ2DHQXps@x1n>
 <3922460a-4d01-4ecb-b8c5-7c57fd46f3fd@redhat.com>
Date: Wed, 27 Mar 2024 17:22:37 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "David Hildenbrand" <david@redhat.com>, peterx <peterx@redhat.com>
Subject: Re: [PATCH RFC 0/3] mm/gup: consistently call it GUP-fast
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
Cc: linux-s390@vger.kernel.org, Ryan Roberts <ryan.roberts@arm.com>, loongarch@lists.linux.dev, linux-sh@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-mm@kvack.org, Mike Rapoport <rppt@kernel.org>, Jason Gunthorpe <jgg@nvidia.com>, Vineet Gupta <vgupta@kernel.org>, linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, Matt Turner <mattst88@gmail.com>, linux-arm-kernel@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Mar 27, 2024, at 16:39, David Hildenbrand wrote:
> On 27.03.24 16:21, Peter Xu wrote:
>> On Wed, Mar 27, 2024 at 02:05:35PM +0100, David Hildenbrand wrote:
>> 
>> I'm not sure what config you tried there; as I am doing some build tests
>> recently, I found turning off CONFIG_SAMPLES + CONFIG_GCC_PLUGINS could
>> avoid a lot of issues, I think it's due to libc missing.  But maybe not the
>> case there.
>
> CCin Arnd; I use some of his compiler chains, others from Fedora directly. For
> example for alpha and arc, the Fedora gcc is "13.2.1".

>
> But there is other stuff like (arc):
>
> ./arch/arc/include/asm/mmu-arcv2.h: In function 'mmu_setup_asid':
> ./arch/arc/include/asm/mmu-arcv2.h:82:9: error: implicit declaration of 
> function 'write_aux_reg' [-Werro
> r=implicit-function-declaration]
>     82 |         write_aux_reg(ARC_REG_PID, asid | MMU_ENABLE);
>        |         ^~~~~~~~~~~~~

Seems to be missing an #include of soc/arc/aux.h, but I can't
tell when this first broke without bisecting.

> or (alpha)
>
> WARNING: modpost: "saved_config" [vmlinux] is COMMON symbol
> ERROR: modpost: "memcpy" [fs/reiserfs/reiserfs.ko] undefined!
> ERROR: modpost: "memcpy" [fs/nfs/nfs.ko] undefined!
> ERROR: modpost: "memcpy" [fs/nfs/nfsv3.ko] undefined!
> ERROR: modpost: "memcpy" [fs/nfsd/nfsd.ko] undefined!
> ERROR: modpost: "memcpy" [fs/lockd/lockd.ko] undefined!
> ERROR: modpost: "memcpy" [crypto/crypto.ko] undefined!
> ERROR: modpost: "memcpy" [crypto/crypto_algapi.ko] undefined!
> ERROR: modpost: "memcpy" [crypto/aead.ko] undefined!
> ERROR: modpost: "memcpy" [crypto/crypto_skcipher.ko] undefined!
> ERROR: modpost: "memcpy" [crypto/seqiv.ko] undefined!

Al did a series to fix various build problems on alpha, see
https://git.kernel.org/pub/scm/linux/kernel/git/viro/vfs.git/log/?h=work.alpha
Not sure if he still has to send them to Matt, or if Matt
just needs to apply them.

I also have some alpha patches that I should send upstream.

     Arnd
