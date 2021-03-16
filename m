Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A9CC33D301
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 12:28:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F09z80zXJz30Qb
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 22:28:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=pF5QvQYV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=pF5QvQYV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F09yj0SpBz304N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 22:28:28 +1100 (AEDT)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12GB4cnf150043; Tue, 16 Mar 2021 07:28:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=Ycbu2W70yndoPL5AYTF2Wymc+L6jERxNonZxv6IcLfs=;
 b=pF5QvQYVMJdarbn2cH8TTKxorVI52Fzvf2KhkHbQbmxC+QGTX8tlAyADgqrNoD/PHxvI
 2rXSkDGie2/2kPNHm+UpzCXY2FB4hgmJnOQ0V/H+dGgOO348qMVeisGgU2Row42vjfqK
 pIuRoLmT8kWb8GTNX7p7LZC8Tf/MpqwI9knP1kEdKgWtel+011DKHTwfI0l1CLSz6FvP
 Kr4mDe7e/KeVhqidesh2B2d5f1UDDKIjKhhgW/Gr8oqJvdmenD0xO3eJ4VLXo61IWV/0
 T7R4QW6Uf3m0VW7NYThCp5nTDWHumNFFDrBoiY7b9fJhl2Im5fVUoY2G2M4IkV9dywzD Zg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ap2t9t8k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 07:28:18 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12GBNIRP061310;
 Tue, 16 Mar 2021 07:28:17 -0400
Received: from ppma03fra.de.ibm.com (6b.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.107])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37ap2t9t7s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 07:28:17 -0400
Received: from pps.filterd (ppma03fra.de.ibm.com [127.0.0.1])
 by ppma03fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12GBN83l030822;
 Tue, 16 Mar 2021 11:28:16 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03fra.de.ibm.com with ESMTP id 378n189f8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Mar 2021 11:28:15 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12GBSDxS60948972
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Mar 2021 11:28:13 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 81B234C044;
 Tue, 16 Mar 2021 11:28:13 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C66354C040;
 Tue, 16 Mar 2021 11:28:11 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Mar 2021 11:28:11 +0000 (GMT)
Date: Tue, 16 Mar 2021 16:58:11 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: C?dric Le Goater <clg@kaod.org>
Subject: Re: [PATCH] powerpc/numa: Fix topology_physical_package_id() on
 pSeries
Message-ID: <20210316112811.GA2339179@linux.vnet.ibm.com>
References: <20210312143154.3181109-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210312143154.3181109-1-clg@kaod.org>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-16_03:2021-03-16,
 2021-03-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 clxscore=1011
 impostorscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2009150000 definitions=main-2103160076
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>, Greg Kurz <groug@kaod.org>,
 Vasant Hegde <hegdevasant@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* C?dric Le Goater <clg@kaod.org> [2021-03-12 15:31:54]:

> Initial commit 15863ff3b8da ("powerpc: Make chip-id information
> available to userspace") introduce a cpu_to_chip_id() routine for the
> PowerNV platform using the "ibm,chip-id" property to query the chip id
> of a CPU. But PAPR does not specify such a property and the node id
> query is broken.
>
> Use cpu_to_node() instead which guarantees to have a correct value on
> all platforms, PowerNV an pSeries.
>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Cc: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
> Cc: Vasant Hegde <hegdevasant@linux.vnet.ibm.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>  arch/powerpc/include/asm/topology.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>

(Sorry I somehow managed to mangle to-address. Hence resending this mail
again)

While this looks good to me, @mpe had reservations on using nid as chip-id.
https://lore.kernel.org/linuxppc-dev/87lfwhypv0.fsf@concordia.ellerman.id.au/t/#u
He may be okay with using nid as a "virtual" package id in a pseries
environment.

Reviewed-by: Srikar Dronamraju <srikar@linux.vnet.ibm.com>

[---=| TOFU protection by t-prot: 24 lines snipped |=---]

--
Thanks and Regards
Srikar Dronamraju


> diff --git a/arch/powerpc/include/asm/topology.h b/arch/powerpc/include/asm/topology.h
> index 3beeb030cd78..887c42a4e43d 100644
> --- a/arch/powerpc/include/asm/topology.h
> +++ b/arch/powerpc/include/asm/topology.h
> @@ -123,7 +123,7 @@ static inline int cpu_to_coregroup_id(int cpu)
>  #ifdef CONFIG_PPC64
>  #include <asm/smp.h>
>
> -#define topology_physical_package_id(cpu)	(cpu_to_chip_id(cpu))
> +#define topology_physical_package_id(cpu)	(cpu_to_node(cpu))
>
>  #define topology_sibling_cpumask(cpu)	(per_cpu(cpu_sibling_map, cpu))
>  #define topology_core_cpumask(cpu)	(cpu_cpu_mask(cpu))
> --
> 2.26.2
>

--
Thanks and Regards
Srikar Dronamraju
