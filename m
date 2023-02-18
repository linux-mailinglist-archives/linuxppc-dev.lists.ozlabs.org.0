Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB7169BA8E
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Feb 2023 16:03:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJsPV4Mn8z3fD0
	for <lists+linuxppc-dev@lfdr.de>; Sun, 19 Feb 2023 02:03:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=relay.hostedemail.com (client-ip=216.40.44.12; helo=relay.hostedemail.com; envelope-from=joe@perches.com; receiver=<UNKNOWN>)
X-Greylist: delayed 491 seconds by postgrey-1.36 at boromir; Sun, 19 Feb 2023 02:02:40 AEDT
Received: from relay.hostedemail.com (smtprelay0012.hostedemail.com [216.40.44.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJsNx009qz3c2v
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 19 Feb 2023 02:02:38 +1100 (AEDT)
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id A0BF6C01DD;
	Sat, 18 Feb 2023 14:54:14 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 76A146000A;
	Sat, 18 Feb 2023 14:54:12 +0000 (UTC)
Message-ID: <45807c0e9fc818dd433746fbb55988c73b016477.camel@perches.com>
Subject: Re: [PATCH v2 09/10] powerpc: Use ppc_md_progress()
From: Joe Perches <joe@perches.com>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Pali
	=?ISO-8859-1?Q?Roh=E1r?=
	 <pali@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin
	 <npiggin@gmail.com>
Date: Sat, 18 Feb 2023 06:54:11 -0800
In-Reply-To: <c4416002503fa19e930bc78177bb85641367c40f.1676711562.git.christophe.leroy@csgroup.eu>
References: 	<6cb9865d916231c38401ba34ad1a98c249fae135.1676711562.git.christophe.leroy@csgroup.eu>
	 <c4416002503fa19e930bc78177bb85641367c40f.1676711562.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 76A146000A
X-Spam-Status: No, score=-3.39
X-Stat-Signature: ko8ekdn8kgjoy13z5nmwfcoyx7qqiza7
X-Rspamd-Server: rspamout02
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX19KzBUQ62SvQ99BfK/AxzAcNZNwaOmCbag=
X-HE-Tag: 1676732052-331222
X-HE-Meta: U2FsdGVkX1/DZbqqps+9kd6q64cfiK8UA5TaayzVMfWlIQ4jprjRTx98Jt36YWCNM9F6tpM7eyvK3vrd0PmYCg==
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, 2023-02-18 at 10:15 +0100, Christophe Leroy wrote:
> Many places have:
>=20
> 	if (ppc.md_progress)
> 		ppc.md_progress();
>=20
> Use ppc_md_progress() instead.
>=20
> Note that checkpatch complains about using function names,
> but this is not a function taking format strings, so we
> leave the function names for now.

If you are changing almost all of these uses, why not
drop the unused 2nd argument 'hex' at the same time?

void ppc_printk_progress(char *s, unsigned short hex)
{
	pr_info("%s\n", s);
}

> diff --git a/arch/powerpc/kernel/setup_32.c b/arch/powerpc/kernel/setup_3=
2.c
[]
> @@ -127,8 +127,7 @@ __setup("l3cr=3D", ppc_setup_l3cr);
>  static int __init ppc_init(void)
>  {
>  	/* clear the progress line */
> -	if (ppc_md.progress)
> -		ppc_md.progress("             ", 0xffff);
> +	ppc_md_progress("             ", 0xffff);

	ppc_md_progress("             ");

Although this example seems especially useless.

> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mm=
u.c
[]
> @@ -347,7 +347,7 @@ void __init MMU_init_hw(void)
>  	if (!mmu_has_feature(MMU_FTR_HPTE_TABLE))
>  		return;
> =20
> -	if ( ppc_md.progress ) ppc_md.progress("hash:enter", 0x105);
> +	ppc_md_progress("hash:enter", 0x105);

	ppc_md_progress("hash:enter");

[]

> diff --git a/arch/powerpc/platforms/52xx/efika.c b/arch/powerpc/platforms=
/52xx/efika.c
[]
> @@ -189,8 +189,7 @@ static void __init efika_setup_arch(void)
>  	mpc52xx_pm_init();
>  #endif
> =20
> -	if (ppc_md.progress)
> -		ppc_md.progress("Linux/PPC " UTS_RELEASE " running on Efika ;-)\n", 0x=
0);
> +	ppc_md_progress("Linux/PPC " UTS_RELEASE " running on Efika ;-)\n", 0x0=
);

And perhaps remove the extra newlines here and other places as
it doesn't seem useful to have unnecessary blank lines in the log.

