Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4AB3DF35A
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 18:55:23 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfLbF20NQz3cM5
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 02:55:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gVtLEmE7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gVtLEmE7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfLZj49gSz301q
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 02:54:53 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173GXi96056904; Tue, 3 Aug 2021 12:54:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=fXnWJHvn1o1ua8XNwo9QTLIS65vV3L5LhMAgWQBcIkU=;
 b=gVtLEmE78wMO4j24PYF7ipfGSEva5ygbxCUV5iT8LVZf0zXB8BS6MJzsNNfE6iWvIRGw
 oBqms6tAEJMnZUh6SvLwtgZCT22zyehfMKkhKNLe68L6Cq9l4icAxcWJs8e1yunsAKZR
 T09+4rh1EcNFQPF/IreDtwf/9hnxhH/9iWNRjPSCMjRkLT/37rFyStROpdadb8Enq3Jz
 CCGbva51FAA0bl1ZkyVi5toKvdnmudo5R7GZkIobLD8I5ACdwwvE9yigd9zFEmoR31TD
 OgAWTECHrTYeVTW42J0By/rLV08kJM66eGmYi0KipeWjrrYgN4xrq9BpehOstnmFQ0fQ 3A== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a733j655c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 12:54:43 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173Gqgfm025618;
 Tue, 3 Aug 2021 16:54:42 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma04dal.us.ibm.com with ESMTP id 3a4x5d2qrh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 16:54:42 +0000
Received: from b03ledav003.gho.boulder.ibm.com
 (b03ledav003.gho.boulder.ibm.com [9.17.130.234])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173Gsfft43581936
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 16:54:41 GMT
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA30C6A05F;
 Tue,  3 Aug 2021 16:54:40 +0000 (GMT)
Received: from b03ledav003.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CC1A76A04D;
 Tue,  3 Aug 2021 16:54:40 +0000 (GMT)
Received: from localhost (unknown [9.211.83.167])
 by b03ledav003.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 16:54:40 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH v5] pseries: prevent free CPU ids to be reused on
 another node
In-Reply-To: <20210429174908.16613-1-ldufour@linux.ibm.com>
References: <20210429174908.16613-1-ldufour@linux.ibm.com>
Date: Tue, 03 Aug 2021 11:54:40 -0500
Message-ID: <87v94mii3z.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 0-Tub6NlkC0RPb4sJ-Cox4dKZFgIq0VP
X-Proofpoint-GUID: 0-Tub6NlkC0RPb4sJ-Cox4dKZFgIq0VP
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_04:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0
 mlxlogscore=963 suspectscore=0 lowpriorityscore=0 mlxscore=0
 impostorscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108030105
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

Laurent Dufour <ldufour@linux.ibm.com> writes:
> V5:
>  - Rework code structure
>  - Reintroduce the capability to reuse other node's ids.

OK. While I preferred v4, where we would fail an add rather than allow
CPU IDs to appear to "travel" between nodes, this change is a net
improvement.

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
