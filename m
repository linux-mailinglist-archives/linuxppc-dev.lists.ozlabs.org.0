Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90AAD58027A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jul 2022 18:12:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ls4nV307Cz3cfG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Jul 2022 02:12:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p4mC6ISK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=cheloha@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=p4mC6ISK;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ls4mn0L8fz2yJQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Jul 2022 02:11:52 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 26PG9S8F028278;
	Mon, 25 Jul 2022 16:11:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=VEyXKsLKkNRouMWUVwi/lwM5zyAUu5jFyXE4yvmUVg4=;
 b=p4mC6ISK63UhtWOy328GRCW/XKXETz3gPP9OEPdqBfBvPiCuA1BrLbHgS7kXtten01cc
 JYjXpQQ+pPbUOslT5xBKeC6Goc1cp3311UR+fqXWoc0s7X8Jj9FE6apx8eXSFxSPnRzW
 ZcjUsPA4L1GTzAHamBkYrQ7NYbpyi3U/YdsUYgraPBGvM2RPtSuB8mE5v2fUNUcCd0nG
 9x0wPzSJJEFfg4eQX2/u/2IGjYDeYU5kXgTLJ6lKvxPzdv2on5hNbopCJhl8Ne+qosEG
 E/G2QQhwYb/XfOgv7ria72Ogt83ZSFW0l8XwkrEhY5PzfRj4SxzMcniHuUZhscbHBSPk hg== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhx588ve5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 16:11:44 +0000
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 26PG9TPx028476;
	Mon, 25 Jul 2022 16:11:43 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3hhx588vcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 16:11:43 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 26PG54Qq007332;
	Mon, 25 Jul 2022 16:11:42 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com [9.57.198.25])
	by ppma01dal.us.ibm.com with ESMTP id 3hg98rrrr7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 25 Jul 2022 16:11:42 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com [9.57.199.109])
	by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 26PGBfZF64094482
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 25 Jul 2022 16:11:41 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 966F5112063;
	Mon, 25 Jul 2022 16:11:41 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 713F3112061;
	Mon, 25 Jul 2022 16:11:41 +0000 (GMT)
Received: from localhost (unknown [9.41.178.126])
	by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
	Mon, 25 Jul 2022 16:11:41 +0000 (GMT)
Date: Mon, 25 Jul 2022 11:11:41 -0500
From: Scott Cheloha <cheloha@linux.ibm.com>
To: Guenter Roeck <linux@roeck-us.net>, MichaelEllerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 4/4] watchdog/pseries-wdt: initial support for
 H_WATCHDOG-based watchdog timers
Message-ID: <Yt7AvQjmYzUTYuVy@rascal-austin-ibm-com>
References: <20220713202335.1217647-1-cheloha@linux.ibm.com>
 <20220713202335.1217647-5-cheloha@linux.ibm.com>
 <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <28eb0fd6-4c4e-17d5-0f89-73eb68b051fa@roeck-us.net>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: COQ3pD9I0UPFyKru2zaYuYKHtw1cCm--
X-Proofpoint-ORIG-GUID: lR_QCgAaIZoq2vdUyUj0xSFMOk4v0YKM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-07-25_11,2022-07-25_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2206140000 definitions=main-2207250066
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
Cc: nathanl@linux.ibm.com, wvoigt@us.ibm.com, linux-watchdog@vger.kernel.org, aik@ozlabs.ru, vaishnavi@linux.ibm.com, npiggin@gmail.com, tzungbi@kernel.org, brking@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 13, 2022 at 01:50:14PM -0700, Guenter Roeck wrote:
> On 7/13/22 13:23, Scott Cheloha wrote:
> > PAPR v2.12 defines a new hypercall, H_WATCHDOG.  The hypercall permits
> > guest control of one or more virtual watchdog timers.  The timers have
> > millisecond granularity.  The guest is terminated when a timer
> > expires.
> > 
> > This patch adds a watchdog driver for these timers, "pseries-wdt".
> > 
> > pseries_wdt_probe() currently assumes the existence of only one
> > platform device and always assigns it watchdogNumber 1.  If we ever
> > expose more than one timer to userspace we will need to devise a way
> > to assign a distinct watchdogNumber to each platform device at device
> > registration time.
> > 
> > Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>
> 
> Acked-by: Guenter Roeck <linux@roeck-us.net>

Guenter, Michael,

Which tree is taking this series?

watchdog-next or PPC development?

-Scott
