Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 830A14C0E27
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 09:22:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K3TYT6F1Bz3cGl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Feb 2022 19:22:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gqoKktQ3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gqoKktQ3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K3TXj4ZZ0z2xsS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Feb 2022 19:21:56 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21N4kfxJ031521; 
 Wed, 23 Feb 2022 08:21:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=czqLILJSZKGXDtJFL/5Sr50hwH4eAPcz/fkNJgoW4WU=;
 b=gqoKktQ33hDNIhT3JUcRADjG8XzcI9PLmTcdcPCAYkld195mjWWJ1B0OdnzTYtlumst8
 SenkxwDouz7PjPwDStstCj/uxHEieLzvn7dnxjgYsNAop3DitaLBlyuXSOcqD2EJ8Qgh
 hyho2JB/ybVpSz/0lYcQeou3CTNkD5dtfXirn9TIhxNtqEiNjep1oJdaanvJaQho3T6d
 SYb0QMWvoahqYNO1YmxL3ChYBPvOI5PLSXVr613QNXCA9DuIBbjfopWSrq/aTY7wxGIc
 SAgnn7IOgGUmOMjU9FQVXPTVF5Y3001MSDvFokPOFcwt31KkSuS6N+otYhMj/VdBnCJL yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ede6skfae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:21:52 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21N8GIw5022617;
 Wed, 23 Feb 2022 08:21:52 GMT
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ede6skfa5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:21:52 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21N8GMql016549;
 Wed, 23 Feb 2022 08:21:51 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma04wdc.us.ibm.com with ESMTP id 3ear6aer0q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 23 Feb 2022 08:21:51 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21N8LnUi56164860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 23 Feb 2022 08:21:49 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5D68C112069;
 Wed, 23 Feb 2022 08:21:49 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A59EF112062;
 Wed, 23 Feb 2022 08:21:48 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.92.72])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 23 Feb 2022 08:21:48 +0000 (GMT)
Message-ID: <e4a7ba11afb0e186224c6dda0dcb48f8565088c3.camel@linux.ibm.com>
Subject: Re: [PATCH v4 6/9] powerpc/pseries/vas: Close windows with DLPAR
 core removal
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au, nathanl@linux.ibm.com
Date: Wed, 23 Feb 2022 00:21:46 -0800
In-Reply-To: <1645600472.tj95v3iuyt.astroid@bobo.none>
References: <94434bf320affdde36090c72eeb1372f1d9978ae.camel@linux.ibm.com>
 <50c1cf6b3427bcd89fdfcf2f1245b3a42aab8391.camel@linux.ibm.com>
 <1645600472.tj95v3iuyt.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dvjf5jpRpEgBVZ0I5fnqsw3eUcO5aIZ-
X-Proofpoint-ORIG-GUID: BF6b23C08xugVL0csoIFMAE1zVdGpl5Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-23_02,2022-02-21_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 priorityscore=1501 phishscore=0 impostorscore=0 mlxlogscore=914
 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202230042
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

On Wed, 2022-02-23 at 17:23 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of February 20, 2022 6:00 am:
> > The hypervisor assigns vas credits (windows) for each LPAR based
> > on the number of cores configured in that system. The OS is
> > expected to release credits when cores are removed, and may
> > allocate more when cores are added. So there is a possibility of
> > using excessive credits (windows) in the LPAR and the hypervisor
> > expects the system to close the excessive windows so that NX load
> > can be equally distributed across all LPARs in the system.
> > 
> > When the OS closes the excessive windows in the hypervisor,
> > it sets the window status in-active and invalidates window
> > virtual address mapping. The user space receives paste instruction
> > failure if any NX requests are issued on the in-active window.
> 
> Thanks for adding this paragraph. Then presumably userspace can
> update their windows and be able to re-try with an available open
> window?
 
yes, the user space should be able to manage with the available open
windows or fall back to SW compression if can. Added this comment in
the fault hanlder patch.
> 
> in-active can be one word, not hyphenated.
> 
> 
> > This patch also adds the notifier for core removal/add to close
> > windows in the hypervisor if the system lost credits (core
> > removal) and reopen windows in the hypervisor when the previously
> > lost credits are available.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h       |   2 +
> >  arch/powerpc/platforms/pseries/vas.c | 207
> > +++++++++++++++++++++++++--
> >  arch/powerpc/platforms/pseries/vas.h |   3 +
> >  3 files changed, 204 insertions(+), 8 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 27251af18c65..6baf7b9ffed4 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -34,6 +34,8 @@
> >   */
> >  #define VAS_WIN_ACTIVE		0x0	/* Used in platform
> > independent */
> >  					/* vas mmap() */
> > +/* Window is closed in the hypervisor due to lost credit */
> > +#define VAS_WIN_NO_CRED_CLOSE	0x00000001
> 
> I thought we were getting a different status for software
> status vs status rturned by hypervisor?

vas_window->status is only for Linux status bits which are used for
active, DLPAR close or migration. We do not need status returned from
hypervisor right now. In case if needed in future, hv_status will be
added in pseries_vas_window. 

> 
> > diff --git a/arch/powerpc/platforms/pseries/vas.h
> > b/arch/powerpc/platforms/pseries/vas.h
> > index 2872532ed72a..701363cfd7c1 100644
> > --- a/arch/powerpc/platforms/pseries/vas.h
> > +++ b/arch/powerpc/platforms/pseries/vas.h
> > @@ -83,6 +83,9 @@ struct vas_cop_feat_caps {
> >  struct vas_caps {
> >  	struct vas_cop_feat_caps caps;
> >  	struct list_head list;	/* List of open windows */
> > +	int nr_close_wins;	/* closed windows in the hypervisor for
> > DLPAR */
> > +	int nr_open_windows;	/* Number of successful open
> > windows */
> > +	u8 feat;		/* Feature type */
> >  };
> 
> Still not entirely sold on the idea that nr_open_windows is a feature
> or capability, but if the code works out easier this way, sometimes
> these little hacks are reasonable.

nr_close_wins / nr_open_windows - not a capability or feature, but
these are used to track active windows and needed for DLPAR / migration
- Means total number of open windows and the actual number of windows
closed in the hypervisor. hence I did not add these elements in
 vas_cop_feat_caps struct.

Thanks
Haren

> 
> Thanks,
> Nick

