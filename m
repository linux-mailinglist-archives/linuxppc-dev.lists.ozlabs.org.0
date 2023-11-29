Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 526E87FCC5B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 02:31:53 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O04yuA8N;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O04yuA8N;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sg1yG5tBDz3dC1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 29 Nov 2023 12:31:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O04yuA8N;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O04yuA8N;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Sg1xL3wRmz2yps
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Nov 2023 12:31:01 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701221454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBaz4Ehs6/S/8bgoARSoFNFW4reHiXYJcFmyCN874uU=;
	b=O04yuA8NYlX+l+f7extoPIRzMBGp1zvMU6k1YxrhV8jSu9Iqs+wG8oT5jXXJ5GVM8mHWAT
	CZ7Z9qQFEnso7+uHFs+SZw/f1EOmNY4rP43LJPO+DB/rSMA3wBBmHDyiiHVr+Kdq9jTPzY
	/pAPtFi3ywLtO2QWwGBYfAGZBmrWkzs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1701221454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PBaz4Ehs6/S/8bgoARSoFNFW4reHiXYJcFmyCN874uU=;
	b=O04yuA8NYlX+l+f7extoPIRzMBGp1zvMU6k1YxrhV8jSu9Iqs+wG8oT5jXXJ5GVM8mHWAT
	CZ7Z9qQFEnso7+uHFs+SZw/f1EOmNY4rP43LJPO+DB/rSMA3wBBmHDyiiHVr+Kdq9jTPzY
	/pAPtFi3ywLtO2QWwGBYfAGZBmrWkzs=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-594-8xpRiHbJOMm2XY3gp_nbFg-1; Tue, 28 Nov 2023 20:30:52 -0500
X-MC-Unique: 8xpRiHbJOMm2XY3gp_nbFg-1
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-462d5c11b59so1739188137.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Nov 2023 17:30:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701221452; x=1701826252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PBaz4Ehs6/S/8bgoARSoFNFW4reHiXYJcFmyCN874uU=;
        b=v5SOPJX8GR43L4cBLBNwIFiUp1llb7J1AuqRwJ/IBgJkK89sGKMJFWYnLJU51yhnXg
         wapTGYRCk5fS3L5l10fefsh0fYyyyT2EscPtKr6z1XBUrjYg0j/SI6HvvrZhMKrJ8p54
         sQU4otJbfJieWuJqipH6IMVqpd6AawUvh0ofiVxSGyi1LlNhNKcKi5UKV4YeW/Ic4Zu3
         w9Kz8KbZvrlznhEJVHHcTa5Kdm5tikEekReRR/xeKhfXyZTAmUJ4MKAtjaPFYMKAM/AB
         sqMh83Pkb7uhMnKD1vp1fCOYQUB8GV/il4x01RkDuF1Vw4m6qI1yEhpaXNP51mDv9NtE
         VmHQ==
X-Gm-Message-State: AOJu0YxBpZ38mspVXjtvPZKP6KSfRRo0QDKmOYw28YtO5odMZL9Sasdj
	+XGCTzMA2oMnZd8/sV9AWDEc+dXbjPOKETUV98YIvIStXFiVE3pF6xAh5eH5hIenBvZkXQKqKgf
	Sz+JU6l5bqppiKXx089CNj890joWVIlH3p73deheSCw==
X-Received: by 2002:a67:e308:0:b0:464:411f:7ffe with SMTP id j8-20020a67e308000000b00464411f7ffemr3064046vsf.30.1701221452249;
        Tue, 28 Nov 2023 17:30:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHvlqJtx4yr4MLE22JA2JjPMlUj567TpphWYWUZLDspg0saYQ3031V9QkH2ANcjPGbknKZx10ZKUMGzK2G5zSg=
X-Received: by 2002:a67:e308:0:b0:464:411f:7ffe with SMTP id
 j8-20020a67e308000000b00464411f7ffemr3064025vsf.30.1701221452004; Tue, 28 Nov
 2023 17:30:52 -0800 (PST)
MIME-Version: 1.0
References: <20231017022806.4523-1-piliu@redhat.com> <20231017022806.4523-3-piliu@redhat.com>
 <064ae2ee-ad15-c0ab-f78b-7b3e7dc6612d@linux.ibm.com> <40ab9119-fa6c-4211-98b8-478a84d46e64@linux.ibm.com>
In-Reply-To: <40ab9119-fa6c-4211-98b8-478a84d46e64@linux.ibm.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Wed, 29 Nov 2023 09:30:41 +0800
Message-ID: <CAF+s44Q-Sb1ibdyM0SU3Wkf4JwbO5b353H7aV1xTyCx95ar=SA@mail.gmail.com>
Subject: Re: [PATCHv9 2/2] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
To: Hari Bathini <hbathini@linux.ibm.com>
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
Cc: Baoquan He <bhe@redhat.com>, kexec@lists.infradead.org, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Sourabh Jain <sourabhjain@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Wen Xiong <wenxiong@us.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Hari,


On Mon, Nov 27, 2023 at 12:30=E2=80=AFPM Hari Bathini <hbathini@linux.ibm.c=
om> wrote:
>
> Hi Pingfan, Michael,
>
> On 17/10/23 4:03 pm, Hari Bathini wrote:
> >
> >
> > On 17/10/23 7:58 am, Pingfan Liu wrote:
> >> *** Idea ***
> >> For kexec -p, the boot cpu can be not the cpu0, this causes the proble=
m
> >> of allocating memory for paca_ptrs[]. However, in theory, there is no
> >> requirement to assign cpu's logical id as its present sequence in the
> >> device tree. But there is something like cpu_first_thread_sibling(),
> >> which makes assumption on the mapping inside a core. Hence partially
> >> loosening the mapping, i.e. unbind the mapping of core while keep the
> >> mapping inside a core.
> >>
> >> *** Implement ***
> >> At this early stage, there are plenty of memory to utilize. Hence, thi=
s
> >> patch allocates interim memory to link the cpu info on a list, then
> >> reorder cpus by changing the list head. As a result, there is a rotate
> >> shift between the sequence number in dt and the cpu logical number.
> >>
> >> *** Result ***
> >> After this patch, a boot-cpu's logical id will always be mapped into t=
he
> >> range [0,threads_per_core).
> >>
> >> Besides this, at this phase, all threads in the boot core are forced t=
o
> >> be onlined. This restriction will be lifted in a later patch with
> >> extra effort.
> >>
> >> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> >> Cc: Michael Ellerman <mpe@ellerman.id.au>
> >> Cc: Nicholas Piggin <npiggin@gmail.com>
> >> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> >> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> >> Cc: Wen Xiong <wenxiong@us.ibm.com>
> >> Cc: Baoquan He <bhe@redhat.com>
> >> Cc: Ming Lei <ming.lei@redhat.com>
> >> Cc: Sourabh Jain <sourabhjain@linux.ibm.com>
> >> Cc: Hari Bathini <hbathini@linux.ibm.com>
> >> Cc: kexec@lists.infradead.org
> >> To: linuxppc-dev@lists.ozlabs.org
> >
> > Thanks for working on this, Pingfan.
> > Looks good to me.
> >
> > Acked-by: Hari Bathini <hbathini@linux.ibm.com>
> >
>
> On second thoughts, probably better off with no impact for
> bootcpu < nr_cpu_ids case and changing only two cores logical
> numbering otherwise. Something like the below (Please share
> your thoughts):
>

I am afraid that it may not be as ideal as it looks, considering the
following factors:
-1. For the case of 'bootcpu < nr_cpu_ids', crash can happen evenly
across any cpu in the system, which seriously undermines the
protection intended here (Under the most optimistic scenario, there is
a 50% chance of success)

-2. For the re-ordering of logical numbering, IMHO, if there is
concern that re-ordering will break something, the partial re-ordering
can not avoid that.  We ought to spot probable hazards so as to ease
worries.


Thanks,

Pingfan

> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
> index ec82f5bda908..78a8312aa8c4 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -76,7 +76,9 @@ u64 ppc64_rma_size;
>   unsigned int boot_cpu_node_count __ro_after_init;
>   #endif
>   static phys_addr_t first_memblock_size;
> +#ifdef CONFIG_SMP
>   static int __initdata boot_cpu_count;
> +#endif
>
>   static int __init early_parse_mem(char *p)
>   {
> @@ -357,6 +359,25 @@ static int __init early_init_dt_scan_cpus(unsigned
> long node,
>                         fdt_boot_cpuid_phys(initial_boot_params)) {
>                         found =3D boot_cpu_count;
>                         found_thread =3D i;
> +                       /*
> +                        * Map boot-cpu logical id into the range
> +                        * of [0, thread_per_core) if it can't be
> +                        * accommodated within nr_cpu_ids.
> +                        */
> +                       if (i !=3D boot_cpu_count && boot_cpu_count >=3D =
nr_cpu_ids) {
> +                               boot_cpuid =3D i;
> +                               DBG("Logical CPU number for boot CPU chan=
ged from %d to %d\n",
> +                                   boot_cpu_count, i);
> +                       } else {
> +                               boot_cpuid =3D boot_cpu_count;
> +                       }
> +
> +                       /* Ensure boot thread is acconted for in nr_cpu_i=
ds */
> +                       if (boot_cpuid >=3D nr_cpu_ids) {
> +                               set_nr_cpu_ids(boot_cpuid + 1);
> +                               DBG("Adjusted nr_cpu_ids to %u, to includ=
e boot CPU.\n",
> +                                   nr_cpu_ids);
> +                       }
>                 }
>   #ifdef CONFIG_SMP
>                 /* logical cpu id is always 0 on UP kernels */
> @@ -368,9 +389,8 @@ static int __init early_init_dt_scan_cpus(unsigned
> long node,
>         if (found < 0)
>                 return 0;
>
> -       DBG("boot cpu: logical %d physical %d\n", found,
> +       DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
>             be32_to_cpu(intserv[found_thread]));
> -       boot_cpuid =3D found;
>
>         boot_cpu_hwid =3D be32_to_cpu(intserv[found_thread]);
>
> diff --git a/arch/powerpc/kernel/setup-common.c
> b/arch/powerpc/kernel/setup-common.c
> index b7b733474b60..f7179525c774 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -409,6 +409,12 @@ static void __init cpu_init_thread_core_maps(int tpc=
)
>
>   u32 *cpu_to_phys_id =3D NULL;
>
> +struct interrupt_server_node {
> +       bool    avail;
> +       int     len;
> +       __be32 intserv[];
> +};
> +
>   /**
>    * setup_cpu_maps - initialize the following cpu maps:
>    *                  cpu_possible_mask
> @@ -429,9 +435,13 @@ u32 *cpu_to_phys_id =3D NULL;
>    */
>   void __init smp_setup_cpu_maps(void)
>   {
> +       struct interrupt_server_node *core0_node =3D NULL, *bt_node =3D N=
ULL;
> +       int orig_boot_cpu =3D -1, orig_boot_thread =3D -1;
> +       bool found_boot_cpu =3D false;
>         struct device_node *dn;
> -       int cpu =3D 0;
>         int nthreads =3D 1;
> +       int cpu =3D 0;
> +       int j, len;
>
>         DBG("smp_setup_cpu_maps()\n");
>
> @@ -442,9 +452,9 @@ void __init smp_setup_cpu_maps(void)
>                       __func__, nr_cpu_ids * sizeof(u32), __alignof__(u32=
));
>
>         for_each_node_by_type(dn, "cpu") {
> +               bool avail, skip =3D false;
>                 const __be32 *intserv;
>                 __be32 cpu_be;
> -               int j, len;
>
>                 DBG("  * %pOF...\n", dn);
>
> @@ -466,29 +476,121 @@ void __init smp_setup_cpu_maps(void)
>
>                 nthreads =3D len / sizeof(int);
>
> -               for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
> -                       bool avail;
> +               avail =3D of_device_is_available(dn);
> +               if (!avail)
> +                       avail =3D !of_property_match_string(dn,
> +                                       "enable-method", "spin-table");
> +
> +               for (j =3D 0; (cpu =3D=3D 0 || !found_boot_cpu) && j < nt=
hreads; j++) {
> +                       if (be32_to_cpu(intserv[j]) =3D=3D boot_cpu_hwid)=
 {
> +                               found_boot_cpu =3D true;
> +                               if (cpu =3D=3D 0)
> +                                       break;
> +
> +                               /* Original logical CPU number of thread0=
 in boot core */
> +                               orig_boot_cpu =3D cpu;
> +                               orig_boot_thread =3D j;
> +                               bt_node =3D memblock_alloc(sizeof(struct =
interrupt_server_node) + len,
> +                                               __alignof__(u32));
> +                               if (!bt_node)
> +                                       panic("%s: Failed to allocate %zu=
 bytes align=3D0x%zx\n",
> +                                               __func__,
> +                                               sizeof(struct interrupt_s=
erver_node) + len,
> +                                               __alignof__(u32));
> +                               bt_node->len =3D len;
> +                               memcpy(bt_node->intserv, intserv, len);
> +                               bt_node->avail =3D avail;
> +                               skip =3D true;
> +                               break;
> +                       }
> +               }
>
> +               /*
> +                * Boot CPU not on core0.
> +                * Hold off adding core0 until boot core is found as core=
0
> +                * may have to be replaced with boot core if boot core ca=
n
> +                * not be accommodated within nr_cpu_ids with its origina=
l
> +                * logical CPU numbering.
> +                */
> +               if (cpu =3D=3D 0 && !found_boot_cpu) {
> +                       core0_node =3D memblock_alloc(sizeof(struct inter=
rupt_server_node) + len,
> +                                       __alignof__(u32));
> +                       if (!core0_node)
> +                               panic("%s: Failed to allocate %zu bytes a=
lign=3D0x%zx\n",
> +                                       __func__,
> +                                       sizeof(struct interrupt_server_no=
de) + len,
> +                                       __alignof__(u32));
> +                       core0_node->len =3D len;
> +                       memcpy(core0_node->intserv, intserv, len);
> +                       core0_node->avail =3D avail;
> +                       skip =3D true;
> +               }
> +
> +               if (skip) {
> +                       /* Assumes same number of threads for all cores *=
/
> +                       cpu +=3D nthreads;
> +                       continue;
> +               }
> +
> +               for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>                         DBG("    thread %d -> cpu %d (hard id %d)\n",
>                             j, cpu, be32_to_cpu(intserv[j]));
>
> -                       avail =3D of_device_is_available(dn);
> -                       if (!avail)
> -                               avail =3D !of_property_match_string(dn,
> -                                               "enable-method", "spin-ta=
ble");
> -
>                         set_cpu_present(cpu, avail);
>                         set_cpu_possible(cpu, true);
>                         cpu_to_phys_id[cpu] =3D be32_to_cpu(intserv[j]);
>                         cpu++;
>                 }
>
> -               if (cpu >=3D nr_cpu_ids) {
> +               if (found_boot_cpu && cpu >=3D nr_cpu_ids) {
>                         of_node_put(dn);
>                         break;
>                 }
>         }
>
> +       /*
> +        * Boot CPU not on core0.
> +        *
> +        * If nr_cpu_ids does not accommodate the original logical CPU
> numbering for
> +        * boot CPU core, use logical CPU numbers 0 to nthreads for boot =
CPU core.
> +        * Note that boot cpu is already assigned with logical CPU number
> somewhere
> +        * between 0 to nthreads (depending on the boot thread within the=
 core) in
> +        * early_init_dt_scan_cpus() for this case.
> +        *
> +        * Otherwise, stick with the original logical CPU numbering.
> +        */
> +       if (bt_node) {
> +               int core0_cpu;
> +
> +               if (orig_boot_cpu + orig_boot_thread >=3D nr_cpu_ids) {
> +                       cpu =3D 0;
> +                       core0_cpu =3D orig_boot_cpu;
> +               } else {
> +                       cpu =3D orig_boot_cpu;
> +                       core0_cpu =3D 0;
> +               }
> +
> +               for (j =3D 0; j < nthreads && core0_cpu < nr_cpu_ids; j++=
) {
> +                       DBG("    thread %d -> cpu %d (hard id %d)\n",
> +                           j, core0_cpu, be32_to_cpu(core0_node->intserv=
[j]));
> +
> +                       set_cpu_present(core0_cpu, core0_node->avail);
> +                       set_cpu_possible(core0_cpu, true);
> +                       cpu_to_phys_id[core0_cpu] =3D be32_to_cpu(core0_n=
ode->intserv[j]);
> +                       core0_cpu++;
> +               }
> +
> +               for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
> +                       DBG("    thread %d -> cpu %d (hard id %d)\n",
> +                           j, cpu, be32_to_cpu(bt_node->intserv[j]));
> +
> +                       set_cpu_present(cpu, bt_node->avail);
> +                       set_cpu_possible(cpu, true);
> +                       cpu_to_phys_id[cpu] =3D be32_to_cpu(bt_node->ints=
erv[j]);
> +                       cpu++;
> +               }
> +       }
> +
>         /* If no SMT supported, nthreads is forced to 1 */
>         if (!cpu_has_feature(CPU_FTR_SMT)) {
>                 DBG("  SMT disabled ! nthreads forced to 1\n");
>

