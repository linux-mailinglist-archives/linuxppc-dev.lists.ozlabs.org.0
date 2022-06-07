Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE5F53F90A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 11:06:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LHPbs4WxQz3btT
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jun 2022 19:06:17 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWNy+uYh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=GWNy+uYh;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LHPb638qJz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jun 2022 19:05:37 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2578DSs3026664;
	Tue, 7 Jun 2022 09:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=wIF17mc88TQDikBWbO5rcF1fzzeQJu0QKNUSoKAazAg=;
 b=GWNy+uYhBNqEAfS3OhoGZZcWezgFNBXaGolxBwjyiDWEKHLatI7Zf5JOFyZk7NkGMRSz
 QTd8rhNQ3wwVOH1LE0WXE1cL1Cw+uOsATZYiFGjM7YW5dhyy/VrgY7FetyRYeIqzvctT
 zYWZHUFSyNItujAp5rpQl476N+Gq/pF8msYhtsRVRyLMDzXcoi6Rfi7+xB4LtRiQ8FSI
 01gv2Rvua6lWlu+qN8KAaUPcdS75QAWE3sy7gbv7dxRI70jO8iEdnjaenTnrGprf1XeS
 N1nYS3oXoWJqEpE+J+G5xs7/PFtJkUyqTReDxgEOmIbbYSm4PCf8XEiU5CrGQInTKDdn nw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gj2yms1q6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 09:05:27 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 2578H5BP007254;
	Tue, 7 Jun 2022 09:05:26 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3gj2yms1pf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 09:05:26 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2578pjmB012598;
	Tue, 7 Jun 2022 09:05:24 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3gfxnj2qxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jun 2022 09:05:24 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com [9.149.105.61])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 257958XR21758334
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 7 Jun 2022 09:05:08 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 67BEE11C04A;
	Tue,  7 Jun 2022 09:05:22 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EB05311C04C;
	Tue,  7 Jun 2022 09:05:21 +0000 (GMT)
Received: from [9.171.53.11] (unknown [9.171.53.11])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue,  7 Jun 2022 09:05:21 +0000 (GMT)
Message-ID: <96560c72-3c24-f4fd-4212-3daa26c0f96f@linux.ibm.com>
Date: Tue, 7 Jun 2022 11:05:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] cxl: Fix refcount leak in cxl_calc_capp_routing
Content-Language: en-US
To: Miaoqian Lin <linmq006@gmail.com>, Andrew Donnellan <ajd@linux.ibm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Christophe Lombard <clombard@linux.vnet.ibm.com>,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20220605060038.62217-1-linmq006@gmail.com>
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20220605060038.62217-1-linmq006@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: -TzHRbacfZORohthD5M3Eik4ozt_Wj-0
X-Proofpoint-ORIG-GUID: ybabcjRcUJTIDj3fzWbz9mQkkuuf99zO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-07_03,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206070037
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
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 05/06/2022 08:00, Miaoqian Lin wrote:
> of_get_next_parent() returns a node pointer with refcount incremented,
> we should use of_node_put() on it when not need anymore.
> This function only calls of_node_put() in normal path,
> missing it in the error path.
> Add missing of_node_put() to avoid refcount leak.
> 
> Fixes: f24be42aab37 ("cxl: Add psl9 specific code")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>


Indeed. Thanks!
Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


> ---
>   drivers/misc/cxl/pci.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/cxl/pci.c b/drivers/misc/cxl/pci.c
> index 3de0aea62ade..62385a529d86 100644
> --- a/drivers/misc/cxl/pci.c
> +++ b/drivers/misc/cxl/pci.c
> @@ -387,6 +387,7 @@ int cxl_calc_capp_routing(struct pci_dev *dev, u64 *chipid,
>   	rc = get_phb_index(np, phb_index);
>   	if (rc) {
>   		pr_err("cxl: invalid phb index\n");
> +		of_node_put(np);
>   		return rc;
>   	}
>   
