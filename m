Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A6B7573DC2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jul 2022 22:24:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LjpyB1FMgz3cD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jul 2022 06:24:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dw8mY3L/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dw8mY3L/;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LjpxT2cnGz3bkr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jul 2022 06:24:12 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26DJ6wYP019073;
	Wed, 13 Jul 2022 20:24:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=pCM1H302PUOtkQaNuZh4e/rZzZBJ8tRZ0ZMYLUTIRrg=;
 b=dw8mY3L/YP5hJNnIRUGdHaw1FdrPhTf9vMA7AnmyJwUnxiMDqVa/ukSr0/mpuruZA9IS
 nTyr81+UeKUP1h2gxXlnHYii9DpY7F/uKDzGQiLTKk84HciYhDb15J7T1xKHiE7TXL41
 o3xx0esHJOFtEhmuzJ32sJBmfH3dZGy5F8bwjqCo8ippr2akrimVFZ5BZjGlb059S3ol
 U+HFfN/+eM8cSlqk7snX14X/4hRICGPXLXIbdJPV2JvLGT2Vbqgt2N/wUN7y0s8qbuAS
 oGMeEgyu3dTDsD7YWcYauFux/5CO2pBTdnsc006VbUuTNx1s7U8I98lwrEgO5g7Hxizc sg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha3x21jae-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:03 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26DJfXRh019286;
	Wed, 13 Jul 2022 20:24:03 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3ha3x21j9u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:02 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26DJhqmW006274;
	Wed, 13 Jul 2022 20:24:01 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
	by ppma04wdc.us.ibm.com with ESMTP id 3h71a9p9ph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Jul 2022 20:24:01 +0000
Received: from b03ledav002.gho.boulder.ibm.com (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
	by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26DKO0YP34537884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Jul 2022 20:24:00 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6816B136055;
	Wed, 13 Jul 2022 20:24:00 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4D326136051;
	Wed, 13 Jul 2022 20:24:00 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 13 Jul 2022 20:24:00 +0000 (GMT)
From: Scott Cheloha <cheloha@linux.ibm.com>
To: linux-watchdog@vger.kernel.org
Subject: [PATCH v3 0/4] pseries-wdt: initial support for H_WATCHDOG-based watchdog timers
Date: Wed, 13 Jul 2022 15:23:31 -0500
Message-Id: <20220713202335.1217647-1-cheloha@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dnFMmuK0Rq9bw24mh5CgcczPKBGvaSmc
X-Proofpoint-GUID: Vur-kwFOk8Co4dsm77sZqSsCnt9jf-Sq
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-13_07,2022-07-13_03,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=955 spamscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2206140000
 definitions=main-2207130073
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org, linux@roeck-us.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

PAPR v2.12 defines a new hypercall, H_WATCHDOG.  This patch series
adds support for this hypercall to powerpc/pseries kernels and
introduces a new watchdog driver, "pseries-wdt", for the virtual
timers exposed by the hypercall.

This series is preceded by the following:

RFC v1: https://lore.kernel.org/linux-watchdog/20220413165104.179144-1-cheloha@linux.ibm.com/
RFC v2: https://lore.kernel.org/linux-watchdog/20220509174357.5448-1-cheloha@linux.ibm.com/
PATCH v1: https://lore.kernel.org/linux-watchdog/20220520183552.33426-1-cheloha@linux.ibm.com/
PATCH v2: https://lore.kernel.org/linux-watchdog/20220602175353.68942-1-cheloha@linux.ibm.com/

Changes of note from PATCH v2:

- Don't keep a pointer to the platform device at registration
  time.  We don't use the pointer for anything and we cannot
  hotplug the "device".

- Drop the GETFIELD() and SETFIELD() macros: Michael Ellerman really
  doesn't like them.  Use plain integer constants and custom bitfield
  extraction macros for the capability output instead.

  (After making the change I can see the upside to plain constants.)

- Actually use PSERIES_WDTQ_MAX_NUMBER(): check that the hypervisor
  gave us at least one timer to work with.

- Use MSEC_PER_SEC in a few places instead of the literal 1000 to
  show the reader what we're doing.

- Use "reverse xmas tree" sorting for automatic variable declarations.

- Note where the max_timeout of (UINT_MAX / 1000) comes from.

- Nix email addresses from the MODULE_AUTHOR() macros, they tend to
  rot.


