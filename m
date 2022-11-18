Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E2E62F8FA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 16:12:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NDKyZ3Plpz3f2x
	for <lists+linuxppc-dev@lfdr.de>; Sat, 19 Nov 2022 02:12:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/nPKlxt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k/nPKlxt;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NDKsX5L99z3bdC
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 19 Nov 2022 02:08:00 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AIEenNN010402
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=cYybJa5v+oL+qK55VBTqek5Q1n+rbdugBKyoMSliWkw=;
 b=k/nPKlxtwl+iFWQIbWNvghDESEgfIQRGMDqNFeBNYmiQrsFBnJrRqbG8NySpp19mfni5
 60Ck0o1Ji5bdrH60Yvke/belA85m6BKLahSZRo1zfJbFErPYLLe7C40pm+L/Lju6BMk4
 fk7fv7bggI2DZapmHoy32xv+s6wWU4My6GJOpCqPjIEK0s+E3QHtr7Szog3jOXKl5BuO
 B4DBw/ycSkzQM53fS9IZeD2F5tuoMXmc1Tgy0kvJ+jGAniBmnSpNiO5jeFE1K+x+wTHg
 LexbtTTsYj5/WAkaGMksTHo7Ch/M9M5gr9IjwdkP0M//7gatMDENNruq2hAO/0K4DIIZ pg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxawk29ju-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2AIEpYYA016013
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 15:07:55 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kxawk29ja-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:54 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AIF72TL008888;
	Fri, 18 Nov 2022 15:07:53 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma01wdc.us.ibm.com with ESMTP id 3kt34a096p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 15:07:53 +0000
Received: from smtpav06.wdc07v.mail.ibm.com ([9.208.128.115])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AIF7qtv4719196
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 15:07:52 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18A0258056;
	Fri, 18 Nov 2022 15:07:52 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D25EB5804E;
	Fri, 18 Nov 2022 15:07:51 +0000 (GMT)
Received: from localhost (unknown [9.211.69.164])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 15:07:51 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 00/13] RTAS maintenance
Date: Fri, 18 Nov 2022 09:07:38 -0600
Message-Id: <20221118150751.469393-1-nathanl@linux.ibm.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: wjjxs2EvrWC9bbJ7QlgCKak5Bd34MhQc
X-Proofpoint-ORIG-GUID: jz5hqwuYd2LqYdzbDK3LhyiTMvpKRd__
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-18_03,2022-11-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=999 impostorscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211180088
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
Cc: tyreld@linux.ibm.com, nnac123@linux.ibm.com, ldufour@linux.ibm.com, ajd@linux.ibm.com, npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

A collection of loosely-related RTAS code changes, most notably:

* Fixing misuses of rtas_token() for non-function properties.
* The stronger validation for sys_rtas() offered by the
  PPC_RTAS_FILTER config option is always enabled.
* Improved function token lookups, including efficient "reverse"
  token-to-name mappings.
* Static tracepoints for RTAS entry and exit.

Nathan Lynch (13):
  powerpc/rtas: document rtas_call()
  powerpc/rtasd: use correct OF API for event scan rate
  powerpc/rtas: avoid device tree lookups in rtas_os_term()
  powerpc/rtas: avoid scheduling in rtas_os_term()
  powerpc/pseries/eeh: use correct API for error log size
  powerpc/rtas: clean up rtas_error_log_max initialization
  powerpc/rtas: clean up includes
  powerpc/rtas: define pr_fmt and convert printk call sites
  powerpc/rtas: mandate RTAS syscall filtering
  powerpc/rtas: improve function information lookups
  powerpc/rtas: strengthen do_enter_rtas() type safety, drop inline
  powerpc/tracing: tracepoints for RTAS entry and exit
  powerpc/rtas: place tracepoints in do_enter_rtas()

 arch/powerpc/Kconfig                         |  13 -
 arch/powerpc/include/asm/rtas.h              | 102 +-
 arch/powerpc/include/asm/trace.h             | 116 +++
 arch/powerpc/kernel/rtas.c                   | 961 +++++++++++++++----
 arch/powerpc/kernel/rtasd.c                  |   7 +-
 arch/powerpc/platforms/pseries/eeh_pseries.c |   2 +-
 6 files changed, 986 insertions(+), 215 deletions(-)

-- 
2.37.1

