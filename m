Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7528D9DE4E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:59:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HfqZ0XxqzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:59:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=srikar@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46Hfng26fQzDqYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 16:57:26 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7R6uumI113614
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 02:57:24 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2umvee6583-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 02:57:23 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <srikar@linux.vnet.ibm.com>;
 Tue, 27 Aug 2019 07:57:21 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 27 Aug 2019 07:57:19 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7R6vIXV51642488
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Aug 2019 06:57:18 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BEDC2AE051;
 Tue, 27 Aug 2019 06:57:18 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB033AE053;
 Tue, 27 Aug 2019 06:57:17 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Tue, 27 Aug 2019 06:57:17 +0000 (GMT)
Date: Tue, 27 Aug 2019 12:27:17 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
Subject: Re: [PATCH 2/3] powerpc/numa: Early request for home node
 associativity
References: <20190822144235.19398-1-srikar@linux.vnet.ibm.com>
 <20190822144235.19398-3-srikar@linux.vnet.ibm.com>
 <20190823071632.GA10037@sathnaga86>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190823071632.GA10037@sathnaga86>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
x-cbid: 19082706-0016-0000-0000-000002A36217
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082706-0017-0000-0000-00003303AB39
Message-Id: <20190827065717.GA18467@linux.vnet.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-26_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908270077
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Satheesh,

> > Currently the kernel detects if its running on a shared lpar platform
> > and requests home node associativity before the scheduler sched_domains
> > are setup. However between the time NUMA setup is initialized and the
> > request for home node associativity, workqueue initializes its per node
> > cpumask. The per node workqueue possible cpumask may turn invalid
> > after home node associativity resulting in weird situations like
> > workqueue possible cpumask being a subset of workqueue online cpumask.
> 
> Env:
> HW: Power8
> Host/Guest Kernel: 5.3.0-rc5-00172-g13e3f1076e29 (linux master + this series)
> Qemu: 4.0.90 (v4.1.0-rc3)
> 
> Guest Config:
> ..
>  <vcpu placement='static' current='2'>4</vcpu>
> ...
>     <kernel>/home/kvmci/linux/vmlinux</kernel>
>     <cmdline>root=/dev/sda2 rw console=tty0 console=ttyS0,115200 init=/sbin/init  initcall_debug numa=debug crashkernel=1024M selinux=0</cmdline>
> ...
>   <topology sockets='1' cores='2' threads='2'/>
>     <numa>
>       <cell id='0' cpus='0-1' memory='2097152' unit='KiB'/>
>       <cell id='1' cpus='2-3' memory='2097152' unit='KiB'/>
>     </numa>
> 
> Event: 
> vcpu hotplug
> 
> [root@atest-guest ~]# [   41.447170] random: crng init done
> [   41.448153] random: 7 urandom warning(s) missed due to ratelimiting
> [   51.727256] VPHN hcall succeeded. Reset polling...
> [   51.826301] adding cpu 2 to node 1
> [   51.856238] WARNING: workqueue cpumask: online intersect > possible intersect
> [   51.916297] VPHN hcall succeeded. Reset polling...
> [   52.036272] adding cpu 3 to node 1
> 

Thanks for testing.

The fix for this patch series was to make sure per node workqueue possible
cpus is updated correctly at boot. However Node hotplug on KVM guests and
dlpar on PowerVM lpars aren't covered by this patch series. On systems that
support shared processor, the associativity of the possible cpus is not
known at boot time. Hence we will not be able to update the per node
workquque possible cpumask.

-- 
Thanks and Regards
Srikar Dronamraju

