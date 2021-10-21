Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E26435A77
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 07:48:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZc2m73hXz3cQ4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 16:48:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256 header.s=google header.b=FfpOwWgF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=axtens.net (client-ip=2607:f8b0:4864:20::102d;
 helo=mail-pj1-x102d.google.com; envelope-from=dja@axtens.net;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=axtens.net header.i=@axtens.net header.a=rsa-sha256
 header.s=google header.b=FfpOwWgF; dkim-atps=neutral
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZc1m6rq6z305Q
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 16:47:08 +1100 (AEDT)
Received: by mail-pj1-x102d.google.com with SMTP id
 o4-20020a17090a3d4400b001a1c8344c3fso163251pjf.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 22:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version:content-transfer-encoding;
 bh=sG1HWuRuO6c0Rpn+6w9w/VYhZ5qpUeKlwkt9Cr0iRSY=;
 b=FfpOwWgFa+81L7WtZrl/Lpk7XwSmNliXezf137AaBWpuAnlsuDPmCHAWUzwumajsrh
 ZBzJixVcq6DctVOBMDAcDq1zX7Cdn0lEFIYVBokC1wuo0htAaKVCOlgkUy/GtzJVh/sh
 MdEn4ImivGc+DLwFptPPsegNRp3c4y4cPCGR8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version:content-transfer-encoding;
 bh=sG1HWuRuO6c0Rpn+6w9w/VYhZ5qpUeKlwkt9Cr0iRSY=;
 b=sYZdgaOsLhxyZmWWoAS658QCDVG9UbiD7pjUiOyiAj9ExMq2TAwWauO6gp3H7mYirM
 L1zs2+m+N3BFUnmD1zMWXef0oX7ud2O0iS5SCCRPs4o0quFLgf1d3otd9fM2HSC002mP
 E0RKAVRV19jTDxdKznLUuxLpYPYN3NUwjD2FRJERtSMz+ccQ7XrGp6ZY1uxOH3rLBZOS
 E/w6SQ4NulG1Avl84uir4Qyi5Jgrl4yaeZs71LZZMLy2Q9f598cMOlHCXV17tUTJ8ru3
 WfnNiA0wI2fzfC21vIHH0KqYjEfomNgH3mHE+KzACljXy2ZoyNpTyPZ7U46PV/JG+wo2
 lrzg==
X-Gm-Message-State: AOAM532zo6roVjVjdShSidZj9hsSOuA9XSbaWabZOUKDo0SQ4kB8+c/G
 OtRYxHZuZWtoDx+Rl0Or3AERCCaCGt/Kqw==
X-Google-Smtp-Source: ABdhPJws4j6Se4ZzNUU9ENsi4MvHGx9JPM/hJLVORNGEzhQGAhc4MVa4B9inzBVtM/qyWX9u+ec1Mg==
X-Received: by 2002:a17:902:c94f:b0:13f:4b5:cddd with SMTP id
 i15-20020a170902c94f00b0013f04b5cdddmr3321752pla.58.1634795225527; 
 Wed, 20 Oct 2021 22:47:05 -0700 (PDT)
Received: from localhost ([2001:4479:e000:e400:b8eb:cfd:e941:539d])
 by smtp.gmail.com with ESMTPSA id f15sm4991666pfe.132.2021.10.20.22.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Oct 2021 22:47:04 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2] powerpc/pseries/mobility: ignore ibm,
 platform-facilities updates
In-Reply-To: <20211020194703.2613093-1-nathanl@linux.ibm.com>
References: <20211020194703.2613093-1-nathanl@linux.ibm.com>
Date: Thu, 21 Oct 2021 16:47:02 +1100
Message-ID: <87zgr3expl.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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
Cc: tyreld@linux.ibm.com, cheloha@linux.ibm.com, ldufour@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

Thanks for the detailed explanation.

I've not really worked with the partition migration code before I was
able to follow your logic.

> On VMs with NX encryption, compression, and/or RNG offload, these
> capabilities are described by nodes in the ibm,platform-facilities device
> tree hierarchy:
>
>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>   =E2=94=9C=E2=94=80=E2=94=80 ibm,compression-v1
>   =E2=94=9C=E2=94=80=E2=94=80 ibm,random-v1
>   =E2=94=94=E2=94=80=E2=94=80 ibm,sym-encryption-v1
>
>   3 directories
>
> The acceleration functions that these nodes describe are not disrupted by
> live migration, not even temporarily.
>
> But the post-migration ibm,update-nodes sequence firmware always sends
> "delete" messages for this hierarchy, followed by an "add" directive to
> reconstruct it via ibm,configure-connector (log with debugging statements
> enabled in mobility.c):
>
>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:42949672=
85
>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:429=
4967284
>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v1:=
4294967283
>   mobility: removing node /ibm,platform-facilities:4294967286
>   ...
>   mobility: added node /ibm,platform-facilities:4294967286
>
> Note we receive a single "add" message for the entire hierarchy, and what
> we receive from the ibm,configure-connector sequence is the top-level
> platform-facilities node along with its three children. The debug message
> simply reports the parent node and not the whole subtree.

If I understand correctly, (and again, this is not my area at all!) we
still have to go out to the firmware and call the
ibm,configure-connector sequence in order to figure out that the node
we're supposed to add is the ibm,platform-facilites node, right? We
can't save enough information at delete time to avoid the trip out to
firmware?

> Also, significantly, the nodes added are almost completely equivalent to
> the ones removed; even phandles are unchanged. ibm,shared-interrupt-pool =
in
> the leaf nodes is the only property I've observed to differ, and Linux do=
es
> not use that. So in practice, the sum of update messages Linux receives f=
or
> this hierarchy is equivalent to minor property updates.
>
> We succeed in removing the original hierarchy from the device tree. But t=
he
> vio bus code is ignorant of this, and does not unbind or relinquish its
> references. The leaf nodes, still reachable through sysfs, of course still
> refer to the now-freed ibm,platform-facilities parent node, which makes
> use-after-free possible:
>
>   refcount_t: addition on 0; use-after-free.
>   WARNING: CPU: 3 PID: 1706 at lib/refcount.c:25 refcount_warn_saturate+0=
x164/0x1f0
>   refcount_warn_saturate+0x160/0x1f0 (unreliable)
>   kobject_get+0xf0/0x100
>   of_node_get+0x30/0x50
>   of_get_parent+0x50/0xb0
>   of_fwnode_get_parent+0x54/0x90
>   fwnode_count_parents+0x50/0x150
>   fwnode_full_name_string+0x30/0x110
>   device_node_string+0x49c/0x790
>   vsnprintf+0x1c0/0x4c0
>   sprintf+0x44/0x60
>   devspec_show+0x34/0x50
>   dev_attr_show+0x40/0xa0
>   sysfs_kf_seq_show+0xbc/0x200
>   kernfs_seq_show+0x44/0x60
>   seq_read_iter+0x2a4/0x740
>   kernfs_fop_read_iter+0x254/0x2e0
>   new_sync_read+0x120/0x190
>   vfs_read+0x1d0/0x240
>
> Moreover, the "new" replacement subtree is not correctly added to the
> device tree, resulting in ibm,platform-facilities parent node without the
> appropriate leaf nodes, and broken symlinks in the sysfs device hierarchy:
>
>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>
>   0 directories
>
>   $ cd /sys/devices/vio ; find . -xtype l -exec file {} +
>   ./ibm,sym-encryption-v1/of_node: broken symbolic link to
>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,sym-enc=
ryption-v1
>   ./ibm,random-v1/of_node:         broken symbolic link to
>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,random-=
v1
>   ./ibm,compression-v1/of_node:    broken symbolic link to
>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,compres=
sion-v1
>
> This is because add_dt_node() -> dlpar_attach_node() attaches only the
> parent node returned from configure-connector, ignoring any children. This
> should be corrected for the general case, but fixing that won't help with
> the stale OF node references, which is the more urgent problem.
>
> One way to address that would be to make the drivers respond to node
> removal notifications, so that node references can be dropped
> appropriately. But this would likely force the drivers to disrupt active
> clients for no useful purpose: equivalent nodes are immediately re-added.
> And recall that the acceleration capabilities described by the nodes rema=
in
> available throughout the whole process.
>
> The solution I believe to be robust for this situation is to convert
> remove+add of a node with an unchanged phandle to an update of the node's
> properties in the Linux device tree structure. That would involve changing
> and adding a fair amount of code, and may take several iterations to land.
>
> Until that can be realized we have a confirmed use-after-free and the
> possibility of memory corruption. So add a limited workaround that
> discriminates on the node type, ignoring adds and removes. This should be
> amenable to backporting in the meantime.

Yeah it's an unpleasant situation to find ourselves in. It's a bit icky
but as I think you said in a previous email, at least this isn't worse:
in the common case it should now succeed and and if properties change
significantly it will still fail.

My one question (from more of a security point of view) is:
 1) Say you start using the facilities with a particular set of
    parameters.

 2) Say you then get migrated and the parameters change.

 3) If you keep using the platform facilities as if the original
    properties are still valid, can this cause any Interesting,
    unexpected or otherwise Bad consequences? Are we going to end up
    (for example) scribbling over random memory somehow?

Apart from that, the code seems to do what it says, it seems to solve a
real problem, the error and memory handling makes sense, you _put the DT
nodes that you _get, the comments are helpful and descriptive, and it
passes the automated tests on patchwork/snowpatch.

Kind regards,
Daniel

> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> Fixes: 410bccf97881 ("powerpc/pseries: Partition migration in the kernel")
> Cc: stable@vger.kernel.org
> ---
>
> Notes:
>     Changes since v1:
>=20=20=20=20=20
>     * Clarify that the vio bus code maintains references to removed nodes=
, per
>       Tyrel.
>
>  arch/powerpc/platforms/pseries/mobility.c | 34 +++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
>
> diff --git a/arch/powerpc/platforms/pseries/mobility.c b/arch/powerpc/pla=
tforms/pseries/mobility.c
> index e83e0891272d..210a37a065fb 100644
> --- a/arch/powerpc/platforms/pseries/mobility.c
> +++ b/arch/powerpc/platforms/pseries/mobility.c
> @@ -63,6 +63,27 @@ static int mobility_rtas_call(int token, char *buf, s3=
2 scope)
>=20=20
>  static int delete_dt_node(struct device_node *dn)
>  {
> +	struct device_node *pdn;
> +	bool is_platfac;
> +
> +	pdn =3D of_get_parent(dn);
> +	is_platfac =3D of_node_is_type(dn, "ibm,platform-facilities") ||
> +		     of_node_is_type(pdn, "ibm,platform-facilities");
> +	of_node_put(pdn);
> +
> +	/*
> +	 * The drivers that bind to nodes in the platform-facilities
> +	 * hierarchy don't support node removal, and the removal directive
> +	 * from firmware is always followed by an add of an equivalent
> +	 * node. The capability (e.g. RNG, encryption, compression)
> +	 * represented by the node is never interrupted by the migration.
> +	 * So ignore changes to this part of the tree.
> +	 */
> +	if (is_platfac) {
> +		pr_notice("ignoring remove operation for %pOFfp\n", dn);
> +		return 0;
> +	}
> +
>  	pr_debug("removing node %pOFfp\n", dn);
>  	dlpar_detach_node(dn);
>  	return 0;
> @@ -222,6 +243,19 @@ static int add_dt_node(struct device_node *parent_dn=
, __be32 drc_index)
>  	if (!dn)
>  		return -ENOENT;
>=20=20
> +	/*
> +	 * Since delete_dt_node() ignores this node type, this is the
> +	 * necessary counterpart. We also know that a platform-facilities
> +	 * node returned from dlpar_configure_connector() has children
> +	 * attached, and dlpar_attach_node() only adds the parent, leaking
> +	 * the children. So ignore these on the add side for now.
> +	 */
> +	if (of_node_is_type(dn, "ibm,platform-facilities")) {
> +		pr_notice("ignoring add operation for %pOF\n", dn);
> +		dlpar_free_cc_nodes(dn);
> +		return 0;
> +	}
> +
>  	rc =3D dlpar_attach_node(dn, parent_dn);
>  	if (rc)
>  		dlpar_free_cc_nodes(dn);
> --=20
> 2.31.1
