Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 011C0434F66
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Oct 2021 17:55:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HZFZV2mDzz2yp1
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 Oct 2021 02:55:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Pv9M4n9W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Pv9M4n9W; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HZFYj2Mn4z2xvL
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 Oct 2021 02:55:04 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19KFCnqE012234; 
 Wed, 20 Oct 2021 11:54:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=oOEaGT91HYpHoE1GqAEFcQiViXlBx/8XARLdVBj8sws=;
 b=Pv9M4n9WUL4kKgX2tFdiOH5pQrZK49+YN6vZ0GrL54P6yo4VfCaH0ZA1OCsd/hUAcoMp
 VEYSsa7IpprpcZLAr9Ap/c3Aj/BQ5JQSdWD/hO5KrRLx961iiXO8w065wloPK7+ePMJl
 uNT3ZRQdaSu1s9298wZW/nMVip4+QvGiUSBPzKH/k7U8CDZvsR6W6oph9gN3mwedfAUv
 wC2yuyFdjBYnBst6r4aUOX//i22HIV1ueJvwVpxC7HJUO3SIK/vyLS88baTJhpmRXptz
 j/E/ztmJwF/IXoJ/Qx+QuJvVyjbmvl9GxgTrSHM+4ChfJ4vd4kC2OvzvVwN+mWpXnLvy lA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3btjj8e364-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 11:54:57 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 19KFlVTK009486;
 Wed, 20 Oct 2021 15:54:57 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 3bqpcc3q6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 20 Oct 2021 15:54:57 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 19KFstRJ35717492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 20 Oct 2021 15:54:56 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D046E11206F;
 Wed, 20 Oct 2021 15:54:55 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96A0A112065;
 Wed, 20 Oct 2021 15:54:55 +0000 (GMT)
Received: from localhost (unknown [9.211.47.38])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 20 Oct 2021 15:54:55 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/mobility: ignore
 ibm,platform-facilities updates
In-Reply-To: <669cb321-7e7f-e45b-a7a1-7002d8371080@linux.ibm.com>
References: <20211018163424.2491472-1-nathanl@linux.ibm.com>
 <6de8b295-112f-651e-a18e-3ab3e499ad69@linux.ibm.com>
 <87zgr4y9x4.fsf@linux.ibm.com>
 <669cb321-7e7f-e45b-a7a1-7002d8371080@linux.ibm.com>
Date: Wed, 20 Oct 2021 10:54:55 -0500
Message-ID: <87r1cfy9m8.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 4lQjWPAaOejLPPZnZJh004PRTWX34bbz
X-Proofpoint-GUID: 4lQjWPAaOejLPPZnZJh004PRTWX34bbz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-20_05,2021-10-20_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0
 mlxlogscore=999 priorityscore=1501 mlxscore=0 suspectscore=0 spamscore=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110200089
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

Tyrel Datwyler <tyreld@linux.ibm.com> writes:
> On 10/19/21 2:36 PM, Nathan Lynch wrote:
>> Tyrel Datwyler <tyreld@linux.ibm.com> writes:
>>> On 10/18/21 9:34 AM, Nathan Lynch wrote:
>>>> On VMs with NX encryption, compression, and/or RNG offload, these
>>>> capabilities are described by nodes in the ibm,platform-facilities dev=
ice
>>>> tree hierarchy:
>>>>
>>>>   $ tree -d /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>>   /sys/firmware/devicetree/base/ibm,platform-facilities/
>>>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,compression-v1
>>>>   =E2=94=9C=E2=94=80=E2=94=80 ibm,random-v1
>>>>   =E2=94=94=E2=94=80=E2=94=80 ibm,sym-encryption-v1
>>>>
>>>>   3 directories
>>>>
>>>> The acceleration functions that these nodes describe are not disrupted=
 by
>>>> live migration, not even temporarily.
>>>>
>>>> But the post-migration ibm,update-nodes sequence firmware always sends
>>>> "delete" messages for this hierarchy, followed by an "add" directive to
>>>> reconstruct it via ibm,configure-connector (log with debugging stateme=
nts
>>>> enabled in mobility.c):
>>>>
>>>>   mobility: removing node /ibm,platform-facilities/ibm,random-v1:42949=
67285
>>>>   mobility: removing node /ibm,platform-facilities/ibm,compression-v1:=
4294967284
>>>>   mobility: removing node /ibm,platform-facilities/ibm,sym-encryption-=
v1:4294967283
>>>>   mobility: removing node /ibm,platform-facilities:4294967286
>>>>   ...
>>>>   mobility: added node /ibm,platform-facilities:4294967286
>>>
>>> It always bothered me that the update from firmware here was an delete/=
add at
>>> the entire '/ibm,platform-facilities' node level instead of update prop=
erties
>>> calls. When I asked about it years ago the claim was it was just easier=
 to pass
>>> an entire sub-tree as a single node add.
>>=20
>> Yes, I believe this is for ease of implementation on their part.
>
> I'd still argue that a full node removal or addition is a platform
> reconfiguration on par with a hotplug operation.

Well... I think we might be better served by a slightly more flexible
view of things :-) These are just a series of messages from firmware
that should be considered as a whole, and they don't dictate exactly
what the OS must do to its own data structures. Nothing mandates that
the OS immediately and literally apply the changes as they are
individually reported by the update-nodes sequence.

Anyway, whether the firmware behavior is reasonable is sort of beside
the point since we're stuck with it.


>>>> This is because add_dt_node() -> dlpar_attach_node() attaches only the
>>>> parent node returned from configure-connector, ignoring any children. =
This
>>>> should be corrected for the general case, but fixing that won't help w=
ith
>>>> the stale OF node references, which is the more urgent problem.
>>>
>>> I don't follow. If the code path you mention is truly broken in the way=
 you say
>>> then DLPAR operations involving nodes with child nodes should also be
>>> broken.
>>=20
>> Hmm I don't know of any kernel-based DLPAR workflow that attaches
>> sub-trees i.e. parent + children. Processor addition attaches CPU nodes
>> and possibly cache nodes, but they have sibling relationships. If you're
>> thinking of I/O adapters, the DT updates are (still!) driven from user
>> space. As undesirable as that is, that use case actually works correctly
>> AFAIK.
>>=20
>> What happens for the platfac LPM scenario is that
>> dlpar_configure_connector() returns the node pointer for the root
>> ibm,platform-facilities node, with children attached. That node pointer
>> is passed from add_dt_node() -> dlpar_attach_node() -> of_attach_node()
>> -> __of_attach_node(), where its child and sibling fields are
>> overwritten in the process of attaching it to the tree.
>
> Well it worked back in 2013 when I got all the in kernel device tree upda=
te
> stuff working. Looks like I missed this one which now explains one area w=
here
> platform-facilities update originally went to shit.
>
> commit 6162dbe49a451f96431a23b4821f05e3bd925bc1
> Author: Grant Likely <grant.likely@linaro.org>
> Date:   Wed Jul 16 08:48:46 2014 -0600
>
>     of: Make sure attached nodes don't carry along extra children
>
>     The child pointer does not get cleared when attaching new nodes which
>     could cause the tree to be inconsistent. Clear the child pointer in
>     __of_attach_node() to be absolutely sure that the structure remains i=
n a
>     consistent layout.
>
>     Signed-off-by: Grant Likely <grant.likely@linaro.org>
>
> diff --git a/drivers/of/dynamic.c b/drivers/of/dynamic.c
> index c875787fa394..b96d83100987 100644
> --- a/drivers/of/dynamic.c
> +++ b/drivers/of/dynamic.c
> @@ -98,6 +98,7 @@ int of_property_notify(int action, struct device_node *=
np,
>
>  void __of_attach_node(struct device_node *np)
>  {
> +       np->child =3D NULL;
>         np->sibling =3D np->parent->child;
>         np->allnext =3D np->parent->allnext;
>         np->parent->allnext =3D np;
>
> Not sure what the reasoning was here since this prevents attaching a node=
 that
> is a sub tree. Either need to revert that, rewrite dlpar_attach_node to i=
terate
> over the sub-tree, or probably best rewrite dlpar_configure_connector to =
use a
> of_changeset instead.

Good find. I'd guess that adding a subtree used to sort of work, except
that children of np were not added to the allnext list, which would
effectively hide them from some lookups.

Regardless, yes, the pseries code needs to change to attach and detach
nodes individually. I don't think the OF core supports more complex
changes.
