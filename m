Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B8492841C91
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 08:29:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dIf6z8gJ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dWKtxfWJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPGy44g36z3cM7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 18:29:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dIf6z8gJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=dWKtxfWJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPGxK1t3tz303d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 18:28:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706599712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=am88xYWpJaG93q3qG+mYeSVgM3JEqxYmPGVyxw1vBgk=;
	b=dIf6z8gJDRw5iApsC2j3Iuh/Batoc2kHf5F/FI1onLAY1uOhd31CxW3lQSt5m2qZozmZ7w
	INE1apoOoTI2kNc2DxLL+twJYJwi193VbSad0G2avKpIndiHX3KIazeOxZ5wW6G6dhxBse
	2I4ByijMze+9JtoeiPE5I/7iliwYGOg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706599713;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=am88xYWpJaG93q3qG+mYeSVgM3JEqxYmPGVyxw1vBgk=;
	b=dWKtxfWJvDx7scpAwSnK31R+YLYLCb5fRYwH9Yg3c+Hyvsx+HTaYfN74/c0gvGqCJx6X4A
	QkOs2+9Bm4RjnIBhcoZdAP+4DU9kGTJtDZtjVgaNbKi9HYnTJSRMJY3dNLe7/zCf5t66Fq
	uF0Qm+glSZl6COtVp+rdnXuq9QfV33I=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-132-1bMyJKOTP1qjB5ilqkVvPw-1; Tue, 30 Jan 2024 02:28:30 -0500
X-MC-Unique: 1bMyJKOTP1qjB5ilqkVvPw-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-68c4f9c5c4fso40094816d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jan 2024 23:28:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706599710; x=1707204510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=am88xYWpJaG93q3qG+mYeSVgM3JEqxYmPGVyxw1vBgk=;
        b=aHo74yykIrjyxCivd61EyYhE4sK2EjCRtYPhsSXieUC/W3An/ph9m7a9l1gfn3JV/R
         1oxEMDxBlLDQhdnZbH5dTk9nLPDFX2t+9gXW3+QHTW+i8miiedH+maARPz9DqkRlgMAq
         GPZxXrBA+2PdlMJ4ILN28rXaFBTMYGfQ9I5jWI+tZZyQ50gs7f1BkisRFphYD23Q7UAq
         GVQaY863yZEOfUnfE57VqZfuhQZnwVSt/4e9iFLKGLpKe6b3NkacKM54tNilMuBxvxs8
         HnfzHE32hKXZDYvUFh5pKXlgwwVzeSVCLU6SAVP2w+hWjYoJlgf+26Qe0LDzWN7kFIX4
         BQUA==
X-Gm-Message-State: AOJu0YwU6db0VoMuSQ9nD29jwy5arZSULlIHSDQd2pbGP6etlAlXcbjv
	NatnKeSwjtZfp4/pWR7y+Kt29CKY1Of8o0Ijz6yPfh1hAUf4oND4LwQDkBhTD0pTU7kxWNNYGo5
	FnuC7yrUS7Q3y/Qp9kfSyXYBkm8HULy1lua/UUhpF498dQVw+S/sIxcBDPvjKBCuer/RvS/b4k5
	Qq4PQV7OYnv5ANM/UQDoE9lZA8L++rX4Df3I8FvA==
X-Received: by 2002:a05:6214:1c09:b0:681:57da:2345 with SMTP id u9-20020a0562141c0900b0068157da2345mr10374973qvc.67.1706599710172;
        Mon, 29 Jan 2024 23:28:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdqJmhfeHUaTMbX6t0d4OevvaGBjszfq7ObUC54ioXb5oecGPSzjP8VwrXKcErLs/GLRHPfQUtC4llo6BjvAE=
X-Received: by 2002:a05:6214:1c09:b0:681:57da:2345 with SMTP id
 u9-20020a0562141c0900b0068157da2345mr10374953qvc.67.1706599709778; Mon, 29
 Jan 2024 23:28:29 -0800 (PST)
MIME-Version: 1.0
References: <1526977424-25243-1-git-send-email-kernelfans@gmail.com> <9ec1b69c-5a36-4dcc-935f-cc02bb87c4ca@csgroup.eu>
In-Reply-To: <9ec1b69c-5a36-4dcc-935f-cc02bb87c4ca@csgroup.eu>
From: Pingfan Liu <piliu@redhat.com>
Date: Tue, 30 Jan 2024 15:28:18 +0800
Message-ID: <CAF+s44RzdJB3tUEN9zzo5LeF-dZf=G1E6sJumBcN7ucvpT1OOw@mail.gmail.com>
Subject: Re: [PATCH v6 (proposal)] powerpc/cpu: enable nr_cpus for crash kernel
To: Christophe Leroy <christophe.leroy@csgroup.eu>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
Cc: "dyoung@redhat.com" <dyoung@redhat.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, Pingfan Liu <kernelfans@gmail.com>, "Guilherme G . Piccoli" <gpiccoli@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christophe,

The latest series is
https://lore.kernel.org/linuxppc-dev/20231017022806.4523-1-piliu@redhat.com=
/

And Michael has his implement on:
https://lore.kernel.org/all/20231229120107.2281153-3-mpe@ellerman.id.au/T/#=
m46128446bce1095631162a1927415733a3bf0633

Thanks,

Pingfan

On Fri, Jan 26, 2024 at 3:40=E2=80=AFAM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Hi,
>
> Le 22/05/2018 =C3=A0 10:23, Pingfan Liu a =C3=A9crit :
> > For kexec -p, the boot cpu can be not the cpu0, this causes the problem
> > to alloc paca[]. In theory, there is no requirement to assign cpu's log=
ical
> > id as its present seq by device tree. But we have something like
> > cpu_first_thread_sibling(), which makes assumption on the mapping insid=
e
> > a core. Hence partially changing the mapping, i.e. unbind the mapping o=
f
> > core while keep the mapping inside a core. After this patch, the core w=
ith
> > boot-cpu will always be mapped into core 0.
> >
> > And at present, the code to discovery cpu spreads over two functions:
> > early_init_dt_scan_cpus() and smp_setup_cpu_maps().
> > This patch tries to fold smp_setup_cpu_maps() into the "previous" one
>
> This patch is pretty old and doesn't apply anymore. If still relevant
> can you please rebase and resubmit.
>
> Thanks
> Christophe
>
> >
> > Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
> > ---
> > v5 -> v6:
> >    simplify the loop logic (Hope it can answer Benjamin's concern)
> >    concentrate the cpu recovery code to early stage (Hope it can answer=
 Michael's concern)
> > Todo: (if this method is accepted)
> >    fold the whole smp_setup_cpu_maps()
> >
> >   arch/powerpc/include/asm/smp.h     |   1 +
> >   arch/powerpc/kernel/prom.c         | 123 ++++++++++++++++++++++++++++=
---------
> >   arch/powerpc/kernel/setup-common.c |  58 ++---------------
> >   drivers/of/fdt.c                   |   2 +-
> >   include/linux/of_fdt.h             |   2 +
> >   5 files changed, 103 insertions(+), 83 deletions(-)
> >
> > diff --git a/arch/powerpc/include/asm/smp.h b/arch/powerpc/include/asm/=
smp.h
> > index fac963e..80c7693 100644
> > --- a/arch/powerpc/include/asm/smp.h
> > +++ b/arch/powerpc/include/asm/smp.h
> > @@ -30,6 +30,7 @@
> >   #include <asm/percpu.h>
> >
> >   extern int boot_cpuid;
> > +extern int threads_in_core;
> >   extern int spinning_secondaries;
> >
> >   extern void cpu_die(void);
> > diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> > index 4922162..2ae0b4a 100644
> > --- a/arch/powerpc/kernel/prom.c
> > +++ b/arch/powerpc/kernel/prom.c
> > @@ -77,7 +77,6 @@ unsigned long tce_alloc_start, tce_alloc_end;
> >   u64 ppc64_rma_size;
> >   #endif
> >   static phys_addr_t first_memblock_size;
> > -static int __initdata boot_cpu_count;
> >
> >   static int __init early_parse_mem(char *p)
> >   {
> > @@ -305,6 +304,14 @@ static void __init check_cpu_feature_properties(un=
signed long node)
> >       }
> >   }
> >
> > +struct bootinfo {
> > +     int boot_thread_id;
> > +     unsigned int cpu_cnt;
> > +     int cpu_hwids[NR_CPUS];
> > +     bool avail[NR_CPUS];
> > +};
> > +static struct bootinfo *bt_info;
> > +
> >   static int __init early_init_dt_scan_cpus(unsigned long node,
> >                                         const char *uname, int depth,
> >                                         void *data)
> > @@ -312,10 +319,12 @@ static int __init early_init_dt_scan_cpus(unsigne=
d long node,
> >       const char *type =3D of_get_flat_dt_prop(node, "device_type", NUL=
L);
> >       const __be32 *prop;
> >       const __be32 *intserv;
> > -     int i, nthreads;
> > +     int i, nthreads, maxidx;
> >       int len;
> > -     int found =3D -1;
> > -     int found_thread =3D 0;
> > +     int found_thread =3D -1;
> > +     struct bootinfo *info =3D data;
> > +     bool avail;
> > +     int rotate_cnt, id;
> >
> >       /* We are scanning "cpu" nodes only */
> >       if (type =3D=3D NULL || strcmp(type, "cpu") !=3D 0)
> > @@ -325,8 +334,15 @@ static int __init early_init_dt_scan_cpus(unsigned=
 long node,
> >       intserv =3D of_get_flat_dt_prop(node, "ibm,ppc-interrupt-server#s=
", &len);
> >       if (!intserv)
> >               intserv =3D of_get_flat_dt_prop(node, "reg", &len);
> > +     avail =3D of_fdt_device_is_available(initial_boot_params, node);
> > +#if 0
> > +     //todo
> > +     if (!avail)
> > +             avail =3D !of_fdt_property_match_string(node,
> > +                                     "enable-method", "spin-table");
> > +#endif
> >
> > -     nthreads =3D len / sizeof(int);
> > +     threads_in_core =3D nthreads =3D len / sizeof(int);
> >
> >       /*
> >        * Now see if any of these threads match our boot cpu.
> > @@ -338,9 +354,10 @@ static int __init early_init_dt_scan_cpus(unsigned=
 long node,
> >                * booted proc.
> >                */
> >               if (fdt_version(initial_boot_params) >=3D 2) {
> > +                     info->cpu_hwids[info->cpu_cnt] =3D
> > +                                     be32_to_cpu(intserv[i]);
> >                       if (be32_to_cpu(intserv[i]) =3D=3D
> >                           fdt_boot_cpuid_phys(initial_boot_params)) {
> > -                             found =3D boot_cpu_count;
> >                               found_thread =3D i;
> >                       }
> >               } else {
> > @@ -351,22 +368,37 @@ static int __init early_init_dt_scan_cpus(unsigne=
d long node,
> >                        */
> >                       if (of_get_flat_dt_prop(node,
> >                                       "linux,boot-cpu", NULL) !=3D NULL=
)
> > -                             found =3D boot_cpu_count;
> > +                             found_thread =3D info->cpu_cnt;
> >               }
> > +             info->avail[info->cpu_cnt] =3D avail;
> > +
> >   #ifdef CONFIG_SMP
> >               /* logical cpu id is always 0 on UP kernels */
> > -             boot_cpu_count++;
> > +             info->cpu_cnt++;
> >   #endif
> >       }
> >
> >       /* Not the boot CPU */
> > -     if (found < 0)
> > +     if (found_thread < 0)
> >               return 0;
> >
> > -     DBG("boot cpu: logical %d physical %d\n", found,
> > +     /* always mapping boot-core to core 0 to cope with kexec -p */
> > +     maxidx =3D info->cpu_cnt - 1;
> > +     rotate_cnt =3D nthreads;
> > +     while (rotate_cnt-- > 0) {
> > +             avail =3D info->avail[maxidx];
> > +             id =3D info->cpu_hwids[maxidx];
> > +             for (i =3D maxidx; i > 0; i--) {
> > +                     info->avail[i] =3D info->avail[i - 1];
> > +                     info->cpu_hwids[i] =3D info->cpu_hwids[i - 1];
> > +             }
> > +             info->avail[i] =3D avail;
> > +             info->cpu_hwids[i] =3D id;
> > +     }
> > +
> > +     info->boot_thread_id =3D found_thread;
> > +     DBG("boot cpu: logical %d physical %d\n", found_thread,
> >           be32_to_cpu(intserv[found_thread]));
> > -     boot_cpuid =3D found;
> > -     set_hard_smp_processor_id(found, be32_to_cpu(intserv[found_thread=
]));
> >
> >       /*
> >        * PAPR defines "logical" PVR values for cpus that
> > @@ -675,6 +707,55 @@ static void __init tm_init(void)
> >   static void tm_init(void) { }
> >   #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> >
> > +static void early_setup_cpu_mapping(void)
> > +{
> > +     unsigned int cpu, cnt;
> > +     int nr_cpus_aligned;
> > +
> > +     bt_info =3D __va(memblock_alloc(sizeof(struct bootinfo),
> > +                     sizeof(unsigned long)));
> > +     memset(bt_info, 0, sizeof(struct bootinfo));
> > +     bt_info->boot_thread_id =3D -1;
> > +     /* Retrieve CPU related informations from the flat tree
> > +      * (altivec support, boot CPU ID, ...)
> > +      */
> > +     of_scan_flat_dt(early_init_dt_scan_cpus, bt_info);
> > +
> > +     if (bt_info->boot_thread_id < 0) {
> > +             pr_err("Failed to identify boot CPU !\n");
> > +             BUG();
> > +     }
> > +
> > +     boot_cpuid =3D bt_info->boot_thread_id;
> > +     /* work around subcore mode */
> > +     nr_cpus_aligned =3D _ALIGN_UP(nr_cpu_ids, threads_in_core);
> > +     if (nr_cpus_aligned !=3D nr_cpu_ids) {
> > +             pr_info("nr_cpus is forced to be aligned up from: %d to: =
%d\n",
> > +                     nr_cpu_ids, nr_cpus_aligned);
> > +             nr_cpu_ids =3D nr_cpus_aligned;
> > +     }
> > +     cnt =3D (nr_cpu_ids < bt_info->cpu_cnt) ? nr_cpu_ids
> > +                     : bt_info->cpu_cnt;
> > +
> > +     allocate_pacas();
> > +     for (cpu =3D 0; cpu < cnt; cpu++) {
> > +             set_cpu_present(cpu, bt_info->avail[cpu]);
> > +             DBG("set cpu present: %d -> hwid:%d\n",
> > +                     cpu, bt_info->cpu_hwids[cpu]);
> > +             set_hard_smp_processor_id(cpu, bt_info->cpu_hwids[cpu]);
> > +             set_cpu_possible(cpu, true);
> > +     }
> > +
> > +#if defined(CONFIG_SMP) && defined(CONFIG_PPC64)
> > +     /* We'll later wait for secondaries to check in; there are
> > +      * NCPUS-1 non-boot CPUs  :-)
> > +      */
> > +     spinning_secondaries =3D bt_info->cpu_cnt - 1;
> > +#endif
> > +     memblock_free(__pa(bt_info), sizeof(struct bootinfo));
> > +     bt_info =3D NULL;
> > +}
> > +
> >   void __init early_init_devtree(void *params)
> >   {
> >       phys_addr_t limit;
> > @@ -745,27 +826,11 @@ void __init early_init_devtree(void *params)
> >        * FIXME .. and the initrd too? */
> >       move_device_tree();
> >
> > -     allocate_pacas();
> > -
> >       DBG("Scanning CPUs ...\n");
> >
> >       dt_cpu_ftrs_scan();
> >
> > -     /* Retrieve CPU related informations from the flat tree
> > -      * (altivec support, boot CPU ID, ...)
> > -      */
> > -     of_scan_flat_dt(early_init_dt_scan_cpus, NULL);
> > -     if (boot_cpuid < 0) {
> > -             printk("Failed to identify boot CPU !\n");
> > -             BUG();
> > -     }
> > -
> > -#if defined(CONFIG_SMP) && defined(CONFIG_PPC64)
> > -     /* We'll later wait for secondaries to check in; there are
> > -      * NCPUS-1 non-boot CPUs  :-)
> > -      */
> > -     spinning_secondaries =3D boot_cpu_count - 1;
> > -#endif
> > +     early_setup_cpu_mapping();
> >
> >       mmu_early_init_devtree();
> >
> > diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/s=
etup-common.c
> > index 66f7cc6..46d034a 100644
> > --- a/arch/powerpc/kernel/setup-common.c
> > +++ b/arch/powerpc/kernel/setup-common.c
> > @@ -86,7 +86,9 @@ struct machdep_calls *machine_id;
> >   EXPORT_SYMBOL(machine_id);
> >
> >   int boot_cpuid =3D -1;
> > +int threads_in_core =3D 1;
> >   EXPORT_SYMBOL_GPL(boot_cpuid);
> > +EXPORT_SYMBOL_GPL(threads_in_core);
> >
> >   /*
> >    * These are used in binfmt_elf.c to put aux entries on the stack
> > @@ -460,61 +462,11 @@ void __init smp_setup_cpu_maps(void)
> >   {
> >       struct device_node *dn;
> >       int cpu =3D 0;
> > -     int nthreads =3D 1;
> > -
> > -     DBG("smp_setup_cpu_maps()\n");
> > -
> > -     for_each_node_by_type(dn, "cpu") {
> > -             const __be32 *intserv;
> > -             __be32 cpu_be;
> > -             int j, len;
> > -
> > -             DBG("  * %pOF...\n", dn);
> > -
> > -             intserv =3D of_get_property(dn, "ibm,ppc-interrupt-server=
#s",
> > -                             &len);
> > -             if (intserv) {
> > -                     DBG("    ibm,ppc-interrupt-server#s -> %d threads=
\n",
> > -                         nthreads);
> > -             } else {
> > -                     DBG("    no ibm,ppc-interrupt-server#s -> 1 threa=
d\n");
> > -                     intserv =3D of_get_property(dn, "reg", &len);
> > -                     if (!intserv) {
> > -                             cpu_be =3D cpu_to_be32(cpu);
> > -                             intserv =3D &cpu_be;      /* assume logic=
al =3D=3D phys */
> > -                             len =3D 4;
> > -                     }
> > -             }
> > -
> > -             nthreads =3D len / sizeof(int);
> > -
> > -             for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
> > -                     bool avail;
> > -
> > -                     DBG("    thread %d -> cpu %d (hard id %d)\n",
> > -                         j, cpu, be32_to_cpu(intserv[j]));
> > -
> > -                     avail =3D of_device_is_available(dn);
> > -                     if (!avail)
> > -                             avail =3D !of_property_match_string(dn,
> > -                                             "enable-method", "spin-ta=
ble");
> > -
> > -                     set_cpu_present(cpu, avail);
> > -                     set_hard_smp_processor_id(cpu, be32_to_cpu(intser=
v[j]));
> > -                     set_cpu_possible(cpu, true);
> > -                     cpu++;
> > -             }
> > -
> > -             if (cpu >=3D nr_cpu_ids) {
> > -                     of_node_put(dn);
> > -                     break;
> > -             }
> > -     }
> >
> >       /* If no SMT supported, nthreads is forced to 1 */
> >       if (!cpu_has_feature(CPU_FTR_SMT)) {
> >               DBG("  SMT disabled ! nthreads forced to 1\n");
> > -             nthreads =3D 1;
> > +             threads_in_core =3D 1;
> >       }
> >
> >   #ifdef CONFIG_PPC64
> > @@ -539,7 +491,7 @@ void __init smp_setup_cpu_maps(void)
> >
> >               /* Double maxcpus for processors which have SMT capabilit=
y */
> >               if (cpu_has_feature(CPU_FTR_SMT))
> > -                     maxcpus *=3D nthreads;
> > +                     maxcpus *=3D threads_in_core;
> >
> >               if (maxcpus > nr_cpu_ids) {
> >                       printk(KERN_WARNING
> > @@ -565,7 +517,7 @@ void __init smp_setup_cpu_maps(void)
> >        * every CPU in the system. If that is not the case, then some co=
de
> >        * here will have to be reworked
> >        */
> > -     cpu_init_thread_core_maps(nthreads);
> > +     cpu_init_thread_core_maps(threads_in_core);
> >
> >       /* Now that possible cpus are set, set nr_cpu_ids for later use *=
/
> >       setup_nr_cpu_ids();
> > diff --git a/drivers/of/fdt.c b/drivers/of/fdt.c
> > index 84aa9d6..16d6b02 100644
> > --- a/drivers/of/fdt.c
> > +++ b/drivers/of/fdt.c
> > @@ -130,7 +130,7 @@ bool of_fdt_is_big_endian(const void *blob, unsigne=
d long node)
> >       return false;
> >   }
> >
> > -static bool of_fdt_device_is_available(const void *blob, unsigned long=
 node)
> > +bool of_fdt_device_is_available(const void *blob, unsigned long node)
> >   {
> >       const char *status =3D fdt_getprop(blob, node, "status", NULL);
> >
> > diff --git a/include/linux/of_fdt.h b/include/linux/of_fdt.h
> > index b9cd9eb..28756c5 100644
> > --- a/include/linux/of_fdt.h
> > +++ b/include/linux/of_fdt.h
> > @@ -30,6 +30,8 @@ extern void *of_fdt_get_property(const void *blob,
> >                                int *size);
> >   extern bool of_fdt_is_big_endian(const void *blob,
> >                                unsigned long node);
> > +extern bool of_fdt_device_is_available(const void *blob,
> > +                     unsigned long node);
> >   extern int of_fdt_match(const void *blob, unsigned long node,
> >                       const char *const *compat);
> >   extern void *of_fdt_unflatten_tree(const unsigned long *blob,
> _______________________________________________
> kexec mailing list
> kexec@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/kexec

