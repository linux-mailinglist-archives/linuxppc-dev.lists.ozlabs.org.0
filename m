Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A69A4678A9
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Dec 2021 14:43:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J5DYV5mcVz30R6
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Dec 2021 00:43:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=oXwKWXzu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J5DXh53FVz2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:42:44 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oXwKWXzu; dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org
 [IPv6:2404:9400:2:0:216:3eff:fee2:21ea])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4J5DXh2fm5z4xYy
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Dec 2021 00:42:44 +1100 (AEDT)
Received: by gandalf.ozlabs.org (Postfix)
 id 4J5DXh2bX9z4xbC; Sat,  4 Dec 2021 00:42:44 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: gandalf.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: gandalf.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=oXwKWXzu; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by gandalf.ozlabs.org (Postfix) with ESMTPS id 4J5DXg4XZ5z4xYy
 for <linuxppc-dev@ozlabs.org>; Sat,  4 Dec 2021 00:42:42 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CHYDZ001093
 for <linuxppc-dev@ozlabs.org>; Fri, 3 Dec 2021 13:42:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : reply-to : references : content-type : in-reply-to
 : mime-version; s=pp1; bh=I0CM2L6XF9hT3C80c2jIgI7yG5C7Auw2u7OzMUIqAjI=;
 b=oXwKWXzuQsJXTViSVyoIN8wn5aCM4LIaCRpjZPgSYX24KzbLuheCpwo2JGbJ6JlYiUpM
 lHyMCXPIOCHYsrm/VOK56W07p22JvzOeZLLyymScU/oM7RIjbNlla8sRMswXG3nbUYy9
 x1+CaLnX4nVla0cWLlLQs53C4H8xndKjRNjNtBPh1SBDSLfiKM4kWe/tx5yD2d1MsRdB
 cQp+IY85o+UXcEJkdlvCYymGtdzQcJ7GLp9UIsJA7RuNAw3vlA0KJ1zWRiTrOwPJnQVa
 La28QqC1OkuzABXp89AFZUT8q3VOUpytxm0GDjrZW+5l26hg07ivPxBq1ureUpq7PCUs XQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqk451mmd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Fri, 03 Dec 2021 13:42:40 +0000
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3DU8V2010293
 for <linuxppc-dev@ozlabs.org>; Fri, 3 Dec 2021 13:42:40 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqk451mm1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:42:40 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3DWQgh031123;
 Fri, 3 Dec 2021 13:42:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma01fra.de.ibm.com with ESMTP id 3ckcaakgdk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 13:42:38 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1B3DgYVt31916504
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 13:42:34 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 42CC252051;
 Fri,  3 Dec 2021 13:42:34 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.11.18])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTPS id 31D5F5204F;
 Fri,  3 Dec 2021 13:42:32 +0000 (GMT)
Date: Fri, 3 Dec 2021 19:12:30 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: Nathan Lynch <nathanl@linux.ibm.com>
Subject: Re: [PATCH] powerpc/rtas: Introduce rtas_get_sensor_nonblocking()
 for pci hotplug driver.
Message-ID: <20211203134230.iklzvh7fjd6wrzp2@in.ibm.com>
References: <163817631601.2016996.16085383012429651821.stgit@jupiter>
 <87o862nt0q.fsf@linux.ibm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o862nt0q.fsf@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: tipol88VqeVX2DJFUxdAuzg2wM9GIhLv
X-Proofpoint-GUID: TrEwkKV3TwMi4KY_AEm3RZH_-Mr9x_4u
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_07,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 mlxscore=0 malwarescore=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 bulkscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112030084
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
Reply-To: mahesh@linux.ibm.com
Cc: linuxppc-dev <linuxppc-dev@ozlabs.org>,
 Oliver O'Halloran <oohall@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-11-29 22:53:41 Mon, Nathan Lynch wrote:
> Mahesh Salgaonkar <mahesh@linux.ibm.com> writes:
> > When certain PHB HW failure causes phyp to recover PHB, it marks the PE
> > state as temporarily unavailable until recovery is complete. This also
> > triggers an EEH handler in Linux which needs to notify drivers, and perform
> > recovery. But before notifying the driver about the pci error it uses
> > get_adapter_state()->get-sesnor-state() operation of the hotplug_slot to
> > determine if the slot contains a device or not. if the slot is empty, the
> > recovery is skipped entirely.
> >
> > However on certain PHB failures, the rtas call get-sesnor-state() returns
> > extended busy error (9902) until PHB is recovered by phyp. Once PHB is
> > recovered, the get-sensor-state() returns success with correct presence
> > status. The rtas call interface rtas_get_sensor() loops over the rtas call
> > on extended delay return code (9902) until the return value is either
> > success (0) or error (-1). This causes the EEH handler to get stuck for ~6
> > seconds before it could notify that the pci error has been detected and
> > stop any active operations.
> 
> I am curious whether you see any difference with "powerpc/rtas:
> rtas_busy_delay() improvements" which was recently applied. It will
> cause the the calling task to sleep in response to a 990x status instead
> of immediately retrying:
> 
> https://git.kernel.org/powerpc/c/38f7b7067dae0c101be573106018e8af22a90fdf
> 
> If that commit helps then maybe this change isn't needed.

I tried with above commit but it didn't help.

> 
> Maybe it would be better to have rpaphp_get_sensor_state() invoke
> rtas_call("get-sensor-state", ...) directly and code whatever special
> behavior is needed there, instead of introducing a new exported API. The

Posted v3 with above approach.
https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-December/237538.html

Thanks for your review.
-Mahesh.

-- 
Mahesh J Salgaonkar
