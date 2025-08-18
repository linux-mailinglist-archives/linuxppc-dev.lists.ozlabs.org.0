Return-Path: <linuxppc-dev+bounces-11080-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 195FDB29DDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 18 Aug 2025 11:30:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c56rg47bZz3brR;
	Mon, 18 Aug 2025 19:30:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755501324;
	cv=none; b=PtC4Pf/GbOl6NcafMsbJFSEJrQx6u/e1PjyswR7T18nmUwt0yxX0LHwt+bQ6qynN/HyHfrbnJXE79bEF5GlWsm0/vqWk2SAvM06rOUW1sBQtk2NEmzahtNxzTFS+T8o4YabiEgbFWVIjLXhTymFowxrAl0FPTwfxjBKU67GslZO6zRYuBcVtdWYCLIzUcR5ZsSzgrBifeJWCWl4iIWSAO06Vi/OyzWOYOjAZ2YL4rWESs3+iXL6ttujKjhk9QSN3q3YNk878o8gY0b36t6X8jYN+mhJz/1diepy9xv1rilwDqoc3d5i+ea2JA6ZpM1DQOpEHQ0ObbKMqM4A6tIj6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755501324; c=relaxed/relaxed;
	bh=l8N9ttvKyCBAcyEDvuaLoM1BSXehm0oCXcCPSraNLCM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=D6HebSJ7WLs/tMTdgwItZ9RWOTuk+GVOn05Wnyqd8Rj7ncrsK2P/3W9hxDhw2DKaAahPwydiGmOup56/c46bGsnUfOq/3hEWNGbvbb/dn7aGxEfObESc14ehJPU2oqz6eggaOzTYE3FIdJDp0BKVIUjbixQkhK4IaNnH/5H1RumlUS5KtqreIXfTwY5UUzL8PnouBPGKmh1xOXY4mA9Iv/6had9mW3P2i8kkTNYT/9QxFRanlyUVXJ3dWW2lNwnXxeZMFA70bIe4N+5Kh2ajJjRiRPiWOch1IGPo4VIQlK0e6dzmRaEOtefqpgjEiUOXd6d9mUd1QRJdAAfL2Zt0CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1ofeuAZ; dkim-atps=neutral; spf=pass (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=pratyush.brahma@oss.qualcomm.com; receiver=lists.ozlabs.org) smtp.mailfrom=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=S1ofeuAZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=oss.qualcomm.com (client-ip=205.220.168.131; helo=mx0a-0031df01.pphosted.com; envelope-from=pratyush.brahma@oss.qualcomm.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 2007 seconds by postgrey-1.37 at boromir; Mon, 18 Aug 2025 17:15:22 AEST
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4c53rp6Xlmz3bm3
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 17:15:21 +1000 (AEST)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57HJeFrZ022565
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 06:41:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=l8N9ttvKyCBAcyEDvuaLoM
	1BSXehm0oCXcCPSraNLCM=; b=S1ofeuAZEvausPNcfPdvnKZWbPTOWDSn/I7BEC
	fEzcKChFEREcdnUgDUZ0liwYbWKPM8rZPt1QO6jTgcF7psCTS7i5PGkOE6QI5JZ+
	KHyXq3fCcqVTX2TNJW8aE6hSDVQ07wo13XXPL6m308u3dn1gS4TZLJGYH+UVZxaP
	N5c049QcgEAx92YW7CGLG4srnZufUn6OZjs+cmknhQDuglZbtyx7y+zif+BWwBD5
	rLKoMV37K5sMLFRlSxJZfA3l9dBzOODYODOqjuY6k3pCnQT61mXkUULbWa5h5/21
	Fb+5mmW8neh+DKoOx0rQ8WtgQ3aJv0kjv4N5E7mgkhK3nJmQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99kepw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 18 Aug 2025 06:41:51 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-244581c62faso38545845ad.2
        for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Aug 2025 23:41:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755499310; x=1756104110;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l8N9ttvKyCBAcyEDvuaLoM1BSXehm0oCXcCPSraNLCM=;
        b=MgyVmp9T3buv3x3GmtXUfvq735X7i/q5maU0NYtklxNIYQfnZ0JA+cYfoLcGE503uh
         j4tPSsMu2eZJ1Wian6/Hcy68Ml3FqpP6bmmOJEgKyJOSWmQ2Zr8Qz9svrKQMhVsZuAYi
         i03anaDNWBtTMdmpgqiRu/N6FTuvnhibJ5O3DB7HtYldVP9uljtcZuvTHNiXmwRLvoUs
         /TVhzrOcQC5o2b5ktwePta1w34UpUI19DdOFe2E7OIQlfx6ObHER2hptY3dAbhio8Y0O
         Rdsovt+tBBLFGqeeeRp8IEosNQ0q4S4nrn9ascRXSjxA0dJcDpyaDgf6bdtJ+Bqb/a5c
         BSqA==
X-Gm-Message-State: AOJu0YyBWxzdtGoTgHgvcLTr6zMuGeLK4ryLdzGo/MUGLSKEktt37p9M
	JcEsWdnpnDFtgxbe48UN80lum6UEy6HINH37QBHoRJI7VIbeVEBxzTPPNvxVnOZj4lPNbtrr5lJ
	HDW0MoqFXss3Nqt3XDyHWmcEOJKzVSyRMWo2dHjrSYKKBF6BO3PLn13w0CZQIgGjXW2ld
X-Gm-Gg: ASbGncv2DKqYNSwZlAnB8qYqy7a23+mkFg5UE6Xz2VuG9dHHSASNpQDVqsR/Y3j9cDi
	HlnqOOPC5p/k5Q6+u5ry0uAcIDID7QoqI6uheAQ9zqvR6SKC9XiCKm5ZJjdijvruy70KlYU/iXA
	2iGKYLsB/bTxjk/MwC2Cd9bxDHV8q5MvZ4/xHhv5As4+kfTb95MQbH1IRTYwvDaEAqNuBycLBVD
	YJPAHzwz6b5pSvN4DjY9MADSm2HtS2aIu1K8xmhFf4/Hqp1i3hqhbRYuIwtFag8TiGadx3B/J7c
	VU7FEZfJYytTQf6X2bDc9VqQ5Cw+YLgiHEr116spTp8=
X-Received: by 2002:a17:902:c951:b0:240:22af:91c7 with SMTP id d9443c01a7336-2446d71db3fmr134372685ad.14.1755499310161;
        Sun, 17 Aug 2025 23:41:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmF5KBA9eIDDl75sJwjMQCpOEjZ8TR6DA+JYR6yCjrU7iJmsnLTLQaYA9/NFl8UsVIfaN9mw==
X-Received: by 2002:a17:902:c951:b0:240:22af:91c7 with SMTP id d9443c01a7336-2446d71db3fmr134372375ad.14.1755499309632;
        Sun, 17 Aug 2025 23:41:49 -0700 (PDT)
Received: from hu-pbrahma-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2446d53bf5dsm70069295ad.114.2025.08.17.23.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Aug 2025 23:41:48 -0700 (PDT)
From: pratyush.brahma@oss.qualcomm.com
X-Google-Original-From: Pratyush
Date: Mon, 18 Aug 2025 12:11:15 +0530
Subject: [PATCH] mm/numa: Rename memory_add_physaddr_to_nid to
 memory_get_phys_to_nid
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250818-numa_memblks-v1-1-9eb29ade560a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAArLomgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDC0MT3bzS3MT43NTcpJzsYt0kU5NEC3MLCyODlFQloJaCotS0zAqwcdG
 xQH5GZnFJflElyPTa2loAgXpdgW0AAAA=
X-Change-ID: 20250814-numa_memblks-b54a878820de
To: Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>, Ira Weiny <ira.weiny@intel.com>,
        David Hildenbrand <david@redhat.com>,
        Oscar Salvador <osalvador@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Davidlohr Bueso <dave@stgolabs.net>,
        Jonathan Cameron <jonathan.cameron@huawei.com>,
        Alison Schofield <alison.schofield@intel.com>,
        "K. Y. Srinivasan" <kys@microsoft.com>,
        Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
        Dexuan Cui <decui@microsoft.com>,
        Pankaj Gupta <pankaj.gupta.linux@gmail.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        =?utf-8?q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
        Juergen Gross <jgross@suse.com>,
        Stefano Stabellini <sstabellini@kernel.org>,
        Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-s390@vger.kernel.org, linux-acpi@vger.kernel.org,
        nvdimm@lists.linux.dev, linux-mm@kvack.org, linux-cxl@vger.kernel.org,
        linux-hyperv@vger.kernel.org, virtualization@lists.linux.dev,
        xen-devel@lists.xenproject.org,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755499297; l=12122;
 i=pratyush.brahma@oss.qualcomm.com; s=20250808; h=from:subject:message-id;
 bh=//n/Cd8/21p2TwuLHbKJjrZr/VX2C3LDE0HHjeHcn3A=;
 b=YhwC5Lk4afAnAuPN/u4jW8oYab0ctCO2cz+geSxr4bRuihGdwIV2yM1kuCXBVrnF+tdcuoDdH
 v7S65fFa5CkAcFfEgaPVnJ6mv1qtlUNsSBr4p0Efj25v9textGh8WHy
X-Developer-Key: i=pratyush.brahma@oss.qualcomm.com; a=ed25519;
 pk=ZeXF1N8hxU6j3G/ajMI+du/TVXMZQaXDwnJyznB69ms=
X-Proofpoint-ORIG-GUID: tFJ0MaXOsze_UsWD8vTILq5NTTS4KIeQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX2WNQJfxCR4iw
 LcPeb4vgplVO0Lcz1TwY3ORB92Unxnq3DBD20SLKHhuz3FAaE8GRHEote9PCdEh/jYaIaoXJTPO
 Zo5+LIpH1mHweybWeV5KEi1CvFfrGs9CUlPLfmbzskw2l6vI8pyms3ppzTy/pjJLLF4SHGAbuAl
 jzXe36nTtXIfIPPfYacAhDef/t3voZ+nkN95Oq/IbjnoaPKGxcnXd+bErAGqKZsG7PPXI/ib5je
 hriOTnNjpfNFqDMYPUKBXo0cq4PRIT3urzlJlYtiDQOxOB+yUL+kBvEDGoLYLLp/J2npJx6XPan
 KIMwIZGlVF03UVYx8snyYU9BhJZ/xmalGoa5Ik3nH16pXV6N4nVK3Bp39nQ420S95R5D4blfGe7
 Xi4KdQ56
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a2cb2f cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=qb4DzySmTAYQGscL8MYA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: tFJ0MaXOsze_UsWD8vTILq5NTTS4KIeQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_03,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1011 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>

The function `memory_add_physaddr_to_nid` seems a misnomer.
It does not to "add" a physical address to a NID mapping,
but rather it gets the NID associated with a given physical address.

Improve the semantic clarity of the API by renaming to a more
descriptive name.

Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
---
 arch/powerpc/include/asm/sparsemem.h | 4 ++--
 arch/powerpc/mm/mem.c                | 4 ++--
 arch/s390/include/asm/sparsemem.h    | 4 ++--
 drivers/acpi/acpi_memhotplug.c       | 2 +-
 drivers/acpi/nfit/core.c             | 2 +-
 drivers/base/memory.c                | 2 +-
 drivers/cxl/pmem.c                   | 2 +-
 drivers/dax/cxl.c                    | 2 +-
 drivers/hv/hv_balloon.c              | 6 +++---
 drivers/nvdimm/virtio_pmem.c         | 2 +-
 drivers/virtio/virtio_mem.c          | 2 +-
 drivers/xen/balloon.c                | 2 +-
 include/linux/numa.h                 | 6 +++---
 include/linux/numa_memblks.h         | 4 ++--
 mm/numa.c                            | 6 +++---
 mm/numa_memblks.c                    | 4 ++--
 16 files changed, 27 insertions(+), 27 deletions(-)

diff --git a/arch/powerpc/include/asm/sparsemem.h b/arch/powerpc/include/asm/sparsemem.h
index d072866842e4229159fcb6635745fd19a2788413..cdb5594616c8e32ab8ae3d209d0b2df20f3564f6 100644
--- a/arch/powerpc/include/asm/sparsemem.h
+++ b/arch/powerpc/include/asm/sparsemem.h
@@ -14,8 +14,8 @@
 
 #ifdef CONFIG_MEMORY_HOTPLUG
 extern int remove_section_mapping(unsigned long start, unsigned long end);
-extern int memory_add_physaddr_to_nid(u64 start);
-#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
+extern int memory_get_phys_to_nid(u64 start);
+#define memory_get_phys_to_nid memory_get_phys_to_nid
 
 #ifdef CONFIG_NUMA
 extern int hot_add_scn_to_nid(unsigned long scn_addr);
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3ddbfdbfa9413a17d8321885724ce432d967005a..5665b2e2fc68df8634613c11706e1a9158a3a616 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -54,11 +54,11 @@ EXPORT_SYMBOL(__phys_mem_access_prot);
 static DEFINE_MUTEX(linear_mapping_mutex);
 
 #ifdef CONFIG_NUMA
-int memory_add_physaddr_to_nid(u64 start)
+int memory_get_phys_to_nid(u64 start)
 {
 	return hot_add_scn_to_nid(start);
 }
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+EXPORT_SYMBOL_GPL(memory_get_phys_to_nid);
 #endif
 
 int __weak create_section_mapping(unsigned long start, unsigned long end,
diff --git a/arch/s390/include/asm/sparsemem.h b/arch/s390/include/asm/sparsemem.h
index 668dfc5de538742269af1b25151372506105fd4d..744c67dce4c106d063cb5436b37412045da0fd2a 100644
--- a/arch/s390/include/asm/sparsemem.h
+++ b/arch/s390/include/asm/sparsemem.h
@@ -7,11 +7,11 @@
 
 #ifdef CONFIG_NUMA
 
-static inline int memory_add_physaddr_to_nid(u64 addr)
+static inline int memory_get_phys_to_nid(u64 addr)
 {
 	return 0;
 }
-#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
+#define memory_get_phys_to_nid memory_get_phys_to_nid
 
 static inline int phys_to_target_node(u64 start)
 {
diff --git a/drivers/acpi/acpi_memhotplug.c b/drivers/acpi/acpi_memhotplug.c
index d0c1a71007d0a3054608bec8fddc8e86bdffb78b..6f968243ffc3cc5864e73b914d1bf67748e30e66 100644
--- a/drivers/acpi/acpi_memhotplug.c
+++ b/drivers/acpi/acpi_memhotplug.c
@@ -183,7 +183,7 @@ static int acpi_memory_enable_device(struct acpi_memory_device *mem_device)
 			continue;
 		/* We want a single node for the whole memory group */
 		if (node < 0)
-			node = memory_add_physaddr_to_nid(info->start_addr);
+			node = memory_get_phys_to_nid(info->start_addr);
 		total_length += info->length;
 	}
 
diff --git a/drivers/acpi/nfit/core.c b/drivers/acpi/nfit/core.c
index ae035b93da087812dee6ec47d9ef4aa97dc8e7bc..04c3ab311e4d5923aef50252efabd193c5fb7850 100644
--- a/drivers/acpi/nfit/core.c
+++ b/drivers/acpi/nfit/core.c
@@ -2630,7 +2630,7 @@ static int acpi_nfit_register_region(struct acpi_nfit_desc *acpi_desc,
 
 	/* Fallback to address based numa information if node lookup failed */
 	if (ndr_desc->numa_node == NUMA_NO_NODE) {
-		ndr_desc->numa_node = memory_add_physaddr_to_nid(spa->address);
+		ndr_desc->numa_node = memory_get_phys_to_nid(spa->address);
 		dev_info(acpi_desc->dev, "changing numa node from %d to %d for nfit region [%pa-%pa]",
 			NUMA_NO_NODE, ndr_desc->numa_node, &res.start, &res.end);
 	}
diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 5c6c1d6bb59f1241a5f42a3396be1a8e2058c965..f657520855408804761afec379e3c0b2a238b239 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -599,7 +599,7 @@ static ssize_t probe_store(struct device *dev, struct device_attribute *attr,
 	if (ret)
 		return ret;
 
-	nid = memory_add_physaddr_to_nid(phys_addr);
+	nid = memory_get_phys_to_nid(phys_addr);
 	ret = __add_memory(nid, phys_addr,
 			   MIN_MEMORY_BLOCK_SIZE * sections_per_block,
 			   MHP_NONE);
diff --git a/drivers/cxl/pmem.c b/drivers/cxl/pmem.c
index e197883690efc11f60c31bd56aeb5695665d422b..471aed4e11241948e994d0b9d53600c147e38fb0 100644
--- a/drivers/cxl/pmem.c
+++ b/drivers/cxl/pmem.c
@@ -410,7 +410,7 @@ static int cxl_pmem_region_probe(struct device *dev)
 	ndr_desc.res = res;
 	ndr_desc.provider_data = cxlr_pmem;
 
-	ndr_desc.numa_node = memory_add_physaddr_to_nid(res->start);
+	ndr_desc.numa_node = memory_get_phys_to_nid(res->start);
 	ndr_desc.target_node = phys_to_target_node(res->start);
 	if (ndr_desc.target_node == NUMA_NO_NODE) {
 		ndr_desc.target_node = ndr_desc.numa_node;
diff --git a/drivers/dax/cxl.c b/drivers/dax/cxl.c
index 13cd94d32ff7a1d70af7821c1aecd7490302149d..35843791872ba466f571c022e1484816368a1198 100644
--- a/drivers/dax/cxl.c
+++ b/drivers/dax/cxl.c
@@ -15,7 +15,7 @@ static int cxl_dax_region_probe(struct device *dev)
 	struct dev_dax_data data;
 
 	if (nid == NUMA_NO_NODE)
-		nid = memory_add_physaddr_to_nid(cxlr_dax->hpa_range.start);
+		nid = memory_get_phys_to_nid(cxlr_dax->hpa_range.start);
 
 	dax_region = alloc_dax_region(dev, cxlr->id, &cxlr_dax->hpa_range, nid,
 				      PMD_SIZE, IORESOURCE_DAX_KMEM);
diff --git a/drivers/hv/hv_balloon.c b/drivers/hv/hv_balloon.c
index 2b4080e51f97c30e7adb06faa56b1403bc08b53c..8878aac6da9cd3bd6f499eae2588e989b7219af3 100644
--- a/drivers/hv/hv_balloon.c
+++ b/drivers/hv/hv_balloon.c
@@ -725,7 +725,7 @@ static void hv_mem_hot_add(unsigned long start, unsigned long size,
 
 		reinit_completion(&dm_device.ol_waitevent);
 
-		nid = memory_add_physaddr_to_nid(PFN_PHYS(start_pfn));
+		nid = memory_get_phys_to_nid(PFN_PHYS(start_pfn));
 		ret = add_memory(nid, PFN_PHYS((start_pfn)),
 				 HA_BYTES_IN_CHUNK, MHP_MERGE_RESOURCE);
 
@@ -1701,8 +1701,8 @@ static int hot_add_enabled(void)
 {
 	/*
 	 * Disable hot add on ARM64, because we currently rely on
-	 * memory_add_physaddr_to_nid() to get a node id of a hot add range,
-	 * however ARM64's memory_add_physaddr_to_nid() always return 0 and
+	 * memory_get_phys_to_nid() to get a node id of a hot add range,
+	 * however ARM64's memory_get_phys_to_nid() always return 0 and
 	 * DM_MEM_HOT_ADD_REQUEST doesn't have the NUMA node information for
 	 * add_memory().
 	 */
diff --git a/drivers/nvdimm/virtio_pmem.c b/drivers/nvdimm/virtio_pmem.c
index 2396d19ce5496974f8b93b54cc8c95e48dda103d..df6a3fd552d11a577d85708f80e7558ea83839d2 100644
--- a/drivers/nvdimm/virtio_pmem.c
+++ b/drivers/nvdimm/virtio_pmem.c
@@ -100,7 +100,7 @@ static int virtio_pmem_probe(struct virtio_device *vdev)
 
 	ndr_desc.res = &res;
 
-	ndr_desc.numa_node = memory_add_physaddr_to_nid(res.start);
+	ndr_desc.numa_node = memory_get_phys_to_nid(res.start);
 	ndr_desc.target_node = phys_to_target_node(res.start);
 	if (ndr_desc.target_node == NUMA_NO_NODE) {
 		ndr_desc.target_node = ndr_desc.numa_node;
diff --git a/drivers/virtio/virtio_mem.c b/drivers/virtio/virtio_mem.c
index 1688ecd69a0445d5c21d108a9a1d60577f96d7ac..6154f03a12c3efa65728f626e43b6270245d439c 100644
--- a/drivers/virtio/virtio_mem.c
+++ b/drivers/virtio/virtio_mem.c
@@ -2858,7 +2858,7 @@ static int virtio_mem_init(struct virtio_mem *vm)
 
 	/* Determine the nid for the device based on the lowest address. */
 	if (vm->nid == NUMA_NO_NODE)
-		vm->nid = memory_add_physaddr_to_nid(vm->addr);
+		vm->nid = memory_get_phys_to_nid(vm->addr);
 
 	dev_info(&vm->vdev->dev, "start address: 0x%llx", vm->addr);
 	dev_info(&vm->vdev->dev, "region size: 0x%llx", vm->region_size);
diff --git a/drivers/xen/balloon.c b/drivers/xen/balloon.c
index 2de37dcd75566fc1a03b75232cbe17fc0f53909d..93ca270ddd516ec11bc3f096eb518b9789d92664 100644
--- a/drivers/xen/balloon.c
+++ b/drivers/xen/balloon.c
@@ -284,7 +284,7 @@ static enum bp_state reserve_additional_memory(void)
 	if (!resource)
 		goto err;
 
-	nid = memory_add_physaddr_to_nid(resource->start);
+	nid = memory_get_phys_to_nid(resource->start);
 
 #ifdef CONFIG_XEN_HAVE_PVMMU
 	/*
diff --git a/include/linux/numa.h b/include/linux/numa.h
index e6baaf6051bcff6c23308d3b67f790053fbd29dc..ed65a20f39718a5a3157f6f9db60561f4418b000 100644
--- a/include/linux/numa.h
+++ b/include/linux/numa.h
@@ -33,8 +33,8 @@ int numa_nearest_node(int node, unsigned int state);
 
 int nearest_node_nodemask(int node, nodemask_t *mask);
 
-#ifndef memory_add_physaddr_to_nid
-int memory_add_physaddr_to_nid(u64 start);
+#ifndef memory_get_phys_to_nid
+int memory_get_phys_to_nid(u64 start);
 #endif
 
 #ifndef phys_to_target_node
@@ -54,7 +54,7 @@ static inline int nearest_node_nodemask(int node, nodemask_t *mask)
 	return NUMA_NO_NODE;
 }
 
-static inline int memory_add_physaddr_to_nid(u64 start)
+static inline int memory_get_phys_to_nid(u64 start)
 {
 	return 0;
 }
diff --git a/include/linux/numa_memblks.h b/include/linux/numa_memblks.h
index 991076cba7c5016d845eb40a2f9887f73fa83862..37cc0987e738f8aa2eb5c8f1ca2c94394def4780 100644
--- a/include/linux/numa_memblks.h
+++ b/include/linux/numa_memblks.h
@@ -53,8 +53,8 @@ static inline int numa_emu_cmdline(char *str)
 #ifdef CONFIG_NUMA_KEEP_MEMINFO
 extern int phys_to_target_node(u64 start);
 #define phys_to_target_node phys_to_target_node
-extern int memory_add_physaddr_to_nid(u64 start);
-#define memory_add_physaddr_to_nid memory_add_physaddr_to_nid
+extern int memory_get_phys_to_nid(u64 start);
+#define memory_get_phys_to_nid memory_get_phys_to_nid
 #endif /* CONFIG_NUMA_KEEP_MEMINFO */
 
 #endif /* CONFIG_NUMA_MEMBLKS */
diff --git a/mm/numa.c b/mm/numa.c
index 7d5e06fe5bd4a2790b83dd7dbe646617f6476d8c..f7b5ac8aea608368b75c606970187eb147ddf427 100644
--- a/mm/numa.c
+++ b/mm/numa.c
@@ -40,14 +40,14 @@ void __init alloc_offline_node_data(int nid)
 
 /* Stub functions: */
 
-#ifndef memory_add_physaddr_to_nid
-int memory_add_physaddr_to_nid(u64 start)
+#ifndef memory_get_phys_to_nid
+int memory_get_phys_to_nid(u64 start)
 {
 	pr_info_once("Unknown online node for memory at 0x%llx, assuming node 0\n",
 			start);
 	return 0;
 }
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+EXPORT_SYMBOL_GPL(memory_get_phys_to_nid);
 #endif
 
 #ifndef phys_to_target_node
diff --git a/mm/numa_memblks.c b/mm/numa_memblks.c
index 541a99c4071a67e5b0ef66f4136dee268a880003..346039bd933390fb014931fc61ccd2f96a773c37 100644
--- a/mm/numa_memblks.c
+++ b/mm/numa_memblks.c
@@ -580,7 +580,7 @@ int phys_to_target_node(u64 start)
 }
 EXPORT_SYMBOL_GPL(phys_to_target_node);
 
-int memory_add_physaddr_to_nid(u64 start)
+int memory_get_phys_to_nid(u64 start)
 {
 	int nid = meminfo_to_nid(&numa_meminfo, start);
 
@@ -588,6 +588,6 @@ int memory_add_physaddr_to_nid(u64 start)
 		nid = numa_meminfo.blk[0].nid;
 	return nid;
 }
-EXPORT_SYMBOL_GPL(memory_add_physaddr_to_nid);
+EXPORT_SYMBOL_GPL(memory_get_phys_to_nid);
 
 #endif /* CONFIG_NUMA_KEEP_MEMINFO */

---
base-commit: 479058002c32b77acac43e883b92174e22c4be2d
change-id: 20250814-numa_memblks-b54a878820de

Best regards,
-- 
Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>


