Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E224A35E6CF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Apr 2021 21:04:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKZm94gxsz30Jb
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 05:04:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=L4O7BYu8;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=L4O7BYu8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKZlk1YJJz30BR
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 05:04:17 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13DJ3eOZ161635; Tue, 13 Apr 2021 15:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=Vf/cF5FC1kOSwf8zl1ouMavV5ViZPqPX/Q6h46xeuaM=;
 b=L4O7BYu8IkzWo8eVPRSlCDfB9qei00iT+RWDPKhMR+fGwaW4Ll7wUbZY0toPbotgU/0p
 ghqbl1UAnHzotFx9ABFnepqt0znj/boGKk/y2su7o9Nub20Qm1SrHpQVpkCzvaTrXvJE
 E1U2TpybykBXEvnPA9UM3qrfGfKQhTSmJTFQMrZ7wRdc//WqZlLS77NXrhmaJVxPBJsR
 i1IezfgjLxPXhyR9IVQ57K1JcFV6Kkg5by4sTHOC2YE1JkB4Q8qbF4O54DBVAB0JC3ZP
 NWYMJccrJwM9j7zZZ1P+Y+UXsAbW0cInNQR8A8LOSAoijSa0i79ArgaIR+fW4FfNugUA zA== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37vtnthn9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 15:04:07 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13DIr3lL021020;
 Tue, 13 Apr 2021 19:04:07 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03dal.us.ibm.com with ESMTP id 37u3n99vp2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 13 Apr 2021 19:04:07 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13DJ46Fr24772952
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Apr 2021 19:04:06 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6BFBF2805A;
 Tue, 13 Apr 2021 19:04:06 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6AE828059;
 Tue, 13 Apr 2021 19:04:05 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.117.75])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue, 13 Apr 2021 19:04:05 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: extract host bridge from pci_bus prior
 to bus removal
To: mpe@ellerman.id.au
References: <20210211182435.47968-1-tyreld@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <e36a28a8-12ff-5816-bf90-87fab97933ad@linux.ibm.com>
Date: Tue, 13 Apr 2021 12:04:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210211182435.47968-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: gZm65Vb7GLTfZqO-Y6sqmUdJae8CUD0Q
X-Proofpoint-ORIG-GUID: gZm65Vb7GLTfZqO-Y6sqmUdJae8CUD0Q
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-13_12:2021-04-13,
 2021-04-13 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0
 mlxscore=0 impostorscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104130126
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

On 2/11/21 10:24 AM, Tyrel Datwyler wrote:
> The pci_bus->bridge reference may no longer be valid after
> pci_bus_remove() resulting in passing a bad value to device_unregister()
> for the associated bridge device.
> 
> Store the host_bridge reference in a separate variable prior to
> pci_bus_remove().
> 
> Fixes: 7340056567e3 ("powerpc/pci: Reorder pci bus/bridge unregistration during PHB removal")
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Ping?
