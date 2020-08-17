Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D536247A6D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 00:27:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVpZP4jB6zDqVx
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Aug 2020 08:27:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=jejb@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=o3bJlhjD; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVlFl1Zm2zDqVc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Aug 2020 05:57:45 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07HJVarS069185; Mon, 17 Aug 2020 15:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=QXJRfHN9mmsNDk6QsxgcWobeI8TPkD80t9GisADyH1o=;
 b=o3bJlhjDSSSEg4dGq9I4xGGrKMsrAoSBn41x6Llja9uWHRqZro1eS3ir0chvo9yl73GM
 QICyBow0LVqNyrgllx9sZHk4OUUVncBWVBWr6P9tHLQgTOYlkdSi265KWBJLHsEbj3mG
 7iAEoK6D5aeallb/jHWED5ghWzWHAFlrVH6Lf2QFS5zDEKKOVZadYgBvoZOEzYGjbbqr
 OALsAKxmd3To6cp1GT3u1ktlaefTZ1QmRo9TevoftrOb+qByAmG3x84MnJLU67/sV5ww
 IXpfATGvrAxCKTLUbu2loUgZR7LsSDiJ1PuzTkZViDdUfByh9Ayu4wZhzV9HAI24Lkhy IA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32y7nhdu77-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 15:57:41 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07HJVcGI069350;
 Mon, 17 Aug 2020 15:57:40 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32y7nhdu6v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 15:57:40 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07HJsWfR004287;
 Mon, 17 Aug 2020 19:57:39 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 32x7b8ued3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 17 Aug 2020 19:57:39 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07HJvaiW62718344
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 17 Aug 2020 19:57:36 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1676378060;
 Mon, 17 Aug 2020 19:57:39 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D176F78066;
 Mon, 17 Aug 2020 19:57:33 +0000 (GMT)
Received: from [153.66.254.174] (unknown [9.80.233.55])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 17 Aug 2020 19:57:33 +0000 (GMT)
Message-ID: <1597694252.22390.12.camel@linux.ibm.com>
Subject: Re: [PATCH 0/8] scsi: convert tasklets to use new tasklet_setup()
From: James Bottomley <jejb@linux.ibm.com>
To: Kees Cook <keescook@chromium.org>
Date: Mon, 17 Aug 2020 12:57:32 -0700
In-Reply-To: <202008171227.D3A4F454D8@keescook>
References: <20200817085409.25268-1-allen.cryptic@gmail.com>
 <1597675318.4475.11.camel@linux.ibm.com> <202008171227.D3A4F454D8@keescook>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-17_14:2020-08-17,
 2020-08-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 malwarescore=0 mlxscore=0 suspectscore=0 phishscore=0 bulkscore=0
 spamscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 mlxlogscore=999 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2006250000 definitions=main-2008170131
X-Mailman-Approved-At: Tue, 18 Aug 2020 08:22:15 +1000
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
Reply-To: jejb@linux.ibm.com
Cc: martin.petersen@oracle.com, linux-scsi@vger.kernel.org,
 shivasharan.srikanteshwara@broadcom.com, linux-kernel@vger.kernel.org,
 kashyap.desai@broadcom.com, sumit.saxena@broadcom.com,
 Allen Pais <allen.cryptic@gmail.com>, target-devel@vger.kernel.org,
 Allen Pais <allen.lkml@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 megaraidlinux.pdl@broadcom.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2020-08-17 at 12:28 -0700, Kees Cook wrote:
> On Mon, Aug 17, 2020 at 07:41:58AM -0700, James Bottomley wrote:
> > On Mon, 2020-08-17 at 14:24 +0530, Allen Pais wrote:
> > > From: Allen Pais <allen.lkml@gmail.com>
> > > 
> > > Commit 12cc923f1ccc ("tasklet: Introduce new initialization
> > > API")' introduced a new tasklet initialization API. This series
> > > converts all the scsi drivers to use the new tasklet_setup() API
> > 
> > I've got to say I agree with Jens, this was a silly obfuscation:
> > 
> > +#define from_tasklet(var, callback_tasklet, tasklet_fieldname) \
> > +       container_of(callback_tasklet, typeof(*var),
> > tasklet_fieldname)
> > 
> > Just use container_of directly since we all understand what it
> > does.
> 
> But then the lines get really long, wrapped, etc.

I really don't think that's a problem but if you want to add a new
generic container_of that does typeof instead of insisting on the type,
I'd be sort of OK with that ... provided you don't gratuitously alter
the argument order.

The thing I object to is that this encourages everyone to roll their
own unnecessary container_of type macros in spite of the fact that it's
function is wholly generic.  It's fine if you're eliminating one of the
arguments, or actually making the macro specific to the type, but in
this case you're not, you're making a completely generic macro where
the name is the only thing that's specific to this case.

>  This is what the timer_struct conversion did too (added a
> container_of wrapper), so I think it makes sense here too.

I didn't see that one to object to it ...

James

