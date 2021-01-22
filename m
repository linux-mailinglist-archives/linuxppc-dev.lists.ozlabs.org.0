Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 877BE300B02
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Jan 2021 19:21:32 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DMndj4rLxzDsGv
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Jan 2021 05:21:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=raoni@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=hMa5Apg1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DMnbj65F8zDrj8
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Jan 2021 05:19:45 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10MIBkjL125291; Fri, 22 Jan 2021 13:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=1vK3l8twYiJ4AahX6f2shQoHhqCazfbhcwEMGffCXwU=;
 b=hMa5Apg1JWLJ32o1UFbUNrYSz67rth97n/dB4M/07Aw2+ngjTs4uRbl1uO9gF8w4m2yi
 axeeh7Z64SXLz8Kw1eMANLRCWlLOyzeqhBJr+q9gtOhzs136Lmy1N6MxnbgyJk0KAIXS
 2n53Iilk5lD2pw+OyzMrzpTApHygAGGTonk/EB8itbqPneBawUotfNyUN0cPas8UfS7H
 azC8XH0CA08sd6tpAbLVzcQOXJO6ExDYsMV31h0FoyPKYXmoJjXCei88Xq0q2y/wbMil
 etNv5sSKZn9YjRAyjgU4LJ611RuxyP+7sYj1YXo25BoFJk7Ji+ofN6OcRUFZkkJUlQDN CA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3683s4r6b1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 13:19:28 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10MIDGpq132881;
 Fri, 22 Jan 2021 13:19:28 -0500
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3683s4r6an-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 13:19:28 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10MIAiQW014103;
 Fri, 22 Jan 2021 18:19:27 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 367k0xnsj1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 18:19:27 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10MIJRZC29163918
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 18:19:27 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0682D112061;
 Fri, 22 Jan 2021 18:19:27 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34605112067;
 Fri, 22 Jan 2021 18:19:25 +0000 (GMT)
Received: from work-tp (unknown [9.65.209.189])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Jan 2021 18:19:24 +0000 (GMT)
Date: Fri, 22 Jan 2021 15:19:22 -0300
From: Raoni Fassina Firmino <raoni@linux.ibm.com>
To: Rich Felker <dalias@libc.org>
Subject: Re: [musl] Re: [PATCH v2] powerpc/64/signal: balance return
 predictor stack in signal trampoline
Message-ID: <20210122181922.pcxyomeg5xcf2umu@work-tp>
Mail-Followup-To: Rich Felker <dalias@libc.org>,
 Florian Weimer <fweimer@redhat.com>, musl@lists.openwall.com,
 libc-alpha@sourceware.org, linuxppc-dev@lists.ozlabs.org,
 Nicholas Piggin <npiggin@gmail.com>, Alan Modra <amodra@gmail.com>
References: <20200511101952.1463138-1-npiggin@gmail.com>
 <87im7pp5yl.fsf@oldenburg.str.redhat.com>
 <20210122144402.GP23432@brightrain.aerifal.cx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210122144402.GP23432@brightrain.aerifal.cx>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_13:2021-01-22,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 spamscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=999 clxscore=1011 bulkscore=0 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220091
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

On Fri, Jan 22, 2021 at 09:44:05AM -0500, Rich Felker wrote:
> Maybe I'm missing something but I don't see how this would break musl;
> we just inspect the PC in the mcontext, which I don't see any changes
> to and which should still point to the next instruction of the
> interrupted context. I don't have a test environment though so I'll
> have to wait for feedback from ppc users to be sure. Are there any
> further details on how it's breaking glibc?

For glibc, backtrace() compares the return-address from each stack frame
to the value of `__kernel_sigtramp_rt64` to identify the frame with the
mcontext information, but now the return-address is not the start of the
routine, but the middle of it, so it fails to catch this special frame.


o/
Raoni Fassina
