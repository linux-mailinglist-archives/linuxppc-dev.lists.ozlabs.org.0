Return-Path: <linuxppc-dev+bounces-17441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMOpBkuQomlq4AQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17441-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 07:50:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 248D81C0A72
	for <lists+linuxppc-dev@lfdr.de>; Sat, 28 Feb 2026 07:50:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fNG6t10wsz3bjN;
	Sat, 28 Feb 2026 17:50:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772261446;
	cv=none; b=gxZOf2pwrYoNGAGk0PB6wEHhuYKf5gXooS9sUDuOjhUT4/Ps0cwiD1ca5mEVI3Hc0ngqR2+1JOnn0GeGQz77nSDmBNnvn6GwEGwcToqkcxMMTUzBC0hHDpENsDxyX57Dji1Z2xeDI0e5YIDstgYQDvucKUZLWFOSXRvRcTtKpbdN9Qv6x4vyFqSRRRSQ685/fXLdnJbu25GiQZyr9myPThD3IKkdjPVgGgu577NqwDbIBJWQ6CsWIAH+mFUv/Y3E1vxhmt1TmteF5NUb5jOlKxvu/k7/l3Yi3B5uz35Txdxv6NQCOBONKrIOOVVIoWb0aSQtOGdG9w62SufhYOu/mQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772261446; c=relaxed/relaxed;
	bh=X3j0hnt2JP/KFdQ4c7HYEW0UCDX2N/3z8ziNkQTinCU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QujyVrfr5r31A6oRWGOaHKMvosFk1qDmJN3Cuyxpv2LGbyTYwNU17dMr5g2PQa0AFMO+WwWgmuYf2AytFUO+wzHqDrpiPZFAZtLhLJ01OF7z1MWYcFjgv5/GMnQA093gR6pzMoLBZm6JoahiN50+Pa9lveDVGyBYus+LqVizTvtxym91N2DBpLuO1a0wzxb0m5a8fSOisEY4RgVjasmUrzsq+CrV2d32f00tTiu5PrX053MIC24/iG8fhq6NbH0MjFnSnSKOdmxEwgNM7tAuarpxAluYnD26sAUa2hBMSbeMNXbL3PTrIctUD/DIPuAk1O16EaFNf655cRAKIlqUDw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTFfr8oc; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iTFfr8oc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=ebiggers@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fNG6s215Qz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 28 Feb 2026 17:50:45 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3CCA96001D;
	Sat, 28 Feb 2026 06:50:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11F92C116D0;
	Sat, 28 Feb 2026 06:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772261441;
	bh=vPTEPlrxe6ytedqa6Me+M+hZkV+rGO8rrN4LIEvszKU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iTFfr8ocKEvs3vXYRewYWPSFe2kL3EkPqlXMH9SFlbuxla7B1++TfbbR29cAr/T69
	 8RlajaFDOInAOiN+ZK7veFCGRmxjx3J7bE/ObG1rUVu/wJzBNzB68455fQxxkndpm2
	 Tm8vLFnkUPRX5ZN0PkWUIEMTd4tfYl/XR8pSy9Z/UPR0Qpq83+piDFPoy0+TgckjTx
	 fIBVNpnimUABvVb4nGDJC3hmwuwMOJKdRSInNWdlSTmxsPRa6fXgS00DoHU0JgsDRW
	 lp50vbyxlZIuxosoVMrxCRj/2aCgMhGTMqw6gfvTpMznmcYFwDNIHqHcgooJXMIogZ
	 UhhsWMu+jeEcw==
Date: Fri, 27 Feb 2026 22:50:38 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Magnus Lindholm <linmag7@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>,
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
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Andreas Larsson <andreas@gaisler.com>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Dan Williams <dan.j.williams@intel.com>, Chris Mason <clm@fb.com>,
	David Sterba <dsterba@suse.com>, Arnd Bergmann <arnd@arndb.de>,
	Song Liu <song@kernel.org>, Yu Kuai <yukuai@fnnas.com>,
	Li Nan <linan122@huawei.com>, linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org, linux-um@lists.infradead.org,
	linux-crypto@vger.kernel.org, linux-btrfs@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-raid@vger.kernel.org
Subject: Re: [PATCH 21/25] xor: add a better public API
Message-ID: <20260228065038.GH65277@quark>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-22-hch@lst.de>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226151106.144735-22-hch@lst.de>
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.71 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-17441-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:arnd@arndb.de,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-
 arm-kernel@lists.infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,arndb.de,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_GT_50(0.00)[55];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ebiggers@kernel.org,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 248D81C0A72
X-Rspamd-Action: no action

On Thu, Feb 26, 2026 at 07:10:33AM -0800, Christoph Hellwig wrote:
> xor_blocks is very annoying to use, because it is limited to 4 + 1
> sources / destinations, has an odd argument order and is completely
> undocumented.
> 
> Lift the code that loops around it from btrfs and async_tx/async_xor into
> common code under the name xor_gen and properly document it.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  include/linux/raid/xor.h |  3 +++
>  lib/raid/xor/xor-core.c  | 28 ++++++++++++++++++++++++++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/include/linux/raid/xor.h b/include/linux/raid/xor.h
> index 02bda8d99534..4735a4e960f9 100644
> --- a/include/linux/raid/xor.h
> +++ b/include/linux/raid/xor.h
> @@ -7,4 +7,7 @@
>  extern void xor_blocks(unsigned int count, unsigned int bytes,
>  	void *dest, void **srcs);
>  
> +void xor_gen(void *dest, void **srcss, unsigned int src_cnt,
> +		unsigned int bytes);

srcss => srcs

Ideally the source vectors would be 'const' as well.

> +/**
> + * xor_gen - generate RAID-style XOR information
> + * @dest:	destination vector
> + * @srcs:	source vectors
> + * @src_cnt:	number of source vectors
> + * @bytes:	length in bytes of each vector
> + *
> + * Performs bit-wise XOR operation into @dest for each of the @src_cnt vectors
> + * in @srcs for a length of @bytes bytes.
> + *
> + * Note: for typical RAID uses, @dest either needs to be zeroed, or filled with
> + * the first disk, which then needs to be removed from @srcs.
> + */
> +void xor_gen(void *dest, void **srcs, unsigned int src_cnt, unsigned int bytes)
> +{
> +	unsigned int src_off = 0;
> +
> +	while (src_cnt > 0) {
> +		unsigned int this_cnt = min(src_cnt, MAX_XOR_BLOCKS);
> +
> +		xor_blocks(this_cnt, bytes, dest, srcs + src_off);
> +
> +		src_cnt -= this_cnt;
> +		src_off += this_cnt;
> +	}
> +}
> +EXPORT_SYMBOL(xor_gen);

The alignment requirements on the vectors should be documented, as
should which values of bytes are accepted.  It looks like, at the very
least, the vectors have to be 32-byte aligned and the length has to be a
nonzero multiple of 512 bytes.  But I didn't check every implementation.

Also, the requirement on the calling context (e.g. !is_interrupt())
should be documented as well.

- Eric

