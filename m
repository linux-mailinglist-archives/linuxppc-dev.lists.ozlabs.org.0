Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF08667A8FB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 03:48:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P1pFD4Vv6z3cd3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 25 Jan 2023 13:48:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEtatucx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=zohar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=MEtatucx;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P1pDD6RTxz30R1
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 25 Jan 2023 13:47:56 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30P25CfQ000921;
	Wed, 25 Jan 2023 02:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=xcouaf8WF3bKdZYFqAH7FiBbZbwxJAqyIEnMuh21s7o=;
 b=MEtatucxswP3chHoB1y329bLD8EWnP2qrpsSY9L2eLKmHfpBG0suYquygzZx+nguc5/T
 jpvM6vQPtqTcf+i50aVhKp40gHf5vd0ViN5OIlN4qWRubPk6pIHBfLfm4NRViT5xlEND
 w+kvuxKzE+CHik0xUvcjnxWE3RfDiv9dM9f1Ya3bs/yEPjav9GOco4B5dAImmcXDbDFg
 VTvcmf/JJQbJ+RouxDzMmQ7L1O4D5tLvxlK8BCFe3Ql5X0JyZOejfISINGNG3SNV7cl9
 7rwRC7wXO+zHOMeq3rLD3n5XVXnU3TLyZNvsh8nUxJNrJVroyFX0xoAHRi6SiZnZEFkF 8Q== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com [169.55.85.253])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nacg17ger-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 02:47:48 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
	by ppma01wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 30P1Xb6G010736;
	Wed, 25 Jan 2023 02:47:47 GMT
Received: from smtprelay04.dal12v.mail.ibm.com ([9.208.130.102])
	by ppma01wdc.us.ibm.com (PPS) with ESMTPS id 3n87p75mph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jan 2023 02:47:47 +0000
Received: from smtpav04.wdc07v.mail.ibm.com (smtpav04.wdc07v.mail.ibm.com [10.39.53.231])
	by smtprelay04.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 30P2lktU11600598
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jan 2023 02:47:46 GMT
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 176F558058;
	Wed, 25 Jan 2023 02:47:46 +0000 (GMT)
Received: from smtpav04.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9333D58056;
	Wed, 25 Jan 2023 02:47:44 +0000 (GMT)
Received: from sig-9-77-142-161.ibm.com (unknown [9.77.142.161])
	by smtpav04.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jan 2023 02:47:44 +0000 (GMT)
Message-ID: <adbb8d2f438f01f32d9e09b508cde31b3efdc3a4.camel@linux.ibm.com>
Subject: Re: [PATCH v4 24/24] integrity/powerpc: Support loading keys from
 pseries secvar
From: Mimi Zohar <zohar@linux.ibm.com>
To: Russell Currey <ruscur@russell.cc>, Andrew Donnellan
 <ajd@linux.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-integrity@vger.kernel.org
Date: Tue, 24 Jan 2023 21:47:44 -0500
In-Reply-To: <71b48934e26a991eaf62c9869a8dfee769e0799d.camel@russell.cc>
References: <20230120074306.1326298-1-ajd@linux.ibm.com>
	 <20230120074306.1326298-25-ajd@linux.ibm.com>
	 <57dca1ea3ef66bc0935bdd1dab4536f1151f4004.camel@linux.ibm.com>
	 <71b48934e26a991eaf62c9869a8dfee769e0799d.camel@russell.cc>
Content-Type: text/plain; charset="ISO-8859-15"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: dtJwXYAFt2-I7yskS6p4JbtAx62PVEPv
X-Proofpoint-GUID: dtJwXYAFt2-I7yskS6p4JbtAx62PVEPv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-24_17,2023-01-24_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 adultscore=0 bulkscore=0 malwarescore=0
 clxscore=1015 impostorscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301250019
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
Cc: sudhakar@linux.ibm.com, bgray@linux.ibm.com, erichte@linux.ibm.com, gregkh@linuxfoundation.org, nayna@linux.ibm.com, linux-kernel@vger.kernel.org, gjoyce@linux.ibm.com, joel@jms.id.au, gcwilson@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, 2023-01-25 at 13:23 +1100, Russell Currey wrote:
> On Tue, 2023-01-24 at 10:14 -0500, Mimi Zohar wrote:
> > On Fri, 2023-01-20 at 18:43 +1100, Andrew Donnellan wrote:
> > > From: Russell Currey <ruscur@russell.cc>
> > > 
> > > The secvar object format is only in the device tree under powernv.
> > > We now have an API call to retrieve it in a generic way, so we
> > > should
> > > use that instead of having to handle the DT here.
> > > 
> > > Add support for pseries secvar, with the "ibm,plpks-sb-v1" format.
> > > The object format is expected to be the same, so there shouldn't be
> > > any
> > > functional differences between objects retrieved from powernv and
> > > pseries.
> > > 
> > > Signed-off-by: Russell Currey <ruscur@russell.cc>
> > > Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
> > > 
> > > ---
> > > 
> > > v3: New patch
> > > 
> > > v4: Pass format buffer size (stefanb, npiggin)
> > > ---
> > >  .../integrity/platform_certs/load_powerpc.c     | 17 ++++++++++---
> > > ----
> > >  1 file changed, 10 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/security/integrity/platform_certs/load_powerpc.c
> > > b/security/integrity/platform_certs/load_powerpc.c
> > > index dee51606d5f4..d4ce91bf3fec 100644
> > > --- a/security/integrity/platform_certs/load_powerpc.c
> > > +++ b/security/integrity/platform_certs/load_powerpc.c
> > > @@ -10,7 +10,6 @@
> > >  #include <linux/cred.h>
> > >  #include <linux/err.h>
> > >  #include <linux/slab.h>
> > > -#include <linux/of.h>
> > >  #include <asm/secure_boot.h>
> > >  #include <asm/secvar.h>
> > >  #include "keyring_handler.h"
> > > @@ -59,16 +58,22 @@ static int __init load_powerpc_certs(void)
> > >         void *db = NULL, *dbx = NULL;
> > >         u64 dbsize = 0, dbxsize = 0;
> > >         int rc = 0;
> > > -       struct device_node *node;
> > > +       ssize_t len;
> > > +       char buf[32];
> > >  
> > >         if (!secvar_ops)
> > >                 return -ENODEV;
> > >  
> > > -       /* The following only applies for the edk2-compat backend.
> > > */
> > > -       node = of_find_compatible_node(NULL, NULL, "ibm,edk2-
> > > compat-v1");
> > > -       if (!node)
> > > +       len = secvar_ops->format(buf, 32);
> > 
> > "powerpc/secvar: Handle format string in the consumer"  defines
> > opal_secvar_format() for the object format "ibm,secvar-backend". 
> > Here
> > shouldn't it being returning the format for "ibm,edk2-compat-v1"?
> > 
> 
> They end up with the same value.  The DT structure on powernv looks
> like this:
> 
> /proc/device-tree/ibm,opal/secvar:
> name             "secvar"
> compatible       "ibm,secvar-backend"
> 		 "ibm,edk2-compat-v1"
> format           "ibm,edk2-compat-v1"
> max-var-key-len  00000000 00000400
> phandle          0000805a (32858)
> max-var-size     00000000 00002000
> 
> The existing code is checking for a node compatible with "ibm,edk2-
> compat-v1", which would match the node above.  opal_secvar_format()
> checks for a node compatible with "ibm,secvar-backend" (again, matching
> above) and then returns the contents of the "format" string, which is
> "ibm,edk2-compat-v1".
> 
> Ultimately it's two different ways of doing the same thing, but this
> way load_powerpc_certs() doesn't have to interact with the device tree.

Agreed.  Thank you for the explanation.  To simplify review, I suggest
either adding this explanation in the patch description or stage the
change by replacing the existing "ibm,edk2-compat-v1" usage first.

thanks,

Mimi

> 
> 
> > Mimi
> > 
> > > +       if (len <= 0)
> > >                 return -ENODEV;
> > >  
> > > +       // Check for known secure boot implementations from OPAL or
> > > PLPKS
> > > +       if (strcmp("ibm,edk2-compat-v1", buf) && strcmp("ibm,plpks-
> > > sb-v1", buf)) {
> > > +               pr_err("Unsupported secvar implementation \"%s\",
> > > not loading certs\n", buf);
> > > +               return -ENODEV;
> > > +       }
> > > +
> > >         /*
> > >          * Get db, and dbx. They might not exist, so it isn't an
> > > error if we
> > >          * can't get them.
> > > @@ -103,8 +108,6 @@ static int __init load_powerpc_certs(void)
> > >                 kfree(dbx);
> > >         }
> > >  
> > > -       of_node_put(node);
> > > -
> > >         return rc;
> > >  }
> > >  late_initcall(load_powerpc_certs);
> > 
> > 
> 


