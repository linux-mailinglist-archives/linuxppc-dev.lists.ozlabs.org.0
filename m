Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B98915E6BDB
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Sep 2022 21:40:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MYQc34Zdsz3cdm
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Sep 2022 05:40:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dyo4/Mim;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dyo4/Mim;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MYQYx4vQbz3bqw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Sep 2022 05:38:29 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28MJbBmf030933;
	Thu, 22 Sep 2022 19:38:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=/gvip40Cjs4rl8pNl1FIAxG45esfx0k/1rSLIcN5b6Y=;
 b=dyo4/Mim/buXLyBU/vS9yw6B8t6uL6i2epAn3TUHFJe8qsdhZUPAtKTTLgoinWRE/Bdu
 0LxP166i0x5rB/JIIQJRvB21pO/qMW5vjw+Q522R16t6RAx3MghZQOMLVXhdwIu580gv
 f3H2vDGrABnQfyYbk9gqPnrnUboqOGRUKlVQJ2JVACIPMeOc5B4gnrMPCLPvbZGgP+8f
 ZGZeb+b47JFnWum0j5W67YEo4mw4VRFVqCKnxTiguWFt76W8B4eSux3CrswBg4kxEZwp
 8k93uuDDWrCBjwBkF4aKPbCpEjdmPHEmOAXHCtbdpZS1+sgca4ZQciA0PGe9VhR0DExN sA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jrwpd8jgm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 19:38:19 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28MJZDK8011293;
	Thu, 22 Sep 2022 19:38:19 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma03dal.us.ibm.com with ESMTP id 3jn5va3jxb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Sep 2022 19:38:19 +0000
Received: from smtpav06.dal12v.mail.ibm.com ([9.208.128.130])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28MJcGKX55312696
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 22 Sep 2022 19:38:17 GMT
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4168F5805F;
	Thu, 22 Sep 2022 19:38:17 +0000 (GMT)
Received: from smtpav06.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E0945805D;
	Thu, 22 Sep 2022 19:38:17 +0000 (GMT)
Received: from localhost (unknown [9.41.178.242])
	by smtpav06.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 22 Sep 2022 19:38:17 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-security-module@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] powerpc/pseries: restrict error injection and DT changes when locked down
Date: Thu, 22 Sep 2022 14:38:15 -0500
Message-Id: <20220922193817.106041-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PLyb9hbhpFhTVYl4PHQG37RUQ_ny_e0W
X-Proofpoint-GUID: PLyb9hbhpFhTVYl4PHQG37RUQ_ny_e0W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-22_14,2022-09-22_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 mlxlogscore=854
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2209130000 definitions=main-2209220126
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
Cc: ajd@linux.ibm.com, nayna@linux.ibm.com, jmorris@namei.org, paul@paul-moore.com, gcwilson@linux.ibm.com, serge@hallyn.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add two new lockdown reasons for use in powerpc's pseries platform
code.

The pseries platform allows hardware-level error injection via certain
calls to the RTAS (Run Time Abstraction Services) firmware. ACPI-based
error injection is already restricted in lockdown; this facility
should be restricted for the same reasons.

pseries also allows nearly arbitrary device tree changes via
/proc/powerpc/ofdt. Just as overriding ACPI tables is not allowed
while locked down, so should this facility be restricted.

Nathan Lynch (2):
  powerpc/pseries: block untrusted device tree changes when locked down
  powerpc/rtas: block error injection when locked down

 arch/powerpc/kernel/rtas.c                | 25 ++++++++++++++++++++++-
 arch/powerpc/platforms/pseries/reconfig.c |  5 +++++
 include/linux/security.h                  |  2 ++
 security/security.c                       |  2 ++
 4 files changed, 33 insertions(+), 1 deletion(-)

-- 
2.37.3

