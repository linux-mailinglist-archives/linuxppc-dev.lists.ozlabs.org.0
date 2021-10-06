Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E00EE423FAD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Oct 2021 15:57:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HPbcQ6K9Lz2ypf
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Oct 2021 00:57:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Led9y1fp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=Led9y1fp; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HPbbZ3bCXz2yLq
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Oct 2021 00:56:41 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 196D7fbU024906; 
 Wed, 6 Oct 2021 09:56:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=rXNaV/0f7il7/eTa9er7Fi91jO8PQW/CTUv7iJ0o5Ss=;
 b=Led9y1fpcrm+mdDhe9Hl/YrF3wU4sCas3seQL+PTX4yQKKfgYhPQVZkt24CTGeBbLzcb
 JT3dA8G/5vifqma5YqK9Q1UovNu4XXFO2cY8ladcBZrI/MkEqUqAL8m2vh7yh3UbR4mY
 A6YspETUQWbFVQtQbBHDCrGSjwzB5zaFeF5SwUKQ4UABN8ek50ClqcyrL39b56l8WzxA
 JuJMnHLAfLheYnprBbYiRQRD6qV+tr9/0lzXM2Vug2lNoq0PpvsL15oMnsDmMeYPMpY5
 3XAz1o4QSyWpViu15t+h4SINGfZx6qGLc5C79ERDW3+TGI5pZqCyDxJQhXXVP2Grg6a5 Fw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bh38b4ntx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 09:56:22 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 196D9kXH030915;
 Wed, 6 Oct 2021 09:56:22 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bh38b4nsg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 09:56:22 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 196DqgaP020613;
 Wed, 6 Oct 2021 13:56:19 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3beepjx7sr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Oct 2021 13:56:19 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 196DuFTj46334436
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 6 Oct 2021 13:56:15 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0FCE3A4083;
 Wed,  6 Oct 2021 13:56:15 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A9A9AA4071;
 Wed,  6 Oct 2021 13:56:14 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  6 Oct 2021 13:56:14 +0000 (GMT)
Received: from [9.102.60.13] (unknown [9.102.60.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 811916036F;
 Thu,  7 Oct 2021 00:56:12 +1100 (AEDT)
Subject: Re: [PATCH] docs: typo fixes in Documentation/ABI/
To: Sohaib Mohamed <sohaib.amhmd@gmail.com>
References: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <03e16fd9-e60f-ff4d-71e5-1b687aab65a5@linux.ibm.com>
Date: Thu, 7 Oct 2021 00:56:05 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <20211006132104.105288-1-sohaib.amhmd@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PQat3iTg2_FDv0ZxUq3H_tI3XBe1uw2a
X-Proofpoint-GUID: 3RPZpzN-NBgRadkEr8k5Ui6c_R4pd5yk
Content-Transfer-Encoding: 7bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-06_03,2021-10-06_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 clxscore=1011
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110060085
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
Cc: Jens Axboe <axboe@kernel.dk>, Fabrice Gasnier <fabrice.gasnier@st.com>,
 linux-kernel@vger.kernel.org,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Jonathan Corbet <corbet@lwn.net>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daejun Park <daejun7.park@samsung.com>, Gioh Kim <gi-oh.kim@ionos.com>,
 Adrian Hunter <adrian.hunter@intel.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Can Guo <cang@codeaurora.org>, Avri Altman <avri.altman@wdc.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Frederic Barrat <fbarrat@linux.ibm.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>, Zhang Rui <rui.zhang@intel.com>,
 Jack Wang <jinpu.wang@cloud.ionos.com>, linuxppc-dev@lists.ozlabs.org,
 Carlos Bilbao <bilbao@vt.edu>, Bean Huo <beanhuo@micron.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 7/10/21 12:20 am, Sohaib Mohamed wrote:
> All these changes are about to remove repeated words from severals place in the Documentation/ABI/ directory:
> 
> - In file stable/sysfs-module:41: "the the source"
> 
> - In file testing/sysfs-bus-rapidio:98: "that that owns"
> 
> - In file testing/sysfs-class-cxl:106: "the the lowest"
> 
> - In file testing/sysfs-class-cxl:107: "this this kernel"
> 
> - In file testing/sysfs-class-rnbd-client:131: "as as the"
> 
> - In file testing/sysfs-class-rtrs-client:81: "the the name"
> 
> - In file testing/sysfs-class-rtrs-server:27: "the the name"
> 
> - In file testing/sysfs-devices-platform-ACPI-TAD:77: "the the status"
> 
> - In file testing/sysfs-devices-power:306: "the the children"
> 
> - In file testing/sysfs-driver-ufs:986: "the The amount"
> 
> - In file testing/sysfs-firmware-acpi:115: "send send a Notify"
> 
> Signed-off-by: Sohaib Mohamed <sohaib.amhmd@gmail.com>

Greg's already pointed out the line wrapping and that you may want to 
send this as multiple smaller patches.

For my particular part:

> diff --git a/Documentation/ABI/testing/sysfs-class-cxl b/Documentation/ABI/testing/sysfs-class-cxl
> index 3c77677e0ca7..594fda254130 100644
> --- a/Documentation/ABI/testing/sysfs-class-cxl
> +++ b/Documentation/ABI/testing/sysfs-class-cxl
> @@ -103,8 +103,8 @@ What:           /sys/class/cxl/<afu>/api_version_compatible
>   Date:           September 2014
>   Contact:        linuxppc-dev@lists.ozlabs.org
>   Description:    read only
> -                Decimal value of the the lowest version of the userspace API
> -                this this kernel supports.
> +                Decimal value of the lowest version of the userspace API
> +                this kernel supports.
>   Users:		https://github.com/ibm-capi/libcxl

Looks good.

Acked-by: Andrew Donnellan <ajd@linux.ibm.com> # cxl

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
