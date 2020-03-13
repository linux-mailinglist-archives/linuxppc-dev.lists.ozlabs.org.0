Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9D11845B8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 12:15:41 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48f35k3Z0rzDqQb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Mar 2020 22:15:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48f32g00JFzDqHh
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 22:12:58 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02DB4JOu074357
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 07:12:56 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yr17j11eg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 13 Mar 2020 07:12:56 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Fri, 13 Mar 2020 11:12:53 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 13 Mar 2020 11:12:50 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02DBCn8064749782
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 13 Mar 2020 11:12:49 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62D584C04E;
 Fri, 13 Mar 2020 11:12:49 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1F7CF4C040;
 Fri, 13 Mar 2020 11:12:47 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Fri, 13 Mar 2020 11:12:46 +0000 (GMT)
Date: Fri, 13 Mar 2020 16:42:46 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [5.6.0-rc2-next-20200218/powerpc] Boot failure on POWER9
References: <c412ee69-80f9-b013-67d4-3b0a2f6aff7f@suse.cz>
 <dd450314-d428-6776-af07-f92c04c7b967@suse.cz>
 <20200227121214.GE3771@dhcp22.suse.cz>
 <52EF4673-7292-4C4C-B459-AF583951BA48@linux.vnet.ibm.com>
 <9a86f865-50b5-7483-9257-dbb08fecd62b@suse.cz>
 <20200227182650.GG3771@dhcp22.suse.cz>
 <20200310150114.GO8447@dhcp22.suse.cz>
 <87a74lix5p.fsf@mpe.ellerman.id.au>
 <F0FBAD4E-3257-4DFD-BFE2-4AD7D811CFB3@linux.vnet.ibm.com>
 <875zf8y1i1.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <875zf8y1i1.fsf@mpe.ellerman.id.au>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 20031311-0020-0000-0000-000003B3BD01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031311-0021-0000-0000-0000220C14F7
Message-Id: <20200313111246.GB25144@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-13_04:2020-03-12,
 2020-03-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 spamscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=971 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003130057
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
Reply-To: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>, Michal Hocko <mhocko@kernel.org>,
 Pekka Enberg <penberg@kernel.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Paul Mackerras <paulus@samba.org>, Vlastimil Babka <vbabka@suse.cz>,
 David Rientjes <rientjes@google.com>, Christopher Lameter <cl@linux.com>,
 linuxppc-dev@lists.ozlabs.org, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 Kirill Tkhai <ktkhai@virtuozzo.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2020-03-13 21:48:06]:

> Sachin Sant <sachinp@linux.vnet.ibm.com> writes:
> >> The patch below might work. Sachin can you test this? I tried faking up
> >> a system with a memoryless node zero but couldn't get it to even start
> >> booting.
> >> 
> > The patch did not help. The kernel crashed during
> > the boot with the same call trace.
> >
> > BUG_ON() introduced with the patch was not triggered.
> 
> OK, that's weird.
> 
> I eventually managed to get a memoryless node going in sim, and it
> appears to work there.
> 
> eg in dmesg:
> 
>   [    0.000000][    T0] numa:   NODE_DATA [mem 0x2000fffa2f80-0x2000fffa7fff]
>   [    0.000000][    T0] numa:     NODE_DATA(0) on node 1
>   [    0.000000][    T0] numa:   NODE_DATA [mem 0x2000fff9df00-0x2000fffa2f7f]
>   ...
>   [    0.000000][    T0] Early memory node ranges
>   [    0.000000][    T0]   node   1: [mem 0x0000000000000000-0x00000000ffffffff]
>   [    0.000000][    T0]   node   1: [mem 0x0000200000000000-0x00002000ffffffff]
>   [    0.000000][    T0] Could not find start_pfn for node 0
>   [    0.000000][    T0] Initmem setup node 0 [mem 0x0000000000000000-0x0000000000000000]
>   [    0.000000][    T0] On node 0 totalpages: 0
>   [    0.000000][    T0] Initmem setup node 1 [mem 0x0000000000000000-0x00002000ffffffff]
>   [    0.000000][    T0] On node 1 totalpages: 131072
>   
>   # dmesg | grep set_numa
>   [    0.000000][    T0] set_numa_mem: mem node for 0 = 1
>   [    0.005654][    T0] set_numa_mem: mem node for 1 = 1
> 
> So is the problem more than just node zero having no memory?
> 

The problem would happen with possible nodes which are not yet present. i.e
no cpus, no memory attached to those nodes.

Please look at
http://lore.kernel.org/lkml/20200312131438.GB3277@linux.vnet.ibm.com/t/#u
for more details.

The summary being: pgdat/Node_Data for such nodes is not allocated. Hence
the node_present_pages(nid) called  where nid is a possible but not yet
present node fails. Currently node_present_pages(nid) and node_to_mem_node
don't seem to be equipped to handle possible but not present nodes.

> cheers

-- 
Thanks and Regards
Srikar Dronamraju

