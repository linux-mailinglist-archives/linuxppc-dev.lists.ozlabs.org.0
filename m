Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFB539ABC3
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 22:25:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fwy8F2wHTz3084
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Jun 2021 06:25:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LIOYT/H8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LIOYT/H8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fwy7f37J8z2y8Q
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Jun 2021 06:25:18 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 153K3xZ6060043; Thu, 3 Jun 2021 16:25:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=7ZTy10TVkl2nzkd3atwG7H7DcUr3ggbSaJmzOgWJ7zs=;
 b=LIOYT/H8MvzCsFapFqfjsedw+T52RniKcyDWwAjhUsiQUBIZbOqqDJiY58p6F1YJOSwC
 kwkHAlHwPreevUoSxzv3TmEpbEwOKp8Cr5zHyjHMBqP+DDbSpjf8h29cq+XBqeDPJdfC
 OFU78La6pLgltO/iEtEXUHxWEyi3cs3fxAq7a/qvEtXCcWFGS9HFQPczBQz9sWA7Yncl
 LI81iMD+MTJYkHIbjQEgaJZDw6Zg28UN0DWesa3H5ZX6aXL5BI+x04YIWXLNb+Q4cO4l
 HOnNwkX04sFC4+WLsQjoNSwuS2PD4U1qMS5jatu7GJLd3v+YqIIhwXsnl/UItWUZihMV +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38y576hake-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 16:25:09 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 153K5LPg064941;
 Thu, 3 Jun 2021 16:25:09 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 38y576hak4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 16:25:09 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 153KCtAw006729;
 Thu, 3 Jun 2021 20:25:08 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma02wdc.us.ibm.com with ESMTP id 38ud8a2msf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Jun 2021 20:25:08 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 153KP7tU18350482
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Jun 2021 20:25:07 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C1F0C7805F;
 Thu,  3 Jun 2021 20:25:07 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5C1E27805E;
 Thu,  3 Jun 2021 20:25:06 +0000 (GMT)
Received: from sig-9-77-136-17.ibm.com (unknown [9.77.136.17])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Jun 2021 20:25:06 +0000 (GMT)
Message-ID: <27331a61f5f94b90748e60984a53cf8928e2d185.camel@linux.ibm.com>
Subject: Re: [PATCH v4 03/16] powerpc/vas: Add platform specific user window
 operations
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Thu, 03 Jun 2021 13:25:04 -0700
In-Reply-To: <1622692598.4iphcb4vdf.astroid@bobo.none>
References: <8d219c0816133a8643d650709066cf04c9c77322.camel@linux.ibm.com>
 <f4fb4b7bb98580ae3c025d83148a6406541de892.camel@linux.ibm.com>
 <1622692598.4iphcb4vdf.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 7sYm6qw9fIzpp8f-aO0u75M8ED43yfhn
X-Proofpoint-ORIG-GUID: WRJvWK--uW319J6223mZTsTecYhn2rOY
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-03_13:2021-06-03,
 2021-06-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0
 impostorscore=0 mlxscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 adultscore=0 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106030132
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

On Thu, 2021-06-03 at 14:05 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of May 21, 2021 7:30 pm:
> > PowerNV uses registers to open/close VAS windows, and getting the
> > paste address. Whereas the hypervisor calls are used on PowerVM.
> > 
> > This patch adds the platform specific user space window operations
> > and register with the common VAS user space interface.
> 
> Basic idea makes sense. I don't understand this code in detail
> though.
> A couple of things,
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  arch/powerpc/include/asm/vas.h              | 14 +++++-
> >  arch/powerpc/platforms/book3s/vas-api.c     | 52 ++++++++++++-----
> > ----
> >  arch/powerpc/platforms/powernv/vas-window.c | 46
> > +++++++++++++++++-
> >  3 files changed, 89 insertions(+), 23 deletions(-)
> > 
> > diff --git a/arch/powerpc/include/asm/vas.h
> > b/arch/powerpc/include/asm/vas.h
> > index 6076adf9ab4f..668303198772 100644
> > --- a/arch/powerpc/include/asm/vas.h
> > +++ b/arch/powerpc/include/asm/vas.h
> > @@ -5,6 +5,7 @@
> >  
> >  #ifndef _ASM_POWERPC_VAS_H
> >  #define _ASM_POWERPC_VAS_H
> > +#include <uapi/asm/vas-api.h>
> >  
> >  struct vas_window;
> >  
> > @@ -48,6 +49,16 @@ enum vas_cop_type {
> >  	VAS_COP_TYPE_MAX,
> >  };
> >  
> > +/*
> > + * User space window operations used for powernv and powerVM
> > + */
> > +struct vas_user_win_ops {
> > +	struct vas_window * (*open_win)(struct vas_tx_win_open_attr *,
> > +				enum vas_cop_type);
> > +	u64 (*paste_addr)(void *);
> > +	int (*close_win)(void *);
> 
> Without looking further into the series, why do these two take void
> * 
> when the first returns a vas_window * which appears to be the
> required
> argument to these?

Yes, vas_window * should be passed instead of void * for paste_addr() /
close_win()

> 
> > +static struct vas_user_win_ops vops =  {
> > +	.open_win	=	vas_user_win_open,
> > +	.paste_addr	=	vas_user_win_paste_addr,
> > +	.close_win	=	vas_user_win_close,
> > +};
> 
> const?
> 
> Thanks,
> Nick

