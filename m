Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AFC1F4AE24F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Feb 2022 20:34:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtY9r2Y1Nz3cDy
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 06:34:40 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sZR/mhw1;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=tyreld@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=sZR/mhw1; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtY970WWfz2xDY
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 06:34:02 +1100 (AEDT)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 218GwVOf016682
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 8 Feb 2022 19:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=D0+zPirGzmj2MKXZ83ZkqFOuSdKOMrX1azDf7qztEYo=;
 b=sZR/mhw1A/7tUtCdmmXLBApJyRUkrGP+bUpQNqOf/9Sa3zW/FaVqfMb0LTESUtn2/TrE
 bMoG+DRxE8nyzD9XkY9Gk9LI9K4HrKig9cXRAuk9UtT2ItW2xSrrplM1K2Zjx97UCYk5
 siqZBIw19hhOICSdEudYpUf5yAn2COJg+zuLZ8C6q6ahaDzI1OE9huKDxXHRTQIb5kvF
 qn5n07CJCJBc++9qDoFG907hVd0KqXt7GvzTVxzwg5EB3664FNXve88qfVkk6sAsFNym
 k02b8MWd9qZJSHJAWJfukXI+SCtE27GSIw+4gkerfHib/aa4xUVh1HCQeMb0ITcA/zXB MA== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3e1u0xm0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Feb 2022 19:34:00 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 218JHvOR013472
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 8 Feb 2022 19:33:58 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3e2f8nd2ku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 08 Feb 2022 19:33:58 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 218JXv0v18940186
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Feb 2022 19:33:57 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 58D23BE04F;
 Tue,  8 Feb 2022 19:33:57 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B86B1BE05A;
 Tue,  8 Feb 2022 19:33:56 +0000 (GMT)
Received: from oc6857751186.ibm.com (unknown [9.160.68.97])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  8 Feb 2022 19:33:56 +0000 (GMT)
Subject: Re: [PATCH] powerpc/pseries: make pseries_devicetree_update() static
To: Nathan Lynch <nathanl@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <20220207221247.354454-1-nathanl@linux.ibm.com>
From: Tyrel Datwyler <tyreld@linux.ibm.com>
Message-ID: <337c3819-1b8b-2d20-ce78-3e067b203056@linux.ibm.com>
Date: Tue, 8 Feb 2022 11:33:55 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220207221247.354454-1-nathanl@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: y1jk7DnVi68DaPcSs7Yj-J-E5obl7vkZ
X-Proofpoint-ORIG-GUID: y1jk7DnVi68DaPcSs7Yj-J-E5obl7vkZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-08_06,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 bulkscore=0 priorityscore=1501 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202080115
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

On 2/7/22 2:12 PM, Nathan Lynch wrote:
> pseries_devicetree_update() has only one call site, in the same file in
> which it is defined. Make it static.
> 
> Signed-off-by: Nathan Lynch <nathanl@linux.ibm.com>
> ---

Reviewed-by: Tyrel Datwyler <tyreld@linux.ibm.com>
