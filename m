Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00FA7931A94
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Jul 2024 20:56:30 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzM56u57;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WNBHv6rfgz3cWc
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2024 04:56:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mzM56u57;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WNBHC6xngz3c3l
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2024 04:55:51 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 21769CE116E
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 18:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6498FC4AF0F
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 18:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721069748;
	bh=fTaVUp5ixXjyj/IQvLPoiMP1xh8WB5ilzwlfi5SQ9Uo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=mzM56u57vbSMU7UUmNVR4LLKrqMOvG0VNwKB6Losab0GAaAtgyoVZ5a5yCpA/S/D7
	 sbovS4flkyFA7smIGcKPNkt9qbdkLfEW/ixpl5yuO288I7N8GcOQbgL7x+TQNGD+B9
	 wN1PsljQzJSNiOq+B4zKMYjVqY8uAYYuoEtRQG0PFQBy1wmbjyYjtdwlQTnOF4I1A5
	 33RglqbJ2gLElY1MIjHGK2yB212+Tp/hUw+OwoEpHGQxCpIe+iYzssVx43PRZ8laHU
	 taaqx9n+A8pb4XwEBlxpYNZkkX5cYFHERPLLHHSNexnZAn/Yy6/RSr3VB5cyR8pl8d
	 WMu1M4G2Wlrlg==
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2eeb2d60efbso55744891fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jul 2024 11:55:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWcSEo0DfH97VeRi6UxpdvTXMT+o+nTKhTQIHFf5BbqAne9sQFRWUBQC00pmELu2RfnGr6aIq8Kgsnn05Vq+vkVKDerRcHas9GfVPy6zw==
X-Gm-Message-State: AOJu0YxJ6BnFT4KZj0EGA5VYiT3BKAMfUucwBwbcGUiKRM30pxKyIfYD
	lKLRkFcjsox8EbX/8mGTS2eYDDbyRd/mT68gqXO5EmxcLwpXfyRKghrpeH5JYZizQzgRNyk26ar
	+Sp8SjQfQ5UW0kihKd0ljyr+Sfg==
X-Google-Smtp-Source: AGHT+IG5hZtW/6OyRaCvviup+P1U2Ghou4YKlTCsHtRsWKDMqkEasf58VhGXraqlzg+5tGrRgvrOkOsdfd2CYJKf+h0=
X-Received: by 2002:a05:651c:1254:b0:2ec:57c7:c740 with SMTP id
 38308e7fff4ca-2eef41d72bbmr63931fa.39.1721069746552; Mon, 15 Jul 2024
 11:55:46 -0700 (PDT)
MIME-Version: 1.0
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
In-Reply-To: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 15 Jul 2024 12:55:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
Message-ID: <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
To: Amit Machhiwal <amachhiw@linux.ibm.com>
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Lizhi Hou <lizhi.hou@amd.com>, Lukas Wunner <lukas@wunner.de>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 15, 2024 at 2:08=E2=80=AFAM Amit Machhiwal <amachhiw@linux.ibm.=
com> wrote:
>
> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> of a PCI device attached to a PCI-bridge causes following kernel Oops on
> a pseries KVM guest:
>
>  RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
>  Kernel attempted to read user page (10ec00000048) - exploit attempt? (ui=
d: 0)
>  BUG: Unable to handle kernel data access on read at 0x10ec00000048
>  Faulting instruction address: 0xc0000000012d8728
>  Oops: Kernel access of bad area, sig: 11 [#1]
>  LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
> <snip>
>  NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
>  LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
>  Call Trace:
>  [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
>  [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
>  [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
>  [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_loc=
ked+0x34/0x64
>  [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
>  [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
>  [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
>  [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
>  [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
>  [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
>  [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
>  [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/=
0x2ec
> <snip>
>
> A git bisect pointed this regression to be introduced via [1] that added
> a mechanism to create device tree nodes for parent PCI bridges when a
> PCI device is hot-plugged.
>
> The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
> device-tree node associated with the pci_dev that was earlier
> hot-plugged and was attached under a pci-bridge. The PCI dev header
> `dev->hdr_type` being 0, results a conditional check done with
> `pci_is_bridge()` into false. Consequently, a call to
> `of_pci_make_dev_node()` to create a device node is never made. When at
> a later point in time, in the device node removal path, a memcpy is
> attempted in `__of_changeset_entry_invert()`; since the device node was
> never created, results in an Oops due to kernel read access to a bad
> address.
>
> To fix this issue, the patch updates `of_changeset_create_node()` to
> allocate a new node only when the device node doesn't exist and init it
> in case it does already. Also, introduce `of_pci_free_node()` to be
> called to only revert and destroy the changeset device node that was
> created via a call to `of_changeset_create_node()`.
>
> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
>
> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> ---
> Changes since v1:
>     * Included Lizhi's suggested changes on V1
>     * Fixed below two warnings from Lizhi's changes and rearranged the cl=
eanup
>       part a bit in `of_pci_make_dev_node`
>         drivers/pci/of.c:611:6: warning: no previous prototype for =E2=80=
=98of_pci_free_node=E2=80=99 [-Wmissing-prototypes]
>           611 | void of_pci_free_node(struct device_node *np)
>               |      ^~~~~~~~~~~~~~~~
>         drivers/pci/of.c: In function =E2=80=98of_pci_make_dev_node=E2=80=
=99:
>         drivers/pci/of.c:696:1: warning: label =E2=80=98out_destroy_cset=
=E2=80=99 defined but not used [-Wunused-label]
>           696 | out_destroy_cset:
>               | ^~~~~~~~~~~~~~~~
>     * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@l=
inux.ibm.com/
>
>  drivers/of/dynamic.c  | 16 ++++++++++++----
>  drivers/of/unittest.c |  2 +-
>  drivers/pci/bus.c     |  3 +--
>  drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
>  drivers/pci/pci.h     |  2 ++
>  include/linux/of.h    |  1 +
>  6 files changed, 43 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index dda6092e6d3a..9bba5e82a384 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct devi=
ce_node *np,
>   * a given changeset.
>   *
>   * @ocs: Pointer to changeset
> + * @np: Pointer to device node. If null, allocate a new node. If not, in=
it an
> + *     existing one.
>   * @parent: Pointer to parent device node
>   * @full_name: Node full name
>   *
>   * Return: Pointer to the created device node or NULL in case of an erro=
r.
>   */
>  struct device_node *of_changeset_create_node(struct of_changeset *ocs,
> +                                            struct device_node *np,
>                                              struct device_node *parent,
>                                              const char *full_name)
>  {
> -       struct device_node *np;
>         int ret;
>
> -       np =3D __of_node_dup(NULL, full_name);
> -       if (!np)
> -               return NULL;
> +       if (!np) {
> +               np =3D __of_node_dup(NULL, full_name);
> +               if (!np)
> +                       return NULL;
> +       } else {
> +               of_node_set_flag(np, OF_DYNAMIC);
> +               of_node_set_flag(np, OF_DETACHED);

Are we going to rename the function to
of_changeset_create_or_maybe_modify_node()? No. The functions here are
very clear in that they allocate new objects and don't reuse what's
passed in.

Rob
