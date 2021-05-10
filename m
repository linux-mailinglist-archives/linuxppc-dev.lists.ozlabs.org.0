Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3754A379882
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 May 2021 22:45:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FfCjy1kzqz2xfw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 May 2021 06:45:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OO7YzXH3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=OO7YzXH3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FfCjM3P09z2yYK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 May 2021 06:44:54 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14AKY3SM008803; Mon, 10 May 2021 16:44:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=u4W59tiNI7+K8Tjv4XJcfRVD5uOnsgU+5CykAWEPouo=;
 b=OO7YzXH3Eo3sIkkfPFDsZH9CWJ1u1RmcGtczXplCMuxVfgCNtVS1oJi8Gcjy1zHryzZB
 +ouXduenWXejLoqWorbHttObP/+1iJu01VsPQaN0VSeu1kty4aJ5bRA7ekUBIannsG+k
 /vyPUR21eNCwbAdpqWr4FC/pl0OoormCa/iVbdFIu2kLMCNa2ypD/AmvCeOQw022PlLO
 fuj8qJFZ5QjpdFJnueYaQ7DuEByCdaqffgdGCOevyaOQjU/K+pXMRhwtvl6ircPeBYYi
 hBOdSB0cq7ewPG2EOSEN8LL3TjO3X7QRJERqaSpogjLjIzS18g8HiwgouRgEiJtbxRXQ lQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38fa6gun7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 16:44:49 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14AKY4J8008900;
 Mon, 10 May 2021 16:44:48 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38fa6gun6q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 16:44:48 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14AKauWa024782;
 Mon, 10 May 2021 20:44:48 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 38dj9958g1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 10 May 2021 20:44:47 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14AKik3s15794674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 10 May 2021 20:44:46 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6DB86A047;
 Mon, 10 May 2021 20:44:46 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3BAD76A04D;
 Mon, 10 May 2021 20:44:45 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.80.194.217])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 10 May 2021 20:44:44 +0000 (GMT)
Message-ID: <deca09ae6704e3a9bf9dabb2b9e3ffff1ab00843.camel@linux.ibm.com>
Subject: Re: [V3 PATCH 15/16] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 10 May 2021 13:44:43 -0700
In-Reply-To: <1620628516.4xglqwl3t1.astroid@bobo.none>
References: <a910e5bd3f3398b4bd430b25a856500735b993c3.camel@linux.ibm.com>
 <e5fff6adbf3ce7769b0efe4846f39dbc6c795dd1.camel@linux.ibm.com>
 <1620628516.4xglqwl3t1.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: yFy13NcqCcaPIuPPpP8Sq1fCrjQgiElk
X-Proofpoint-ORIG-GUID: fLtLRej4ES9accynkQrdklW8-H4JHOKc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-10_12:2021-05-10,
 2021-05-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=999 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105100140
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

On Mon, 2021-05-10 at 16:38 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of April 18, 2021 7:12 am:
> > phyp provides NX capabilities which gives recommended minimum
> > compression / decompression length and maximum request buffer size
> > in bytes.
> > 
> > Changes to get NX overall capabilities which points to the specific
> > features phyp supports. Then retrieve NXGZIP specific capabilities.
> > 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > ---
> >  drivers/crypto/nx/nx-common-pseries.c | 83
> > +++++++++++++++++++++++++++
> >  1 file changed, 83 insertions(+)
> > 
> > diff --git a/drivers/crypto/nx/nx-common-pseries.c
> > b/drivers/crypto/nx/nx-common-pseries.c
> > index 9a40fca8a9e6..49224870d05e 100644
> > --- a/drivers/crypto/nx/nx-common-pseries.c
> > +++ b/drivers/crypto/nx/nx-common-pseries.c
> > @@ -9,6 +9,7 @@
> >   */
> >  
> >  #include <asm/vio.h>
> > +#include <asm/hvcall.h>
> >  #include <asm/vas.h>
> >  
> >  #include "nx-842.h"
> > @@ -20,6 +21,24 @@ MODULE_DESCRIPTION("842 H/W Compression driver
> > for IBM Power processors");
> >  MODULE_ALIAS_CRYPTO("842");
> >  MODULE_ALIAS_CRYPTO("842-nx");
> >  
> > +struct nx_ct_capabs_be {
> 
> What does "ct" mean? I've seen it in a few other places too.

ct means coprocessor type such as 842 and GZIP. phyp provides only GZIP
capabilities right now. But this struct may be extended to other types
in future.

> 
> > +	__be64	descriptor;
> > +	__be64	req_max_processed_len;	/* Max bytes in one GZIP
> > request */
> > +	__be64	min_compress_len;	/* Min compression size in
> > bytes */
> > +	__be64	min_decompress_len;	/* Min decompression size
> > in bytes */
> > +} __packed __aligned(0x1000);
> > +
> > +struct nx_ct_capabs {
> > +	char	name[VAS_DESCR_LEN + 1];
> > +	u64	descriptor;
> > +	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
> > +	u64	min_compress_len;	/* Min compression in bytes */
> > +	u64	min_decompress_len;	/* Min decompression in bytes */
> > +};
> > +
> > +u64 capab_feat = 0;
> 
> Why is this here and not a local variable?

capab_feat is used to add / delete sysfs entries.

> 
> > +struct nx_ct_capabs nx_ct_capab;
> 
> It's okay and generally better to use the same name as the struct
> name
> in this situation, i.e.,
> 
> "struct nx_ct_capabs nx_ct_capabs"
> 
> (modulo static / caps / etc)

Sure, will change.

> 
> Thanks,
> Nick

