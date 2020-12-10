Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 79A3C2D5FBA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Dec 2020 16:31:57 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CsHvt3mQCzDr3Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Dec 2020 02:31:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=ajd@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=jxWlbRXp; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CsDGh6xYfzDqjN
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Dec 2020 23:47:56 +1100 (AEDT)
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0BACWnFE144834; Thu, 10 Dec 2020 07:47:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=YBczKy8t1PSc0xrxwIaZ2Mtomm6wWxLCXRKU48zsWk0=;
 b=jxWlbRXpdnok5xK0+UTcfRzzhatc2vQAYgF79r+/8DlsDBitTlT4C+QSnavDGoUuWMkv
 azjaZm+15GSzn5A1hQ3YJ61k6B9JUuTQd0/ppUiHfHBcNioWFqNdcDQE8G6UZOgUD9Wj
 4yW7CXfgIJYxQ8148MBa8uJ9OVEH9zXhThUldjjyr1EH7CMKWF1KK72NyCF3n91ERQV1
 PtCWH2t/D/+0S5cwHRbRTFKrJUu3ffXVyVlkRWDCNfLbmzyqXsTZeZwRVEM7Im3rQ9yZ
 y2vawyCN9fBVA4bRw++luG86CI8+d6gXjhcra/zfYwU+YbEMmbisD0CpYZnriCErTw/P nw== 
Received: from ppma05fra.de.ibm.com (6c.4a.5195.ip4.static.sl-reverse.com
 [149.81.74.108])
 by mx0b-001b2d01.pphosted.com with ESMTP id 35bksbge2v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 07:47:47 -0500
Received: from pps.filterd (ppma05fra.de.ibm.com [127.0.0.1])
 by ppma05fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0BACVuqo021329;
 Thu, 10 Dec 2020 12:47:45 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma05fra.de.ibm.com with ESMTP id 35958q237j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Dec 2020 12:47:45 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0BAClhkA34013510
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Dec 2020 12:47:43 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 480FD4204D;
 Thu, 10 Dec 2020 12:47:43 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F2FB54204B;
 Thu, 10 Dec 2020 12:47:42 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 10 Dec 2020 12:47:42 +0000 (GMT)
Received: from [9.206.213.130] (unknown [9.206.213.130])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by ozlabs.au.ibm.com (Postfix) with ESMTPSA id C3C32609A5;
 Thu, 10 Dec 2020 23:47:41 +1100 (AEDT)
Subject: Re: [PATCH] powerpc/rtas: fix typo of ibm,open-errinjct in rtas filter
To: Tyrel Datwyler <tyreld@linux.ibm.com>, mpe@ellerman.id.au
References: <20201208195434.8289-1-tyreld@linux.ibm.com>
From: Andrew Donnellan <ajd@linux.ibm.com>
Message-ID: <ac5c551e-69f2-0c13-06a4-bb46bcc529d0@linux.ibm.com>
Date: Thu, 10 Dec 2020 23:47:41 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <20201208195434.8289-1-tyreld@linux.ibm.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2020-12-10_05:2020-12-09,
 2020-12-10 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0
 mlxlogscore=999 bulkscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 malwarescore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2012100080
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

On 9/12/20 6:54 am, Tyrel Datwyler wrote:
> Commit bd59380c5ba4 ("powerpc/rtas: Restrict RTAS requests from userspace")
> introduced the following error when invoking the errinjct userspace
> tool.
> 
> [root@ltcalpine2-lp5 librtas]# errinjct open
> [327884.071171] sys_rtas: RTAS call blocked - exploit attempt?
> [327884.071186] sys_rtas: token=0x26, nargs=0 (called by errinjct)
> errinjct: Could not open RTAS error injection facility
> errinjct: librtas: open: Unexpected I/O error
> 
> The entry for ibm,open-errinjct in rtas_filter array has a typo where
> the "j" is omitted in the rtas call name. After fixing this typo the
> errinjct tool functions again as expected.
> 
> [root@ltcalpine2-lp5 linux]# errinjct open
> RTAS error injection facility open, token = 1
> 
> fixes: bd59380c5ba4 ("powerpc/rtas: Restrict RTAS requests from userspace")
> Signed-off-by: Tyrel Datwyler <tyreld@linux.ibm.com>

Thanks for catching this!

Acked-by: Andrew Donnellan <ajd@linux.ibm.com>


-- 
Andrew Donnellan              OzLabs, ADL Canberra
ajd@linux.ibm.com             IBM Australia Limited
