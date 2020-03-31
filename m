Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 753941996B3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 14:41:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48s88w53GDzDqvY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Mar 2020 23:41:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ego@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48s7Yy1s5FzDrB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 31 Mar 2020 23:15:01 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VC4iDn145240; Tue, 31 Mar 2020 08:14:56 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 301yffnt0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:14:56 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02VC7Jdh003034;
 Tue, 31 Mar 2020 08:14:55 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 301yffnt0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 08:14:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02VCEnnM017810;
 Tue, 31 Mar 2020 12:14:54 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 301x77eue3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 31 Mar 2020 12:14:54 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02VCErXx38273512
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 12:14:53 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DC7913605D;
 Tue, 31 Mar 2020 12:14:53 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A01BD13604F;
 Tue, 31 Mar 2020 12:14:52 +0000 (GMT)
Received: from sofia.ibm.com (unknown [9.85.71.250])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 12:14:52 +0000 (GMT)
Received: by sofia.ibm.com (Postfix, from userid 1000)
 id 658172E33D2; Tue, 31 Mar 2020 17:44:47 +0530 (IST)
Date: Tue, 31 Mar 2020 17:44:47 +0530
From: Gautham R Shenoy <ego@linux.vnet.ibm.com>
To: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
Subject: Re: [RFC/PATCH  0/3] Add support for stop instruction inside KVM guest
Message-ID: <20200331121447.GA1996@in.ibm.com>
References: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1585656658-1838-1-git-send-email-ego@linux.vnet.ibm.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_04:2020-03-31,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 phishscore=0 clxscore=1015
 bulkscore=0 malwarescore=0 spamscore=0 mlxlogscore=776 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310106
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
Reply-To: ego@linux.vnet.ibm.com
Cc: Michael Neuling <mikey@neuling.org>, Nicholas Piggin <npiggin@gmail.com>,
 Bharata B Rao <bharata@linux.ibm.com>, linuxppc-dev@ozlabs.org,
 kvm-ppc@vger.kernel.org, Vaidyanathan Srinivasan <svaidy@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 31, 2020 at 05:40:55PM +0530, Gautham R. Shenoy wrote:
> From: "Gautham R. Shenoy" <ego@linux.vnet.ibm.com>
> 
> 
>  *** RFC Only. Not intended for inclusion ************
> 
> Motivation
> ~~~~~~~~~~~~~~~
> 
> The POWER ISA v3.0 allows stop instruction to be executed from a Guest
> Kernel (HV=0,PR=0) context. If the hypervisor has cleared
> PSSCR[ESL|EC] bits, then the stop instruction thus executed will cause
> the vCPU thread to "pause", thereby donating its cycles to the other
> threads in the core until the paused thread is woken up by an
> interrupt. If the hypervisor has set the PSSCR[ESL|EC] bits, then
> execution of the "stop" instruction will raise a Hypervisor Facility
> Unavailable exception.
> 
> The stop idle state in the guest (henceforth referred to as stop0lite)
> when enabled
> 
> * has a very small wakeup latency (1-3us) comparable to that of
>   snooze and considerably better compared the Shared CEDE state
>   (25-30us).  Results are provided below for wakeup latency measured
>   by waking up an idle CPU in a given state using a timer as well as
>   using an IPI.
> 
>   ======================================================================
>   Wakeup Latency measured using a timer (in ns) [Lower is better]
>   ======================================================================
>   Idle state |  Nr samples |  Min    | Max    | Median | Avg   | Stddev|
>   ======================================================================
>   snooze     |   60        |  787    | 1059   |  938   | 937.4 | 42.27 |
>   ======================================================================
>   stop0lite  |   60        |  770    | 1182   |  948   | 946.4 | 67.41 |
>   ======================================================================
>   Shared CEDE|   60        | 9550    | 36694  | 29219  |28564.1|3545.9 |
>   ======================================================================
>

Posted two copies of Wakeup latency measured by timer. Here is the
wakeup latency measured using an IPI.


======================================================================
Wakeup latency measured using an IPI (in ns) [Lower is better]
======================================================================
Idle state |  Nr    |  Min    | Max    | Median | Avg     | Stddev   |
           |samples |         |        |        |         |          |
----------------------------------------------------------------------
snooze     |   60   |     2089|    4228|    2259|  2342.31|    316.56|
----------------------------------------------------------------------
stop0lite  |   60   |     1947|    3674|    2653|  2610.57|    266.73|
----------------------------------------------------------------------
Shared CEDE|   60   |    20147|   36305|   21827| 26762.65|   6875.01|
======================================================================

--
Thanks and Regards
gautham.
