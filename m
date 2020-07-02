Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CC0BC212229
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 13:24:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49yG384hRqzDqnr
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Jul 2020 21:24:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49yG1H6k6hzDqng
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Jul 2020 21:23:15 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 062B35Q1106284; Thu, 2 Jul 2020 07:23:11 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320ss3ubp6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 07:23:11 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 062B5X2Y114827;
 Thu, 2 Jul 2020 07:23:11 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 320ss3ubnd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 07:23:11 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 062BH5tL024933;
 Thu, 2 Jul 2020 11:23:09 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 31wwch5kv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Jul 2020 11:23:08 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 062BN6CT64028808
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Jul 2020 11:23:06 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B9F0642042;
 Thu,  2 Jul 2020 11:23:06 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A4E504203F;
 Thu,  2 Jul 2020 11:23:05 +0000 (GMT)
Received: from [9.85.87.208] (unknown [9.85.87.208])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  2 Jul 2020 11:23:05 +0000 (GMT)
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.14\))
Subject: [powerpc][next-20200701] Hung task timeouts during regression test
 runs
Message-Id: <CDAB3931-FAAD-443A-A9CD-362E527043A1@linux.vnet.ibm.com>
Date: Thu, 2 Jul 2020 16:53:04 +0530
To: linuxppc-dev@lists.ozlabs.org, linux-block@vger.kernel.org
X-Mailer: Apple Mail (2.3445.104.14)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-02_04:2020-07-02,
 2020-07-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 cotscore=-2147483648 spamscore=0 clxscore=1011 phishscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 mlxlogscore=967 suspectscore=0 mlxscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2007020078
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
Cc: axboe@kernel.dk, Linux Next Mailing List <linux-next@vger.kernel.org>,
 ming.lei@redhat.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Starting with linux-next 20200701 release I am observing automated =
regressions
tests taking longer time to complete. A test which took 10 minutes with =
next-20200630
took more than 60 minutes against next-20200701.=20

Following hung task timeout messages were seen during these runs

[ 1718.848351]       Not tainted 5.8.0-rc3-next-20200701-autotest #1
[ 1718.848356] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" =
disables this message.
[ 1718.848362] NetworkManager  D    0  2626      1 0x00040080
[ 1718.848367] Call Trace:
[ 1718.848374] [c0000008b0f6b8f0] [c000000000c6d558] schedule+0x78/0x130 =
(unreliable)
[ 1718.848382] [c0000008b0f6bad0] [c00000000001b070] =
__switch_to+0x2e0/0x480
[ 1718.848388] [c0000008b0f6bb30] [c000000000c6ce9c] =
__schedule+0x2cc/0x910
[ 1718.848394] [c0000008b0f6bc10] [c000000000c6d558] schedule+0x78/0x130
[ 1718.848401] [c0000008b0f6bc40] [c0000000005d5a64] =
jbd2_log_wait_commit+0xd4/0x1a0
[ 1718.848408] [c0000008b0f6bcc0] [c00000000055fb6c] =
ext4_sync_file+0x1cc/0x480
[ 1718.848415] [c0000008b0f6bd20] [c000000000493530] =
vfs_fsync_range+0x70/0xf0
[ 1718.848421] [c0000008b0f6bd60] [c000000000493638] do_fsync+0x58/0xd0
[ 1718.848427] [c0000008b0f6bda0] [c0000000004936d8] sys_fsync+0x28/0x40
[ 1718.848433] [c0000008b0f6bdc0] [c000000000035e28] =
system_call_exception+0xf8/0x1c0
[ 1718.848440] [c0000008b0f6be20] [c00000000000ca70] =
system_call_common+0xf0/0x278

Comparing next-20200630 with next-20200701 one possible candidate seems =
to
be following commit:

commit 37f4a24c2469a10a4c16c641671bd766e276cf9f
    blk-mq: centralise related handling into blk_mq_get_driver_tag

Reverting this commit allows the test to complete in 10 minutes.

Thanks
-Sachin

