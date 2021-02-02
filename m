Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ACFE230D16C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 03:24:35 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVlr06NStzDwmJ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 13:24:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=raoni@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=NwyIRwzr; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVS0c02JKzDr2w
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Feb 2021 01:30:55 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 112E1mOl130255; Tue, 2 Feb 2021 09:30:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=WpVmK5VK7rGa5rrFN95R4dtODDFdQM+j41DE+0Et2K0=;
 b=NwyIRwzryQdu5GxPGDGB3O6kWIsxelW71Yvcf+abT/Tf0jCnEADVmMt5YoqpRmrAM5XS
 NlPAXr2i2IZ/zhUyie/IiM0SX0H9OsVBP4KGZ0wTIaQNyJcYgoguubkoyE5JRG3RwMPp
 wmLP9/6PAPnrg9jfcURAGR0TvvUW2BMQ7q3Sly+eW5zSAfnodekGrKtTEBhu/NnkxqIZ
 DGWHy7tGdIv9zx1akPDiCcXreK7ceQTM5FbixajZAhH3R3ec/FFBs9Gm258285iK4jsC
 zOcZTspksZAXn7W75ertXTHOlEPAKV7Tn8rxyrwqplZH28Tkc+KKKIwn9C+g9TBunIb5 9A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36f7ncaabs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:30:48 -0500
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 112E2Nh5136875;
 Tue, 2 Feb 2021 09:30:48 -0500
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 36f7ncaaba-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:30:48 -0500
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112ETR7P013623;
 Tue, 2 Feb 2021 14:30:47 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma02wdc.us.ibm.com with ESMTP id 36cy396s74-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 14:30:47 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 112EUkrt24379784
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 14:30:46 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44ED1AE062;
 Tue,  2 Feb 2021 14:30:46 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 64BE9AE05C;
 Tue,  2 Feb 2021 14:30:45 +0000 (GMT)
Received: from work-tp (unknown [9.65.197.147])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTPS;
 Tue,  2 Feb 2021 14:30:45 +0000 (GMT)
Date: Tue, 2 Feb 2021 11:30:42 -0300
From: Raoni Fassina Firmino <raoni@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH] powerpc/64/signal: Fix regression in
 __kernel_sigtramp_rt64 semantics
Message-ID: <20210202143042.a5mfxir62ezrp2va@work-tp>
Mail-Followup-To: Nicholas Piggin <npiggin@gmail.com>,
 linuxppc-dev@lists.ozlabs.org,
 Michael Ellerman <mpe@ellerman.id.au>
References: <20210201200505.iz46ubcizipnkcxe@work-tp>
 <1612251472.a7pzsfoixm.astroid@bobo.none>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1612251472.a7pzsfoixm.astroid@bobo.none>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_06:2021-02-02,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 adultscore=0 clxscore=1015 suspectscore=0 mlxlogscore=999 malwarescore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020092
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 02, 2021 at 05:41:35PM +1000, Nicholas Piggin wrote:
> Are you planning to update glibc to cope with this as well? Any idea 
> about musl? If so, including version numbers would be good (not that
> it's really a problem to carry this patch around).

For glibc from the beginning I planned to send a patch as well and
fortunately it got in[1] in time for yesterday's 2.33 release.  That
patch is meant to address kernels 5.9 and 5.10 but is also compatible
with older kernels and with this patch. So everyone should be compatible
with everyone else :-) (except unpatched kernels 5.9 and 5.10 with
unpatched glibcs prior to 2.33)

I don't know about musl, I took a look and maybe wrong here but didn't
find any backtrace() implementation and it seems that it uses its own
return code for the trampoline, but I am not sure.

Rich mentioned[2] that he didn't see how it would break musl and was
waiting for feedback from ppc users to be sure.

Thanks for the review :-)

o/
Raoni

[1] https://sourceware.org/git/?p=glibc.git;a=commitdiff;h=5ee506ed35a2c9184bcb1fb5e79b6cceb9bb0dd1
[2] https://lists.ozlabs.org/pipermail/linuxppc-dev/2021-January/223198.html
