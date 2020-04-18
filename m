Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6798E1AE914
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 03:06:51 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 493vtc3tNSzDrgp
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Apr 2020 11:06:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 493vrh6WsfzDrgY
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Apr 2020 11:05:04 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 03I14a3Z164850
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:05:01 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30fq0hgp8q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:05:00 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 03I150mO165956
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Apr 2020 21:05:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30fq0hgp8d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 17 Apr 2020 21:05:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 03I14jcv010826;
 Sat, 18 Apr 2020 01:04:59 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma03dal.us.ibm.com with ESMTP id 30b5h7uyta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 18 Apr 2020 01:04:59 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 03I14vwg60162502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 18 Apr 2020 01:04:58 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD56DC6059;
 Sat, 18 Apr 2020 01:04:57 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 44C81C6055;
 Sat, 18 Apr 2020 01:04:57 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.94.53])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Sat, 18 Apr 2020 01:04:56 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: Make vio and ibmebus initcalls pseries
 specific
To: "Oliver O'Halloran" <oohall@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200417040749.25800-1-oohall@gmail.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <c6f91b45-bf42-95f8-bc87-378829fcc934@linux.ibm.com>
Date: Fri, 17 Apr 2020 18:04:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200417040749.25800-1-oohall@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-04-17_11:2020-04-17,
 2020-04-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 mlxlogscore=961
 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2003020000
 definitions=main-2004180002
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 4/16/20 9:07 PM, Oliver O'Halloran wrote:
> The vio and ibmebus buses are used for pseries specific paravirtualised
> devices and currently they're initialised by the generic initcall types.
> This is mostly fine, but it can result in some nuisance errors in dmesg
> when booting on PowerNV on some OSes, e.g.
> 
> [    2.984439] synth uevent: /devices/vio: failed to send uevent
> [    2.984442] vio vio: uevent: failed to send synthetic uevent
> [   17.968551] synth uevent: /devices/vio: failed to send uevent
> [   17.968554] vio vio: uevent: failed to send synthetic uevent
> 
> We don't see anything similar for the ibmebus because that depends on
> !CONFIG_LITTLE_ENDIAN.
> 
> This patch squashes those by switching to using machine_*_initcall() so the bus
> type is only registered when the kernel is running on a pseries machine.
> 
> Signed-off-by: Oliver O'Halloran <oohall@gmail.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
