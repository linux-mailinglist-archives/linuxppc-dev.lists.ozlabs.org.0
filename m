Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 528BA16B60B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 00:51:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RJkG3WvgzDqGJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Feb 2020 10:51:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RJWX3yrDzDqDV
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 10:42:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: by ozlabs.org (Postfix)
 id 48RJWX2BqNz9sQx; Tue, 25 Feb 2020 10:42:16 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=popple.id.au
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=alistair@popple.id.au; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48RJWW4HFcz9sRG
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Feb 2020 10:42:14 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01ONdAof145255
 for <linuxppc-dev@ozlabs.org>; Mon, 24 Feb 2020 18:42:13 -0500
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yaygpbm8d-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Mon, 24 Feb 2020 18:42:13 -0500
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <alistair@popple.id.au>;
 Mon, 24 Feb 2020 23:42:11 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 24 Feb 2020 23:42:08 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01ONg7rI60293124
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Feb 2020 23:42:07 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 24306A4051;
 Mon, 24 Feb 2020 23:42:07 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C4259A4040;
 Mon, 24 Feb 2020 23:42:06 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 24 Feb 2020 23:42:06 +0000 (GMT)
Received: from townsend.localnet (unknown [9.102.63.14])
 (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id F36A4A01C4;
 Tue, 25 Feb 2020 10:42:01 +1100 (AEDT)
From: Alistair Popple <alistair@popple.id.au>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH 4/8] powerpc: Mark 4xx as Orphan in MAINTAINERS
Date: Tue, 25 Feb 2020 10:42:05 +1100
In-Reply-To: <20200224233146.23734-4-mpe@ellerman.id.au>
References: <20200224233146.23734-1-mpe@ellerman.id.au>
 <20200224233146.23734-4-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-TM-AS-GCONF: 00
x-cbid: 20022423-0012-0000-0000-00000389EE01
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022423-0013-0000-0000-000021C68ED4
Message-Id: <1582588767.8Bspa7yJx7@townsend>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-24_12:2020-02-21,
 2020-02-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=2
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 phishscore=0 clxscore=1034 impostorscore=0 mlxlogscore=702
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002240177
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
Cc: linuxppc-dev@ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Acked-by: Alistair Popple <alistair@popple.id.au>

On Tuesday, 25 February 2020 10:31:42 AM AEDT Michael Ellerman wrote:
> The 4xx platforms are no longer maintained.
> 
> Cc: Alistair Popple <alistair@popple.id.au>
> Cc: Matt Porter <mporter@kernel.crashing.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  MAINTAINERS | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c4f37c41188..939da2ac08db 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -9645,11 +9645,8 @@ F:	arch/powerpc/platforms/512x/
>  F:	arch/powerpc/platforms/52xx/
> 
>  LINUX FOR POWERPC EMBEDDED PPC4XX
> -M:	Alistair Popple <alistair@popple.id.au>
> -M:	Matt Porter <mporter@kernel.crashing.org>
> -W:	http://www.penguinppc.org/
>  L:	linuxppc-dev@lists.ozlabs.org
> -S:	Maintained
> +S:	Orphan
>  F:	arch/powerpc/platforms/40x/
>  F:	arch/powerpc/platforms/44x/




