Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F05070D8F7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 11:27:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQTVk2zgtz3f4S
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 19:27:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=fmBOz2XQ;
	dkim=fail reason="signature verification failed" header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zajPamxt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.cz (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=vbabka@suse.cz; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.cz header.i=@suse.cz header.a=rsa-sha256 header.s=susede2_rsa header.b=fmBOz2XQ;
	dkim=pass header.d=suse.cz header.i=@suse.cz header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=zajPamxt;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQTTs74mpz3bT5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 May 2023 19:26:41 +1000 (AEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id CB4FE2046A;
	Tue, 23 May 2023 09:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1684833998; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeeF7P+KGwlI3A5FT4CrZ0MRM4bqCgyOhKvZ384U0bw=;
	b=fmBOz2XQkJ4XHhSdGh/HXGxJtyCnKClPp4X6MRT6VR5eXrTQZK9h5N6Toqfk+0GeD98iT3
	ZDhHKznDkq0Y5mKvraQucwn+Wh9FeAeuFGHWgkercVl2rETq+mQKxe64zKr8IJWHxFZCKE
	O8heNaNMsvS9Ka+Y0g3mOKcA0+3rNN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1684833998;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VeeF7P+KGwlI3A5FT4CrZ0MRM4bqCgyOhKvZ384U0bw=;
	b=zajPamxtH/5SGH5Qq9H7t7b5zBY3QOo+hV3Vqv/J4endm7d1fvc5Ztsv4d+st0dbhUYOxx
	LgejBO7uUF0wFbCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4FA5A13588;
	Tue, 23 May 2023 09:26:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id HfC5Es6GbGTEVAAAMHmgww
	(envelope-from <vbabka@suse.cz>); Tue, 23 May 2023 09:26:38 +0000
Message-ID: <c63dc769-e020-5a82-335e-11c992543a3a@suse.cz>
Date: Tue, 23 May 2023 11:26:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] mm/slab: rename CONFIG_SLAB to CONFIG_SLAB_DEPRECATED
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20230523091139.21449-1-vbabka@suse.cz>
 <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
From: Vlastimil Babka <vbabka@suse.cz>
In-Reply-To: <CAMuHMdWRZmA1iEG2aXdKZ+wWgSTgg-P7KY7pTTJx9EmvuEa58A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Andrew Lunn <andrew@lunn.ch>, Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Tony Lindgren <tony@atomide.com>, Roman Gushchin <roman.gushchin@linux.dev>, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, linux-mm@kvack.org, Helge Deller <deller@gmx.de>, sparclinux@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>, Christoph Lameter <cl@linux.com>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-renesas-soc@vger.kernel.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Richard Weinberger <richard@nod.at>, Gregory Clement <gregory.clement@bootlin.com>, David Rientjes <rientjes@google.com>, linux-snps-arc@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, Vladimir Zapolskiy <vz@mleia.com>, linux-m68k@lists.linux-m68k.org, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, Johannes Berg <joha
 nnes@sipsolutions.net>, linux-arm-kernel@lists.infradead.org, Qin Jian <qinjian@cqplus1.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Andrew Morton <akpm@linux-foundation.org>, linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Pekka Enberg <penberg@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 5/23/23 11:22, Geert Uytterhoeven wrote:
> Hi Vlastimil,
> 
> Thanks for your patch!
> 
> On Tue, May 23, 2023 at 11:12 AM Vlastimil Babka <vbabka@suse.cz> wrote:
>> As discussed at LSF/MM [1] [2] and with no objections raised there,
>> deprecate the SLAB allocator. Rename the user-visible option so that
>> users with CONFIG_SLAB=y get a new prompt with explanation during make
>> oldconfig, while make olddefconfig will just switch to SLUB.
>>
>> In all defconfigs with CONFIG_SLAB=y remove the line so those also
>> switch to SLUB. Regressions due to the switch should be reported to
>> linux-mm and slab maintainers.
> 
> Technically, removing these lines from the defconfig files does not
> have any impact, right?

Well, it doesn't, but I thought it's at least a useful heads-up for the
maintainers in case some have specific reasons for keeping SLAB there.

> And it removes one more sync point indicating the last time some
> defconfig files were (not) updated by their maintainers ;-)

Sure, I can exclude yours (and anyone else who'd prefer that), the ack on
the deprecation itself is sufficient.

>> [1] https://lore.kernel.org/all/4b9fc9c6-b48c-198f-5f80-811a44737e5f@suse.cz/
>> [2] https://lwn.net/Articles/932201/
>>
>> Signed-off-by: Vlastimil Babka <vbabka@suse.cz>
> 
>>  arch/m68k/configs/amiga_defconfig               |  1 -
>>  arch/m68k/configs/apollo_defconfig              |  1 -
>>  arch/m68k/configs/atari_defconfig               |  1 -
>>  arch/m68k/configs/bvme6000_defconfig            |  1 -
>>  arch/m68k/configs/hp300_defconfig               |  1 -
>>  arch/m68k/configs/mac_defconfig                 |  1 -
>>  arch/m68k/configs/multi_defconfig               |  1 -
>>  arch/m68k/configs/mvme147_defconfig             |  1 -
>>  arch/m68k/configs/mvme16x_defconfig             |  1 -
>>  arch/m68k/configs/q40_defconfig                 |  1 -
>>  arch/m68k/configs/sun3_defconfig                |  1 -
>>  arch/m68k/configs/sun3x_defconfig               |  1 -
> 
> Regardless,
> Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Thanks!

> Gr{oetje,eeting}s,
> 
>                         Geert
> 

