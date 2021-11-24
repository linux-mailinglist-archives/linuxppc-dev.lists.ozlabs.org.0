Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 813C345C294
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Nov 2021 14:28:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Hzhdq2MRbz3081
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Nov 2021 00:27:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=FMMYRpnf;
	dkim=fail reason="signature verification failed" header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=Mqki1S4Q;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=195.135.220.28; helo=smtp-out1.suse.de;
 envelope-from=msuchanek@suse.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256
 header.s=susede2_rsa header.b=FMMYRpnf; 
 dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256
 header.s=susede2_ed25519 header.b=Mqki1S4Q; 
 dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Hzhd72yXtz2xBL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Nov 2021 00:27:23 +1100 (AEDT)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id CCED321941;
 Wed, 24 Nov 2021 13:27:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637760438; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mN2kL64eNA1N2PK/PmloaFO9N3vVjmU6wTcDc2qhV70=;
 b=FMMYRpnfAGayOuJ/OK4NiO+Rx4lPtVOsvLnfUGWuitz77A9Q1LQzXEThtnv16Qf3SmSAwM
 s2ZzzLYTAjhWFIweg/PzCBGYT7fz693yetXPDZ/nbU4tKRDFKxfMfTHwr/1OnUPihqoTaX
 C/XDrJpV7ODrGvuHvUkkALx/m7QdGuc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637760438;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mN2kL64eNA1N2PK/PmloaFO9N3vVjmU6wTcDc2qhV70=;
 b=Mqki1S4QamNYU0y4PtzCs1Pt2rdDnqqPiT8W36clDnHP3O2iMu2RsASAK90x88WoZDwDNY
 7hA994IhL7ztkgAw==
Received: from kunlun.suse.cz (unknown [10.100.128.76])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id C4C7EA3B93;
 Wed, 24 Nov 2021 13:27:17 +0000 (UTC)
Date: Wed, 24 Nov 2021 14:27:16 +0100
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mimi Zohar <zohar@linux.ibm.com>
Subject: Re: [PATCH 0/3] KEXEC_SIG with appended signature
Message-ID: <20211124132716.GT34414@kunlun.suse.cz>
References: <20211108120500.GO11195@kunlun.suse.cz>
 <56d2ae87-b9bf-c9fc-1395-db4769a424ea@linux.vnet.ibm.com>
 <20211112083055.GA34414@kunlun.suse.cz>
 <8cd90fea-05c9-b5f9-5e0c-84f98b2f55cd@linux.vnet.ibm.com>
 <20211116095343.GG34414@kunlun.suse.cz>
 <604dad24-5406-509c-d765-905d74880523@linux.vnet.ibm.com>
 <20211119111823.GC34414@kunlun.suse.cz>
 <01218c22a287665091f24c7023f4bcd42dbb2001.camel@linux.ibm.com>
 <20211124120950.57c10a9f@rhtmp>
 <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <290c0097271c68f5a9fd1e8f6fdb542631981b33.camel@linux.ibm.com>
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
Cc: Thiago Jung Bauermann <bauerman@linux.ibm.com>, linux-s390@vger.kernel.org,
 Vasily Gorbik <gor@linux.ibm.com>, Rob Herring <robh@kernel.org>,
 Philipp Rudo <prudo@redhat.com>, Heiko Carstens <hca@linux.ibm.com>,
 Nayna <nayna@linux.vnet.ibm.com>, linux-kernel@vger.kernel.org,
 David Howells <dhowells@redhat.com>,
 Lakshmi Ramasubramanian <nramas@linux.microsoft.com>,
 Luis Chamberlain <mcgrof@kernel.org>, keyrings@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Frank van der Linden <fllinden@amazon.com>,
 Jessica Yu <jeyu@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>,
 buendgen@de.ibm.com, linuxppc-dev@lists.ozlabs.org,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Hari Bathini <hbathini@linux.ibm.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Nov 24, 2021 at 08:10:10AM -0500, Mimi Zohar wrote:
> On Wed, 2021-11-24 at 12:09 +0100, Philipp Rudo wrote:
> > Now Michal wants to adapt KEXEC_SIG for ppc too so distros can rely on all
> > architectures using the same mechanism and thus reduce maintenance cost.
> > On the way there he even makes some absolutely reasonable improvements
> > for everybody.
> > 
> > Why is that so controversial? What is the real problem that should be
> > discussed here?
> 
> Nothing is controversial with what Michal wants to do.  I've already
> said, "As for adding KEXEC_SIG appended signature support on PowerPC
> based on the s390 code, it sounds reasonable."

Ok, I will resend the series with the arch-specific changes first to be
independent of the core cleanup.

Thanks

Michal
