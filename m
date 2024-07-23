Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BCC93A43E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jul 2024 18:21:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tm3Hr5Jk;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WT2Tm51Hzz3d8D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2024 02:21:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Tm3Hr5Jk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WT2T35fjzz3cQX
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2024 02:21:11 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 2214ECE0F68;
	Tue, 23 Jul 2024 16:21:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB9FC4AF09;
	Tue, 23 Jul 2024 16:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721751668;
	bh=ibgOg0b+WNf0hExtbAkMakcq3rUFIvmNPQsl79AMda8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Tm3Hr5JkaqbRrYxNoojwnOT5kyuBAFWFXzQlAQCRZrWYBohMm0dycCWPes48ewCAa
	 ApXV+PGjWIuM+1COABF2TQ2E0ZGCDVs79yN3P4U7pmvUoyBdZiGVEz0RTPuEI5goyk
	 XExPXRvm7yaOV1V0u5WPkPbtSGhyzY1LKh+Dat438yfCcmzdZfKADtS4cV/xUQicH2
	 05f3bxxuJ5LNew3lZY4r7DJNRlRxz6NxNFmij3megUTig30E9d7D8C5X4AG/yiq5aj
	 o6Xz+hhMx2JT/CXeIYk08kY90WGFLeCTiagIak3I5HkgDQxMbYGBGU7TgwM+rdJMQu
	 Wu/O3cPsm7JLQ==
Date: Tue, 23 Jul 2024 10:21:07 -0600
From: Rob Herring <robh@kernel.org>
To: Lizhi Hou <lizhi.hou@amd.com>
Subject: Re: [PATCH v2] PCI: Fix crash during pci_dev hot-unplug on pseries
 KVM guest
Message-ID: <20240723162107.GA501469-robh@kernel.org>
References: <20240715080726.2496198-1-amachhiw@linux.ibm.com>
 <CAL_JsqKKkcXDJ2nz98WNCvsSFzzc3dVXVnxMCntFXsCP=MeKsA@mail.gmail.com>
 <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6c92c73-13fb-8e9c-29de-1437654c3880@amd.com>
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

On Mon, Jul 15, 2024 at 01:52:30PM -0700, Lizhi Hou wrote:
> 
> On 7/15/24 11:55, Rob Herring wrote:
> > On Mon, Jul 15, 2024 at 2:08 AM Amit Machhiwal <amachhiw@linux.ibm.com> wrote:
> > > With CONFIG_PCI_DYNAMIC_OF_NODES [1], a hot-plug and hot-unplug sequence
> > > of a PCI device attached to a PCI-bridge causes following kernel Oops on
> > > a pseries KVM guest:
> > > 
> > >   RTAS: event: 2, Type: Hotplug Event (229), Severity: 1
> > >   Kernel attempted to read user page (10ec00000048) - exploit attempt? (uid: 0)
> > >   BUG: Unable to handle kernel data access on read at 0x10ec00000048
> > >   Faulting instruction address: 0xc0000000012d8728
> > >   Oops: Kernel access of bad area, sig: 11 [#1]
> > >   LE PAGE_SIZE=64K MMU=Radix SMP NR_CPUS=2048 NUMA pSeries
> > > <snip>
> > >   NIP [c0000000012d8728] __of_changeset_entry_invert+0x10/0x1ac
> > >   LR [c0000000012da7f0] __of_changeset_revert_entries+0x98/0x180
> > >   Call Trace:
> > >   [c00000000bcc3970] [c0000000012daa60] of_changeset_revert+0x58/0xd8
> > >   [c00000000bcc39c0] [c000000000d0ed78] of_pci_remove_node+0x74/0xb0
> > >   [c00000000bcc39f0] [c000000000cdcfe0] pci_stop_bus_device+0xf4/0x138
> > >   [c00000000bcc3a30] [c000000000cdd140] pci_stop_and_remove_bus_device_locked+0x34/0x64
> > >   [c00000000bcc3a60] [c000000000cf3780] remove_store+0xf0/0x108
> > >   [c00000000bcc3ab0] [c000000000e89e04] dev_attr_store+0x34/0x78
> > >   [c00000000bcc3ad0] [c0000000007f8dd4] sysfs_kf_write+0x70/0xa4
> > >   [c00000000bcc3af0] [c0000000007f7248] kernfs_fop_write_iter+0x1d0/0x2e0
> > >   [c00000000bcc3b40] [c0000000006c9b08] vfs_write+0x27c/0x558
> > >   [c00000000bcc3bf0] [c0000000006ca168] ksys_write+0x90/0x170
> > >   [c00000000bcc3c40] [c000000000033248] system_call_exception+0xf8/0x290
> > >   [c00000000bcc3e50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
> > > <snip>
> > > 
> > > A git bisect pointed this regression to be introduced via [1] that added
> > > a mechanism to create device tree nodes for parent PCI bridges when a
> > > PCI device is hot-plugged.
> > > 
> > > The Oops is caused when `pci_stop_dev()` tries to remove a non-existing
> > > device-tree node associated with the pci_dev that was earlier
> > > hot-plugged and was attached under a pci-bridge. The PCI dev header
> > > `dev->hdr_type` being 0, results a conditional check done with
> > > `pci_is_bridge()` into false. Consequently, a call to
> > > `of_pci_make_dev_node()` to create a device node is never made. When at
> > > a later point in time, in the device node removal path, a memcpy is
> > > attempted in `__of_changeset_entry_invert()`; since the device node was
> > > never created, results in an Oops due to kernel read access to a bad
> > > address.
> > > 
> > > To fix this issue, the patch updates `of_changeset_create_node()` to
> > > allocate a new node only when the device node doesn't exist and init it
> > > in case it does already. Also, introduce `of_pci_free_node()` to be
> > > called to only revert and destroy the changeset device node that was
> > > created via a call to `of_changeset_create_node()`.
> > > 
> > > [1] commit 407d1a51921e ("PCI: Create device tree node for bridge")
> > > 
> > > Fixes: 407d1a51921e ("PCI: Create device tree node for bridge")
> > > Reported-by: Kowshik Jois B S <kowsjois@linux.ibm.com>
> > > Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
> > > Signed-off-by: Amit Machhiwal <amachhiw@linux.ibm.com>
> > > ---
> > > Changes since v1:
> > >      * Included Lizhi's suggested changes on V1
> > >      * Fixed below two warnings from Lizhi's changes and rearranged the cleanup
> > >        part a bit in `of_pci_make_dev_node`
> > >          drivers/pci/of.c:611:6: warning: no previous prototype for ‘of_pci_free_node’ [-Wmissing-prototypes]
> > >            611 | void of_pci_free_node(struct device_node *np)
> > >                |      ^~~~~~~~~~~~~~~~
> > >          drivers/pci/of.c: In function ‘of_pci_make_dev_node’:
> > >          drivers/pci/of.c:696:1: warning: label ‘out_destroy_cset’ defined but not used [-Wunused-label]
> > >            696 | out_destroy_cset:
> > >                | ^~~~~~~~~~~~~~~~
> > >      * V1: https://lore.kernel.org/all/20240703141634.2974589-1-amachhiw@linux.ibm.com/
> > > 
> > >   drivers/of/dynamic.c  | 16 ++++++++++++----
> > >   drivers/of/unittest.c |  2 +-
> > >   drivers/pci/bus.c     |  3 +--
> > >   drivers/pci/of.c      | 39 ++++++++++++++++++++++++++-------------
> > >   drivers/pci/pci.h     |  2 ++
> > >   include/linux/of.h    |  1 +
> > >   6 files changed, 43 insertions(+), 20 deletions(-)
> > > 
> > > diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> > > index dda6092e6d3a..9bba5e82a384 100644
> > > --- a/drivers/of/dynamic.c
> > > +++ b/drivers/of/dynamic.c
> > > @@ -492,21 +492,29 @@ struct device_node *__of_node_dup(const struct device_node *np,
> > >    * a given changeset.
> > >    *
> > >    * @ocs: Pointer to changeset
> > > + * @np: Pointer to device node. If null, allocate a new node. If not, init an
> > > + *     existing one.
> > >    * @parent: Pointer to parent device node
> > >    * @full_name: Node full name
> > >    *
> > >    * Return: Pointer to the created device node or NULL in case of an error.
> > >    */
> > >   struct device_node *of_changeset_create_node(struct of_changeset *ocs,
> > > +                                            struct device_node *np,
> > >                                               struct device_node *parent,
> > >                                               const char *full_name)
> > >   {
> > > -       struct device_node *np;
> > >          int ret;
> > > 
> > > -       np = __of_node_dup(NULL, full_name);
> > > -       if (!np)
> > > -               return NULL;
> > > +       if (!np) {
> > > +               np = __of_node_dup(NULL, full_name);
> > > +               if (!np)
> > > +                       return NULL;
> > > +       } else {
> > > +               of_node_set_flag(np, OF_DYNAMIC);
> > > +               of_node_set_flag(np, OF_DETACHED);
> > Are we going to rename the function to
> > of_changeset_create_or_maybe_modify_node()? No. The functions here are
> > very clear in that they allocate new objects and don't reuse what's
> > passed in.
> 
> Ok. How about keeping of_changeset_create_node unchanged.
> 
> Instead, call kzalloc(), of_node_init() and of_changeset_attach_node()
> 
> in of_pci_make_dev_node() directly.
> 
> A similar example is dlpar_parse_cc_node().
> 
> 
> Does this sound better?

No, because really that code should be re-written using of_changeset
API.

My suggestion is add a data pointer to struct of_changeset and then set 
that to something to know the data ptr is a changeset and is your 
changeset.

Rob
