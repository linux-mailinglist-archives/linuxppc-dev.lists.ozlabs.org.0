Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0323C168442
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 17:57:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48PHgJ5sDhzDqnp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 22 Feb 2020 03:57:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48PHdG0GtMzDqhD
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 22 Feb 2020 03:55:13 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01LGoEHi117932; Fri, 21 Feb 2020 11:55:09 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yafh90r5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 11:55:09 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01LGoWxu007908;
 Fri, 21 Feb 2020 16:55:08 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 2y68976f5x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 21 Feb 2020 16:55:08 +0000
Received: from b01ledav002.gho.pok.ibm.com (b01ledav002.gho.pok.ibm.com
 [9.57.199.107])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01LGt8n249021336
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 21 Feb 2020 16:55:08 GMT
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 011C6124052;
 Fri, 21 Feb 2020 16:55:08 +0000 (GMT)
Received: from b01ledav002.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D051A124053;
 Fri, 21 Feb 2020 16:55:07 +0000 (GMT)
Received: from localhost (unknown [9.41.179.160])
 by b01ledav002.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 21 Feb 2020 16:55:07 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH v2 5/5] Documentation: Document sysfs interfaces purr,
 spurr, idle_purr, idle_spurr
In-Reply-To: <1582262314-8319-6-git-send-email-ego@linux.vnet.ibm.com>
References: <1582262314-8319-1-git-send-email-ego@linux.vnet.ibm.com>
 <1582262314-8319-6-git-send-email-ego@linux.vnet.ibm.com>
Date: Fri, 21 Feb 2020 10:55:07 -0600
Message-ID: <87blprubh0.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-21_05:2020-02-21,
 2020-02-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=1 lowpriorityscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002210127
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
Cc: Tyrel Datwyler <tyreld@linux.ibm.com>, linux-kernel@vger.kernel.org,
 Kamalesh Babulal <kamalesh@linux.vnet.ibm.com>,
 "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Gautham R. Shenoy" <ego@linux.vnet.ibm.com> writes:
> diff --git a/Documentation/ABI/testing/sysfs-devices-system-cpu b/Documentation/ABI/testing/sysfs-devices-system-cpu
> index 2e0e3b4..799dc737a 100644
> --- a/Documentation/ABI/testing/sysfs-devices-system-cpu
> +++ b/Documentation/ABI/testing/sysfs-devices-system-cpu
> @@ -580,3 +580,42 @@ Description:	Secure Virtual Machine
>  		If 1, it means the system is using the Protected Execution
>  		Facility in POWER9 and newer processors. i.e., it is a Secure
>  		Virtual Machine.
> +
> +What: 		/sys/devices/system/cpu/cpuX/purr
> +Date:		Apr 2005
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Description:	PURR ticks for this CPU since the system boot.
> +
> +		The Processor Utilization Resources Register (PURR) is
> +		a 64-bit counter which provides an estimate of the
> +		resources used by the CPU thread. The contents of this
> +		register increases monotonically. This sysfs interface
> +		exposes the number of PURR ticks for cpuX.
> +
> +What: 		/sys/devices/system/cpu/cpuX/spurr
> +Date:		Dec 2006
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Description:	SPURR ticks for this CPU since the system boot.
> +
> +		The Scaled Processor Utilization Resources Register
> +		(SPURR) is a 64-bit counter that provides a frequency
> +		invariant estimate of the resources used by the CPU
> +		thread. The contents of this register increases
> +		monotonically. This sysfs interface exposes the number
> +		of SPURR ticks for cpuX.
> +
> +What: 		/sys/devices/system/cpu/cpuX/idle_purr
> +Date:		Nov 2019
> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Description:	PURR ticks for cpuX when it was idle.
> +
> +		This sysfs interface exposes the number of PURR ticks
> +		for cpuX when it was idle.
> +
> +What: 		/sys/devices/system/cpu/cpuX/spurr

Copy-paste error? This should be:

                        /sys/devices/system/cpu/cpuX/idle_spurr

> +Date:		Nov 2019

And I suppose Nov 2019 is no longer accurate.


> +Contact:	Linux for PowerPC mailing list <linuxppc-dev@ozlabs.org>
> +Description:	SPURR ticks for cpuX when it was idle.
> +
> +		This sysfs interface exposes the number of SPURR ticks
> +		for cpuX when it was idle.
> -- 
> 1.9.4
