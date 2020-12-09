Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C758D2D3D92
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 09:37:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CrVmK2qklzDqrm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Dec 2020 19:37:37 +1100 (AEDT)
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
 header.s=pp1 header.b=ipGoZ5lN; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CrVkc5Hg6zDqP6
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Dec 2020 19:36:08 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0B98X9Ql042967; Wed, 9 Dec 2020 03:35:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=b2CYOgliUsTrUudXjwmcbLAvbceX0i5fNWL84kZqJWA=;
 b=ipGoZ5lNkO6gsv/YDpHe+0z7kiFplPwJJjvl8/pQ4yn/6zu7IetFd/2xVa0g6brR5+2y
 mTIY22XBJKJtNqiOQ5UkUtZ5Cy6DbKN5rCWpdCrxYRgAOmfVAGcfPr+ipp64M+UnhExV
 jO9o2DXXK2OpeDKzfSjVvaKh6o4CEWpYyrsQ4p3oJv4tGaQrwJeJlmL1TJCXt0u7qREe
 xoV+vZB8KDwf6YAcQxVJyaJUOAxtfDc7UZwOgDl2J0+h7qRJ3UByh3WClXV5Vg2Yx+yV
 XZ4HB1HO0yHIsp3daE1OyGZcZQLAIl083lQUKlTZn9vPXvm4H5ohV1KA5l2cqCb/7j1w mw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ateq99dt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 03:35:49 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0B98X9jA042950;
 Wed, 9 Dec 2020 03:35:49 -0500
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35ateq99cs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 03:35:48 -0500
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0B98W4s3010015;
 Wed, 9 Dec 2020 08:35:46 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3583svm9f8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Dec 2020 08:35:46 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0B98Zinr56033754
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Dec 2020 08:35:44 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 762F14C059;
 Wed,  9 Dec 2020 08:35:44 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7518F4C05A;
 Wed,  9 Dec 2020 08:35:42 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed,  9 Dec 2020 08:35:42 +0000 (GMT)
Date: Wed, 9 Dec 2020 14:05:41 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Gautham R Shenoy <ego@linux.vnet.ibm.com>
Subject: Re: [PATCH 1/3] powerpc/smp: Parse ibm,thread-groups with multiple
 properties
Message-ID: <20201209083541.GK528281@linux.vnet.ibm.com>
References: <1607057327-29822-1-git-send-email-ego@linux.vnet.ibm.com>
 <1607057327-29822-2-git-send-email-ego@linux.vnet.ibm.com>
 <20201207121042.GH528281@linux.vnet.ibm.com>
 <20201208172540.GA14206@in.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20201208172540.GA14206@in.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-09_07:2020-12-08,
 2020-12-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=1 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 adultscore=0 impostorscore=0 priorityscore=1501 phishscore=0 spamscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012090060
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
Cc: Nathan Lynch <nathanl@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Valentin Schneider <valentin.schneider@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Gautham R Shenoy <ego@linux.vnet.ibm.com> [2020-12-08 22:55:40]:

> > 
> > NIT:
> > tglx mentions in one of his recent comments to try keep a reverse fir tree
> > ordering of variables where possible.
> 
> I suppose you mean moving the longer local variable declarations to to
> the top and shorter ones to the bottom. Thanks. Will fix this.
> 

Yes.

> > > +	}
> > > +
> > > +	if (!tg)
> > > +		return -EINVAL;
> > > +
> > > +	cpu_group_start = get_cpu_thread_group_start(cpu, tg);
> > 
> > This whole hunk should be moved to a new function and called before
> > init_cpu_cache_map. It will simplify the logic to great extent.
> 
> I suppose you are referring to the part where we select the correct
> tg. Yeah, that can move to a different helper.
> 

Yes, I would prefer if we could call this new helper outside
init_cpu_cache_map.

> > > 
> > > -	zalloc_cpumask_var_node(&per_cpu(cpu_l1_cache_map, cpu),
> > > -				GFP_KERNEL, cpu_to_node(cpu));
> > > +	mask = &per_cpu(cpu_l1_cache_map, cpu);
> > > +
> > > +	zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cpu));
> > > 
> > 
> > This hunk (and the next hunk) should be moved to next patch.
> >
> 
> The next patch is only about introducing  THREAD_GROUP_SHARE_L2. Hence
> I put in any other code in this patch, since it seems to be a logical
> place to collate whatever we have in a generic form.
> 

While I am fine with it, having a pointer that always points to the same
mask looks wierd.

-- 
Thanks and Regards
Srikar Dronamraju
