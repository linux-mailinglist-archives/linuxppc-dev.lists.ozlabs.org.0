Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA846064C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 15:02:43 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45gFPW1gdPzDqBv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Jul 2019 23:02:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=prudo@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45gFLr0JhLzDqdr
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Jul 2019 23:00:18 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x65CvBgZ052616
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 5 Jul 2019 09:00:13 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tj6fu1fuj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Jul 2019 09:00:13 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <prudo@linux.ibm.com>;
 Fri, 5 Jul 2019 14:00:10 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 5 Jul 2019 14:00:03 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x65D025O43581636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 5 Jul 2019 13:00:02 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 29A68A4040;
 Fri,  5 Jul 2019 13:00:02 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 99C9DA404D;
 Fri,  5 Jul 2019 13:00:01 +0000 (GMT)
Received: from laptop-ibm (unknown [9.152.212.201])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  5 Jul 2019 13:00:01 +0000 (GMT)
Date: Fri, 5 Jul 2019 15:00:00 +0200
From: Philipp Rudo <prudo@linux.ibm.com>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH v12 01/11] MODSIGN: Export module signature definitions
In-Reply-To: <874l41ocf5.fsf@morokweng.localdomain>
References: <20190628021934.4260-1-bauerman@linux.ibm.com>
 <20190628021934.4260-2-bauerman@linux.ibm.com>
 <20190701144752.GC25484@linux-8ccs>
 <87lfxel2q6.fsf@morokweng.localdomain>
 <20190704125427.31146026@laptop-ibm>
 <874l41ocf5.fsf@morokweng.localdomain>
Organization: IBM
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19070513-0028-0000-0000-000003812FA9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070513-0029-0000-0000-0000244131CF
Message-Id: <20190705150000.372345b0@laptop-ibm>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-05_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907050156
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
Cc: linux-s390@vger.kernel.org, Herbert Xu <herbert@gondor.apana.org.au>,
 linux-doc@vger.kernel.org, Dmitry Kasatkin <dmitry.kasatkin@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jonathan Corbet <corbet@lwn.net>,
 Heiko Carstens <heiko.carstens@de.ibm.com>, linux-kernel@vger.kernel.org,
 Mimi Zohar <zohar@linux.ibm.com>, James Morris <jmorris@namei.org>, David
 Howells <dhowells@redhat.com>, "AKASHI,
 Takahiro" <takahiro.akashi@linaro.org>, linux-security-module@vger.kernel.org,
 keyrings@vger.kernel.org, linux-crypto@vger.kernel.org,
 Jessica Yu <jeyu@kernel.org>, linux-integrity@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, David Woodhouse <dwmw2@infradead.org>,
 "Serge E. Hallyn" <serge@hallyn.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Thiago,

On Thu, 04 Jul 2019 15:57:34 -0300
Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:

> Hello Philipp,
> 
> Philipp Rudo <prudo@linux.ibm.com> writes:
> 
> > Hi Thiago,
> >
> >
> > On Thu, 04 Jul 2019 03:42:57 -0300
> > Thiago Jung Bauermann <bauerman@linux.ibm.com> wrote:
> >  
> >> Jessica Yu <jeyu@kernel.org> writes:
> >>   
> >> > +++ Thiago Jung Bauermann [27/06/19 23:19 -0300]:    
> >> >>IMA will use the module_signature format for append signatures, so export
> >> >>the relevant definitions and factor out the code which verifies that the
> >> >>appended signature trailer is valid.
> >> >>
> >> >>Also, create a CONFIG_MODULE_SIG_FORMAT option so that IMA can select it
> >> >>and be able to use mod_check_sig() without having to depend on either
> >> >>CONFIG_MODULE_SIG or CONFIG_MODULES.
> >> >>
> >> >>Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> >> >>Reviewed-by: Mimi Zohar <zohar@linux.ibm.com>
> >> >>Cc: Jessica Yu <jeyu@kernel.org>
> >> >>---
> >> >> include/linux/module.h           |  3 --
> >> >> include/linux/module_signature.h | 44 +++++++++++++++++++++++++
> >> >> init/Kconfig                     |  6 +++-
> >> >> kernel/Makefile                  |  1 +
> >> >> kernel/module.c                  |  1 +
> >> >> kernel/module_signature.c        | 46 ++++++++++++++++++++++++++
> >> >> kernel/module_signing.c          | 56 +++++---------------------------
> >> >> scripts/Makefile                 |  2 +-
> >> >> 8 files changed, 106 insertions(+), 53 deletions(-)
> >> >>
> >> >>diff --git a/include/linux/module.h b/include/linux/module.h
> >> >>index 188998d3dca9..aa56f531cf1e 100644
> >> >>--- a/include/linux/module.h
> >> >>+++ b/include/linux/module.h
> >> >>@@ -25,9 +25,6 @@
> >> >> #include <linux/percpu.h>
> >> >> #include <asm/module.h>
> >> >>
> >> >>-/* In stripped ARM and x86-64 modules, ~ is surprisingly rare. */
> >> >>-#define MODULE_SIG_STRING "~Module signature appended~\n"
> >> >>-    
> >> >
> >> > Hi Thiago, apologies for the delay.    
> >> 
> >> Hello Jessica, thanks for reviewing the patch!
> >>   
> >> > It looks like arch/s390/kernel/machine_kexec_file.c also relies on
> >> > MODULE_SIG_STRING being defined, so module_signature.h will need to be
> >> > included there too, otherwise we'll run into a compilation error.    
> >> 
> >> Indeed. Thanks for spotting that. The patch below fixes it. It's
> >> identical to the previous version except for the changes in 
> >> arch/s390/kernel/machine_kexec_file.c and their description in the
> >> commit message. I'm also copying some s390 people in this email.  
> >
> > to me the s390 part looks good but for one minor nit.  
> 
> Thanks for the prompt review!
> 
> > In arch/s390/Kconfig KEXEC_VERIFY_SIG currently depends on
> > SYSTEM_DATA_VERIFICATION. I'd prefer when you update this to the new
> > MODULE_SIG_FORMAT. It shouldn't make any difference right now, as we don't
> > use mod_check_sig in our code path. But it could cause problems in the future,
> > when more code might be shared.  
> 
> Makes sense. Here is the updated patch with the Kconfig change.
> 

The patch looks good now.

Thanks a lot
PHilipp

