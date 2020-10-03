Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 18BC6282228
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 09:52:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C3Jwg15fMzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Oct 2020 17:52:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=kjain@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oapfx58n; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C3JtV6BMGzDqL2
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Oct 2020 17:50:07 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0937V8Up033989; Sat, 3 Oct 2020 03:49:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=wdD5NS4k8Wnbikc7J0uxBk4l7fyW4sIFg6NF/1CbCo4=;
 b=oapfx58nv1cgRjO7K6rFcas9MbzKbKl8xf6C/nrKl7Ig4XHpigBqh3rcLiIDCRWSJCWP
 nPtOeH5gNXd9zwKkBLOQyDx8elAG6zy268vJwbLnZ821vXNkT0bYRWUkia4jJo7cie7v
 hatHLTS+/KpuPpib6ck71601AHHT/1Cm6QhTt6nLk2VggGDilWIg7S8wqv0Qsap5J8/y
 hdug26HfLkYO2RZyLKKaQ+z0LduRJzuB66OUXxlg4f6bW7GNILorqAhKCedO7IEgNZnb
 y/mt4SI56jFxaE5w+xqpehudCKOZzb4DoZ7jjCDvr/UZ6xoa6G9kQHd0TFH9TbFGawFx 0Q== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33xkv2hfa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 03:49:59 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0937Wvpb002215;
 Sat, 3 Oct 2020 07:49:58 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 33xgjh06sn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 03 Oct 2020 07:49:58 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0937nt8c19792234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 3 Oct 2020 07:49:55 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88E944C046;
 Sat,  3 Oct 2020 07:49:55 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 05E264C040;
 Sat,  3 Oct 2020 07:49:54 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.199.50.127])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Sat,  3 Oct 2020 07:49:53 +0000 (GMT)
From: Kajol Jain <kjain@linux.ibm.com>
To: mpe@ellerman.id.au, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] powerpc/hv-gpci: Fix starting index value
Date: Sat,  3 Oct 2020 13:19:39 +0530
Message-Id: <20201003074943.338618-1-kjain@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-10-03_03:2020-10-02,
 2020-10-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 bulkscore=0 mlxlogscore=902 priorityscore=1501 malwarescore=0
 impostorscore=0 clxscore=1011 lowpriorityscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010030063
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
Cc: kjain@linux.ibm.com, suka@us.ibm.com, maddy@linux.vnet.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Commit 9e9f60108423f ("powerpc/perf/{hv-gpci, hv-common}: generate
requests with counters annotated") adds a framework for defining
gpci counters.
In this patch, they adds starting_index value as '0xffffffffffffffff'.
which is wrong as starting_index is of size 32 bits.

Because of this, incase we try to run hv-gpci event we get error.

In power9 machine:

command#: perf stat -e hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
          -C 0 -I 1000
event syntax error: '..bie_count_and_time_tlbie_instructions_issued/'
                                  \___ value too big for format, maximum is 4294967295

This patch fix this issue and changes starting_index value to '0xffffffff'

After this patch:

command#: perf stat -e hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/ -C 0 -I 1000
     1.000085786              1,024      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
     2.000287818              1,024      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/
^C     2.439113909             17,408      hv_gpci/system_tlbie_count_and_time_tlbie_instructions_issued/

Fixes: 9e9f60108423f ("powerpc/perf/{hv-gpci, hv-common}: generate
requests with counters annotated")
Signed-off-by: Kajol Jain <kjain@linux.ibm.com>
---
 arch/powerpc/perf/hv-gpci-requests.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/perf/hv-gpci-requests.h b/arch/powerpc/perf/hv-gpci-requests.h
index e608f9db12dd..8965b4463d43 100644
--- a/arch/powerpc/perf/hv-gpci-requests.h
+++ b/arch/powerpc/perf/hv-gpci-requests.h
@@ -95,7 +95,7 @@ REQUEST(__field(0,	8,	partition_id)
 
 #define REQUEST_NAME system_performance_capabilities
 #define REQUEST_NUM 0x40
-#define REQUEST_IDX_KIND "starting_index=0xffffffffffffffff"
+#define REQUEST_IDX_KIND "starting_index=0xffffffff"
 #include I(REQUEST_BEGIN)
 REQUEST(__field(0,	1,	perf_collect_privileged)
 	__field(0x1,	1,	capability_mask)
@@ -223,7 +223,7 @@ REQUEST(__field(0,	2, partition_id)
 
 #define REQUEST_NAME system_hypervisor_times
 #define REQUEST_NUM 0xF0
-#define REQUEST_IDX_KIND "starting_index=0xffffffffffffffff"
+#define REQUEST_IDX_KIND "starting_index=0xffffffff"
 #include I(REQUEST_BEGIN)
 REQUEST(__count(0,	8,	time_spent_to_dispatch_virtual_processors)
 	__count(0x8,	8,	time_spent_processing_virtual_processor_timers)
@@ -234,7 +234,7 @@ REQUEST(__count(0,	8,	time_spent_to_dispatch_virtual_processors)
 
 #define REQUEST_NAME system_tlbie_count_and_time
 #define REQUEST_NUM 0xF4
-#define REQUEST_IDX_KIND "starting_index=0xffffffffffffffff"
+#define REQUEST_IDX_KIND "starting_index=0xffffffff"
 #include I(REQUEST_BEGIN)
 REQUEST(__count(0,	8,	tlbie_instructions_issued)
 	/*
-- 
2.26.2

