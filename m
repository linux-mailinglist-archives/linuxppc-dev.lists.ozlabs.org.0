Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 904C693A7D5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 21:55:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYMY9VmQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT7DB2YXPz3cfx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 05:55:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=dYMY9VmQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT7CW0tKJz3cH2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 05:54:47 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41A1D60CF7
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 19:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB705C4AF0F
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 19:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721764484;
	bh=k5RrtdLWKZsCl7EDSRNM33NdEcdTiw1cogBHDYG6Wkc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=dYMY9VmQ644gRDyP98cRxhXFLbUyBu/MIgqSpuG4QacvVX3j7FYjWoDnNShgOtSaB
	 k9NzXP8C/aw7MlPHPw1FwNPv5W2UgSSf+C/Lot7M/k5opxrPjsUKz4wPDL4sOML7CX
	 vCzmPQF88kC5dLybXj7fGXOUkBvxsZkxSzqwuimmaLwPT+F9fDu7IYasyV98JgMemd
	 YA8es6Cy2mj0qro2xHEGaIiNHVkKbr67OMCbSQyNtOs7Kd1E15q/MdlEOp0AocIqiW
	 0Z/bQwRDD9eXV7qjdzxysFa3wop5tA8NzoSpx2ABg4wHrKfypp7ZLLa4VydGBWKQtg
	 By9DbyBPM4NVQ==
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-52f01afa11cso4303253e87.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jul 2024 12:54:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVTVTfgzEtdp2QpGR2tlXqYcgw16CKDeOOrXmtorKTfGdr0drPDTt4DLuKd88vxtC3+isPe20F0RfqQ0mFwn1edG857JZ7++1Im8izC3A==
X-Gm-Message-State: AOJu0YyBfDsrg1yPT1faONKn0kxkg9TlyoNF/ENIDOngb8B8WIbNdxYO
	RnVVyj6/HOa5eIMe/6kh61qzJBI5sxhB/m5T6y2ByVjUiKfabl95vy33oSELeMZJigxM2yuU/tL
	+I1HJKeQ4vRUShS84CnTv6MrZqA==
X-Google-Smtp-Source: AGHT+IGCQdyyu8qkAIF4Y+x34DGI3oQcrcatbK5X9D1j6aSuxaMLw+4ruouSVY9w4zl61f3BJLQ8XUi3IEInszr9fCk=
X-Received: by 2002:a05:6512:3a90:b0:52c:d78b:d0b8 with SMTP id
 2adb3069b0e04-52fc406dd9amr3011081e87.39.1721764483150; Tue, 23 Jul 2024
 12:54:43 -0700 (PDT)
MIME-Version: 1.0
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
 <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
 <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com> <20240723162107.GA501469-robh@kernel.org>
 <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
In-Reply-To: <a8d2e310-9446-6cfa-fe00-4ef83cdb6590@amd.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 23 Jul 2024 13:54:30 -0600
X-Gmail-Original-Message-ID: <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
Message-ID: <CAL_JsqJjhaLFm9jiswJTfi4yZFYGKJUdC+HV662RLWEkJjxACw@mail.gmail.com>
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
To: Lizhi Hou <lizhi.hou@amd.com>
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
Cc: devicetree@vger.kernel.org, Saravana Kannan <saravanak@google.com>, Lukas Wunner <lukas@wunner.de>, Kowshik Jois B S <kowsjois@linux.ibm.com>, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.ibm.com>, Amit Machhiwal <amachhiw@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, Vaibhav Jain <vaibhav@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 23, 2024 at 12:21=E2=80=AFPM Lizhi Hou <lizhi.hou@amd.com> wrot=
e:
>
>
> On 7/23/24 09:21, Rob Herring wrote:
> > On Mon, Jul 15, 2024 at 01:52:30PM -0700, Lizhi Hou wrote:
> >> On 7/15/24 11:55, Rob Herring wrote:
> >>> On Mon, Jul 15, 2024 at 2:08=E2=80=AFAM Amit Machhiwal <amachhiw@linu=
x.ibm.com> wrote:
> >>>> With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequ=
ence
> >>>> of a PCI device attached to a PCI-bridge causes following kernel Oop=
s on
> >>>> a pseries KVM guest:
> >>>>
> >>>>    RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
> >>>>    Kernel attempted to read user page (10ec00000048) - exploit attem=
pt? (uid: 0)
> >>>>    BUG: Unable to handle kernel data access on read at 0x10ec0000004=
8
> >>>>    Faulting instruction address: 0xc0000000012d8728
> >>>>    Oops: Kernel access of bad area, sig: 11 [#1]
> >>>>    LE PAGE_SIZE=3D64K MMU=3DRadix SMP NR_CPUS=3D2048 NUMA pSeries
> >>>> <snip>
> >>>>    NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
> >>>>    LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
> >>>>    Call Trace:
> >>>>    [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0x=
d8
> >>>>    [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb=
0
> >>>>    [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x=
138
> >>>>    [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_dev=
ice_locked+0x34/0x64
> >>>>    [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
> >>>>    [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
> >>>>    [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
> >>>>    [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0=
/0x2e0
> >>>>    [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
> >>>>    [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
> >>>>    [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/=
0x290
> >>>>    [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common=
+0x15c/0x2ec
> >>>> <snip>
> >>>>
> >>>> A git bisect pointed this regression to be introduced via [1] that a=
dded
> >>>> a mechanism to create device tree nodes for parent PCI bridges when =
a
> >>>> PCI device is hot-plugged.
> >>>>
> >>>> The Oops is caused when `pci_stop_dev()` tries to remove a non-exist=
ing
> >>>> device-tree node associated with the pci_dev that was earlier
> >>>> hot-plugged and was attached under a pci-bridge. The PCI dev header
> >>>> `dev->hdr_type` being 0, results a conditional check done with
> >>>> `pci_is_bridge()` into false. Consequently, a call to
> >>>> `of_pci_make_dev_node()` to create a device node is never made. When=
 at
> >>>> a later point in time, in the device node removal path, a memcpy is
> >>>> attempted in `__of_changeset_entry_invert()`; since the device node =
was
> >>>> never created, results in an Oops due to kernel read access to a bad
> >>>> address.
> >>>>
> >>>> To fix this issue, the patch updates `of_changeset_create_node()` to
> >>>> allocate a new node only when the device node doesn't exist and init=
 it
> >>>> in case it does already. Also, introduce `of_pci_free_node()` to be
> >>>> called to only revert and destroy the changeset device node that was
> >>>> created via a call to `of_changeset_create_node()`.
> >>>>
> >>>> [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
> >>>>
> >>>> Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> >>>> Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> >>>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> >>>> Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> >>>> ---
> >>>> Changes since v1:
> >>>>       * Included Lizhi's suggested changes on V1
> >>>>       * Fixed below two warnings from Lizhi's changes and rearranged=
 the cleanup
> >>>>         part a bit in `of_pci_make_dev_node`
> >>>>           drivers/pci/of.c:611:6: warning: no previous prototype for=
 =E2=80=98of_pci_free_node=E2=80=99 [-Wmissing-prototypes]
> >>>>             611 | void of_pci_free_node(struct device_node *np)
> >>>>                 |      ^~~~~~~~~~~~~~~~
> >>>>           drivers/pci/of.c: In function =E2=80=98of_pci_make_dev_nod=
e=E2=80=99:
> >>>>           drivers/pci/of.c:696:1: warning: label =E2=80=98out_destro=
y_cset=E2=80=99 defined but not used [-Wunused-label]
> >>>>             696 | out_destroy_cset:
> >>>>                 | ^~~~~~~~~~~~~~~~
> >>>>       * V1: https://lore.kernel.org/all/20240703141634.2974589-1-ama=
chhiw@linux.ibm.com/
> >>>>
> >>>>    drivers/of/dynamic.c  | 16 ++++++++++++----
> >>>>    drivers/of/unittest.c |  2 +-
> >>>>    drivers/pci/bus.c     |  3 +--
> >>>>    drivers/pci/of.c      | 39 ++++++++++++++++++++++++++------------=
-
> >>>>    drivers/pci/pci.h     |  2 ++
> >>>>    include/linux/of.h    |  1 +
> >>>>    6 files changed, 43 insertions(+), 20 deletions(-)
> >>>>
> >>>> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> >>>> index dda6092e6d3a..9bba5e82a384 100644
> >>>> --- a/drivers/of/dynamic.c
> >>>> +++ b/drivers/of/dynamic.c
> >>>> @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct=
 device_node *np,
> >>>>     * a given changeset.
> >>>>     *
> >>>>     * @ocs: Pointer to changeset
> >>>> + * @np: Pointer to device node. If null, allocate a new node. If no=
t, init an
> >>>> + *     existing one.
> >>>>     * @parent: Pointer to parent device node
> >>>>     * @full_name: Node full name
> >>>>     *
> >>>>     * Return: Pointer to the created device node or NULL in case of =
an error.
> >>>>     */
> >>>>    struct device_node *of_changeset_create_node(struct of_changeset =
*ocs,
> >>>> +                                            struct device_node *np,
> >>>>                                                struct device_node *p=
arent,
> >>>>                                                const char *full_name=
)
> >>>>    {
> >>>> -       struct device_node *np;
> >>>>           int ret;
> >>>>
> >>>> -       np =3D __of_node_dup(NULL, full_name);
> >>>> -       if (!np)
> >>>> -               return NULL;
> >>>> +       if (!np) {
> >>>> +               np =3D __of_node_dup(NULL, full_name);
> >>>> +               if (!np)
> >>>> +                       return NULL;
> >>>> +       } else {
> >>>> +               of_node_set_flag(np, OF_DYNAMIC);
> >>>> +               of_node_set_flag(np, OF_DETACHED);
> >>> Are we going to rename the function to
> >>> of_changeset_create_or_maybe_modify_node()? No. The functions here ar=
e
> >>> very clear in that they allocate new objects and don't reuse what's
> >>> passed in.
> >> Ok. How about keeping of_changeset_create_node unchanged.
> >>
> >> Instead, call kzalloc(), of_node_init() and of_changeset_attach_node()
> >>
> >> in of_pci_make_dev_node() directly.
> >>
> >> A similar example is dlpar_parse_cc_node().
> >>
> >>
> >> Does this sound better?
> > No, because really that code should be re-written using of_changeset
> > API.
> >
> > My suggestion is add a data pointer to struct of_changeset and then set
> > that to something to know the data ptr is a changeset and is your
> > changeset.
>
> I do not fully understand the point. I think the issue is that we do not
> know if a given of_node is created by of_pci_make_dev_node(), correct?

Yes.

> of_node->data can point to anything. And we do not know if it points a
> cset or not.

Right. But instead of checking "of_node->data =3D=3D of_pci_free_node",
you would just be checking "*(of_node->data) =3D=3D of_pci_free_node"
(omitting a NULL check and cast for simplicity). I suppose in theory
that could have a false match, but that could happen in this patch
already.

> Do you mean to add a flag (e.g. OF_PCI_DYNAMIC) to
> indicate of_node->data points to cset?

That would be another option, but OF_PCI_DYNAMIC would not be a good
name because that would be a flag bit for every single caller needing
similar functionality. Name it just what it indicates: of_node->data
points to cset

If we have that flag, then possibly the DT core can handle more
clean-up itself like calling detach and freeing the changeset.
Ideally, the flags should be internal to the DT code.

Rob
