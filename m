Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E316C462D94
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 08:36:38 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J3DYc6F0Yz305c
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Nov 2021 18:36:36 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ev8nUjBl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=haren@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ev8nUjBl; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J3DXn51X9z3036
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Nov 2021 18:35:52 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AU6m4oW013479; 
 Tue, 30 Nov 2021 07:35:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : subject :
 from : to : date : in-reply-to : references : content-type : mime-version
 : content-transfer-encoding; s=pp1;
 bh=3NfPzkK6a602RR2p6wr3mRnb0Y+bSFdG0KqPdbgOTGc=;
 b=ev8nUjBlYzZf6PCAsjdCVkBxLDgq4GsbofwWmOqmffm+ZjoekqIAfEqShMXKF1BK8wcX
 JQUJOr45gXl6pFFpdYe/X0ZOF54d+rTNAF7vr9rO16sJoQxZlU+etxJnNcKhjaKtg80S
 +lvZpvzoR2DaPZ90JEyBw8q+5WOmSbTYBrM4NSXVJtjl3XTcQoGLcn5MhWo0a1mwT28y
 ppZT26i/bsviFSECMvysWUkToHWxQmbxbyRoI99c+XglzTKyIEbTaqTqgui9Wb9KW46L
 JY2rmmKC/3ilxGRNm5vzDx4S8+Q9G4KWq6fTjFlmc3SZ38Cf5QC8Wk4MZcXIUW9PdGuu eg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cnd7wtvtj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 07:35:38 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AU6Vrom015972;
 Tue, 30 Nov 2021 07:35:38 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cnd7wtvta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 07:35:38 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AU7RYDM027885;
 Tue, 30 Nov 2021 07:35:37 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01dal.us.ibm.com with ESMTP id 3ckcabbbjt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 30 Nov 2021 07:35:37 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AU7ZZkD53936630
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 30 Nov 2021 07:35:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9D282805C;
 Tue, 30 Nov 2021 07:35:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 445E928058;
 Tue, 30 Nov 2021 07:35:35 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.160.7.253])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 30 Nov 2021 07:35:35 +0000 (GMT)
Message-ID: <200d69c3f168f84bd8165935ad778c49bf8b83ff.camel@linux.ibm.com>
Subject: Re: [PATCH] powerpc/pseries/vas: Don't print an error when VAS is
 unavailable
From: Haren Myneni <haren@linux.ibm.com>
To: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 =?ISO-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 linuxppc-dev@lists.ozlabs.org
Date: Mon, 29 Nov 2021 23:35:33 -0800
In-Reply-To: <87fsrepms0.fsf@mpe.ellerman.id.au>
References: <20211126052133.1664375-1-npiggin@gmail.com>
 <43d21c1a-9122-d698-2229-e56c77a91313@kaod.org>
 <1637922573.8ofrolskkj.astroid@bobo.none>
 <87fsrepms0.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: OQIHoYAs0r4oNeI0DLR5RqDkMYKAy5oz
X-Proofpoint-GUID: uxxEvLdpUMjpDhSF_X0PvHZT2eogZADT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-30_05,2021-11-28_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 priorityscore=1501 adultscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 spamscore=0 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111300040
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

On Tue, 2021-11-30 at 10:25 +1100, Michael Ellerman wrote:
> Nicholas Piggin <npiggin@gmail.com> writes:
> > Excerpts from Cédric Le Goater's message of November 26, 2021 5:13
> > pm:
> > > On 11/26/21 06:21, Nicholas Piggin wrote:
> > > > KVM does not support VAS so guests always print a useless error
> > > > on boot
> > > > 
> > > >      vas: HCALL(398) error -2, query_type 0, result buffer
> > > > 0x57f2000
> > > > 
> > > > Change this to only print the message if the error is not
> > > > H_FUNCTION.
> > > 
> > > Just being curious, why is it even called since "ibm,compression"
> > > should
> > > not be exposed in the DT ?
> > 
> > It looks like vas does not test for it. I guess in theory there can
> > be 
> > other functions than compression implemented as an accelerator.
> > Maybe
> > that's why?
> 
> Yeah I guess, or it's just not structured that well. The vas platform
> code is a bit awkward, it's there to support drivers, but it's not
> actually driver code.
> 
> I think we can probably rework it so the vas code does nothing until
> a
> driver calls in to it.
> 
> eg. something like below.

Correct, Even though NXGZIP is the only usage right now, VAS is
accelerator switchboard which should support other coprocessor types
such as GZIP and 842 or SW type solutions such as fast thread wakeup
and fast memory copy. 

So can we leave VAS initialization separate from drivers and use some
feature such as FW_FEATURE_LPAR to differentiate from KVM guests?

Thanks
Haren

> 
> cheers
> 
> 
> diff --git a/arch/powerpc/platforms/pseries/vas.c
> b/arch/powerpc/platforms/pseries/vas.c
> index b043e3936d21..dc3491fc919d 100644
> --- a/arch/powerpc/platforms/pseries/vas.c
> +++ b/arch/powerpc/platforms/pseries/vas.c
> @@ -454,6 +454,8 @@ static const struct vas_user_win_ops vops_pseries
> = {
>  	.close_win	= vas_deallocate_window, /* Close window */
>  };
>  
> +static int pseries_vas_init(void);
> +
>  /*
>   * Supporting only nx-gzip coprocessor type now, but this API code
>   * extended to other coprocessor types later.
> @@ -463,7 +465,8 @@ int vas_register_api_pseries(struct module *mod,
> enum vas_cop_type cop_type,
>  {
>  	int rc;
>  
> -	if (!copypaste_feat)
> +	rc = pseries_vas_init();
> +	if (rc || !copypaste_feat)
>  		return -ENOTSUPP;
>  
>  	rc = vas_register_coproc_api(mod, cop_type, name,
> &vops_pseries);
> @@ -531,7 +534,7 @@ static int get_vas_capabilities(u8 feat, enum
> vas_cop_feat_type type,
>  	return 0;
>  }
>  
> -static int __init pseries_vas_init(void)
> +static int pseries_vas_init(void)
>  {
>  	struct hv_vas_cop_feat_caps *hv_cop_caps;
>  	struct hv_vas_all_caps *hv_caps;
> @@ -592,4 +595,3 @@ static int __init pseries_vas_init(void)
>  	kfree(hv_caps);
>  	return rc;
>  }
> -machine_device_initcall(pseries, pseries_vas_init);

