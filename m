Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B7EA9367A70
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 08:59:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQpF15FrYz3bV3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Apr 2021 16:59:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=U8ZqPUAV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=sukadev@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=U8ZqPUAV; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQpDZ1lgNz2xZQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 22 Apr 2021 16:58:53 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13M6WYWD169608; Thu, 22 Apr 2021 02:58:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=N/IKgJ4xDNqpVJKJDbm3LPm5qfQ5LyT/cXo+WFHtVr0=;
 b=U8ZqPUAVvwvLvGlY+6Qwy5LkFK5yvZgpHWxVoKbMjWLc5kCyUtTtlyHZgZG0F11dRvUG
 PmC76aGps9sVE79kOuGr1o0NHI30GbbQtKchTKUv+5y0cTMorSm0hfELrLyUZDlbqBlX
 +JZ0DW1gRNniSIQM2Qh7R+cqQM8Q/SWXbAjpvF/+LQYlpvC1lgKT5WBoTk6shB3zlcEW
 qXPK49OJumwCCtaDrfAOKVNiAe6siit55AWny0qshB1GVP3qbufYTJAsRN86WqGT0tjW
 K1l1pqXgz6Zprb//FWVOl+1KVUJ9iGPzOwQYrD/+LF4Sy1kXdwgLibp2znn/jwf3tzUy 9Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383344hx1w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 02:58:47 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13M6Wpwh174099;
 Thu, 22 Apr 2021 02:58:47 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 383344hx1q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 02:58:47 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13M6vGeq025465;
 Thu, 22 Apr 2021 06:58:46 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 37yqaa7yrd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Apr 2021 06:58:46 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13M6wkmv34800034
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Apr 2021 06:58:46 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D5A828064;
 Thu, 22 Apr 2021 06:58:46 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2B1E228059;
 Thu, 22 Apr 2021 06:58:46 +0000 (GMT)
Received: from suka-w540.localdomain (unknown [9.85.159.236])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 22 Apr 2021 06:58:46 +0000 (GMT)
Received: by suka-w540.localdomain (Postfix, from userid 1000)
 id 3B6722E0948; Wed, 21 Apr 2021 23:58:43 -0700 (PDT)
Date: Wed, 21 Apr 2021 23:58:43 -0700
From: Sukadev Bhattiprolu <sukadev@linux.ibm.com>
To: Lijun Pan <lijunp213@gmail.com>
Subject: Re: [PATCH V2 net] ibmvnic: Continue with reset if set link down
 failed
Message-ID: <20210422065843.GA2743610@us.ibm.com>
References: <20210420213517.24171-1-drt@linux.ibm.com>
 <60C99F56-617D-455B-9ACF-8CE1EED64D92@linux.vnet.ibm.com>
 <20210421064527.GA2648262@us.ibm.com>
 <CAOhMmr4ckVFTZtSeHFHNgGPUA12xYO8WcUoakx7WdwQfSKBJhA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOhMmr4ckVFTZtSeHFHNgGPUA12xYO8WcUoakx7WdwQfSKBJhA@mail.gmail.com>
X-Operating-System: Linux 2.0.32 on an i486
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GfwI-kOWaECHjoBtMq1EWWBeScQcfUux
X-Proofpoint-ORIG-GUID: snAdYgpPcE9dnAUvkG3T6jD4G0npnwE8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-22_01:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104220056
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
Cc: netdev@vger.kernel.org, Lijun Pan <ljp@linux.vnet.ibm.com>,
 Tom Falcon <tlfalcon@linux.ibm.com>, Paul Mackerras <paulus@samba.org>,
 Dany Madden <drt@linux.ibm.com>, Jakub Kicinski <kuba@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, David Miller <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Lijun Pan [lijunp213@gmail.com] wrote:
> > Now, sure we can attempt a "thorough hard reset" which also does
> > the same hcalls to reestablish the connection. Is there any
> > other magic in do_hard_reset()? But in addition, it also frees lot
> > more Linux kernel buffers and reallocates them for instance.
> 
> Working around everything in do_reset will make the code very difficult

We are not working around everything. We are doing in do_reset()
exactly what we would do in hard reset for this error (ignore the
set link down error and try to reestablish the connection with the
VIOS).

What we are avoiding is unnecessary work on the Linux side for a
communication problem on the VIOS side.

> to manage. Ultimately do_reset can do anything I am afraid, and do_hard_reset
> can be removed completely or merged into do_reset.
> 
> >
> > If we are having a communication problem with the VIOS, what is
> > the point of freeing and reallocating Linux kernel buffers? Beside
> > being inefficient, it would expose us to even more errors during
> > reset under heavy workloads?
> 
> No real customer runs the system under that heavy load created by
> HTX stress test, which can tear down any working system.

We need to talk to capacity planning and test architects about that,
but all I want to know is what hard reset would do differently to
fix this communication error with VIOS.

Sukadev
