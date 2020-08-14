Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F738244B9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 17:08:13 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BSmyx6KlKzDqmj
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Aug 2020 01:08:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=vaibhav@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=P6TcOYR5; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BSmw44MzqzDqjk
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Aug 2020 01:05:40 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07EF4D5p128363; Fri, 14 Aug 2020 11:05:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=9lfdzU0VXKwmw8ic/GIjVJrz9F+3Dca+bz7+pCbHQpU=;
 b=P6TcOYR5rXv5oFiu55rnML7Z4d6gWNhuIFeUHoEeYxkIQbRyqjRlMexsHWWnNxDoqcwF
 w8PV5Oqj4WcXM4vA+gR4pwqHxTXkx7FPfBCGBP0LZpQ4vwb/MZsMMFkL24e8DTySHy/E
 mJTCPfFimlTxovmgcwN1vWupI5+BTlNT8mvmU7Z8Yues0xubQ9gfS7WzowEVGyvFD/nG
 7Mzc5uzNeh6y3u8B6c38ohyPSgJouxe50pmNn8xaxIJi8Bd4rbdzsmF1TImOCLWTMEDN
 0vGYBi7VoPZQ/WEfBG2YzFAZxUdjp516fGhKIi2WSEcZDArLphoeJoJD3kBrWmymTNJD wA== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32wvxb01x0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 11:05:25 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07EF4H8F028033;
 Fri, 14 Aug 2020 15:05:23 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma06ams.nl.ibm.com with ESMTP id 32skaher6f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 14 Aug 2020 15:05:23 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07EF5Kvr24445262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 14 Aug 2020 15:05:20 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2550F4C040;
 Fri, 14 Aug 2020 15:05:20 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9A104C04A;
 Fri, 14 Aug 2020 15:05:17 +0000 (GMT)
Received: from vajain21-in-ibm-com (unknown [9.199.37.20])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 14 Aug 2020 15:05:17 +0000 (GMT)
Received: by vajain21-in-ibm-com (sSMTP sendmail emulation);
 Fri, 14 Aug 2020 20:35:16 +0530
From: Vaibhav Jain <vaibhav@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-nvdimm@lists.01.org
Subject: [PATCH] libnvdimm: Add a NULL entry to 'nvdimm_firmware_attributes'
Date: Fri, 14 Aug 2020 20:35:09 +0530
Message-Id: <20200814150509.225615-1-vaibhav@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-14_09:2020-08-14,
 2020-08-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0
 priorityscore=1501 mlxlogscore=999 spamscore=0 phishscore=0 clxscore=1015
 mlxscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008140111
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
Cc: Sandipan Das <sandipan@linux.ibm.com>,
 "Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
 Vaibhav Jain <vaibhav@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We recently discovered a kernel oops with 'papr_scm' module while
booting ppc64 phyp guest with following back-trace:

BUG: Kernel NULL pointer dereference on write at 0x00000188
Faulting instruction address: 0xc0000000005d7084
Oops: Kernel access of bad area, sig: 11 [#1]
<snip>
Call Trace:
 internal_create_group+0x128/0x4c0 (unreliable)
 internal_create_groups.part.4+0x70/0x130
 device_add+0x458/0x9c0
 nd_async_device_register+0x28/0xa0 [libnvdimm]
 async_run_entry_fn+0x78/0x1f0
 process_one_work+0x2c0/0x5b0
 worker_thread+0x88/0x650
 kthread+0x1a8/0x1b0
 ret_from_kernel_thread+0x5c/0x6c

A bisect lead to the 'commit 48001ea50d17f ("PM, libnvdimm: Add runtime
firmware activation support")' and on investigation discovered that
the newly introduced 'struct attribute *nvdimm_firmware_attributes[]'
is missing a terminating NULL entry in the array. This causes a loop
in sysfs's 'create_files()' to read garbage beyond bounds of
'nvdimm_firmware_attributes' and trigger the oops.

Fixes: 48001ea50d17f ("PM, libnvdimm: Add runtime firmware activation support")
Reported-by: Sandipan Das <sandipan@linux.ibm.com>
Signed-off-by: Vaibhav Jain <vaibhav@linux.ibm.com>
---
 drivers/nvdimm/dimm_devs.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvdimm/dimm_devs.c b/drivers/nvdimm/dimm_devs.c
index 61374def51555..b59032e0859b7 100644
--- a/drivers/nvdimm/dimm_devs.c
+++ b/drivers/nvdimm/dimm_devs.c
@@ -529,6 +529,7 @@ static DEVICE_ATTR_ADMIN_RW(activate);
 static struct attribute *nvdimm_firmware_attributes[] = {
 	&dev_attr_activate.attr,
 	&dev_attr_result.attr,
+	NULL,
 };
 
 static umode_t nvdimm_firmware_visible(struct kobject *kobj, struct attribute *a, int n)
-- 
2.26.2

