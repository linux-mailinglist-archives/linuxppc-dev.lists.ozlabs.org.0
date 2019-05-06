Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8FD15287
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 May 2019 19:16:06 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yTsc1gnJzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 03:16:04 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yTr84z6VzDq9k
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 03:14:46 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x46HCsJn044676
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 6 May 2019 13:14:42 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2saqrh3tmp-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 06 May 2019 13:14:42 -0400
Received: from localhost
 by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Mon, 6 May 2019 18:14:41 +0100
Received: from b03cxnp08028.gho.boulder.ibm.com (9.17.130.20)
 by e35.co.us.ibm.com (192.168.1.135) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 6 May 2019 18:14:39 +0100
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x46HEbGs6947260
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 May 2019 17:14:37 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9322D7805F;
 Mon,  6 May 2019 17:14:37 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 54ED97805C;
 Mon,  6 May 2019 17:14:37 +0000 (GMT)
Received: from localhost (unknown [9.85.218.175])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  6 May 2019 17:14:37 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Juliet Kim <julietk@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH]powerpc/mobility: Serialize PRRN and LPM in device tree
 update
In-Reply-To: <5cc359e9.h9YV36UYX//U5tLh%julietk@linux.vnet.ibm.com>
References: <5cc359e9.h9YV36UYX//U5tLh%julietk@linux.vnet.ibm.com>
Date: Mon, 06 May 2019 12:14:36 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19050617-0012-0000-0000-00001732BBAF
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011061; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000285; SDB=6.01199488; UDB=6.00629289; IPR=6.00980365; 
 MB=3.00026759; MTD=3.00000008; XFM=3.00000015; UTC=2019-05-06 17:14:40
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050617-0013-0000-0000-0000572866FD
Message-Id: <87sgtrqzcz.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-06_10:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905060146
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

Hi Juliet,

Juliet Kim<julietk@linux.vnet.ibm.com> writes:
> Fix extending start/stop topology update scope during LPM
> Commit 65b9fdadfc4d ("powerpc/pseries/mobility: Extend start/stop
> topology update scope") made the change to the duration that 
> topology updates are suppressed during LPM to allow the complete 
> device tree update which leaves the property update notifier
> unregistered until device tree update completes. This prevents
> topology update during LPM.  
>
> Instead, use mutex_lock, which serializes LPM and PRRN operation 
> in pseries_devicetree_update.

I think this is conflating two issues:

1. Insufficient serialization/ordering of handling PRRNs and
   LPM. E.g. we could migrate while processing a PRRN from the source
   system and end up with incorrect contents in the device tree on the
   destination if the LPM changes the same nodes. The OS is supposed to
   drain any outstanding PRRNs before proceeding with migration, which
   is a stronger requirement than simple serialization of device tree
   updates. If we don't impose this ordering already we should fix that.

2. The NUMA topology update processing. Generally speaking,
   start/stop_topology_update() enable/disable dt_update_callback(),
   which we use to update CPU-node assignments. Since we now know that
   doing that is Bad, it's sort of a happy accident that
   migration_store() was changed to re-register the notifier after
   updating the device tree, which is too late. So I don't think we
   should try to "fix" this. Instead we should remove the broken code
   (dt_update_callback -> dlpar_cpu_readdd and so on).

Do you agree?


Thanks,
Nathan

