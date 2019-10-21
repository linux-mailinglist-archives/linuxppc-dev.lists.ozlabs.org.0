Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D1ECDE576
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 09:43:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46xTCT1FFHzDqb5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Oct 2019 18:43:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46xT9S6mNTzDqPT
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 18:41:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46xT9S3L1Mz8t1H
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Oct 2019 18:41:48 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 46xT9S2dlVz9sPc; Mon, 21 Oct 2019 18:41:48 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=hbathini@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 46xT9R21zhz9sPL
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Oct 2019 18:41:46 +1100 (AEDT)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9L7bjXK056441
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Oct 2019 03:41:44 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vs79njj50-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 21 Oct 2019 03:41:44 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Mon, 21 Oct 2019 08:41:42 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 21 Oct 2019 08:41:38 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9L7fbum9502946
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Oct 2019 07:41:37 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8502E4C040;
 Mon, 21 Oct 2019 07:41:37 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6E9C4C059;
 Mon, 21 Oct 2019 07:41:35 +0000 (GMT)
Received: from [9.85.68.191] (unknown [9.85.68.191])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Oct 2019 07:41:35 +0000 (GMT)
Subject: Re: [PATCH v2 3/4] Documentation/ABI: mark /sys/kernel/fadump_* sysfs
 files deprecated
To: Sourabh Jain <sourabhjain@linux.ibm.com>, mpe@ellerman.id.au
References: <20191018130557.2217-1-sourabhjain@linux.ibm.com>
 <20191018130557.2217-4-sourabhjain@linux.ibm.com>
From: Hari Bathini <hbathini@linux.ibm.com>
Date: Mon, 21 Oct 2019 13:11:34 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20191018130557.2217-4-sourabhjain@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19102107-0020-0000-0000-0000037BCA91
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19102107-0021-0000-0000-000021D1FF80
Message-Id: <f69daa7b-ddb3-8190-c409-28a22c504fed@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-21_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=975 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910210071
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
Cc: linuxppc-dev@ozlabs.org, mahesh@linux.vnet.ibm.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, corbet@lwn.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 18/10/19 6:35 PM, Sourabh Jain wrote:
> The /sys/kernel/fadump_* sysfs files are replicated under

[...]

> +Note: The following FADump sysfs files are deprecated.
> +
> +    Deprecated                       Alternative
> +    -------------------------------------------------------------------------------
> +    /sys/kernel/fadump_enabled           /sys/kernel/fadump/fadump_enabled
> +    /sys/kernel/fadump_registered        /sys/kernel/fadump/fadump_registered
> +    /sys/kernel/fadump_release_mem       /sys/kernel/fadump/fadump_release_mem

/sys/kernel/fadump/* looks tidy instead of /sys/kernel/fadump/fadump_* 
I mean, /sys/kernel/fadump/fadump_enabled => /sys/kernel/fadump/enabled and such..

- Hari

