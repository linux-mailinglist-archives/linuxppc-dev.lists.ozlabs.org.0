Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B7E6E2B8F56
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 10:49:15 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CcFJ84gxfzDqhb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Nov 2020 20:49:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=linux.vnet.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ljp@linux.vnet.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=linux.vnet.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=svva2tcW; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CcFGS6kdMzDqd9;
 Thu, 19 Nov 2020 20:47:44 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AJ9Xcsw008682; Thu, 19 Nov 2020 04:47:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=mime-version : date :
 from : to : cc : subject : in-reply-to : references : message-id :
 content-type : content-transfer-encoding; s=pp1;
 bh=JWi0o7wjR7IXvPcRiwdaPZWvWLPYhFBuTh81cC753cA=;
 b=svva2tcWTw7f/wjNshMBPSINJ8gUyWdsOsc4oPugfTUFQnbZjyJigiTEG78GQKix8Gh+
 0itTTGEcyCdYpDx4gzsh3lRKYEXo+PwI4ZU2o/5XDdNjrTWt4QlaTREI7TOwHlTjUdbk
 4h5LWNOGFi3Bhcv5C8I1a99AIlGm7cL1Xuzz58kxdj0VUqrvOrfVlhGfEAGfc8HIwabc
 6xQ6o1Gyb4J6V2Xht2AEgL3p3iSIyX+jW0163lI4afdN1ytEQWPenHKQEP1bwDg5LzC9
 4FiF7Xvz2tlmG0rmaPXpX1N7ugzRK3nZBNLYAikh6BJXIbf0oq5pn5D3Qtx1wzpB/9LB Vg== 
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34wg12sk55-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 04:47:41 -0500
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AJ9SAej002793;
 Thu, 19 Nov 2020 09:47:40 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma01wdc.us.ibm.com with ESMTP id 34uyn1m0qq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Nov 2020 09:47:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0AJ9lX2L40370602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Nov 2020 09:47:33 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 23727BE056;
 Thu, 19 Nov 2020 09:47:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8BF8BE04F;
 Thu, 19 Nov 2020 09:47:38 +0000 (GMT)
Received: from ltc.linux.ibm.com (unknown [9.16.170.189])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 19 Nov 2020 09:47:38 +0000 (GMT)
MIME-Version: 1.0
Date: Thu, 19 Nov 2020 03:47:38 -0600
From: ljp <ljp@linux.vnet.ibm.com>
To: Thomas Falcon <tlfalcon@linux.ibm.com>
Subject: Re: [PATCH net-next v2 8/9] ibmvnic: Use netdev_alloc_skb instead of
 alloc_skb to replenish RX buffers
In-Reply-To: <1605748345-32062-9-git-send-email-tlfalcon@linux.ibm.com>
References: <1605748345-32062-1-git-send-email-tlfalcon@linux.ibm.com>
 <1605748345-32062-9-git-send-email-tlfalcon@linux.ibm.com>
Message-ID: <b62e21fcbc4ca1bf08ddf37573940139@linux.vnet.ibm.com>
X-Sender: ljp@linux.vnet.ibm.com
User-Agent: Roundcube Webmail/1.0.1
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-19_05:2020-11-17,
 2020-11-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=830
 impostorscore=0 spamscore=0 mlxscore=0 lowpriorityscore=0 malwarescore=0
 bulkscore=0 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011190069
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
Cc: cforno12@linux.ibm.com, netdev@vger.kernel.org, ricklind@linux.ibm.com,
 dnbanerg@us.ibm.com,
 Linuxppc-dev <linuxppc-dev-bounces+ljp=linux.ibm.com@lists.ozlabs.org>,
 drt@linux.vnet.ibm.com, brking@linux.vnet.ibm.com, kuba@kernel.org,
 sukadev@linux.vnet.ibm.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2020-11-18 19:12, Thomas Falcon wrote:
> From: "Dwip N. Banerjee" <dnbanerg@us.ibm.com>
> 
> Take advantage of the additional optimizations in netdev_alloc_skb when
> allocating socket buffers to be used for packet reception.
> 
> Signed-off-by: Dwip N. Banerjee <dnbanerg@us.ibm.com>

Acked-by: Lijun Pan <ljp@linux.ibm.com>
