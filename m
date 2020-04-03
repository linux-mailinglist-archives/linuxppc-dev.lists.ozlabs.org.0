Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E06F419D971
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Apr 2020 16:48:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48v2qd1PHvzF0Bm
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Apr 2020 01:48:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=bharata@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48v2cP50nXzF09c
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Apr 2020 01:38:44 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 033EaxJl128681
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 3 Apr 2020 10:38:42 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 304g88kvyn-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 03 Apr 2020 10:38:41 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <bharata@linux.ibm.com>;
 Fri, 3 Apr 2020 15:38:22 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 3 Apr 2020 15:38:19 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 033Eca5655771264
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Apr 2020 14:38:36 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 16927A4064;
 Fri,  3 Apr 2020 14:38:36 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 08F74A405B;
 Fri,  3 Apr 2020 14:38:34 +0000 (GMT)
Received: from in.ibm.com (unknown [9.85.86.108])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri,  3 Apr 2020 14:38:33 +0000 (GMT)
Date: Fri, 3 Apr 2020 20:08:31 +0530
From: Bharata B Rao <bharata@linux.ibm.com>
To: Leonardo Bras <leonardo@linux.ibm.com>
Subject: Re: [PATCH v3 1/1] powerpc/kernel: Enables memory hot-remove after
 reboot on pseries guests
References: <20200402195156.626430-1-leonardo@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200402195156.626430-1-leonardo@linux.ibm.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-TM-AS-GCONF: 00
x-cbid: 20040314-0016-0000-0000-000002FDA61F
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20040314-0017-0000-0000-000033617529
Message-Id: <20200403143831.GA12662@in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-03_11:2020-04-03,
 2020-04-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 mlxlogscore=999 bulkscore=0 suspectscore=0 adultscore=0 mlxscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2004030125
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
Reply-To: bharata@linux.ibm.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Claudio Carvalho <cclaudio@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Paul Mackerras <paulus@samba.org>, Hari Bathini <hbathini@linux.ibm.com>,
 Nathan Fontenot <nfont@linux.vnet.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, linuxppc-dev@lists.ozlabs.org,
 Allison Randal <allison@lohutok.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Apr 02, 2020 at 04:51:57PM -0300, Leonardo Bras wrote:
> While providing guests, it's desirable to resize it's memory on demand.
> 
> By now, it's possible to do so by creating a guest with a small base
> memory, hot-plugging all the rest, and using 'movable_node' kernel
> command-line parameter, which puts all hot-plugged memory in
> ZONE_MOVABLE, allowing it to be removed whenever needed.
> 
> But there is an issue regarding guest reboot:
> If memory is hot-plugged, and then the guest is rebooted, all hot-plugged
> memory goes to ZONE_NORMAL, which offers no guaranteed hot-removal.
> It usually prevents this memory to be hot-removed from the guest.
> 
> It's possible to use device-tree information to fix that behavior, as
> it stores flags for LMB ranges on ibm,dynamic-memory-vN.
> It involves marking each memblock with the correct flags as hotpluggable
> memory, which mm/memblock.c puts in ZONE_MOVABLE during boot if
> 'movable_node' is passed.
> 
> For carrying such information, the new flag DRCONF_MEM_HOTREMOVABLE was
> proposed and accepted into Power Architecture documentation.
> This flag should be:
> - true (b=1) if the hypervisor may want to hot-remove it later, and
> - false (b=0) if it does not care.
> 
> During boot, guest kernel reads the device-tree, early_init_drmem_lmb()
> is called for every added LMBs. Here, checking for this new flag and
> marking memblocks as hotplugable memory is enough to get the desirable
> behavior.
> 
> This should cause no change if 'movable_node' parameter is not passed
> in kernel command-line.
> 
> Signed-off-by: Leonardo Bras <leonardo@linux.ibm.com>
> Reviewed-by: Bharata B Rao <bharata@linux.ibm.com>
> 
> ---
> 
> Changes since v2:
> - New flag name changed from DRCONF_MEM_HOTPLUGGED to
> 	DRCONF_MEM_HOTREMOVABLE

The patch would be more complete with the following change that ensures
that DRCONF_MEM_HOTREMOVABLE flag is set for non-boot-time hotplugged
memory too. This will ensure that ibm,dynamic-memory-vN property
reflects the right flags value for memory that gets hotplugged
post boot.

diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index a4d40a3ceea3..6d75f6e182ae 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -395,7 +395,8 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 
 	invalidate_lmb_associativity_index(lmb);
 	lmb_clear_nid(lmb);
-	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
+	lmb->flags &= ~(DRCONF_MEM_ASSIGNED |
+			DRCONF_MEM_HOTREMOVABLE);
 
 	return 0;
 }
@@ -678,7 +679,8 @@ static int dlpar_add_lmb(struct drmem_lmb *lmb)
 		invalidate_lmb_associativity_index(lmb);
 		lmb_clear_nid(lmb);
 	} else {
-		lmb->flags |= DRCONF_MEM_ASSIGNED;
+		lmb->flags |= (DRCONF_MEM_ASSIGNED |
+			       DRCONF_MEM_HOTREMOVABLE);
 	}
 
 	return rc;

Regards,
Bharata.

