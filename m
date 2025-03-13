Return-Path: <linuxppc-dev+bounces-6952-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D925A5EE21
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Mar 2025 09:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZD17L6mLbz3c5W;
	Thu, 13 Mar 2025 19:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::630"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1741854990;
	cv=none; b=kXBYBOHeCQalnQMvhCs2BjhMUNavS49QIMzfAd9Kudvplpmx664+gyPCQMjNl73EKRMfJ/HtM1CejJe3aGdd3OpwWG670qWsBEijzlZ9qRYlZvlz37TqzqzEp/fLQX51UpX903Hra5C7q0WyYq9IhupmbKFk7sjWJCKpVbe9GR5mI0FmABjM8qEBm9Mt0Rzfdz6nZTC+9exuaY1mqsnyYoGP29M1LdRS4qQ7fUlNir2iJmjZmo01SI7BcbJ7iikCKsC881NoICM3xZcBBUbzbNCRP0Nt1p7ME68WhJfwJ2dGFt2p58nl6Qkt0G8gA2pOqDPK8id/Qq0Cl6HvttrClA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1741854990; c=relaxed/relaxed;
	bh=J+AeuzzgMorjPpDntLsw2UofEpMmQ3EUP9vf5hH0k7w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sj/1HYPKEpLlZqmnvK8ofJI6Z5lAtXXw+e50zRaQcneNXICSGZlpWCihBkyhFkmSsmaL5l+QJCiiOckoCKcM4/3v5W6/nORexdOjMbUEvxM9HwlYJcRvcKREZ466+UkKv37u7iUm4gabeN4gVMI8/8qSvZRxU10432GQ93azFOh5OyubFBTOyv92wM8IUmgZ+mw4UcYIikfSWlkLPaiXCG1U1O08lKvJ1K0tt6qLTkXMFqa8uNBtKqwp77c27Pu9OKKRE8K24+ZnVopVQQo4OM9QnsWFm2QrngOsv7eY/KqoVi8zjjXJeiKCPdycF4OqBqm7JqCIPJJg5PkKXe51yg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com; dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BHnU2UcO; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org) smtp.mailfrom=gmail.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=BHnU2UcO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::630; helo=mail-ej1-x630.google.com; envelope-from=kirjanov@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZD17K5sFNz3byh
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 19:36:29 +1100 (AEDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-ac2af2f15d1so100988766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Mar 2025 01:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741854986; x=1742459786; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+AeuzzgMorjPpDntLsw2UofEpMmQ3EUP9vf5hH0k7w=;
        b=BHnU2UcOO+or/hYIBYcyo+hF/qJuBdc3P356XdEu/2AuLRQApCG0gIYQuvpwE21SRi
         Z2DhBbOs+tpICt5kzv7a4bf1prGAkCsyzctI5xCArPlOcTz3vmtuqnZOGMGN4QFQU1r7
         AdixeeWK9H1BX2Kw8FU0l/lV1eBBv5R//hGHp4L5yqOs0OXIhGzz/OJrGSHt3Nfo1rLe
         rTtP9ghbStlQmiZmtU0lWx8v/kn/ng1JA3dzAI0XT/mfI8By5y2CHCLtZWAjwwcNxUXU
         NVCNbGco/MqZYc0FKrkvKkWX17+dNvW7T94eQNfZUaBrDPFn/k/99w1IEcmKgBmeIBIJ
         dxbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741854986; x=1742459786;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+AeuzzgMorjPpDntLsw2UofEpMmQ3EUP9vf5hH0k7w=;
        b=hOGDsaPX67oa3i+yzwoqci9T/vlNXUT7rhZRUu+q8Ja+J+tTDIOhookeKgOgBlqEfn
         XCSzhw4/jw0O4Bx0Gen9iJ7BjPIkaGRJd+5MWEhb1Kf+XePfPmcev7RztJU41fwhg9/c
         1ndDCo8VkoD3m5rwn48mZv8UtQQv0WiJdGz127VM+HPINx2NesFZI8+evjmLI5ABIHHJ
         4TXMGfgau/CEpWMq8PQH9Qbo5eGvYcvWxK4S4rNlD3+bdpb67W1p41CtgjABTvshdnWh
         zONgRxFfSbRkeoJ+L3f+T1ZoySNI8E0Xe0OrRWaPwgaTGNbm5S3sZXjcwK/n32FqMOhC
         EllA==
X-Gm-Message-State: AOJu0YzdOENt9uBBCW6SDMlOjGsBv7S3R7+QnDlYygWXIJR/RPtxG+4n
	0JzbkDIKNuwN3JSueasyC8B17Y+DvG0qVs2dqN4PtRMLFUKSHCBeqXJxGuCXop7CE/hLXIeBXQg
	ZJjizJnxkguWnhlBnnQsLMZKygWm1fth/eXc=
X-Gm-Gg: ASbGnctZ5P0XVe2Btudk3dEu+37Gy3l75F3CTvUH3nB/ow0R/DOtHjyxB/BoM8eqNT6
	hGVAAnD9xNqLwn2qJ/GLaM/cNGVifpfxKCIY9zvNNO4mim7dW/U6EbhEzfre7PkjX41vuOWw8Et
	yzQxxGmFvNa+FyeLdPz6PQAIYR3lIKZ6FCUK2Qhw==
X-Google-Smtp-Source: AGHT+IF6xrgp48m4kbr8rxqclUBFVTQMxpI4jll7FKvVmJfGh8Jm/6CrRysfI+rG5rRO1cgBwfb53dUgcxb5vbtzaY0=
X-Received: by 2002:a17:907:930c:b0:ac2:a447:770b with SMTP id
 a640c23a62f3a-ac2b9de9602mr1181226166b.21.1741854985519; Thu, 13 Mar 2025
 01:36:25 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
References: <20250202122803.2566-1-kirjanov@gmail.com>
In-Reply-To: <20250202122803.2566-1-kirjanov@gmail.com>
From: Denis Kirjanov <kirjanov@gmail.com>
Date: Thu, 13 Mar 2025 11:36:12 +0300
X-Gm-Features: AQ5f1JpFVBhm7tpTlz1-BO392y_eZKOIMl9Pz87sS-53juTeqYhX_MGu9fcpc34
Message-ID: <CAHj3AV=3SRF09SXV85zQsm+8=LrU+F5sODWJyUVKcmP+h4cwLg@mail.gmail.com>
Subject: Re: [PATCH] powerpc/powermac: replace KERN_INFO calls with pr_info
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Sun, Feb 2, 2025 at 3:28=E2=80=AFPM Denis Kirjanov <kirjanov@gmail.com> =
wrote:
>
> pr_info makes code cleaner and simplifies syntax
>
> Signed-off-by: Denis Kirjanov <kirjanov@gmail.com>
> ---
Hello, ping?

>  arch/powerpc/platforms/powermac/feature.c |  8 ++++----
>  arch/powerpc/platforms/powermac/low_i2c.c | 12 ++++++------
>  arch/powerpc/platforms/powermac/pci.c     | 12 ++++++------
>  arch/powerpc/platforms/powermac/pic.c     |  6 +++---
>  arch/powerpc/platforms/powermac/setup.c   |  2 +-
>  arch/powerpc/platforms/powermac/smp.c     | 12 ++++++------
>  6 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/arch/powerpc/platforms/powermac/feature.c b/arch/powerpc/pla=
tforms/powermac/feature.c
> index 6365cea27abc..d3bcfe590384 100644
> --- a/arch/powerpc/platforms/powermac/feature.c
> +++ b/arch/powerpc/platforms/powermac/feature.c
> @@ -2527,7 +2527,7 @@ static int __init probe_motherboard(void)
>                 pmac_mb.board_flags |=3D PMAC_MB_MOBILE;
>
>
> -       printk(KERN_INFO "PowerMac motherboard: %s\n", pmac_mb.model_name=
);
> +       pr_info("PowerMac motherboard: %s\n", pmac_mb.model_name);
>  done:
>         of_node_put(dt);
>         return ret;
> @@ -2574,11 +2574,11 @@ static void __init probe_uninorth(void)
>                 }
>         }
>
> -       printk(KERN_INFO "Found %s memory controller & host bridge"
> +       pr_info("Found %s memory controller & host bridge"
>                " @ 0x%08x revision: 0x%02x\n", uninorth_maj =3D=3D 3 ? "U=
3" :
>                uninorth_maj =3D=3D 4 ? "U4" : "UniNorth",
>                (unsigned int)res.start, uninorth_rev);
> -       printk(KERN_INFO "Mapped at 0x%08lx\n", (unsigned long)uninorth_b=
ase);
> +       pr_info("Mapped at 0x%08lx\n", (unsigned long)uninorth_base);
>
>         /* Set the arbitrer QAck delay according to what Apple does
>          */
> @@ -2664,7 +2664,7 @@ static void __init probe_one_macio(const char *name=
, const char *compat, int typ
>         revp =3D of_get_property(node, "revision-id", NULL);
>         if (revp)
>                 macio_chips[i].rev =3D *revp;
> -       printk(KERN_INFO "Found a %s mac-io controller, rev: %d, mapped a=
t 0x%p\n",
> +       pr_info("Found a %s mac-io controller, rev: %d, mapped at 0x%p\n"=
,
>                 macio_names[type], macio_chips[i].rev, macio_chips[i].bas=
e);
>
>         return;
> diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/pla=
tforms/powermac/low_i2c.c
> index c097d591670e..fe38e6e0f8db 100644
> --- a/arch/powerpc/platforms/powermac/low_i2c.c
> +++ b/arch/powerpc/platforms/powermac/low_i2c.c
> @@ -554,7 +554,7 @@ static struct pmac_i2c_host_kw *__init kw_i2c_host_in=
it(struct device_node *np)
>                         "keywest i2c", host))
>                 host->irq =3D 0;
>
> -       printk(KERN_INFO "KeyWest i2c @0x%08x irq %d %pOF\n",
> +       pr_info("KeyWest i2c @0x%08x irq %d %pOF\n",
>                *addrp, host->irq, np);
>
>         return host;
> @@ -588,7 +588,7 @@ static void __init kw_i2c_add(struct pmac_i2c_host_kw=
 *host,
>                 bus->flags =3D pmac_i2c_multibus;
>         list_add(&bus->link, &pmac_i2c_busses);
>
> -       printk(KERN_INFO " channel %d bus %s\n", channel,
> +       pr_info(" channel %d bus %s\n", channel,
>                (controller =3D=3D busnode) ? "<multibus>" : busnode->full=
_name);
>  }
>
> @@ -793,7 +793,7 @@ static void __init pmu_i2c_probe(void)
>         if (busnode =3D=3D NULL)
>                 return;
>
> -       printk(KERN_INFO "PMU i2c %pOF\n", busnode);
> +       pr_info("PMU i2c %pOF\n", busnode);
>
>         /*
>          * We add bus 1 and 2 only for now, bus 0 is "special"
> @@ -817,7 +817,7 @@ static void __init pmu_i2c_probe(void)
>                 bus->flags =3D pmac_i2c_multibus;
>                 list_add(&bus->link, &pmac_i2c_busses);
>
> -               printk(KERN_INFO " channel %d bus <multibus>\n", channel)=
;
> +               pr_info(" channel %d bus <multibus>\n", channel);
>         }
>  }
>
> @@ -909,7 +909,7 @@ static void __init smu_i2c_probe(void)
>         if (controller =3D=3D NULL)
>                 return;
>
> -       printk(KERN_INFO "SMU i2c %pOF\n", controller);
> +       pr_info("SMU i2c %pOF\n", controller);
>
>         /* Look for childs, note that they might not be of the right
>          * type as older device trees mix i2c busses and other things
> @@ -943,7 +943,7 @@ static void __init smu_i2c_probe(void)
>                 bus->flags =3D 0;
>                 list_add(&bus->link, &pmac_i2c_busses);
>
> -               printk(KERN_INFO " channel %x bus %pOF\n",
> +               pr_info(" channel %x bus %pOF\n",
>                        bus->channel, busnode);
>         }
>  }
> diff --git a/arch/powerpc/platforms/powermac/pci.c b/arch/powerpc/platfor=
ms/powermac/pci.c
> index d71359b5331c..5404189866af 100644
> --- a/arch/powerpc/platforms/powermac/pci.c
> +++ b/arch/powerpc/platforms/powermac/pci.c
> @@ -482,7 +482,7 @@ static void __init init_bandit(struct pci_controller =
*bp)
>         magic |=3D BANDIT_COHERENT;
>         udelay(2);
>         out_le32(bp->cfg_data, magic);
> -       printk(KERN_INFO "Cache coherency enabled for bandit/PSX\n");
> +       pr_info("Cache coherency enabled for bandit/PSX\n");
>  }
>
>  /*
> @@ -814,7 +814,7 @@ static int __init pmac_add_bridge(struct device_node =
*dev)
>                 disp_name =3D "U4-PCIE";
>                 primary =3D 0;
>         }
> -       printk(KERN_INFO "Found %s PCI host bridge.  Firmware bus number:=
"
> +       pr_info("Found %s PCI host bridge.  Firmware bus number:"
>                " %d->%d\n", disp_name, hose->first_busno, hose->last_busn=
o);
>  #endif /* CONFIG_PPC64 */
>
> @@ -835,7 +835,7 @@ static int __init pmac_add_bridge(struct device_node =
*dev)
>                 disp_name =3D "Chaos";
>                 primary =3D 0;
>         }
> -       printk(KERN_INFO "Found %s PCI host bridge at 0x%016llx. "
> +       pr_info("Found %s PCI host bridge at 0x%016llx. "
>                "Firmware bus number: %d->%d\n",
>                 disp_name, (unsigned long long)rsrc.start, hose->first_bu=
sno,
>                 hose->last_busno);
> @@ -966,7 +966,7 @@ static bool pmac_pci_enable_device_hook(struct pci_de=
v *dev)
>         if (dev->vendor =3D=3D PCI_VENDOR_ID_APPLE
>             && dev->class =3D=3D PCI_CLASS_SERIAL_USB_OHCI
>             && !node) {
> -               printk(KERN_INFO "Apple USB OHCI %s disabled by firmware\=
n",
> +               pr_info("Apple USB OHCI %s disabled by firmware\n",
>                        pci_name(dev));
>                 return false;
>         }
> @@ -1122,7 +1122,7 @@ static void pmac_pci_fixup_pciata(struct pci_dev *d=
ev)
>   good:
>         pci_read_config_byte(dev, PCI_CLASS_PROG, &progif);
>         if ((progif & 5) !=3D 5) {
> -               printk(KERN_INFO "PCI: %s Forcing PCI IDE into native mod=
e\n",
> +               pr_info("PCI: %s Forcing PCI IDE into native mode\n",
>                        pci_name(dev));
>                 (void) pci_write_config_byte(dev, PCI_CLASS_PROG, progif|=
5);
>                 if (pci_read_config_byte(dev, PCI_CLASS_PROG, &progif) ||
> @@ -1220,7 +1220,7 @@ static void fixup_u4_pcie(struct pci_dev* dev)
>                 return;
>
>         /* Print things out */
> -       printk(KERN_INFO "PCI: Fixup U4 PCIe bridge range: %pR\n", region=
);
> +       pr_info("PCI: Fixup U4 PCIe bridge range: %pR\n", region);
>
>         /* Fixup bridge config space. We know it's a Mac, resource aren't
>          * offset so let's just blast them as-is. We also know that they
> diff --git a/arch/powerpc/platforms/powermac/pic.c b/arch/powerpc/platfor=
ms/powermac/pic.c
> index 2202bf77c7a3..c9a5326aae41 100644
> --- a/arch/powerpc/platforms/powermac/pic.c
> +++ b/arch/powerpc/platforms/powermac/pic.c
> @@ -345,7 +345,7 @@ static void __init pmac_pic_probe_oldstyle(void)
>                         (addr + 0x10);
>         of_node_put(master);
>
> -       printk(KERN_INFO "irq: Found primary Apple PIC %pOF for %d irqs\n=
",
> +       pr_info("irq: Found primary Apple PIC %pOF for %d irqs\n",
>                master, max_real_irqs);
>
>         /* Map interrupts of cascaded controller */
> @@ -359,7 +359,7 @@ static void __init pmac_pic_probe_oldstyle(void)
>                                 (addr + 0x10);
>                 pmac_irq_cascade =3D irq_of_parse_and_map(slave, 0);
>
> -               printk(KERN_INFO "irq: Found slave Apple PIC %pOF for %d =
irqs"
> +               pr_info("irq: Found slave Apple PIC %pOF for %d irqs"
>                        " cascade: %d\n", slave,
>                        max_irqs - max_real_irqs, pmac_irq_cascade);
>         }
> @@ -376,7 +376,7 @@ static void __init pmac_pic_probe_oldstyle(void)
>                         pr_err("Failed to register cascade interrupt\n");
>         }
>
> -       printk(KERN_INFO "irq: System has %d possible interrupts\n", max_=
irqs);
> +       pr_info("irq: System has %d possible interrupts\n", max_irqs);
>  #ifdef CONFIG_XMON
>         i =3D irq_create_mapping(NULL, 20);
>         if (request_irq(i, xmon_irq, IRQF_NO_THREAD, "NMI - XMON", NULL))
> diff --git a/arch/powerpc/platforms/powermac/setup.c b/arch/powerpc/platf=
orms/powermac/setup.c
> index 6de1cd5d8a58..cb7d9f1db7fe 100644
> --- a/arch/powerpc/platforms/powermac/setup.c
> +++ b/arch/powerpc/platforms/powermac/setup.c
> @@ -220,7 +220,7 @@ static void __init ohare_init(void)
>                         else
>                                 sysctrl_regs[4] |=3D 0x04000000;
>                         if(has_l2cache)
> -                               printk(KERN_INFO "Level 2 cache enabled\n=
");
> +                               pr_info("Level 2 cache enabled\n");
>                 }
>         }
>  }
> diff --git a/arch/powerpc/platforms/powermac/smp.c b/arch/powerpc/platfor=
ms/powermac/smp.c
> index ffd5bc96b92c..49843b6e88b3 100644
> --- a/arch/powerpc/platforms/powermac/smp.c
> +++ b/arch/powerpc/platforms/powermac/smp.c
> @@ -602,7 +602,7 @@ static void __init smp_core99_setup_i2c_hwsync(int nc=
pus)
>                                " sync, fallback to software sync !\n");
>                         goto no_i2c_sync;
>                 }
> -               printk(KERN_INFO "Processor timebase sync using %s i2c cl=
ock\n",
> +               pr_info("Processor timebase sync using %s i2c clock\n",
>                        name);
>                 return;
>         }
> @@ -702,7 +702,7 @@ static void __init smp_core99_setup(int ncpus)
>                 if (cpus &&
>                     of_property_read_bool(cpus, "platform-cpu-timebase"))=
 {
>                         pmac_tb_freeze =3D smp_core99_pfunc_tb_freeze;
> -                       printk(KERN_INFO "Processor timebase sync using"
> +                       pr_info("Processor timebase sync using"
>                                " platform function\n");
>                 }
>                 of_node_put(cpus);
> @@ -724,7 +724,7 @@ static void __init smp_core99_setup(int ncpus)
>                         of_node_put(cpu);
>                 }
>                 pmac_tb_freeze =3D smp_core99_gpio_tb_freeze;
> -               printk(KERN_INFO "Processor timebase sync using"
> +               pr_info("Processor timebase sync using"
>                        " GPIO 0x%02x\n", core99_tb_gpio);
>         }
>
> @@ -734,7 +734,7 @@ static void __init smp_core99_setup(int ncpus)
>         if (pmac_tb_freeze =3D=3D NULL) {
>                 smp_ops->give_timebase =3D smp_generic_give_timebase;
>                 smp_ops->take_timebase =3D smp_generic_take_timebase;
> -               printk(KERN_INFO "Processor timebase sync using software\=
n");
> +               pr_info("Processor timebase sync using software\n");
>         }
>
>  #ifndef CONFIG_PPC64
> @@ -763,7 +763,7 @@ static void __init smp_core99_probe(void)
>         for_each_node_by_type(cpus, "cpu")
>                 ++ncpus;
>
> -       printk(KERN_INFO "PowerMac SMP probe found %d cpus\n", ncpus);
> +       pr_info("PowerMac SMP probe found %d cpus\n", ncpus);
>
>         /* Nothing more to do if less than 2 of them */
>         if (ncpus <=3D 1)
> @@ -940,7 +940,7 @@ static void pmac_cpu_offline_self(void)
>          * on core99 platforms for now ...
>          */
>
> -       printk(KERN_INFO "CPU#%d offline\n", cpu);
> +       pr_info("CPU#%d offline\n", cpu);
>         generic_set_cpu_dead(cpu);
>         smp_wmb();
>
> --
> 2.47.2
>


--=20
Regards / Mit besten Gr=C3=BC=C3=9Fen,
Denis

