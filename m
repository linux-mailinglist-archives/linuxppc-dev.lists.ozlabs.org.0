Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B52A03A4ABA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Jun 2021 23:41:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G1vSM1PNqz3c46
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Jun 2021 07:41:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=k+vs4KqQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.com
 (client-ip=212.227.15.19; helo=mout.gmx.net;
 envelope-from=quwenruo.btrfs@gmx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=k+vs4KqQ; 
 dkim-atps=neutral
X-Greylist: delayed 315 seconds by postgrey-1.36 at boromir;
 Fri, 11 Jun 2021 23:53:23 AEST
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G1j3l2vP4z30Fq
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Jun 2021 23:53:22 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1623419598;
 bh=DQZaNV/hwR/W07WPShIulNh1yaAYynzVvSqkCu5eIgw=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=k+vs4KqQcKtkuYNuuFhylDdiMRatG90IsOywwFiHe7fmyC2zqLlUjacBItefCL/zm
 86nxxfxwPu4BLjQnGSDHs51dYrB1q0ftxC+0Noq7StQh1NrvItXumZYM60EL7OF904
 6AtpUFwl3mt3Pe9xnRzckIyyYWTjn1rupT7/UNZg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([45.77.180.217]) by mail.gmx.net (mrgmx005
 [212.227.17.184]) with ESMTPSA (Nemesis) id 1MMGRA-1laadG39Pi-00JMkH; Fri, 11
 Jun 2021 15:47:49 +0200
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Mason <clm@fb.com>, 
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
Message-ID: <a2411cbb-d793-5e11-dd4f-cc25ca55ed91@gmx.com>
Date: Fri, 11 Jun 2021 21:47:39 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:Oz7Y2Pd5S35Xo4teAX2NkhjMPqdlSnZ/X9M7YWX87qJwU02UdFX
 ONeoj46pv+uWradLLCwtNKQu4Cfv5yDkU6d45LZ5rCh+Y/quqn58yXkyyZr6GdAEf3NTJn6
 z73x+9KfLF5ujCc1xo8aUcmcu5186WRbra////x4K2z4hYyKti1aXCI9uvZG1WZSdk0eBZg
 3K2AT4odeGMgO39E5fGTw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Giv8/+Lm8kk=:0aAPt1Dbk5O4U69QzYRTC9
 Bi5Jlugde0oqnR29+zIrkXmtFeahPkwigZA9Jg8bj9X6PduvZNfDj8U1bI6tI03H/BQal7YSa
 We/Ec5idJDLjU7FqTT6fDEZzp0yHwnV63F+zNVexvKUaX3554y2Fyjls/NbCwcJR2aQzBuzvq
 iJBhnfbF++FRRbgKAViz58HWMPdSr2qvynkwSFv49e36Q5KznrUMxUKyrTCmyuLmtEoo7AYHK
 vb7chU3dtC9wzGXhg+XBtJSAcyPJZitDC6xoiecemgzS2bbAKDE1abeF5XbNS5YFuBoaEVKgZ
 mdzPSyg8jVF0p2Gq0sb3LvY+MZqtZ6YXW0Nfw6SBsOdw/B56TYz2CuRnGERZCHiCaa8Z421Gy
 wP5/ECymU8AXZT2JO9EtBXuUYWpon6YRqxuMdVseUcWPy2Awg2wBi50HF26GDjEiyKg9bgaic
 cRYsLNdeaX8Ltyc0URXlhObMJ6x88a4GrNEhT2Z+XnJkdVYZOUamZFiLuDqzHyvfCuc+4BlNM
 qQqkUIYSev/zh2uapk7KyEbAFOURbjcejr8j2vAHKCVo8UL2FKrbfFyc1TTY/7BvmSfwY3IjP
 dCQZRkHY10AMgZCRhdCthWTAoSodnPeHws8DN1wCG6WTbPtXkyKHYDo9oqOG/mW56bKDb8gQa
 eBweDVPGl9iSLmUGDkIELRo6Ijoj9Po8hOaKHfvi7Y9EfIACGLf75+LtlyICggYPu+DP94pna
 TCMeHg3dbAjvysgKJkjrMWKsEhsCYCZlzc+51zKKv/KbqEa8i1nKtAuymluYtEH8+Ox5xjxNW
 2fK/x9Q4zMyKma4/G2muOhg00P/0llCLa0Lm6gfWXCewGxquqZ50ZAVtX9VVnzueT4SprU6V0
 j20O3GwS8pFk55lxtJ1l3+YqTAqNJb9qvfITAM25IXzdSUQ5LT4ZIbUG59nAM9ZDYxv0Aiiq0
 rK608IXW0uZiCet20Q1EVl0zQD52ocIJ/ZFqjvoe2R2UY/cNHMZYgUy/C7q6/YGIWt1+IrjBu
 08UGrZGIlDvX05z7wu7NbV/uP+IjX8CZ8Yf/KXHDem79mT93jXLLABnyU5Rn76Ft3cMKBFo3r
 VylBtjX/cC0VBveSY8Pjx98vG9qFO+EM2YYVAY2RxbynEghOD1HnTCCrw==
X-Mailman-Approved-At: Sat, 12 Jun 2021 07:41:32 +1000
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
Cc: linux-hexagon@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-btrfs@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2021/6/10 =E4=B8=8B=E5=8D=881:23, Christophe Leroy wrote:
> With a config having PAGE_SIZE set to 256K, BTRFS build fails
> with the following message
>
>   include/linux/compiler_types.h:326:38: error: call to '__compiletime_a=
ssert_791' declared with attribute error: BUILD_BUG_ON failed: (BTRFS_MAX_=
COMPRESSED % PAGE_SIZE) !=3D 0
>
> BTRFS_MAX_COMPRESSED being 128K, BTRFS cannot support platforms with
> 256K pages at the time being.
>
> There are two platforms that can select 256K pages:
>   - hexagon
>   - powerpc
>
> Disable BTRFS when 256K page size is selected.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>   fs/btrfs/Kconfig | 2 ++
>   1 file changed, 2 insertions(+)
>
> diff --git a/fs/btrfs/Kconfig b/fs/btrfs/Kconfig
> index 68b95ad82126..520a0f6a7d9e 100644
> --- a/fs/btrfs/Kconfig
> +++ b/fs/btrfs/Kconfig
> @@ -18,6 +18,8 @@ config BTRFS_FS
>   	select RAID6_PQ
>   	select XOR_BLOCKS
>   	select SRCU
> +	depends on !PPC_256K_PAGES	# powerpc
> +	depends on !PAGE_SIZE_256KB	# hexagon

I'm OK to disable page size other than 4K, 16K, 32K, 64K for now.

Although for other reasons.

Not only for the BUILD_BUG_ON(), but for the fact that btrfs only
support 4K, 16K, 32K, 64K sectorsize, and requires PAGE_SIZE =3D=3D sector=
size.

Although we're adding subpage support, the subpage support only comes
with 4K sectorsize on 64K page size.

Until variable length version is introduced, 256K/128K page size won't
be support.

Thus I'm fine to disable BTRFS for any arch outside of the supported
page sizes for now.

Thanks,
Qu
>
>   	help
>   	  Btrfs is a general purpose copy-on-write filesystem with extents,
>
