Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4546F41A74F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 07:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HJTFk17Y7z2yQL
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Sep 2021 15:53:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=TOOXwqC0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=TOOXwqC0; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HJTF05pDfz2xXP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 28 Sep 2021 15:52:52 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18S2MjX9036435; 
 Tue, 28 Sep 2021 01:52:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=kHULtq2vCMS9C99h1wo9Sj7LNJHpQWEoPhR9H48N/ok=;
 b=TOOXwqC0nCYmRxuVcHw5WtCEjy0er/V96K69puaC5glUNV0KhLprbnZ3T+h0EwkF3jqy
 HNN7vt09FxccRnXX0lzKavj+gopNBoY6nNhZSuUOnJLGEtPQxMWrqTQiFQ90ZTcTQTBM
 XHX8QqziyJBt+MbXMre/b+nw77DR6cxR6t7WSW/+Gtbd4dk38szXtumLkuDnJIw1gX8F
 ARd96+WYn/4/3sxl3Bf4pZSAE+BwtXJi8v7PTfoI/0z8y0eFvBGsp1nw1xI13GaFVcjr
 /Q38xHNo9bcXElFQRPvA+vFI8EN3SfXE0zW6rTcAwzyzaDGLsey4K1ttOzqMpDBQ5wDR yg== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3bagrge8y5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 01:52:46 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 18S5Rr5s011914;
 Tue, 28 Sep 2021 05:52:44 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3b9ud9t53n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 28 Sep 2021 05:52:44 +0000
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
 [9.149.105.60])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 18S5qfYi45941232
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 28 Sep 2021 05:52:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A5E642049;
 Tue, 28 Sep 2021 05:52:41 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2944B4204D;
 Tue, 28 Sep 2021 05:52:41 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 28 Sep 2021 05:52:41 +0000 (GMT)
Received: from [9.81.209.82] (unknown [9.81.209.82])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 3FFB06035F;
 Tue, 28 Sep 2021 15:52:39 +1000 (AEST)
Subject: Re: [PATCH v2 8/9] ocxl: Use pci core's DVSEC functionality
To: Ben Widawsky <ben.widawsky@intel.com>, linux-cxl@vger.kernel.org
References: <20210923172647.72738-1-ben.widawsky@intel.com>
 <20210923172647.72738-9-ben.widawsky@intel.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <70917485-8f6b-d602-45d6-dc1e873db050@linux.ibm.com>
Date: Tue, 28 Sep 2021 15:52:38 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210923172647.72738-9-ben.widawsky@intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LoGoudR3s7_zyFsgpCAcskiJYmAWByyl
X-Proofpoint-ORIG-GUID: LoGoudR3s7_zyFsgpCAcskiJYmAWByyl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-09-28_03,2021-09-24_02,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 impostorscore=0 suspectscore=0 spamscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2109280033
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
Cc: David Woodhouse <dwmw2@infradead.org>, iommu@lists.linux-foundation.org,
 Bjorn Helgaas <helgaas@kernel.org>,
 "David E. Box" <david.e.box@linux.intel.com>, linux-pci@vger.kernel.org,
 Frederic Barrat <fbarrat@linux.ibm.com>, Lu Baolu <baolu.lu@linux.intel.com>,
 linuxppc-dev@lists.ozlabs.org, Kan Liang <kan.liang@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 24/9/21 3:26 am, Ben Widawsky wrote:
> Reduce maintenance burden of DVSEC query implementation by using the
> centralized PCI core implementation.
> 
> There are two obvious places to simply drop in the new core
> implementation. There remains find_dvsec_from_pos() which would benefit
> from using a core implementation. As that change is less trivial it is
> reserved for later.
> 
> Cc: linuxppc-dev@lists.ozlabs.org
> Cc: Andrew Donnellan <ajd@linux.ibm.com>
> Acked-by: Frederic Barrat <fbarrat@linux.ibm.com> (v1)
> Signed-off-by: Ben Widawsky <ben.widawsky@intel.com>

Looks fine, but we should clean up find_dvsec_from_pos() afterwards.

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
