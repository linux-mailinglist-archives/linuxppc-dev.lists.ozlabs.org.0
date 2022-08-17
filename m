Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1B059698E
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 08:28:44 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M6ylG1zg6z3cFl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 16:28:42 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPv8GAQZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=mahesh@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LPv8GAQZ;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M6ykV6sz9z3bhK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 16:28:02 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27H6H6f9023201;
	Wed, 17 Aug 2022 06:27:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : reply-to : references : mime-version : content-type
 : in-reply-to; s=pp1; bh=b3c+T/I8VRN99OAtLfw36601faUhtTknvvWcypz9uCc=;
 b=LPv8GAQZktEHbFfobUM9FCicQsCJotogmIcZhvWtvtsGJQnWfB8jyEi2Bwd/vS9/ebfl
 dIwW+Gmc+lGM7rMWTT9KKkYrl2FxcRyGljivASo9XbMl8kAowCZddWkMI9MYYwzQRI1Q
 FzNG7lYmtZTY/NJQu8L4pa/KbtZPxTmkFfilC9jX9OqBZ8cjj9ZcxlqlOTa45Qta88WF
 B3S34pryFPiTDUyzaZXlRSNHFILWYlO7a3KtRTIbUflub/kiaauvn6PBzoNIGNiUaBHD
 0n0bNcQfmBmCuobVizTeG5VaNEM3drSfTIzDMah1ywzMwZWfECHFsxWy2Wjbr7IP78TY KA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0tx1g6yn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 06:27:54 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 27H6LZ1A005580;
	Wed, 17 Aug 2022 06:27:54 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3j0tx1g6xg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 06:27:54 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 27H66VYT026302;
	Wed, 17 Aug 2022 06:27:51 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
	by ppma04ams.nl.ibm.com with ESMTP id 3hx3k9c288-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Aug 2022 06:27:51 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 27H6RnZQ20840814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 17 Aug 2022 06:27:49 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7A243A4040;
	Wed, 17 Aug 2022 06:27:49 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 18F7DA404D;
	Wed, 17 Aug 2022 06:27:48 +0000 (GMT)
Received: from in.ibm.com (unknown [9.43.50.103])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed, 17 Aug 2022 06:27:47 +0000 (GMT)
Date: Wed, 17 Aug 2022 11:57:44 +0530
From: Mahesh J Salgaonkar <mahesh@linux.ibm.com>
To: "Oliver O'Halloran" <oohall@gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove myself as EEH maintainer
Message-ID: <20220817062744.gpd33ykw5jja7ql5@in.ibm.com>
References: <20220806085301.25142-1-ruscur@russell.cc>
 <87lervcn9o.fsf@mpe.ellerman.id.au>
 <CAOSf1CHtmSPSbW-KiL7svks2sXO4KEx9hZteHJjRvvfqcb6YoQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOSf1CHtmSPSbW-KiL7svks2sXO4KEx9hZteHJjRvvfqcb6YoQ@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 0wafaeaC8eibPkJIYKXP2KV5kFBwxNDe
X-Proofpoint-ORIG-GUID: yV8qLBXMaVG82w0570J-i4E-2TXM2yva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-17_04,2022-08-16_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208170025
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
Cc: Bjorn Helgaas <bhelgaas@google.com>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-pci <linux-pci@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2022-08-11 17:19:47 Thu, Oliver O'Halloran wrote:
> On Thu, Aug 11, 2022 at 4:22 PM Michael Ellerman <mpe@ellerman.id.au> wrote:
> >
> > Russell Currey <ruscur@russell.cc> writes:
> > > I haven't touched EEH in a long time I don't have much knowledge of the
> > > subsystem at this point either, so it's misleading to have me as a
> > > maintainer.
> >
> > Thank you for your service.
> >
> > > I remain grateful to Oliver for picking up my slack over the years.
> >
> > Ack.
> >
> > But I wonder if he is still happy being listed as the only maintainer.
> > Given the status is "Supported" that means "Someone is actually paid to
> > look after this" - and I suspect Oracle are probably not paying him to
> > do that?
> 
> I'm still happy to field questions and/or give reviews occasionally if
> needed, but yeah I don't have the time, hardware, or inclination to do
> any actual maintenance. IIRC Mahesh was supposed to take over
> supporting EEH after I left IBM. If he's still around he should
> probably be listed as a maintainer.

Yes, I am still around. I am currently looking into the EEH and will be
glad to take over the maintenanership of EEH for powerpc. Please feel
free to add me as maintainer for EEH.

Thanks,

-- 
Mahesh J Salgaonkar
