Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB74AEB85
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 08:54:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JtsbB0trtz3cDC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Feb 2022 18:54:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mZcpI31d;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=mZcpI31d; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JtsZP0n97z2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Feb 2022 18:53:32 +1100 (AEDT)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2197jPQr007649; 
 Wed, 9 Feb 2022 07:53:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=gGJAphJHlwzxY7Z9AbwzKd7Y5S6WyeA46y70XlsxQnA=;
 b=mZcpI31dNPyXf+Iw9oHQ1UwK0PRM9CZ6S4mYBO8FjW2MMo1V+93wX2H7kZosesZP+C+I
 sLo8O3jBJJRh1HONjTsbhB3WjgBQbZwHcaMrs4axo+F9UBayOgfK+fYxq729k7Oblgf7
 coqeKt+lbWreD5qZKdPHi59e58yqunAN7710HnsMvb8rlTrrMbf+D4TJQFjbcV4TI56i
 RIKupljQhbiB3VPK2wwf4CkH10/6KLkvuNGip9xLsPE3QrWKduJXxBEEk97uJZVlO7lR
 YriUhoE9u5bSeXxl9nKjzxSotJa+nUJvVYBTzZsLctUxAkN6sEE1IzmC5nMeqKNlcuho +g== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3e3ny95nrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 07:53:24 +0000
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2197rBBE022153;
 Wed, 9 Feb 2022 07:53:22 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma05fra.de.ibm.com with ESMTP id 3e1gvab0nf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 09 Feb 2022 07:53:21 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2197rJW327525598
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 9 Feb 2022 07:53:19 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8C4C0AE055;
 Wed,  9 Feb 2022 07:53:19 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36AE4AE04D;
 Wed,  9 Feb 2022 07:53:19 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed,  9 Feb 2022 07:53:19 +0000 (GMT)
Received: from [9.43.161.242] (unknown [9.43.161.242])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 64D9260217;
 Wed,  9 Feb 2022 18:53:11 +1100 (AEDT)
Message-ID: <7ca33d8a-713a-c107-d96a-37046bb8cc6f@linux.ibm.com>
Date: Wed, 9 Feb 2022 18:53:02 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ocxl: Make use of the helper macro LIST_HEAD()
Content-Language: en-US
To: Cai Huoqing <cai.huoqing@linux.dev>
References: <20220209032421.37725-1-cai.huoqing@linux.dev>
From: Andrew Donnellan <ajd@linux.ibm.com>
In-Reply-To: <20220209032421.37725-1-cai.huoqing@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 6-w4zvHvTkvo2R55D9NMPYu1Q-VWKMLI
X-Proofpoint-ORIG-GUID: 6-w4zvHvTkvo2R55D9NMPYu1Q-VWKMLI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-09_04,2022-02-07_02,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 mlxlogscore=884 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 impostorscore=0 clxscore=1011 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202090049
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
Cc: Frederic Barrat <fbarrat@linux.ibm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 9/2/22 14:24, Cai Huoqing wrote:
> Replace "struct list_head head = LIST_HEAD_INIT(head)" with
> "LIST_HEAD(head)" to simplify the code.
> 
> Signed-off-by: Cai Huoqing <cai.huoqing@linux.dev>

LGTM

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>

-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
