Return-Path: <linuxppc-dev+bounces-17329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLMSLOrEoGnImQQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17329-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 23:10:50 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E87C1B0362
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 23:10:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMQdM001Zz3bcf;
	Fri, 27 Feb 2026 09:10:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=213.95.11.211
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772143846;
	cv=none; b=EMuno1uR13UKVbl+ogYp5ParVSbDyh01FA3yctabgjAWrcGqemXZL27NMDV8f3/a9iApBRngGaVgcInHk9K7szAXio9p5gJPX762gba7BVxczY/skoJ8u1cPD/CjWTr1NTuOI3PKySNSRPZhbntiU02UXEBZBI8g207Cg4D4j/vzak1XfZ6D23sJ+mX634lU/6PvgZ5iob3ODINRr4YF0NV6AsmsnlceJ/lHvxs3T/KCwFtN9XFBk3fp95JgjDSIxoB1AhVIPb/4JuNm8KqM8lL4zEW9ZowLT3GOWVOsAMI4yf/Nrhnjs8zJyCbx2pXNcZwZ80uKHhzlHVp6usckuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772143846; c=relaxed/relaxed;
	bh=3ilvamkoK822H0OMpkLt0O2v/cHCUl9aKFe1v6Kcca4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OSJrJHMdfNg2UwLvL0+KP1/5iab7iN+0i+TrsOwEJvelqqvS6dNmfbQIgOMWHCP6FyQN+/Go5Kayt5BC0G/KcSXf+/J+61KaEzwWapv6sjFEflI3N5keisn8VU1pC6zmJzZ1umHCN68IyOdFLwcFaNVjHjPCIqJjwJUzbS6d7xYhInjDebx/PRXp3QsCYzDkhaBK1CmHTg3p3GFmM40TbmS3XiIUgWBHsuCLj/3svdH6B20xyVq7MeJifG2f9UiQyGtpIE+DiIA45pG2uJR5rikigB1d5pYF1aKfNNVp4c+BR3Zj6xBjFXnJ8LXhFQLlqtv8b6AWi+RFiVyxDJXwfw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org) smtp.mailfrom=lst.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 593 seconds by postgrey-1.37 at boromir; Fri, 27 Feb 2026 09:10:45 AEDT
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMQdK73mZz2yr6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 09:10:45 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 3731168C4E; Thu, 26 Feb 2026 23:00:39 +0100 (CET)
Date: Thu, 26 Feb 2026 23:00:38 +0100
From: hch <hch@lst.de>
To: Richard Weinberger <richard@nod.at>
Cc: hch <hch@lst.de>, Andrew Morton <akpm@linux-foundation.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>, will <will@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, davem <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	anton ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, mingo <mingo@redhat.com>,
	bp <bp@alien8.de>, dave hansen <dave.hansen@linux.intel.com>,
	x86 <x86@kernel.org>, hpa <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	dan j williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>,
	linux-alpha <linux-alpha@vger.kernel.org>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	loongarch <loongarch@lists.linux.dev>,
	linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	linux-s390 <linux-s390@vger.kernel.org>,
	sparclinux <sparclinux@vger.kernel.org>,
	linux-um <linux-um@lists.infradead.org>,
	Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
	linux-btrfs <linux-btrfs@vger.kernel.org>,
	linux-arch <linux-arch@vger.kernel.org>,
	linux-raid <linux-raid@vger.kernel.org>
Subject: Re: [PATCH 03/25] um/xor: don't override XOR_SELECT_TEMPLATE
Message-ID: <20260226220038.GA15172@lst.de>
References: <20260226151106.144735-1-hch@lst.de> <20260226151106.144735-4-hch@lst.de> <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
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
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <445921547.2198.1772142326749.JavaMail.zimbra@nod.at>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.41 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	MAILLIST(-0.20)[generic];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), No valid DKIM,none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	TO_DN_ALL(0.00)[];
	TAGGED_FROM(0.00)[bounces-17329-lists,linuxppc-dev=lfdr.de];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:richard@nod.at,m:hch@lst.de,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-
 arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[lst.de,linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linuxppc-dev@lists.ozlabs.org];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	NEURAL_HAM(-0.00)[-0.990];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 9E87C1B0362
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 10:45:26PM +0100, Richard Weinberger wrote:
> ----- Ursprüngliche Mail -----
> > Von: "hch" <hch@lst.de>
> > XOR_SELECT_TEMPLATE is only ever called with a NULL argument, so all the
> > ifdef'ery doesn't do anything.  With our without this, the time travel
> > mode should work fine on CPUs that support AVX2, as the AVX2
> > implementation is forced in this case, and won't work otherwise.
> 
> IIRC Johannes added XOR_SELECT_TEMPLATE() here to skip
> the template selection logic because it didn't work with time travel mode.
> 
> Johannes, can you please test whether this change does not break
> time travel mode?

I'm pretty sure that was the intent, but as I wrote above it worked
and still works on AVX-supporting CPUs by chance, and already doesn't
on older CPUs, and unless my git blaming went wrong someewhere already
didn't when this was originally added.


