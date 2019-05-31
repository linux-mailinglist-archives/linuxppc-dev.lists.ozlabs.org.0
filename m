Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737C30E79
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 15:02:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45Fl3F4zs2zDqYX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2019 23:02:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=sachinp@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45Fl1R5xYQzDqYB
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 23:00:42 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4VCvXT2120767
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 09:00:36 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2su2d8wes6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2019 09:00:35 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Fri, 31 May 2019 14:00:33 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 31 May 2019 14:00:32 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4VD0Wx749610840
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 31 May 2019 13:00:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EB94E42059;
 Fri, 31 May 2019 13:00:31 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EFDB42054;
 Fri, 31 May 2019 13:00:31 +0000 (GMT)
Received: from [9.85.94.205] (unknown [9.85.94.205])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 31 May 2019 13:00:30 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: [next-20190530] Boot failure on PowerPC
Date: Fri, 31 May 2019 18:30:28 +0530
To: linuxppc-dev@lists.ozlabs.org, linux-next@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 19053113-4275-0000-0000-0000033AA229
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19053113-4276-0000-0000-0000384AA765
Message-Id: <79EEB945-661A-41AD-8B26-2FD3B3F84697@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-31_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=562 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905310083
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Latest next fails to boot with a kernel panic on POWER9.

[   33.689332] Kernel panic - not syncing: stack-protector: Kernel stack =
is corrupted in: write_irq_affinity.isra.5+0x15c/0x160
[   33.689346] CPU: 35 PID: 4907 Comm: irqbalance Not tainted =
5.2.0-rc2-next-20190530-autotest-autotest #1
[   33.689352] Call Trace:
[   33.689356] [c0000018d974bab0] [c000000000b5328c] =
dump_stack+0xb0/0xf4 (unreliable)
[   33.689364] [c0000018d974baf0] [c000000000120694] panic+0x16c/0x408
[   33.689370] [c0000018d974bb80] [c00000000012010c] =
__stack_chk_fail+0x2c/0x30
[   33.689376] [c0000018d974bbe0] [c0000000001b859c] =
write_irq_affinity.isra.5+0x15c/0x160
[   33.689383] [c0000018d974bd30] [c0000000004d6f30] =
proc_reg_write+0x90/0x110
[   33.689388] [c0000018d974bd60] [c00000000041453c] =
__vfs_write+0x3c/0x70
[   33.689394] [c0000018d974bd80] [c000000000418650] =
vfs_write+0xd0/0x250
[   33.689399] [c0000018d974bdd0] [c000000000418a2c] =
ksys_write+0x7c/0x130
[   33.689405] [c0000018d974be20] [c00000000000b688] =
system_call+0x5c/0x70

Machine boots till login prompt and then panics few seconds later.

Last known next build was May 24th. Will attempt few builds till May 30 =
to
narrow down this problem.

Thanks
-Sachin=

