Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9421D4341DF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 01:03:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HYq6j1frZz3cQC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 10:03:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=XijhEe8c;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=XijhEe8c; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HYq5w4htzz2yHL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Oct 2021 10:02:59 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19JMMlXL022145; 
 Tue, 19 Oct 2021 19:02:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=6+2JiH985izxKsnDqfvFtVCVugqHe+bPX4jT7Uzsv0I=;
 b=XijhEe8cfzl8wfNuwFjaYmJI60nQmytdSvoYHshY6+d3eVO18XQufMb06OsFy2DmqWb6
 UujF/DLzza6rafTJVtnJ38IjC2mrMJxBI9vVPvt3DWokvGwyVyzkgOZDBNYMrPATj39H
 OejatNfp3GYCwa1/cuI9Yxz4aPk7RsNwecPEkkDMb/MRL6PVo0SEPctet6kpre6RUz+X
 1uzsshHvNqzA07NUvOJXin9jO1FOLgOgTCKGgxRhpEJ0p1L8lHwmeby9bgcVE8yfLT3/
 x/A85EzUCbxwPlKqKJiCl08qUZaV1Jvsbfux+FBT3bwPnyya4dce/ZcAkvMTeRcKDyMu HQ== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bt6rsgj17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 19:02:53 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19JMvQCi023865;
 Tue, 19 Oct 2021 23:02:51 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04wdc.us.ibm.com with ESMTP id 3bqpcb99x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 19 Oct 2021 23:02:51 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19JN2oi545613530
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 19 Oct 2021 23:02:50 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56EE1C605A;
 Tue, 19 Oct 2021 23:02:50 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42B86C6059;
 Tue, 19 Oct 2021 23:02:49 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.65.235.71])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 19 Oct 2021 23:02:48 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries/mobility: ignore ibm, platform-facilities
 updates
To: Nathan Lynch <nathanl@linux.ibm.com>
References: <20211018163424.2491472-1-nathanl@linux.ibm.com>
 <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
 <87zgr4y9x4.fsf@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <669cb321-7e7f-e45b-a7a1-7002d8371080@linux.ibm.com>
Date: Tue, 19 Oct 2021 16:02:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87zgr4y9x4.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _3xtbNWWnsvvy2k8Zz4cQOwnAhHuYW5C
X-Proofpoint-ORIG-GUID: _3xtbNWWnsvvy2k8Zz4cQOwnAhHuYW5C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-19_02,2021-10-19_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 phishscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 clxscore=1015 mlxscore=0 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110190132
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

On 10/19/21 2:36 PM, Nathan Lynch wrote:
> Hi Tyrel, thanks for the detailed review.
> 
> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>> On 10/18/21 9:34 AM, Nathan Lynch wrote:
>>> On VMs with NX encryption, compression, and/or RNG offload, these
>>> capabilities are described by nodes in the ibm,platform-facilities device
>>> tree hierarchy:
>>>
>>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>   ├── ibm,compression-v1
>>>   ├── ibm,random-v1
>>>   └── ibm,sym-encryption-v1
>>>
>>>   3 directories
>>>
>>> The acceleration functions that these nodes describe are not disrupted by
>>> live migration, not even temporarily.
>>>
>>> But the post-migration ibm,update-nodes sequence firmware always sends
>>> "delete" messages for this hierarchy, followed by an "add" directive to
>>> reconstruct it via ibm,configure-connector (log with debugging statements
>>> enabled in mobility.c):
>>>
>>>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:4294967285
>>>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:4294967284
>>>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-v1:4294967283
>>>   mobility: removing node /ibm,platform-facilities:4294967286
>>>   ...
>>>   mobility: added node /ibm,platform-facilities:4294967286
>>
>> It always bothered me that the update from firmware here was an delete/add at
>> the entire '/ibm,platform-facilities' node level instead of update properties
>> calls. When I asked about it years ago the claim was it was just easier to pass
>> an entire sub-tree as a single node add.
> 
> Yes, I believe this is for ease of implementation on their part.

I'd still argue that a full node removal or addition is a platform
reconfiguration on par with a hotplug operation.

> 
>>> Note we receive a single "add" message for the entire hierarchy, and what
>>> we receive from the ibm,configure-connector sequence is the top-level
>>> platform-facilities node along with its three children. The debug message
>>> simply reports the parent node and not the whole subtree.
>>>
>>> Also, significantly, the nodes added are almost completely equivalent to
>>> the ones removed; even phandles are unchanged. ibm,shared-interrupt-pool in
>>> the leaf nodes is the only property I've observed to differ, and Linux does
>>> not use that. So in practice, the sum of update messages Linux receives for
>>> this hierarchy is equivalent to minor property updates.
>>
>> The two props I would think maybe we would need to be most be concerned about
>> ensuring don't change are "ibm,resource-id" which gets used in the vio bus code
>> when configuring platform facilities nodes, and 'ibm,max-sync-cop' used by the
>> pseries-nx driver.
> 
> The proposed change does not introduce any regressions with respect to
> those properties. At least, that's the intention.
> 
> ibm,resource-id: the vio code lacks any way of reacting to this changing
> at runtime. (I could be wrong, but I suspect it does not change in
> practice even though it is technically allowed by the spec.)
> 
> ibm,max-sync-cop: the nx code has a notifier callback to handle changes
> to this and a couple other properties, but only if they are propagated
> through an "update property" event. Node remove+add doesn't trigger the
> callback. I think this one is more likely than resource-id to change
> between different models or configurations, but I haven't observed this
> to happen in my test environment.
> 
> Without this change, the child nodes of the ibm,platform-facilities
> container in Linux's device tree are completely discarded (see more
> below) after a partition migration. This makes driver re-initialization
> impossible without a reboot. With the change, the nodes are retained,
> albeit with properties that may not correctly reflect the destination
> system. To be clear, I think this is bad, and I am working on a better
> solution. But I consider the change here a net improvement for the
> common case (no meaningful property changes), and it's a wash for
> migrations where the properties could change (we weren't handling that
> anyway).

This didn't use to be the case. After some digging I see the problem, and it is
clearly a long standing regression (see comment further down). Part of that is
my fault for putting the platform-facilities errors on the back burner when I
was working this area.

> 
>>> We succeed in removing the original hierarchy from the device tree. But the
>>> drivers bound to the leaf nodes are ignorant of this, and do not relinquish
>>> their references. The leaf nodes, still reachable through sysfs, of course
>>> still refer to the now-freed ibm,platform-facilities parent node, which
>>> makes use-after-free possible:
>>
>> It is actually more subtle then the drivers themselves being ignorant. They
>> could register node update notifiers, but the real problem here is that the vio
>> bus device itself takes a reference to each child node registered to the bus.
>> I'm not sure we really want to unbind/rebind drivers as a result of LPM, but it
>> would be generic to the vio bus instead of updating each driver to ensure its
>> handling it device node references properly.
> 
> You're right. I will modify the commit message.
> 
>>>   refcount_t: addition on 0; use-after-free.
>>>   WARNING: CPU: 3 PID: 1706 at lib/refcount.c:25 refcount_warn_saturate+0x164/0x1f0
>>>   refcount_warn_saturate+0x160/0x1f0 (unreliable)
>>>   kobject_get+0xf0/0x100
>>>   of_node_get+0x30/0x50
>>>   of_get_parent+0x50/0xb0
>>>   of_fwnode_get_parent+0x54/0x90
>>>   fwnode_count_parents+0x50/0x150
>>>   fwnode_full_name_string+0x30/0x110
>>>   device_node_string+0x49c/0x790
>>>   vsnprintf+0x1c0/0x4c0
>>>   sprintf+0x44/0x60
>>>   devspec_show+0x34/0x50
>>>   dev_attr_show+0x40/0xa0
>>>   sysfs_kf_seq_show+0xbc/0x200
>>>   kernfs_seq_show+0x44/0x60
>>>   seq_read_iter+0x2a4/0x740
>>>   kernfs_fop_read_iter+0x254/0x2e0
>>>   new_sync_read+0x120/0x190
>>>   vfs_read+0x1d0/0x240
>>>
>>> Moreover, the "new" replacement subtree is not correctly added to the
>>> device tree, resulting in ibm,platform-facilities parent node without the
>>> appropriate leaf nodes, and broken symlinks in the sysfs device hierarchy:
>>>
>>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>
>>>   0 directories
>>>
>>>   $ cd /sys/devices/vio ; find . -xtype l -exec file {} +
>>>   ./ibm,sym-encryption-v1/of_node: broken symbolic link to
>>>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,sym-encryption-v1
>>>   ./ibm,random-v1/of_node:         broken symbolic link to
>>>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,random-v1
>>>   ./ibm,compression-v1/of_node:    broken symbolic link to
>>>     ../../../firmware/devicetree/base/ibm,platform-facilities/ibm,compression-v1
>>>
>>> This is because add_dt_node() -> dlpar_attach_node() attaches only the
>>> parent node returned from configure-connector, ignoring any children. This
>>> should be corrected for the general case, but fixing that won't help with
>>> the stale OF node references, which is the more urgent problem.
>>
>> I don't follow. If the code path you mention is truly broken in the way you say
>> then DLPAR operations involving nodes with child nodes should also be
>> broken.
> 
> Hmm I don't know of any kernel-based DLPAR workflow that attaches
> sub-trees i.e. parent + children. Processor addition attaches CPU nodes
> and possibly cache nodes, but they have sibling relationships. If you're
> thinking of I/O adapters, the DT updates are (still!) driven from user
> space. As undesirable as that is, that use case actually works correctly
> AFAIK.
> 
> What happens for the platfac LPM scenario is that
> dlpar_configure_connector() returns the node pointer for the root
> ibm,platform-facilities node, with children attached. That node pointer
> is passed from add_dt_node() -> dlpar_attach_node() -> of_attach_node()
> -> __of_attach_node(), where its child and sibling fields are
> overwritten in the process of attaching it to the tree.

Well it worked back in 2013 when I got all the in kernel device tree update
stuff working. Looks like I missed this one which now explains one area where
platform-facilities update originally went to shit.

commit 6162dbe49a451f96431a23b4821f05e3bd925bc1
Author: Grant Likely <grant.likely@linaro.org>
Date:   Wed Jul 16 08:48:46 2014 -0600

    of: Make sure attached nodes don't carry along extra children

    The child pointer does not get cleared when attaching new nodes which
    could cause the tree to be inconsistent. Clear the child pointer in
    __of_attach_node() to be absolutely sure that the structure remains in a
    consistent layout.

    Signed-off-by: Grant Likely <grant.likely@linaro.org>

diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
index c875787fa394..b96d83100987 100644
--- a/drivers/of/dynamic.c
+++ b/drivers/of/dynamic.c
@@ -98,6 +98,7 @@ int of_property_notify(int action, struct device_node *np,

 void __of_attach_node(struct device_node *np)
 {
+       np->child = NULL;
        np->sibling = np->parent->child;
        np->allnext = np->parent->allnext;
        np->parent->allnext = np;

Not sure what the reasoning was here since this prevents attaching a node that
is a sub tree. Either need to revert that, rewrite dlpar_attach_node to iterate
over the sub-tree, or probably best rewrite dlpar_configure_connector to use a
of_changeset instead.

> 
>> Last I had seen was that sysfs adds of the new nodes got renamed because the old
>> nodes still existed as a result of there reference count not going to zero. Has
>> this behavior changed, or am I misremembering the observed behavior?
> 
> Maybe you're thinking of the CPU cache node issue recently fixed by
> 7edd5c9a8820 ("powerpc/pseries/cpuhp: cache node corrections")?
> 
>>> One way to address that would be to make the drivers respond to node
>>> removal notifications, so that node references can be dropped
>>> appropriately. But this would likely force the drivers to disrupt active
>>> clients for no useful purpose: equivalent nodes are immediately re-added.
>>> And recall that the acceleration capabilities described by the nodes remain
>>> available throughout the whole process.
>>
>> See my comments above about its the vio bus more at fault here then the drivers
>> themselves. I'm inclined to agree though that disrupting active operations with
>> a driver unbind/rebind is a little extreme.
>>
>> This also brings me back to firmware removing and re-adding the whole
>> '/ibm,platform-facilities' node instead of simply updating changed properties
>> could avoid this whole fiasco.
> 
> It's a little unfortunate for us, but it's longstanding behavior that is
> presumably tolerated fine by other OSes, and it's allowed by the spec.
> So we just need to deal with it.
> 
>>> The solution I believe to be robust for this situation is to convert
>>> remove+add of a node with an unchanged phandle to an update of the node's
>>> properties in the Linux device tree structure. That would involve changing
>>> and adding a fair amount of code, and may take several iterations to land.
>>>
>>> Until that can be realized we have a confirmed use-after-free and the
>>> possibility of memory corruption. So add a limited workaround that
>>> discriminates on the node type, ignoring adds and removes. This should be
>>> amenable to backporting in the meantime.
>>
>> The reality is that '/ibm,platform-facilities' and 'cache' nodes are the only
>> LPM scoped device tree nodes that allow node delete/add. So, as a one-off
>> workaround to deal with what I consider a bad firmware approach I think this is
>> probably the best approach barring getting firmware to move to an update
>> properties approach.
> 
> Thanks. I think there's no reason to expect firmware's behavior to
> change, and there wouldn't be much payoff for us at this point -- we
> would still have to support the current behavior.
> 

