Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EC34F28B35A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 13:04:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C8wmw0zcnzDqR7
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Oct 2020 22:04:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C8wl46JzNzDqgC
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Oct 2020 22:03:08 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4C8wkq4M1Qz9tyxp;
 Mon, 12 Oct 2020 13:02:59 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id HC-RA1I_1qin; Mon, 12 Oct 2020 13:02:59 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4C8wkq3Gt8z9tyxm;
 Mon, 12 Oct 2020 13:02:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 389D08B788;
 Mon, 12 Oct 2020 13:02:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 60P1PKY0it_H; Mon, 12 Oct 2020 13:02:57 +0200 (CEST)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B5F268B78B;
 Mon, 12 Oct 2020 13:02:56 +0200 (CEST)
Subject: Re: [PATCH -next v2] powerpc/mm: ptdump: Convert to
 DEFINE_SHOW_ATTRIBUTE
To: Qinglang Miao <miaoqinglang@huawei.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>
References: <20200919012901.174233-1-miaoqinglang@huawei.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <43d67a2b-6e44-9349-e0b5-80d1f50ed000@csgroup.eu>
Date: Mon, 12 Oct 2020 13:02:58 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.1
MIME-Version: 1.0
In-Reply-To: <20200919012901.174233-1-miaoqinglang@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Le 19/09/2020 à 03:29, Qinglang Miao a écrit :
> Use DEFINE_SHOW_ATTRIBUTE macro to simplify the code.
> 
> Signed-off-by: Qinglang Miao <miaoqinglang@huawei.com>
> ---
> v2: based on linux-next(20200917), and can be applied to
>      mainline cleanly now.

After the removal of powerpc 601, this patch needs to be rebased (as of linux-next 20201012)

I think now, bats_show_603() should simply be renamed bats_show()

Christophe

> 
>   arch/powerpc/mm/ptdump/bats.c          | 24 +++++++-----------------
>   arch/powerpc/mm/ptdump/hashpagetable.c | 12 +-----------
>   arch/powerpc/mm/ptdump/ptdump.c        | 13 +------------
>   arch/powerpc/mm/ptdump/segment_regs.c  | 12 +-----------
>   4 files changed, 10 insertions(+), 51 deletions(-)
> 
> diff --git a/arch/powerpc/mm/ptdump/bats.c b/arch/powerpc/mm/ptdump/bats.c
> index e29b338d4..a24495e93 100644
> --- a/arch/powerpc/mm/ptdump/bats.c
> +++ b/arch/powerpc/mm/ptdump/bats.c
> @@ -56,7 +56,7 @@ static void bat_show_601(struct seq_file *m, int idx, u32 lower, u32 upper)
>   
>   #define BAT_SHOW_601(_m, _n, _l, _u) bat_show_601(_m, _n, mfspr(_l), mfspr(_u))
>   
> -static int bats_show_601(struct seq_file *m, void *v)
> +static int bats_601_show(struct seq_file *m, void *v)
>   {
>   	seq_puts(m, "---[ Block Address Translation ]---\n");
>   
> @@ -113,7 +113,7 @@ static void bat_show_603(struct seq_file *m, int idx, u32 lower, u32 upper, bool
>   
>   #define BAT_SHOW_603(_m, _n, _l, _u, _d) bat_show_603(_m, _n, mfspr(_l), mfspr(_u), _d)
>   
> -static int bats_show_603(struct seq_file *m, void *v)
> +static int bats_603_show(struct seq_file *m, void *v)
>   {
>   	seq_puts(m, "---[ Instruction Block Address Translation ]---\n");
>   
> @@ -144,25 +144,15 @@ static int bats_show_603(struct seq_file *m, void *v)
>   	return 0;
>   }
>   
> -static int bats_open(struct inode *inode, struct file *file)
> -{
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_601))
> -		return single_open(file, bats_show_601, NULL);
> -
> -	return single_open(file, bats_show_603, NULL);
> -}
> -
> -static const struct file_operations bats_fops = {
> -	.open		= bats_open,
> -	.read		= seq_read,
> -	.llseek		= seq_lseek,
> -	.release	= single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(bats_601);
> +DEFINE_SHOW_ATTRIBUTE(bats_603);
>   
>   static int __init bats_init(void)
>   {
>   	debugfs_create_file("block_address_translation", 0400,
> -			    powerpc_debugfs_root, NULL, &bats_fops);
> +			    powerpc_debugfs_root, NULL,
> +			    IS_ENABLED(CONFIG_PPC_BOOK3S_601) ?
> +			    &bats_601_fops : & bats_603_fops);
>   	return 0;
>   }
>   device_initcall(bats_init);
> diff --git a/arch/powerpc/mm/ptdump/hashpagetable.c b/arch/powerpc/mm/ptdump/hashpagetable.c
> index ad6df9a2e..c7f824d29 100644
> --- a/arch/powerpc/mm/ptdump/hashpagetable.c
> +++ b/arch/powerpc/mm/ptdump/hashpagetable.c
> @@ -526,17 +526,7 @@ static int ptdump_show(struct seq_file *m, void *v)
>   	return 0;
>   }
>   
> -static int ptdump_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ptdump_show, NULL);
> -}
> -
> -static const struct file_operations ptdump_fops = {
> -	.open		= ptdump_open,
> -	.read		= seq_read,
> -	.llseek		= seq_lseek,
> -	.release	= single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(ptdump);
>   
>   static int ptdump_init(void)
>   {
> diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
> index aca354fb6..6bbf85ff2 100644
> --- a/arch/powerpc/mm/ptdump/ptdump.c
> +++ b/arch/powerpc/mm/ptdump/ptdump.c
> @@ -413,18 +413,7 @@ static int ptdump_show(struct seq_file *m, void *v)
>   	return 0;
>   }
>   
> -
> -static int ptdump_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, ptdump_show, NULL);
> -}
> -
> -static const struct file_operations ptdump_fops = {
> -	.open		= ptdump_open,
> -	.read		= seq_read,
> -	.llseek		= seq_lseek,
> -	.release	= single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(ptdump);
>   
>   static void build_pgtable_complete_mask(void)
>   {
> diff --git a/arch/powerpc/mm/ptdump/segment_regs.c b/arch/powerpc/mm/ptdump/segment_regs.c
> index dde2fe8de..9e870d44c 100644
> --- a/arch/powerpc/mm/ptdump/segment_regs.c
> +++ b/arch/powerpc/mm/ptdump/segment_regs.c
> @@ -41,17 +41,7 @@ static int sr_show(struct seq_file *m, void *v)
>   	return 0;
>   }
>   
> -static int sr_open(struct inode *inode, struct file *file)
> -{
> -	return single_open(file, sr_show, NULL);
> -}
> -
> -static const struct file_operations sr_fops = {
> -	.open		= sr_open,
> -	.read		= seq_read,
> -	.llseek		= seq_lseek,
> -	.release	= single_release,
> -};
> +DEFINE_SHOW_ATTRIBUTE(sr);
>   
>   static int __init sr_init(void)
>   {
> 
