Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C3374EAD4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 11:39:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n1l+7hFH;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R0bS52T93z3bsn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Jul 2023 19:39:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=n1l+7hFH;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=gautam@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R0bRC055hz2xq1
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jul 2023 19:38:46 +1000 (AEST)
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36B9MbqF004488;
	Tue, 11 Jul 2023 09:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=RQUYzWtDk+t8WoyHZeaFpgI9UITjO4qOa7OE8UZvWrQ=;
 b=n1l+7hFH2JKBxexGTXuc2+t7hXxdwCNWJ0r5VUXMamEyIDYiHZYoIGcBXikghQnty5AQ
 inNJYzSzw1/Bz/dmXTM47e5l//5jVochRUGfKgXFJM0lYq9xgrTXmurNNmEv1DaJEuF2
 AY/quWHmN59HU+81jPH6+HnBlJ99t6kwcrqkWaEim3wXOcbRvaJJA/H6AyIKGuVM/7xt
 t59PoIGQdEiTHv2zp+HoOVhAc7zs6g7mbNd2yPdfmZxG3YGDc6yRHu8YNBcf86+D+M4a
 /txSwAS9CZG2OyY7xn8elu5f4ABQdByveSOI9Lona8NyxddN8ssUvmNH4Pl478zokNnj TQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs4cv0cn5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 09:38:37 +0000
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36B9NqRT009514;
	Tue, 11 Jul 2023 09:38:37 GMT
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com [149.81.74.108])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rs4cv0cmd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 09:38:37 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
	by ppma05fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36B4eu0t013369;
	Tue, 11 Jul 2023 09:33:33 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma05fra.de.ibm.com (PPS) with ESMTPS id 3rpye599a4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jul 2023 09:33:33 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36B9XV798585948
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 11 Jul 2023 09:33:31 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1A068200CD;
	Tue, 11 Jul 2023 09:33:31 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4FC87200CF;
	Tue, 11 Jul 2023 09:33:29 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com (unknown [9.204.206.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTPS;
	Tue, 11 Jul 2023 09:33:29 +0000 (GMT)
Date: Tue, 11 Jul 2023 15:03:22 +0530
From: Gautam Menghani <gautam@linux.ibm.com>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH] arch/powerpc: Remove unnecessary endian conversion code
 in XICS
Message-ID: <ZK0h4jR/St1yrOLo@li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.ibm.com>
References: <20230630055628.17790-1-gautam@linux.ibm.com>
 <39920b0f-f261-8417-af7a-eef791ad5726@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <39920b0f-f261-8417-af7a-eef791ad5726@gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bRTDZMOsMMfPhUt4gp9wtrL09ncjzmVn
X-Proofpoint-ORIG-GUID: A-W74D55u-paQv7fWdrrZHMGA4cHDrk7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-11_04,2023-07-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 mlxscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2307110084
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
Cc: linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 06, 2023 at 05:50:57PM +1000, Jordan Niethe wrote:
> 
> 
> On 30/6/23 3:56 pm, Gautam Menghani wrote:
> > Remove an unnecessary piece of code that does an endianness conversion but
> > does not use the result. The following warning was reported by Clang's
> > static analyzer:
> > 
> > arch/powerpc/sysdev/xics/ics-opal.c:114:2: warning: Value stored to
> > 'server' is never read [deadcode.DeadStores]
> >          server = be16_to_cpu(oserver);
> > 
> > As the result of endianness conversion is never used, delete the line
> > and fix the warning.
> > 
> > Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
> 
> 'server' was used as a parameter to opal_get_xive() in commit 5c7c1e9444d8
> ("powerpc/powernv: Add OPAL ICS backend") when it was introduced. 'server'
> was also used in an error message for the call to opal_get_xive().
> 
> 'server' was always later set by a call to ics_opal_mangle_server() before
> being used.
> 
> Commit bf8e0f891a32 ("powerpc/powernv: Fix endian issues in OPAL ICS
> backend") used a new variable 'oserver' as the parameter to opal_get_xive()
> instead of 'server' for endian correctness. It also removed 'server' from
> the error message for the call to opal_get_xive().
> 
> It was commit bf8e0f891a32 that added the unnecessary conversion and never
> used the result.
> 
> Reviewed-by: Jordan Niethe <jniethe5@gmail.com>

Yes, thanks for the info Jordan. Just to add to this,
ics_opal_mangle_server() needs input in LE and the 'wanted_server' is
already LE as xics_get_irq_server() is returning result in LE. So the
line

`server = be16_to_cpu(oserver);'

is indeed not required.

Thanks,
Gautam

> 
> 
> > ---
> >   arch/powerpc/sysdev/xics/ics-opal.c | 1 -
> >   1 file changed, 1 deletion(-)
> > 
> > diff --git a/arch/powerpc/sysdev/xics/ics-opal.c b/arch/powerpc/sysdev/xics/ics-opal.c
> > index 6cfbb4fac7fb..5fe73dabab79 100644
> > --- a/arch/powerpc/sysdev/xics/ics-opal.c
> > +++ b/arch/powerpc/sysdev/xics/ics-opal.c
> > @@ -111,7 +111,6 @@ static int ics_opal_set_affinity(struct irq_data *d,
> >   		       __func__, d->irq, hw_irq, rc);
> >   		return -1;
> >   	}
> > -	server = be16_to_cpu(oserver);
> >   	wanted_server = xics_get_irq_server(d->irq, cpumask, 1);
> >   	if (wanted_server < 0) {
> > 
