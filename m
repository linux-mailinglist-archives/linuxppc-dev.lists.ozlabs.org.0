Return-Path: <linuxppc-dev+bounces-8210-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 862EAAA5A29
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 May 2025 06:11:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Zp0wq088xz2yZS;
	Thu,  1 May 2025 14:11:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1746072682;
	cv=none; b=JVsQfzDCPoncAoytEgO4DWpi7f81I/HENN0+nM87i0obVX0dnivjHlm4Ty5MRr1iD/SdIpG7kjBRhIHHz93Nh3/XPMDpOpBvLx/GrKBvK890B6AMTPzbT7lDALtFM8yZZri7qUxr44bsLq1BK6RiDOca5NZJM2zN06sEz0BfGy5RNh0rKVLUaBNFWgFSIYgm7Uz27GIA1loqNwkslYmcfUA9CpQaksl5DXo4JBsGID7sSSMzGMASJq6NCb/pOKFE3sg36QLne/CJGWAF8bRyM1A8JxkfNWjFaX/fGDoVc2UM2/DGw/IX3BG5sE+0v0cZHYRA9WtEfukMXnUAlNQAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1746072682; c=relaxed/relaxed;
	bh=Wu8sK1L51xVCpobi8U7kLTpUHR7Uq08pWFVX8ZmOsJs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=KVLbrW7tr6QHhNrhLq/cMdBs5i8BRqMFd+kzwZd1RxAZsh1otdK1gvwVaYI0R93mk/zssv540iV/xFisW5adGkysnueU1jMv6ZOy+pDWJh7Sax3gE1K6VtEbT12+ejZZgsD3HunRZ3yjWKcKRdaG3LDcbqcbKHKrJrkOj7D4n42KTsh9JjSWknlzO8o5/543GHA3L26j2SkM6/PqoXXf3A/kX0QWS6XNme22RkSgXixvUqZLKTENLY42bN0OROGUsFjBxIIUSyjMUQePlEL1TxpJ83bq37RzGooXlqYSzS0e8rLcaXCxJcpMIQA5X9E7RnoYgpZRjf8YKRENx/iC4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hCwX3DKk; dkim-atps=neutral; spf=pass (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=hCwX3DKk;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Zp0wm4QbHz2yYy
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  1 May 2025 14:11:19 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53UNkT5c011071;
	Thu, 1 May 2025 04:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=pp1; bh=Wu8sK1L51xVCpobi8U7kLTpUHR7U
	q08pWFVX8ZmOsJs=; b=hCwX3DKkmwHOeVupDdySICD9x6W3+Ay/bH/A1fUuivFJ
	y7lvxDlT+iKLXffc5eSYmQwZjUFYDQeZ5wkoRBSjYyRej5njRgKooOw2uTAJ1j3s
	kw2rmO/TuSRtw7P4g/wwSVjMovj9XFLOuJ1vF//eM+Y/UJre/wice9mBhWTYyPpZ
	ZS15YykU+9ZiGqCz+o30Unj/1Fvh6/5eKxbjkwA3/DBDvlda9w2vNG1jVXBlKUsB
	KrSCN2ED3JR9fO5HNJqN5ZGdeThLCNJq6jhIgmxSd3o6/FcqbJb0ZN0UJZ1gJlZm
	RS6xT+6n6Kb2Uv4hvok6YQKLPhl50xWY/ofiBF14Ww==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bwu18ryq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 04:11:09 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5414B8hD016249;
	Thu, 1 May 2025 04:11:08 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46bwu18ryk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 04:11:08 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54143Cma031665;
	Thu, 1 May 2025 04:11:07 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([172.16.1.7])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4699tubd3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 May 2025 04:11:07 +0000
Received: from smtpav02.dal12v.mail.ibm.com (smtpav02.dal12v.mail.ibm.com [10.241.53.101])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5414B5tx60293510
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 May 2025 04:11:05 GMT
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 905AD5805A;
	Thu,  1 May 2025 04:11:05 +0000 (GMT)
Received: from smtpav02.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0D15158051;
	Thu,  1 May 2025 04:11:04 +0000 (GMT)
Received: from li-4910aacc-2eed-11b2-a85c-d93b702d4d28.ibm.com.com (unknown [9.61.25.159])
	by smtpav02.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 May 2025 04:11:03 +0000 (GMT)
From: Haren Myneni <haren@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        tyreld@linux.ibm.com, hbabu@us.ibm.com, haren@linux.ibm.com
Subject: [PATCH] powerpc/pseries/dlpar: Search DRC index from ibm,drc-indexes for IO add
Date: Wed, 30 Apr 2025 21:10:56 -0700
Message-ID: <20250501041056.1281055-1-haren@linux.ibm.com>
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
X-Proofpoint-GUID: DwBtsNuAul1nFTgctWrm9DCDBWF4t1QM
X-Authority-Analysis: v=2.4 cv=e7QGSbp/ c=1 sm=1 tr=0 ts=6812f45d cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=MwhoDN2aAihZLIMZg8gA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: b8JhfiRhYcMGuG2GsuOCBWCzpJW2ieNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAxMDAzMSBTYWx0ZWRfX6rduH9E7q8kQ KY+UoKy3kx8cau8wU9fowAP+4oIzGSJXjy29/YYYEqpZHaDgP85Drq7lWoK+XAqupI2ri4VCRQ+ nVduel2MHSGJT6dLvabSdK8zGXqIy0AzIYTyp5ghiO4mrfHnkSFWHZYZgK/FmM281ee+IBRbKVE
 +o1d/bitBoCdzp9anP46fDPP5g5pXm4h+HP0TpYslZbUmGlX9EK7nfrezBUZlSuMOy2Ovyezzaa +jgBI90Uxj0HZUts2lYp576Ckcadh3Lnm3l2PxlwPpuIVEViwXQuMEMgTEjeIYXJsGi0StZIoti nPh05zdEw+lo/yY2FOWzDnEO6tbJsYdtsui7fUdnqp9PGdR8bj+buLo4J1huTFdE0nwY0NLXcE/
 xP4xz0Bz/6T8t06mR2dfe5/WtxIvjq1weS8X+LMxv1Bc0kJwAcZuISyiMI6lK0wmZWHtd3Fk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 mlxscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 mlxlogscore=544
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505010031
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

IO hotplug add event is handled in the user space with drmgr tool.
After the device is enabled, the user space uses /sys/kerne/dlpar
interface with “dt add index <drc_index>” to update the device tree.
The kernel interface (dlpar_hp_dt_add()) finds the parent node for
the specified ‘drc_index’ from ibm,drc-info property. But old FW
provides ibm,drc-indexes property instead of ibm,drc-info.

If the ibm,drc-info is not available, this patch adds changes to
search ‘drc_index’ from the indexes array in ibm,drc-indexes
property to support old FW.

Fixes: 02b98ff44a57 ("powerpc/pseries/dlpar: Add device tree nodes for DLPAR IO add")
Signed-off-by: Haren Myneni <haren@linux.ibm.com>
---
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


