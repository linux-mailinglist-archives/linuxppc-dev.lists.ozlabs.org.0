Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AC90A22625F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jul 2020 16:43:21 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B9Pbp4yfjzDqjN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Jul 2020 00:43:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nayna@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none)
 header.from=linux.vnet.ibm.com
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B9PXn1Jt8zDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 21 Jul 2020 00:40:39 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 06KEYgtu139830; Mon, 20 Jul 2020 10:40:34 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pepkqt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 10:40:34 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06KEZ5HA141928;
 Mon, 20 Jul 2020 10:40:33 -0400
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32d5pepkq8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 10:40:33 -0400
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06KEdKgr018291;
 Mon, 20 Jul 2020 14:40:33 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma05wdc.us.ibm.com with ESMTP id 32brq89tsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 20 Jul 2020 14:40:33 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 06KEeURM39518718
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 20 Jul 2020 14:40:30 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CFDA078077;
 Mon, 20 Jul 2020 14:40:31 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E51DB78066;
 Mon, 20 Jul 2020 14:40:29 +0000 (GMT)
Received: from swastik.ibm.com (unknown [9.160.78.37])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 20 Jul 2020 14:40:29 +0000 (GMT)
Subject: Re: [PATCH v6] ima: move APPRAISE_BOOTPARAM dependency on ARCH_POLICY
 to runtime
To: Bruno Meneguele <bmeneg@redhat.com>, linux-kernel@vger.kernel.org,
 x86@kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-integrity@vger.kernel.org,
 zohar@linux.ibm.com
References: <20200713164830.101165-1-bmeneg@redhat.com>
From: Nayna <nayna@linux.vnet.ibm.com>
Message-ID: <d337cbba-e996-e898-1e75-9f142d480e5e@linux.vnet.ibm.com>
Date: Mon, 20 Jul 2020 10:40:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200713164830.101165-1-bmeneg@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-20_09:2020-07-20,
 2020-07-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 lowpriorityscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 impostorscore=0 spamscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007200101
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
Cc: erichte@linux.ibm.com, nayna@linux.ibm.com, stable@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 7/13/20 12:48 PM, Bruno Meneguele wrote:
> The IMA_APPRAISE_BOOTPARAM config allows enabling different "ima_appraise="
> modes - log, fix, enforce - at run time, but not when IMA architecture
> specific policies are enabled.  This prevents properly labeling the
> filesystem on systems where secure boot is supported, but not enabled on the
> platform.  Only when secure boot is actually enabled should these IMA
> appraise modes be disabled.
>
> This patch removes the compile time dependency and makes it a runtime
> decision, based on the secure boot state of that platform.
>
> Test results as follows:
>
> -> x86-64 with secure boot enabled
>
> [    0.015637] Kernel command line: <...> ima_policy=appraise_tcb ima_appraise=fix
> [    0.015668] ima: Secure boot enabled: ignoring ima_appraise=fix boot parameter option
>
> -> powerpc with secure boot disabled
>
> [    0.000000] Kernel command line: <...> ima_policy=appraise_tcb ima_appraise=fix
> [    0.000000] Secure boot mode disabled
>
> -> Running the system without secure boot and with both options set:
>
> CONFIG_IMA_APPRAISE_BOOTPARAM=y
> CONFIG_IMA_ARCH_POLICY=y
>
> Audit prompts "missing-hash" but still allow execution and, consequently,
> filesystem labeling:
>
> type=INTEGRITY_DATA msg=audit(07/09/2020 12:30:27.778:1691) : pid=4976
> uid=root auid=root ses=2
> subj=unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 op=appraise_data
> cause=missing-hash comm=bash name=/usr/bin/evmctl dev="dm-0" ino=493150
> res=no
>
> Cc: stable@vger.kernel.org
> Fixes: d958083a8f64 ("x86/ima: define arch_get_ima_policy() for x86")
> Signed-off-by: Bruno Meneguele <bmeneg@redhat.com>


Reviewed-by: Nayna Jain<nayna@linux.ibm.com>

Tested-by: Nayna Jain<nayna@linux.ibm.com>


Thanks & Regards,

         - Nayna

