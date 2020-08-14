Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 253E3244DFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 19:31:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSr8S1JMmzDqhm
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 03:31:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSr4W64knzDqg4
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 03:28:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KNkjPSmU; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BSr4R72bRz8tTY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 03:28:07 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BSr4R3Dv0z9sTh; Sat, 15 Aug 2020 03:28:07 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=KNkjPSmU; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BSr4Q0zvNz9sTQ;
 Sat, 15 Aug 2020 03:28:05 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07EH3Gwt052070; Fri, 14 Aug 2020 13:28:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=A6BABUd9qF3TdrBGd6/3uLvjivNGV1On23kL5u1IW3w=;
 b=KNkjPSmUTGgvh8hox9IJ8OILK/7rN7VgRVimo8JErbq0PGusqAWbQewifxamNw3kWrbh
 zWekzVcYm66jvL1B2kkDavBwy8/59XqTK6z0kmP8tT/laRsH/kYRxff8B0kvmBGq1CNR
 9xwput5sanZMz82uWPb6BSEBl0Z47tDyYshLEgQwhh9/c9SQc/5rv0Y/8vmUEYw4i/Je
 azBa/lxqqpAg25QKWcLv+XJq/w8WG/rWCE5xxL67QvPE4ITR1jXMsWJNuyFyqw+6cEG9
 yXrWlBQ5PM1M6HSI60Z0+F6IUkPwv4LieERa7i4YJj1fhj/EvyRu1qZOa/ktjTyqCaO1 6A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32wwq5jhyd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 13:28:02 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07EH3QN9057219;
 Fri, 14 Aug 2020 13:28:02 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32wwq5jhxu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 13:28:02 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07EHORIw025476;
 Fri, 14 Aug 2020 17:28:01 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04wdc.us.ibm.com with ESMTP id 32skp9ur5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 17:28:01 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07EHRu9T59638246
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 17:27:56 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D728C6E053;
 Fri, 14 Aug 2020 17:28:00 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 989196E04E;
 Fri, 14 Aug 2020 17:28:00 +0000 (GMT)
Received: from localhost (unknown [9.65.223.18])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 14 Aug 2020 17:28:00 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v3] pseries/drmem: don't cache node id in drmem_lmb struct
In-Reply-To: <20200811015115.63677-1-cheloha@linux.ibm.com>
References: <20200811015115.63677-1-cheloha@linux.ibm.com>
Date: Fri, 14 Aug 2020 12:27:59 -0500
Message-ID: <87y2mhxhls.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_10:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=1 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 clxscore=1015 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008140124
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
Cc: Laurent Dufour <ldufour@linux.vnet.ibm.com>,
 Michal Suchanek <msuchanek@suse.de>, David Hildenbrand <david@redhat.com>,
 Rick Lindsley <ricklind@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Cheloha <cheloha@linux.ibm.com> writes:
> At memory hot-remove time we can retrieve an LMB's nid from its
> corresponding memory_block.  There is no need to store the nid
> in multiple locations.
>
> Note that lmb_to_memblock() uses find_memory_block() to get the
> corresponding memory_block.  As find_memory_block() runs in sub-linear
> time this approach is negligibly slower than what we do at present.
>
> In exchange for this lookup at hot-remove time we no longer need to
> call memory_add_physaddr_to_nid() during drmem_init() for each LMB.
> On powerpc, memory_add_physaddr_to_nid() is a linear search, so this
> spares us an O(n^2) initialization during boot.
>
> On systems with many LMBs that initialization overhead is palpable and
> disruptive.  For example, on a box with 249854 LMBs we're seeing
> drmem_init() take upwards of 30 seconds to complete:
>
> [   53.721639] drmem: initializing drmem v2
> [   80.604346] watchdog: BUG: soft lockup - CPU#65 stuck for 23s! [swapper/0:1]
> [   80.604377] Modules linked in:
> [   80.604389] CPU: 65 PID: 1 Comm: swapper/0 Not tainted 5.6.0-rc2+ #4
> [   80.604397] NIP:  c0000000000a4980 LR: c0000000000a4940 CTR: 0000000000000000
> [   80.604407] REGS: c0002dbff8493830 TRAP: 0901   Not tainted  (5.6.0-rc2+)
> [   80.604412] MSR:  8000000002009033 <SF,VEC,EE,ME,IR,DR,RI,LE>  CR: 44000248  XER: 0000000d
> [   80.604431] CFAR: c0000000000a4a38 IRQMASK: 0
> [   80.604431] GPR00: c0000000000a4940 c0002dbff8493ac0 c000000001904400 c0003cfffffede30
> [   80.604431] GPR04: 0000000000000000 c000000000f4095a 000000000000002f 0000000010000000
> [   80.604431] GPR08: c0000bf7ecdb7fb8 c0000bf7ecc2d3c8 0000000000000008 c00c0002fdfb2001
> [   80.604431] GPR12: 0000000000000000 c00000001e8ec200
> [   80.604477] NIP [c0000000000a4980] hot_add_scn_to_nid+0xa0/0x3e0
> [   80.604486] LR [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0
> [   80.604492] Call Trace:
> [   80.604498] [c0002dbff8493ac0] [c0000000000a4940] hot_add_scn_to_nid+0x60/0x3e0 (unreliable)
> [   80.604509] [c0002dbff8493b20] [c000000000087c10] memory_add_physaddr_to_nid+0x20/0x60
> [   80.604521] [c0002dbff8493b40] [c0000000010d4880] drmem_init+0x25c/0x2f0
> [   80.604530] [c0002dbff8493c10] [c000000000010154] do_one_initcall+0x64/0x2c0
> [   80.604540] [c0002dbff8493ce0] [c0000000010c4aa0] kernel_init_freeable+0x2d8/0x3a0
> [   80.604550] [c0002dbff8493db0] [c000000000010824] kernel_init+0x2c/0x148
> [   80.604560] [c0002dbff8493e20] [c00000000000b648] ret_from_kernel_thread+0x5c/0x74
> [   80.604567] Instruction dump:
> [   80.604574] 392918e8 e9490000 e90a000a e92a0000 80ea000c 1d080018 3908ffe8 7d094214
> [   80.604586] 7fa94040 419d00dc e9490010 714a0088 <2faa0008> 409e00ac e9490000 7fbe5040
> [   89.047390] drmem: 249854 LMB(s)
>
> With a patched kernel on the same machine we're no longer seeing the
> soft lockup.  drmem_init() now completes in negligible time, even when
> the LMB count is large.

This has been a real annoyance, and it's great to see it fixed in a way
that both simplifies the code and reduces data structure size.

>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>

I think this also should have:

Fixes: b2d3b5ee66f2 ("powerpc/pseries: Track LMB nid instead of using device tree")

since you're essentially reverting it.

The problem that commit was trying to address arose from the fact that
the removal path was determining the Linux node for a block from the
firmware description of the block:

memory_add_physaddr_to_nid
  hot_add_scn_to_nid
    hot_add_drconf_scn_to_nid
      of_drconf_to_nid_single
        [parses the DT for the nid]

However, this can become out of sync with Linux's NUMA assignment for
the memory due to VM migration or other events.

I'm satisfied that this change does not reintroduce that problem. The
removal path still derives the node without going to the device tree,
but now performs a more efficient lookup.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
