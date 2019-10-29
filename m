Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75BA4E862B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 11:56:53 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 472T6n74PpzF32N
	for <lists+linuxppc-dev@lfdr.de>; Tue, 29 Oct 2019 21:56:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=freude@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 472NSr1B8PzF1Sf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 18:27:00 +1100 (AEDT)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9T7FUr1141644
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 03:26:55 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vxcdqqny1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 29 Oct 2019 03:26:55 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <freude@linux.ibm.com>;
 Tue, 29 Oct 2019 07:26:51 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 29 Oct 2019 07:26:49 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9T7QlAw64487570
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 29 Oct 2019 07:26:47 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C62C42047;
 Tue, 29 Oct 2019 07:26:47 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5D584203F;
 Tue, 29 Oct 2019 07:26:46 +0000 (GMT)
Received: from funtu.home (unknown [9.145.48.204])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 29 Oct 2019 07:26:46 +0000 (GMT)
Subject: Re: [PATCH 6/6] s390x: Mark archrandom.h functions __must_check
To: Richard Henderson <richard.henderson@linaro.org>,
 linux-arch@vger.kernel.org
References: <20191028210559.8289-1-rth@twiddle.net>
 <20191028210559.8289-7-rth@twiddle.net>
From: Harald Freudenberger <freude@linux.ibm.com>
Date: Tue, 29 Oct 2019 08:26:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191028210559.8289-7-rth@twiddle.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19102907-0028-0000-0000-000003B0A540
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102907-0029-0000-0000-00002472E4AE
Message-Id: <935cf73a-d06c-365d-131a-23dcb350ba17@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-29_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1011 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910290075
X-Mailman-Approved-At: Tue, 29 Oct 2019 21:54:37 +1100
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>,
 x86@kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 28.10.19 22:05, Richard Henderson wrote:
> We cannot use the pointer output without validating the
> success of the random read.
>
> Signed-off-by: Richard Henderson <rth@twiddle.net>
> ---
> Cc: Heiko Carstens <heiko.carstens@de.ibm.com>
> Cc: Vasily Gorbik <gor@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> ---
>  arch/s390/include/asm/archrandom.h | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/s390/include/asm/archrandom.h b/arch/s390/include/asm/archrandom.h
> index c67b82dfa558..f3f1ee0a8c38 100644
> --- a/arch/s390/include/asm/archrandom.h
> +++ b/arch/s390/include/asm/archrandom.h
> @@ -33,17 +33,17 @@ static inline bool arch_has_random_seed(void)
>  	return false;
>  }
>
> -static inline bool arch_get_random_long(unsigned long *v)
> +static inline bool __must_check arch_get_random_long(unsigned long *v)
>  {
>  	return false;
>  }
>
> -static inline bool arch_get_random_int(unsigned int *v)
> +static inline bool __must_check arch_get_random_int(unsigned int *v)
>  {
>  	return false;
>  }
>
> -static inline bool arch_get_random_seed_long(unsigned long *v)
> +static inline bool __must_check arch_get_random_seed_long(unsigned long *v)
>  {
>  	if (static_branch_likely(&s390_arch_random_available)) {
>  		return s390_arch_random_generate((u8 *)v, sizeof(*v));
> @@ -51,7 +51,7 @@ static inline bool arch_get_random_seed_long(unsigned long *v)
>  	return false;
>  }
>
> -static inline bool arch_get_random_seed_int(unsigned int *v)
> +static inline bool __must_check arch_get_random_seed_int(unsigned int *v)
>  {
>  	if (static_branch_likely(&s390_arch_random_available)) {
>  		return s390_arch_random_generate((u8 *)v, sizeof(*v));
Fine with me, Thanks, reviewed, build and tested.
You may add my reviewed-by: Harald Freudenberger <freude@linux.ibm.com>
However, will this go into the kernel tree via crypto or s390 subsystem ?

