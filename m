Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E663736D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 09:11:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NHrLK5ygQz3dvn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Nov 2022 19:11:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gnLLYpiA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=fbarrat@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gnLLYpiA;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NHrKN455Sz2xG6
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Nov 2022 19:10:48 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AO7AIqb029301;
	Thu, 24 Nov 2022 08:10:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Fv5lsnMOq0v3OokTjPOPQ0ZBZjYXp0WfCNzUXMB/Rfs=;
 b=gnLLYpiAA8ji7uKe740r0BEWOqU8N9OSBjEo3THKAU7xVBJtIh7lzbijpXJytXWTMiUS
 VTJ0S+3W+nf34T7I5KNlEPEfkdWOJnk4d0sTzHdCf6gwH7p6BzSvXUIRVF2oTTR6VQ+6
 ECwyDr5VBwQF452PqW1pAElyymbbDfysK6YPJCvh5tLnJYmha9IfYR2Q2qr1VmdnwQNI
 AWb5s6+Wkgy8AbVdDhzddhITASf0lxF+1fDW6o2m8qoYszJBwHExXWVrQf7vzRCJ71Ry
 0ot6w5u3EK/qVrtK3O9HtM//miBP7pvIfDGRx4i0mGrrVURdqf2XcAM1U3hOjJWdDfkO Sw== 
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com [159.122.73.72])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3m10fge0vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 08:10:32 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
	by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AO86FvH005754;
	Thu, 24 Nov 2022 08:10:30 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma06fra.de.ibm.com with ESMTP id 3kxpdj5nxw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Nov 2022 08:10:30 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AO84BD811666074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 24 Nov 2022 08:04:11 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F65C42041;
	Thu, 24 Nov 2022 08:10:27 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 3C9594203F;
	Thu, 24 Nov 2022 08:10:27 +0000 (GMT)
Received: from [9.179.3.101] (unknown [9.179.3.101])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 24 Nov 2022 08:10:27 +0000 (GMT)
Message-ID: <3f400b77-3f7e-1c01-c3e4-a2088fcd5358@linux.ibm.com>
Date: Thu, 24 Nov 2022 09:10:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2] ocxl: fix pci device refcount leak when calling
 get_function_0()
To: Yang Yingliang <yangyingliang@huawei.com>, ajd@linux.ibm.com,
        arnd@arndb.de, gregkh@linuxfoundation.org, mpe@ellerman.id.au
References: <20221121154339.4088935-1-yangyingliang@huawei.com>
Content-Language: en-US
From: Frederic Barrat <fbarrat@linux.ibm.com>
In-Reply-To: <20221121154339.4088935-1-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qX9ajOIl0pdU5pQx7ilsvVuYM6iior-0
X-Proofpoint-GUID: qX9ajOIl0pdU5pQx7ilsvVuYM6iior-0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-24_05,2022-11-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 priorityscore=1501 spamscore=0 clxscore=1011 lowpriorityscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 mlxscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211240063
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 21/11/2022 16:43, Yang Yingliang wrote:
> get_function_0() calls pci_get_domain_bus_and_slot(), as comment
> says, it returns a pci device with refcount increment, so after
> using it, pci_dev_put() needs be called.
> 
> Get the device reference when get_function_0() is not called, so
> pci_dev_put() can be called in the error path and callers
> unconditionally. And add comment above get_dvsec_vendor0() to tell
> callers to call pci_dev_put().
> 
> Fixes: 87db7579ebd5 ("ocxl: control via sysfs whether the FPGA is reloaded on a link reset")
> Suggested-by: Andrew Donnellan <ajd@linux.ibm.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---


Thanks for fixing it!

Acked-by: Frederic Barrat <fbarrat@linux.ibm.com>

   Fred


> v1 -> v2:
>    Add comment above get_dvsec_vendor0().
>    Get reference where dev is function 0, and call pci_dev_put()
>    unconditionally in callers.
> ---
>   drivers/misc/ocxl/config.c | 20 +++++++++++++++++++-
>   1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/ocxl/config.c b/drivers/misc/ocxl/config.c
> index e401a51596b9..92ab49705f64 100644
> --- a/drivers/misc/ocxl/config.c
> +++ b/drivers/misc/ocxl/config.c
> @@ -193,6 +193,18 @@ static int read_dvsec_vendor(struct pci_dev *dev)
>   	return 0;
>   }
>   
> +/**
> + * get_dvsec_vendor0() - Find a related PCI device (function 0)
> + * @dev: PCI device to match
> + * @dev0: The PCI device (function 0) found
> + * @out_pos: The position of PCI device (function 0)
> + *
> + * Returns 0 on success, negative on failure.
> + *
> + * NOTE: If it's successful, the reference of dev0 is increased,
> + * so after using it, the callers must call pci_dev_put() to give
> + * up the reference.
> + */
>   static int get_dvsec_vendor0(struct pci_dev *dev, struct pci_dev **dev0,
>   			     int *out_pos)
>   {
> @@ -202,10 +214,14 @@ static int get_dvsec_vendor0(struct pci_dev *dev, struct pci_dev **dev0,
>   		dev = get_function_0(dev);
>   		if (!dev)
>   			return -1;
> +	} else {
> +		dev = pci_dev_get(dev);
>   	}
>   	pos = find_dvsec(dev, OCXL_DVSEC_VENDOR_ID);
> -	if (!pos)
> +	if (!pos) {
> +		pci_dev_put(dev);
>   		return -1;
> +	}
>   	*dev0 = dev;
>   	*out_pos = pos;
>   	return 0;
> @@ -222,6 +238,7 @@ int ocxl_config_get_reset_reload(struct pci_dev *dev, int *val)
>   
>   	pci_read_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
>   			      &reset_reload);
> +	pci_dev_put(dev0);
>   	*val = !!(reset_reload & BIT(0));
>   	return 0;
>   }
> @@ -243,6 +260,7 @@ int ocxl_config_set_reset_reload(struct pci_dev *dev, int val)
>   		reset_reload &= ~BIT(0);
>   	pci_write_config_dword(dev0, pos + OCXL_DVSEC_VENDOR_RESET_RELOAD,
>   			       reset_reload);
> +	pci_dev_put(dev0);
>   	return 0;
>   }
>   
