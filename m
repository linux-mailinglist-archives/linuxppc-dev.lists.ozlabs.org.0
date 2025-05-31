Return-Path: <linuxppc-dev+bounces-9052-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B46DAC9D61
	for <lists+linuxppc-dev@lfdr.de>; Sun,  1 Jun 2025 01:51:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4b8xhZ320Qz2yF0;
	Sun,  1 Jun 2025 09:51:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1748735486;
	cv=none; b=WTNABHLqe2fXAIW5kN//kiV+AQlQ1UC6ZMczwIGmewFinq4+QM+JDqepgoiC7tK/VjQJwkSl0Gdd3BO5DcdHVdfL0J94i0sFOPmYdmEYFdXu8dJXEWVWc7nPxg/H6mIv+rrVP2Xb8Dp/EYZUt6r8tI53nGrE2LO/INozvznCyIbusFOMEUPhPMsgu0m7/oucLqw8rB4VFEF6kskLmn88YfCf3hwC7y6h9P0QakGDIO87OfwdXXR/XdPWakkHZR88VosdgD6z/jlYQUIJXq/f70GDqLxKlz1CmCE1aQvLfhk8tVByH4+Yupvwg1ly/cnlxrzYPuDA86nSd4wNtf+Rew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1748735486; c=relaxed/relaxed;
	bh=F+9eSULt61Rlm0zc+pnCL3BeDkXiAEtWZFzkO8oSI5k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Z9RT5HyVSSrE8s6D8W6BNp9p7Ino3sEw9yGAXhET7it1t03Huy8bGHi/6uftItQ84xA6m6FPgtVaAUa1/w7g8RjqROaqmiDQtT3elRRUhjxFmCCLSf99XQfgGgPGJt1FMSKUx3hXdOobVH5N/ky1P8e7mEDMgrkCtHhu3kYwW7UdX2gD7z5zuuLc1jGcht+qA+Ztfjk0MgDDZCEtbBotUxAdBxMDnkyDlQE+Q8ggbj0Gj8iBC7Nzdmg9O0X7S7twvw1NwN2Y2MrIpQNMGB4TJhxaxhHw6Xrb9fvt5zDmCE3yh6MOBxCj6hU0aXcs5PFYrcji+RnFBjlf9AbQi0Q82g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=limgS3gb; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=limgS3gb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4b8xhY1ZWGz2x9N
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  1 Jun 2025 09:51:24 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54VJvd4Z025195;
	Sat, 31 May 2025 23:51:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=F+9eSULt61Rlm0zc+pnCL3BeDkXi
	AEtWZFzkO8oSI5k=; b=limgS3gbiCytxxcKSoROHkkuHTJj3iY41U3oc8x4PV9U
	Jfq0wG4OYjX68PPnMRiswr0JMWd6tf+MsB4NVB2rHRZVYl5N//OPpLlUA2fkcoTk
	PrThtrbaePe543+228WsdXEmnuw0s81ykhU7yLBJSV75RuZ6UowMnKbs1cwdsHDm
	y8lWxKu161joVaHcTGfyrEjhRVLZFJA5tu9YAeRZNy2D5IywAy2l9DYe0jFWXHIz
	BgZ0ddy5p9ccgsXnTuEGjnY9bU7I7wOmvs/usZFRvdYZB5CtZlK0vXN5V3o1ahdi
	qviCH0Xg9AV2QRwc/Qj0yKiKi16NuD8x4Zc4+zbCcA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46yxqq27rw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 23:51:14 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54VNpEQx000929;
	Sat, 31 May 2025 23:51:14 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46yxqq27rv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 23:51:14 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54VJiB8X030862;
	Sat, 31 May 2025 23:51:13 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([172.16.1.8])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46uru17x5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 31 May 2025 23:51:13 +0000
Received: from smtpav03.dal12v.mail.ibm.com (smtpav03.dal12v.mail.ibm.com [10.241.53.102])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54VNpAlW51970378
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 31 May 2025 23:51:10 GMT
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B674B58056;
	Sat, 31 May 2025 23:51:10 +0000 (GMT)
Received: from smtpav03.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0CF0E5803F;
	Sat, 31 May 2025 23:51:10 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.9.22])
	by smtpav03.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Sat, 31 May 2025 23:51:09 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        hbabu@us.ibm.com, haren@linux.ibm.com,
        Kowshik Jois <kowsjois@linux.ibm.com>,
        Amit Machhiwal <amachhiw@linux.ibm.com>,
        Tyrel Datwyler <tyreld@linux.ibm.com>
Subject: [PATCH v2] powerpc/pseries/dlpar: Search DRC index from ibm,drc-indexes for IO add
Date: Sat, 31 May 2025 16:50:02 -0700
Message-ID: <20250531235002.239213-1-haren@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
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
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=AZ2xH2XG c=1 sm=1 tr=0 ts=683b95f2 cx=c_pps a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=er3VbNMTn1isvFyg5NMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMxMDIxNCBTYWx0ZWRfXyBQnxr46V5Iw YbJEm4I8rb/2PiEgZOu/w1boCIBUTJvRdMsGlyufGz9P3Ltiatqw9uQxe5fkW5S4y7C9QIfSOrD j1XVEy+8fZfGrGSNThxQJ7FKcuwKz1uoX21D1/Ihw3R2PEA/vjlsmUHqtS2uM1jMUGqKKOwkkmy
 bKlemb3gafxk8bMJeBExicSC6J2RT5VQCGC2V3i7X4y2naZgNh7jzMkZyYErsc3x7bFvIPZzsx+ N4YmkJ0/+guxOSK35euxweHzFS/l7XW/l/YRDMFIRliSUKmbVXi1RLfCyc4NMij/q+SH7+T2e1Z VBFd+BlTuMLYaIiaouQ9vPHi4etsBAR/A9u65rNNNaH/QgdN21lz/oUXbpdWTUocZPbAuKywzPq
 SY8xknGjFbGs8VR8uqbns6jlsg8kb0zb/edpOLidLTqeQ0nUzWXuNcAVDWACg887GETf+Xlu
X-Proofpoint-ORIG-GUID: bXyh3fFE8ZbH1oMrErgrv7WwFWe0_DIs
X-Proofpoint-GUID: VhJSAwbzuiQ8R3jz6Xr2P7vxws1X9Al1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-31_11,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 lowpriorityscore=0 spamscore=0 mlxscore=0 bulkscore=0 mlxlogscore=831
 clxscore=1011 adultscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505310214
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

IO hotplug add event is handled in the user space with drmgr tool.
After the device is enabled, the user space uses /sys/kernel/dlpar
interface with “dt add index <drc_index>” to update the device tree.
The kernel interface (dlpar_hp_dt_add()) finds the parent node for
the specified ‘drc_index’ from ibm,drc-info property. The recent FW
provides this property from 2017 onwards. But KVM guest code in
some releases is still using the older SLOF firmware which has
ibm,drc-indexes property instead of ibm,drc-info.

If the ibm,drc-info is not available, this patch adds changes to
search ‘drc_index’ from the indexes array in ibm,drc-indexes
property to support old FW.

Fixes: 02b98ff44a57 ("powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add")
Reported-by: Kowshik Jois <kowsjois@linux.ibm.com>
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
Tested-by: Amit Machhiwal <amachhiw@linux.ibm.com>
Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
---
Changes in v2:
- Update the commit log with the explicit description on older FW
  support as Tyrel Datwyler suggested.

 arch/powerpc/platforms/pseries/dlpar.c | 52 +++++++++++++++++++++++++-
 1 file changed, 50 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/pseries/dlpar.c b/arch/powerpc/platforms/pseries/dlpar.c
index 213aa26dc8b3..979487da6522 100644
--- a/arch/powerpc/platforms/pseries/dlpar.c
+++ b/arch/powerpc/platforms/pseries/dlpar.c
@@ -404,6 +404,45 @@ get_device_node_with_drc_info(u32 index)
 	return NULL;
 }
 
+static struct device_node *
+get_device_node_with_drc_indexes(u32 drc_index)
+{
+	struct device_node *np = NULL;
+	u32 nr_indexes, index;
+	int i, rc;
+
+	for_each_node_with_property(np, "ibm,drc-indexes") {
+		/*
+		 * First element in the array is the total number of
+		 * DRC indexes returned.
+		 */
+		rc = of_property_read_u32_index(np, "ibm,drc-indexes",
+				0, &nr_indexes);
+		if (rc)
+			goto out_put_np;
+
+		/*
+		 * Retrieve DRC index from the list and return the
+		 * device node if matched with the specified index.
+		 */
+		for (i = 0; i < nr_indexes; i++) {
+			rc = of_property_read_u32_index(np, "ibm,drc-indexes",
+							i+1, &index);
+			if (rc)
+				goto out_put_np;
+
+			if (drc_index == index)
+				return np;
+		}
+	}
+
+	return NULL;
+
+out_put_np:
+	of_node_put(np);
+	return NULL;
+}
+
 static int dlpar_hp_dt_add(u32 index)
 {
 	struct device_node *np, *nodes;
@@ -423,10 +462,19 @@ static int dlpar_hp_dt_add(u32 index)
 		goto out;
 	}
 
+	/*
+	 * Recent FW provides ibm,drc-info property. So search
+	 * for the user specified DRC index from ibm,drc-info
+	 * property. If this property is not available, search
+	 * in the indexes array from ibm,drc-indexes property.
+	 */
 	np = get_device_node_with_drc_info(index);
 
-	if (!np)
-		return -EIO;
+	if (!np) {
+		np = get_device_node_with_drc_indexes(index);
+		if (!np)
+			return -EIO;
+	}
 
 	/* Next, configure the connector. */
 	nodes = dlpar_configure_connector(cpu_to_be32(index), np);
-- 
2.43.5


