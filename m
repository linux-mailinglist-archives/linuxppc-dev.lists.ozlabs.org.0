Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC43B622AD9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 12:44:43 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N6jn5435tz3cMN
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Nov 2022 22:44:41 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TOFQgKFS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rppt@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TOFQgKFS;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N6jm46JS9z2xWx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Nov 2022 22:43:48 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A9Ahotp002726;
	Wed, 9 Nov 2022 11:42:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pp1; bh=EofnKzaLM2ZriJlFgyL0U8/ws46EtCdD61zWpQvHXmw=;
 b=TOFQgKFS46OyHpV3GHPffIxYz53/WVEzbXS5SEjgJUTFWybdupZYswZdLZV/uLC8DRY0
 rRkgTVnvUqgQoxyRPi262ZDfpYr5yUpb+8/To40Mp8DiKeaARentrY/3pwUVr2eXZwex
 A4M6URP9XS1FU1XlPCbHON1iOYyeFx4eHOrUekYw9vBpGQhWzUXC6aOHI7VP/FoWZbNW
 hWz5lVAQS0hZhNqkOUD1Gv5VA2BtkmGZx/k58VjsiI0F6OdxoGEl+gEBeLvfs7XQYZkJ
 DiTiEPYyy9Txk5J0g4auxexmWAX/OHcz+/8bvSW65sAfEegNq6geJi5T60WxGK3BUf67 nA== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kr8wxme82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 11:42:30 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A9BZm2F006904;
	Wed, 9 Nov 2022 11:42:28 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3kngq8m390-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 09 Nov 2022 11:42:28 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A9BafjH29229496
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 9 Nov 2022 11:36:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37BFB42045;
	Wed,  9 Nov 2022 11:42:26 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A6FB342042;
	Wed,  9 Nov 2022 11:42:25 +0000 (GMT)
Received: from linux.ibm.com (unknown [9.145.181.142])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
	Wed,  9 Nov 2022 11:42:25 +0000 (GMT)
Date: Wed, 9 Nov 2022 13:42:23 +0200
From: Mike Rapoport <rppt@linux.ibm.com>
To: Yajun Deng <yajun.deng@linux.dev>
Subject: Re: [6.1.0-rc3-next-20221104] Boot failure - kernel BUG at
 mm/memblock.c:519
Message-ID: <Y2uSH8jm1MzY9Rgf@linux.ibm.com>
References: <74979021-D386-4402-BD70-167531C7405B@linux.ibm.com>
 <e00989c4a69943cb4f60fc7ffaa06f8c@linux.dev>
 <Y2oLYB7Tu7J91tVm@linux.ibm.com>
 <E2499567-0D0F-44DA-AC68-1E279009A6DE@linux.ibm.com>
 <58779468e28e026a1aa30a42ca7e8aec@linux.dev>
 <4fee7f2b0e99e256465ef6e7656c6349@linux.dev>
 <6e32f14ae25909138e40b2cfd7448ed8@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6e32f14ae25909138e40b2cfd7448ed8@linux.dev>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3p5HC0UcvjN0F4uHDdeyqnRh_gzSfBe2
X-Proofpoint-GUID: 3p5HC0UcvjN0F4uHDdeyqnRh_gzSfBe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-09_05,2022-11-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 phishscore=0 mlxlogscore=840
 lowpriorityscore=0 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211090088
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
Cc: linux-mm@kvack.org, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, open list <linux-kernel@vger.kernel.org>, Sachin Sant <sachinp@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yajun,

On Wed, Nov 09, 2022 at 11:32:27AM +0000, Yajun Deng wrote:
> November 9, 2022 6:55 PM, "Sachin Sant" <sachinp@linux.ibm.com> wrote:
> 
> >> On 09-Nov-2022, at 3:55 PM, Yajun Deng <yajun.deng@linux.dev> wrote:
> >> 
> >> November 9, 2022 6:03 PM, "Yajun Deng" <yajun.deng@linux.dev> wrote:
> >> 
> >>> Hey Mike,
> >> 
> >> Sorry, this email should be sent to Sachin but not Mike.
> >> Please forgive my confusion. So:
> >> 
> >> Hey Sachin,
> >> Can you help me test the attached file?
> >> Please use this new patch instead of the one in memblock tree.
> > 
> > Thanks for the fix. With the updated patch kernel boots correctly.
> > 
> 
> Thanks for your test results.
> 
> Hi Mike,
> Do you have any other suggestions for this patch? If not, I'll send a v3 patch.

Unfortunately I don't think the new version has much value as it does not
really eliminate the second loop in case memory allocation is required.
I'd say the improvement is not worth the churn.
 
> > Tested-by: Sachin Sant <sachinp@linux.ibm.com <sachinp@linux.ibm.com>>
> > 
> > - Sachin

-- 
Sincerely yours,
Mike.
