Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C43223DB5A
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Aug 2020 17:28:41 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BMspG70VLzDqp5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Aug 2020 01:28:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BMsbc1lFZzDqs3
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 01:19:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FxL1B/Yb; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 4BMsbZ0vQgz8sWN
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Aug 2020 01:19:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 4BMsbX6YZcz9sSG; Fri,  7 Aug 2020 01:19:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=FxL1B/Yb; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 4BMsbX2F0Cz9sR4
 for <linuxppc-dev@ozlabs.org>; Fri,  7 Aug 2020 01:19:20 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 076F5jwP188723
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Aug 2020 11:19:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=2TUIgYKpSJ9yPG5eKTpOGiH5bDMchSXEy1Eqi0lHhao=;
 b=FxL1B/YbXv1Rv/Pr9A+ARY4okDK78nKROlgmIKpyJhDPeaKs6OyH5muIXdbrHJ22i2T8
 JSNYbFjlMz39q7vvpQTNRQwF5+sKmhW9s3dJF3v5leLzUQi8oGLA7mPQDePfqnXVSJ9Q
 cX4gt06+YGYK3u7Yn+3a9JFKwm8iugzELxhxNu2vCTSzP67LBwmFpzFvOS0I+yNMQDi7
 GjwbZQ50PSn5QiGvAw9X5NdFotYjUAUaidrGJdlTltPS7Pmvtx8hXRMalcyXslYXR/VP
 Fl6O8svkVNcw6frxflAnGi1nUcRIWqsPIHJWRSGq8RPi0Ttxtj3gcafCTD2nMWcSlSlI 9A== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 32ra0rsxne-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Aug 2020 11:19:18 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 076F9ix3014057
 for <linuxppc-dev@ozlabs.org>; Thu, 6 Aug 2020 15:19:17 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma03wdc.us.ibm.com with ESMTP id 32n019jegh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Thu, 06 Aug 2020 15:19:17 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 076FJHBN41353624
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 6 Aug 2020 15:19:17 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E67E3B2064;
 Thu,  6 Aug 2020 15:19:16 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA920B2067;
 Thu,  6 Aug 2020 15:19:16 +0000 (GMT)
Received: from localhost (unknown [9.65.243.213])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu,  6 Aug 2020 15:19:16 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Scott Cheloha <cheloha@linux.ibm.com>, linuxppc-dev@ozlabs.org
Subject: Re: [PATCH v2 1/2] powerpc/perf: consolidate GPCI hcall structs into
 asm/hvcall.h
In-Reply-To: <20200727184605.2945095-1-cheloha@linux.ibm.com>
References: <20200727184605.2945095-1-cheloha@linux.ibm.com>
Date: Thu, 06 Aug 2020 10:19:16 -0500
Message-ID: <87sgczztsb.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-06_12:2020-08-06,
 2020-08-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 mlxlogscore=999 lowpriorityscore=0 suspectscore=1 bulkscore=0
 clxscore=1015 spamscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008060108
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
Cc: Tyrel Datwylder <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Scott Cheloha <cheloha@linux.ibm.com> writes:

> The H_GetPerformanceCounterInfo (GPCI) hypercall input/output structs are
> useful to modules outside of perf/, so move them into asm/hvcall.h to live
> alongside the other powerpc hypercall structs.
>
> Leave the perf-specific GPCI stuff in perf/hv-gpci.h.
>
> Signed-off-by: Scott Cheloha <cheloha@linux.ibm.com>

Acked-by: Nathan Lynch <nathanl@linux.ibm.com>
