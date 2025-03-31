Return-Path: <linuxppc-dev+bounces-7405-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FF5A7701A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Mar 2025 23:28:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZRPPv4Mkgz2yfy;
	Tue,  1 Apr 2025 08:28:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1743456216;
	cv=none; b=nkPcaQEsTEpQG5IJObHumKJZfQVmBrl3SLeySErc2cNm6zLtSduQYNNF0en8gW3WEU9LXawlyK8orawFzmaqxw4f0L0Ld0FKp+kSUZpScPPKgGnTwpyVFQHq1w2G2Ga3Mo8qOMmFAmyZZ55JIsyKOuVKafRjjv2MvusxXZ4KO1kJxixEVmcX0yURiPYxkcrv7HR5klECMy8RdwH+l3ucUUn11oLz7Oq9Fr3tsJ5bDiDiUH+Z/t46hh5ScCxK85/ECxgQ+AP3mY4nLJ+e/xnTEc5GiaDvmkPI6ZYUgMT5RNenVnmgZWmtGPlYAQowVD3XTuH+vZLrY/WxGT60JDr4PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1743456216; c=relaxed/relaxed;
	bh=h7Wd3R+xtuHOUBlciY9KLp43yYz1DlWsRo6b9mr/Z7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iRKPLiX8LIW+EEYhB9TdfQwnDTGgksAY6n1JAz1D4r/qqKC9IANg6B/rBWdLb3/TPxr+GCpCEI3fuTgDkexCoRWOkSWTfyQwDSgmWqDvmy5Cs02CT+yebkMXjf60/ndiDoU0uxHBUCzc2xUHEBdVZtWtiBz9C2yYWfDLGm3idsIpJ9DXhIUVutpSRl8HU4Yx5xbxtNY9YDQVWEMPrr1nsPgalJjl/vrHzIp8GlsgvtbH65VWVK3E3Xvn18OnmXl66uBQEDMxzuZIlMBXQMB7cRU0RVFu6LjcDQ4JxOXehoY7nMRdi0AVBLhoXjdNaO9+7CkzTH6LOddvoWCjDJcXmQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OzoHgU80; dkim-atps=neutral; spf=pass (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OzoHgU80;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=davemarq@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZRPJ72z9cz2yfS
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Apr 2025 08:23:34 +1100 (AEDT)
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52VCRtRJ026641;
	Mon, 31 Mar 2025 21:23:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=h7Wd3R+xtuHOUBlciY9KLp43yYz1DlWsRo6b9mr/Z
	7E=; b=OzoHgU806jyTEkriy5f+EYk/MD1p/3Jiurun1ub5SVMe1IQbVK0+Ip1GP
	0TL7R3jy+ufWf6449K5wVOtyTQ3dJxIvSiBdjLThjzCSXFg7yfXPZtis/T6NIFPG
	ucR9JprITca2o/HoVHGjKBi0q/c6RfF3yRmoFhZYM9OU5kGx0c0Y9UShZn3utx4k
	irD9cISUEle7/7/PAl2VC0DOgn/CTaLv+rx315gXzEaxAKxbIQ6ylwZQGvEVbQb6
	8ZtQ+oSJIXRnbtbrXRcO17x0FmS1VbV7/vDpWW7bUevWPRU8ilhz52gjm6lld/3V
	C8AjphTeUDCEGz0QkodIRevBbdsNQ==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 45qu32ag3r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 21:23:31 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 52VJiHTx006585;
	Mon, 31 Mar 2025 21:23:31 GMT
Received: from smtprelay03.dal12v.mail.ibm.com ([172.16.1.5])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 45pwdk7d1q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 31 Mar 2025 21:23:31 +0000
Received: from smtpav06.wdc07v.mail.ibm.com (smtpav06.wdc07v.mail.ibm.com [10.39.53.233])
	by smtprelay03.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 52VLNUOc18612746
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 31 Mar 2025 21:23:30 GMT
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D99FA58055;
	Mon, 31 Mar 2025 21:23:29 +0000 (GMT)
Received: from smtpav06.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 90F735803F;
	Mon, 31 Mar 2025 21:23:29 +0000 (GMT)
Received: from d.attlocal.net (unknown [9.61.66.20])
	by smtpav06.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 31 Mar 2025 21:23:29 +0000 (GMT)
From: davemarq@linux.ibm.com
To: netdev@vger.kernel.org
Cc: linuxppc-dev@lists.ozlabs.org, Dave Marquardt <davemarq@linux.ibm.com>,
        Nick Child <nnac123@linux.ibm.com>
Subject: [PATCH net] net: ibmveth: make veth_pool_store stop hanging
Date: Mon, 31 Mar 2025 16:23:28 -0500
Message-ID: <20250331212328.109496-1-davemarq@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
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
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: w8NdtwRDo0FP-QQLeRyznIUP1s2zuL5O
X-Proofpoint-ORIG-GUID: w8NdtwRDo0FP-QQLeRyznIUP1s2zuL5O
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503310144
X-Spam-Status: No, score=-1.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
	SPF_PASS,WEIRD_PORT autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Dave Marquardt <davemarq@linux.ibm.com>

Use rtnl_mutex to synchronize veth_pool_store with itself,
ibmveth_close and ibmveth_open, preventing multiple calls in a row to
napi_disable.

Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
Fixes: 860f242eb534 ("[PATCH] ibmveth change buffer pools dynamically")
Reviewed-by: Nick Child <nnac123@linux.ibm.com>
---
In working on removing BUG_ON calls from ibmveth, I realized that 2
threads could call veth_pool_store through writing to
/sys/devices/vio/30000002/pool*/*. You can do this easily with a little
shell script.

Running on a 6.14 kernel, I saw a hang:

    [  243.683282][  T108] INFO: task stress.sh:5829 blocked for more than 122 seconds.
    [  243.683300][  T108]       Not tainted 6.14.0-01103-g2df0c02dab82 #3
    [  243.683303][  T108] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
    [  366.563278][  T108] INFO: task stress.sh:5829 blocked for more than 245 seconds.
    [  366.563297][  T108]       Not tainted 6.14.0-01103-g2df0c02dab82 #3
    [  366.563301][  T108] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.

I configured LOCKDEP, compiled ibmveth.c with DEBUG, and built a new
kernel. I ran the test again and saw:

    Setting pool0/active to 0
    Setting pool1/active to 1
    [   73.911067][ T4365] ibmveth 30000002 eth0: close starting
    Setting pool1/active to 1
    Setting pool1/active to 0
    [   73.911367][ T4366] ibmveth 30000002 eth0: close starting
    [   73.916056][ T4365] ibmveth 30000002 eth0: close complete
    [   73.916064][ T4365] ibmveth 30000002 eth0: open starting
    [  110.808564][  T712] systemd-journald[712]: Sent WATCHDOG=1 notification.
    [  230.808495][  T712] systemd-journald[712]: Sent WATCHDOG=1 notification.
    [  243.683786][  T123] INFO: task stress.sh:4365 blocked for more than 122 seconds.
    [  243.683827][  T123]       Not tainted 6.14.0-01103-g2df0c02dab82-dirty #8
    [  243.683833][  T123] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
    [  243.683838][  T123] task:stress.sh       state:D stack:28096 pid:4365  tgid:4365  ppid:4364   task_flags:0x400040 flags:0x00042000
    [  243.683852][  T123] Call Trace:
    [  243.683857][  T123] [c00000000c38f690] [0000000000000001] 0x1 (unreliable)
    [  243.683868][  T123] [c00000000c38f840] [c00000000001f908] __switch_to+0x318/0x4e0
    [  243.683878][  T123] [c00000000c38f8a0] [c000000001549a70] __schedule+0x500/0x12a0
    [  243.683888][  T123] [c00000000c38f9a0] [c00000000154a878] schedule+0x68/0x210
    [  243.683896][  T123] [c00000000c38f9d0] [c00000000154ac80] schedule_preempt_disabled+0x30/0x50
    [  243.683904][  T123] [c00000000c38fa00] [c00000000154dbb0] __mutex_lock+0x730/0x10f0
    [  243.683913][  T123] [c00000000c38fb10] [c000000001154d40] napi_enable+0x30/0x60
    [  243.683921][  T123] [c00000000c38fb40] [c000000000f4ae94] ibmveth_open+0x68/0x5dc
    [  243.683928][  T123] [c00000000c38fbe0] [c000000000f4aa20] veth_pool_store+0x220/0x270
    [  243.683936][  T123] [c00000000c38fc70] [c000000000826278] sysfs_kf_write+0x68/0xb0
    [  243.683944][  T123] [c00000000c38fcb0] [c0000000008240b8] kernfs_fop_write_iter+0x198/0x2d0
    [  243.683951][  T123] [c00000000c38fd00] [c00000000071b9ac] vfs_write+0x34c/0x650
    [  243.683958][  T123] [c00000000c38fdc0] [c00000000071bea8] ksys_write+0x88/0x150
    [  243.683966][  T123] [c00000000c38fe10] [c0000000000317f4] system_call_exception+0x124/0x340
    [  243.683973][  T123] [c00000000c38fe50] [c00000000000d05c] system_call_vectored_common+0x15c/0x2ec
    ...
    [  243.684087][  T123] Showing all locks held in the system:
    [  243.684095][  T123] 1 lock held by khungtaskd/123:
    [  243.684099][  T123]  #0: c00000000278e370 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x50/0x248
    [  243.684114][  T123] 4 locks held by stress.sh/4365:
    [  243.684119][  T123]  #0: c00000003a4cd3f8 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x88/0x150
    [  243.684132][  T123]  #1: c000000041aea888 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x154/0x2d0
    [  243.684143][  T123]  #2: c0000000366fb9a8 (kn->active#64){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x160/0x2d0
    [  243.684155][  T123]  #3: c000000035ff4cb8 (&dev->lock){+.+.}-{3:3}, at: napi_enable+0x30/0x60
    [  243.684166][  T123] 5 locks held by stress.sh/4366:
    [  243.684170][  T123]  #0: c00000003a4cd3f8 (sb_writers#3){.+.+}-{0:0}, at: ksys_write+0x88/0x150
    [  243.684183][  T123]  #1: c00000000aee2288 (&of->mutex#2){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x154/0x2d0
    [  243.684194][  T123]  #2: c0000000366f4ba8 (kn->active#64){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x160/0x2d0
    [  243.684205][  T123]  #3: c000000035ff4cb8 (&dev->lock){+.+.}-{3:3}, at: napi_disable+0x30/0x60
    [  243.684216][  T123]  #4: c0000003ff9bbf18 (&rq->__lock){-.-.}-{2:2}, at: __schedule+0x138/0x12a0

From the ibmveth debug, two threads are calling veth_pool_store, which
calls ibmveth_close and ibmveth_open. Here's the sequence:

  T4365             T4366             
  ----------------- ----------------- ---------
  veth_pool_store   veth_pool_store   
                    ibmveth_close     
  ibmveth_close                       
  napi_disable                        
                    napi_disable      
  ibmveth_open                        
  napi_enable                         <- HANG

ibmveth_close calls napi_disable at the top and ibmveth_open calls
napi_enable at the top.

https://docs.kernel.org/networking/napi.html]] says

  The control APIs are not idempotent. Control API calls are safe
  against concurrent use of datapath APIs but an incorrect sequence of
  control API calls may result in crashes, deadlocks, or race
  conditions. For example, calling napi_disable() multiple times in a
  row will deadlock.

In the normal open and close paths, rtnl_mutex is acquired to prevent
other callers. This is missing from veth_pool_store. Use rtnl_mutex in
veth_pool_store fixes these hangs.


 drivers/net/ethernet/ibm/ibmveth.c | 27 +++++++++++++++++++++++----
 1 file changed, 23 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index b619a3ec245b..77ef19a53e72 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1802,18 +1802,24 @@ static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
 	long value = simple_strtol(buf, NULL, 10);
 	long rc;
 
+	rtnl_lock();
+
 	if (attr == &veth_active_attr) {
 		if (value && !pool->active) {
 			if (netif_running(netdev)) {
 				if (ibmveth_alloc_buffer_pool(pool)) {
 					netdev_err(netdev,
 						   "unable to alloc pool\n");
+					rtnl_unlock();
 					return -ENOMEM;
 				}
 				pool->active = 1;
 				ibmveth_close(netdev);
-				if ((rc = ibmveth_open(netdev)))
+				rc = ibmveth_open(netdev);
+				if (rc) {
+					rtnl_unlock();
 					return rc;
+				}
 			} else {
 				pool->active = 1;
 			}
@@ -1833,44 +1839,57 @@ static ssize_t veth_pool_store(struct kobject *kobj, struct attribute *attr,
 
 			if (i == IBMVETH_NUM_BUFF_POOLS) {
 				netdev_err(netdev, "no active pool >= MTU\n");
+				rtnl_unlock();
 				return -EPERM;
 			}
 
 			if (netif_running(netdev)) {
 				ibmveth_close(netdev);
 				pool->active = 0;
-				if ((rc = ibmveth_open(netdev)))
+				rc = ibmveth_open(netdev);
+				if (rc) {
+					rtnl_unlock();
 					return rc;
+				}
 			}
 			pool->active = 0;
 		}
 	} else if (attr == &veth_num_attr) {
 		if (value <= 0 || value > IBMVETH_MAX_POOL_COUNT) {
+			rtnl_unlock();
 			return -EINVAL;
 		} else {
 			if (netif_running(netdev)) {
 				ibmveth_close(netdev);
 				pool->size = value;
-				if ((rc = ibmveth_open(netdev)))
+				rc = ibmveth_open(netdev);
+				if (rc) {
+					rtnl_unlock();
 					return rc;
+				}
 			} else {
 				pool->size = value;
 			}
 		}
 	} else if (attr == &veth_size_attr) {
 		if (value <= IBMVETH_BUFF_OH || value > IBMVETH_MAX_BUF_SIZE) {
+			rtnl_unlock();
 			return -EINVAL;
 		} else {
 			if (netif_running(netdev)) {
 				ibmveth_close(netdev);
 				pool->buff_size = value;
-				if ((rc = ibmveth_open(netdev)))
+				rc = ibmveth_open(netdev);
+				if (rc) {
+					rtnl_unlock();
 					return rc;
+				}
 			} else {
 				pool->buff_size = value;
 			}
 		}
 	}
+	rtnl_unlock();
 
 	/* kick the interrupt handler to allocate/deallocate pools */
 	ibmveth_interrupt(netdev->irq, netdev);

base-commit: 4f1eaabb4b66a1f7473f584e14e15b2ac19dfaf3
-- 
2.49.0


