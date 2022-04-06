Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3868E4F5A1D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 11:40:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KYKJG0L24z3byb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Apr 2022 19:40:46 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=H2uVPjcg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=H2uVPjcg; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KYKGD6QPtz2xmZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Apr 2022 19:39:00 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2369H7SY030286; 
 Wed, 6 Apr 2022 09:38:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=DHNlf/JDgv0gTdnED6TlQyaLfmq6R4TNCiyDvdQp1bQ=;
 b=H2uVPjcgpRorvZwunEAVoCdI5MLV/Ejp8jpSEWz6auiD4ao33PDglwTzYyJy7oyrTscH
 RarfgAPr6tLuH+Nv8QS53ktLwb1XggRfFi1OLQnVi3JRGUtFBMCuAkOzkz0l1uuqbQLa
 EKqZ31oPF6NWzTuoOVB7b150zATW9WX3zEdJlTpwDOHJD15PGTDo3wjZ/4Ol2UzMbvgh
 7auJgrLXaHZUNktaEptmZVIhFirEiS/CD2q/zW5C+xHdrNk5U6vInnl5RmAqgQxn3FCk
 HdaMJe6MW36uVBV0ZSd7JEpWxQjSHHovAnVZ8TV+Il38+dL4a5fUSKu258Xi+/g7hJkm Mw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3f983krdmv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:55 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2369bGIg025335;
 Wed, 6 Apr 2022 09:38:53 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma05fra.de.ibm.com with ESMTP id 3f6e48p6vf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Apr 2022 09:38:53 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 2369QYvk45744484
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Apr 2022 09:26:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D945752050;
 Wed,  6 Apr 2022 09:38:49 +0000 (GMT)
Received: from hbathini-workstation.ibm.com.domain.name (unknown
 [9.211.33.167])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 5BD5B5204E;
 Wed,  6 Apr 2022 09:38:46 +0000 (GMT)
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH 2/3] powerpc/fadump: align destination address to pagesize
Date: Wed,  6 Apr 2022 15:08:38 +0530
Message-Id: <20220406093839.206608-3-hbathini@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406093839.206608-1-hbathini@linux.ibm.com>
References: <20220406093839.206608-1-hbathini@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -1HGSBHQr0mErt7cQJgpVqwmp2ZW2zyt
X-Proofpoint-GUID: -1HGSBHQr0mErt7cQJgpVqwmp2ZW2zyt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-06_03,2022-04-05_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 priorityscore=1501 adultscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2204060044
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
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Sourabh Jain <sourabhjain@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On crash, boot memory area is copied to a destination address by f/w.
This region is setup as separate PT_LOAD segment with appropriate
offset to handle the different physical address and offset in vmcore.
If this destination address is not page aligned, reading the vmcore
with mmap is likely to fail forcing tools like makedumpfile to fall
back to regular read. Avoid mmap read failure by ensuring that the
destination address is always page aligned.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c                 | 5 +++++
 arch/powerpc/platforms/pseries/rtas-fadump.c | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index dc2350b288cf..ee564e8226b1 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -365,6 +365,11 @@ static unsigned long __init get_fadump_area_size(void)
 
 	size += fw_dump.cpu_state_data_size;
 	size += fw_dump.hpte_region_size;
+	/*
+	 * Account for pagesize alignment of boot memory area destination address.
+	 * This faciliates in mmap reading of first kernel's memory.
+	 */
+	size = PAGE_ALIGN(size);
 	size += fw_dump.boot_memory_size;
 	size += sizeof(struct fadump_crash_info_header);
 	size += sizeof(struct elfhdr); /* ELF core header.*/
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 35f9cb602c30..764df25304bd 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -108,6 +108,12 @@ static u64 rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	fdm.hpte_region.destination_address = cpu_to_be64(addr);
 	addr += fadump_conf->hpte_region_size;
 
+	/*
+	 * Align boot memory area destination address to page boundary to
+	 * be able to mmap read this area in the vmcore.
+	 */
+	addr = PAGE_ALIGN(addr);
+
 	/* RMA region section */
 	fdm.rmr_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
 	fdm.rmr_region.source_data_type =
-- 
2.35.1

