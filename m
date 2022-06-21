Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B67815536EB
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jun 2022 17:57:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LSB3g2XPRz3cH1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Jun 2022 01:57:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hq/jo3jL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Hq/jo3jL;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LSB2x1Gffz305D
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Jun 2022 01:56:40 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25LFsXvs021760;
	Tue, 21 Jun 2022 15:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : subject :
 from : to : cc : date : in-reply-to : references : content-type :
 mime-version : content-transfer-encoding; s=pp1;
 bh=AxSkufauQUOeia0u9yBcznU8tnLNHKa2HTwQi/mubrg=;
 b=Hq/jo3jLx7Y77hNG6RyMVUJABKvKY5EkJ2Ztx7hBmlmcVbydxtWRE6UKdgReDQDD5SpX
 r36qsvUaPl1HRCVJj0rasqFKFrPZM+b4c601+K3ufYw9Gd1AI5avL5Ao9BAYpBluZxDS
 zy0xW37dTVJFQBiq2KGnU5soFUCCb0FuFK3s+7VqzU80j2T0szeeVTmBPlEgV0W7iuwQ
 YTgu7l6YDG4X0D/EdBX4W58CTOWfWcgSjSMTTCHVB1eK+wpWkt3QYZhKPtateiGp89MI
 gHRoHZGgOI+PDC0ECBjnjTCQWHctohNTDXGrpljiz2N1WG7xF3surLi/e0nl4di3H4nq Mw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3guh1w81gt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 15:56:31 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 25LFaCX0016127;
	Tue, 21 Jun 2022 15:56:29 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
	by ppma06fra.de.ibm.com with ESMTP id 3gs5yj3csh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jun 2022 15:56:29 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
	by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 25LFuW7j24510804
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 21 Jun 2022 15:56:32 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B1D18A405C;
	Tue, 21 Jun 2022 15:56:26 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5AB6BA4054;
	Tue, 21 Jun 2022 15:56:26 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 21 Jun 2022 15:56:26 +0000 (GMT)
Received: from [9.43.178.199] (unknown [9.43.178.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id B5F75600F7;
	Wed, 22 Jun 2022 01:56:19 +1000 (AEST)
Message-ID: <4ade48fbefc59dbabaf2d9c89c27665811254ea2.camel@linux.ibm.com>
Subject: Re: [PATCH] cxl: drop unexpected word "the" in the comments
From: Andrew Donnellan <ajd@linux.ibm.com>
To: Jiang Jian <jiangjian@cdjrlc.com>, fbarrat@linux.ibm.com, arnd@arndb.de
Date: Wed, 22 Jun 2022 01:56:15 +1000
In-Reply-To: <20220621125321.122280-1-jiangjian@cdjrlc.com>
References: <20220621125321.122280-1-jiangjian@cdjrlc.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.3-1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bTULBcs58uY8yCn5-zUBDDGOzyhgkKbd
X-Proofpoint-ORIG-GUID: bTULBcs58uY8yCn5-zUBDDGOzyhgkKbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.883,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-21_08,2022-06-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 clxscore=1011 adultscore=0 impostorscore=0 spamscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 suspectscore=0 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2204290000
 definitions=main-2206210066
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
Cc: gregkh@linuxfoundation.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 2022-06-21 at 20:53 +0800, Jiang Jian wrote:
> there is an unexpected word "the" in the comments that need to be
> dropped
> 
> file: drivers/misc/cxl/cxl.h
> line: 1107
> +/* check if the given pci_dev is on the the cxl vphb bus */
> changed to
> +/* check if the given pci_dev is on the cxl vphb bus */
> 
> Signed-off-by: Jiang Jian <jiangjian@cdjrlc.com>

Thanks!

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

> ---
>  drivers/misc/cxl/cxl.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/cxl/cxl.h b/drivers/misc/cxl/cxl.h
> index 7a6dd91987fd..0562071cdd4a 100644
> --- a/drivers/misc/cxl/cxl.h
> +++ b/drivers/misc/cxl/cxl.h
> @@ -1104,7 +1104,7 @@ extern const struct cxl_backend_ops
> cxl_native_ops;
>  extern const struct cxl_backend_ops cxl_guest_ops;
>  extern const struct cxl_backend_ops *cxl_ops;
>  
> -/* check if the given pci_dev is on the the cxl vphb bus */
> +/* check if the given pci_dev is on the cxl vphb bus */
>  bool cxl_pci_is_vphb_device(struct pci_dev *dev);
>  
>  /* decode AFU error bits in the PSL register PSL_SERR_An */


