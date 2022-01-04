Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9F3484B3D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 00:39:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JT8Ft2XNhz3bXJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jan 2022 10:38:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256 header.s=badeba3b8450 header.b=fDo450mq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=gmx.com
 (client-ip=212.227.17.21; helo=mout.gmx.net;
 envelope-from=quwenruo.btrfs@gmx.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=gmx.net header.i=@gmx.net header.a=rsa-sha256
 header.s=badeba3b8450 header.b=fDo450mq; 
 dkim-atps=neutral
X-Greylist: delayed 312 seconds by postgrey-1.36 at boromir;
 Wed, 05 Jan 2022 10:38:21 AEDT
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JT8F90NwYz2xBJ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jan 2022 10:38:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1641339498;
 bh=86C2wftjndtAK2iWcv41C0xFmPUyW3b0hrtgz4GnTTg=;
 h=X-UI-Sender-Class:Date:Subject:To:Cc:References:From:In-Reply-To;
 b=fDo450mqNVrwR8+PsjpEEBFt9sp0vBqc5r5npj1IhcwBAq/2gRCBzCL3s4ci75T0G
 lO+J1abnw8PQvPPUUGqfULnqMegEFGesy0VwOTGSF8VTpcqsit5/6N/gYj3lFauENe
 okhI7xGPz9NRw2OpU+AUKdYwfX9hh9BHTR5ojycw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [0.0.0.0] ([149.28.201.231]) by mail.gmx.net (mrgmx104
 [212.227.17.174]) with ESMTPSA (Nemesis) id 1Mw9QC-1mCnEw1VLw-00s4eI; Wed, 05
 Jan 2022 00:32:55 +0100
Message-ID: <6c7a6762-6bec-842b-70b4-4a53297687d1@gmx.com>
Date: Wed, 5 Jan 2022 07:32:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] fs: btrfs: Disable BTRFS on platforms having 256K pages
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Chris Mason <clm@fb.com>, 
 Josef Bacik <josef@toxicpanda.com>, David Sterba <dsterba@suse.com>
References: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
From: Qu Wenruo <quwenruo.btrfs@gmx.com>
In-Reply-To: <a16c31f3caf448dda5d9315e056585b6fafc22c5.1623302442.git.christophe.leroy@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:wgQa5C7dmPnoEf96aFIhDwr56crC+9t4UEuJO6iZ7LATkecwpmn
 2o4Ffdh638ZuQ3AZ/sHWO1B/LgDuf6rkh+vFOqSlw3slUMp4aZGQF8mFNVq6etD83zMZYEE
 5khf5L+YplEVXjk6LrIm9F4lFP77VI93pDYjn9u+6SRa1523PBu5ER9jj7DE18Pxm79blJi
 X06GHFHoRXKO04ZRE7S9Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Gu9wtxcBWwY=:ik7XzxOcKn78Dg62Ap8x/y
 tatdoi8ouoU5zZ+9Tn+GWzKgU8tniQH9mN8ekFUySgr569hnsE+YBDiocLi9UN4z4MFfrzaFV
 C33mQaesqZMjWxZtBIVzZdRORiSVpxi2RfcDHR8y53OLypeVO/hUcDiwJd7Bn7r8n9lxzdGuq
 XvQiQbBDX3hBvNx9oxeano5CHX+bVncDTr1kB6SCtxttxP6ehkYHz0G3YQwdFizlG5DKevD88
 /wdXsP70W06IBpfKVsIPyzP8/7M0nBq8XJnDoOMSuSgibHR1Ce29TMUhd5oqUwFTyK6wzbCsp
 wSfG20awvT/CrxoPRoV94+EospMxJg8a5UpT8+by8LfAHiYtpKrxbvAyuqQro43cJUpYq2HdH
 yJA/zuvBHnj3it/n5QCu47tR4W1r3auXb12nI5EYnMdv7QZci5bj5QxFSUPDVw0ZFItDxhd0/
 VVBmUD8c8ygWnhviHLGST117AIZ95mrXVTJfDjryHaYQtVrpI+EdHAV5oSPnTjviSaiHCmn0U
 coU2KSPlRcArlyPMlMFD/Ef0I5ev66vlI3zsZNrhiNG/IA7rXBYANzfh3E6PsvRxMvGWRKiwb
 D2EVopkuaEZeC0BsoyAazw11Jox+jJpGF8Jl6yFLFNTz8xukvcoQ8EZkJPVjQUPbUjPLu4NAT
 hTvIwsGvsPEEQjl47tw1JrLx+0Qrg3QBgCpM9Dz+U2G5ZBu63HOoZqjfGSYQp0evcG9BE5hOZ
 bFmRPRSlNtzpjh8S+lsIruo542xD7+fo8XMj99IJpFF5n+SNUMwFd9aRc4c/gSBkn74uKOaKg
 fqkP05+25LfDgEACgPF3aa6zd7yO4foHmOsdYD++gC1CCQF6E57VeR4UcUFZRTJBmgnUCOAZN
 e0d+iDC1d1XrtdohKoNrCGCxmTOUDWmw8CpzhXGDN/DILQ+FdYYOWvkJ8vt3U8xnTnKbDbSFr
 G+DG7jc4EwHFgMnW6gPKS5vUtnISIpq4rH36aPATPlDoljlPxJf2dfWdZl8EyTNqbxYFxEtq0
 8A77mOwxIWFkN1lhTwYP3+YPnYAR+OfThPXm8BaeA6uk1il7S7BHwGkSQynhovkDFSQZSVV2g
 R7HfNPZTVhOYjU=
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

Hi Christophe,

I'm recently enhancing the subpage support for btrfs, and my current
branch should solve the problem for btrfs to support larger page sizes.

But unfortunately my current test environment can only provide page size
with 64K or 4K, no 16K or 128K/256K support.

Mind to test my new branch on 128K page size systems?
(256K page size support is still lacking though, which will be addressed
in the future)

https://github.com/adam900710/linux/tree/metadata_subpage_switch

Thanks,
Qu

On 2021/6/10 13:23, Christophe Leroy wrote:
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
>
>   	help
>   	  Btrfs is a general purpose copy-on-write filesystem with extents,
