Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DBB2588477
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 00:40:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ly91t3Y7Gz3c1n
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Aug 2022 08:40:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PZuJ4UkF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=PZuJ4UkF;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ly917636rz2xGR
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Aug 2022 08:40:11 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 272MBiFu023821;
	Tue, 2 Aug 2022 22:40:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : content-transfer-encoding : mime-version; s=pp1;
 bh=zvw1UISOx4r2ZKRNQfF1dUC8ZBXWPw1SjEaKtNxgQzI=;
 b=PZuJ4UkF0ctG9YcLphDhw3aYYHGTZFQlsFm6sH7LhBIYjBtnRYe9cREj83GoYITr2YGm
 bhxfl6CqkNcMpjtFyRjeOWYRRePuB/36On4nF3+/3ha06HcYUP086YSqG7fdNj6wnhzb
 XzvyO1f8RYhKefc//FM7rkE2mhMJPqwRFGpyjPxfXFFS9F700dtCkOADdSay2KwBelZ2
 GUV7Uzqd+C86CFHOvMnHnw3WduurPFnNkrd4MFYZ5DHPoeUITOu94v3uh0+SBuwoYFpC
 Wq/GwbKiRTGYav6lRFDjP1exNuWf2xR+RT7KX0V8SqgvBmYLoZX2asMXUYV15O99HG1Y sg== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hqcgmgn3d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Aug 2022 22:40:00 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 272MaICk007809;
	Tue, 2 Aug 2022 22:39:58 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com [9.57.198.28])
	by ppma02wdc.us.ibm.com with ESMTP id 3hmv99cpu1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 02 Aug 2022 22:39:58 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com [9.57.199.106])
	by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 272Mdwox2097916
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 2 Aug 2022 22:39:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6B08B2806A;
	Tue,  2 Aug 2022 22:39:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DDCC128072;
	Tue,  2 Aug 2022 22:39:57 +0000 (GMT)
Received: from sig-9-65-198-113.ibm.com (unknown [9.65.198.113])
	by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue,  2 Aug 2022 22:39:57 +0000 (GMT)
Message-ID: <fb0af005052c154d5e513041fccebe14e761267f.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/2] lib: generic accessor functions for arch keystore
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, linux-block@vger.kernel.org
Date: Tue, 02 Aug 2022 17:39:57 -0500
In-Reply-To: <878ro7bbal.fsf@mpe.ellerman.id.au>
References: <20220801123426.585801-1-gjoyce@linux.vnet.ibm.com>
	 <20220801123426.585801-2-gjoyce@linux.vnet.ibm.com>
	 <878ro7bbal.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: sZ7M7lWvXEtDfWLRYsMpsR7kzVvqhmdP
X-Proofpoint-ORIG-GUID: sZ7M7lWvXEtDfWLRYsMpsR7kzVvqhmdP
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-02_14,2022-08-02_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 spamscore=0 mlxscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxlogscore=999 suspectscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2208020106
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
Reply-To: gjoyce@linux.vnet.ibm.com
Cc: axboe@kernel.dk, nayna@linux.ibm.com, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Michael and Michal,

On Tue, 2022-08-02 at 12:59 +1000, Michael Ellerman wrote:
> I don't think "arch" is the right level of abstraction here.
> 
> There isn't a standard way to get these variables across a given
> arch,
> they're not defined in the architecture specification etc.
> 
> As demonstrated in your patch 2, on powerpc they are coming from a
> platform level pseudo device (provided by the PowerVM hypervisor).
> But
> they would come from elsewhere on a bare metal system.

I'm open to something other than "arch_" if that causes confusion.
Maybe "plat_"?

> And you could imagine other architectures could support multiple ways
> to
> retrieve these kind of variables from various different places,
> possibly
> more than one place on a given system.

Agreed, and that's why an architecture or platform can override the
functions. The first parameter also allows for further distinction of
how the data could be interpreted, including in multiple ways as you
suggest.

I wanted to allow for different types of persistent storage. For
instance you could have a platform that used a NAND deice for permanent
storage that could still use the API as proposed.

> So I think at least you want a way for any device to register itself
> as
> able to provide these variables. Possibly with a chain of handlers,
> something like the sys_off_handlers, or maybe there only ever needs
> to
> be one provider, the way pm_power_off (used to) work.

I did look at some of the other ways of dynamically registering
functions but most of the exisiting examples are centered around a
specific device entity which is not the case here. The functionailty is
pretty simple so I was hoping to keep the API simple as well.

The sys_off_handler functions certainly provide a good way of
registering for asynchronous notifications but for this purpose we need
synchronous functions that possibly return data. Many of the pci
functions end up in platform specific code but they use information
from struct pci_dev to route the call to the appropriate place. 

> Looking at your patch to block/sed-opal.c:
> 
> https://lore.kernel.org/all/20220718210156.1535955-4-gjoyce@linux.vnet.ibm.com/
> 
> It seems like the calls to these arch routines are closely tied to
> calls
> to the keyring API. Should this functionality be part of the keyring
> API?

Those calls are just using the API to read/write named variables that
happen to be keys in this case. I was envisioning that there may be
uses other than SED for persistent key/values.


> At a mininmum I think you need to get much wider review on something
> like this. So I'd suggest the keyring folks and as Michal pointed
> out,
> this seems a bit like EFI variables so it would be good to Cc the
> EFI/EFI variable folks.

The keyring folks were on the original SED patchset review and I did
incorporate a good comment involving use of keyrings. I will copy them
again (as well as EFI folks) for the next update.

-Greg

