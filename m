Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 694543627EE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 20:47:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FMQDx2YHMz3c6H
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Apr 2021 04:47:29 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=F4GM6m2l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=F4GM6m2l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FMQDV4lS5z2xZn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Apr 2021 04:47:06 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13GIWcfJ060292; Fri, 16 Apr 2021 14:46:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=xCA7nZY3Oxc9YHCfTsbKNHm63QLhRgdRs9Sq2eLex3g=;
 b=F4GM6m2lYbtUrhjIBo5dWglcilu2INVgj2nxXYTWb1PdP+zJXmDaymZ8oru1oyON2oMQ
 If6Thiy5LV0L7lWotfmPt5ctMwJwnj7/e7nT1xTq2rHhQdfxG+2Bm97lENKnjI/0C8Oy
 9Ttj8OYMRRKawYXQtFMNW2GpY4qB82laE5Gzk9lHo35Br4uqnF8b0R8r0KUv9ktiftNY
 Rsco9g8NCF/Id7AM1FXNxxk9V6FjRqm60YuZwKMK98Gp0+R5flgcjI/w1hBrWelGeiqQ
 NYb9LfHWk+xv7SyXeUr25W6NHILfxMn3BPLim1VboUEystIG2NVqljRb914BlTJT4Iud 1A== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37y7wv7kw6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 14:46:54 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13GIXiim020719;
 Fri, 16 Apr 2021 18:46:53 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02dal.us.ibm.com with ESMTP id 37u3narfhy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 16 Apr 2021 18:46:53 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13GIkqwU23462266
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 16 Apr 2021 18:46:52 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4D8C7B2067;
 Fri, 16 Apr 2021 18:46:52 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 96DCFB2064;
 Fri, 16 Apr 2021 18:46:51 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.122.125])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri, 16 Apr 2021 18:46:51 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Add shutdown() to vio_driver and vio_bus
To: mpe@ellerman.id.au
References: <20210402001325.939668-1-tyreld@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <f326def4-0db0-f924-1700-dd7be3154153@linux.ibm.com>
Date: Fri, 16 Apr 2021 11:46:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210402001325.939668-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: _U6q_4lfulD3kRoiWB3DiRXAoMhGzQcj
X-Proofpoint-ORIG-GUID: _U6q_4lfulD3kRoiWB3DiRXAoMhGzQcj
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-16_09:2021-04-16,
 2021-04-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 bulkscore=0 suspectscore=0
 spamscore=0 mlxlogscore=947 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2104060000 definitions=main-2104160131
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/1/21 5:13 PM, Tyrel Datwyler wrote:
> Currently, neither the vio_bus or vio_driver structures provide support
> for a shutdown() routine.
> 
> Add support for shutdown() by allowing drivers to provide a
> implementation via function pointer in their vio_driver struct and
> provide a proper implementation in the driver template for the vio_bus
> that calls a vio drivers shutdown() if defined.
> 
> In the case that no shutdown() is defined by a vio driver and a kexec is
> in progress we implement a big hammer that calls remove() to ensure no
> further DMA for the devices is possible.
> 
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>
> ---

Ping... any comments, problems with this approach?

-Tyrel
