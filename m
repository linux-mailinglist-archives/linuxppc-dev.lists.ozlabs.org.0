Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 179F24BED90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 00:05:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K2dF72L5Yz3dfG
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Feb 2022 10:05:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=RlH3NvdX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ganeshgr@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=RlH3NvdX; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K2F8m5tfqz2xF0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 21 Feb 2022 19:00:24 +1100 (AEDT)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21L7INOd028179; 
 Mon, 21 Feb 2022 08:00:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=content-type :
 message-id : date : mime-version : subject : to : cc : references : from :
 in-reply-to; s=pp1; bh=14h8owOmeET2XDgoTJN9Q5RPpNNLmDV0vyg678Gvsz4=;
 b=RlH3NvdXNTGYL5ntQ8SjKscvjM1P+cclqxvhjHLsedDMQa25MSat8MReNqL7x+zpVpzq
 VpkBucvXrSNUiVfz2QR/HvN5s/6IJGeZjxBgZQp6IPCxrO/AgIvSLNUhVc6ol3C5G7XO
 EvLKLF6LEaEsCJ/aXueuCH0npR1pETfWouwnBy5FYfbwufslLEJtLvSWgk8WZdsItWMS
 DLcI+QinEDyAM1wIqpcp7noIKgq4rPWC0POZFt84wg/5NKxv+agAhMVy0wX//U2cDwBM
 evohgpkET6SaEubZ0y2SWSypmn7nPvVH4sdh+Wp/ofca/wg1la04EThDf+zOYiu2xlH8 lw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ec67wrpcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:00:17 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21L7MOFC010040;
 Mon, 21 Feb 2022 08:00:17 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ec67wrpbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:00:17 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21L7wmg1023821;
 Mon, 21 Feb 2022 08:00:14 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma01fra.de.ibm.com with ESMTP id 3ear68qtcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Feb 2022 08:00:14 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21L80CIg47907146
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Feb 2022 08:00:12 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 10641AE05D;
 Mon, 21 Feb 2022 08:00:12 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 33C86AE055;
 Mon, 21 Feb 2022 08:00:10 +0000 (GMT)
Received: from [9.43.125.156] (unknown [9.43.125.156])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Feb 2022 08:00:09 +0000 (GMT)
Content-Type: multipart/alternative;
 boundary="------------iTQSlpFmgfSF78KAYGiW05eM"
Message-ID: <6928a518-627c-c900-9480-f325f624ae84@linux.ibm.com>
Date: Mon, 21 Feb 2022 13:30:08 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 RESEND 1/3] powerpc/pseries: Parse control memory
 access error
Content-Language: en-US
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
References: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
From: Ganesh <ganeshgr@linux.ibm.com>
In-Reply-To: <20220107141428.67862-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QDD90yphCyj-vR6hf6DFn03x78hlK8OY
X-Proofpoint-ORIG-GUID: OrqYX1_QBC_yePePlpHp9r-BNUvkzHVz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-21_02,2022-02-18_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 bulkscore=0 impostorscore=0 mlxlogscore=982 mlxscore=0 lowpriorityscore=0
 clxscore=1011 suspectscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2201110000
 definitions=main-2202210047
X-Mailman-Approved-At: Tue, 22 Feb 2022 10:00:38 +1100
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
Cc: mahesh@linux.ibm.com, npiggin@gmail.com, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a multi-part message in MIME format.
--------------iTQSlpFmgfSF78KAYGiW05eM
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 1/7/22 19:44, Ganesh Goudar wrote:

> Add support to parse and log control memory access
> error for pseries. These changes are made according to
> PAPR v2.11 10.3.2.2.12.
>
> Signed-off-by: Ganesh Goudar<ganeshgr@linux.ibm.com>
> ---
>   arch/powerpc/platforms/pseries/ras.c | 36 ++++++++++++++++++++++++----
>   1 file changed, 32 insertions(+), 4 deletions(-)
>
>
>   		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;

Hi mpe, Any comments on this patch series?

--------------iTQSlpFmgfSF78KAYGiW05eM
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">
      <pre>On 1/7/22 19:44, Ganesh Goudar wrote:</pre>
    </div>
    <blockquote type="cite"
      cite="mid:20220107141428.67862-1-ganeshgr@linux.ibm.com">
      <pre class="moz-quote-pre" wrap="">Add support to parse and log control memory access
error for pseries. These changes are made according to
PAPR v2.11 10.3.2.2.12.

Signed-off-by: Ganesh Goudar <a class="moz-txt-link-rfc2396E" href="mailto:ganeshgr@linux.ibm.com">&lt;ganeshgr@linux.ibm.com&gt;</a>
---
 arch/powerpc/platforms/pseries/ras.c | 36 ++++++++++++++++++++++++----
 1 file changed, 32 insertions(+), 4 deletions(-)


 		mce_err.error_type = MCE_ERROR_TYPE_UNKNOWN;
</pre>
    </blockquote>
    <pre>Hi mpe, Any comments on this patch series?</pre>
  </body>
</html>

--------------iTQSlpFmgfSF78KAYGiW05eM--

