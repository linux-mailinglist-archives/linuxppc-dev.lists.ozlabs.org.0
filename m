Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2352C16C90
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 22:48:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44zBXX56dCzDqKl
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2019 06:48:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=julietk@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44zBVr6R7nzDqNS
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2019 06:47:16 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x47KcB3U121512
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 7 May 2019 16:47:14 -0400
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2sbe5v03aj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 May 2019 16:47:13 -0400
Received: from localhost
 by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <julietk@linux.vnet.ibm.com>;
 Tue, 7 May 2019 21:47:13 +0100
Received: from b03cxnp08027.gho.boulder.ibm.com (9.17.130.19)
 by e36.co.us.ibm.com (192.168.1.136) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 May 2019 21:47:11 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x47KlA8D5243206
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 May 2019 20:47:10 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4BBDDC605B;
 Tue,  7 May 2019 20:47:10 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9FE1C6055;
 Tue,  7 May 2019 20:47:09 +0000 (GMT)
Received: from juliets-mbp.austin.ibm.com (unknown [9.41.174.95])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Tue,  7 May 2019 20:47:09 +0000 (GMT)
Subject: Re: [PATCH]powerpc/mobility: Serialize PRRN and LPM in device tree
 update
To: Nathan Lynch <nathanl@linux.ibm.com>, Juliet Kim <julietk@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org
References: <5cc359e9.h9YV36UYX//U5tLh%julietk@linux.vnet.ibm.com>
 <87sgtrqzcz.fsf@linux.ibm.com>
From: Juliet Kim <julietk@linux.vnet.ibm.com>
Date: Tue, 7 May 2019 15:47:09 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <87sgtrqzcz.fsf@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19050720-0020-0000-0000-00000EE4F517
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011067; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01200033; UDB=6.00629619; IPR=6.00980916; 
 MB=3.00026775; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-07 20:47:12
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050720-0021-0000-0000-000065BBED8D
Message-Id: <70452ec4-eb90-a2b0-5479-fbfd2ac7cf97@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-07_12:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905070130
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
Cc: mmc@linux.ibm.com, mwb@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nathan,

On 5/6/19 12:14 PM, Nathan Lynch wrote:
> Hi Juliet,
>
> Juliet Kim<julietk@linux.vnet.ibm.com> writes:
>> Fix extending start/stop topology update scope during LPM
>> Commit 65b9fdadfc4d ("powerpc/pseries/mobility: Extend start/stop
>> topology update scope") made the change to the duration that
>> topology updates are suppressed during LPM to allow the complete
>> device tree update which leaves the property update notifier
>> unregistered until device tree update completes. This prevents
>> topology update during LPM.
>>
>> Instead, use mutex_lock, which serializes LPM and PRRN operation
>> in pseries_devicetree_update.
> I think this is conflating two issues:
>
> 1. Insufficient serialization/ordering of handling PRRNs and
>     LPM. E.g. we could migrate while processing a PRRN from the source
>     system and end up with incorrect contents in the device tree on the
>     destination if the LPM changes the same nodes. The OS is supposed to
>     drain any outstanding PRRNs before proceeding with migration, which
>     is a stronger requirement than simple serialization of device tree
>     updates. If we don't impose this ordering already we should fix that.

PRRN request can be received at any time including before/after LPM and
during LPM.  Currently, we do not have a protocol with hypervisor 
prohibiting
PRRN after LPM begins. This patch is to fix the regression(inconsistent 
state
of device tree and skipping CPU affinity update) injected by a patch
Commit 65b9fdadfc4d (Extending start/stop topology update scope during
LPM ).

This patch uses mutex_lock to update device tree allowing device tree to be
consistent state in both cases : LPM begins while PRRN event is running and
vice versa. If we migrate while PRRN is running at source, PRRN holding 
the lock
completes at target. Once PRRN release the lock, LPM take the lock and 
update
device tree. PRRN completes device tree update before LPM begins.
To avoid PRRN and LPM from running at the same time, it needs serialization
at the higher layer which requires design change and may be future work.

>
> 2. The NUMA topology update processing. Generally speaking,
>     start/stop_topology_update() enable/disable dt_update_callback(),
>     which we use to update CPU-node assignments. Since we now know that
>     doing that is Bad, it's sort of a happy accident that
>     migration_store() was changed to re-register the notifier after
>     updating the device tree, which is too late. So I don't think we
>     should try to "fix" this. Instead we should remove the broken code
>     (dt_update_callback -> dlpar_cpu_readdd and so on).
When the regression (CPU affinity update has been accidentally disabled 
at LPM)
and CPU readd causes some issues, I suggested that we revert the CPU 
readd patch
already upstream and leave the regression without fixing. But then, we 
decided to
disable CPU affinity update globally for LPM, PRRN, VPHN and fix the 
regression
once the disablement CPU affinity update patch is accepted upstream as the
regression needs to be corrected in case of enabling CPU affinity update 
and we
would learn up codes once the disablement is stabilized.
> Do you agree?
>
> Thanks,
> Nathan

