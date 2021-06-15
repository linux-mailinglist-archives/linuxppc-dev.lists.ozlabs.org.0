Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E539F3A72C5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 02:01:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G3pQM4L06z305w
	for <lists+linuxppc-dev@lfdr.de>; Tue, 15 Jun 2021 10:01:47 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=LFHtgx9E;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LFHtgx9E; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G3pPn2cY7z2ymS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 15 Jun 2021 10:01:16 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15ENv5AR032797; Mon, 14 Jun 2021 20:01:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=f3IQ+9mSkSmnpTuRDvx0hrRzqNBo8P7CqUdlmjVRhNU=;
 b=LFHtgx9Ew1sGZGhCjEYujoSTnboaFgO7R1StAjb4TAtP1ckgLiUn6HdIVtvmBWxDsAkc
 QdUMt98thIgiA0TD3nlVbnwHupdmakS2G2yJp1I2oOE1UzizKhZako19VkwoyiyN6+sK
 yElNSN3yt4Eju+P4w2YlkhVmRynRLy1KRlhWjuGs0DmZd8Oqwk6yb6FLZZTEcfTwE6MU
 kyGtLs9EzmVVOwcYGXjFg+QXeGplUeiSHUhS06UlRad0txP7NL/XAVrDfRl+8lzlhDiE
 T/f3QN+ueMorwAUzzpPMmwtI2uOz8lOciqY22uE3gkw8Uz4LmFWNpoPjHWTkDFwc29ht 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396h8402g2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 20:01:05 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15ENvnls033675;
 Mon, 14 Jun 2021 20:01:05 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 396h8402fg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Jun 2021 20:01:05 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15ENlXB0028332;
 Tue, 15 Jun 2021 00:01:04 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 394mj9g9ef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 15 Jun 2021 00:01:04 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15F013Vb28901800
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 15 Jun 2021 00:01:03 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8991FAC066;
 Tue, 15 Jun 2021 00:01:03 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A437EAC081;
 Tue, 15 Jun 2021 00:01:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.180.39])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 15 Jun 2021 00:01:02 +0000 (GMT)
Message-ID: <d4939c7b31626ea73322a4f2476f9999e6e35ab1.camel@linux.ibm.com>
Subject: Re: [PATCH v5 16/17] crypto/nx: Get NX capabilities for GZIP
 coprocessor type
From: Haren Myneni <haren@linux.ibm.com>
To: Nicholas Piggin <npiggin@gmail.com>, herbert@gondor.apana.org.au,
 linux-crypto@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 mpe@ellerman.id.au
Date: Mon, 14 Jun 2021 17:01:00 -0700
In-Reply-To: <1623641787.0rdwnv3k4u.astroid@bobo.none>
References: <ed7a09822cf3a2e463f942e5a37309a2365c9d79.camel@linux.ibm.com>
 <726de270eb20e0898f4391a0b0e7077697db66ab.camel@linux.ibm.com>
 <1623641787.0rdwnv3k4u.astroid@bobo.none>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.2 (3.36.2-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: B6PDft7hsjJoojsWfdZJ9oqmrSWb6fVI
X-Proofpoint-ORIG-GUID: S3EYkFFTo41ClPGjuUt5zcPHa0Olj119
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-14_14:2021-06-14,
 2021-06-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106140149
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

On Mon, 2021-06-14 at 13:39 +1000, Nicholas Piggin wrote:
> Excerpts from Haren Myneni's message of June 13, 2021 9:04 pm:
> > The hypervisor provides different capabilities that it supports
> > to define the user space NX request. These capabilities are
> > recommended minimum compression / decompression lengths and the
> > maximum request buffer size in bytes.
> > 
> > Changes to get NX overall capabilities which points to the
> > specific features that the hypervisor supports. Then retrieve
> > the capabilities for the specific feature (available only
> > for NXGZIP).
> 
> So what does this give you which you didn't have before? Should
> this go before the previous patch that enables the interface for
> guests,
> or is there some functional-yet-degraded mode that is available
> without
> this patch?
> 
> I would suggest even if this is the case to switch ordering of the 
> patches so as to reduce the matrix of functionality that userspace
> sees 
> when bisecting. Unless you specifically want this kind of
> bisectability,
> in which case make that explicit in the changelog.

Thanks for your suggestions. I will incorporate them and post next
revision. 

The user space request buffer length should not be more than
req_max_processed_len (available through sysfs). Otherwise NX will
return the request with RMA_Reject. Whereasas min_compress_len and
min_decompress_len are recommended values. 

We can add this patch and the last one (crypto/nx: Add sysfs interface
to export NX capabilities) before the actual enablement ("crypto/nx:
Register and unregisterVAS interface on PowerVM""

Thanks
Haren

> 
> Thanks,
> Nick
> 
> > Signed-off-by: Haren Myneni <haren@linux.ibm.com>
> > Acked-by: Herbert Xu <herbert@gondor.apana.org.au>
> > ---
> >  drivers/crypto/nx/nx-common-pseries.c | 86
> > +++++++++++++++++++++++++++
> >  1 file changed, 86 insertions(+)
> > 
> > diff --git a/drivers/crypto/nx/nx-common-pseries.c
> > b/drivers/crypto/nx/nx-common-pseries.c
> > index 9a40fca8a9e6..60b5049ec9f7 100644
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
> > @@ -20,6 +21,29 @@ MODULE_DESCRIPTION("842 H/W Compression driver
> > for IBM Power processors");
> >  MODULE_ALIAS_CRYPTO("842");
> >  MODULE_ALIAS_CRYPTO("842-nx");
> >  
> > +/*
> > + * Coprocessor type specific capabilities from the hypervisor.
> > + */
> > +struct hv_nx_ct_caps {
> > +	__be64	descriptor;
> > +	__be64	req_max_processed_len;	/* Max bytes in one GZIP
> > request */
> > +	__be64	min_compress_len;	/* Min compression size in
> > bytes */
> > +	__be64	min_decompress_len;	/* Min decompression size
> > in bytes */
> > +} __packed __aligned(0x1000);
> > +
> > +/*
> > + * Coprocessor type specific capabilities.
> > + */
> > +struct nx_ct_caps {
> > +	u64	descriptor;
> > +	u64	req_max_processed_len;	/* Max bytes in one GZIP request */
> > +	u64	min_compress_len;	/* Min compression in bytes */
> > +	u64	min_decompress_len;	/* Min decompression in bytes */
> > +};
> > +
> > +static u64 caps_feat;
> > +static struct nx_ct_caps nx_ct_caps;
> > +
> >  static struct nx842_constraints nx842_pseries_constraints = {
> >  	.alignment =	DDE_BUFFER_ALIGN,
> >  	.multiple =	DDE_BUFFER_LAST_MULT,
> > @@ -1066,6 +1090,64 @@ static void nx842_remove(struct vio_dev
> > *viodev)
> >  	kfree(old_devdata);
> >  }
> >  
> > +/*
> > + * Get NX capabilities from the hypervisor.
> > + * Only NXGZIP capabilities are provided by the hypersvisor right
> > + * now and these values are available to user space with sysfs.
> > + */
> > +static void __init nxct_get_capabilities(void)
> > +{
> > +	struct hv_vas_all_caps *hv_caps;
> > +	struct hv_nx_ct_caps *hv_nxc;
> > +	int rc;
> > +
> > +	hv_caps = kmalloc(sizeof(*hv_caps), GFP_KERNEL);
> > +	if (!hv_caps)
> > +		return;
> > +	/*
> > +	 * Get NX overall capabilities with feature type=0
> > +	 */
> > +	rc = h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES, 0,
> > +					  (u64)virt_to_phys(hv_caps));
> > +	if (rc)
> > +		goto out;
> > +
> > +	caps_feat = be64_to_cpu(hv_caps->feat_type);
> > +	/*
> > +	 * NX-GZIP feature available
> > +	 */
> > +	if (caps_feat & VAS_NX_GZIP_FEAT_BIT) {
> > +		hv_nxc = kmalloc(sizeof(*hv_nxc), GFP_KERNEL);
> > +		if (!hv_nxc)
> > +			goto out;
> > +		/*
> > +		 * Get capabilities for NX-GZIP feature
> > +		 */
> > +		rc = h_query_vas_capabilities(H_QUERY_NX_CAPABILITIES,
> > +						  VAS_NX_GZIP_FEAT,
> > +						  (u64)virt_to_phys(hv_
> > nxc));
> > +	} else {
> > +		pr_err("NX-GZIP feature is not available\n");
> > +		rc = -EINVAL;
> > +	}
> > +
> > +	if (!rc) {
> > +		nx_ct_caps.descriptor = be64_to_cpu(hv_nxc-
> > >descriptor);
> > +		nx_ct_caps.req_max_processed_len =
> > +				be64_to_cpu(hv_nxc-
> > >req_max_processed_len);
> > +		nx_ct_caps.min_compress_len =
> > +				be64_to_cpu(hv_nxc->min_compress_len);
> > +		nx_ct_caps.min_decompress_len =
> > +				be64_to_cpu(hv_nxc-
> > >min_decompress_len);
> > +	} else {
> > +		caps_feat = 0;
> > +	}
> > +
> > +	kfree(hv_nxc);
> > +out:
> > +	kfree(hv_caps);
> > +}
> > +
> >  static const struct vio_device_id nx842_vio_driver_ids[] = {
> >  	{"ibm,compression-v1", "ibm,compression"},
> >  	{"", ""},
> > @@ -1093,6 +1175,10 @@ static int __init nx842_pseries_init(void)
> >  		return -ENOMEM;
> >  
> >  	RCU_INIT_POINTER(devdata, new_devdata);
> > +	/*
> > +	 * Get NX capabilities from the hypervisor.
> > +	 */
> > +	nxct_get_capabilities();
> >  
> >  	ret = vio_register_driver(&nx842_vio_driver);
> >  	if (ret) {
> > -- 
> > 2.18.2
> > 
> > 
> > 

