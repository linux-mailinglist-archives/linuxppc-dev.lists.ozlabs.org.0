Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FDB4B9F83
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 13:01:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jzthg4mdyz3cKM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Feb 2022 23:01:23 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rk1u9ymX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=naveen.n.rao@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=rk1u9ymX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jztgy5YVMz3bb9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Feb 2022 23:00:46 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21HBddKk030523; 
 Thu, 17 Feb 2022 12:00:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=RPK02i33myDKA4bIkfBDslJjVJucaG1dFf32Qm6oCgE=;
 b=rk1u9ymXsuEs3djR5ElAft4xFo4MRy4bFLpasvqVsK46eYuEiMBA81wE25tRWlORrpk8
 nM3xTNqufSc02jOvf4YeleHIkMGr77nlB0NVyYuUPkKZMUcsVPmMxHb3oIFJJgvgv56g
 AkiLu1nOZoKtjdU+CRj3WdMI0PkzJADUn90fLa4g4i/QtCcEuJRLMMsykV/jBry3vpjd
 A3S7sTPbqyYt8mDlN+ohJ1uACV37mQxEo4Dr8OhlIvAgNNfH/nt+ooT5tg+AjyIwxGKQ
 cTjk7iIXX+2cPATrWE2J7SfLkFn/CprV/GRw/TX94y5t/WJo1IusAuiSiUAI0+GhnHZ/ pA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9k53kyju-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 12:00:10 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21HBrw4A016454;
 Thu, 17 Feb 2022 12:00:09 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e9k53kyh6-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 12:00:09 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21HBZwAv022806;
 Thu, 17 Feb 2022 11:36:46 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma05fra.de.ibm.com with ESMTP id 3e64ha7782-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Feb 2022 11:36:45 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21HBahp937028328
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Feb 2022 11:36:43 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91A4352071;
 Thu, 17 Feb 2022 11:36:42 +0000 (GMT)
Received: from li-NotSettable.ibm.com.com (unknown [9.43.115.39])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 1E43852065;
 Thu, 17 Feb 2022 11:36:39 +0000 (GMT)
From: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Daniel Borkmann <daniel@iogearbox.net>,
 Alexei Starovoitov <alexei.starovoitov@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>,
 Masami Hiramatsu <mhiramat@kernel.org>
Subject: [PATCH 0/3] powerpc/ftrace: Reserve instructions from function entry
 for ftrace
Date: Thu, 17 Feb 2022 17:06:22 +0530
Message-Id: <cover.1645096227.git.naveen.n.rao@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.27.0
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: DQ6MhTknBE0_u8Dy8aNbZyxfn4xTp6Am
X-Proofpoint-GUID: 16gxvXOI1def_ltGAETNZW6zLj_LE4PB
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-17_04,2022-02-17_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 mlxlogscore=564 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202170051
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
Cc: bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Previously discussed here:
https://lore.kernel.org/20220207102454.41b1d6b5@gandalf.local.home

- Naveen


Naveen N. Rao (3):
  powerpc/ftrace: Reserve instructions from function entry for ftrace
  bpf/trampoline: Allow ftrace location to differ from trampoline attach
    address
  kprobes: Allow probing on any address belonging to ftrace

 arch/powerpc/include/asm/ftrace.h  |  15 ++++
 arch/powerpc/kernel/trace/ftrace.c | 110 ++++++++++++++++++++++++++---
 kernel/bpf/trampoline.c            |   2 -
 kernel/kprobes.c                   |  12 ++++
 kernel/trace/ftrace.c              |   2 +
 5 files changed, 129 insertions(+), 12 deletions(-)


base-commit: 1b43a74f255c5c00db25a5fedfd75ca0dc029022
-- 
2.35.1

