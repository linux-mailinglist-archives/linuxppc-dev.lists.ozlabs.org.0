Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA64C3F47B4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 11:35:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GtRtq528Fz2ynX
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Aug 2021 19:35:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=llkPhJCX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=srikar@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=llkPhJCX; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GtRt24vDnz2xZL
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Aug 2021 19:35:06 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17N9WjUJ046726; Mon, 23 Aug 2021 05:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=3QJ4OmrOIzDV2QzO2G78sOlCHz+aIT5IWeo//eLPi3M=;
 b=llkPhJCXF8lXRCkZDLfIvAOHW/YcIwJfqo2z9eCQ3kHnMIR77rkAEVUCo6Z+CSFyYe2P
 el3WJVbWt/rAQ8I9W7YAbqYql9Sg0HGEvCdZVxDI61jW76GrGkfxGjq5/VqZTZAsFmgv
 8KDnp0DoPEQ/LyfXeL7gFHV82ZlRQ11jG3kThnbqeoHewob+XYAEQRdqRUavzVQSVWnE
 swTCgbnrRLEmrtKzFKxprqfM4BW7AxSbPhgqg6aC+/bKdGgAaCS0SHmCG0TFkXU9y453
 TVmduz+lnKXw7p1uXz0nlksBcnprHjomKwnP7YjdWqgutkdbrqLMPLMcWJxpV1jvSjFh 2A== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3am6nkc83f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 05:34:52 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 17N9XMtQ005169;
 Mon, 23 Aug 2021 09:34:50 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3ajs48ty8p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 23 Aug 2021 09:34:50 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 17N9V3SK47120708
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 23 Aug 2021 09:31:03 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5AFC442047;
 Mon, 23 Aug 2021 09:34:44 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0942E4203F;
 Mon, 23 Aug 2021 09:34:39 +0000 (GMT)
Received: from linux.vnet.ibm.com (unknown [9.126.150.29])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Mon, 23 Aug 2021 09:34:38 +0000 (GMT)
Date: Mon, 23 Aug 2021 15:04:37 +0530
From: Srikar Dronamraju <srikar@linux.vnet.ibm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 0/3] Updates to powerpc for robust CPU online/offline
Message-ID: <20210823093437.GJ21942@linux.vnet.ibm.com>
References: <20210821102535.169643-1-srikar@linux.vnet.ibm.com>
 <YSNdWhxVWtMJKAWi@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <YSNdWhxVWtMJKAWi@hirez.programming.kicks-ass.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: nJv4KbHtS6P07IiJGzovXibfb70xi5jt
X-Proofpoint-ORIG-GUID: nJv4KbHtS6P07IiJGzovXibfb70xi5jt
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-23_02:2021-08-23,
 2021-08-23 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=687 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108230063
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
 Geetika Moolchandani <Geetika.Moolchandani1@ibm.com>,
 Valentin Schneider <valentin.schneider@arm.com>,
 Laurent Dufour <ldufour@linux.ibm.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Ingo Molnar <mingo@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

* Peter Zijlstra <peterz@infradead.org> [2021-08-23 10:33:30]:

> On Sat, Aug 21, 2021 at 03:55:32PM +0530, Srikar Dronamraju wrote:
> > Scheduler expects unique number of node distances to be available
> > at boot. It uses node distance to calculate this unique node
> > distances. On Power Servers, node distances for offline nodes is not
> > available. However, Power Servers already knows unique possible node
> > distances. Fake the offline node's distance_lookup_table entries so
> > that all possible node distances are updated.
> > 
> > For example distance info from numactl from a fully populated 8 node
> > system at boot may look like this.
> > 
> > node distances:
> > node   0   1   2   3   4   5   6   7
> >   0:  10  20  40  40  40  40  40  40
> >   1:  20  10  40  40  40  40  40  40
> >   2:  40  40  10  20  40  40  40  40
> >   3:  40  40  20  10  40  40  40  40
> >   4:  40  40  40  40  10  20  40  40
> >   5:  40  40  40  40  20  10  40  40
> >   6:  40  40  40  40  40  40  10  20
> >   7:  40  40  40  40  40  40  20  10
> > 
> > However the same system when only two nodes are online at boot, then
> > distance info from numactl will look like
> > node distances:
> > node   0   1
> >   0:  10  20
> >   1:  20  10
> > 
> > With the faked numa distance at boot, the node distance table will look
> > like
> > node   0   1   2
> >   0:  10  20  40
> >   1:  20  10  40
> >   2:  40  40  10
> > 
> > The actual distance will be populated once the nodes are onlined.
> 
> How did you want all this merged? I picked up Valentin's patch, do you
> want me to pick up these PowerPC patches in the same tree, or do you
> want to route them seperately?

While both (the patch you accepted and this series) together help solve the
problem, I think there is no hard dependency between the two. Hence I would
think it should be okay to go through the powerpc tree.


-- 
Thanks and Regards
Srikar Dronamraju
