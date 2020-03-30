Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F38A1981F3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Mar 2020 19:11:24 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48rfBK3gVtzDqcX
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 04:11:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48rf6F4LP4zDqgF
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 04:07:49 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UH3ZW8101440; Mon, 30 Mar 2020 13:07:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30227v7w61-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 13:07:43 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02UH3smu102387;
 Mon, 30 Mar 2020 13:07:40 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30227v7w29-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 13:07:40 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02UH0n8V005725;
 Mon, 30 Mar 2020 17:07:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 301x76xv57-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 30 Mar 2020 17:07:33 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02UH7VVb47776204
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 17:07:31 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3318A136063;
 Mon, 30 Mar 2020 17:07:31 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D7E38136066;
 Mon, 30 Mar 2020 17:07:30 +0000 (GMT)
Received: from localhost (unknown [9.85.163.33])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 17:07:30 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>
Subject: Re: [RFC PATCH v1] pseries/drmem: don't cache node id in drmem_lmb
 struct
In-Reply-To: <20200312160704.cmmo7titbh7u4jia@rascal.austin.ibm.com>
References: <20200311230815.1432367-1-cheloha@linux.ibm.com>
 <20200312050237.GP1776@kitsune.suse.cz>
 <20200312160704.cmmo7titbh7u4jia@rascal.austin.ibm.com>
Date: Mon, 30 Mar 2020 12:07:29 -0500
Message-ID: <87r1x9ixf2.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-30_07:2020-03-30,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0
 impostorscore=0 spamscore=0 suspectscore=1 mlxlogscore=999
 lowpriorityscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003300153
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
Cc: Nathan Fontenont <ndfont@gmail.com>, David Hildenbrand <david@redhat.com>,
 Aneesh Kumar <aneesh.kumar@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Michal =?utf-8?Q?Such=C3=A1nek?= <msuchanek@suse.de>,
 linuxppc-dev@lists.ozlabs.org, Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Cheloha <cheloha@linux.ibm.com> writes:
> Hi Michal,
>
> On Thu, Mar 12, 2020 at 06:02:37AM +0100, Michal Such=C3=A1nek wrote:
>>=20
>> You basically revert the below which will likely cause the very error
>> that was fixed there:
>>=20
>> commit b2d3b5ee66f2a04a918cc043cec0c9ed3de58f40
>> Author: Nathan Fontenot <nfont@linux.vnet.ibm.com>
>> Date:   Tue Oct 2 10:35:59 2018 -0500
>>=20
>>     powerpc/pseries: Track LMB nid instead of using device tree
>>=20=20=20=20=20
>>     When removing memory we need to remove the memory from the node
>>     it was added to instead of looking up the node it should be in
>>     in the device tree.
>>=20=20=20=20=20
>>     During testing we have seen scenarios where the affinity for a
>>     LMB changes due to a partition migration or PRRN event. In these
>>     cases the node the LMB exists in may not match the node the device
>>     tree indicates it belongs in. This can lead to a system crash
>>     when trying to DLPAR remove the LMB after a migration or PRRN
>>     event. The current code looks up the node in the device tree to
>>     remove the LMB from, the crash occurs when we try to offline this
>>     node and it does not have any data, i.e. node_data[nid] =3D=3D NULL.
>
> I'm aware of this patch and that this is a near-total revert.
>
> I'm not reintroducing the original behavior, though.  Instead of going
> to the device tree to recompute the expected node id I'm retrieving it
> from the LMB's corresponding memory_block.
>
> That crucial difference is this chunk:
>
> --- a/arch/powerpc/platforms/pseries/hotplug-memory.c
> +++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
> @@ -376,25 +376,29 @@ static int dlpar_add_lmb(struct drmem_lmb *);
>=20=20
>  static int dlpar_remove_lmb(struct drmem_lmb *lmb)
>  {
> +	struct memory_block *mem_block;
>  	unsigned long block_sz;
>  	int rc;
>=20=20
>  	if (!lmb_is_removable(lmb))
>  		return -EINVAL;
>=20=20
> +	mem_block =3D lmb_to_memblock(lmb);
> +	if (mem_block =3D=3D NULL)
> +		return -EINVAL;
> +

Assuming lmb_to_memblock() -> find_memory_block() isn't engaging in O(n)
behavior or worse (which is the case in linux-next), then I think
Scott's change makes sense and is a net win.
