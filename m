Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C8544B93F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 00:11:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HpkJ261JJz304w
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Nov 2021 10:11:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=arndb.de
 (client-ip=217.72.192.75; helo=mout.kundenserver.de;
 envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HpkHW1cclz2xsf
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov 2021 10:11:02 +1100 (AEDT)
Received: from mail-wm1-f53.google.com ([209.85.128.53]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MlfCm-1mJSZv17y6-00io5b for <linuxppc-dev@lists.ozlabs.org>; Wed, 10 Nov
 2021 00:05:45 +0100
Received: by mail-wm1-f53.google.com with SMTP id
 d72-20020a1c1d4b000000b00331140f3dc8so590013wmd.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 09 Nov 2021 15:05:44 -0800 (PST)
X-Gm-Message-State: AOAM530CBGWFmhQifbX/FDgtqcz8nYhw0BSnhHRfs2tP7qHqvDgFl9z/
 8jJSgqP+tUxjZppvf3i8nmGRa8zAGZXoboTaulM=
X-Google-Smtp-Source: ABdhPJyydwLr2fKa6VYKHPniUxgyBGl18idqK0WC0ICPxHTvaiCopkmtj+TmYYZcehzCLcUKUeCKvHOGQWR05V6I6CM=
X-Received: by 2002:a05:600c:2107:: with SMTP id
 u7mr11505127wml.82.1636499144157; 
 Tue, 09 Nov 2021 15:05:44 -0800 (PST)
MIME-Version: 1.0
References: <ee3884db-da17-39e3-4010-bcc8f878e2f6@xenosoft.de>
 <20211109165848.GA1155989@bhelgaas> <YYr4x1xWfptXRmqt@rocinante>
In-Reply-To: <YYr4x1xWfptXRmqt@rocinante>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 10 Nov 2021 00:05:28 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3fB7KmqWcaenn04WMps=jucV8wOZs=AZcNFHR+o+Bvyg@mail.gmail.com>
Message-ID: <CAK8P3a3fB7KmqWcaenn04WMps=jucV8wOZs=AZcNFHR+o+Bvyg@mail.gmail.com>
Subject: Re: [PASEMI] Nemo board doesn't recognize any ATA disks with the
 pci-v5.16 updates
To: =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m+/Vebl7Dr55nm2KSdOrTxTzBXIE8k6XilElx0jMkI8yahinEGe
 rApAtqvfiQ8a/ond10sr59kY7tFCOepVbCCJP6kzBkHhNnfK7jhDO2DMc9u0szvmWoRMIv3
 0I1nGkbJWHHbcPh0dSh9HaL4geF3xYvK0VLVXQwa2mln+Nw/kci2kXzTe72u7yTbgThH8RM
 cZVVeqrI/giA9AIeUaM+w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Q385wrgd3LM=:ewzW8nf0VE6FE1HdcKbyMJ
 desbVtrL7KrfXtttupCorNZokNcVc3BPcbvn/Ti6x5goE754FdkpZ29oImB1Dqp4vRuQ42zwL
 M/0/G5VlifxhS8DYRN44Stjzk0HIhfXzTK6B1pY6QVfu0T5Yy3Y6APfpESC5U0LNbIESWxuw/
 o/tcwXAsolP0nugtvn+sFJN+JpUPdsAgYblVr9QALWu1AfHO6ewnhiyP8pxMqRhvcqgWDiPsN
 CxVxywIE4+95rHmFxiSDDnSZxNPlOEgak3VLTu/qxwNRcHF4xicpnIHGMJfkvFllkXNKfwK1Z
 ymBruKZFeEW63ivr1a/ll+s6GS/iZS7czPKF9z5byVyncJKO8i8Vs3+nc6mWxpRbTf1g7lWUv
 tW74mHOaImvcxcdz132EnWXJpo2eJxO75lKQk/LVNG/aA0AXgajNGQAadTt22EahjHdl97rAT
 oDChrnh+gM/KoA6yks0muBK0KyZLiHrnmTTl+/VzkbQVjORne5VsuLmQsVG8qjAR8QmNd3qL9
 L5IlQJW7U3GDhCI1oiAA5J2TqQjNZBcsjSOjTa44egP3ycHjcfOdjrZ+2RwmmRKwQexyKSvkp
 G8kB5ysovv4lEa+raacUMwqj/mYYbDNc9rKEFxAg+CmFSQIcW6O2823FFctY0g4z54t5RMEj0
 DYdcHJzkSEOiTG1YAjcbRfebClyiJ8iM15apLIBVvHPzwhT8lVSTnPr/CwvjwN5y+z3m7Vp37
 O0dvGeLHwHTneFHsrOp/rSmmwYfb/p9/d9Yh3ZM7SPmoHm0CVK/gG7+XmDamLV63qkKq8oBbK
 n30tAav7V8AOnSs+vcakkEbTifOE3DKw/A/iUKeB6Io0adY40o=
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
Cc: Jens Axboe <axboe@kernel.dk>, Darren Stevens <darren@stevens-zone.net>,
 "R.T.Dickinson" <rtd2@xtra.co.nz>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>,
 "bhelgaas@google.com >> Bjorn Helgaas" <bhelgaas@google.com>,
 Bjorn Helgaas <helgaas@kernel.org>, mad skateman <madskateman@gmail.com>,
 Christian Zigotzky <chzigotzky@xenosoft.de>, Olof Johansson <olof@lixom.net>,
 Matthew Leaman <matthew@a-eon.biz>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Christian Zigotzky <info@xenosoft.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Nov 9, 2021 at 11:40 PM Krzysztof Wilczy=C5=84ski <kw@linux.com> wr=
ote:
> >
> > You could attach the kernel config there, too, since it didn't make it
> > to the mailing list (vger may discard them -- see
> > http://vger.kernel.org/majordomo-info.html).
>
> Bjorn and I looked at which commits that went with a recent Pull Request
> from us might be causing this, but we are a little bit at loss, and were
> hoping that you could give us a hand in troubleshooting this.

For reference, these are the patches in that branch that touch any
interesting files,
as most of the contents are for pci-controller drivers that are not used on
powerpc at all:

$ git log --no-merges --oneline 512b7931ad05..dda4b381f05d
arch/powerpc/ drivers/of/  drivers/pci/*.[ch]  include/linux/
acd61ffb2f16 PCI: Add ACS quirk for Pericom PI7C9X2G switches
978fd0056e19 PCI: of: Allow matching of an interrupt-map local to a PCI dev=
ice
041284181226 of/irq: Allow matching of an interrupt-map local to an
interrupt controller
0ab8d0f6ae3f irqdomain: Make of_phandle_args_to_fwspec() generally availabl=
e
5ec0a6fcb60e PCI: Do not enable AtomicOps on VFs
7a41ae80bdcb PCI: pci-bridge-emul: Fix emulation of W1C bits
fd1ae23b495b PCI: Prefer 'unsigned int' over bare 'unsigned'
ff5d3bb6e16d PCI: Remove redundant 'rc' initialization
3331325c6347 PCI/VPD: Use pci_read_vpd_any() in pci_vpd_size()
e1b0d0bb2032 PCI: Re-enable Downstream Port LTR after reset or hotplug
ac8e3cef588c PCI/sysfs: Explicitly show first MSI IRQ for 'irq'
88dee3b0efe4 PCI: Remove unused pci_pool wrappers
b5f9c644eb1b PCI: Remove struct pci_dev->driver
2a4d9408c9e8 PCI: Use to_pci_driver() instead of pci_dev->driver
4141127c44a9 powerpc/eeh: Use to_pci_driver() instead of pci_dev->driver
f9a6c8ad4922 PCI/ERR: Reduce compile time for CONFIG_PCIEAER=3Dn
43e85554d4ed xen/pcifront: Use to_pci_driver() instead of pci_dev->driver
34ab316d7287 xen/pcifront: Drop pcifront_common_process() tests of pcidev, =
pdrv
9f37ab0412eb PCI/switchtec: Add check of event support
5a72431ec318 powerpc/eeh: Use dev_driver_string() instead of struct
pci_dev->driver->name
ae232f0970ea PCI: Drop pci_device_probe() test of !pci_dev->driver
097d9d414433 PCI: Drop pci_device_remove() test of pci_dev->driver
8e9028b3790d PCI: Return NULL for to_pci_driver(NULL)
357df2fc0066 PCI: Use unsigned to match sscanf("%x") in pci_dev_str_match_p=
ath()
bf2928c7a284 PCI/VPD: Add pci_read/write_vpd_any()
b2105b9f39b5 PCI: Correct misspelled and remove duplicated words
7c3855c423b1 PCI: Coalesce host bridge contiguous apertures
e0f7b1922358 PCI: Use kstrtobool() directly, sans strtobool() wrapper
36f354ec7bf9 PCI/sysfs: Return -EINVAL consistently from "store" functions
95e83e219d68 PCI/sysfs: Check CAP_SYS_ADMIN before parsing user input
af9d82626c8f PCI/ACPI: Remove OSC_PCI_SUPPORT_MASKS and OSC_PCI_CONTROL_MAS=
KS
9a0a1417d3bb PCI: Tidy comments
06dc660e6eb8 PCI: Rename pcibios_add_device() to pcibios_device_add()
e3f4bd3462f6 PCI: Mark Atheros QCA6174 to avoid bus reset
3a19407913e8 PCI/P2PDMA: Apply bus offset correctly in DMA address calculat=
ion

Out of these, I agree that most of them seem harmless, these would
be the ones I'd try to look at more closely, or maybe revert for testing:

978fd0056e19 PCI: of: Allow matching of an interrupt-map local to a PCI dev=
ice
041284181226 of/irq: Allow matching of an interrupt-map local to an
interrupt controller
e1b0d0bb2032 PCI: Re-enable Downstream Port LTR after reset or hotplug
7c3855c423b1 PCI: Coalesce host bridge contiguous apertures
3a19407913e8 PCI/P2PDMA: Apply bus offset correctly in DMA address calculat=
ion

       Arnd
