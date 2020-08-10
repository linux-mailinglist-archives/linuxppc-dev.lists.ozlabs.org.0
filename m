Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 899CE24032E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 10:07:48 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ7qj386DzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 18:07:45 +1000 (AEST)
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
 header.s=pp1 header.b=RjKFCboZ; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ7nR6Wm0zDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:05:47 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07A842h5008156
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 04:05:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=5ATHLXPF4Wxiz+cbuuM/zahQ6yIjrk1sLcbux+vWqAM=;
 b=RjKFCboZfKuZojgQpGFT2BhUPTUUkYqySgIQ6CuRTZNLqg0VKAFrCHrRiOF5d+v4kypJ
 90eA58BHsu1si4Np5CVG8sut5cU7LMQrpCNUOaZrrgGo7rLDNx4M5btSTpy98zxgQg10
 4m50olNJ+jQT8Z1DlV3UUyjmJQZ25NOG0yydKfZOUIw2MlW+kOdInzwn42i2NgtoBUgC
 vJtoI7zi+FmHT65lST7dpiTRejq8xrUlt8nIISHm8CqDxlLmd4PcHuhFCl9fmlC3trLH
 RPG/Tlfj3/Nq4MbbBqFwi0KwkVm8c7KEXyWM1A7f+gBTwJnpufBLJY5a/naeB49i353e dA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32sr8k4jw5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 04:05:44 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07A84jcQ022167
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 08:05:42 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma03ams.nl.ibm.com with ESMTP id 32skp8a0u2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 08:05:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07A85daU15729132
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 Aug 2020 08:05:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 832A2AE057;
 Mon, 10 Aug 2020 08:05:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94AB2AE053;
 Mon, 10 Aug 2020 08:05:38 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 10 Aug 2020 08:05:38 +0000 (GMT)
Date: Mon, 10 Aug 2020 13:35:37 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Subject: Re: [RFC PATCH 1/2] powerpc/numa: Introduce logical numa id
Message-ID: <20200810080537.GA10992@linux.vnet.ibm.com>
References: <20200731111916.243569-1-aneesh.kumar@linux.ibm.com>
 <20200801052059.GA24375@linux.vnet.ibm.com>
 <87h7tl162y.fsf@linux.ibm.com>
 <20200804072507.GI24375@linux.vnet.ibm.com>
 <87bljoqcje.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <87bljoqcje.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-10_03:2020-08-06,
 2020-08-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0
 mlxlogscore=999 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 malwarescore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008100053
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

* Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com> [2020-08-06 16:14:21]:

> >
> > associativity_to_nid gets called the first time a cpu is being made present
> > from offline. So it need not be in boot path. We may to verify if cpu
> > hotplug, dlpar, operations are synchronized. For example a memory hotadd and
> > cpu hotplug are they synchronized? I am not sure if they are synchronized at
> > this time.
> 
> But you don't online cpu or memory to a non existent node post boot
> right?. If the node is existent we have already initialized the nid_map.
> 

Not sure what you mean by existent and non-existent. Are you referring to
online / offline?

> However i am not sure whether we do a parallel initialization of devices. ie,
> of_device_add getting called in parallel. if it can then we need the
> below?
> 
> @@ -226,6 +226,7 @@ static u32 nid_map[MAX_NUMNODES] = {[0 ... MAX_NUMNODES - 1] =  NUMA_NO_NODE};
>  int firmware_group_id_to_nid(int firmware_gid)
>  {
>         static int last_nid = 0;
> +       static DEFINE_SPINLOCK(node_id_lock);
> 
>         /*
>          * For PowerNV we don't change the node id. This helps to avoid
> @@ -238,8 +239,13 @@ int firmware_group_id_to_nid(int firmware_gid)
>         if (firmware_gid ==  -1)
>                 return NUMA_NO_NODE;
> 
> -       if (nid_map[firmware_gid] == NUMA_NO_NODE)
> -               nid_map[firmware_gid] = last_nid++;
> +       if (nid_map[firmware_gid] == NUMA_NO_NODE) {
> +               spin_lock(&node_id_lock);
> +               /*  recheck with lock held */
> +               if (nid_map[firmware_gid] == NUMA_NO_NODE)
> +                       nid_map[firmware_gid] = last_nid++;
> +               spin_unlock(&node_id_lock);
> +       }
> 
>         return nid_map[firmware_gid];
>  }
> 

This should help.


> 
> I will also add a las_nid > MAX_NUMNODES check in
> firmware_group_id_to_nid() to handle the case where we find more numa
> nodes than MAX_NUMANODES in device tree.
> 

Okay, 

Whats your plan to handle the node distances?
Currently the node distances we compute from the device tree properties are
based on distance from node 0.  If you rename a different node as node 0,
how do you plan to remap the node distances?

> -aneesh

-- 
Thanks and Regards
Srikar Dronamraju
