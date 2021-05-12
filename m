Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C711337C823
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 May 2021 18:40:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FgLB45y8gz3bvR
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 May 2021 02:40:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=UVdVbSj5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UVdVbSj5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FgL906XWMz2y8P
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 May 2021 02:39:16 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14CGXvTv080047; Wed, 12 May 2021 12:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=KpwEyGoPjDUEM6nsUOz34TyLmBlksLIsyVzf/xObjiw=;
 b=UVdVbSj5UbTNgQGCrof3qtzIXovp4r0aUyvHuoNGgCSHSN80OBaL9U8tXeU44MrsgVT1
 tW8T+yPwLW1tWFdqIf4BjF24Z6VTjpCJytRpVHm/LX1UoyQUL8zMsQASPKEsehcPXPjV
 YhEj5RGDHhR5OlDgFEetk6RsMaVdoSCdYHmIWhDo28dlGG8+m07iC9ZvqXemYUbG++ih
 wn+T+u3jdMU5mfm0jLljCAglwsaDGB/3I6t2RtuWTgTMqU9r3+cTIVomrecAtjyzVnc6
 WcYljzI2jIIUNPbW1UVWyrV49BPYWtcuWwMGfd4UUY5kMpaSrimGhNEKpJz8WcrZAAi8 0A== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.71])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38ghx3hfs4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 12:38:46 -0400
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
 by ppma02fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14CGXAhg012041;
 Wed, 12 May 2021 16:38:45 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma02fra.de.ibm.com with ESMTP id 38dj9898ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 May 2021 16:38:44 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 14CGcF2f37421500
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 May 2021 16:38:15 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA56FAE0F4;
 Wed, 12 May 2021 16:38:41 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83DF0AE0EF;
 Wed, 12 May 2021 16:38:38 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.40.5])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 12 May 2021 16:38:38 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org,
 linux-nvdimm@lists.01.org, linux-kernel@vger.kernel.org
Subject: [RFC 0/4] Add perf interface to expose nvdimm performance stats
Date: Wed, 12 May 2021 22:08:20 +0530
Message-Id: <20210512163824.255370-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: tp5c3rAEQvtdJhfKf-iB3p_7q0MoJnI3
X-Proofpoint-ORIG-GUID: tp5c3rAEQvtdJhfKf-iB3p_7q0MoJnI3
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-12_09:2021-05-12,
 2021-05-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=957 lowpriorityscore=0 clxscore=1015 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105120105
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
Cc: santosh@fossix.org, maddy@linux.vnet.ibm.com, peterz@infradead.org,
 aneesh.kumar@linux.ibm.com, atrajeev@linux.vnet.ibm.com, kjain@linux.ibm.com,
 vaibhav@linux.ibm.com, dan.j.williams@intel.com, ira.weiny@intel.com,
 tglx@linutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Patchset adds performance stats reporting support for nvdimm.
Added interface includes support for a pmu register function and
callbacks to be used by arch/platform specific drivers.
User could use standard perf tool to access perf events exposed via pmu.

Patchset adds a structure called nvdimm_pmu which can
be used to add platform specific data like supported event list and
callbacks to pmu functions like event_init/add/delete/read.

Patchset includes an implements the to expose IBM pseries platform nmem*
device performance stats using this interface.

Result from power9 pseries lpar with 2 nvdimm device:
command:# perf list nmem
  nmem0/cchrhcnt/                                    [Kernel PMU event]
  nmem0/cchwhcnt/                                    [Kernel PMU event]
  nmem0/critrscu/                                    [Kernel PMU event]
  nmem0/ctlresct/                                    [Kernel PMU event]
  nmem0/ctlrestm/                                    [Kernel PMU event]
  nmem0/fastwcnt/                                    [Kernel PMU event]
  nmem0/hostlcnt/                                    [Kernel PMU event]
  nmem0/hostldur/                                    [Kernel PMU event]
  nmem0/hostscnt/                                    [Kernel PMU event]
  nmem0/hostsdur/                                    [Kernel PMU event]
  nmem0/medrcnt/                                     [Kernel PMU event]
  nmem0/medrdur/                                     [Kernel PMU event]
  nmem0/medwcnt/                                     [Kernel PMU event]
  nmem0/medwdur/                                     [Kernel PMU event]
  nmem0/memlife/                                     [Kernel PMU event]
  nmem0/noopstat/                                    [Kernel PMU event]
  nmem0/ponsecs/                                     [Kernel PMU event]
  nmem1/cchrhcnt/                                    [Kernel PMU event]
  nmem1/cchwhcnt/                                    [Kernel PMU event]
  nmem1/critrscu/                                    [Kernel PMU event]
  ...
  nmem1/noopstat/                                    [Kernel PMU event]
  nmem1/ponsecs/                                     [Kernel PMU event]

Patch1:
        Introduces the nvdimm_pmu structure, common function for pmu
        register along with callback routine check.
Pacth2
        Add code in arch/powerpc/platform/pseries/papr_scm.c to expose
        nmem* pmu. It fills in the nvdimm_pmu structure with event attrs
        and event callback functions and then registers the pmu by adding
        callback to register_nvdimm_pmu.
Patch3:
        Sysfs documentation patch
Patch4:
        Adds cpuhotplug support.

Kajol Jain (4):
  drivers/nvdimm: Add perf interface to expose nvdimm performance stats
  powerpc/papr_scm: Add perf interface support
  powerpc/papr_scm: Document papr_scm sysfs event format entries
  powerpc/papr_scm: Add cpu hotplug support for nvdimm pmu device

 Documentation/ABI/testing/sysfs-bus-papr-pmem |  31 ++
 arch/powerpc/include/asm/device.h             |   5 +
 arch/powerpc/platforms/pseries/papr_scm.c     | 346 +++++++++++++++++-
 drivers/nvdimm/Makefile                       |   1 +
 drivers/nvdimm/nd_perf.c                      | 111 ++++++
 include/linux/nd.h                            |  31 ++
 6 files changed, 524 insertions(+), 1 deletion(-)
 create mode 100644 drivers/nvdimm/nd_perf.c

-- 
2.27.0

