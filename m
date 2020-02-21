Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F96C166E45
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 05:13:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nyjy57dvzDqvZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 15:13:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=au1.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=alastair@au1.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=au1.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nxlk5GF4zDqZN
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 14:29:38 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01L3T8QN111226
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:29:36 -0500
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubvvwk7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Feb 2020 22:29:35 -0500
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <alastair@au1.ibm.com>;
 Fri, 21 Feb 2020 03:29:32 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 21 Feb 2020 03:29:26 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01L3SAFD49086646
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 03:28:11 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D8936AE04D;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32941AE045;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 03:28:10 +0000 (GMT)
Received: from adsilva.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
 (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id CA2C4A03E2;
 Fri, 21 Feb 2020 14:28:03 +1100 (AEDT)
From: "Alastair D'Silva" <alastair@au1.ibm.com>
To: alastair@d-silva.org
Subject: [PATCH v3 21/27] powerpc/powernv/pmem: Add an IOCTL to request
 controller health & perf data
Date: Fri, 21 Feb 2020 14:27:14 +1100
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200221032720.33893-1-alastair@au1.ibm.com>
References: <20200221032720.33893-1-alastair@au1.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022103-0020-0000-0000-000003AC221B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022103-0021-0000-0000-000022042A3E
Message-Id: <20200221032720.33893-22-alastair@au1.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_19:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxlogscore=618 bulkscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 mlxscore=0 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2001150001
 definitions=main-2002210021
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
Cc: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>,
 Alexey Kardashevskiy <aik@ozlabs.ru>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Ira Weiny <ira.weiny@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
 Rob Herring <robh@kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 linux-nvdimm@lists.01.org, "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Anju T Sudhakar <anju@linux.vnet.ibm.com>,
 Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>,
 Greg Kurz <groug@kaod.org>, Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Dan Williams <dan.j.williams@intel.com>, Hari Bathini <hbathini@linux.ibm.com>,
 linux-mm@kvack.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, Vishal Verma <vishal.l.verma@intel.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Alastair D'Silva <alastair@d-silva.org>

When health & performance data is requested from the controller,
it responds with an error log containing the requested information.

This patch allows the request to me issued via an IOCTL.

Signed-off-by: Alastair D'Silva <alastair@d-silva.org>
---
 arch/powerpc/platforms/powernv/pmem/ocxl.c | 16 ++++++++++++++++
 include/uapi/nvdimm/ocxl-pmem.h            |  1 +
 2 files changed, 17 insertions(+)

diff --git a/arch/powerpc/platforms/powernv/pmem/ocxl.c b/arch/powerpc/platforms/powernv/pmem/ocxl.c
index e46696d3cc36..081883a8247a 100644
--- a/arch/powerpc/platforms/powernv/pmem/ocxl.c
+++ b/arch/powerpc/platforms/powernv/pmem/ocxl.c
@@ -1000,6 +1000,18 @@ static int ioctl_event_check(struct ocxlpmem *ocxlpmem, u64 __user *uarg)
 	return rc;
 }
 
+/**
+ * req_controller_health_perf() - Request controller health & performance data
+ * @ocxlpmem: the device metadata
+ * Return: 0 on success, negative on failure
+ */
+int req_controller_health_perf(struct ocxlpmem *ocxlpmem)
+{
+	return ocxl_global_mmio_set64(ocxlpmem->ocxl_afu, GLOBAL_MMIO_HCI,
+				      OCXL_LITTLE_ENDIAN,
+				      GLOBAL_MMIO_HCI_REQ_HEALTH_PERF);
+}
+
 static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 {
 	struct ocxlpmem *ocxlpmem = file->private_data;
@@ -1037,6 +1049,10 @@ static long file_ioctl(struct file *file, unsigned int cmd, unsigned long args)
 	case IOCTL_OCXL_PMEM_EVENT_CHECK:
 		rc = ioctl_event_check(ocxlpmem, (u64 __user *)args);
 		break;
+
+	case IOCTL_OCXL_PMEM_REQUEST_HEALTH:
+		rc = req_controller_health_perf(ocxlpmem);
+		break;
 	}
 
 	return rc;
diff --git a/include/uapi/nvdimm/ocxl-pmem.h b/include/uapi/nvdimm/ocxl-pmem.h
index 988eb0bc413d..0d03abb44001 100644
--- a/include/uapi/nvdimm/ocxl-pmem.h
+++ b/include/uapi/nvdimm/ocxl-pmem.h
@@ -90,5 +90,6 @@ struct ioctl_ocxl_pmem_eventfd {
 #define IOCTL_OCXL_PMEM_CONTROLLER_STATS		_IO(OCXL_PMEM_MAGIC, 0x05)
 #define IOCTL_OCXL_PMEM_EVENTFD				_IOW(OCXL_PMEM_MAGIC, 0x06, struct ioctl_ocxl_pmem_eventfd)
 #define IOCTL_OCXL_PMEM_EVENT_CHECK			_IOR(OCXL_PMEM_MAGIC, 0x07, __u64)
+#define IOCTL_OCXL_PMEM_REQUEST_HEALTH			_IO(OCXL_PMEM_MAGIC, 0x08)
 
 #endif /* _UAPI_OCXL_SCM_H */
-- 
2.24.1

