Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CAA1798827
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 15:55:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CK9YFT5T;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RhyLT2YbVz3cCj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  8 Sep 2023 23:55:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CK9YFT5T;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RhyKW3JzXz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 23:54:55 +1000 (AEST)
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	by gandalf.ozlabs.org (Postfix) with ESMTP id 4RhyKV29NTz4xGT
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Sep 2023 23:54:54 +1000 (AEST)
Received: by gandalf.ozlabs.org (Postfix)
	id 4RhyKV25Blz4xKR; Fri,  8 Sep 2023 23:54:54 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: gandalf.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=CK9YFT5T;
	dkim-atps=neutral
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::c2b; helo=mail-oo1-xc2b.google.com; envelope-from=kernelfans@gmail.com; receiver=ozlabs.org)
Received: from mail-oo1-xc2b.google.com (mail-oo1-xc2b.google.com [IPv6:2607:f8b0:4864:20::c2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by gandalf.ozlabs.org (Postfix) with ESMTPS id 4RhyKV207Bz4xGT
	for <linuxppc-dev@ozlabs.org>; Fri,  8 Sep 2023 23:54:53 +1000 (AEST)
Received: by mail-oo1-xc2b.google.com with SMTP id 006d021491bc7-5736caaf151so1189456eaf.3
        for <linuxppc-dev@ozlabs.org>; Fri, 08 Sep 2023 06:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694181290; x=1694786090; darn=ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qC0xBOTSFQ+RrEMzwdYvhq4jdcnm/dLwGa408bPnxqY=;
        b=CK9YFT5TEdtaOhDkIjKRlix6B3JcbK8K10MLJ0iF6HTlAUmj8DlZoK/HBsbCLtpVRz
         HJFQKO9brjeDX0soQN0eRzuJYcphlo5aExLSDvGSw+rJC9aG8t9ShvoU73PdmUzMYtIJ
         GS8++mS2C82iEMx75NBprW27mhqvzTItKmmuaEjaKzrfRD69Z/Ty9SvwwHQh8OtDpFee
         d97Fh6eX/9YD6W7BYDul0/tA99cGNy443sa8Pgun7f+BDUHlpMDU9hlSL/lz/SZhDhY1
         uId3gK6e4CHP4/aBkwYjwZXdYtyhgvPGVHoQS/xyUqcwo+kFzWA+WcOLZdjpv0/UfZwI
         vBig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694181290; x=1694786090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qC0xBOTSFQ+RrEMzwdYvhq4jdcnm/dLwGa408bPnxqY=;
        b=L987Oy8pMdN/EkURqzq89hLkbvUizF7/ozNtS0lN1RPMm96pNvGIk2yg5bSFoTe5Hf
         kZ9tZ3sGss3iNrPiYs0y3jkgbcRfaqdc5AedQ355owHsswgHSP1W8HlGaJ40J2l8U/Es
         o0v48gcrP5O42PJSL1TpRaMZi62//JUarIu/rk0lsAEP7tIHCH6o5TYadEAz7WhDarDk
         H+eP3GlB5Jj+Iks6nw7gI7Q1sTOAL22k3KU54rDWLSgMw777iRmpxD8z9jQn14cvwvXH
         IcaIDnM38ZqS2DjWxftCTkk1wHtzWn4VSBQyj6XV2dKigr2+PQIBNQygVCqPWpLXng0w
         zZyw==
X-Gm-Message-State: AOJu0YyeiQjnEZ0vlud+X1G/Qv2wNr2TlS2QWAKnmKdCvmRjiqN6Htaw
	9jMaldU2Q3X+2V2y1MtpK7PnacX8k3IEhhJ+6g==
X-Google-Smtp-Source: AGHT+IGcz2G1HHiZJyAfekPOcvYoVxoZ4gOzHZWlv3CQs3uXrxjtJl7Z2npopFCRDecL5TTSXZuFku6C4rimHklPyQk=
X-Received: by 2002:a05:6358:89a:b0:13a:d269:bd22 with SMTP id
 m26-20020a056358089a00b0013ad269bd22mr2792724rwj.25.1694181290478; Fri, 08
 Sep 2023 06:54:50 -0700 (PDT)
MIME-Version: 1.0
References: <169402313576.1071869.18233618318394691773.stgit@jupiter>
In-Reply-To: <169402313576.1071869.18233618318394691773.stgit@jupiter>
From: Pingfan Liu <kernelfans@gmail.com>
Date: Fri, 8 Sep 2023 21:54:38 +0800
Message-ID: <CAFgQCTuyMws+snUX6U_4oxnroCgD6y_FMg_NuJG6HV02LbEAZg@mail.gmail.com>
Subject: Re: [RFC PATCH] powerpc: Make crashing cpu to be discovered first in
 kdump kernel.
To: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thadeu Lima de Souza Cascardo <cascardo@canonical.com>, Baoquan He <bhe@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@ozlabs.org>, Wen Xiong <wenxiong@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Mahesh,

Thanks for sharing your great idea.  I was in the middle of V5 and
finish it today.

My v5 is based on the same idea of my v4 [1] with the improvement of
the code. And I will send it out.

[1]: https://lore.kernel.org/linuxppc-dev/1520829790-14029-1-git-send-email=
-kernelfans@gmail.com/

I will have a close look at your patch later.

Thanks,

Pingfan

On Thu, Sep 7, 2023 at 1:59=E2=80=AFAM Mahesh Salgaonkar <mahesh@linux.ibm.=
com> wrote:
>
> The kernel boot parameter 'nr_cpus=3D' allows one to specify number of
> possible cpus in the system. In the normal scenario the first cpu (cpu0)
> that shows up is the boot cpu and hence it gets covered under nr_cpus
> limit.
>
> But this assumption is broken in kdump scenario where kdump kernel after =
a
> crash can boot up on an non-zero boot cpu. The paca structure allocation
> depends on value of nr_cpus and is indexed using logical cpu ids. The cpu
> discovery code brings up the cpus as they appear sequentially on device
> tree and assigns logical cpu ids starting from 0. This definitely becomes
> an issue if boot cpu id > nr_cpus. When this occurs it results into
>
> In past there were proposals to fix this by making changes to cpu discove=
ry
> code to identify non-zero boot cpu and map it to logical cpu 0. However,
> the changes were very invasive, making discovery code more complicated an=
d
> risky.
>
> Considering that the non-zero boot cpu scenario is more specific to kdump
> kernel, limiting the changes in panic/crash kexec path would probably be =
a
> best approach to have.
>
> Hence proposed change is, in crash kexec path, move the crashing cpu's
> device node to the first position under '/cpus' node, which will make the
> crashing cpu to be discovered as part of the first core in kdump kernel.
>
> In order to accommodate boot cpu for the case where boot_cpuid > nr_cpu_i=
ds,
> align up the nr_cpu_ids to SMT threads in early_init_dt_scan_cpus(). This
> will allow kdump kernel to work with nr_cpus=3DX where X will be aligned =
up
> in multiple of SMT threads per core.
>
> Signed-off-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/kexec.h  |    1
>  arch/powerpc/kernel/prom.c        |   13 ++++
>  arch/powerpc/kexec/core_64.c      |  128 +++++++++++++++++++++++++++++++=
++++++
>  arch/powerpc/kexec/file_load_64.c |    2 -
>  4 files changed, 143 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/include/asm/kexec.h b/arch/powerpc/include/asm/=
kexec.h
> index a1ddba01e7d13..f5a6f4a1b8eb0 100644
> --- a/arch/powerpc/include/asm/kexec.h
> +++ b/arch/powerpc/include/asm/kexec.h
> @@ -144,6 +144,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kimage=
 *image);
>  int setup_new_fdt_ppc64(const struct kimage *image, void *fdt,
>                         unsigned long initrd_load_addr,
>                         unsigned long initrd_len, const char *cmdline);
> +int add_node_props(void *fdt, int node_offset, const struct device_node =
*dn);
>  #endif /* CONFIG_PPC64 */
>
>  #endif /* CONFIG_KEXEC_FILE */
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index 0b5878c3125b1..c2d4f55042d72 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -322,6 +322,9 @@ static void __init check_cpu_feature_properties(unsig=
ned long node)
>         }
>  }
>
> +/* align addr on a size boundary - adjust address up */
> +#define _ALIGN_UP(addr, size)   (((addr)+((size)-1))&(~((typeof(addr))(s=
ize)-1)))
> +
>  static int __init early_init_dt_scan_cpus(unsigned long node,
>                                           const char *uname, int depth,
>                                           void *data)
> @@ -348,6 +351,16 @@ static int __init early_init_dt_scan_cpus(unsigned l=
ong node,
>
>         nthreads =3D len / sizeof(int);
>
> +       /*
> +        * Align nr_cpu_ids to correct SMT value. This will help us to al=
locate
> +        * pacas correctly to accomodate boot_cpu !=3D 0 scenario e.g. in=
 kdump
> +        * kernel the boot cpu can be any cpu between 0 through nthreads.
> +        */
> +       if (nr_cpu_ids % nthreads) {
> +               nr_cpu_ids =3D _ALIGN_UP(nr_cpu_ids, nthreads);
> +               pr_info("Aligned nr_cpus to SMT=3D%d, nr_cpu_ids =3D %d\n=
", nthreads, nr_cpu_ids);
> +       }
> +
>         /*
>          * Now see if any of these threads match our boot cpu.
>          * NOTE: This must match the parsing done in smp_setup_cpu_maps.
> diff --git a/arch/powerpc/kexec/core_64.c b/arch/powerpc/kexec/core_64.c
> index a79e28c91e2be..168bef43e22c2 100644
> --- a/arch/powerpc/kexec/core_64.c
> +++ b/arch/powerpc/kexec/core_64.c
> @@ -17,6 +17,7 @@
>  #include <linux/cpu.h>
>  #include <linux/hardirq.h>
>  #include <linux/of.h>
> +#include <linux/libfdt.h>
>
>  #include <asm/page.h>
>  #include <asm/current.h>
> @@ -298,6 +299,119 @@ extern void kexec_sequence(void *newstack, unsigned=
 long start,
>                            void (*clear_all)(void),
>                            bool copy_with_mmu_off) __noreturn;
>
> +/*
> + * Move the crashing cpus FDT node as the first node under '/cpus' node.
> + *
> + * - Get the FDT segment from the crash image segments.
> + * - Locate the crashing CPUs fdt subnode 'A' under '/cpus' node.
> + * - Now locate the crashing cpu device node 'B' from of_root device tre=
e.
> + * - Delete the crashing cpu FDT node 'A' from kexec FDT segment.
> + * - Insert the crashing cpu device node 'B' into kexec FDT segment as f=
irst
> + *   subnode under '/cpus' node.
> + */
> +static void move_crashing_cpu(struct kimage *image)
> +{
> +       void *fdt, *ptr;
> +       const char *pathp =3D NULL;
> +       unsigned long mem;
> +       const __be32 *intserv;
> +       struct device_node *dn;
> +       bool first_node =3D true;
> +       int cpus_offset, offset, fdt_index =3D -1;
> +       int initial_depth, depth, len, i, ret, nthreads;
> +
> +       /* Find the FDT segment index in kexec segment array. */
> +       for (i =3D 0; i < image->nr_segments; i++) {
> +               mem =3D image->segment[i].mem;
> +               ptr =3D __va(mem);
> +               if (ptr && fdt_magic(ptr) =3D=3D FDT_MAGIC) {
> +                       fdt_index =3D i;
> +                       break;
> +               }
> +       }
> +       if (fdt_index < 0) {
> +               pr_err("Unable to locate FDT segment.\n");
> +               return;
> +       }
> +
> +       fdt =3D __va((void *)image->segment[fdt_index].mem);
> +
> +       offset =3D cpus_offset =3D fdt_path_offset(fdt, "/cpus");
> +       if (cpus_offset < 0) {
> +               if (cpus_offset !=3D -FDT_ERR_NOTFOUND)
> +                       pr_err("Malformed device tree: error reading /cpu=
s node: %s\n",
> +                               fdt_strerror(cpus_offset));
> +               return;
> +       }
> +
> +       /* Locate crashing cpus fdt node */
> +        initial_depth =3D depth =3D 0;
> +       for (offset =3D fdt_next_node(fdt, offset, &depth);
> +               offset >=3D 0 && depth > initial_depth;
> +               offset =3D fdt_next_node(fdt, offset, &depth)) {
> +
> +
> +               intserv =3D fdt_getprop(fdt, offset, "ibm,ppc-interrupt-s=
erver#s", &len);
> +               if (!intserv) {
> +                       pr_err("Unable to fetch ibm,ppc-interrupt-server#=
s property\n");
> +                       return;
> +               }
> +
> +               /* Find the match for crashing cpus phys id. */
> +               nthreads =3D len / sizeof(int);
> +               for (i =3D 0; i < nthreads; i++) {
> +                       if (be32_to_cpu(intserv[i]) =3D=3D get_paca()->hw=
_cpu_id)
> +                               break;
> +               }
> +               if (i < nthreads) {
> +                       /* Found the match */
> +                       pathp =3D fdt_get_name(fdt, offset, NULL);
> +                       break;
> +               }
> +
> +               first_node =3D false;
> +       }
> +
> +       /*
> +        * Nothing to be done if crashing cpu's fdt node is already at fi=
rst
> +        * position OR crashing cpu's fdt node isn't present in kexec FDT
> +        * segment, which is not possible unless kexec FDT segment hasn't=
 been
> +        * refreshed after DLPAR.
> +        */
> +       if (first_node || offset < 0)
> +               return;
> +
> +       /* Locate the device node of crashing cpu from of_root */
> +       for_each_node_by_type(dn, "cpu") {
> +               if (!strcmp(dn->full_name, pathp))
> +                       break;
> +       }
> +       if (!dn) {
> +               pr_err("Could not locate device node of crashing cpu: %s\=
n", pathp);
> +               return;
> +       }
> +
> +       /* Delete the crashing cpu FDT node from kexec FDT segment */
> +       ret =3D fdt_del_node(fdt, offset);
> +       if (ret < 0) {
> +               pr_err("Error deleting node /cpus/%s: %s\n", pathp, fdt_s=
trerror(ret));
> +               return;
> +       }
> +
> +       /* Add it as first subnode under /cpus node. */
> +       offset =3D fdt_add_subnode(fdt, cpus_offset, dn->full_name);
> +       if (offset < 0) {
> +               pr_err("Unable to add %s subnode: %s\n", dn->full_name,
> +                       fdt_strerror(offset));
> +               return;
> +       }
> +
> +       /* Copy rest of the properties of crashing cpus */
> +       add_node_props(fdt, offset, dn);
> +
> +       return;
> +}
> +
>  /* too late to fail here */
>  void default_machine_kexec(struct kimage *image)
>  {
> @@ -341,6 +455,20 @@ void default_machine_kexec(struct kimage *image)
>                 printk("kexec: Unshared all shared pages.\n");
>         }
>
> +       /*
> +        * Move the crashing cpus FDT node as the first node under /cpus =
node.
> +        * This will make the core (where crashing cpu belongs) to
> +        * automatically become first core to show up in kdump kernel and
> +        * crashing cpu as boot cpu within first n threads of that core.
> +        *
> +        * Currently this will work with kexec_file_load only.
> +        *
> +        * XXX: For kexec_load, change is required in kexec tool to exclu=
de FDT
> +        * segment from purgatory checksum check.
> +        */
> +       if (image->type =3D=3D KEXEC_TYPE_CRASH && image->file_mode)
> +               move_crashing_cpu(image);
> +
>         paca_ptrs[kexec_paca.paca_index] =3D &kexec_paca;
>
>         setup_paca(&kexec_paca);
> diff --git a/arch/powerpc/kexec/file_load_64.c b/arch/powerpc/kexec/file_=
load_64.c
> index 110d28bede2a7..42d55a19454a7 100644
> --- a/arch/powerpc/kexec/file_load_64.c
> +++ b/arch/powerpc/kexec/file_load_64.c
> @@ -1027,7 +1027,7 @@ unsigned int kexec_extra_fdt_size_ppc64(struct kima=
ge *image)
>   *
>   * Returns 0 on success, negative errno on error.
>   */
> -static int add_node_props(void *fdt, int node_offset, const struct devic=
e_node *dn)
> +int add_node_props(void *fdt, int node_offset, const struct device_node =
*dn)
>  {
>         int ret =3D 0;
>         struct property *pp;
>
>
