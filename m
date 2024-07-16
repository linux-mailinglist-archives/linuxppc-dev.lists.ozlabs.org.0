Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B38293274A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 15:18:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=LLolVvbG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bG2YZz3j;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNflF2vxRz3cWD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 23:18:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm3 header.b=LLolVvbG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=bG2YZz3j;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=103.168.172.140; helo=flow5-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 550 seconds by postgrey-1.37 at boromir; Tue, 16 Jul 2024 23:17:37 AEST
Received: from flow5-smtp.messagingengine.com (flow5-smtp.messagingengine.com [103.168.172.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNfkT4xTdz3cZF
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 23:17:37 +1000 (AEST)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailflow.nyi.internal (Postfix) with ESMTP id 64DA4201196;
	Tue, 16 Jul 2024 09:08:24 -0400 (EDT)
Received: from imap44 ([10.202.2.94])
  by compute3.internal (MEProxy); Tue, 16 Jul 2024 09:08:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1721135304;
	 x=1721142504; bh=zt6qUa/rBAPGttY012K2IM8tuPIkZZ+7qikKmJ20XiQ=; b=
	LLolVvbGAnfV4iXPMW7seBnQ9ucngH1f2xp7EVD2uugxg3VEjVHJlV3vHpdUCRlV
	2Crod5dg4xilCIfTvsTZ3G0tnDSqxiqhIDMAeN6+HEFwoCEsiOOPq8SsQLa0sr/G
	xoG+i1vuZTOZ/7p3S2bp7uGbvMcxmbyusFaykv0mTCQZsmkThpkr9v2U6Zr+crZZ
	kmtszuZc2FnPtn2KugCODrgWHPthZIH5B7IwAoGfLtZRAwh7tq+DE3K11XSzxYk8
	5cprDH9mBZKnOwemRYCHcIIWN9/QaaLvzr+ZwZv/QxnXkafuN22zU1FFkVBylKx6
	A+QxZ0MIkK2YbgL8XuvmWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1721135304; x=
	1721142504; bh=zt6qUa/rBAPGttY012K2IM8tuPIkZZ+7qikKmJ20XiQ=; b=b
	G2YZz3jWm7iHL3gXNLVUTtNcfzTahLzLjR4iyuU0CNuyM89NLOf9oZyD2C3hYAIK
	AfDf20U8qC7CTOkBsWjWvYOHnqiWY3TigtPu5Yde99vlDGBfkJrkykgrj6MZxNRd
	OF0b0J9NpdNZ0L4sxgIiiEOEJlRsdc3+T+nlOeUW0yb0Z8JhW7I8RkOQgEq1DoaG
	WOeM5WdMLmGD4/DXwHMeXVIh/TuGiCjq62Cmau3SRwhwxyMut9KqZw8PI0t559X3
	drs3XIktjiBwP0mYVx52WH2pcoTQ4U95QNutDBRpZXbx67KkVSdfOjgua4ISKpVl
	lzZmmp3ndbV1KXYw8/6vw==
X-ME-Sender: <xms:xXCWZt3tlPtvPdXdpaZocqjicoskk-NG9y-bvebOxJ2yaqSo-ntZSQ>
    <xme:xXCWZkHxzyEYBpjsPnzBU2BkygS49Fm5KQ2wiZODEv68093OCfiRbDkFvgNs4ylIq
    zNg7JKbvF4HsO-agKk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrgeeggdehlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedflfhi
    rgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
    eqnecuggftrfgrthhtvghrnhepudefgeeftedugeehffdtheefgfevffelfefghefhjeeu
    geevtefhudduvdeihefgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrg
    hilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:xXCWZt52lvXg2r0FUCr8Pldg21ygP9uQs9__NpHOUsUBsrMqglT6BQ>
    <xmx:xXCWZq18Zx1G13DUCBEKRxrSOCgkx2fk92PAR2EWDjXzJDjnn56Rcg>
    <xmx:xXCWZgFI07CYIk3hv4CGlbyEsesGfT_8oHM0IC0w4mt3-qFdd2Rvsg>
    <xmx:xXCWZr8qedzeakvaan4WKKj-eqO-aC5_umvCGYpV4BkCe0Dn1-_H4A>
    <xmx:yHCWZiNMi5WAbUPy1KvZo5AqIJpXj9vGnZQG9x0mWda-jv_tKouiwZyc>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 7559536A0075; Tue, 16 Jul 2024 09:08:21 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-568-g843fbadbe-fm-20240701.003-g843fbadb
MIME-Version: 1.0
Message-Id: <2a2bb8b6-09ca-40c3-b6a9-d8fac7dd5208@app.fastmail.com>
In-Reply-To: <20240716111346.3676969-4-rppt@kernel.org>
References: <20240716111346.3676969-1-rppt@kernel.org>
 <20240716111346.3676969-4-rppt@kernel.org>
Date: Tue, 16 Jul 2024 21:07:59 +0800
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Mike Rapoport" <rppt@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/17] MIPS: loongson64: rename __node_data to node_data
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
Cc: nvdimm@lists.linux.dev, x86@kernel.org, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, David Hildenbrand <david@redhat.com>, linux-cxl@vger.kernel.org, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-arch@vger.kernel.org, Rob Herring <robh@kernel.org>, Vasily Gorbik <gor@linux.ibm.com>, linux-sh@vger.kernel.org, Huacai Chen <chenhuacai@kernel.org>, Christophe Leroy <christophe.leroy@csgroup.eu>, linux-acpi@vger.kernel.org, Ingo Molnar <mingo@redhat.com>, devicetree@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, linux-s390@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>, Borislav Petkov <bp@alien8.de>, loongarch@lists.linux.dev, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, "Rafael J. Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



=E5=9C=A82024=E5=B9=B47=E6=9C=8816=E6=97=A5=E4=B8=83=E6=9C=88 =E4=B8=8B=E5=
=8D=887:13=EF=BC=8CMike Rapoport=E5=86=99=E9=81=93=EF=BC=9A
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Make definition of node_data match other architectures.
> This will allow pulling declaration of node_data to the generic mm cod=
e in
> the following commit.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

MIPS should go arch_numa at some point as well.

Thanks
- Jiaxun

> ---
>  arch/mips/include/asm/mach-loongson64/mmzone.h | 4 ++--
>  arch/mips/loongson64/numa.c                    | 8 ++++----
>  2 files changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/arch/mips/include/asm/mach-loongson64/mmzone.h=20
> b/arch/mips/include/asm/mach-loongson64/mmzone.h
> index a3d65d37b8b5..2effd5f8ed62 100644
> --- a/arch/mips/include/asm/mach-loongson64/mmzone.h
> +++ b/arch/mips/include/asm/mach-loongson64/mmzone.h
> @@ -14,9 +14,9 @@
>  #define pa_to_nid(addr)  (((addr) & 0xf00000000000) >>=20
> NODE_ADDRSPACE_SHIFT)
>  #define nid_to_addrbase(nid) ((unsigned long)(nid) <<=20
> NODE_ADDRSPACE_SHIFT)
>=20
> -extern struct pglist_data *__node_data[];
> +extern struct pglist_data *node_data[];
>=20
> -#define NODE_DATA(n)		(__node_data[n])
> +#define NODE_DATA(n)		(node_data[n])
>=20
>  extern void __init prom_init_numa_memory(void);
>=20
> diff --git a/arch/mips/loongson64/numa.c b/arch/mips/loongson64/numa.c
> index 68dafd6d3e25..b50ce28d2741 100644
> --- a/arch/mips/loongson64/numa.c
> +++ b/arch/mips/loongson64/numa.c
> @@ -29,8 +29,8 @@
>=20
>  unsigned char __node_distances[MAX_NUMNODES][MAX_NUMNODES];
>  EXPORT_SYMBOL(__node_distances);
> -struct pglist_data *__node_data[MAX_NUMNODES];
> -EXPORT_SYMBOL(__node_data);
> +struct pglist_data *node_data[MAX_NUMNODES];
> +EXPORT_SYMBOL(node_data);
>=20
>  cpumask_t __node_cpumask[MAX_NUMNODES];
>  EXPORT_SYMBOL(__node_cpumask);
> @@ -107,7 +107,7 @@ static void __init node_mem_init(unsigned int node)
>  	tnid =3D early_pfn_to_nid(nd_pa >> PAGE_SHIFT);
>  	if (tnid !=3D node)
>  		pr_info("NODE_DATA(%d) on node %d\n", node, tnid);
> -	__node_data[node] =3D nd;
> +	node_data[node] =3D nd;
>  	NODE_DATA(node)->node_start_pfn =3D start_pfn;
>  	NODE_DATA(node)->node_spanned_pages =3D end_pfn - start_pfn;
>=20
> @@ -206,5 +206,5 @@ pg_data_t * __init arch_alloc_nodedata(int nid)
>=20
>  void arch_refresh_nodedata(int nid, pg_data_t *pgdat)
>  {
> -	__node_data[nid] =3D pgdat;
> +	node_data[nid] =3D pgdat;
>  }
> --=20
> 2.43.0

--=20
- Jiaxun
