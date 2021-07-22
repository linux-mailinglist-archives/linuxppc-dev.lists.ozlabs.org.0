Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DCFC13D2F9B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 00:14:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GW6Dk5jSRz3d7P
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Jul 2021 08:14:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RkYaczTQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=farosas@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RkYaczTQ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GW6CJ4g68z2yLV
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Jul 2021 08:13:00 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MM4sk4121264; Thu, 22 Jul 2021 18:12:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=CdIed8pgKw8xd17qCIny49qTMss9zf+NWVpx9upcE7o=;
 b=RkYaczTQaFZlMytoiizoaE3MlLOoE0mNJ1q3nlgx7HtcGQh0YPSKF3EBR9hMx+Yf2rnz
 0+S44qT9b+swlhk7zdRVKrC0zDQkM5y05TC4br32ySwPDNJBKiEOPwYoAzqAwI7bZAXJ
 I6l6ivdaEzVtNN9NG38A+2W/HEgRtC2RJQ+AgAtnUYLw4pd2A/wYXE3kbkjYWAR7bSB3
 Eiu24VCYisUpiRT9kzl7rPFPIKo8aeScvh1xDACHIyzJEw6t3vEQHElflTH1bk/DBFGM
 2aMxWISJF/RBDYIrJQ63KnNZqoY96dGODFNCSM7Tp6RzNN0y1jXvgH4SyMV+r0FSWdSY KQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ygq0rvp4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 18:12:48 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MM6QiR128743;
 Thu, 22 Jul 2021 18:12:48 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39ygq0rvnu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 18:12:48 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MM2qjc016445;
 Thu, 22 Jul 2021 22:12:47 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01wdc.us.ibm.com with ESMTP id 39upue8qkv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 22:12:47 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16MMCkkV53805514
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 22:12:46 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28153C6059;
 Thu, 22 Jul 2021 22:12:46 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0B4BC605D;
 Thu, 22 Jul 2021 22:12:44 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.86.55])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 22:12:44 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: kvm-ppc@vger.kernel.org
Subject: [PATCH v4 0/2] KVM: PPC: Book3S HV: Nested guest state sanitising
 changes
Date: Thu, 22 Jul 2021 19:12:38 -0300
Message-Id: <20210722221240.2384655-1-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B0Sqpx73plO0ode4knbnXlQnkd-9xoIe
X-Proofpoint-GUID: dZ9tIuu2OhzkSQYY8URkmsHuy07bVTB6
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_16:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxlogscore=866 clxscore=1015 mlxscore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220142
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This series still aims to stop contaminating the l2_hv structure with
bits that might have come from L1 state.

Patch 1 makes l2_hv read-only (mostly). It is now only changed when we
explicitly want to pass information to L1.

Patch 2 makes sure that L1 is not forwarded HFU interrupts when the
host has decided to disable any facilities (theoretical for now, since
HFSCR bits are always the same between L1/Ln).

Changes since v3:

- now passing lpcr separately into load_l2_hv_regs to solve the
  conflict with commit a19b70abc69a ("KVM: PPC: Book3S HV: Nested move
  LPCR sanitising to sanitise_hv_regs");

- patch 2 now forwards a HEAI instead of injecting a Program.

v3:

- removed the sanitise functions;
- moved the entry code into a new load_l2_hv_regs and the exit code
  into the existing save_hv_return_state;
- new patch: removes the cause bits when L0 has disabled the
  corresponding facility.

https://lkml.kernel.org/r/20210415230948.3563415-1-farosas@linux.ibm.com

v2:

- made the change more generic, not only applies to hfscr anymore;
- sanitisation is now done directly on the vcpu struct, l2_hv is left unchanged.

https://lkml.kernel.org/r/20210406214645.3315819-1-farosas@linux.ibm.com

v1:
https://lkml.kernel.org/r/20210305231055.2913892-1-farosas@linux.ibm.com

Fabiano Rosas (2):
  KVM: PPC: Book3S HV: Sanitise vcpu registers in nested path
  KVM: PPC: Book3S HV: Stop forwarding all HFUs to L1

 arch/powerpc/kvm/book3s_hv_nested.c | 125 +++++++++++++++++-----------
 1 file changed, 75 insertions(+), 50 deletions(-)

-- 
2.29.2

