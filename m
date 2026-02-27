Return-Path: <linuxppc-dev+bounces-17361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gCQbGHhKoWnWrwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17361-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 08:40:40 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D863B1B405F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Feb 2026 08:40:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMgGr21gBz2xMt;
	Fri, 27 Feb 2026 18:40:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772178036;
	cv=none; b=LPjd+LddtoVbNzzPPqiJMM8YDXsl7DgLt6E3w4CVR2nZgsnPCgqkixGHKy02LAsQuZV8zRiMImZDVegODFwqRpQdukuCD4SPqwWriAlQOGXXTD2VQKG+60D3DTxFBsx2ntEa410v+eae8DJZ3aoyUtQR708FAPYkxP7k43MyaWMWMFi+vLEux3ycoNdxupH17CbUAglxQp4NEL3mIEbqMmh10/9wBgO5rzKigX4Md3sCYXYayE+iBgrjlZiiUbOJ+ZjW+Qrq2MrGzQacKc5mN/cXh4ejKhxanQ17aTtDmRAtSIhDfSkXPof9YAvganCHAMdulc5lfOIXzvYfYEpjBg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772178036; c=relaxed/relaxed;
	bh=V6J0SL9RsbUQWhN8iu+ey8pLnEs4VtLYMczUYtzIoAc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oQnlkjsoCgRPruuSI7dpHtWuwdpJpDN5ZY4fLhKwkqTDVnSOmLVBl7sxpT/tzS6RbvBdpuANSkTvpi6vhzUPwcLgJVkHoxmynIZKTGsbGWKctuV1M1Lqb77WwiERMa71LpPMfKSbe1vmx8bdNOTgih0N6vU2uQTYG5mA8CFJLzfl7QSYiYNIEbHJs6EosdHDi8krinfGXeFbX7S6m5DlqgTxzUduvLUXY2yuH66aQma/3KPDCaNbDS7LtPLyoii+WPsVnMNPBEpkRYR2RCkbzFz5MEwdF5Ji4/ZhhHjHsW40BWqTbhZTbOwDBCRaB0vAigmPGgMu2FLrXwuvFXPwQQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=jcqfe0s2; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=jcqfe0s2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMgGp51vqz2xKh
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 18:40:34 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=V6J0SL9RsbUQWhN8iu+ey8pLnEs4VtLYMczUYtzIoAc=;
	t=1772178034; x=1773387634; b=jcqfe0s2YaBqLNLOZUiGEbn6OR95xIMI8Q+tO6dxZl4HWWA
	5ghGCKC9Xos5NPttWx5gTvyAzGKaJp6ryytL56JsV4+lDTGI1M+aI7zcU5QVeflG+ccq8/KoSooMU
	EKh23rZNcXqXR/6uWTFukA6gmbi+nWONOweMio8xJ/ziAdvlIa4KLZmccZyN3jdHZieReSH3Mj8v5
	xHGo2RPGWP0IbbVW+7JOYJAqvg9333a2xiiup+EMhy9bJk5m9PaojlVsscazW3qxxVbQbd6iPw7/f
	1Ti5cq+eJYH5X/ZHiWg3tamj+iIXj1Pt9cqHbipZrGzP1lSORH6/d5Y0i7tQi8ow==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vvsRx-00000003Eus-2oGQ;
	Fri, 27 Feb 2026 08:39:49 +0100
Message-ID: <4f69d30f952bc374e69f44786f662886c30058e9.camel@sipsolutions.net>
Subject: Re: [PATCH 03/25] um/xor: don't override XOR_SELECT_TEMPLATE
From: Johannes Berg <johannes@sipsolutions.net>
To: Richard Weinberger <richard@nod.at>, hch <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>, Richard Henderson	
 <richard.henderson@linaro.org>, Matt Turner <mattst88@gmail.com>, Magnus
 Lindholm <linmag7@gmail.com>, Russell King <linux@armlinux.org.uk>, Catalin
 Marinas	 <catalin.marinas@arm.com>, will <will@kernel.org>, Huacai Chen	
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>, Madhavan
 Srinivasan	 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin	 <npiggin@gmail.com>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>,  Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Heiko Carstens	 <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev	 <agordeev@linux.ibm.com>, Christian
 Borntraeger <borntraeger@linux.ibm.com>,  Sven Schnelle
 <svens@linux.ibm.com>, davem <davem@davemloft.net>, Andreas Larsson
 <andreas@gaisler.com>,  anton ivanov <anton.ivanov@cambridgegreys.com>,
 Thomas Gleixner <tglx@kernel.org>, mingo <mingo@redhat.com>,  bp
 <bp@alien8.de>, dave hansen <dave.hansen@linux.intel.com>, x86
 <x86@kernel.org>, hpa	 <hpa@zytor.com>, Herbert Xu
 <herbert@gondor.apana.org.au>, dan j williams	 <dan.j.williams@intel.com>,
 Chris Mason <clm@fb.com>, David Sterba	 <dsterba@suse.com>, Arnd Bergmann
 <arnd@arndb.de>, Song Liu <song@kernel.org>,  Yu Kuai <yukuai@fnnas.com>,
 Li Nan <linan122@huawei.com>, linux-alpha <linux-alpha@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>,  loongarch
 <loongarch@lists.linux.dev>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-riscv	 <linux-riscv@lists.infradead.org>, linux-s390
 <linux-s390@vger.kernel.org>,  sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, Linux Crypto Mailing List
 <linux-crypto@vger.kernel.org>, linux-btrfs <linux-btrfs@vger.kernel.org>,
 linux-arch	 <linux-arch@vger.kernel.org>, linux-raid
 <linux-raid@vger.kernel.org>, Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 27 Feb 2026 08:39:47 +0100
In-Reply-To: <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
References: <20260226151106.144735-1-hch@lst.de>
	 <20260226151106.144735-4-hch@lst.de>
	 <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
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
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.21 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[sipsolutions.net,none];
	R_DKIM_ALLOW(-0.20)[sipsolutions.net:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,cambridgegreys.com,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	TAGGED_FROM(0.00)[bounces-17361-lists,linuxppc-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_RECIPIENTS(0.00)[m:richard@nod.at,m:hch@lst.de,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:anton.ivanov@cambridgegreys.com,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.o
 rg,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,m:ardb@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[johannes@sipsolutions.net,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[sipsolutions.net:+];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[johannes@sipsolutions.net,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sipsolutions.net:mid,sipsolutions.net:dkim,lst.de:email,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: D863B1B405F
X-Rspamd-Action: no action

On Thu, 2026-02-26 at 22:45 +0100, Richard Weinberger wrote:
> ----- Urspr=C3=BCngliche Mail -----
> > Von: "hch" <hch@lst.de>
> > XOR_SELECT_TEMPLATE is only ever called with a NULL argument, so all th=
e
> > ifdef'ery doesn't do anything.  With our without this, the time travel
> > mode should work fine on CPUs that support AVX2, as the AVX2
> > implementation is forced in this case, and won't work otherwise.
>=20
> IIRC Johannes added XOR_SELECT_TEMPLATE() here to skip
> the template selection logic because it didn't work with time travel mode=
.
>=20
> Johannes, can you please test whether this change does not break
> time travel mode?

It does work, even if it reports nonsense (as you'd expect):

xor: measuring software checksum speed
   prefetch64-sse  : 12816000 MB/sec
   sse             : 12816000 MB/sec
xor: using function: prefetch64-sse (12816000 MB/sec)

I think it works now because the loop is using ktime and is bounded by
REPS, since commit c055e3eae0f1 ("crypto: xor - use ktime for template
benchmarking").

The RAID speed select still hangs, but we've gotten that removed via
Kconfig, so that's already handled. Perhaps raid6_choose_gen() should
use a similar algorithm? But for UML it doesn't really matter since
CONFIG_RAID6_PQ_BENCHMARK exists.


As far as AVX2 is concerned, yeah, I guess that was a bug, but evidently
nobody (who configured time-travel) ever cared - what _did_ matter
though in practice is that the boot not get stuck entirely... Two
completely separate issues.

johannes

