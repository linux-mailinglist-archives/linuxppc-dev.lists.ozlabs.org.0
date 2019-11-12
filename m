Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5074BF8855
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 07:01:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BxvS5gPyzF4Lx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 17:01:24 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=abdhalee@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47Bxs06QGPzF3X5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 16:59:09 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 xAC5upED013407; Tue, 12 Nov 2019 00:59:04 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7nus1uqe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 00:59:03 -0500
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id xAC5x3Hf017018;
 Tue, 12 Nov 2019 00:59:03 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2w7nus1uq0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 00:59:03 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id xAC5sfo3028381;
 Tue, 12 Nov 2019 05:59:02 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma01dal.us.ibm.com with ESMTP id 2w5n36b1x2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 12 Nov 2019 05:59:02 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xAC5x2H150528654
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 12 Nov 2019 05:59:02 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 02CE46A04D;
 Tue, 12 Nov 2019 05:59:02 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8E2FC6A047;
 Tue, 12 Nov 2019 05:58:59 +0000 (GMT)
Received: from [9.199.43.206] (unknown [9.199.43.206])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 12 Nov 2019 05:58:58 +0000 (GMT)
Message-ID: <1573538337.1382.3.camel@abdul>
Subject: net-next branch fails to build on my P8 CI system
From: Abdul Haleem <abdhalee@linux.vnet.ibm.com>
To: linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Date: Tue, 12 Nov 2019 11:28:57 +0530
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-11-12_01:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1910280000 definitions=main-1911120053
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
Cc: netdev <netdev@vger.kernel.org>, David Miller <davem@davemloft.net>,
 Eric Dumazet <eric.dumazet@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Greeting's

I see a build failure for net-next branch on my Power 8 system

13:25:10 ERROR| [stderr] ./include/linux/u64_stats_sync.h: In function 64_stats_read�:
13:25:10 ERROR| [stderr] ./include/linux/u64_stats_sync.h:80:2: warning: passing argument 1 of 鈥榣ocal_read鈥� discards 鈥榗onst鈥� qualifier from pointer target type [enabled by default]
13:25:10 ERROR| [stderr]   return local64_read(&p->v);
13:25:10 ERROR| [stderr]   ^
13:25:10 ERROR| [stderr] In file included from ./include/asm-generic/local64.h:22:0,
13:25:10 ERROR| [stderr]                  from ./arch/powerpc/include/generated/asm/local64.h:1,
13:25:10 ERROR| [stderr]                  from ./include/linux/u64_stats_sync.h:72,
13:25:10 ERROR| [stderr]                  from ./include/linux/cgroup-defs.h:20,
13:25:10 ERROR| [stderr]                  from ./include/linux/cgroup.h:28,
13:25:10 ERROR| [stderr]                  from ./include/linux/memcontrol.h:13,
13:25:10 ERROR| [stderr]                  from ./include/linux/swap.h:9,
13:25:10 ERROR| [stderr]                  from ./include/linux/suspend.h:5,
13:25:10 ERROR| [stderr]                  from init/do_mounts.c:7:
13:25:10 ERROR| [stderr] ./arch/powerpc/include/asm/local.h:20:24: note: expected 鈥榮truct local_t *鈥� but argument is of type 鈥榗onst struct local_t *鈥�
13:25:10 ERROR| [stderr]  static __inline__ long local_read(local_t *l)
13:25:10 ERROR| [stderr]                         ^
13:25:11 ERROR| [stderr] In file included from ./include/linux/cgroup-defs.h:20:0,
13:25:11 ERROR| [stderr]                  from ./include/linux/cgroup.h:28,
13:25:11 ERROR| [stderr]                  from ./include/linux/hugetlb.h:9,
13:25:11 ERROR| [stderr]                  from arch/powerpc/kvm/book3s_64_vio_hv.c:16:
13:25:11 ERROR| [stderr] ./include/linux/u64_stats_sync.h: In function 鈥榰64_stats_read鈥�:
13:25:11 ERROR| [stderr] ./include/linux/u64_stats_sync.h:80:2: error: passing argument 1 of 鈥榣ocal_read鈥� discards 鈥榗onst鈥� qualifier from pointer target type [-Werror]
13:25:11 ERROR| [stderr]   return local64_read(&p->v);
13:25:11 ERROR| [stderr]   ^

I see some recent code changes here

9dfd871481c8e9c512938e9ce632beed645363e0 Merge branch 'u64_stats_t'
fd2f4737870eb866537fbbffa2b59414b9b0c0a2 net: use u64_stats_t in struct
pcpu_lstats
5260dd3ed1ff7eba39251b28977e4d8950e2f099 tun: switch to u64_stats_t
316580b69d0a7aeeee5063af47438b626bc47cbd u64_stats: provide u64_stats_t
type


-- 
Regard's

Abdul Haleem
IBM Linux Technology Centre



