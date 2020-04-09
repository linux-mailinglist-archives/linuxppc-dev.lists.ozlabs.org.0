Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 213721A3077
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 09:52:00 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yYJF20yXzDrCP
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 17:51:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=fossix.org
 (client-ip=2607:f8b0:4864:20::541; helo=mail-pg1-x541.google.com;
 envelope-from=santosh@fossix.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=fossix.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=fossix-org.20150623.gappssmtp.com
 header.i=@fossix-org.20150623.gappssmtp.com header.a=rsa-sha256
 header.s=20150623 header.b=TqoKoQfV; dkim-atps=neutral
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yY3649XYzDr68
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 17:40:33 +1000 (AEST)
Received: by mail-pg1-x541.google.com with SMTP id n13so3170785pgp.11
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Apr 2020 00:40:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fossix-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bN/4A8Ly/29eaOazRj9JlpI0+6+iuEmZbJr34QeqMJA=;
 b=TqoKoQfVPbjiwmwpRv/eSmkYk1WUux1ynyXcQEx/CrC+OTueNCFtiIczIHlc0IzVj2
 vt/YN7t5cqHyZf/XhW7S8eDStwH3jnp3ksvwk0y60A7wc/0FLr9VhYyrbg41j+aP2yfn
 aFu4EkEDtN4pGFopAN4MwA5WSQG3ounpOPxYrUCcsOdq3n/P9ev8W0B/U4ScZsB/M3Rf
 JR4p+6Rfi8l2cTV60t0I6EAVlQsdWvJcRZupJE+uaYUwUofZS5eUwRn0zUOvuChjvcjA
 o6YssQzSwJYjAn24kgkIhW+vfCOPCrVjqGR7NPdtj8scItfs+R/Mp9+xWFnqgRgiyn4v
 4lIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bN/4A8Ly/29eaOazRj9JlpI0+6+iuEmZbJr34QeqMJA=;
 b=sUmslQXWsiB/KExO7e0ZW3SdqD+H9rSnTuLijC5iE1sbsGZuzeIWHlkRRd68xJhbJl
 hkLzOpeb+jAcJcC4M8Ko8XnHrC19l7vx30hWBF6gLP+28Nlo6EDFk3E9aHavjj/1ZxIJ
 OIZmpoELl351Ku6rGsOzEHpiqsnXrIhRogAIasmWdkhhdGwra0aucsrj5Yf2W5OEY+kV
 9mCLnuNQYsWzSErfb89Rx04HwZqKSFeP1zmzV2lOgL1tBuJ0j66uSqtc9ZUiJXy6YL80
 Zx32kEzzVsDcyG6C6Ek1nLNn3lX5V8StUqP9W0kwGgy3jHWyMsJ1BNeSYJilpl9UAibQ
 AxOA==
X-Gm-Message-State: AGi0PuaC9ymlmVv0Eqyn0TNnD88ld5+nn+FiBak5C4zRKAa/K6XpsTX+
 fyBpubD1HyxByMN94Hlll4ntxFe/dF192VHzAVlrilJs
X-Google-Smtp-Source: APiQypLMxA3Ik3H4k/zFG2OqBtMh0xj6wjoNgo8rdGMA0RBg2b1YqS1R9VLWnaYzOT6u8w0+Spr1luCpafFBLjq4cJE=
X-Received: by 2002:aa7:96f5:: with SMTP id i21mr4858515pfq.248.1586418030349; 
 Thu, 09 Apr 2020 00:40:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200401074741.1562361-1-santosh@fossix.org>
In-Reply-To: <20200401074741.1562361-1-santosh@fossix.org>
From: Santosh Sivaraj <santosh@fossix.org>
Date: Thu, 9 Apr 2020 13:10:19 +0530
Message-ID: <CA+n8AA_Rm1n4tmKFBREzSVQ1hBFXvWBuuHH-yo5=wzkvFcWfLg@mail.gmail.com>
Subject: Re: [PATCH] papr/scm: Add bad memory ranges to nvdimm bad ranges
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Content-Type: multipart/alternative; boundary="0000000000002a26d105a2d6bb43"
X-Mailman-Approved-At: Thu, 09 Apr 2020 17:50:04 +1000
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
Cc: Ganesh Goudar <ganeshgr@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Mahesh Salgaonkar <mahesh@linux.ibm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

--0000000000002a26d105a2d6bb43
Content-Type: text/plain; charset="UTF-8"

On Wed, Apr 1, 2020 at 1:18 PM Santosh Sivaraj <santosh@fossix.org> wrote:

> Subscribe to the MCE notification and add the physical address which
> generated a memory error to nvdimm bad range.
>
> Signed-off-by: Santosh Sivaraj <santosh@fossix.org>
> ---
>

Any comments on this?

Thanks,
Santosh


> This patch depends on "powerpc/mce: Add MCE notification chain" [1].
>
> Unlike the previous series[2], the patch adds badblock registration only
> for
> pseries scm driver. Handling badblocks for baremetal (powernv) PMEM will
> be done
> later and if possible get the badblock handling as a common code.
>
> [1]
> https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/
> [2]
> https://lore.kernel.org/linuxppc-dev/20190820023030.18232-1-santosh@fossix.org/
>
> arch/powerpc/platforms/pseries/papr_scm.c | 96 ++++++++++++++++++++++-
>  1 file changed, 95 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/platforms/pseries/papr_scm.c
> b/arch/powerpc/platforms/pseries/papr_scm.c
> index 0b4467e378e5..5012cbf4606e 100644
> --- a/arch/powerpc/platforms/pseries/papr_scm.c
> +++ b/arch/powerpc/platforms/pseries/papr_scm.c
> @@ -12,6 +12,8 @@
>  #include <linux/libnvdimm.h>
>  #include <linux/platform_device.h>
>  #include <linux/delay.h>
> +#include <linux/nd.h>
> +#include <asm/mce.h>
>
>  #include <asm/plpar_wrappers.h>
>
> @@ -39,8 +41,12 @@ struct papr_scm_priv {
>         struct resource res;
>         struct nd_region *region;
>         struct nd_interleave_set nd_set;
> +       struct list_head region_list;
>  };
>
> +LIST_HEAD(papr_nd_regions);
> +DEFINE_MUTEX(papr_ndr_lock);
> +
>  static int drc_pmem_bind(struct papr_scm_priv *p)
>  {
>         unsigned long ret[PLPAR_HCALL_BUFSIZE];
> @@ -372,6 +378,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv
> *p)
>                 dev_info(dev, "Region registered with target node %d and
> online node %d",
>                          target_nid, online_nid);
>
> +       mutex_lock(&papr_ndr_lock);
> +       list_add_tail(&p->region_list, &papr_nd_regions);
> +       mutex_unlock(&papr_ndr_lock);
> +
>         return 0;
>
>  err:   nvdimm_bus_unregister(p->bus);
> @@ -379,6 +389,68 @@ err:       nvdimm_bus_unregister(p->bus);
>         return -ENXIO;
>  }
>
> +void papr_scm_add_badblock(struct nd_region *region, struct nvdimm_bus
> *bus,
> +                          u64 phys_addr)
> +{
> +       u64 aligned_addr = ALIGN_DOWN(phys_addr, L1_CACHE_BYTES);
> +
> +       if (nvdimm_bus_add_badrange(bus, aligned_addr, L1_CACHE_BYTES)) {
> +               pr_err("Bad block registration for 0x%llx failed\n",
> phys_addr);
> +               return;
> +       }
> +
> +       pr_debug("Add memory range (0x%llx - 0x%llx) as bad range\n",
> +                aligned_addr, aligned_addr + L1_CACHE_BYTES);
> +
> +       nvdimm_region_notify(region, NVDIMM_REVALIDATE_POISON);
> +}
> +
> +static int handle_mce_ue(struct notifier_block *nb, unsigned long val,
> +                        void *data)
> +{
> +       struct machine_check_event *evt = data;
> +       struct papr_scm_priv *p;
> +       u64 phys_addr;
> +       bool found = false;
> +
> +       if (evt->error_type != MCE_ERROR_TYPE_UE)
> +               return NOTIFY_DONE;
> +
> +       if (list_empty(&papr_nd_regions))
> +               return NOTIFY_DONE;
> +
> +       phys_addr = evt->u.ue_error.physical_address +
> +               (evt->u.ue_error.effective_address & ~PAGE_MASK);
> +
> +       if (!evt->u.ue_error.physical_address_provided ||
> +           !is_zone_device_page(pfn_to_page(phys_addr >> PAGE_SHIFT)))
> +               return NOTIFY_DONE;
> +
> +       /* mce notifier is called from a process context, so mutex is safe
> */
> +       mutex_lock(&papr_ndr_lock);
> +       list_for_each_entry(p, &papr_nd_regions, region_list) {
> +               struct resource res = p->res;
> +
> +               if (phys_addr >= res.start && phys_addr <= res.end) {
> +                       found = true;
> +                       break;
> +               }
> +       }
> +
> +       mutex_unlock(&papr_ndr_lock);
> +
> +       if (!found)
> +               return NOTIFY_DONE;
> +
> +       papr_scm_add_badblock(p->region, p->bus, phys_addr);
> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block mce_ue_nb = {
> +       .notifier_call = handle_mce_ue
> +};
> +
>  static int papr_scm_probe(struct platform_device *pdev)
>  {
>         struct device_node *dn = pdev->dev.of_node;
> @@ -476,6 +548,10 @@ static int papr_scm_remove(struct platform_device
> *pdev)
>  {
>         struct papr_scm_priv *p = platform_get_drvdata(pdev);
>
> +       mutex_lock(&papr_ndr_lock);
> +       list_del(&(p->region_list));
> +       mutex_unlock(&papr_ndr_lock);
> +
>         nvdimm_bus_unregister(p->bus);
>         drc_pmem_unbind(p);
>         kfree(p->bus_desc.provider_name);
> @@ -498,7 +574,25 @@ static struct platform_driver papr_scm_driver = {
>         },
>  };
>
> -module_platform_driver(papr_scm_driver);
> +static int __init papr_scm_init(void)
> +{
> +       int ret;
> +
> +       ret = platform_driver_register(&papr_scm_driver);
> +       if (!ret)
> +               mce_register_notifier(&mce_ue_nb);
> +
> +       return ret;
> +}
> +module_init(papr_scm_init);
> +
> +static void __exit papr_scm_exit(void)
> +{
> +       mce_unregister_notifier(&mce_ue_nb);
> +       platform_driver_unregister(&papr_scm_driver);
> +}
> +module_exit(papr_scm_exit);
> +
>  MODULE_DEVICE_TABLE(of, papr_scm_match);
>  MODULE_LICENSE("GPL");
>  MODULE_AUTHOR("IBM Corporation");
> --
> 2.25.1
>
>

--0000000000002a26d105a2d6bb43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Wed, Apr 1, 2020 at 1:18 PM Santosh Si=
varaj &lt;<a href=3D"mailto:santosh@fossix.org" target=3D"_blank">santosh@f=
ossix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Subscribe to the MCE notification and add the physical address w=
hich<br>
generated a memory error to nvdimm bad range.<br>
<br>
Signed-off-by: Santosh Sivaraj &lt;<a href=3D"mailto:santosh@fossix.org" ta=
rget=3D"_blank">santosh@fossix.org</a>&gt;<br>
---<br></blockquote><div><br></div><div>Any comments on this?</div><div><br=
></div><div>Thanks,</div><div>Santosh</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
This patch depends on &quot;powerpc/mce: Add MCE notification chain&quot; [=
1].<br>
<br>
Unlike the previous series[2], the patch adds badblock registration only fo=
r<br>
pseries scm driver. Handling badblocks for baremetal (powernv) PMEM will be=
 done<br>
later and if possible get the badblock handling as a common code.<br>
<br>
[1] <a href=3D"https://lore.kernel.org/linuxppc-dev/20200330071219.12284-1-=
ganeshgr@linux.ibm.com/" rel=3D"noreferrer" target=3D"_blank">https://lore.=
kernel.org/linuxppc-dev/20200330071219.12284-1-ganeshgr@linux.ibm.com/</a><=
br>
[2] <a href=3D"https://lore.kernel.org/linuxppc-dev/20190820023030.18232-1-=
santosh@fossix.org/" rel=3D"noreferrer" target=3D"_blank">https://lore.kern=
el.org/linuxppc-dev/20190820023030.18232-1-santosh@fossix.org/</a><br>
<br>
arch/powerpc/platforms/pseries/papr_scm.c | 96 ++++++++++++++++++++++-<br>
=C2=A01 file changed, 95 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/arch/powerpc/platforms/pseries/papr_scm.c b/arch/powerpc/platf=
orms/pseries/papr_scm.c<br>
index 0b4467e378e5..5012cbf4606e 100644<br>
--- a/arch/powerpc/platforms/pseries/papr_scm.c<br>
+++ b/arch/powerpc/platforms/pseries/papr_scm.c<br>
@@ -12,6 +12,8 @@<br>
=C2=A0#include &lt;linux/libnvdimm.h&gt;<br>
=C2=A0#include &lt;linux/platform_device.h&gt;<br>
=C2=A0#include &lt;linux/delay.h&gt;<br>
+#include &lt;linux/nd.h&gt;<br>
+#include &lt;asm/mce.h&gt;<br>
<br>
=C2=A0#include &lt;asm/plpar_wrappers.h&gt;<br>
<br>
@@ -39,8 +41,12 @@ struct papr_scm_priv {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct resource res;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nd_region *region;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct nd_interleave_set nd_set;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct list_head region_list;<br>
=C2=A0};<br>
<br>
+LIST_HEAD(papr_nd_regions);<br>
+DEFINE_MUTEX(papr_ndr_lock);<br>
+<br>
=C2=A0static int drc_pmem_bind(struct papr_scm_priv *p)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 unsigned long ret[PLPAR_HCALL_BUFSIZE];<br>
@@ -372,6 +378,10 @@ static int papr_scm_nvdimm_init(struct papr_scm_priv *=
p)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dev_info(dev, &quot=
;Region registered with target node %d and online node %d&quot;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0target_nid, online_nid);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;papr_ndr_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_add_tail(&amp;p-&gt;region_list, &amp;papr=
_nd_regions);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;papr_ndr_lock);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
<br>
=C2=A0err:=C2=A0 =C2=A0nvdimm_bus_unregister(p-&gt;bus);<br>
@@ -379,6 +389,68 @@ err:=C2=A0 =C2=A0 =C2=A0 =C2=A0nvdimm_bus_unregister(p=
-&gt;bus);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENXIO;<br>
=C2=A0}<br>
<br>
+void papr_scm_add_badblock(struct nd_region *region, struct nvdimm_bus *bu=
s,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 u64 phys_addr)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 aligned_addr =3D ALIGN_DOWN(phys_addr, L1_C=
ACHE_BYTES);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (nvdimm_bus_add_badrange(bus, aligned_addr, =
L1_CACHE_BYTES)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0pr_err(&quot;Bad bl=
ock registration for 0x%llx failed\n&quot;, phys_addr);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0pr_debug(&quot;Add memory range (0x%llx - 0x%ll=
x) as bad range\n&quot;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 aligned_addr, alig=
ned_addr + L1_CACHE_BYTES);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0nvdimm_region_notify(region, NVDIMM_REVALIDATE_=
POISON);<br>
+}<br>
+<br>
+static int handle_mce_ue(struct notifier_block *nb, unsigned long val,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 void *data)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct machine_check_event *evt =3D data;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0struct papr_scm_priv *p;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0u64 phys_addr;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool found =3D false;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (evt-&gt;error_type !=3D MCE_ERROR_TYPE_UE)<=
br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NOTIFY_DONE;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (list_empty(&amp;papr_nd_regions))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NOTIFY_DONE;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0phys_addr =3D evt-&gt;u.ue_error.physical_addre=
ss +<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(evt-&gt;u.ue_error=
.effective_address &amp; ~PAGE_MASK);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!evt-&gt;u.ue_error.physical_address_provid=
ed ||<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!is_zone_device_page(pfn_to_page(=
phys_addr &gt;&gt; PAGE_SHIFT)))<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NOTIFY_DONE;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0/* mce notifier is called from a process contex=
t, so mutex is safe */<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;papr_ndr_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_for_each_entry(p, &amp;papr_nd_regions, re=
gion_list) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct resource res=
 =3D p-&gt;res;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (phys_addr &gt;=
=3D res.start &amp;&amp; phys_addr &lt;=3D res.end) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0found =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0break;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;papr_ndr_lock);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!found)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NOTIFY_DONE;=
<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0papr_scm_add_badblock(p-&gt;region, p-&gt;bus, =
phys_addr);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return NOTIFY_OK;<br>
+}<br>
+<br>
+static struct notifier_block mce_ue_nb =3D {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0.notifier_call =3D handle_mce_ue<br>
+};<br>
+<br>
=C2=A0static int papr_scm_probe(struct platform_device *pdev)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct device_node *dn =3D pdev-&gt;dev.of_node=
;<br>
@@ -476,6 +548,10 @@ static int papr_scm_remove(struct platform_device *pde=
v)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 struct papr_scm_priv *p =3D platform_get_drvdat=
a(pdev);<br>
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_lock(&amp;papr_ndr_lock);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0list_del(&amp;(p-&gt;region_list));<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mutex_unlock(&amp;papr_ndr_lock);<br>
+<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 nvdimm_bus_unregister(p-&gt;bus);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drc_pmem_unbind(p);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 kfree(p-&gt;bus_desc.provider_name);<br>
@@ -498,7 +574,25 @@ static struct platform_driver papr_scm_driver =3D {<br=
>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 },<br>
=C2=A0};<br>
<br>
-module_platform_driver(papr_scm_driver);<br>
+static int __init papr_scm_init(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0ret =3D platform_driver_register(&amp;papr_scm_=
driver);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0if (!ret)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0mce_register_notifi=
er(&amp;mce_ue_nb);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0return ret;<br>
+}<br>
+module_init(papr_scm_init);<br>
+<br>
+static void __exit papr_scm_exit(void)<br>
+{<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mce_unregister_notifier(&amp;mce_ue_nb);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0platform_driver_unregister(&amp;papr_scm_driver=
);<br>
+}<br>
+module_exit(papr_scm_exit);<br>
+<br>
=C2=A0MODULE_DEVICE_TABLE(of, papr_scm_match);<br>
=C2=A0MODULE_LICENSE(&quot;GPL&quot;);<br>
=C2=A0MODULE_AUTHOR(&quot;IBM Corporation&quot;);<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div><br></div>

--0000000000002a26d105a2d6bb43--
