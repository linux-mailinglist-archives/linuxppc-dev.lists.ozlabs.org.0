Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FEC84340A9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Oct 2021 23:37:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYnBh4F2Zz3cQN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 08:37:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=G2EH2m0g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=G2EH2m0g; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYn9s5FYdz2ym5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 08:36:17 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JLMLhj001921; 
 Tue, 19 Oct 2021 17:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=ERHc6lXOtP+iD7ivwJuvBtYVV+m4H5gxHym2i418xoI=;
 b=G2EH2m0gUE8vGfF26AGQSNtnSUqaVyW9QR8lsEiZs/gPT1+f7caD8KPH4g9q8nO1H1TT
 YSHEp8+PIw4HcPpTb2V3/NUv+YUCuUUa73bfkJ+04Wq9ecrxNd85LhdZYza01IqAlsOk
 OeGs0JyBMtUC5CAzr4kq32DlnvBdbtYR/dTz2uYDPDzAYCd0q80KUludUR75XWB5gpjZ
 2fNwOiz2VBwaFZuxXqZsW5z4mIUiuH7ZIxFVdGDfl27buD7bdd/+DhL9zzXjL5SD890o
 okdRwVH2JpqkeED8dyktqcoyVkYmlYIEUjn2Op4V76BeTm7EMwxtC5EfPQmCJucD2Je0 Sg== 
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bt5vjr796-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 17:36:11 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19JLS4fk021650;
 Tue, 19 Oct 2021 21:36:10 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma05wdc.us.ibm.com with ESMTP id 3bqpcbr7ba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 21:36:10 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19JLa8pB45023544
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 21:36:08 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A5D826E064;
 Tue, 19 Oct 2021 21:36:08 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 621DB6E058;
 Tue, 19 Oct 2021 21:36:08 +0000 (GMT)
Received: from localhost (unknown [9.211.47.38])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 21:36:08 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/mobility: ignore
 ibm,platform-facilities updates
In-Reply-To: <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
References: <20211018163424.2491472-1-nathanl@linux.ibm.com>
 <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
Date: Tue, 19 Oct 2021 16:36:07 -0500
Message-ID: <87zgr4y9x4.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M6qU6HykHv3tOHTAwSwdUWuGbv8Yo6d_
X-Proofpoint-ORIG-GUID: M6qU6HykHv3tOHTAwSwdUWuGbv8Yo6d_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 adultscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 impostorscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190124
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
Cc: cheloha@linux.ibm.com, ldufour@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Tyrel, thanks for the detailed review.

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 10/18/21 9:34 AM, Nathan Lynch wrote:
>> On VMs with NX encryption, compression, and/or RNG offload, these
>> capabilities are described by nodes in the ibm,platform-facilities device
>> tree hierarchy:
>>=20
>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,compression-v1
>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,random-v1
>>   =E2=94=94=E2=94=80=E2=94=80 ibm,sym-encryption-v1
>>=20
>>   3 directories
>>=20
>> The acceleration functions that these nodes describe are not disrupted by
>> live migration, not even temporarily.
>>=20
>> But the post-migration ibm,update-nodes sequence firmware always sends
>> "delete" messages for this hierarchy, followed by an "add" directive to
>> reconstruct it via ibm,configure-connector (log with debugging statements
>> enabled in mobility.c):
>>=20
>>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:4294967=
285
>>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:42=
94967284
>>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v1=
:4294967283
>>   mobility: removing node /ibm,platform-facilities:4294967286
>>   ...
>>   mobility: added node /ibm,platform-facilities:4294967286
>
> It always bothered me that the update from firmware here was an delete/ad=
d at
> the entire '/ibm,platform-facilities' node level instead of update proper=
ties
> calls. When I asked about it years ago the claim was it was just easier t=
o pass
> an entire sub-tree as a single node add.

Yes, I believe this is for ease of implementation on their part.

>> Note we receive a single "add" message for the entire hierarchy, and what
>> we receive from the ibm,configure-connector sequence is the top-level
>> platform-facilities node along with its three children. The debug message
>> simply reports the parent node and not the whole subtree.
>>=20
>> Also, significantly, the nodes added are almost completely equivalent to
>> the ones removed; even phandles are unchanged. ibm,shared-interrupt-pool=
 in
>> the leaf nodes is the only property I've observed to differ, and Linux d=
oes
>> not use that. So in practice, the sum of update messages Linux receives =
for
>> this hierarchy is equivalent to minor property updates.
>
> The two props I would think maybe we would need to be most be concerned a=
bout
> ensuring don't change are "ibm,resource-id" which gets used in the vio bu=
s code
> when configuring platform facilities nodes, and 'ibm,max-sync-cop' used b=
y the
> pseries-nx driver.

The proposed change does not introduce any regressions with respect to
those properties. At least, that's the intention.

ibm,resource-id: the vio code lacks any way of reacting to this changing
at runtime. (I could be wrong, but I suspect it does not change in
practice even though it is technically allowed by the spec.)

ibm,max-sync-cop: the nx code has a notifier callback to handle changes
to this and a couple other properties, but only if they are propagated
through an "update property" event. Node remove+add doesn't trigger the
callback. I think this one is more likely than resource-id to change
between different models or configurations, but I haven't observed this
to happen in my test environment.

Without this change, the child nodes of the ibm,platform-facilities
container in Linux's device tree are completely discarded (see more
below) after a partition migration. This makes driver re-initialization
impossible without a reboot. With the change, the nodes are retained,
albeit with properties that may not correctly reflect the destination
system. To be clear, I think this is bad, and I am working on a better
solution. But I consider the change here a net improvement for the
common case (no meaningful property changes), and it's a wash for
migrations where the properties could change (we weren't handling that
anyway).

>> We succeed in removing the original hierarchy from the device tree. But =
the
>> drivers bound to the leaf nodes are ignorant of this, and do not relinqu=
ish
>> their references. The leaf nodes, still reachable through sysfs, of cour=
se
>> still refer to the now-freed ibm,platform-facilities parent node, which
>> makes use-after-free possible:
>
> It is actually more subtle then the drivers themselves being ignorant. Th=
ey
> could register node update notifiers, but the real problem here is that t=
he vio
> bus device itself takes a reference to each child node registered to the =
bus.
> I'm not sure we really want to unbind/rebind drivers as a result of LPM, =
but it
> would be generic to the vio bus instead of updating each driver to ensure=
 its
> handling it device node references properly.

You're right. I will modify the commit message.

>>   refcount_t: addition on 0; use-after-free.
>>   WARNING: CPU: 3 PID: 1706 at lib/refcount.c:25 refcount_warn_saturate+=
0x164/0x1f0
>>   refcount_warn_saturate+0x160/0x1f0 (unreliable)
>>   kobject_get+0xf0/0x100
>>   of_node_get+0x30/0x50
>>   of_get_parent+0x50/0xb0
>>   of_fwnode_get_parent+0x54/0x90
>>   fwnode_count_parents+0x50/0x150
>>   fwnode_full_name_string+0x30/0x110
>>   device_node_string+0x49c/0x790
>>   vsnprintf+0x1c0/0x4c0
>>   sprintf+0x44/0x60
>>   devspec_show+0x34/0x50
>>   dev_attr_show+0x40/0xa0
>>   sysfs_kf_seq_show+0xbc/0x200
>>   kernfs_seq_show+0x44/0x60
>>   seq_read_iter+0x2a4/0x740
>>   kernfs_fop_read_iter+0x254/0x2e0
>>   new_sync_read+0x120/0x190
>>   vfs_read+0x1d0/0x240
>>=20
>> Moreover, the "new" replacement subtree is not correctly added to the
>> device tree, resulting in ibm,platform-facilities parent node without the
>> appropriate leaf nodes, and broken symlinks in the sysfs device hierarch=
y:
>>=20
>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>=20
>>   0 directories
>>=20
>>   $ cd /sys/devices/vio ; find . -xtype l -exec file {} +
>>   ./ibm,sym-encryption-v1/of_node: broken symbolic link to
>>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,sym-en=
cryption-v1
>>   ./ibm,random-v1/of_node:         broken symbolic link to
>>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,random=
-v1
>>   ./ibm,compression-v1/of_node:    broken symbolic link to
>>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,compre=
ssion-v1
>>=20
>> This is because add_dt_node() -> dlpar_attach_node() attaches only the
>> parent node returned from configure-connector, ignoring any children. Th=
is
>> should be corrected for the general case, but fixing that won't help with
>> the stale OF node references, which is the more urgent problem.
>
> I don't follow. If the code path you mention is truly broken in the way y=
ou say
> then DLPAR operations involving nodes with child nodes should also be
> broken.

Hmm I don't know of any kernel-based DLPAR workflow that attaches
sub-trees i.e. parent + children. Processor addition attaches CPU nodes
and possibly cache nodes, but they have sibling relationships. If you're
thinking of I/O adapters, the DT updates are (still!) driven from user
space. As undesirable as that is, that use case actually works correctly
AFAIK.

What happens for the platfac LPM scenario is that
dlpar_configure_connector() returns the node pointer for the root
ibm,platform-facilities node, with children attached. That node pointer
is passed from add_dt_node() -> dlpar_attach_node() -> of_attach_node()
-> __of_attach_node(), where its child and sibling fields are
overwritten in the process of attaching it to the tree.

> Last I had seen was that sysfs adds of the new nodes got renamed because =
the old
> nodes still existed as a result of there reference count not going to zer=
o. Has
> this behavior changed, or am I misremembering the observed behavior?

Maybe you're thinking of the CPU cache node issue recently fixed by
7edd5c9a8820 ("powerpc/pseries/cpuhp: cache node corrections")?

>> One way to address that would be to make the drivers respond to node
>> removal notifications, so that node references can be dropped
>> appropriately. But this would likely force the drivers to disrupt active
>> clients for no useful purpose: equivalent nodes are immediately re-added.
>> And recall that the acceleration capabilities described by the nodes rem=
ain
>> available throughout the whole process.
>
> See my comments above about its the vio bus more at fault here then the d=
rivers
> themselves. I'm inclined to agree though that disrupting active operation=
s with
> a driver unbind/rebind is a little extreme.
>
> This also brings me back to firmware removing and re-adding the whole
> '/ibm,platform-facilities' node instead of simply updating changed proper=
ties
> could avoid this whole fiasco.

It's a little unfortunate for us, but it's longstanding behavior that is
presumably tolerated fine by other OSes, and it's allowed by the spec.
So we just need to deal with it.

>> The solution I believe to be robust for this situation is to convert
>> remove+add of a node with an unchanged phandle to an update of the node's
>> properties in the Linux device tree structure. That would involve changi=
ng
>> and adding a fair amount of code, and may take several iterations to lan=
d.
>>=20
>> Until that can be realized we have a confirmed use-after-free and the
>> possibility of memory corruption. So add a limited workaround that
>> discriminates on the node type, ignoring adds and removes. This should be
>> amenable to backporting in the meantime.
>
> The reality is that '/ibm,platform-facilities' and 'cache' nodes are the =
only
> LPM scoped device tree nodes that allow node delete/add. So, as a one-off
> workaround to deal with what I consider a bad firmware approach I think t=
his is
> probably the best approach barring getting firmware to move to an update
> properties approach.

Thanks. I think there's no reason to expect firmware's behavior to
change, and there wouldn't be much payoff for us at this point -- we
would still have to support the current behavior.
