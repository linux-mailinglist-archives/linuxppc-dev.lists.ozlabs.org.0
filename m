Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E573F81CC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 06:48:58 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gw9NR6lNPz2yw7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Aug 2021 14:48:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZT/KV8HU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ZT/KV8HU; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gw9Md1cndz2xrl
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 26 Aug 2021 14:48:12 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17Q4YZeq074717; Thu, 26 Aug 2021 00:47:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : content-transfer-encoding : in-reply-to; s=pp1;
 bh=ycArnYe+Zels/jfuzShgz3ve9Wysp4hX7VN5q2aimik=;
 b=ZT/KV8HUTHZpFOkoLo8uOXdLzYIBTLSvD4rTmR1n3BJQ1pBGgjIX3jmrI9uk2PUCtoHD
 ePffd6x3mjqBDwm2818pwSQn8tSHP8zu/p5cJwujrbmDrRagJFvmb2lHJy7R3LY/G2F0
 3jrlX45ytyXQoCKaJfTYdZePv1L7iN7Jgz3N8Of9k+HqgO0aDTukcD4juwsv8+F93ege
 SzWMDQhxT4fsvD48mz184foJb6fUArZob+X+UmKfjOxrCqKfMKZX0cH+h6kTTBiri61b
 HpB6hBeRl8m8q50+BduYUzFq/qSTjuaU+1MyLbPoljENSdPMq/qaKpAMSs9huONrl/08 sg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ap2gmj3gj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 00:47:53 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17Q4SvL1026184;
 Thu, 26 Aug 2021 04:47:52 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06ams.nl.ibm.com with ESMTP id 3ajrrhgge8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 26 Aug 2021 04:47:52 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 17Q4lm7G57147784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 26 Aug 2021 04:47:48 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5CD0CA4065;
 Thu, 26 Aug 2021 04:47:48 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F41DA4054;
 Thu, 26 Aug 2021 04:47:45 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 26 Aug 2021 04:47:45 +0000 (GMT)
Date: Thu, 26 Aug 2021 10:17:44 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v2 1/3] powerpc/numa: Print debug statements only when
 required
Message-ID: <20210826044744.GN21942@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <20210821102535.169643-2-srikar@linux.vnet.ibm.com>
 <b8bbc10b-5432-512f-5899-455302a59d01@linux.ibm.com>
 <20210823093801.GK21942@linux.vnet.ibm.com>
 <87r1ehbrux.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87r1ehbrux.fsf@mpe.ellerman.id.au>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: jfK7h3HOzvVXe1wktQoRMf0ukPSVB0Mt
X-Proofpoint-ORIG-GUID: jfK7h3HOzvVXe1wktQoRMf0ukPSVB0Mt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-25_09:2021-08-25,
 2021-08-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108260026
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
 Gautham R Shenoy <ego@linux.vnet.ibm.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Peter Zijlstra <peterz@infradead.org>,
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Michael Ellerman <mpe@ellerman.id.au> [2021-08-25 23:01:42]:

> Srikar Dronamraju <srikar@linux.vnet.ibm.com> writes:
> > * Laurent Dufour <ldufour@linux.ibm.com> [2021-08-23 11:21:33]:
> >> Le 21/08/2021 à 12:25, Srikar Dronamraju a écrit :
> >> > Currently, a debug message gets printed every time an attempt to
> >> > add(remove) a CPU. However this is redundant if the CPU is already added
> >> > (removed) from the node.
> >> > 
> >
> > Its a fair point.
> >
> > Michael,
> >
> > Do you want me to resend this patch with s/pr_err/pr_warn for the above
> > line?
> 
> I think what I'd prefer is if we stopped using this custom dbg() stuff
> in numa.c, and cleaned up all the messages to use pr_xxx().
> 
> Those debug statements only appear if you boot with numa=debug, which is
> not documented anywhere and I had completely forgotten existed TBH.
> 
> These days there's CONFIG_DYNAMIC_DEBUG for turning on/off messages,
> which is much more flexible.
> 
> So can we drop the numa=debug bits, and convert all the dbg()s to
> pr_debug().
> 
> And then do a pass converting all the printk("NUMA: ") to pr_xxx() which
> will get "numa:" from pr_fmt().
> 
> cheers

Okay, will do the needful.

-- 
Thanks and Regards
Srikar Dronamraju
