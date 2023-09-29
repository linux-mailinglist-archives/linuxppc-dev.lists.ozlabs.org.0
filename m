Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E6327B2A73
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 05:20:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g9ZRsYoy;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OxmuzcsQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RxbFx3VRWz3cTt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Sep 2023 13:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=g9ZRsYoy;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OxmuzcsQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=piliu@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RxbF03Q7cz3cGv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Sep 2023 13:19:46 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695957583;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UykpZJmeyPI4JTRsPXGJ9I1irxHeGjy+W1ttfAslUsU=;
	b=g9ZRsYoyqR+u36J1326napcMPk698WYHT3n68EtiqJwBOo7qzUrawZdfC6YUnPqVTt4OY+
	qOrXNbkigbaRUPQlq7EOTnTFWVAszgDuLVBKuiZd6DblMQQjXyRZyrNLWM+VB0JVIfhON0
	vhrqBapObVdR1cNdNqYtlSFEoQIA9vE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1695957584;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UykpZJmeyPI4JTRsPXGJ9I1irxHeGjy+W1ttfAslUsU=;
	b=OxmuzcsQW7y9vsb3SJb055m+VgYl5bE8KKPD1Zn+Fmx0uhq4+LlhIOK5unA+0jd+jSC5pR
	7fZsxxZWg5IkO2pfq6zKieKa0kiHEG9JXN/bR6DjoCccDFruQSk0OAkJmSvKdycYfcxAic
	s3us/TL4J4qCzV2uOEd1/LtZUmwdtKM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-8XVOhOKbMN6Jyo7a4vFAdQ-1; Thu, 28 Sep 2023 23:19:39 -0400
X-MC-Unique: 8XVOhOKbMN6Jyo7a4vFAdQ-1
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-417f9e1def0so208055241cf.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 20:19:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695957579; x=1696562379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UykpZJmeyPI4JTRsPXGJ9I1irxHeGjy+W1ttfAslUsU=;
        b=jYjHsxbJci63H+0xoylTey4FKJtai/3gD3z9msnuciELUNOGXWHr9bsA8aIDvWvSPD
         hzDcH4TOvU3UF0N16gJq1IODC/bcLojEMI4frHYFyKH7mdi03AyIr0JR0AYOWSzFMw/a
         /qh0duNvtcvIDr+760gwxQ6wBmGY9Jq+acp2N4spsMyprQYN+i13UTzLPb4J24MSqBty
         Z/L/8TymVYuVhpcdpcEGnRQJeprC2Ap56ARVT2gNkzbFZdqTu9mJLbnkgAOFUWhiNkPu
         7egjKXP5RjSXkIwX5cGI0Sdrko5N1fWe+20uyWLEftlDNVl3XYBc+KQoA98B3B4dMDod
         azzQ==
X-Gm-Message-State: AOJu0YyKl+PxnuYzKQj2qhwkgk5D6p7YafeCATCiMaXlsyN/A6d5Utu3
	Lqzpk4jOSUkfEZbG3spxlPbqggmqg0RHIi8rootnGHtKwMvPm7r0gQBN+55ibBLm/W9nV1l2B21
	TXjKbdgR4wbWPDbwkEFW+p+rMn1Oj6lbiHcW5rD9qDw==
X-Received: by 2002:a05:622a:8c:b0:40f:ce6d:775e with SMTP id o12-20020a05622a008c00b0040fce6d775emr4000944qtw.42.1695957578992;
        Thu, 28 Sep 2023 20:19:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfB18pBrA1jY1RU14klA5ihc066BEoR2Ze1+sGoa2bef+DqO4dIwyoFI82AZYErEAsjlLh3UNEB6wWodFUd8w=
X-Received: by 2002:a05:622a:8c:b0:40f:ce6d:775e with SMTP id
 o12-20020a05622a008c00b0040fce6d775emr4000922qtw.42.1695957578581; Thu, 28
 Sep 2023 20:19:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230925075348.16654-1-piliu@redhat.com> <20230925075348.16654-3-piliu@redhat.com>
 <BL3PR15MB54581456FAB1CF28C9F761B4F0C1A@BL3PR15MB5458.namprd15.prod.outlook.com>
In-Reply-To: <BL3PR15MB54581456FAB1CF28C9F761B4F0C1A@BL3PR15MB5458.namprd15.prod.outlook.com>
From: Pingfan Liu <piliu@redhat.com>
Date: Fri, 29 Sep 2023 11:19:27 +0800
Message-ID: <CAF+s44RfOZ3U5Ny4L7M2vhVWC+2t8SRJsP6Rgqyz_apAZUVDGg@mail.gmail.com>
Subject: Re: [PATCHv7 2/4] powerpc/setup: Loosen the mapping between cpu
 logical id and its seq in dt
To: Wen Xiong <wenxiong@us.ibm.com>
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
Cc: Baoquan He <bhe@redhat.com>, "kexec@lists.infradead.org" <kexec@lists.infradead.org>, Mahesh Salgaonkar <mahesh@linux.ibm.com>, Ming Lei <ming.lei@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Sep 29, 2023 at 4:36=E2=80=AFAM Wen Xiong <wenxiong@us.ibm.com> wro=
te:
>
> Hi Pingfan,
>
> +               avail =3D intserv_node->avail;
> +               nthreads =3D intserv_node->len / sizeof(int);
> +               for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>                         set_cpu_present(cpu, avail);
>                         set_cpu_possible(cpu, true);
> -                       cpu_to_phys_id[cpu] =3D be32_to_cpu(intserv[j]);
> +                       cpu_to_phys_id[cpu] =3D be32_to_cpu(intserv_node-=
>intserv[j]);
> +                       DBG("    thread %d -> cpu %d (hard id %d)\n",
> +                           j, cpu, be32_to_cpu(intserv[j]));
>
> Intserv is not defined. Should "be32_to_cpu(intserv_node->intserv[j])?

Yes, thanks. Sorry that I did not turn on the DBG macro and not catch this =
bug.

Thanks,

Pingfan
>                         cpu++;
>                 }
> +       }
>
> -----Original Message-----
> From: Pingfan Liu <piliu@redhat.com>
> Sent: Monday, September 25, 2023 2:54 AM
> To: linuxppc-dev@lists.ozlabs.org
> Cc: Pingfan Liu <piliu@redhat.com>; Michael Ellerman <mpe@ellerman.id.au>=
; Nicholas Piggin <npiggin@gmail.com>; Christophe Leroy <christophe.leroy@c=
sgroup.eu>; Mahesh Salgaonkar <mahesh@linux.ibm.com>; Wen Xiong <wenxiong@u=
s.ibm.com>; Baoquan He <bhe@redhat.com>; Ming Lei <ming.lei@redhat.com>; ke=
xec@lists.infradead.org
> Subject: [EXTERNAL] [PATCHv7 2/4] powerpc/setup: Loosen the mapping betwe=
en cpu logical id and its seq in dt
>
> *** Idea ***
> For kexec -p, the boot cpu can be not the cpu0, this causes the problem o=
f allocating memory for paca_ptrs[]. However, in theory, there is no requir=
ement to assign cpu's logical id as its present sequence in the device tree=
. But there is something like cpu_first_thread_sibling(), which makes assum=
ption on the mapping inside a core. Hence partially loosening the mapping, =
i.e. unbind the mapping of core while keep the mapping inside a core.
>
> *** Implement ***
> At this early stage, there are plenty of memory to utilize. Hence, this p=
atch allocates interim memory to link the cpu info on a list, then reorder =
cpus by changing the list head. As a result, there is a rotate shift betwee=
n the sequence number in dt and the cpu logical number.
>
> *** Result ***
> After this patch, a boot-cpu's logical id will always be mapped into the =
range [0,threads_per_core).
>
> Besides this, at this phase, all threads in the boot core are forced to b=
e onlined. This restriction will be lifted in a later patch with extra effo=
rt.
>
> Signed-off-by: Pingfan Liu <piliu@redhat.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
> Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>
> Cc: Wen Xiong <wenxiong@us.ibm.com>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Ming Lei <ming.lei@redhat.com>
> Cc: kexec@lists.infradead.org
> To: linuxppc-dev@lists.ozlabs.org
> ---
>  arch/powerpc/kernel/prom.c         | 25 +++++----
>  arch/powerpc/kernel/setup-common.c | 87 +++++++++++++++++++++++-------
>  2 files changed, 85 insertions(+), 27 deletions(-)
>
> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c inde=
x ec82f5bda908..87272a2d8c10 100644
> --- a/arch/powerpc/kernel/prom.c
> +++ b/arch/powerpc/kernel/prom.c
> @@ -76,7 +76,9 @@ u64 ppc64_rma_size;
>  unsigned int boot_cpu_node_count __ro_after_init;  #endif  static phys_a=
ddr_t first_memblock_size;
> +#ifdef CONFIG_SMP
>  static int __initdata boot_cpu_count;
> +#endif
>
>  static int __init early_parse_mem(char *p)  { @@ -331,8 +333,7 @@ static=
 int __init early_init_dt_scan_cpus(unsigned long node,
>         const __be32 *intserv;
>         int i, nthreads;
>         int len;
> -       int found =3D -1;
> -       int found_thread =3D 0;
> +       bool found =3D false;
>
>         /* We are scanning "cpu" nodes only */
>         if (type =3D=3D NULL || strcmp(type, "cpu") !=3D 0) @@ -355,8 +35=
6,15 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>         for (i =3D 0; i < nthreads; i++) {
>                 if (be32_to_cpu(intserv[i]) =3D=3D
>                         fdt_boot_cpuid_phys(initial_boot_params)) {
> -                       found =3D boot_cpu_count;
> -                       found_thread =3D i;
> +                       /*
> +                        * always map the boot-cpu logical id into the
> +                        * range of [0, thread_per_core)
> +                        */
> +                       boot_cpuid =3D i;
> +                       found =3D true;
> +                       /* This works around the hole in paca_ptrs[]. */
> +                       if (nr_cpu_ids < nthreads)
> +                               set_nr_cpu_ids(nthreads);
>                 }
>  #ifdef CONFIG_SMP
>                 /* logical cpu id is always 0 on UP kernels */ @@ -365,14=
 +373,13 @@ static int __init early_init_dt_scan_cpus(unsigned long node,
>         }
>
>         /* Not the boot CPU */
> -       if (found < 0)
> +       if (!found)
>                 return 0;
>
> -       DBG("boot cpu: logical %d physical %d\n", found,
> -           be32_to_cpu(intserv[found_thread]));
> -       boot_cpuid =3D found;
> +       DBG("boot cpu: logical %d physical %d\n", boot_cpuid,
> +           be32_to_cpu(intserv[boot_cpuid]));
>
> -       boot_cpu_hwid =3D be32_to_cpu(intserv[found_thread]);
> +       boot_cpu_hwid =3D be32_to_cpu(intserv[boot_cpuid]);
>
>         /*
>          * PAPR defines "logical" PVR values for cpus that diff --git a/a=
rch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
> index 1b19a9815672..f6d32324b5a5 100644
> --- a/arch/powerpc/kernel/setup-common.c
> +++ b/arch/powerpc/kernel/setup-common.c
> @@ -36,6 +36,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/hugetlb.h>
>  #include <linux/pgtable.h>
> +#include <linux/list.h>
>  #include <asm/io.h>
>  #include <asm/paca.h>
>  #include <asm/processor.h>
> @@ -425,6 +426,13 @@ static void __init cpu_init_thread_core_maps(int tpc=
)
>
>  u32 *cpu_to_phys_id =3D NULL;
>
> +struct interrupt_server_node {
> +       struct list_head node;
> +       bool    avail;
> +       int     len;
> +       __be32 *intserv;
> +};
> +
>  /**
>   * setup_cpu_maps - initialize the following cpu maps:
>   *                  cpu_possible_mask
> @@ -446,11 +454,16 @@ u32 *cpu_to_phys_id =3D NULL;  void __init smp_setu=
p_cpu_maps(void)  {
>         struct device_node *dn;
> -       int cpu =3D 0;
> -       int nthreads =3D 1;
> +       int shift =3D 0, cpu =3D 0;
> +       int j, nthreads =3D 1;
> +       int len;
> +       struct interrupt_server_node *intserv_node, *n;
> +       struct list_head *bt_node, head;
> +       bool avail, found_boot_cpu =3D false;
>
>         DBG("smp_setup_cpu_maps()\n");
>
> +       INIT_LIST_HEAD(&head);
>         cpu_to_phys_id =3D memblock_alloc(nr_cpu_ids * sizeof(u32),
>                                         __alignof__(u32));
>         if (!cpu_to_phys_id)
> @@ -460,7 +473,6 @@ void __init smp_setup_cpu_maps(void)
>         for_each_node_by_type(dn, "cpu") {
>                 const __be32 *intserv;
>                 __be32 cpu_be;
> -               int j, len;
>
>                 DBG("  * %pOF...\n", dn);
>
> @@ -480,29 +492,68 @@ void __init smp_setup_cpu_maps(void)
>                         }
>                 }
>
> -               nthreads =3D len / sizeof(int);
> -
> -               for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
> -                       bool avail;
> +               avail =3D of_device_is_available(dn);
> +               if (!avail)
> +                       avail =3D !of_property_match_string(dn,
> +                                       "enable-method", "spin-table");
>
> -                       DBG("    thread %d -> cpu %d (hard id %d)\n",
> -                           j, cpu, be32_to_cpu(intserv[j]));
>
> -                       avail =3D of_device_is_available(dn);
> -                       if (!avail)
> -                               avail =3D !of_property_match_string(dn,
> -                                               "enable-method", "spin-ta=
ble");
> +               intserv_node =3D memblock_alloc(sizeof(struct interrupt_s=
erver_node) + len,
> +                                       __alignof__(u32));
> +               if (!intserv_node)
> +                       panic("%s: Failed to allocate %zu bytes align=3D0=
x%zx\n",
> +                               __func__,
> +                               sizeof(struct interrupt_server_node) + le=
n,
> +                               __alignof__(u32));
> +               intserv_node->intserv =3D (__be32 *)((char *)intserv_node=
 +
> +                                               sizeof(struct interrupt_s=
erver_node));
> +               intserv_node->len =3D len;
> +               memcpy(intserv_node->intserv, intserv, len);
> +               intserv_node->avail =3D avail;
> +               INIT_LIST_HEAD(&intserv_node->node);
> +               list_add_tail(&intserv_node->node, &head);
> +
> +               if (!found_boot_cpu) {
> +                       nthreads =3D len / sizeof(int);
> +                       for (j =3D 0 ; j < nthreads; j++) {
> +                               if (be32_to_cpu(intserv[j]) =3D=3D boot_c=
pu_hwid) {
> +                                       bt_node =3D &intserv_node->node;
> +                                       found_boot_cpu =3D true;
> +                                       /*
> +                                        * Record the round-shift between=
 dt
> +                                        * seq and cpu logical number
> +                                        */
> +                                       shift =3D cpu - j;
> +                                       break;
> +                               }
> +
> +                               cpu++;
> +                       }
> +               }
>
> +       }
> +       cpu =3D 0;
> +       list_del_init(&head);
> +       /* Select the primary thread, the boot cpu's slibing, as the logi=
c 0 */
> +       list_add_tail(&head, bt_node);
> +       pr_info("the round shift between dt seq and the cpu logic number:=
 %d\n", shift);
> +       list_for_each_entry(intserv_node, &head, node) {
> +
> +               avail =3D intserv_node->avail;
> +               nthreads =3D intserv_node->len / sizeof(int);
> +               for (j =3D 0; j < nthreads && cpu < nr_cpu_ids; j++) {
>                         set_cpu_present(cpu, avail);
>                         set_cpu_possible(cpu, true);
> -                       cpu_to_phys_id[cpu] =3D be32_to_cpu(intserv[j]);
> +                       cpu_to_phys_id[cpu] =3D be32_to_cpu(intserv_node-=
>intserv[j]);
> +                       DBG("    thread %d -> cpu %d (hard id %d)\n",
> +                           j, cpu, be32_to_cpu(intserv[j]));
>                         cpu++;
>                 }
> +       }
>
> -               if (cpu >=3D nr_cpu_ids) {
> -                       of_node_put(dn);
> -                       break;
> -               }
> +       list_for_each_entry_safe(intserv_node, n, &head, node) {
> +               len =3D sizeof(struct interrupt_server_node) + intserv_no=
de->len;
> +               memblock_free(intserv_node, len);
>         }
>
>         /* If no SMT supported, nthreads is forced to 1 */
> --
> 2.31.1
>

