Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 59EEE4C0E60
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 09:40:32 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3Ty54vjpz3bZL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 19:40:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FXW/z8Ct;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FXW/z8Ct; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3TxR1TXvz3Wtt
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 19:39:54 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N8MSit021994; 
 Wed, 23 Feb 2022 08:39:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=0tD0kglXJ41AE5xjCmYNmeJrBt/xto9E+PyH5CI8WFU=;
 b=FXW/z8CtwPL3mHgarbAnAHv2HNwmIOffvYlUSnQcyZG1agwGInmd1bN8fcVocbsjNgN9
 LYPzD0VNMvACUUQ+r4o+LEk4i1qEXc/v1GNVqZAagmEzzzt9P1m3wRe/4uRY+xydfsrC
 t5HHnmQFQH+dmW++lK9dTLn0YwgRZFYys1OeuM1+fvkK1ZS1UQ36OufJl6Ynw6EIFY/R
 6I0ksgiBIsXuM6ccsKupJ4EdtkgaPG7J7ffqHZ6HO9q9iAr8vAC9OtDAzdcbXtdATuxa
 RiL5TX3KW4Gxk0TBA+a0EbDwXy6VD60QJqPuYkJw5IiMiT1N96VxciZUGPZnadOSKtlX Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eddpcc94k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:39:50 +0000
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21N86Qsn014480;
 Wed, 23 Feb 2022 08:39:50 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3eddpcc946-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:39:50 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21N8YLt3022308;
 Wed, 23 Feb 2022 08:39:49 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3ed22dq4e0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:39:49 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21N8djxh42795316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 08:39:45 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 858F1AC066;
 Wed, 23 Feb 2022 08:39:45 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 73AF0AC065;
 Wed, 23 Feb 2022 08:39:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Feb 2022 08:39:44 +0000 (GMT)
Message-ID: <c7df18eb08b34c519501b8702c2103357e15babe.camel@linux.ibm.com>
Subject: Re: [PATCH v4 9/9] powerpc/pseries/vas: Write 'nr_total_credits'
 for QoS credits change
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Wed, 23 Feb 2022 00:39:42 -0800
In-Reply-To: <1645601513.45xu2b6rs6.astroid@bobo.none>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <790aac27437fdd13b6e1dac36682b123f9050b04.camel@linux.ibm.com>
 <1645601513.45xu2b6rs6.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3td0VJmjLtzcEWlhtksVt02DbdZqsvlz
X-Proofpoint-GUID: J0xXGQLJ9N492xoko79NDYmCYm7Ij3VD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_03,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202230045
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2022-02-23 at 17:33 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 6:03 am:
> > pseries supports two types of credits - Default (uses normal
> > priority
> > FIFO) and Qality of service (QoS uses high priority FIFO). The user
> > decides the number of QoS credits and sets this value with HMC
> > interface. With the core add/removal, this value can be changed in
> > HMC
> > which invokes drmgr to communicate to the kernel.
> > 
> > This patch adds an interface so that drmgr command can write the
> > new
> > target QoS credits in sysfs. But the kernel gets the new QoS
> > capabilities from the hypervisor whenever nr_total_credits is
> > updated
> > to make sure sync with the values in the hypervisor.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/platforms/pseries/vas-sysfs.c | 33
> > +++++++++++++++++++++-
> >  arch/powerpc/platforms/pseries/vas.c       |  2 +-
> >  arch/powerpc/platforms/pseries/vas.h       |  1 +
> >  3 files changed, 34 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/vas-sysfs.c
> > b/arch/powerpc/platforms/pseries/vas-sysfs.c
> > index e24d3edb3021..20745cd75f27 100644
> > --- a/arch/powerpc/platforms/pseries/vas-sysfs.c
> > +++ b/arch/powerpc/platforms/pseries/vas-sysfs.c
> > @@ -25,6 +25,33 @@ struct vas_caps_entry {
> >  
> >  #define to_caps_entry(entry) container_of(entry, struct
> > vas_caps_entry, kobj)
> >  
> > +/*
> > + * This function is used to get the notification from the drmgr
> > when
> > + * QoS credits are changed. Though receiving the target total QoS
> > + * credits here, get the official QoS capabilities from the
> > hypervisor.
> > + */
> > +static ssize_t nr_total_credits_store(struct vas_cop_feat_caps
> > *caps,
> > +				       const char *buf, size_t count)
> > +{
> > +	int err;
> > +	u16 creds;
> > +
> > +	/*
> > +	 * Nothing to do for default credit type.
> > +	 */
> > +	if (caps->win_type == VAS_GZIP_DEF_FEAT_TYPE)
> > +		return -EOPNOTSUPP;
> > +
> > +	err = kstrtou16(buf, 0, &creds);
> > +	if (!err)
> > +		err = vas_reconfig_capabilties(caps->win_type);
> 
> So what's happening here? The creds value is ignored? Can it just
> be a write-only file which is named appropriately to indicate it
> can be written-to to trigger an update?

Yes, new credits value is ignored. When the user changes QoS credits
with the HMC interface, it should reflect in QoS capability in the
hypervisor. So ignoring the credit value here and get the capability
value from the hypervisor.

This file should be read/write - the user space should be able to read
the current configured value for both credit types - default and QoS

Can I say nr_total_credits_update?

Thanks
Haren

> 
> Thanks,
> Nick

