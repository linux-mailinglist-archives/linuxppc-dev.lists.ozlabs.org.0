Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D880D399C3
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 01:41:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45LJvr4Q8FzDqpC
	for <lists+linuxppc-dev@lfdr.de>; Sat,  8 Jun 2019 09:41:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45LJsp11V6zDqLr
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  8 Jun 2019 09:39:56 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x57NXfwB165312
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 7 Jun 2019 19:39:52 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2syy31dgrc-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 07 Jun 2019 19:39:52 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Sat, 8 Jun 2019 00:39:51 +0100
Received: from b01cxnp22034.gho.pok.ibm.com (9.57.198.24)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 8 Jun 2019 00:39:49 +0100
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x57NdmKR35127586
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jun 2019 23:39:48 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A6D528059;
 Fri,  7 Jun 2019 23:39:48 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E09D28058;
 Fri,  7 Jun 2019 23:39:48 +0000 (GMT)
Received: from localhost (unknown [9.41.179.236])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jun 2019 23:39:48 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Tyrel Datwyler <tyreld@linux.vnet.ibm.com>
Subject: Re: [PATCH] powerpc/pseries: fix oops in hotplug memory notifier
In-Reply-To: <629a9449-51c3-4c62-0b8c-9008061ee9ee@linux.vnet.ibm.com>
References: <20190607050407.25444-1-nathanl@linux.ibm.com>
 <629a9449-51c3-4c62-0b8c-9008061ee9ee@linux.vnet.ibm.com>
Date: Fri, 07 Jun 2019 18:39:47 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19060723-0072-0000-0000-000004391F64
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011230; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01214745; UDB=6.00638565; IPR=6.00995830; 
 MB=3.00027228; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-07 23:39:50
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19060723-0073-0000-0000-00004C8C10C5
Message-Id: <8736klm0cc.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906070156
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tyrel Datwyler <tyreld@linux.vnet.ibm.com> writes:

> On 06/06/2019 10:04 PM, Nathan Lynch wrote:
>> During post-migration device tree updates, we can oops in
>> pseries_update_drconf_memory if the source device tree has an
>> ibm,dynamic-memory-v2 property and the destination has a
>> ibm,dynamic_memory (v1) property. The notifier processes an "update"
>> for the ibm,dynamic-memory property but it's really an add in this
>> scenario. So make sure the old property object is there before
>> dereferencing it.
>> 
>> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
>> ---
>
> Yes, this patch solves the oops, but I worry it just papers over some short
> comings in our code.
>
> After some poking around unless I'm mistaken our memory notifier only handles v1
> versions of the ibm,dynamic-memory property. So, on newer firmware we aren't
> doing any memory fixups if v2 (ibm,dynamic-memory-v2) of the property
> is updated.

It's not clear to me what the notifier is meant to accomplish:

	for (i = 0; i < entries; i++) {
		if ((be32_to_cpu(old_drmem[i].flags) & DRCONF_MEM_ASSIGNED) &&
		    (!(be32_to_cpu(new_drmem[i].flags) & DRCONF_MEM_ASSIGNED))) {
			rc = pseries_remove_memblock(
				be64_to_cpu(old_drmem[i].base_addr),
						     memblock_size);
			break;
		} else if ((!(be32_to_cpu(old_drmem[i].flags) &
			    DRCONF_MEM_ASSIGNED)) &&
			    (be32_to_cpu(new_drmem[i].flags) &
			    DRCONF_MEM_ASSIGNED)) {
			rc = memblock_add(be64_to_cpu(old_drmem[i].base_addr),
					  memblock_size);
			rc = (rc < 0) ? -EINVAL : 0;
			break;
		}
	}

This compares the 'assigned' flag for each LMB in the old vs new
properties and adds or removes the block accordingly. However:

- Migration and PRRNs are specified only to change LMBs' NUMA affinity
  information. This notifier should be a no-op for those scenarios since
  the assigned flags should not change.
- The memory hotplug/DLPAR path has a hack which inhibits the execution
  of the notifier:
     dlpar_memory()
        ...
        rtas_hp_event = true;
        drmem_update_dt()
           of_update_property()
              pseries_memory_notifier()
                 pseries_update_drconf_memory()
                    if (rtas_hp_event) return;

So what's it for? My best guess is that it's a holdover from when more
of the DLPAR work was done in user space. I don't see a purpose for it
now.


> For older PFW if we have source and target that only support v1 we will update
> the memory in response to any update to ibm,dynamic-memory. It also appears to
> be the case if we start with v1 and migrate to a target with newer PFW that
> supports both v1 and v2 that the PFW will continue with v1 on the target and as
> a result we update memory in accordance to a property update to ibm,dynamic-memory.
>
> Now, if we have source and targets that both support v2 after a migration we
> will do no update in response to ibm,dynamic-memory-v2 changes. And then there
> is the case of a source with v2 support migrating to a target with only v1
> support where we observe this oops. The oops is a result of ibm,dynamic-memory
> being a new property that is added and there for no old property date exists.
> However, simply returning in response also has the side effect that we do not
> update memory in response to a device tree update of dynamic memory.
>
> Maybe we are ok with this behavior as I haven't dug deep enough into the memory
> subsystem here to really understand what the memory code is updating, but it is
> concerning that we are doing it in some cases, but not all.

I hope I've made a good case above that the notifier does not do any
useful work, and a counterpart for the v2 format isn't needed.  Do you
agree?

If so, I'll send a patch later to remove the notifier altogether. In the
near term I would still like this minimal fix to go in.

