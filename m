Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FD36D579
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Jul 2019 21:52:48 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45qPth74p1zDqRt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jul 2019 05:52:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nathanl@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45qPlz5hmJzDqdP
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 Jul 2019 05:46:55 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6IJiCDJ013338
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:46:52 -0400
Received: from e32.co.us.ibm.com (e32.co.us.ibm.com [32.97.110.150])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ttvjvxat6-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 15:46:52 -0400
Received: from localhost
 by e32.co.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <nathanl@linux.ibm.com>;
 Thu, 18 Jul 2019 20:46:51 +0100
Received: from b03cxnp08026.gho.boulder.ibm.com (9.17.130.18)
 by e32.co.us.ibm.com (192.168.1.132) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 18 Jul 2019 20:46:50 +0100
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6IJknW025362724
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:46:49 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 282E3C6057
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:46:49 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F823C6055
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:46:48 +0000 (GMT)
Received: from localhost (unknown [9.41.101.192])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Jul 2019 19:46:48 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 1/2] powerpc/rtas: use device model APIs and serialization
 during LPM
In-Reply-To: <20190718192940.16103-2-nathanl@linux.ibm.com>
References: <20190718192940.16103-1-nathanl@linux.ibm.com>
 <20190718192940.16103-2-nathanl@linux.ibm.com>
Date: Thu, 18 Jul 2019 14:46:43 -0500
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
x-cbid: 19071819-0004-0000-0000-0000152C07A8
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011453; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000287; SDB=6.01234063; UDB=6.00650301; IPR=6.01015390; 
 MB=3.00027784; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-18 19:46:51
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071819-0005-0000-0000-00008C853689
Message-Id: <87tvbj2kik.fsf@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-18_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=880 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907180202
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

Nathan Lynch <nathanl@linux.ibm.com> writes:

> During LPAR migration, cpu hotplug and migration operations can
> interleave like so:
>
> cd /sys/devices/system/cpu/cpu7/ | drmgr -m -c pmig -p pre \
> echo 0 > online                  | -s 0xd7a884f83d830e6d -t 19 \
> echo 1 > online                  | -n -d 1 5
> ---------------------------------+-------------------------------------------
> online_store() {                 |
>   device_offline() {             |
>     cpu_subsys_offline() {       |
>       cpu_down(7);               |
>     }                            |
>     dev->offline = true;         |
>   }                              | migration_store() {
> }                                |   rtas_ibm_suspend_me() {
>                                  |     rtas_online_cpus_mask() {
>                                  |       cpu_up(7);
> 				 |     }
>                                  |     cpu_hotplug_disable();
>                                  |     on_each_cpu(rtas_percpu_suspend_me());
>                                  |     cpu_hotplug_enable();
> online_store() {                 |
>   device_online() {              |
>     cpu_subsys_online() {        |
>       cpu_up(7);                 |
>     }                            |
>     dev->offline = false;        |
>   }                              |     rtas_offline_cpus_mask() {
> }                                |       rtas_cpu_state_change_mask() {
>                                  |         cpu_down(7);
> 				 |       }
> 				 |     }
> 				 |   }
> 				 | }

Actually I think this isn't a correct depiction of the race. I'll
rewrite and resend.

