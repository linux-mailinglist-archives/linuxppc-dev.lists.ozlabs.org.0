Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C25312E9228
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 09:52:09 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D8Ts239jlzDqM0
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 Jan 2021 19:52:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TZVcY9mm; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D8TqC5g6DzDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 Jan 2021 19:50:24 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 1048Wj2I088073; Mon, 4 Jan 2021 03:50:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=nyKf2bl5uGOVZiBGFJPeSR/NNjbqCaEOoDtTzHHJ6KI=;
 b=TZVcY9mmtDskZM/wVTE4c8x0Ht/se4XH7f/tz1uywChf2f4tJDqu9oF1+T2kWBS6Nyxi
 hLtwmQWC25XgfrIQ51YAAp4ldge5PFY0SOYtDj/nO0WOmHY/5Q35cdw9EF0KdCVMu2eu
 F+empap1qQk/QmsCTePvhl6TWIVCf/GGSpJ8gAbd/LZRPb8HS0tizdFQalqXJRoAcjmS
 CxNVglA656Dj++ozdVnDLb5WP4eDjwUga9qpUo5W2+bKMIAh3efmw0C4mWyhJN/dBBYX
 mSkPtMhXnjgUffomvN/k2ChJP2x1NYnIL5j7fbax3JNGQuRjiVmsCKyFZJ2OW3u4Gf5b Qg== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 35uuwpmrrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 03:50:13 -0500
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 1048ll4C015815;
 Mon, 4 Jan 2021 08:50:10 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06ams.nl.ibm.com with ESMTP id 35tg3h9phn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 04 Jan 2021 08:50:10 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1048o8Ql45089236
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 4 Jan 2021 08:50:08 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 724DFA405C;
 Mon,  4 Jan 2021 08:50:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2AF23A4062;
 Mon,  4 Jan 2021 08:50:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.75.217])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon,  4 Jan 2021 08:50:08 +0000 (GMT)
Subject: Re: [PATCH v2 -next] misc: ocxl: use DEFINE_MUTEX() for mutex lock
To: Zheng Yongjun <zhengyongjun3@huawei.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20201224132446.31286-1-zhengyongjun3@huawei.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
Message-ID: <a27edb92-25e6-0047-96a3-911d06d001fa@linux.ibm.com>
Date: Mon, 4 Jan 2021 09:50:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201224132446.31286-1-zhengyongjun3@huawei.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-04_04:2020-12-31,
 2021-01-04 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101040057
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
Cc: gregkh@linuxfoundation.org, ajd@linux.ibm.com, arnd@arndb.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 24/12/2020 14:24, Zheng Yongjun wrote:
> mutex lock can be initialized automatically with DEFINE_MUTEX()
> rather than explicitly calling mutex_init().
> 
> Signed-off-by: Zheng Yongjun <zhengyongjun3@huawei.com>
> ---


Thanks!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>



>   drivers/misc/ocxl/file.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/misc/ocxl/file.c b/drivers/misc/ocxl/file.c
> index 4d1b44de1492..e70525eedaae 100644
> --- a/drivers/misc/ocxl/file.c
> +++ b/drivers/misc/ocxl/file.c
> @@ -15,7 +15,7 @@
>   
>   static dev_t ocxl_dev;
>   static struct class *ocxl_class;
> -static struct mutex minors_idr_lock;
> +static DEFINE_MUTEX(minors_idr_lock);
>   static struct idr minors_idr;
>   
>   static struct ocxl_file_info *find_and_get_file_info(dev_t devno)
> @@ -588,7 +588,6 @@ int ocxl_file_init(void)
>   {
>   	int rc;
>   
> -	mutex_init(&minors_idr_lock);
>   	idr_init(&minors_idr);
>   
>   	rc = alloc_chrdev_region(&ocxl_dev, 0, OCXL_NUM_MINORS, "ocxl");
> 
