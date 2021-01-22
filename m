Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E962D300BD8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 19:53:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMpLC5CtszDqDT
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 05:53:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=raoni@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=evyQDCiy; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMpJG2KRtzDrfX
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 05:51:25 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10MIWGED165259; Fri, 22 Jan 2021 13:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=0hJ3R7PmnAV3KDkqFLyrwB7v1gGYxVPGPiVnT2GKSic=;
 b=evyQDCiyqlafjMdiP56eG2wcG6+tM9/KGYPO3SFb916/s95LuvVOOMup5LvasHuE3Cc7
 t1VSaPzLN0lCp22kWbPpKoo3UC0tAlYyffHOpGTD13/sRfGke/6yUN1KJuIqSv5/GSuA
 bPFORiDNi5OZIyRQHPqDHe3NnW/IVaOOEHxxDblcRo2pZyMUr9SsRtTcx0kyagCTdTqw
 IQJzDvsFvjStZM/G+RsZl9gHUTBacuzD0ijicKcb3umXkt/ubl5MSLmFDbmypqLsj6tx
 OdLgRvvboJyPe2MKK144tuTeytOYKNOdUvseyFwblsVQw+Kqogd6v7IQqFFjGXy9Bi/P cA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3683shrwq9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 13:51:01 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10MIWqhx166619;
 Fri, 22 Jan 2021 13:51:01 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3683shrwps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 13:51:01 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10MIkawd027897;
 Fri, 22 Jan 2021 18:51:00 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma01dal.us.ibm.com with ESMTP id 367k0m7e6b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 18:51:00 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10MIoxdv26739082
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:50:59 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 044917805E;
 Fri, 22 Jan 2021 18:50:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D535478060;
 Fri, 22 Jan 2021 18:50:56 +0000 (GMT)
Received: from work-tp (unknown [9.65.209.189])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Jan 2021 18:50:56 +0000 (GMT)
Date: Fri, 22 Jan 2021 15:50:53 -0300
From: Raoni Fassina Firmino <raoni@linux.ibm.com>
To: Rich Felker <dalias@libc.org>
Subject: Re: [musl] Re: [PATCH v2] powerpc/64/signal: balance return
 predictor stack in signal trampoline
Message-ID: <20210122185053.ze3oaeexwjii2r7s@work-tp>
Mail-Followup-To: Rich Felker <dalias@libc.org>,
 Florian Weimer <fweimer@redhat.com>, musl@lists.openwall.com,
 libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
References: <20200511101952.1463138-1-npiggin@gmail.com>
 <87im7pp5yl.fsf@oldenburg.str.redhat.com>
 <20210122144402.GP23432@brightrain.aerifal.cx>
 <20210122181922.pcxyomeg5xcf2umu@work-tp>
 <20210122183127.GQ23432@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122183127.GQ23432@brightrain.aerifal.cx>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_13:2021-01-22,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0
 phishscore=0 mlxscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 mlxlogscore=972 clxscore=1015 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101220092
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
Cc: Florian Weimer <fweimer@redhat.com>, libc-alpha@sourceware.org,
 Alan Modra <amodra@gmail.com>, musl@lists.openwall.com,
 Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jan 22, 2021 at 01:31:27PM -0500, Rich Felker wrote:
> On Fri, Jan 22, 2021 at 03:19:22PM -0300, Raoni Fassina Firmino wrote:
> > On Fri, Jan 22, 2021 at 09:44:05AM -0500, Rich Felker wrote:
> > > Maybe I'm missing something but I don't see how this would break musl;
> > > we just inspect the PC in the mcontext, which I don't see any changes
> > > to and which should still point to the next instruction of the
> > > interrupted context. I don't have a test environment though so I'll
> > > have to wait for feedback from ppc users to be sure. Are there any
> > > further details on how it's breaking glibc?
> > 
> > For glibc, backtrace() compares the return-address from each stack frame
> > to the value of `__kernel_sigtramp_rt64` to identify the frame with the
> > mcontext information, but now the return-address is not the start of the
> > routine, but the middle of it, so it fails to catch this special frame.
> 
> Is there a reason it's backtracing rather than just looking at the
> interrupted context (pointed to by the third argument to the signal
> handler)?

The regression is exposed in the backtrace() routine. More precisely,
when the backtrace() is called from inside a signal handling. What I
described is the way backtrace() uses to identify this special
situation. What is failling in glibc is the test for this.


o/
Raoni Fassina
