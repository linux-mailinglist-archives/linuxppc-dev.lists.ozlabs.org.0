Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5764C24650C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 13:02:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVWMg3b2qzDqVQ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 21:02:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=n80BAZ2j; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVWKH4yZzzDqGZ
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 21:00:03 +1000 (AEST)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HAC90Z162685; Mon, 17 Aug 2020 06:59:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=SMFzGlkvGUomhZqEZhXBCoWUEI0g8f7afW8n/5s9q/0=;
 b=n80BAZ2jRzAeXt/9Tkb5AgCqnhU7lJ4NoaULytLIE8VfuCeADAJ6Wz18uX975SUw54YO
 3ioEbn7przm51PL4MiMclYTLAq1eNBUixq1pJir5xha+q2XtcEMZcMZXN0K9uALeI0AG
 TO8u5oCq7LD09N8I6Xdu6EImhOQ/OHorwOvpbraheMUkfxkYabjT0E2JmAFp9PGHpUC9
 ToCIhd8vtgpuEVQcYzt//jqXh1QnKf7JV5+QjA6N4naOMuH3CbR6T9gTKxg7LBcqXrIa
 dD/SabeNYNNVQ/ntQWyKqO3OGV79z7RpVh7fHEHN02An3sWSojz1vC9gJI3JvG/KqhxU FA== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32y64df2u5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 06:59:57 -0400
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HAt9PV032632;
 Mon, 17 Aug 2020 10:59:54 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 32x7b81aa6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 10:59:54 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HAxpk38520056
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 10:59:52 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE268A4040;
 Mon, 17 Aug 2020 10:59:51 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2A8CA4059;
 Mon, 17 Aug 2020 10:59:50 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 17 Aug 2020 10:59:50 +0000 (GMT)
Date: Mon, 17 Aug 2020 16:29:50 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [PATCH v2 1/3] powerpc/numa: Introduce logical numa id
Message-ID: <20200817105950.GA31352@linux.vnet.ibm.com>
References: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20200817103238.158133-1-aneesh.kumar@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_02:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=955 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008170075
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-17 16:02:36]:

> We use ibm,associativity and ibm,associativity-lookup-arrays to derive the numa
> node numbers. These device tree properties are firmware indicated grouping of
> resources based on their hierarchy in the platform. These numbers (group id) are
> not sequential and hypervisor/firmware can follow different numbering schemes.
> For ex: on powernv platforms, we group them in the below order.
> 
>  *     - CCM node ID
>  *     - HW card ID
>  *     - HW module ID
>  *     - Chip ID
>  *     - Core ID
> 
> Based on ibm,associativity-reference-points we use one of the above group ids as
> Linux NUMA node id. (On PowerNV platform Chip ID is used). This results
> in Linux reporting non-linear NUMA node id and which also results in Linux
> reporting empty node 0 NUMA nodes.
> 
> This can  be resolved by mapping the firmware provided group id to a logical Linux
> NUMA id. In this patch, we do this only for pseries platforms considering the
> firmware group id is a virtualized entity and users would not have drawn any
> conclusion based on the Linux Numa Node id.
> 
> On PowerNV platform since we have historically mapped Chip ID as Linux NUMA node
> id, we keep the existing Linux NUMA node id numbering.

I still dont understand how you are going to handle numa distances.
With your patch, have you tried dlpar add/remove on a sparsely noded machine?

-- 
Thanks and Regards
Srikar Dronamraju
