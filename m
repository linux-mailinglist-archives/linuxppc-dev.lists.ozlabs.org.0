Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52629719FF0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Jun 2023 16:28:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QX7lm6rlVz3dss
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Jun 2023 00:28:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=trW0NbcR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=gjoyce@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=trW0NbcR;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QX7kx4gF6z2xKj
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Jun 2023 00:27:37 +1000 (AEST)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 351EMKkp008873;
	Thu, 1 Jun 2023 14:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : reply-to : to : cc : date : in-reply-to : references : content-type
 : mime-version : content-transfer-encoding; s=pp1;
 bh=KDCcvfOMtv0kGWqqVMfClqyqi+qnHl34NlJRU1GMl78=;
 b=trW0NbcRWJm31saHH8qHdePtGhc558ZCFSRTUXxgG71M2cvXTQBk0cHOyI9T0cHeM6Si
 VRlWzm3ozzKaZtQtPbSrToxAdtxaEgZvJztdfVXFowtIrbL2UVEyRNa/QFSsuSB5gv9Q
 fvc4/N54pBJ7iXkcUKUlCUSpFbjhEoYJ8hWg9P8M8rqUU5pOm0gJkc7dBIVpL3P1BTvx
 FvsZVtJDZ3/JpZbe6HBCCq2TAWIRo50XWqKAttRt0Cnyb3CEypSOzhWJl5NfFOmwBBcF
 W4XJ1M24Pd0KiKuA+ciyqg4Z26R9KTNwReGmtzYbUDmaHktXUmEcoJXXF+eMfRZZdtT0 VA== 
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qxw1kg4cv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 14:27:24 +0000
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 351CL4wN013950;
	Thu, 1 Jun 2023 14:27:23 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([9.208.129.113])
	by ppma04wdc.us.ibm.com (PPS) with ESMTPS id 3qu9g62880-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Jun 2023 14:27:23 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com [10.39.53.230])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 351ERL4G61538576
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 1 Jun 2023 14:27:21 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B0C575805C;
	Thu,  1 Jun 2023 14:27:21 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 012E65805F;
	Thu,  1 Jun 2023 14:27:21 +0000 (GMT)
Received: from rhel-laptop.ibm.com (unknown [9.61.58.163])
	by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  1 Jun 2023 14:27:20 +0000 (GMT)
Message-ID: <ebd5fdef2348647e5c54278d67384e5d6e4b6e38.camel@linux.vnet.ibm.com>
Subject: Re: [PATCH 4/4] powerpc/pseries: update SED for PLPKS api changes
From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
To: Andrew Donnellan <ajd@linux.ibm.com>, linux-block@vger.kernel.org
Date: Thu, 01 Jun 2023 09:27:20 -0500
In-Reply-To: <aebe6be66ad982dafa072848246255b9a32e8903.camel@linux.ibm.com>
References: <20230505194402.2079010-1-gjoyce@linux.vnet.ibm.com>
	 <20230505194402.2079010-5-gjoyce@linux.vnet.ibm.com>
	 <aebe6be66ad982dafa072848246255b9a32e8903.camel@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-18.el8) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: OhzqyXviBWgIj_5lknGyuf9i39WWN-Y8
X-Proofpoint-ORIG-GUID: OhzqyXviBWgIj_5lknGyuf9i39WWN-Y8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-01_08,2023-05-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxlogscore=999 adultscore=0 clxscore=1011 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306010124
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
Cc: axboe@kernel.dk, linux-efi@vger.kernel.org, nayna@linux.ibm.com, me@benboeckel.net, keyrings@vger.kernel.org, jonathan.derrick@linux.dev, brking@linux.vnet.ibm.com, akpm@linux-foundation.org, msuchanek@suse.de, linuxppc-dev@lists.ozlabs.org, elliott@hpe.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 2023-05-15 at 15:52 +1000, Andrew Donnellan wrote:
> On Fri, 2023-05-05 at 14:44 -0500, gjoyce@linux.vnet.ibm.com wrote:
> > From: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> > 
> > Changes to the PLPKS API require minor updates to the SED Opal
> > PLPKS keystore code.
> > 
> > Signed-off-by: Greg Joyce <gjoyce@linux.vnet.ibm.com>
> 
> [+ Nayna]
> 
> This patch will need to be squashed with patch 2.

Thanks. I've squashed the patches and will resend shortly.

> 
> > ---
> >  arch/powerpc/platforms/pseries/Kconfig        |  6 +++++
> >  arch/powerpc/platforms/pseries/Makefile       |  2 +-
> >  .../powerpc/platforms/pseries/plpks_sed_ops.c | 22 +++++--------
> > ----
> > --
> >  block/Kconfig                                 |  1 +
> >  4 files changed, 13 insertions(+), 18 deletions(-)
> > 
> > diff --git a/arch/powerpc/platforms/pseries/Kconfig
> > b/arch/powerpc/platforms/pseries/Kconfig
> > index 21b22bf16ce6..c2f8a29e7b9b 100644
> > --- a/arch/powerpc/platforms/pseries/Kconfig
> > +++ b/arch/powerpc/platforms/pseries/Kconfig
> > @@ -163,6 +163,12 @@ config PSERIES_PLPKS
> >         # This option is selected by in-kernel consumers that
> > require
> >         # access to the PKS.
> >  
> > +config PSERIES_PLPKS_SED
> > +       depends on PPC_PSERIES
> > +       bool
> > +       # This option is selected by in-kernel consumers that
> > require
> > +       # access to the SED PKS keystore.
> > +
> >  config PAPR_SCM
> >         depends on PPC_PSERIES && MEMORY_HOTPLUG && LIBNVDIMM
> >         tristate "Support for the PAPR Storage Class Memory
> > interface"
> > diff --git a/arch/powerpc/platforms/pseries/Makefile
> > b/arch/powerpc/platforms/pseries/Makefile
> > index 4242aed0d5d3..1476c5e4433c 100644
> > --- a/arch/powerpc/platforms/pseries/Makefile
> > +++ b/arch/powerpc/platforms/pseries/Makefile
> > @@ -29,7 +29,7 @@ obj-$(CONFIG_PPC_SVM)         += svm.o
> >  obj-$(CONFIG_FA_DUMP)          += rtas-fadump.o
> >  obj-$(CONFIG_PSERIES_PLPKS)    += plpks.o
> >  obj-$(CONFIG_PPC_SECURE_BOOT)  += plpks-secvar.o
> > -obj-$(CONFIG_PSERIES_PLPKS_SED)        += plpks-sed.o
> > +obj-$(CONFIG_PSERIES_PLPKS_SED)        += plpks_sed_ops.o
> 
> I think you could just use obj-$(CONFIG_BLK_SED_OPAL) and then there
> wouldn't be a need to introduce a new option? Unless there's going to
> be a second consumer.

I was following the model of CONFIG_PPC_SECURE_BOOT. That gives a
littler finer control and flexibilty for using SED and PLPKS. This also
confines use of CONFIG_BLK_SED_OPAL to the base SED OPAL code.

> 
> >  obj-$(CONFIG_SUSPEND)          += suspend.o
> >  obj-$(CONFIG_PPC_VAS)          += vas.o vas-sysfs.o
> >  
> > diff --git a/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> > b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> > index 086934b319a9..c1d08075e850 100644
> > --- a/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> > +++ b/arch/powerpc/platforms/pseries/plpks_sed_ops.c
> > @@ -14,7 +14,7 @@
> >  #include <linux/string.h>
> >  #include <linux/ioctl.h>
> >  #include <linux/sed-opal-key.h>
> > -#include "plpks.h"
> > +#include <asm/plpks.h>
> >  
> >  /*
> >   * structure that contains all SED data
> > @@ -28,9 +28,6 @@ struct plpks_sed_object_data {
> >         u_char key[32];
> >  };
> >  
> > -#define PLPKS_PLATVAR_POLICY            WORLDREADABLE
> > -#define PLPKS_PLATVAR_OS_COMMON         4
> > -
> >  #define PLPKS_SED_OBJECT_DATA_V0        0
> >  #define PLPKS_SED_MANGLED_LABEL         "/default/pri"
> >  #define PLPKS_SED_COMPONENT             "sed-opal"
> > @@ -50,8 +47,8 @@ void plpks_init_var(struct plpks_var *var, char
> > *keyname)
> >                 var->name = PLPKS_SED_MANGLED_LABEL;
> >                 var->namelen = strlen(keyname);
> >         }
> > -       var->policy = PLPKS_PLATVAR_POLICY;
> > -       var->os = PLPKS_PLATVAR_OS_COMMON;
> > +       var->policy = PLPKS_WORLDREADABLE;
> > +       var->os = PLPKS_VAR_COMMON;
> >         var->data = NULL;
> >         var->datalen = 0;
> >         var->component = PLPKS_SED_COMPONENT;
> > @@ -64,28 +61,19 @@ int sed_read_key(char *keyname, char *key,
> > u_int
> > *keylen)
> >  {
> >         struct plpks_var var;
> >         struct plpks_sed_object_data data;
> > -       u_int offset;
> >         int ret;
> >         u_int len;
> >  
> >         plpks_init_var(&var, keyname);
> > -       var.data = &data;
> > +       var.data = (u8 *)&data;
> >         var.datalen = sizeof(data);
> >  
> >         ret = plpks_read_os_var(&var);
> >         if (ret != 0)
> >                 return ret;
> >  
> > -       offset = offsetof(struct plpks_sed_object_data, key);
> > -       if (offset > var.datalen) {
> > -               return -EINVAL;
> > -       }
> > -
> > -       len = min(be32_to_cpu(data.key_len), *keylen);
> > -
> > +       len = min_t(u16, be32_to_cpu(data.key_len), var.datalen);
> >         memcpy(key, data.key, len);
> > -       kfree(var.data);
> > -
> >         key[len] = '\0';
> >         *keylen = len;
> >  
> > diff --git a/block/Kconfig b/block/Kconfig
> > index 76b23114fdeb..75d4db34df5a 100644
> > --- a/block/Kconfig
> > +++ b/block/Kconfig
> > @@ -182,6 +182,7 @@ config BLK_SED_OPAL
> >         bool "Logic for interfacing with Opal enabled SEDs"
> >         depends on KEYS
> >         select PSERIES_PLPKS if PPC_PSERIES
> > +       select PSERIES_PLPKS_SED if PPC_PSERIES
> >         help
> >         Builds Logic for interfacing with Opal enabled controllers.
> >         Enabling this option enables users to setup/unlock/lock

