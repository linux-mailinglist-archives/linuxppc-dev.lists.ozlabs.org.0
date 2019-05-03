Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA621255E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 02:12:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44wCHd5Yc6zDqVl
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 May 2019 10:12:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=stewart@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44wCGM5fwyzDqLR
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 May 2019 10:11:07 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4306vOC023521
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 2 May 2019 20:11:03 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2s88sukm20-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 02 May 2019 20:11:03 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <stewart@linux.ibm.com>;
 Fri, 3 May 2019 01:11:02 +0100
Received: from b03cxnp07028.gho.boulder.ibm.com (9.17.130.15)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 May 2019 01:11:01 +0100
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x430B0R510223900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 May 2019 00:11:00 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 755B1BE056;
 Fri,  3 May 2019 00:11:00 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73811BE04F;
 Fri,  3 May 2019 00:10:59 +0000 (GMT)
Received: from birb.localdomain (unknown [9.102.33.187])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with SMTP;
 Fri,  3 May 2019 00:10:59 +0000 (GMT)
Received: by birb.localdomain (Postfix, from userid 1000)
 id DB6834EC63D; Fri,  3 May 2019 10:10:57 +1000 (AEST)
From: Stewart Smith <stewart@linux.ibm.com>
To: David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH kernel] prom_init: Fetch flatten device tree from the
 system firmware
In-Reply-To: <20190502042702.GH13618@umbus.fritz.box>
References: <20190501034221.18437-1-aik@ozlabs.ru>
 <20190502042702.GH13618@umbus.fritz.box>
Date: Fri, 03 May 2019 10:10:57 +1000
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19050300-0004-0000-0000-000015069826
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011037; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01197727; UDB=6.00628224; IPR=6.00978583; 
 MB=3.00026706; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-03 00:11:02
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050300-0005-0000-0000-00008B7D2440
Message-Id: <87bm0ktn1q.fsf@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-02_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=4 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905030000
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Suraj Jitindar Singh <sjitindarsingh@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

David Gibson <david@gibson.dropbear.id.au> writes:
> On Wed, May 01, 2019 at 01:42:21PM +1000, Alexey Kardashevskiy wrote:
>> At the moment, on 256CPU + 256 PCI devices guest, it takes the guest
>> about 8.5sec to fetch the entire device tree via the client interface
>> as the DT is traversed twice - for strings blob and for struct blob.
>> Also, "getprop" is quite slow too as SLOF stores properties in a linked
>> list.
>> 
>> However, since [1] SLOF builds flattened device tree (FDT) for another
>> purpose. [2] adds a new "fdt-fetch" client interface for the OS to fetch
>> the FDT.
>> 
>> This tries the new method; if not supported, this falls back to
>> the old method.
>> 
>> There is a change in the FDT layout - the old method produced
>> (reserved map, strings, structs), the new one receives only strings and
>> structs from the firmware and adds the final reserved map to the end,
>> so it is (fw reserved map, strings, structs, reserved map).
>> This still produces the same unflattened device tree.
>> 
>> This merges the reserved map from the firmware into the kernel's reserved
>> map. At the moment SLOF generates an empty reserved map so this does not
>> change the existing behaviour in regard of reservations.
>> 
>> This supports only v17 onward as only that version provides dt_struct_size
>> which works as "fdt-fetch" only produces v17 blobs.
>> 
>> If "fdt-fetch" is not available, the old method of fetching the DT is used.
>> 
>> [1] https://git.qemu.org/?p=SLOF.git;a=commitdiff;h=e6fc84652c9c00
>> [2] https://git.qemu.org/?p=SLOF.git;a=commit;h=ecda95906930b80
>> 
>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>
> Hrm.  I've gotta say I'm not terribly convinced that it's worth adding
> a new interface we'll need to maintain to save 8s on a somewhat
> contrived testcase.

256CPUs aren't that many anymore though. Although I guess that many PCI
devices is still a little uncommon.

A 4 socket POWER8 or POWER9 can easily be that large, and a small test
kernel/userspace will boot in ~2.5-4 seconds. So it's possible that
the device tree fetch could be surprisingly non-trivial percentage of boot
time at least on some machines.


-- 
Stewart Smith
OPAL Architect, IBM.

