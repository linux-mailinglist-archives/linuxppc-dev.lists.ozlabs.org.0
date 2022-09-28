Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA765EDD62
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 15:02:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4McxTf2X14z3cBp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Sep 2022 23:01:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QKMxN9Na;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IoRkOmvt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.17; helo=wnew3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=QKMxN9Na;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=IoRkOmvt;
	dkim-atps=neutral
Received: from wnew3-smtp.messagingengine.com (wnew3-smtp.messagingengine.com [64.147.123.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4McxSv5wsZz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Sep 2022 23:01:18 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailnew.west.internal (Postfix) with ESMTP id 190B92B067BE;
	Wed, 28 Sep 2022 09:01:13 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Wed, 28 Sep 2022 09:01:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm2; t=1664370072; x=1664373672; bh=2R+AaYds2J
	cySBCcJKcvW1TzhKhvRGdEC8UlpDJNV4M=; b=QKMxN9Na+exda1c46XlGtMqz2x
	b+Cogr2H5uSoklsNUYKDnswskkBJo95187YMNV9QfJzSi6nXPdZSuuwRImqWqT86
	OgFSrMhx/jq1mpAwiHflGPXqr9zh+4W4mvhxHA7MQmWP6bfKlJ7VYOmw+m8J/YZG
	eVM5x4Kx5a49o6IdWjSm9HVDtEm03NNmaGiSjRnFCmev+jez4NxvOzIbdbVcz7G2
	TbxUhpUXmF9FqkdVX51eJGdSQOP5ZYaVCS1L4dtVB74AUemO2ED2lJ9xJcIzLDDt
	/H0AOzwIWKdx44Gyrt1W7vVNv4vfVuj91YDNz1pTGs9wkBR0iBBB5oMZnQ/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1664370072; x=1664373672; bh=2R+AaYds2JcySBCcJKcvW1TzhKhv
	RGdEC8UlpDJNV4M=; b=IoRkOmvtgGcxIr9rIwWYtoPdC6iZLpigYTMp8owHHjPM
	fBAPkgChwSCdgU0lYT2ut9z9tTddABpOZoYN+FneNNZaITIsv7exKBJNb9R7d/Wy
	dg8KyoBIQHgV+6IkIt2cwOBgWfL4uup1iRrdxVXA7cOdNex9uKA+d+ahcUC0NE+P
	cqmDX/DvJnGOm+q1rzR1lrNTi3pVLhifB0Ay2g/qymFcXlojQ7VHa2i/bLxtcX1+
	/sOzB+IJnmc3LTwqgMB8n7yH3IJD49l5DsbrQXpuTXwzpJMlOhs9qJPOD/9MScGF
	RCaPbIWB6naVf2t50crHZyAKUZILYHBV7ePm6uCeHA==
X-ME-Sender: <xms:l0U0YwhfsuOkhuYGiSHhJhW0IKVrT6mnDjhv082C8IaOiTKu59hNbw>
    <xme:l0U0Y5DCqQcldV9wPNCAa0Vp5X6LRG-oJ2nBJTm5eZX8fzQMFRefAejOAtrrfIx5x
    DdBIVbd0Olb_uxwe2k>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeegkedgiedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:l0U0Y4GPNfwqVMOxpUZt7uWbmCYo9MOfqia64Rh7vM7Pq-cbKXlk2g>
    <xmx:l0U0YxRsi-8jsg9EHXGbhLCyXFS63g9Crdxt3dI3UtTlvvQm9ubbpw>
    <xmx:l0U0Y9zAKngIAK1iXkzkHgeR3u4Ij3GHHVD5_Iq9pLo0wkh8bRNguw>
    <xmx:mEU0Y-plVJ9GcZMrYebit3jfJYDoVocn5Z3n4IHxAeNK9TdVeN-ASwvvu6c>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 1EA94B60086; Wed, 28 Sep 2022 09:01:11 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-968-g04df58079d-fm-20220921.001-g04df5807
Mime-Version: 1.0
Message-Id: <2be2c0f2-9b4b-46e7-a10e-1c17026e8f79@www.fastmail.com>
In-Reply-To: <87k05ng0fq.fsf@mpe.ellerman.id.au>
References: <20220921065605.1051927-1-rmclure@linux.ibm.com>
 <20220921065605.1051927-14-rmclure@linux.ibm.com>
 <87k05ng0fq.fsf@mpe.ellerman.id.au>
Date: Wed, 28 Sep 2022 15:00:50 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Michael Ellerman" <mpe@ellerman.id.au>,
 "Rohan McLure" <rmclure@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v6 13/25] powerpc: Remove direct call to mmap2 syscall handlers
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 28, 2022, at 2:15 PM, Michael Ellerman wrote:

> But I think it makes more sense to do the same as mmap2() and pass the
> 4K offset through, and pass shift = PAGE_SHIFT - 12. I also borrowed the
> "off_4k" name from arm64. End result:
>
> #ifdef CONFIG_COMPAT
> COMPAT_SYSCALL_DEFINE6(mmap2,
> 		       unsigned long, addr, size_t, len,
> 		       unsigned long, prot, unsigned long, flags,
> 		       unsigned long, fd, unsigned long, off_4k)
> {
> 	return do_mmap2(addr, len, prot, flags, fd, off_4k, PAGE_SHIFT-12);
> }
> #endif
>
> With that my G5 boots again :)

Any chance we can instead add a working compat_sys_mmap2/sys_mmap2
in mm/mmap.c alongside the sys_mmap_pgoff implementation?

While sys_mmap_pgoff() was meant to replace the various sys_mmap2()
implementations, I think it was ultimately a mistake, and we later
converged on the sys_mmap2() calling conventions with 12 bits
offset for almost all 32-bit architectures.

   Arnd
