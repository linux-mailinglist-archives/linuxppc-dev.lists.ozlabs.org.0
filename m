Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F34E725DC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 06:23:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45thzh1LW1zDq9L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 14:23:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=intel.com
 (client-ip=2607:f8b0:4864:20::343; helo=mail-ot1-x343.google.com;
 envelope-from=dan.j.williams@intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=intel-com.20150623.gappssmtp.com
 header.i=@intel-com.20150623.gappssmtp.com header.b="WkGh+Vag"; 
 dkim-atps=neutral
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tS3y3dnTzDqCh
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 04:41:08 +1000 (AEST)
Received: by mail-ot1-x343.google.com with SMTP id 60so5544911otr.7
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2019 11:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E+WpF+p4UXWW1MCQ8t/+34JM8y1BlsTKod48v6rsm5A=;
 b=WkGh+VagXxyssYSmWhsl3rdZtaFCITTijXwcWsNiHap9jBc0tSeB+TNb1UuSWoa6vw
 qmtIX1LZOyAWpp3Zkytnd76kTdj40YRLYYO+l0PdUfHsbjK1wFKekS0tY/kh+ERHt0tj
 T6+rkJsE99U7nGrCYFbq9ILK0YJAFTV2sGAtMvdg8hsJaCQCrGNkbP79cm6bxcKKCIhX
 tcZ2tIgHrE5eKAbV5MtMj+nU0frrwY6FNTbkPELygllrILIiry6KfKfSg6zuROjKXcL6
 S9IhMreQ8JkxOIj0plCNDMkDKu0T7FZsX6uKmHYFAInbVLk9gKP5Br37sY4zBfzo3WcO
 JRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E+WpF+p4UXWW1MCQ8t/+34JM8y1BlsTKod48v6rsm5A=;
 b=fa8K7JjnUV4nfsZ85dGmEOu5WwnP8DnT03OWRI6fXzK/nVqDbmMYJ1gI8NOjCFMMkD
 VJr1KOUMRD5z2DtwuI3wnH34zoMJ1zwX9Dpib15KULLmDb9EEI12d/NyztSIRrbhESKr
 qK2jKnsW4sSE9xVP5t/VcW0chbNCRsfozQRnAg9EaFnpCmankdmGp4Z+Z1/2hKnTaopO
 YKE16K/Qr+H7WaRjJzdSlJF3wcNh1/YB0Zz/ByMDwh/GUJUG5EN3hlVh7QwrKge+84WA
 MrCDUM1lcuVGcaVOxQwev6+D3VrXvhnFHMF3feQjVo3Rk0wo7yJYC5+CQI68HWHq+PWo
 xepQ==
X-Gm-Message-State: APjAAAVH+1AVGHZwTRU7R8Bftx00VS9VNx6EdFVekxBn99oDie2EnZol
 f+OU8M/t02sCRPxvh6b5WdnWRQMckuzKf6rPIKHVBA==
X-Google-Smtp-Source: APXvYqyRGhD96sMyFNokwAseu3azNYX/ZnIvmfmhmEKoPgQT7x9qlPNGFf/PNSsoU1N/MSg3M/33sMcHMLaZXSalquM=
X-Received: by 2002:a9d:7a8b:: with SMTP id l11mr23855034otn.247.1563907265536; 
 Tue, 23 Jul 2019 11:41:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190716090553.21870-1-aneesh.kumar@linux.ibm.com>
 <CAOSf1CGvu9GNCNTD8zvvu3XHe9qzjTd7K+wxC98c6cUo5xFa6Q@mail.gmail.com>
 <874l3jdbpb.fsf@linux.ibm.com>
In-Reply-To: <874l3jdbpb.fsf@linux.ibm.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Tue, 23 Jul 2019 11:40:54 -0700
Message-ID: <CAPcyv4i7+gydPLnLGhQT9wFXdVEAuBLkKQR+pNBW-UyYuLGWKw@mail.gmail.com>
Subject: Re: [PATCH v2] powerpc/nvdimm: Pick the nearby online node if the
 device node is not online
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Oliver O'Halloran <oohall@gmail.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Paul Mackerras <paulus@samba.org>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 18, 2019 at 12:49 AM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
>
> "Oliver O'Halloran" <oohall@gmail.com> writes:
>
> > On Tue, Jul 16, 2019 at 7:08 PM Aneesh Kumar K.V
> > <aneesh.kumar@linux.ibm.com> wrote:
> >>
> >> This is similar to what ACPI does. Nvdimm layer doesn't bring the SCM device
> >> numa node online. Hence we need to make sure we always use an online node
> >> as ndr_desc.numa_node. Otherwise this result in kernel crashes. The target
> >> node is used by dax/kmem and that will bring up the numa node online correctly.
> >>
> >> Without this patch, we do hit kernel crash as below because we try to access
> >> uninitialized NODE_DATA in different code paths.
> >
> > Right, so we're getting a crash due to libnvdimm (via devm_kmalloc)
> > trying to to node local allocations to an offline node. Using a
> > different node fixes that problem, but what else does changing
> > ndr_desc.numa_node do?
> >
> >> cpu 0x0: Vector: 300 (Data Access) at [c0000000fac53170]
> >>     pc: c0000000004bbc50: ___slab_alloc+0x120/0xca0
> >>     lr: c0000000004bc834: __slab_alloc+0x64/0xc0
> >>     sp: c0000000fac53400
> >>    msr: 8000000002009033
> >>    dar: 73e8
> >>  dsisr: 80000
> >>   current = 0xc0000000fabb6d80
> >>   paca    = 0xc000000003870000   irqmask: 0x03   irq_happened: 0x01
> >>     pid   = 7, comm = kworker/u16:0
> >> Linux version 5.2.0-06234-g76bd729b2644 (kvaneesh@ltc-boston123) (gcc version 7.4.0 (Ubuntu 7.4.0-1ubuntu1~18.04.1)) #135 SMP Thu Jul 11 05:36:30 CDT 2019
> >> enter ? for help
> >> [link register   ] c0000000004bc834 __slab_alloc+0x64/0xc0
> >> [c0000000fac53400] c0000000fac53480 (unreliable)
> >> [c0000000fac53500] c0000000004bc818 __slab_alloc+0x48/0xc0
> >> [c0000000fac53560] c0000000004c30a0 __kmalloc_node_track_caller+0x3c0/0x6b0
> >> [c0000000fac535d0] c000000000cfafe4 devm_kmalloc+0x74/0xc0
> >> [c0000000fac53600] c000000000d69434 nd_region_activate+0x144/0x560
> >> [c0000000fac536d0] c000000000d6b19c nd_region_probe+0x17c/0x370
> >> [c0000000fac537b0] c000000000d6349c nvdimm_bus_probe+0x10c/0x230
> >> [c0000000fac53840] c000000000cf3cc4 really_probe+0x254/0x4e0
> >> [c0000000fac538d0] c000000000cf429c driver_probe_device+0x16c/0x1e0
> >> [c0000000fac53950] c000000000cf0b44 bus_for_each_drv+0x94/0x130
> >> [c0000000fac539b0] c000000000cf392c __device_attach+0xdc/0x200
> >> [c0000000fac53a50] c000000000cf231c bus_probe_device+0x4c/0xf0
> >> [c0000000fac53a90] c000000000ced268 device_add+0x528/0x810
> >> [c0000000fac53b60] c000000000d62a58 nd_async_device_register+0x28/0xa0
> >> [c0000000fac53bd0] c0000000001ccb8c async_run_entry_fn+0xcc/0x1f0
> >> [c0000000fac53c50] c0000000001bcd9c process_one_work+0x46c/0x860
> >> [c0000000fac53d20] c0000000001bd4f4 worker_thread+0x364/0x5f0
> >> [c0000000fac53db0] c0000000001c7260 kthread+0x1b0/0x1c0
> >> [c0000000fac53e20] c00000000000b954 ret_from_kernel_thread+0x5c/0x68
> >>
> >> With the patch we get
> >>
> >>  # numactl -H
> >> available: 2 nodes (0-1)
> >> node 0 cpus:
> >> node 0 size: 0 MB
> >> node 0 free: 0 MB
> >> node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31
> >> node 1 size: 130865 MB
> >> node 1 free: 129130 MB
> >> node distances:
> >> node   0   1
> >>   0:  10  20
> >>   1:  20  10
> >>  # cat /sys/bus/nd/devices/region0/numa_node
> >> 0
> >>  # dmesg | grep papr_scm
> >> [   91.332305] papr_scm ibm,persistent-memory:ibm,pmemory@44104001: Region registered with target node 2 and online node 0
> >>
> >> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> >> ---
> >> changes from V1:
> >> * handle NUMA_NO_NODE
> >>
> >>  arch/powerpc/platforms/pseries/papr_scm.c | 30 +++++++++++++++++++++--
> >>  1 file changed, 28 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platforms/pseries/papr_scm.c
> >> index c8ec670ee924..b813bc92f35f 100644
> >> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> >> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> >> @@ -255,12 +255,32 @@ static const struct attribute_group *papr_scm_dimm_groups[] = {
> >>         NULL,
> >>  };
> >>
> >> +static inline int papr_scm_node(int node)
> >> +{
> >> +       int min_dist = INT_MAX, dist;
> >> +       int nid, min_node;
> >> +
> >> +       if ((node == NUMA_NO_NODE) || node_online(node))
> >> +               return node;
> >> +
> >> +       min_node = first_online_node;
> >> +       for_each_online_node(nid) {
> >> +               dist = node_distance(node, nid);
> >> +               if (dist < min_dist) {
> >> +                       min_dist = dist;
> >> +                       min_node = nid;
> >> +               }
> >> +       }
> >> +       return min_node;
> >> +}
> >> +
> >>  static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
> >>  {
> >>         struct device *dev = &p->pdev->dev;
> >>         struct nd_mapping_desc mapping;
> >>         struct nd_region_desc ndr_desc;
> >>         unsigned long dimm_flags;
> >> +       int target_nid, online_nid;
> >>
> >>         p->bus_desc.ndctl = papr_scm_ndctl;
> >>         p->bus_desc.module = THIS_MODULE;
> >> @@ -299,8 +319,11 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
> >>
> >>         memset(&ndr_desc, 0, sizeof(ndr_desc));
> >>         ndr_desc.attr_groups = region_attr_groups;
> >> -       ndr_desc.numa_node = dev_to_node(&p->pdev->dev);
> >> -       ndr_desc.target_node = ndr_desc.numa_node;
> >> +       target_nid = dev_to_node(&p->pdev->dev);
> >> +       online_nid = papr_scm_node(target_nid);
> >> +       set_dev_node(&p->pdev->dev, online_nid);
> >> +       ndr_desc.numa_node = online_nid;
> >> +       ndr_desc.target_node = target_nid;
> >
> > Annoying question: Say I have two SCM regions with slightly different
> > numa affinities and I online one, then the other. If the first is
> > setup to be used as kmem could we have the target_node of the first
> > being used as the online_node of the second? If so, what happens if I
> > unbind kmem from the first region?
>
> kmem, for now, doesn't allow to unregister the mem region. So this won't
> happen. But when we start supporting hot unplugging memory added via
> kmem, I would expect we continue to keep the SCM region 1 attached to
> the node that had kmem before.

kmem grew unregister support in v5.3-rc1, see these commits:

9f960da72b25 device-dax: "Hotremove" persistent memory that is used
like normal RAM
eca499ab3749 mm/hotplug: make remove_memory() interface usable
31e4ca92a7dd device-dax: fix memory and resource leak if hotplug fails


>
> >
> > I'm mostly wondering if we need to set online_node to the nearest node
> > with actual memory on it.
> >
> >>         ndr_desc.res = &p->res;
> >>         ndr_desc.of_node = p->dn;
> >>         ndr_desc.provider_data = p;
> >> @@ -318,6 +341,9 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *p)
> >>                                 ndr_desc.res, p->dn);
> >>                 goto err;
> >>         }
> >> +       if (target_nid != online_nid)
> >> +               dev_info(dev, "Region registered with target node %d and online node %d",
> >> +                        target_nid, online_nid);
> >>
> >>         return 0;
> >>
>
> There was a related question that Michael asked w.r.t how do we
> define closest NUMA node if we have two NUMA nodes (say `x` and `y`)
> with the same distance from the nvdimm region NUMA node. For now, we
> pick the first one. But then that also means we lose the information
> that nvdimm region access latency is going to be same from both nodes
> `x` and `y`.

This 'equidistant' case is a general problem and x86 currently just
happens to pick the lowest id as the value to store in the 'numa_node'
attribute. It impacts system software in practice when performing an
operation like:

    numactl --preferred block:pmem0

Ideally numactl would be updated to check for equidistant nodes
relative to the 'numa_node' attribute and return a mask/list of
cpu-initiator nodes rather a single node.

> I guess if application want to find those detail, they will have to use
> /sys/devices/system/node/nodeX/accessY/ introduced as part of
>
> 08d9dbe72b1f8 ("node: Link memory nodes to their compute nodes")

The HMAT only links a single node as the node that houses the memory
controller for the given address range, however if another range /
proximity domain has identical performance characteristics it can be
expressed here:

    /sys/devices/system/node/nodeX/accessY/initiators/
