Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C62013DF3F8
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Aug 2021 19:34:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GfMRy5C73z3cTX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Aug 2021 03:34:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ptX4z8vZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=nathanl@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=ptX4z8vZ; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GfMRS10dfz304R
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Aug 2021 03:33:39 +1000 (AEST)
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 173HWpWe087813; Tue, 3 Aug 2021 13:33:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : in-reply-to : references : date : message-id : mime-version :
 content-type; s=pp1; bh=cCDpH0wxLgsG472IZpSQMxzENkGiSe8p50J19DEYlNc=;
 b=ptX4z8vZe4oAjAoCrqJg8A+lfmCLrrDWSwvqa/acZXZeKd06nYc4FlZlUy1h3NtjfXle
 xZT4su+HpMGXOuDyLsOEEgXofnY0a5PJG78+LgDZ2Yie404dAjX7hdnNJQzoRfVNnckg
 4zntITw6KXFcMEv3KWQTh2e9OQ3vTmnZn6EMVKJMz4Uox/8iHzpEOA1E/OVp6ImQzizL
 qPWLHDKbPz5toE4tcsJI7/CQQqIFzz7mFahu5N3wcG928ncl0q7X/RsaKcKtKo/I+R1s
 ezBfPCJ2IPxi6yb+RgYm51LfmfnykTJXipVcSKl3wvYABiEnwzLYxMq8nsrEAUnhW239 RA== 
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a76c3qna1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 13:33:30 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 173HXSAD022074;
 Tue, 3 Aug 2021 17:33:29 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma03wdc.us.ibm.com with ESMTP id 3a77h275pp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 03 Aug 2021 17:33:29 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 173HWJNb17170872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Aug 2021 17:32:19 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 746A9136059;
 Tue,  3 Aug 2021 17:32:19 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 415B8136066;
 Tue,  3 Aug 2021 17:32:19 +0000 (GMT)
Received: from localhost (unknown [9.211.83.167])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  3 Aug 2021 17:32:19 +0000 (GMT)
From: Nathan Lynch <nathanl@linux.ibm.com>
To: Laurent Dufour <ldufour@linux.ibm.com>, mpe@ellerman.id.au,
 benh@kernel.crashing.org, paulus@samba.org
Subject: Re: [PATCH v5] pseries/drmem: update LMBs after LPM
In-Reply-To: <20210517090606.56930-1-ldufour@linux.ibm.com>
References: <20210517090606.56930-1-ldufour@linux.ibm.com>
Date: Tue, 03 Aug 2021 12:32:18 -0500
Message-ID: <87sfzqigd9.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 32U_qgmhxpb1IM8Qvg1WXhA3HHFJCxtI
X-Proofpoint-GUID: 32U_qgmhxpb1IM8Qvg1WXhA3HHFJCxtI
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-03_05:2021-08-03,
 2021-08-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=989
 priorityscore=1501 adultscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2107140000 definitions=main-2108030114
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
Cc: "Aneesh
 Kumar K . V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Tyrel Datwyler <tyreld@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Laurent Dufour <ldufour@linux.ibm.com> writes:
> V5:
>  - Reword the commit's description to address Nathan's comments.

Thanks. Still don't like the global variable usage but:

Reviewed-by: Nathan Lynch <nathanl@linux.ibm.com>
