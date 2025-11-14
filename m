Return-Path: <linuxppc-dev+bounces-14172-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E4CAFC5B5FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 06:15:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d75266Z7Zz30C0;
	Fri, 14 Nov 2025 16:15:42 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763097342;
	cv=none; b=dwmrFSt79TEd8PvD1pV4UhYzr/DDV3UP6OLYsprWc+hJ7l+pxbbME1hQpTknc8JD13ujMusb+LdK1ox0GA4msMtb18l6jRCKV7+JuP9ybuK+cdCkYZZFVTwlfLBtk9iOOszh8x/ga0OzHJKhg0vI3sqXyoO5JJmsFwbZ61BqmaP3Ed/daQfd9dhQL+A/ifox3pYTnYJ+rOihupAQD4qO1MTj41ixg78y2qaHRbrpDOjp7UK+bWzUbDwmdRTZB+FYhNFWYmJiRUnVZEL53I7BWR5mRYVTGg1N72WnGRhRafNnKWZH5Rk7p0O/tQkKDNr5rnimLPLydDzwORNk8io0Eg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763097342; c=relaxed/relaxed;
	bh=vsU1RZLnrbaQXMov3T1w4F/vxwR9IwkqfqhPedHcRTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZhGC7gectXxrhikzh40mMrDJ8YevVaqph/lTQKCi6S0J03A8LVuuahxCj89BEdgKJmx/Jutee3i0rCvhmJVKXBbSUJfRigQbVSSRjVUimwthVERMuCpL5JwE1m0mLjaFS1AC5M82m1Bo2/sBMntt0igOtDEEzKWdc8S2ftSGdAsqhuRznwAz1jMOTTMIDgkdw3lm0DCjO+xyf/9hxOZ7dEtqbAZqdj2MRxMDf6hHOA14+KUHmd2pb7RcSskgxr/FrBTVNRMJZ5Ci4AueWd8rCYH+RuYbAJ9xHP3FNEvdKgQ8oRrBVZ/G9Gr+SNaF83RJeL04cwvlIRoPw7/LGLWAEg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HA+2IgJl; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=HA+2IgJl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=sourabhjain@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d7526173gz30B4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 16:15:42 +1100 (AEDT)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5ADMlc6x008074;
	Fri, 14 Nov 2025 05:15:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vsU1RZLnrbaQXMov3
	T1w4F/vxwR9IwkqfqhPedHcRTA=; b=HA+2IgJlnPB9nThWIelY+5CWTBOUF7BjR
	V3KUpQdk51B2raaXyZG3rVUy/Al8hPbsMdM1TJp+CtRyBSAhGQQYizE7R4tnXAJT
	6pSDoNQ4fFDKxQeq1Hnx/TzgzxzvzFo15/Tkk7v2SDBLUIGFw/EeG1ZdazpU0h0U
	qM/1fvdRBU3/k5Rr8/WoFYZPaJ/98P667TFwR+8J3Y2Qbyvm6pncD3yUbdfakuD7
	Vxr/7QHy4nkmoXTLYIsSTEGmRb0LNd5HSZS9Nzs2LFZydtY/8dNrHMs8FPZiEkah
	WvUgiGQxrGRgzgigXuIdVyl3YpcubtShXeQHPYUy+upW98xN8Rlzg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4adred92g1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 05:15:37 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.0.8) with ESMTP id 5AE58ixp025154;
	Fri, 14 Nov 2025 05:15:36 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4adred92fx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 05:15:36 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AE3MIhG004828;
	Fri, 14 Nov 2025 05:15:35 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4aagjy9sue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 05:15:35 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5AE5FV0941288142
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 14 Nov 2025 05:15:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5B5AE2004B;
	Fri, 14 Nov 2025 05:15:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8FBB520043;
	Fri, 14 Nov 2025 05:15:27 +0000 (GMT)
Received: from li-4f5ba44c-27d4-11b2-a85c-a08f5b49eada.ibm.com.com (unknown [9.124.211.127])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 14 Nov 2025 05:15:27 +0000 (GMT)
From: Sourabh Jain <sourabhjain@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: Sourabh Jain <sourabhjain@linux.ibm.com>,
        Aditya Gupta <adityag@linux.ibm.com>,
        Andrew Morton <akpm@linux-foundation.org>, Baoquan he <bhe@redhat.com>,
        Dave Young <dyoung@redhat.com>, Hari Bathini <hbathini@linux.ibm.com>,
        Jiri Bohac <jbohac@suse.cz>, Madhavan Srinivasan <maddy@linux.ibm.com>,
        Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
        Pingfan Liu <piliu@redhat.com>,
        "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
        Shivang Upadhyay <shivangu@linux.ibm.com>,
        Vivek Goyal <vgoyal@redhat.com>, linuxppc-dev@lists.ozlabs.org,
        kexec@lists.infradead.org
Subject: [PATCH v4 3/5] Documentation/ABI: mark old kexec sysfs deprecated
Date: Fri, 14 Nov 2025 10:45:02 +0530
Message-ID: <20251114051504.614937-4-sourabhjain@linux.ibm.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251114051504.614937-1-sourabhjain@linux.ibm.com>
References: <20251114051504.614937-1-sourabhjain@linux.ibm.com>
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
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=KNZXzVFo c=1 sm=1 tr=0 ts=6916baf9 cx=c_pps
 a=5BHTudwdYE3Te8bg5FgnPg==:117 a=5BHTudwdYE3Te8bg5FgnPg==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VnNF1IyMAAAA:8 a=Z4Rwk6OoAAAA:8
 a=20KFwNOVAAAA:8 a=pGLkceISAAAA:8 a=voM4FWlXAAAA:8 a=JfrnYn6hAAAA:8
 a=LRU2jnFezOS3J6eLL00A:9 a=HkZW87K1Qel5hWWM3VKY:22 a=IC2XNlieTeVoXbcui8wp:22
 a=1CNFftbPRP8L7MoqJWF3:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: 37us6_e4IZB3eXXZ_GgE0ONqBVbbVm-O
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE3OSBTYWx0ZWRfXxdEdYr4rd5uP
 ikDVKTeQFx7JlKQpzc8yDBqTxR0yxzJb+ibbsY4QmpoQ7jiSgsCm02hUB1iIETRyke4afIz3YdB
 n3RWgOynETit42dOG5SSSFFvmZp/6qKKOC0JZSeHsScLqvrqgdmcEOdN3ohcBSgAIujsAb9F2Hg
 hAvjgd9ypavZRH/9rCgPIcvdQuVboAOtHC8tw7oZV3dOR3vkcHOBLF/9giaG1ggxRiNdVSj/SnL
 ivg6Dg0AdDUiH/XH0+waL9VhicI0HrUQjSskxVEvA45ZIid0gMeiSmjWmLQMvY/SNzP6uaXQtdh
 sPgP+XwnhDYjOe/tIBSyOn1BUVutDbVy34PGayLwx4P4r7W8DggKOz5zRf/TRDZYX6feL38VrKl
 0g1N25GACU7DaUF0WuSON3fA500fhw==
X-Proofpoint-GUID: 1NhD0UfBbahM1mnVi7L3iZU1ypm3q6_y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 clxscore=1015 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2510240000
 definitions=main-2511130179
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

The previous commit ("kexec: move sysfs entries to /sys/kernel/kexec")
moved all existing kexec sysfs entries to a new location. The ABI
document is updated to include a note about the deprecation of the old
kexec sysfs entries.

The following kexec sysfs entries are deprecated:
- /sys/kernel/kexec_loaded
- /sys/kernel/kexec_crash_loaded
- /sys/kernel/kexec_crash_size
- /sys/kernel/crash_elfcorehdr_size

Cc: Aditya Gupta <adityag@linux.ibm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Baoquan he <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>
Cc: Hari Bathini <hbathini@linux.ibm.com>
Cc: Jiri Bohac <jbohac@suse.cz>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
Cc: Pingfan Liu <piliu@redhat.com>
Cc: Ritesh Harjani (IBM) <ritesh.list@gmail.com>
Cc: Shivang Upadhyay <shivangu@linux.ibm.com>
Cc: Vivek Goyal <vgoyal@redhat.com>
Cc: linuxppc-dev@lists.ozlabs.org
Cc: kexec@lists.infradead.org
Signed-off-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 .../sysfs-kernel-kexec-kdump                     | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)
 rename Documentation/ABI/{testing => obsolete}/sysfs-kernel-kexec-kdump (61%)

diff --git a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
similarity index 61%
rename from Documentation/ABI/testing/sysfs-kernel-kexec-kdump
rename to Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
index 96b24565b68e..96b4d41721cc 100644
--- a/Documentation/ABI/testing/sysfs-kernel-kexec-kdump
+++ b/Documentation/ABI/obsolete/sysfs-kernel-kexec-kdump
@@ -1,3 +1,19 @@
+NOTE: all the ABIs listed in this file are deprecated and will be removed after 2028.
+
+Here are the alternative ABIs:
++------------------------------------+-----------------------------------------+
+| Deprecated                         | Alternative                             |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_loaded           | /sys/kernel/kexec/loaded                |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_loaded     | /sys/kernel/kexec/crash_loaded          |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/kexec_crash_size       | /sys/kernel/kexec/crash_size            |
++------------------------------------+-----------------------------------------+
+| /sys/kernel/crash_elfcorehdr_size  | /sys/kernel/kexec/crash_elfcorehdr_size |
++------------------------------------+-----------------------------------------+
+
+
 What:		/sys/kernel/kexec_loaded
 Date:		Jun 2006
 Contact:	kexec@lists.infradead.org
-- 
2.51.1


