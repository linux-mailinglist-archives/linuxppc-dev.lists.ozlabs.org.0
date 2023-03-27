Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 024EB6CA521
	for <lists+linuxppc-dev@lfdr.de>; Mon, 27 Mar 2023 15:03:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PlY0K6K7Wz3fbD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Mar 2023 00:03:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Y61mr9XU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S8t3E1mZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Y61mr9XU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=S8t3E1mZ;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PlXzG42JDz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Mar 2023 00:02:33 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 01DFD582160;
	Mon, 27 Mar 2023 09:02:29 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Mon, 27 Mar 2023 09:02:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm1; t=
	1679922148; x=1679929348; bh=C0t+VBsIdNHlcZByrnG5NPOW3/HDBRin4l1
	1iuQ2qiw=; b=Y61mr9XUfXVFhUlJdoF8OWNZ1qM6LGTHSqUwPXey+5SLhbXuszz
	IX4F35TzFt8tNJqu3TdHQy42BVXRNe3bcFUV8/zj9nSivnmtuzQXp6yIK2l3HJtv
	arNn0qdsSFaxnf2jpGCdO42ZY/Yo7maZ9JJxQnYT9zQ6fDNdG0CMXLPJSTiBiuYc
	DxowTYLJD3TZAMG+gAP8IaltLqnFWdByE0RMezkwvVUj8PXoa7+fgC1mMOdcybmk
	FOSp8xBGb8i1lrklfr+C8l8mm7z3rZwyVo/iOqMqn8kIsrxCMYlMByaiI+EkJOfO
	AksZxvdJBavSBPl8RAWIMzvbBRTXG6xIPuQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1679922148; x=1679929348; bh=C0t+VBsIdNHlcZByrnG5NPOW3/HDBRin4l1
	1iuQ2qiw=; b=S8t3E1mZSSbesGBfIrPg8iez5iynYZ434j4/P/C+PFUpzIj6OWt
	K13vVMOr45Pq/x54idE06yYJdGJHsAgbut8cysdL7NSE20F2ZB97nGf6sGl0XtnJ
	9XT1e/v2R2VMawWFs9cAUtCqiZnEUzvQi5oNF6VrsD0uvg+IwkaMgefkI++oVxUX
	P6oUU+TSxGqMMY77icyCim+29Cz39zEK5CEbEi/5s9/A6kWKWjnkM9cNn+OZr9OG
	+PTT8iBaVt9Y7UzKaNo9juS2P9bsmSmnzuVEEp99tvwuhj8CNT8gHrMIM+y46L5g
	RgKT+E9GeicOtbPmieJjqHY7nt82g7IMpvg==
X-ME-Sender: <xms:4JMhZKEbJtHy_-7r0mhUuAf1RDVX6ONGet-C4uHDHI8aFxDwJeBTbg>
    <xme:4JMhZLWFbqjeW-l2s4SA4L2AsblAYcYuZ6OQ60CbfoemRcndoOUNn99kWSsbLC3eM
    b-EfXBxvzBJwVrahuc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehvddgheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4JMhZELkazMXWEydSMGlmDWOa0OVgB7P_WKB0YhrlPTlihQYux3WDg>
    <xmx:4JMhZEHovsEueCzwFyZ_7j_02sVES08XwzN6GBrtdqzrQFX09dmI0A>
    <xmx:4JMhZAUOI7kSkdg94xSzJhhTWcVlrr09q_AxuFUHeLD9-JISNVRWQg>
    <xmx:5JMhZP2bf1MV6jKd0e2JRv6hBv-xH3H71MSGG9ZG8p0hNuqV3tmOJw>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 75C74B60086; Mon, 27 Mar 2023 09:02:24 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-236-g06c0f70e43-fm-20230313.001-g06c0f70e
Mime-Version: 1.0
Message-Id: <a0b2c6a1-9f9a-490a-af1b-52d856102bc7@app.fastmail.com>
In-Reply-To: <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-7-arnd@kernel.org>
 <52eef604-085e-acf9-f3ee-41ba9d8441d2@csgroup.eu>
Date: Mon, 27 Mar 2023 15:02:04 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Arnd Bergmann" <arnd@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 06/21] powerpc: dma-mapping: minimize for_cpu flushing
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: Rich Felker <dalias@libc.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>, "linux-xtensa@linux-xtensa.org" <linux-xtensa@linux-xtensa.org>, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@vger.kernel.org>, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "linux-hexagon@vger.kernel.org" <linux-hexagon@vger.kernel.org>, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023, at 14:56, Christophe Leroy wrote:
> Le 27/03/2023 =C3=A0 14:13, Arnd Bergmann a =C3=A9crit=C2=A0:
>> From: Arnd Bergmann <arnd@arndb.de>
>>=20
>> The powerpc dma_sync_*_for_cpu() variants do more flushes than on oth=
er
>> architectures. Reduce it to what everyone else does:
>>=20
>>   - No flush is needed after data has been sent to a device
>>=20
>>   - When data has been received from a device, the cache only needs to
>>     be invalidated to clear out cache lines that were speculatively
>>     prefetched.
>>=20
>> In particular, the second flushing of partial cache lines of bidirect=
ional
>> buffers is actively harmful -- if a single cache line is written by b=
oth
>> the CPU and the device, flushing it again does not maintain coherency
>> but instead overwrite the data that was just received from the device.
>
> Hum ..... Who is right ?
>
> That behaviour was introduced by commit 03d70617b8a7 ("powerpc: Preven=
t=20
> memory corruption due to cache invalidation of unaligned DMA buffer")
>
> I think your commit log should explain why that commit was wrong, and=20
> maybe say that your patch is a revert of that commit ?

Ok, I'll try to explain this better. To clarify here: the __dma_sync()
function in commit 03d70617b8a7 is used both before and after a DMA,
but my patch 05/21 splits this in two, and patch 06/21 only changes
the part that gets called after the DMA-from-device but leaves the
part before DMA-from-device unchanged, which Andrew's patch
addressed.

As I mentioned in the cover letter, it is still unclear whether
we want to consider this the expected behavior as the documentation
seems unclear, but my series does not attempt to answer that
question.

     Arnd
