Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E1A486BB6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jan 2022 22:14:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JVJyH6G8Lz30Mb
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jan 2022 08:14:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=CutrWWLq;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=CutrWWLq; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JVJxV25vdz2xBV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jan 2022 08:13:49 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 206IVb3g017615; 
 Thu, 6 Jan 2022 21:13:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=KuEOMtUyfPPM9MezCJTSQ3xStJ2buUjqJB18gGW8+Z4=;
 b=CutrWWLqC0wenAD7aTQK9y5IWQ7WPi5gXR13bEihGS2oyiHRHz8X3ftIuNTW14GzkOxg
 SaQlGRfx8JQFPNwFUcBaN7OVnsNNGV+Gz+3/g58ByAXcGUgouo55ZAAKuL/TLxkqWRiq
 BwV2F5XBZBuQjj9b6BvcjDdx5RY5F+KyJD0V17jGW/v/4NtLLeNXHU8+550W/+5boEP6
 gZynsbX12AmTO1OlQ2bwBq+Avd2tBBaF11pnW+YX6h5t0pmip+y/YcP+gWZJqHGWKmxs
 DwJUthbbm0tl/J1WPdhypyBrWCDvB/v5RbBs4jnxKRdjLRw7CINSv7ePEmY6kTi8I06+ 7g== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3de5sfjmsd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 21:13:47 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 206L4jKK021871;
 Thu, 6 Jan 2022 21:13:46 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 3de5r9km6h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Jan 2022 21:13:46 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 206LDjDa28770704
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Jan 2022 21:13:45 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5FC116A054;
 Thu,  6 Jan 2022 21:13:45 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2586C6A04D;
 Thu,  6 Jan 2022 21:13:45 +0000 (GMT)
Received: from localhost (unknown [9.160.191.186])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  6 Jan 2022 21:13:44 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>
Subject: Re: [PATCH v5] powerpc/pseries: read the lpar name from the firmware
In-Reply-To: <20220106161339.74656-1-ldufour@linux.ibm.com>
References: <20220106161339.74656-1-ldufour@linux.ibm.com>
Date: Thu, 06 Jan 2022 15:13:44 -0600
Message-ID: <878rvsva7r.fsf@li-e15d104c-2135-11b2-a85c-d7ef17e56be6.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: MauGligxdyA9gUZfrr9DY5zagpl3FgWe
X-Proofpoint-GUID: MauGligxdyA9gUZfrr9DY5zagpl3FgWe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-06_09,2022-01-06_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 impostorscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201060133
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
Cc: tyreld@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> The LPAR name may be changed after the LPAR has been started in the HMC.
> In that case lparstat command is not reporting the updated value because it
> reads it from the device tree which is read at boot time.
>
> However this value could be read from RTAS.
>
> Adding this value in the /proc/powerpc/lparcfg output allows to read the
> updated value.
>
> However the hypervisor, like Qemu/KVM, may not support this RTAS
> parameter. In that case the value reported in lparcfg is read from the
> device tree and so is not updated accordingly.
>
> Cc: Nathan Lynch <nathanl@linux.ibm.com>
> Signed-off-by: Laurent Dufour <ldufour@linux.ibm.com>
> ---
> v5:
>  fallback to the device tree value if RTAS is not providing the value.
> v4:
>  address Nathan's new comments limiting size of the buffer.
> v3:
>  address Michael's comments.
> v2:
>  address Nathan's comments.
>  change title to partition_name aligning with existing partition_id

Thanks Laurent.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
