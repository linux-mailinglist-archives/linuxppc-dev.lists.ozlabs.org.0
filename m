Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E573C3F7C
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Oct 2019 20:10:46 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46jS4L10FNzDqVK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Oct 2019 04:10:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46jS2c35xLzDqQf
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 04:09:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46jS2b6X7tz8t9t
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Oct 2019 04:09:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46jS2b5vrvz9sN1; Wed,  2 Oct 2019 04:09:11 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=linux.vnet.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=nayna@linux.vnet.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org; dmarc=none (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46jS2Z60d6z9sDB;
 Wed,  2 Oct 2019 04:09:09 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x91I7NcM062724; Tue, 1 Oct 2019 14:09:03 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc8ycxsqf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 14:09:02 -0400
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.27/8.16.0.27) with SMTP id x91I7Qd0062990;
 Tue, 1 Oct 2019 14:09:02 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vc8ycxsnc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 14:09:02 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x91I4Vna001343;
 Tue, 1 Oct 2019 18:08:58 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma03dal.us.ibm.com with ESMTP id 2v9y584twp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 01 Oct 2019 18:08:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x91I8ux752035904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 1 Oct 2019 18:08:56 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B24FEBE051;
 Tue,  1 Oct 2019 18:08:56 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BF25BE04F;
 Tue,  1 Oct 2019 18:08:54 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.80.224.222])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  1 Oct 2019 18:08:54 +0000 (GMT)
Subject: Re: [PATCH] sysfs: add BIN_ATTR_WO() macro
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <1566825818-9731-1-git-send-email-nayna@linux.ibm.com>
 <1566825818-9731-3-git-send-email-nayna@linux.ibm.com>
 <20190826140131.GA15270@kroah.com>
 <ff9674e1-1b27-783a-38f3-4fd725353186@linux.vnet.ibm.com>
 <20190826150153.GD18418@kroah.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <7546990b-8060-9451-129a-19aaa856d2e1@linux.vnet.ibm.com>
Date: Tue, 1 Oct 2019 14:08:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190826150153.GD18418@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-01_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=974 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910010147
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
Cc: linux-efi@vger.kernel.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Eric Ricther <erichte@linux.ibm.com>, Nayna Jain <nayna@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Mimi Zohar <zohar@linux.ibm.com>,
 Claudio Carvalho <cclaudio@linux.ibm.com>,
 Matthew Garret <matthew.garret@nebula.com>, linuxppc-dev@ozlabs.org,
 Paul Mackerras <paulus@samba.org>, Jeremy Kerr <jk@ozlabs.org>,
 Elaine Palmer <erpalmer@us.ibm.com>, Oliver O'Halloran <oohall@gmail.com>,
 linux-integrity@vger.kernel.org, George Wilson <gcwilson@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Greg,


On 08/26/2019 11:01 AM, Greg Kroah-Hartman wrote:
> This variant was missing from sysfs.h, I guess no one noticed it before.
>
> Turns out the powerpc secure variable code can use it, so add it to the
> tree for it, and potentially others to take advantage of, instead of
> open-coding it.
>
> Reported-by: Nayna Jain <nayna@linux.ibm.com>
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>
> I'll queue this up to my tree for 5.4-rc1, but if you want to take this
> in your tree earlier, feel free to do so.
>
>   include/linux/sysfs.h | 9 +++++++++
>   1 file changed, 9 insertions(+)
>
> diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
> index 965236795750..5420817ed317 100644
> --- a/include/linux/sysfs.h
> +++ b/include/linux/sysfs.h
> @@ -196,6 +196,12 @@ struct bin_attribute {
>   	.size	= _size,						\
>   }
>   
> +#define __BIN_ATTR_WO(_name) {						\
> +	.attr	= { .name = __stringify(_name), .mode = 0200 },		\
> +	.store	= _name##_store,					\
> +	.size	= _size,						\
> +}
> +
>   #define __BIN_ATTR_RW(_name, _size)					\
>   	__BIN_ATTR(_name, 0644, _name##_read, _name##_write, _size)
>   
> @@ -208,6 +214,9 @@ struct bin_attribute bin_attr_##_name = __BIN_ATTR(_name, _mode, _read,	\
>   #define BIN_ATTR_RO(_name, _size)					\
>   struct bin_attribute bin_attr_##_name = __BIN_ATTR_RO(_name, _size)
>   
> +#define BIN_ATTR_WO(_name, _size)					\
> +struct bin_attribute bin_attr_##_name = __BIN_ATTR_WO(_name, _size)
> +
>   #define BIN_ATTR_RW(_name, _size)					\
>   struct bin_attribute bin_attr_##_name = __BIN_ATTR_RW(_name, _size)
>   

I am sorry. I didn't notice it via inspection but there is a bug in this 
macro. When I actually try using it, compilation fails. Here's a likely 
patch:

diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index 5420817ed317..fa7ee503fb76 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -196,9 +196,9 @@ struct bin_attribute {
         .size   = _size,                                                \
  }
  
-#define __BIN_ATTR_WO(_name) {                                         \
+#define __BIN_ATTR_WO(_name, _size) {                                  \
         .attr   = { .name = __stringify(_name), .mode = 0200 },         \
-       .store  = _name##_store,                                        \
+       .write  = _name##_write,                                        \
         .size   = _size,                                                \
  }


Thanks & Regards,
     - Nayna

