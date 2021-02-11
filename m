Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FF09319169
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 18:49:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dc3zL24RCzDwrX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Feb 2021 04:49:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182;
 helo=linux.microsoft.com; envelope-from=nramas@linux.microsoft.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com
 header.a=rsa-sha256 header.s=default header.b=CmSPCx04; 
 dkim-atps=neutral
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Dc3xm5DH1zDwpV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Feb 2021 04:47:56 +1100 (AEDT)
Received: from [192.168.0.104] (c-73-42-176-67.hsd1.wa.comcast.net
 [73.42.176.67])
 by linux.microsoft.com (Postfix) with ESMTPSA id BFDFA20B6C40;
 Thu, 11 Feb 2021 09:47:54 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BFDFA20B6C40
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1613065674;
 bh=6EuwAepO8sOWBBXJJIWofEAs3v7xM/DSiHtcGVvxwIU=;
 h=Subject:From:To:References:Date:In-Reply-To:From;
 b=CmSPCx04+vjfxsw342xmIeFrmzFMAteny0futqbrEGNa3rCrnJ/6ilMS0dsWVanVj
 AIHyozVtCvKwVnCdVBWGIPaY3JWRcnmaMpIXlHepOVngvhXi1YpB7r3GQIWMgAI/D+
 pTI3oUxMdHmXYpHjBEVUC3N1ZBTI337ZQ3jX19Ew=
Subject: Re: Fwd: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup
 function
From: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
To: Rob Herring <robh@kernel.org>,
 Thiago Jung Bauermann <bauerman@linux.ibm.com>,
 Mimi Zohar <zohar@linux.ibm.com>, linux-integrity@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linux-integrity@vger.kernel.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
References: <202102120032.Bv0MoYv7-lkp@intel.com>
 <40fd1869-dcb4-36ae-e997-b8486dd4846c@linux.microsoft.com>
Message-ID: <b534117e-333d-097c-a3c0-2a80985bd37f@linux.microsoft.com>
Date: Thu, 11 Feb 2021 09:47:54 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <40fd1869-dcb4-36ae-e997-b8486dd4846c@linux.microsoft.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2/11/21 9:42 AM, Lakshmi Ramasubramanian wrote:
> Hi Rob,
> 
> [PATCH] powerpc: Rename kexec elfcorehdr_addr to elf_headers_mem
> 
> This change causes build problem for x86_64 architecture (please see the 
> mail from kernel test bot below) since arch/x86/include/asm/kexec.h uses 
> "elf_load_addr" for the ELF header buffer address and not 
> "elf_headers_mem".
> 
> struct kimage_arch {
>      ...
> 
>      /* Core ELF header buffer */
>      void *elf_headers;
>      unsigned long elf_headers_sz;
>      unsigned long elf_load_addr;
> };
> 
> I am thinking of limiting of_kexec_alloc_and_setup_fdt() to ARM64 and 
> PPC64 since they are the only ones using this function now.
> 
> #if defined(CONFIG_ARM64) && defined(CONFIG_PPC64)
Sorry - I meant to say
#if defined(CONFIG_ARM64) || defined(CONFIG_PPC64)

> void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>                     unsigned long initrd_load_addr,
>                     unsigned long initrd_len,
>                     const char *cmdline)
> {
>      ...
> }
> #endif /* defined(CONFIG_ARM64) && defined(CONFIG_PPC64) */
> 
> Please let me know if you have any concerns.
> 
> thanks,
>   -lakshmi
> 
> -------- Forwarded Message --------
> Subject: Re: [PATCH v17 02/10] of: Add a common kexec FDT setup function
> Date: Fri, 12 Feb 2021 00:50:20 +0800
> From: kernel test robot <lkp@intel.com>
> To: Lakshmi Ramasubramanian <nramas@linux.microsoft.com>
> CC: kbuild-all@lists.01.org
> 
> Hi Lakshmi,
> 
> I love your patch! Yet something to improve:
> 
> [auto build test ERROR on integrity/next-integrity]
> [also build test ERROR on v5.11-rc7 next-20210211]
> [cannot apply to powerpc/next robh/for-next arm64/for-next/core]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch]
> 
> url: 
> https://github.com/0day-ci/linux/commits/Lakshmi-Ramasubramanian/Carry-forward-IMA-measurement-log-on-kexec-on-ARM64/20210211-071924 
> 
> base: 
> https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity 
> 
> config: x86_64-randconfig-m001-20210211 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=1 build):
>          # 
> https://github.com/0day-ci/linux/commit/12ae86067d115b84092353109e8798693d102f0d 
> 
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review 
> Lakshmi-Ramasubramanian/Carry-forward-IMA-measurement-log-on-kexec-on-ARM64/20210211-071924 
> 
>          git checkout 12ae86067d115b84092353109e8798693d102f0d
>          # save the attached .config to linux build tree
>          make W=1 ARCH=x86_64
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> 
> All errors (new ones prefixed by >>):
> 
>     drivers/of/kexec.c: In function 'of_kexec_alloc_and_setup_fdt':
>>> drivers/of/kexec.c:183:17: error: 'const struct kimage_arch' has no 
>>> member named 'elf_headers_mem'; did you mean 'elf_headers_sz'?
>       183 |     image->arch.elf_headers_mem,
>           |                 ^~~~~~~~~~~~~~~
>           |                 elf_headers_sz
>     drivers/of/kexec.c:192:42: error: 'const struct kimage_arch' has no 
> member named 'elf_headers_mem'; did you mean 'elf_headers_sz'?
>       192 |   ret = fdt_add_mem_rsv(fdt, image->arch.elf_headers_mem,
>           |                                          ^~~~~~~~~~~~~~~
>           |                                          elf_headers_sz
> 
> 
> vim +183 drivers/of/kexec.c
> 
>      65
>      66    /*
>      67     * of_kexec_alloc_and_setup_fdt - Alloc and setup a new 
> Flattened Device Tree
>      68     *
>      69     * @image:        kexec image being loaded.
>      70     * @initrd_load_addr:    Address where the next initrd will 
> be loaded.
>      71     * @initrd_len:        Size of the next initrd, or 0 if there 
> will be none.
>      72     * @cmdline:        Command line for the next kernel, or NULL 
> if there will
>      73     *            be none.
>      74     *
>      75     * Return: fdt on success, or NULL errno on error.
>      76     */
>      77    void *of_kexec_alloc_and_setup_fdt(const struct kimage *image,
>      78                       unsigned long initrd_load_addr,
>      79                       unsigned long initrd_len,
>      80                       const char *cmdline)
>      81    {
>      82        void *fdt;
>      83        int ret, chosen_node;
>      84        const void *prop;
>      85        unsigned long fdt_size;
>      86
>      87        fdt_size = fdt_totalsize(initial_boot_params) +
>      88               (cmdline ? strlen(cmdline) : 0) +
>      89               FDT_EXTRA_SPACE;
>      90
>      91        fdt = kvmalloc(fdt_size, GFP_KERNEL);
>      92        if (!fdt)
>      93            return NULL;
>      94
>      95        ret = fdt_open_into(initial_boot_params, fdt, fdt_size);
>      96        if (ret < 0) {
>      97            pr_err("Error %d setting up the new device tree.\n", 
> ret);
>      98            goto out;
>      99        }
>     100
>     101        /* Remove memory reservation for the current device tree. */
>     102        ret = fdt_find_and_del_mem_rsv(fdt, 
> __pa(initial_boot_params),
>     103                           fdt_totalsize(initial_boot_params));
>     104        if (ret == -EINVAL) {
>     105            pr_err("Error removing memory reservation.\n");
>     106            goto out;
>     107        }
>     108
>     109        chosen_node = fdt_path_offset(fdt, "/chosen");
>     110        if (chosen_node == -FDT_ERR_NOTFOUND)
>     111            chosen_node = fdt_add_subnode(fdt, 
> fdt_path_offset(fdt, "/"),
>     112                              "chosen");
>     113        if (chosen_node < 0) {
>     114            ret = chosen_node;
>     115            goto out;
>     116        }
>     117
>     118        ret = fdt_delprop(fdt, chosen_node, FDT_PROP_KEXEC_ELFHDR);
>     119        if (ret && ret != -FDT_ERR_NOTFOUND)
>     120            goto out;
>     121        ret = fdt_delprop(fdt, chosen_node, FDT_PROP_MEM_RANGE);
>     122        if (ret && ret != -FDT_ERR_NOTFOUND)
>     123            goto out;
>     124
>     125        /* Did we boot using an initrd? */
>     126        prop = fdt_getprop(fdt, chosen_node, 
> "linux,initrd-start", NULL);
>     127        if (prop) {
>     128            u64 tmp_start, tmp_end, tmp_size;
>     129
>     130            tmp_start = fdt64_to_cpu(*((const fdt64_t *) prop));
>     131
>     132            prop = fdt_getprop(fdt, chosen_node, 
> "linux,initrd-end", NULL);
>     133            if (!prop) {
>     134                ret = -EINVAL;
>     135                goto out;
>     136            }
>     137
>     138            tmp_end = fdt64_to_cpu(*((const fdt64_t *) prop));
>     139
>     140            /*
>     141             * kexec reserves exact initrd size, while firmware may
>     142             * reserve a multiple of PAGE_SIZE, so check for both.
>     143             */
>     144            tmp_size = tmp_end - tmp_start;
>     145            ret = fdt_find_and_del_mem_rsv(fdt, tmp_start, 
> tmp_size);
>     146            if (ret == -ENOENT)
>     147                ret = fdt_find_and_del_mem_rsv(fdt, tmp_start,
>     148                                   round_up(tmp_size, PAGE_SIZE));
>     149            if (ret == -EINVAL)
>     150                goto out;
>     151        }
>     152
>     153        /* add initrd-* */
>     154        if (initrd_load_addr) {
>     155            ret = fdt_setprop_u64(fdt, chosen_node, 
> FDT_PROP_INITRD_START,
>     156                          initrd_load_addr);
>     157            if (ret)
>     158                goto out;
>     159
>     160            ret = fdt_setprop_u64(fdt, chosen_node, 
> FDT_PROP_INITRD_END,
>     161                          initrd_load_addr + initrd_len);
>     162            if (ret)
>     163                goto out;
>     164
>     165            ret = fdt_add_mem_rsv(fdt, initrd_load_addr, 
> initrd_len);
>     166            if (ret)
>     167                goto out;
>     168
>     169        } else {
>     170            ret = fdt_delprop(fdt, chosen_node, 
> FDT_PROP_INITRD_START);
>     171            if (ret && (ret != -FDT_ERR_NOTFOUND))
>     172                goto out;
>     173
>     174            ret = fdt_delprop(fdt, chosen_node, 
> FDT_PROP_INITRD_END);
>     175            if (ret && (ret != -FDT_ERR_NOTFOUND))
>     176                goto out;
>     177        }
>     178
>     179        if (image->type == KEXEC_TYPE_CRASH) {
>     180            /* add linux,elfcorehdr */
>     181            ret = fdt_appendprop_addrrange(fdt, 0, chosen_node,
>     182                    FDT_PROP_KEXEC_ELFHDR,
>   > 183                    image->arch.elf_headers_mem,
> 
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
> 

