Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C723FFA76
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 08:37:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4H17PZ6grDz2yny
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Sep 2021 16:37:06 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=kPlhwc3y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=kPlhwc3y; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4H17Nm6lM3z2xff
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Sep 2021 16:36:24 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1836XPw2015876; Fri, 3 Sep 2021 02:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=sQgJSKuQWdql5yUeGo4NG5rfkCpRTiD04/Jn/+dADsI=;
 b=kPlhwc3ynJ63A5rAc4CwsQ7U8n0gEK5tVcRG2AGSz3VxqjhQZ/YGHmg2A4juxPWiBVUr
 o6zqGyr4kwc+21Il9g2u9g9lSjKyoNl2bmrktcT/1epTXCuOEJK+moj0hBs/PBLgXLUM
 WBBgSbqhkY/0OmDNaca3YBzOkKTrgoQs7P6pamE/HsqtDgp2MppCSVTszEqTTmHbzGP7
 Ls5dYxiD48n8kjfUf3WlmOFgpD0e4GUHYhxG2zUrf61wbEIzLgF8hlY135rH4beKmOJr
 DmGKx22heXScMOBBg+u3V2obwEe13wggq3X45ZaxGZZZsAVfC3BUy4r7QXCchsP/cOL6 SQ== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3aueg503jx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 02:36:21 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1836SsMG003312;
 Fri, 3 Sep 2021 06:36:20 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma03ams.nl.ibm.com with ESMTP id 3au6pkkpqk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Sep 2021 06:36:20 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1836aHMN55640478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Sep 2021 06:36:17 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9A937A4081;
 Fri,  3 Sep 2021 06:36:17 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 436ADA406A;
 Fri,  3 Sep 2021 06:36:17 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  3 Sep 2021 06:36:17 +0000 (GMT)
Received: from [9.206.212.242] (unknown [9.206.212.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C01E4602C4;
 Fri,  3 Sep 2021 16:36:15 +1000 (AEST)
Subject: Re: [PATCH] powerpc: Remove unused prototype for of_show_percpuinfo
To: Daniel Axtens <dja@axtens.net>, linuxppc-dev@lists.ozlabs.org
References: <20210903063246.70691-1-dja@axtens.net>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <e4c0947b-edf7-05f4-193f-126ed6b46f65@linux.ibm.com>
Date: Fri, 3 Sep 2021 16:36:14 +1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210903063246.70691-1-dja@axtens.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: qvnKEU1wxXIF18qG27Us1nW0UeMx1ck8
X-Proofpoint-ORIG-GUID: qvnKEU1wxXIF18qG27Us1nW0UeMx1ck8
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-09-03_02:2021-09-03,
 2021-09-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 mlxscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 malwarescore=0 phishscore=0 mlxlogscore=962 suspectscore=0 impostorscore=0
 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2108310000 definitions=main-2109030038
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

On 3/9/21 4:32 pm, Daniel Axtens wrote:
> commit 6d7f58b04d82 ("[PATCH] powerpc: Some minor cleanups to setup_32.c")
> removed of_show_percpuinfo but didn't remove the prototype.
> 
> Remove it.
> 
> Fixes: 6d7f58b04d82 ("[PATCH] powerpc: Some minor cleanups to setup_32.c")
> Signed-off-by: Daniel Axtens <dja@axtens.net>

I grepped through, confirmed there's no other references to 
of_show_percpuinfo().

Reviewed-by: Andrew Donnellan <ajd@linux.ibm.com>

(First linuxppc patch written and sent live on a twitch stream?)

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
