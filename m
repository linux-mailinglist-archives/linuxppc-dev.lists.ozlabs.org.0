Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C53AE18AED4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 09:55:58 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jgjl11Y5zDr5g
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 19:55:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=sachinp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jgdx1hdDzDr5s
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 19:52:36 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J8XfDQ053833
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 04:52:34 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yu8bsjp7f-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 04:52:34 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <sachinp@linux.vnet.ibm.com>;
 Thu, 19 Mar 2020 08:52:28 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 19 Mar 2020 08:52:24 -0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J8qMSx54657268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 08:52:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0EE2811C05B;
 Thu, 19 Mar 2020 08:52:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C9D1611C058;
 Thu, 19 Mar 2020 08:52:17 +0000 (GMT)
Received: from [9.85.82.238] (unknown [9.85.82.238])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 08:52:17 +0000 (GMT)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [RFC 1/2] mm, slub: prevent kmalloc_node crashes and memory leaks
From: Sachin Sant <sachinp@linux.vnet.ibm.com>
In-Reply-To: <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
Date: Thu, 19 Mar 2020 14:22:13 +0530
Content-Transfer-Encoding: quoted-printable
References: <20200318144220.18083-1-vbabka@suse.cz>
 <20200318160610.GD26049@in.ibm.com>
 <e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse.cz>
To: Vlastimil Babka <vbabka@suse.cz>
X-Mailer: Apple Mail (2.3445.104.11)
X-TM-AS-GCONF: 00
x-cbid: 20031908-0008-0000-0000-0000035FE18C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031908-0009-0000-0000-00004A813E9D
Message-Id: <0F67B5AA-96DF-4977-BDC6-D72959B3F7EF@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-19_01:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=747 spamscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190039
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>,
 Mel Gorman <mgorman@techsingularity.net>, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>, linux-mm@kvack.org,
 Kirill Tkhai <ktkhai@virtuozzo.com>, David Rientjes <rientjes@google.com>,
 Christopher Lameter <cl@linux.com>, bharata@linux.ibm.com,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


> OK how about this version? It's somewhat ugly, but important is that =
the fast
> path case (c->page exists) is unaffected and another common case =
(c->page is
> NULL, but node is NUMA_NO_NODE) is just one extra check - impossible =
to avoid at
> some point anyway.
>=20

I attempted the suggested tests.

Test 1: March 18 linux-next + Patch 1 [1] + Patch  2 [2]

Machine boots fine. numactl o/p after boot:

# numactl -H
available: 2 nodes (0-1)
node 0 cpus:
node 0 size: 0 MB
node 0 free: 0 MB
node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 =
23 24 25 26 27 28 29 30 31
node 1 size: 35631 MB
node 1 free: 32724 MB
node distances:
node   0   1
  0:  10  40
  1:  40  10
#

Test 2: Code base as used in Test 1 + 3 patch series from Srikar [3]

Machine boots fine. numactl o/p after boot:

# numactl -H
available: 1 nodes (1)
node 1 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20 21 22 =
23 24 25 26 27 28 29 30 31
node 1 size: 35631 MB
node 1 free: 32711 MB
node distances:
node   1
  1:  10
#

Thanks!
-Sachin


[1] =
https://lore.kernel.org/linux-mm/e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse=
.cz/T/#mb8d0a358dc5c5fb9661fa45047072a92c510faf2
[2] =
https://lore.kernel.org/linux-mm/e060ad43-ff4e-0e59-2e64-ce8a4916ec70@suse=
.cz/T/#mce342e54a95ce2ee3043901e52d70ee2fd94c516
[3] =
https://lore.kernel.org/linux-mm/20200311110237.5731-1-srikar@linux.vnet.i=
bm.com/=

